package org.apache.cordova.engine;

import android.annotation.TargetApi;
import android.content.pm.PackageManager.NameNotFoundException;
import android.graphics.Bitmap;
import android.net.Uri;
import android.net.http.SslError;
import android.webkit.ClientCertRequest;
import android.webkit.HttpAuthHandler;
import android.webkit.SslErrorHandler;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import java.io.FileNotFoundException;
import java.util.Hashtable;
import org.apache.cordova.AuthenticationToken;
import org.apache.cordova.CordovaClientCertRequest;
import org.apache.cordova.CordovaHttpAuthHandler;
import org.apache.cordova.CordovaResourceApi;
import org.apache.cordova.CordovaResourceApi.OpenForReadResult;
import org.apache.cordova.LOG;
import org.apache.cordova.PluginManager;

public class SystemWebViewClient extends WebViewClient {
    private static final String TAG = "SystemWebViewClient";
    private Hashtable<String, AuthenticationToken> authenticationTokens = new Hashtable();
    private boolean doClearHistory = false;
    boolean isCurrentlyLoading;
    protected final SystemWebViewEngine parentEngine;

    public SystemWebViewClient(SystemWebViewEngine parentEngine) {
        this.parentEngine = parentEngine;
    }

    public boolean shouldOverrideUrlLoading(WebView view, String url) {
        return this.parentEngine.client.onNavigationAttempt(url);
    }

    public void onReceivedHttpAuthRequest(WebView view, HttpAuthHandler handler, String host, String realm) {
        AuthenticationToken token = getAuthenticationToken(host, realm);
        if (token != null) {
            handler.proceed(token.getUserName(), token.getPassword());
            return;
        }
        PluginManager pluginManager = this.parentEngine.pluginManager;
        if (pluginManager == null || !pluginManager.onReceivedHttpAuthRequest(null, new CordovaHttpAuthHandler(handler), host, realm)) {
            super.onReceivedHttpAuthRequest(view, handler, host, realm);
        } else {
            this.parentEngine.client.clearLoadTimeoutTimer();
        }
    }

    @TargetApi(21)
    public void onReceivedClientCertRequest(WebView view, ClientCertRequest request) {
        PluginManager pluginManager = this.parentEngine.pluginManager;
        if (pluginManager == null || !pluginManager.onReceivedClientCertRequest(null, new CordovaClientCertRequest(request))) {
            super.onReceivedClientCertRequest(view, request);
        } else {
            this.parentEngine.client.clearLoadTimeoutTimer();
        }
    }

    public void onPageStarted(WebView view, String url, Bitmap favicon) {
        super.onPageStarted(view, url, favicon);
        this.isCurrentlyLoading = true;
        this.parentEngine.bridge.reset();
        this.parentEngine.client.onPageStarted(url);
    }

    public void onPageFinished(WebView view, String url) {
        super.onPageFinished(view, url);
        if (this.isCurrentlyLoading || url.startsWith("about:")) {
            this.isCurrentlyLoading = false;
            if (this.doClearHistory) {
                view.clearHistory();
                this.doClearHistory = false;
            }
            this.parentEngine.client.onPageFinishedLoading(url);
        }
    }

    public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
        if (this.isCurrentlyLoading) {
            LOG.m2d(TAG, "CordovaWebViewClient.onReceivedError: Error code=%s Description=%s URL=%s", Integer.valueOf(errorCode), description, failingUrl);
            if (errorCode == -10) {
                this.parentEngine.client.clearLoadTimeoutTimer();
                if (view.canGoBack()) {
                    view.goBack();
                    return;
                }
                super.onReceivedError(view, errorCode, description, failingUrl);
            }
            this.parentEngine.client.onReceivedError(errorCode, description, failingUrl);
        }
    }

    public void onReceivedSslError(WebView view, SslErrorHandler handler, SslError error) {
        try {
            if ((this.parentEngine.cordova.getActivity().getPackageManager().getApplicationInfo(this.parentEngine.cordova.getActivity().getPackageName(), 128).flags & 2) != 0) {
                handler.proceed();
            } else {
                super.onReceivedSslError(view, handler, error);
            }
        } catch (NameNotFoundException e) {
            super.onReceivedSslError(view, handler, error);
        }
    }

    public void setAuthenticationToken(AuthenticationToken authenticationToken, String host, String realm) {
        if (host == null) {
            host = "";
        }
        if (realm == null) {
            realm = "";
        }
        this.authenticationTokens.put(host.concat(realm), authenticationToken);
    }

    public AuthenticationToken removeAuthenticationToken(String host, String realm) {
        return (AuthenticationToken) this.authenticationTokens.remove(host.concat(realm));
    }

    public AuthenticationToken getAuthenticationToken(String host, String realm) {
        AuthenticationToken token = (AuthenticationToken) this.authenticationTokens.get(host.concat(realm));
        if (token != null) {
            return token;
        }
        token = (AuthenticationToken) this.authenticationTokens.get(host);
        if (token == null) {
            token = (AuthenticationToken) this.authenticationTokens.get(realm);
        }
        if (token == null) {
            return (AuthenticationToken) this.authenticationTokens.get("");
        }
        return token;
    }

    public void clearAuthenticationTokens() {
        this.authenticationTokens.clear();
    }

    public WebResourceResponse shouldInterceptRequest(WebView view, String url) {
        try {
            if (this.parentEngine.pluginManager.shouldAllowRequest(url)) {
                CordovaResourceApi resourceApi = this.parentEngine.resourceApi;
                Uri origUri = Uri.parse(url);
                Uri remappedUri = resourceApi.remapUri(origUri);
                if (origUri.equals(remappedUri) && !needsSpecialsInAssetUrlFix(origUri) && !needsKitKatContentUrlFix(origUri)) {
                    return null;
                }
                OpenForReadResult result = resourceApi.openForRead(remappedUri, true);
                return new WebResourceResponse(result.mimeType, "UTF-8", result.inputStream);
            }
            LOG.m12w(TAG, "URL blocked by whitelist: " + url);
            return new WebResourceResponse("text/plain", "UTF-8", null);
        } catch (Throwable e) {
            if (!(e instanceof FileNotFoundException)) {
                LOG.m4e(TAG, "Error occurred while loading a file (returning a 404).", e);
            }
            return new WebResourceResponse("text/plain", "UTF-8", null);
        }
    }

    private static boolean needsKitKatContentUrlFix(Uri uri) {
        return "content".equals(uri.getScheme());
    }

    private static boolean needsSpecialsInAssetUrlFix(Uri uri) {
        if (CordovaResourceApi.getUriType(uri) != 1) {
            return false;
        }
        if (uri.getQuery() == null && uri.getFragment() == null) {
            return !uri.toString().contains("%") ? false : false;
        } else {
            return true;
        }
    }
}
