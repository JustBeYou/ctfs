package org.apache.cordova.device;

import android.os.Build;
import android.os.Build.VERSION;
import android.provider.Settings.Secure;
import java.util.TimeZone;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Device extends CordovaPlugin {
    private static final String AMAZON_DEVICE = "Amazon";
    private static final String AMAZON_PLATFORM = "amazon-fireos";
    private static final String ANDROID_PLATFORM = "Android";
    public static final String TAG = "Device";
    public static String platform;
    public static String uuid;

    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
        uuid = getUuid();
    }

    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (!"getDeviceInfo".equals(action)) {
            return false;
        }
        JSONObject r = new JSONObject();
        r.put("uuid", uuid);
        r.put("version", getOSVersion());
        r.put("platform", getPlatform());
        r.put("model", getModel());
        r.put("manufacturer", getManufacturer());
        r.put("isVirtual", isVirtual());
        r.put("serial", getSerialNumber());
        callbackContext.success(r);
        return true;
    }

    public String getPlatform() {
        if (isAmazonDevice()) {
            return AMAZON_PLATFORM;
        }
        return ANDROID_PLATFORM;
    }

    public String getUuid() {
        return Secure.getString(this.cordova.getActivity().getContentResolver(), "android_id");
    }

    public String getModel() {
        return Build.MODEL;
    }

    public String getProductName() {
        return Build.PRODUCT;
    }

    public String getManufacturer() {
        return Build.MANUFACTURER;
    }

    public String getSerialNumber() {
        return Build.SERIAL;
    }

    public String getOSVersion() {
        return VERSION.RELEASE;
    }

    public String getSDKVersion() {
        return VERSION.SDK;
    }

    public String getTimeZoneID() {
        return TimeZone.getDefault().getID();
    }

    public boolean isAmazonDevice() {
        if (Build.MANUFACTURER.equals(AMAZON_DEVICE)) {
            return true;
        }
        return false;
    }

    public boolean isVirtual() {
        return Build.FINGERPRINT.contains("generic") || Build.PRODUCT.contains("sdk");
    }
}
