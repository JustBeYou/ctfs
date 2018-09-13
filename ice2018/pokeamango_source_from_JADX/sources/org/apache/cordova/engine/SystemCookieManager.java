package org.apache.cordova.engine;

import android.annotation.TargetApi;
import android.os.Build.VERSION;
import android.webkit.CookieManager;
import android.webkit.WebView;
import org.apache.cordova.ICordovaCookieManager;

class SystemCookieManager implements ICordovaCookieManager {
    private final CookieManager cookieManager = CookieManager.getInstance();
    protected final WebView webView;

    @TargetApi(21)
    public SystemCookieManager(WebView webview) {
        this.webView = webview;
        CookieManager cookieManager = this.cookieManager;
        CookieManager.setAcceptFileSchemeCookies(true);
        if (VERSION.SDK_INT >= 21) {
            this.cookieManager.setAcceptThirdPartyCookies(this.webView, true);
        }
    }

    public void setCookiesEnabled(boolean accept) {
        this.cookieManager.setAcceptCookie(accept);
    }

    public void setCookie(String url, String value) {
        this.cookieManager.setCookie(url, value);
    }

    public String getCookie(String url) {
        return this.cookieManager.getCookie(url);
    }

    public void clearCookies() {
        this.cookieManager.removeAllCookie();
    }

    public void flush() {
        if (VERSION.SDK_INT >= 21) {
            this.cookieManager.flush();
        }
    }
}
