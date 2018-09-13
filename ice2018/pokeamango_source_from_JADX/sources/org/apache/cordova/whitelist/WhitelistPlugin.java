package org.apache.cordova.whitelist;

import android.content.Context;
import android.util.Log;
import org.apache.cordova.ConfigXmlParser;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.Whitelist;
import org.xmlpull.v1.XmlPullParser;

public class WhitelistPlugin extends CordovaPlugin {
    private static final String LOG_TAG = "WhitelistPlugin";
    private Whitelist allowedIntents;
    private Whitelist allowedNavigations;
    private Whitelist allowedRequests;

    private class CustomConfigXmlParser extends ConfigXmlParser {
        private CustomConfigXmlParser() {
        }

        public void handleStartTag(XmlPullParser xml) {
            boolean z = true;
            String strNode = xml.getName();
            if (strNode.equals("content")) {
                WhitelistPlugin.this.allowedNavigations.addWhiteListEntry(xml.getAttributeValue(null, "src"), false);
            } else if (strNode.equals("allow-navigation")) {
                origin = xml.getAttributeValue(null, "href");
                if ("*".equals(origin)) {
                    WhitelistPlugin.this.allowedNavigations.addWhiteListEntry("http://*/*", false);
                    WhitelistPlugin.this.allowedNavigations.addWhiteListEntry("https://*/*", false);
                    WhitelistPlugin.this.allowedNavigations.addWhiteListEntry("data:*", false);
                    return;
                }
                WhitelistPlugin.this.allowedNavigations.addWhiteListEntry(origin, false);
            } else if (strNode.equals("allow-intent")) {
                WhitelistPlugin.this.allowedIntents.addWhiteListEntry(xml.getAttributeValue(null, "href"), false);
            } else if (strNode.equals("access")) {
                boolean external;
                origin = xml.getAttributeValue(null, "origin");
                String subdomains = xml.getAttributeValue(null, "subdomains");
                if (xml.getAttributeValue(null, "launch-external") != null) {
                    external = true;
                } else {
                    external = false;
                }
                if (origin == null) {
                    return;
                }
                Whitelist access$200;
                if (external) {
                    Log.w(WhitelistPlugin.LOG_TAG, "Found <access launch-external> within config.xml. Please use <allow-intent> instead.");
                    access$200 = WhitelistPlugin.this.allowedIntents;
                    if (subdomains == null || subdomains.compareToIgnoreCase("true") != 0) {
                        z = false;
                    }
                    access$200.addWhiteListEntry(origin, z);
                } else if ("*".equals(origin)) {
                    WhitelistPlugin.this.allowedRequests.addWhiteListEntry("http://*/*", false);
                    WhitelistPlugin.this.allowedRequests.addWhiteListEntry("https://*/*", false);
                } else {
                    access$200 = WhitelistPlugin.this.allowedRequests;
                    if (subdomains == null || subdomains.compareToIgnoreCase("true") != 0) {
                        z = false;
                    }
                    access$200.addWhiteListEntry(origin, z);
                }
            }
        }

        public void handleEndTag(XmlPullParser xml) {
        }
    }

    public WhitelistPlugin(Context context) {
        this(new Whitelist(), new Whitelist(), null);
        new CustomConfigXmlParser().parse(context);
    }

    public WhitelistPlugin(XmlPullParser xmlParser) {
        this(new Whitelist(), new Whitelist(), null);
        new CustomConfigXmlParser().parse(xmlParser);
    }

    public WhitelistPlugin(Whitelist allowedNavigations, Whitelist allowedIntents, Whitelist allowedRequests) {
        if (allowedRequests == null) {
            allowedRequests = new Whitelist();
            allowedRequests.addWhiteListEntry("file:///*", false);
            allowedRequests.addWhiteListEntry("data:*", false);
        }
        this.allowedNavigations = allowedNavigations;
        this.allowedIntents = allowedIntents;
        this.allowedRequests = allowedRequests;
    }

    public void pluginInitialize() {
        if (this.allowedNavigations == null) {
            this.allowedNavigations = new Whitelist();
            this.allowedIntents = new Whitelist();
            this.allowedRequests = new Whitelist();
            new CustomConfigXmlParser().parse(this.webView.getContext());
        }
    }

    public Boolean shouldAllowNavigation(String url) {
        if (this.allowedNavigations.isUrlWhiteListed(url)) {
            return Boolean.valueOf(true);
        }
        return null;
    }

    public Boolean shouldAllowRequest(String url) {
        if (Boolean.TRUE == shouldAllowNavigation(url)) {
            return Boolean.valueOf(true);
        }
        if (this.allowedRequests.isUrlWhiteListed(url)) {
            return Boolean.valueOf(true);
        }
        return null;
    }

    public Boolean shouldOpenExternalUrl(String url) {
        if (this.allowedIntents.isUrlWhiteListed(url)) {
            return Boolean.valueOf(true);
        }
        return null;
    }

    public Whitelist getAllowedNavigations() {
        return this.allowedNavigations;
    }

    public void setAllowedNavigations(Whitelist allowedNavigations) {
        this.allowedNavigations = allowedNavigations;
    }

    public Whitelist getAllowedIntents() {
        return this.allowedIntents;
    }

    public void setAllowedIntents(Whitelist allowedIntents) {
        this.allowedIntents = allowedIntents;
    }

    public Whitelist getAllowedRequests() {
        return this.allowedRequests;
    }

    public void setAllowedRequests(Whitelist allowedRequests) {
        this.allowedRequests = allowedRequests;
    }
}
