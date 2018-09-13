package org.apache.cordova;

import android.net.Uri;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Whitelist {
    public static final String TAG = "Whitelist";
    private ArrayList<URLPattern> whiteList = new ArrayList();

    private static class URLPattern {
        public Pattern host;
        public Pattern path;
        public Integer port;
        public Pattern scheme;

        private String regexFromPattern(String pattern, boolean allowWildcards) {
            String toReplace = "\\.[]{}()^$?+|";
            StringBuilder regex = new StringBuilder();
            for (int i = 0; i < pattern.length(); i++) {
                char c = pattern.charAt(i);
                if (c == '*' && allowWildcards) {
                    regex.append(".");
                } else if ("\\.[]{}()^$?+|".indexOf(c) > -1) {
                    regex.append('\\');
                }
                regex.append(c);
            }
            return regex.toString();
        }

        public URLPattern(String scheme, String host, String port, String path) throws MalformedURLException {
            if (scheme != null) {
                try {
                    if (!"*".equals(scheme)) {
                        this.scheme = Pattern.compile(regexFromPattern(scheme, false), 2);
                        if ("*".equals(host)) {
                            this.host = null;
                        } else if (host.startsWith("*.")) {
                            this.host = Pattern.compile(regexFromPattern(host, false), 2);
                        } else {
                            this.host = Pattern.compile("([a-z0-9.-]*\\.)?" + regexFromPattern(host.substring(2), false), 2);
                        }
                        if (port != null || "*".equals(port)) {
                            this.port = null;
                        } else {
                            this.port = Integer.valueOf(Integer.parseInt(port, 10));
                        }
                        if (path != null || "/*".equals(path)) {
                            this.path = null;
                        } else {
                            this.path = Pattern.compile(regexFromPattern(path, true));
                            return;
                        }
                    }
                } catch (NumberFormatException e) {
                    throw new MalformedURLException("Port must be a number");
                }
            }
            this.scheme = null;
            if ("*".equals(host)) {
                this.host = null;
            } else if (host.startsWith("*.")) {
                this.host = Pattern.compile(regexFromPattern(host, false), 2);
            } else {
                this.host = Pattern.compile("([a-z0-9.-]*\\.)?" + regexFromPattern(host.substring(2), false), 2);
            }
            if (port != null) {
            }
            this.port = null;
            if (path != null) {
            }
            this.path = null;
        }

        public boolean matches(Uri uri) {
            try {
                if (this.scheme != null && !this.scheme.matcher(uri.getScheme()).matches()) {
                    return false;
                }
                if (this.host != null && !this.host.matcher(uri.getHost()).matches()) {
                    return false;
                }
                if (this.port != null && !this.port.equals(Integer.valueOf(uri.getPort()))) {
                    return false;
                }
                if (this.path == null || this.path.matcher(uri.getPath()).matches()) {
                    return true;
                }
                return false;
            } catch (Exception e) {
                LOG.m0d(Whitelist.TAG, e.toString());
                return false;
            }
        }
    }

    public void addWhiteListEntry(String origin, boolean subdomains) {
        if (this.whiteList != null) {
            try {
                if (origin.compareTo("*") == 0) {
                    LOG.m0d(TAG, "Unlimited access to network resources");
                    this.whiteList = null;
                    return;
                }
                Matcher m = Pattern.compile("^((\\*|[A-Za-z-]+):(//)?)?(\\*|((\\*\\.)?[^*/:]+))?(:(\\d+))?(/.*)?").matcher(origin);
                if (m.matches()) {
                    String scheme = m.group(2);
                    String host = m.group(4);
                    if (("file".equals(scheme) || "content".equals(scheme)) && host == null) {
                        host = "*";
                    }
                    String port = m.group(8);
                    String path = m.group(9);
                    if (scheme == null) {
                        this.whiteList.add(new URLPattern("http", host, port, path));
                        this.whiteList.add(new URLPattern("https", host, port, path));
                        return;
                    }
                    this.whiteList.add(new URLPattern(scheme, host, port, path));
                }
            } catch (Exception e) {
                LOG.m2d(TAG, "Failed to add origin %s", origin);
            }
        }
    }

    public boolean isUrlWhiteListed(String uri) {
        if (this.whiteList == null) {
            return true;
        }
        Uri parsedUri = Uri.parse(uri);
        Iterator<URLPattern> pit = this.whiteList.iterator();
        while (pit.hasNext()) {
            if (((URLPattern) pit.next()).matches(parsedUri)) {
                return true;
            }
        }
        return false;
    }
}
