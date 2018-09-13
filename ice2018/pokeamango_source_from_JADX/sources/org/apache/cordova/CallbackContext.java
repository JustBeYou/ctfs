package org.apache.cordova;

import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONObject;

public class CallbackContext {
    private static final String LOG_TAG = "CordovaPlugin";
    private String callbackId;
    private int changingThreads;
    protected boolean finished;
    private CordovaWebView webView;

    public CallbackContext(String callbackId, CordovaWebView webView) {
        this.callbackId = callbackId;
        this.webView = webView;
    }

    public boolean isFinished() {
        return this.finished;
    }

    public boolean isChangingThreads() {
        return this.changingThreads > 0;
    }

    public String getCallbackId() {
        return this.callbackId;
    }

    public void sendPluginResult(PluginResult pluginResult) {
        synchronized (this) {
            if (this.finished) {
                LOG.m12w(LOG_TAG, "Attempted to send a second callback for ID: " + this.callbackId + "\nResult was: " + pluginResult.getMessage());
                return;
            }
            this.finished = !pluginResult.getKeepCallback();
            this.webView.sendPluginResult(pluginResult, this.callbackId);
        }
    }

    public void success(JSONObject message) {
        sendPluginResult(new PluginResult(Status.OK, message));
    }

    public void success(String message) {
        sendPluginResult(new PluginResult(Status.OK, message));
    }

    public void success(JSONArray message) {
        sendPluginResult(new PluginResult(Status.OK, message));
    }

    public void success(byte[] message) {
        sendPluginResult(new PluginResult(Status.OK, message));
    }

    public void success(int message) {
        sendPluginResult(new PluginResult(Status.OK, message));
    }

    public void success() {
        sendPluginResult(new PluginResult(Status.OK));
    }

    public void error(JSONObject message) {
        sendPluginResult(new PluginResult(Status.ERROR, message));
    }

    public void error(String message) {
        sendPluginResult(new PluginResult(Status.ERROR, message));
    }

    public void error(int message) {
        sendPluginResult(new PluginResult(Status.ERROR, message));
    }
}
