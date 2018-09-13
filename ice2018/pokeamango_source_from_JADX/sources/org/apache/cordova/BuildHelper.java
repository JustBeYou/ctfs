package org.apache.cordova;

import android.content.Context;

public class BuildHelper {
    private static String TAG = "BuildHelper";

    public static Object getBuildConfigValue(Context ctx, String key) {
        Object obj = null;
        try {
            obj = Class.forName(ctx.getPackageName() + ".BuildConfig").getField(key).get(null);
        } catch (ClassNotFoundException e) {
            LOG.m0d(TAG, "Unable to get the BuildConfig, is this built with ANT?");
            e.printStackTrace();
        } catch (NoSuchFieldException e2) {
            LOG.m0d(TAG, key + " is not a valid field. Check your build.gradle");
        } catch (IllegalAccessException e3) {
            LOG.m0d(TAG, "Illegal Access Exception: Let's print a stack trace.");
            e3.printStackTrace();
        }
        return obj;
    }
}
