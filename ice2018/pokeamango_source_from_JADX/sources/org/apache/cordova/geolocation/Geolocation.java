package org.apache.cordova.geolocation;

import android.util.Log;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.LOG;
import org.apache.cordova.PermissionHelper;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;

public class Geolocation extends CordovaPlugin {
    String TAG = "GeolocationPlugin";
    CallbackContext context;
    String[] permissions = new String[]{"android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_FINE_LOCATION"};

    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        Log.d(this.TAG, "We are entering execute");
        this.context = callbackContext;
        if (!action.equals("getPermission")) {
            return false;
        }
        if (hasPermisssion()) {
            this.context.sendPluginResult(new PluginResult(Status.OK));
            return true;
        }
        PermissionHelper.requestPermissions(this, 0, this.permissions);
        return true;
    }

    public void onRequestPermissionResult(int requestCode, String[] permissions, int[] grantResults) throws JSONException {
        if (this.context != null) {
            for (int r : grantResults) {
                if (r == -1) {
                    LOG.m0d(this.TAG, "Permission Denied!");
                    this.context.sendPluginResult(new PluginResult(Status.ILLEGAL_ACCESS_EXCEPTION));
                    return;
                }
            }
            this.context.sendPluginResult(new PluginResult(Status.OK));
        }
    }

    public boolean hasPermisssion() {
        for (String p : this.permissions) {
            if (!PermissionHelper.hasPermission(this, p)) {
                return false;
            }
        }
        return true;
    }

    public void requestPermissions(int requestCode) {
        PermissionHelper.requestPermissions(this, requestCode, this.permissions);
    }
}
