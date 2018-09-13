package org.apache.cordova;

import android.app.Activity;
import android.content.Context;
import java.util.List;

@Deprecated
public class Config {
    private static final String TAG = "Config";
    static ConfigXmlParser parser;

    private Config() {
    }

    public static void init(Activity action) {
        parser = new ConfigXmlParser();
        parser.parse((Context) action);
        parser.getPreferences().setPreferencesBundle(action.getIntent().getExtras());
    }

    public static void init() {
        if (parser == null) {
            parser = new ConfigXmlParser();
        }
    }

    public static String getStartUrl() {
        if (parser == null) {
            return "file:///android_asset/www/index.html";
        }
        return parser.getLaunchUrl();
    }

    public static String getErrorUrl() {
        return parser.getPreferences().getString("errorurl", null);
    }

    public static List<PluginEntry> getPluginEntries() {
        return parser.getPluginEntries();
    }

    public static CordovaPreferences getPreferences() {
        return parser.getPreferences();
    }

    public static boolean isInitialized() {
        return parser != null;
    }
}
