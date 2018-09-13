package org.apache.cordova;

import android.webkit.HttpAuthHandler;

public class CordovaHttpAuthHandler implements ICordovaHttpAuthHandler {
    private final HttpAuthHandler handler;

    public CordovaHttpAuthHandler(HttpAuthHandler handler) {
        this.handler = handler;
    }

    public void cancel() {
        this.handler.cancel();
    }

    public void proceed(String username, String password) {
        this.handler.proceed(username, password);
    }
}
