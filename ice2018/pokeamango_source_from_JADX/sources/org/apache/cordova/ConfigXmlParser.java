package org.apache.cordova;

import android.content.Context;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Locale;
import java.util.regex.Pattern;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

public class ConfigXmlParser {
    private static String TAG = "ConfigXmlParser";
    boolean insideFeature = false;
    private String launchUrl = "file:///android_asset/www/index.html";
    boolean onload = false;
    String paramType = "";
    String pluginClass = "";
    private ArrayList<PluginEntry> pluginEntries = new ArrayList(20);
    private CordovaPreferences prefs = new CordovaPreferences();
    String service = "";

    public CordovaPreferences getPreferences() {
        return this.prefs;
    }

    public ArrayList<PluginEntry> getPluginEntries() {
        return this.pluginEntries;
    }

    public String getLaunchUrl() {
        return this.launchUrl;
    }

    public void parse(Context action) {
        int id = action.getResources().getIdentifier("config", "xml", action.getClass().getPackage().getName());
        if (id == 0) {
            id = action.getResources().getIdentifier("config", "xml", action.getPackageName());
            if (id == 0) {
                LOG.m3e(TAG, "res/xml/config.xml is missing!");
                return;
            }
        }
        parse(action.getResources().getXml(id));
    }

    public void parse(XmlPullParser xml) {
        int eventType = -1;
        while (eventType != 1) {
            if (eventType == 2) {
                handleStartTag(xml);
            } else if (eventType == 3) {
                handleEndTag(xml);
            }
            try {
                eventType = xml.next();
            } catch (XmlPullParserException e) {
                e.printStackTrace();
            } catch (IOException e2) {
                e2.printStackTrace();
            }
        }
    }

    public void handleStartTag(XmlPullParser xml) {
        String strNode = xml.getName();
        if (strNode.equals("feature")) {
            this.insideFeature = true;
            this.service = xml.getAttributeValue(null, "name");
        } else if (this.insideFeature && strNode.equals("param")) {
            this.paramType = xml.getAttributeValue(null, "name");
            if (this.paramType.equals("service")) {
                this.service = xml.getAttributeValue(null, "value");
            } else if (this.paramType.equals("package") || this.paramType.equals("android-package")) {
                this.pluginClass = xml.getAttributeValue(null, "value");
            } else if (this.paramType.equals("onload")) {
                this.onload = "true".equals(xml.getAttributeValue(null, "value"));
            }
        } else if (strNode.equals("preference")) {
            this.prefs.set(xml.getAttributeValue(null, "name").toLowerCase(Locale.ENGLISH), xml.getAttributeValue(null, "value"));
        } else if (strNode.equals("content")) {
            String src = xml.getAttributeValue(null, "src");
            if (src != null) {
                setStartUrl(src);
            }
        }
    }

    public void handleEndTag(XmlPullParser xml) {
        if (xml.getName().equals("feature")) {
            this.pluginEntries.add(new PluginEntry(this.service, this.pluginClass, this.onload));
            this.service = "";
            this.pluginClass = "";
            this.insideFeature = false;
            this.onload = false;
        }
    }

    private void setStartUrl(String src) {
        if (Pattern.compile("^[a-z-]+://").matcher(src).find()) {
            this.launchUrl = src;
            return;
        }
        if (src.charAt(0) == '/') {
            src = src.substring(1);
        }
        this.launchUrl = "file:///android_asset/www/" + src;
    }
}
