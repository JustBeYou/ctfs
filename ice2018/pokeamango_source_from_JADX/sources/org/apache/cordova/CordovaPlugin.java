package org.apache.cordova;

import android.content.Intent;
import android.content.res.Configuration;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Bundle;
import java.io.FileNotFoundException;
import java.io.IOException;
import org.apache.cordova.CordovaResourceApi.OpenForReadResult;
import org.json.JSONArray;
import org.json.JSONException;

public class CordovaPlugin {
    static final /* synthetic */ boolean $assertionsDisabled = (!CordovaPlugin.class.desiredAssertionStatus());
    public CordovaInterface cordova;
    protected CordovaPreferences preferences;
    private String serviceName;
    public CordovaWebView webView;

    public final void privateInitialize(String serviceName, CordovaInterface cordova, CordovaWebView webView, CordovaPreferences preferences) {
        if ($assertionsDisabled || this.cordova == null) {
            this.serviceName = serviceName;
            this.cordova = cordova;
            this.webView = webView;
            this.preferences = preferences;
            initialize(cordova, webView);
            pluginInitialize();
            return;
        }
        throw new AssertionError();
    }

    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
    }

    protected void pluginInitialize() {
    }

    public String getServiceName() {
        return this.serviceName;
    }

    public boolean execute(String action, String rawArgs, CallbackContext callbackContext) throws JSONException {
        return execute(action, new JSONArray(rawArgs), callbackContext);
    }

    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        return execute(action, new CordovaArgs(args), callbackContext);
    }

    public boolean execute(String action, CordovaArgs args, CallbackContext callbackContext) throws JSONException {
        return false;
    }

    public void onPause(boolean multitasking) {
    }

    public void onResume(boolean multitasking) {
    }

    public void onStart() {
    }

    public void onStop() {
    }

    public void onNewIntent(Intent intent) {
    }

    public void onDestroy() {
    }

    public Bundle onSaveInstanceState() {
        return null;
    }

    public void onRestoreStateForActivityResult(Bundle state, CallbackContext callbackContext) {
    }

    public Object onMessage(String id, Object data) {
        return null;
    }

    public void onActivityResult(int requestCode, int resultCode, Intent intent) {
    }

    public Boolean shouldAllowRequest(String url) {
        return null;
    }

    public Boolean shouldAllowNavigation(String url) {
        return null;
    }

    public Boolean shouldAllowBridgeAccess(String url) {
        return shouldAllowNavigation(url);
    }

    public Boolean shouldOpenExternalUrl(String url) {
        return null;
    }

    public boolean onOverrideUrlLoading(String url) {
        return false;
    }

    public Uri remapUri(Uri uri) {
        return null;
    }

    public OpenForReadResult handleOpenForRead(Uri uri) throws IOException {
        throw new FileNotFoundException("Plugin can't handle uri: " + uri);
    }

    protected Uri toPluginUri(Uri origUri) {
        return new Builder().scheme(CordovaResourceApi.PLUGIN_URI_SCHEME).authority(this.serviceName).appendQueryParameter("origUri", origUri.toString()).build();
    }

    protected Uri fromPluginUri(Uri pluginUri) {
        return Uri.parse(pluginUri.getQueryParameter("origUri"));
    }

    public void onReset() {
    }

    public boolean onReceivedHttpAuthRequest(CordovaWebView view, ICordovaHttpAuthHandler handler, String host, String realm) {
        return false;
    }

    public boolean onReceivedClientCertRequest(CordovaWebView view, ICordovaClientCertRequest request) {
        return false;
    }

    public void onConfigurationChanged(Configuration newConfig) {
    }

    public void requestPermissions(int requestCode) {
    }

    public boolean hasPermisssion() {
        return true;
    }

    public void onRequestPermissionResult(int requestCode, String[] permissions, int[] grantResults) throws JSONException {
    }
}
