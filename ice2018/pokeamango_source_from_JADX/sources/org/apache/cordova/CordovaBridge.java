package org.apache.cordova;

import android.annotation.SuppressLint;
import java.security.SecureRandom;
import org.json.JSONArray;
import org.json.JSONException;

public class CordovaBridge {
    private static final String LOG_TAG = "CordovaBridge";
    private volatile int expectedBridgeSecret = -1;
    private NativeToJsMessageQueue jsMessageQueue;
    private PluginManager pluginManager;

    public CordovaBridge(PluginManager pluginManager, NativeToJsMessageQueue jsMessageQueue) {
        this.pluginManager = pluginManager;
        this.jsMessageQueue = jsMessageQueue;
    }

    public String jsExec(int bridgeSecret, String service, String action, String callbackId, String arguments) throws JSONException, IllegalAccessException {
        String popAndEncode;
        if (!verifySecret("exec()", bridgeSecret)) {
            return null;
        }
        if (arguments == null) {
            return "@Null arguments.";
        }
        this.jsMessageQueue.setPaused(true);
        try {
            CordovaResourceApi.jsThread = Thread.currentThread();
            this.pluginManager.exec(service, action, callbackId, arguments);
            popAndEncode = this.jsMessageQueue.popAndEncode(false);
            return popAndEncode;
        } catch (Throwable e) {
            e.printStackTrace();
            popAndEncode = "";
            return popAndEncode;
        } finally {
            this.jsMessageQueue.setPaused(false);
        }
    }

    public void jsSetNativeToJsBridgeMode(int bridgeSecret, int value) throws IllegalAccessException {
        if (verifySecret("setNativeToJsBridgeMode()", bridgeSecret)) {
            this.jsMessageQueue.setBridgeMode(value);
        }
    }

    public String jsRetrieveJsMessages(int bridgeSecret, boolean fromOnlineEvent) throws IllegalAccessException {
        if (verifySecret("retrieveJsMessages()", bridgeSecret)) {
            return this.jsMessageQueue.popAndEncode(fromOnlineEvent);
        }
        return null;
    }

    private boolean verifySecret(String action, int bridgeSecret) throws IllegalAccessException {
        if (!this.jsMessageQueue.isBridgeEnabled()) {
            if (bridgeSecret == -1) {
                LOG.m0d(LOG_TAG, action + " call made before bridge was enabled.");
            } else {
                LOG.m0d(LOG_TAG, "Ignoring " + action + " from previous page load.");
            }
            return false;
        } else if (this.expectedBridgeSecret >= 0 && bridgeSecret == this.expectedBridgeSecret) {
            return true;
        } else {
            LOG.m3e(LOG_TAG, "Bridge access attempt with wrong secret token, possibly from malicious code. Disabling exec() bridge!");
            clearBridgeSecret();
            throw new IllegalAccessException();
        }
    }

    void clearBridgeSecret() {
        this.expectedBridgeSecret = -1;
    }

    public boolean isSecretEstablished() {
        return this.expectedBridgeSecret != -1;
    }

    @SuppressLint({"TrulyRandom"})
    int generateBridgeSecret() {
        this.expectedBridgeSecret = new SecureRandom().nextInt(Integer.MAX_VALUE);
        return this.expectedBridgeSecret;
    }

    public void reset() {
        this.jsMessageQueue.reset();
        clearBridgeSecret();
    }

    public String promptOnJsPrompt(String origin, String message, String defaultValue) {
        String r;
        if (defaultValue != null && defaultValue.length() > 3 && defaultValue.startsWith("gap:")) {
            try {
                JSONArray array = new JSONArray(defaultValue.substring(4));
                r = jsExec(array.getInt(0), array.getString(1), array.getString(2), array.getString(3), message);
                return r == null ? "" : r;
            } catch (JSONException e) {
                e.printStackTrace();
                return "";
            } catch (IllegalAccessException e2) {
                e2.printStackTrace();
                return "";
            }
        } else if (defaultValue != null && defaultValue.startsWith("gap_bridge_mode:")) {
            try {
                jsSetNativeToJsBridgeMode(Integer.parseInt(defaultValue.substring(16)), Integer.parseInt(message));
            } catch (NumberFormatException e3) {
                e3.printStackTrace();
            } catch (IllegalAccessException e22) {
                e22.printStackTrace();
            }
            return "";
        } else if (defaultValue != null && defaultValue.startsWith("gap_poll:")) {
            try {
                r = jsRetrieveJsMessages(Integer.parseInt(defaultValue.substring(9)), "1".equals(message));
                if (r == null) {
                    return "";
                }
                return r;
            } catch (IllegalAccessException e222) {
                e222.printStackTrace();
                return "";
            }
        } else if (defaultValue == null || !defaultValue.startsWith("gap_init:")) {
            return null;
        } else {
            if (this.pluginManager.shouldAllowBridgeAccess(origin)) {
                this.jsMessageQueue.setBridgeMode(Integer.parseInt(defaultValue.substring(9)));
                return "" + generateBridgeSecret();
            }
            LOG.m3e(LOG_TAG, "gap_init called from restricted origin: " + origin);
            return "";
        }
    }
}
