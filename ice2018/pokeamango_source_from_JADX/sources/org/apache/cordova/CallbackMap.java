package org.apache.cordova;

import android.util.Pair;
import android.util.SparseArray;

public class CallbackMap {
    private SparseArray<Pair<CordovaPlugin, Integer>> callbacks = new SparseArray();
    private int currentCallbackId = 0;

    public synchronized int registerCallback(CordovaPlugin receiver, int requestCode) {
        int mappedId;
        mappedId = this.currentCallbackId;
        this.currentCallbackId = mappedId + 1;
        this.callbacks.put(mappedId, new Pair(receiver, Integer.valueOf(requestCode)));
        return mappedId;
    }

    public synchronized Pair<CordovaPlugin, Integer> getAndRemoveCallback(int mappedId) {
        Pair<CordovaPlugin, Integer> callback;
        callback = (Pair) this.callbacks.get(mappedId);
        this.callbacks.remove(mappedId);
        return callback;
    }
}
