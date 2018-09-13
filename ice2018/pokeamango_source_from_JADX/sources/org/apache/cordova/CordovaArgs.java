package org.apache.cordova;

import android.util.Base64;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class CordovaArgs {
    private JSONArray baseArgs;

    public CordovaArgs(JSONArray args) {
        this.baseArgs = args;
    }

    public Object get(int index) throws JSONException {
        return this.baseArgs.get(index);
    }

    public boolean getBoolean(int index) throws JSONException {
        return this.baseArgs.getBoolean(index);
    }

    public double getDouble(int index) throws JSONException {
        return this.baseArgs.getDouble(index);
    }

    public int getInt(int index) throws JSONException {
        return this.baseArgs.getInt(index);
    }

    public JSONArray getJSONArray(int index) throws JSONException {
        return this.baseArgs.getJSONArray(index);
    }

    public JSONObject getJSONObject(int index) throws JSONException {
        return this.baseArgs.getJSONObject(index);
    }

    public long getLong(int index) throws JSONException {
        return this.baseArgs.getLong(index);
    }

    public String getString(int index) throws JSONException {
        return this.baseArgs.getString(index);
    }

    public Object opt(int index) {
        return this.baseArgs.opt(index);
    }

    public boolean optBoolean(int index) {
        return this.baseArgs.optBoolean(index);
    }

    public double optDouble(int index) {
        return this.baseArgs.optDouble(index);
    }

    public int optInt(int index) {
        return this.baseArgs.optInt(index);
    }

    public JSONArray optJSONArray(int index) {
        return this.baseArgs.optJSONArray(index);
    }

    public JSONObject optJSONObject(int index) {
        return this.baseArgs.optJSONObject(index);
    }

    public long optLong(int index) {
        return this.baseArgs.optLong(index);
    }

    public String optString(int index) {
        return this.baseArgs.optString(index);
    }

    public boolean isNull(int index) {
        return this.baseArgs.isNull(index);
    }

    public byte[] getArrayBuffer(int index) throws JSONException {
        return Base64.decode(this.baseArgs.getString(index), 0);
    }
}
