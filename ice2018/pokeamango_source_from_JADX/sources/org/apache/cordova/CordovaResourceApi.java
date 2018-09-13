package org.apache.cordova;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Looper;
import android.util.Base64;
import android.webkit.MimeTypeMap;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;

public class CordovaResourceApi {
    private static final String[] LOCAL_FILE_PROJECTION = new String[]{"_data"};
    private static final String LOG_TAG = "CordovaResourceApi";
    public static final String PLUGIN_URI_SCHEME = "cdvplugin";
    public static final int URI_TYPE_ASSET = 1;
    public static final int URI_TYPE_CONTENT = 2;
    public static final int URI_TYPE_DATA = 4;
    public static final int URI_TYPE_FILE = 0;
    public static final int URI_TYPE_HTTP = 5;
    public static final int URI_TYPE_HTTPS = 6;
    public static final int URI_TYPE_PLUGIN = 7;
    public static final int URI_TYPE_RESOURCE = 3;
    public static final int URI_TYPE_UNKNOWN = -1;
    public static Thread jsThread;
    private final AssetManager assetManager;
    private final ContentResolver contentResolver;
    private final PluginManager pluginManager;
    private boolean threadCheckingEnabled = true;

    public static final class OpenForReadResult {
        public final AssetFileDescriptor assetFd;
        public final InputStream inputStream;
        public final long length;
        public final String mimeType;
        public final Uri uri;

        public OpenForReadResult(Uri uri, InputStream inputStream, String mimeType, long length, AssetFileDescriptor assetFd) {
            this.uri = uri;
            this.inputStream = inputStream;
            this.mimeType = mimeType;
            this.length = length;
            this.assetFd = assetFd;
        }
    }

    public void copyResource(org.apache.cordova.CordovaResourceApi.OpenForReadResult r15, java.io.OutputStream r16) throws java.io.IOException {
        /* JADX: method processing error */
/*
Error: jadx.core.utils.exceptions.JadxRuntimeException: Can't find block by offset: 0x0040 in list [B:12:0x003d]
	at jadx.core.utils.BlockUtils.getBlockByOffset(BlockUtils.java:43)
	at jadx.core.dex.instructions.IfNode.initBlocks(IfNode.java:60)
	at jadx.core.dex.visitors.blocksmaker.BlockFinish.initBlocksInIfNodes(BlockFinish.java:48)
	at jadx.core.dex.visitors.blocksmaker.BlockFinish.visit(BlockFinish.java:33)
	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:31)
	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:17)
	at jadx.core.ProcessClass.process(ProcessClass.java:34)
	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:56)
	at jadx.core.ProcessClass.process(ProcessClass.java:39)
	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:282)
	at jadx.api.JavaClass.decompile(JavaClass.java:62)
	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:200)
	at jadx.api.JadxDecompiler$$Lambda$8/99451533.run(Unknown Source)
*/
        /*
        r14 = this;
        r14.assertBackgroundThread();
        r11 = r15.inputStream;	 Catch:{ all -> 0x0057 }
        r4 = r11 instanceof java.io.FileInputStream;	 Catch:{ all -> 0x0057 }
        if (r4 == 0) goto L_0x0041;	 Catch:{ all -> 0x0057 }
    L_0x0009:
        r0 = r16;	 Catch:{ all -> 0x0057 }
        r4 = r0 instanceof java.io.FileOutputStream;	 Catch:{ all -> 0x0057 }
        if (r4 == 0) goto L_0x0041;	 Catch:{ all -> 0x0057 }
    L_0x000f:
        r4 = r15.inputStream;	 Catch:{ all -> 0x0057 }
        r4 = (java.io.FileInputStream) r4;	 Catch:{ all -> 0x0057 }
        r3 = r4.getChannel();	 Catch:{ all -> 0x0057 }
        r0 = r16;	 Catch:{ all -> 0x0057 }
        r0 = (java.io.FileOutputStream) r0;	 Catch:{ all -> 0x0057 }
        r4 = r0;	 Catch:{ all -> 0x0057 }
        r2 = r4.getChannel();	 Catch:{ all -> 0x0057 }
        r12 = 0;	 Catch:{ all -> 0x0057 }
        r6 = r15.length;	 Catch:{ all -> 0x0057 }
        r4 = r15.assetFd;	 Catch:{ all -> 0x0057 }
        if (r4 == 0) goto L_0x002e;	 Catch:{ all -> 0x0057 }
    L_0x0028:
        r4 = r15.assetFd;	 Catch:{ all -> 0x0057 }
        r12 = r4.getStartOffset();	 Catch:{ all -> 0x0057 }
    L_0x002e:
        r3.position(r12);	 Catch:{ all -> 0x0057 }
        r4 = 0;	 Catch:{ all -> 0x0057 }
        r2.transferFrom(r3, r4, r6);	 Catch:{ all -> 0x0057 }
    L_0x0036:
        r4 = r15.inputStream;
        r4.close();
        if (r16 == 0) goto L_0x0040;
    L_0x003d:
        r16.close();
    L_0x0040:
        return;
    L_0x0041:
        r8 = 8192; // 0x2000 float:1.14794E-41 double:4.0474E-320;
        r4 = 8192; // 0x2000 float:1.14794E-41 double:4.0474E-320;
        r9 = new byte[r4];	 Catch:{ all -> 0x0057 }
    L_0x0047:
        r4 = 0;	 Catch:{ all -> 0x0057 }
        r5 = 8192; // 0x2000 float:1.14794E-41 double:4.0474E-320;	 Catch:{ all -> 0x0057 }
        r10 = r11.read(r9, r4, r5);	 Catch:{ all -> 0x0057 }
        if (r10 <= 0) goto L_0x0036;	 Catch:{ all -> 0x0057 }
    L_0x0050:
        r4 = 0;	 Catch:{ all -> 0x0057 }
        r0 = r16;	 Catch:{ all -> 0x0057 }
        r0.write(r9, r4, r10);	 Catch:{ all -> 0x0057 }
        goto L_0x0047;
    L_0x0057:
        r4 = move-exception;
        r5 = r15.inputStream;
        r5.close();
        if (r16 == 0) goto L_0x0062;
    L_0x005f:
        r16.close();
    L_0x0062:
        throw r4;
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.cordova.CordovaResourceApi.copyResource(org.apache.cordova.CordovaResourceApi$OpenForReadResult, java.io.OutputStream):void");
    }

    public CordovaResourceApi(Context context, PluginManager pluginManager) {
        this.contentResolver = context.getContentResolver();
        this.assetManager = context.getAssets();
        this.pluginManager = pluginManager;
    }

    public void setThreadCheckingEnabled(boolean value) {
        this.threadCheckingEnabled = value;
    }

    public boolean isThreadCheckingEnabled() {
        return this.threadCheckingEnabled;
    }

    public static int getUriType(Uri uri) {
        assertNonRelative(uri);
        String scheme = uri.getScheme();
        if ("content".equalsIgnoreCase(scheme)) {
            return 2;
        }
        if ("android.resource".equalsIgnoreCase(scheme)) {
            return 3;
        }
        if ("file".equalsIgnoreCase(scheme)) {
            if (uri.getPath().startsWith("/android_asset/")) {
                return 1;
            }
            return 0;
        } else if ("data".equalsIgnoreCase(scheme)) {
            return 4;
        } else {
            if ("http".equalsIgnoreCase(scheme)) {
                return 5;
            }
            if ("https".equalsIgnoreCase(scheme)) {
                return 6;
            }
            if (PLUGIN_URI_SCHEME.equalsIgnoreCase(scheme)) {
                return 7;
            }
            return -1;
        }
    }

    public Uri remapUri(Uri uri) {
        assertNonRelative(uri);
        Uri pluginUri = this.pluginManager.remapUri(uri);
        return pluginUri != null ? pluginUri : uri;
    }

    public String remapPath(String path) {
        return remapUri(Uri.fromFile(new File(path))).getPath();
    }

    public File mapUriToFile(Uri uri) {
        File file = null;
        assertBackgroundThread();
        switch (getUriType(uri)) {
            case URI_TYPE_FILE /*0*/:
                return new File(uri.getPath());
            case 2:
                Cursor cursor = this.contentResolver.query(uri, LOCAL_FILE_PROJECTION, null, null, null);
                if (cursor == null) {
                    return null;
                }
                try {
                    int columnIndex = cursor.getColumnIndex(LOCAL_FILE_PROJECTION[0]);
                    if (columnIndex != -1 && cursor.getCount() > 0) {
                        cursor.moveToFirst();
                        String realPath = cursor.getString(columnIndex);
                        if (realPath != null) {
                            file = new File(realPath);
                            return file;
                        }
                    }
                    cursor.close();
                    return null;
                } finally {
                    cursor.close();
                }
            default:
                return null;
        }
    }

    public String getMimeType(Uri uri) {
        switch (getUriType(uri)) {
            case URI_TYPE_FILE /*0*/:
            case 1:
                return getMimeTypeFromPath(uri.getPath());
            case 2:
            case 3:
                return this.contentResolver.getType(uri);
            case 4:
                return getDataUriMimeType(uri);
            case 5:
            case 6:
                try {
                    HttpURLConnection conn = (HttpURLConnection) new URL(uri.toString()).openConnection();
                    conn.setDoInput(false);
                    conn.setRequestMethod("HEAD");
                    String mimeType = conn.getHeaderField("Content-Type");
                    if (mimeType != null) {
                        return mimeType.split(";")[0];
                    }
                    return mimeType;
                } catch (IOException e) {
                    break;
                }
        }
        return null;
    }

    private String getMimeTypeFromPath(String path) {
        String extension = path;
        int lastDot = extension.lastIndexOf(46);
        if (lastDot != -1) {
            extension = extension.substring(lastDot + 1);
        }
        extension = extension.toLowerCase(Locale.getDefault());
        if (extension.equals("3ga")) {
            return "audio/3gpp";
        }
        if (extension.equals("js")) {
            return "text/javascript";
        }
        return MimeTypeMap.getSingleton().getMimeTypeFromExtension(extension);
    }

    public OpenForReadResult openForRead(Uri uri) throws IOException {
        return openForRead(uri, false);
    }

    public OpenForReadResult openForRead(Uri uri, boolean skipThreadCheck) throws IOException {
        InputStream inputStream;
        if (!skipThreadCheck) {
            assertBackgroundThread();
        }
        AssetFileDescriptor assetFd;
        String mimeType;
        switch (getUriType(uri)) {
            case URI_TYPE_FILE /*0*/:
                FileInputStream inputStream2 = new FileInputStream(uri.getPath());
                return new OpenForReadResult(uri, inputStream2, getMimeTypeFromPath(uri.getPath()), inputStream2.getChannel().size(), null);
            case 1:
                long length;
                String assetPath = uri.getPath().substring(15);
                assetFd = null;
                try {
                    assetFd = this.assetManager.openFd(assetPath);
                    inputStream = assetFd.createInputStream();
                    length = assetFd.getLength();
                } catch (FileNotFoundException e) {
                    inputStream = this.assetManager.open(assetPath);
                    length = (long) inputStream.available();
                }
                return new OpenForReadResult(uri, inputStream, getMimeTypeFromPath(assetPath), length, assetFd);
            case 2:
            case 3:
                mimeType = this.contentResolver.getType(uri);
                assetFd = this.contentResolver.openAssetFileDescriptor(uri, "r");
                return new OpenForReadResult(uri, assetFd.createInputStream(), mimeType, assetFd.getLength(), assetFd);
            case 4:
                OpenForReadResult ret = readDataUri(uri);
                if (ret != null) {
                    return ret;
                }
                break;
            case 5:
            case 6:
                HttpURLConnection conn = (HttpURLConnection) new URL(uri.toString()).openConnection();
                conn.setDoInput(true);
                mimeType = conn.getHeaderField("Content-Type");
                if (mimeType != null) {
                    mimeType = mimeType.split(";")[0];
                }
                int length2 = conn.getContentLength();
                return new OpenForReadResult(uri, conn.getInputStream(), mimeType, (long) length2, null);
            case 7:
                CordovaPlugin plugin = this.pluginManager.getPlugin(uri.getHost());
                if (plugin != null) {
                    return plugin.handleOpenForRead(uri);
                }
                throw new FileNotFoundException("Invalid plugin ID in URI: " + uri);
        }
        throw new FileNotFoundException("URI not supported by CordovaResourceApi: " + uri);
    }

    public OutputStream openOutputStream(Uri uri) throws IOException {
        return openOutputStream(uri, false);
    }

    public OutputStream openOutputStream(Uri uri, boolean append) throws IOException {
        assertBackgroundThread();
        switch (getUriType(uri)) {
            case URI_TYPE_FILE /*0*/:
                File localFile = new File(uri.getPath());
                File parent = localFile.getParentFile();
                if (parent != null) {
                    parent.mkdirs();
                }
                return new FileOutputStream(localFile, append);
            case 2:
            case 3:
                return this.contentResolver.openAssetFileDescriptor(uri, append ? "wa" : "w").createOutputStream();
            default:
                throw new FileNotFoundException("URI not supported by CordovaResourceApi: " + uri);
        }
    }

    public HttpURLConnection createHttpConnection(Uri uri) throws IOException {
        assertBackgroundThread();
        return (HttpURLConnection) new URL(uri.toString()).openConnection();
    }

    public void copyResource(Uri sourceUri, OutputStream outputStream) throws IOException {
        copyResource(openForRead(sourceUri), outputStream);
    }

    public void copyResource(Uri sourceUri, Uri dstUri) throws IOException {
        copyResource(openForRead(sourceUri), openOutputStream(dstUri));
    }

    private void assertBackgroundThread() {
        if (this.threadCheckingEnabled) {
            Thread curThread = Thread.currentThread();
            if (curThread == Looper.getMainLooper().getThread()) {
                throw new IllegalStateException("Do not perform IO operations on the UI thread. Use CordovaInterface.getThreadPool() instead.");
            } else if (curThread == jsThread) {
                throw new IllegalStateException("Tried to perform an IO operation on the WebCore thread. Use CordovaInterface.getThreadPool() instead.");
            }
        }
    }

    private String getDataUriMimeType(Uri uri) {
        String uriAsString = uri.getSchemeSpecificPart();
        int commaPos = uriAsString.indexOf(44);
        if (commaPos == -1) {
            return null;
        }
        String[] mimeParts = uriAsString.substring(0, commaPos).split(";");
        if (mimeParts.length > 0) {
            return mimeParts[0];
        }
        return null;
    }

    private OpenForReadResult readDataUri(Uri uri) {
        String uriAsString = uri.getSchemeSpecificPart();
        int commaPos = uriAsString.indexOf(44);
        if (commaPos == -1) {
            return null;
        }
        byte[] data;
        String[] mimeParts = uriAsString.substring(0, commaPos).split(";");
        String contentType = null;
        boolean base64 = false;
        if (mimeParts.length > 0) {
            contentType = mimeParts[0];
        }
        for (int i = 1; i < mimeParts.length; i++) {
            if ("base64".equalsIgnoreCase(mimeParts[i])) {
                base64 = true;
            }
        }
        String dataPartAsString = uriAsString.substring(commaPos + 1);
        if (base64) {
            data = Base64.decode(dataPartAsString, 0);
        } else {
            try {
                data = dataPartAsString.getBytes("UTF-8");
            } catch (UnsupportedEncodingException e) {
                data = dataPartAsString.getBytes();
            }
        }
        return new OpenForReadResult(uri, new ByteArrayInputStream(data), contentType, (long) data.length, null);
    }

    private static void assertNonRelative(Uri uri) {
        if (!uri.isAbsolute()) {
            throw new IllegalArgumentException("Relative URIs are not supported.");
        }
    }
}
