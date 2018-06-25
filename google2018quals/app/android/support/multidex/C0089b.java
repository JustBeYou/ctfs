package android.support.multidex;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Build.VERSION;
import android.util.Log;
import java.io.BufferedOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileFilter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileChannel;
import java.nio.channels.FileLock;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

final class C0089b implements Closeable {
    private final File f413a;
    private final long f414b;
    private final File f415c;
    private final RandomAccessFile f416d;
    private final FileChannel f417e;
    private final FileLock f418f;

    class C00871 implements FileFilter {
        final /* synthetic */ C0089b f411a;

        C00871(C0089b c0089b) {
            this.f411a = c0089b;
        }

        public boolean accept(File file) {
            return !file.getName().equals("MultiDex.lock");
        }
    }

    private static class C0088a extends File {
        public long f412a = -1;

        public C0088a(File file, String str) {
            super(file, str);
        }
    }

    C0089b(File file, File file2) {
        RuntimeException e;
        IOException e2;
        Log.i("MultiDex", "MultiDexExtractor(" + file.getPath() + ", " + file2.getPath() + ")");
        this.f413a = file;
        this.f415c = file2;
        this.f414b = C0089b.m377b(file);
        File file3 = new File(file2, "MultiDex.lock");
        this.f416d = new RandomAccessFile(file3, "rw");
        try {
            this.f417e = this.f416d.getChannel();
            try {
                Log.i("MultiDex", "Blocking on lock " + file3.getPath());
                this.f418f = this.f417e.lock();
                Log.i("MultiDex", file3.getPath() + " locked");
            } catch (IOException e3) {
                e = e3;
                C0089b.m374a(this.f417e);
                throw e;
            } catch (RuntimeException e4) {
                e = e4;
                C0089b.m374a(this.f417e);
                throw e;
            } catch (Error e5) {
                e = e5;
                C0089b.m374a(this.f417e);
                throw e;
            }
        } catch (IOException e6) {
            e2 = e6;
            C0089b.m374a(this.f416d);
            throw e2;
        } catch (RuntimeException e7) {
            e2 = e7;
            C0089b.m374a(this.f416d);
            throw e2;
        } catch (Error e8) {
            e2 = e8;
            C0089b.m374a(this.f416d);
            throw e2;
        }
    }

    private static long m369a(File file) {
        long lastModified = file.lastModified();
        return lastModified == -1 ? lastModified - 1 : lastModified;
    }

    private static SharedPreferences m370a(Context context) {
        return context.getSharedPreferences("multidex.version", VERSION.SDK_INT < 11 ? 0 : 4);
    }

    private List<C0088a> m371a() {
        String str = this.f413a.getName() + ".classes";
        m378b();
        List<C0088a> arrayList = new ArrayList();
        ZipFile zipFile = new ZipFile(this.f413a);
        ZipEntry entry = zipFile.getEntry("classes" + 2 + ".dex");
        int i = 2;
        while (entry != null) {
            File c0088a = new C0088a(this.f415c, str + i + ".zip");
            arrayList.add(c0088a);
            Log.i("MultiDex", "Extraction is needed for file " + c0088a);
            Object obj = null;
            int i2 = 0;
            while (i2 < 3 && obj == null) {
                int i3 = i2 + 1;
                C0089b.m375a(zipFile, entry, c0088a, str);
                try {
                    c0088a.f412a = C0089b.m377b(c0088a);
                    obj = 1;
                } catch (Throwable e) {
                    Log.w("MultiDex", "Failed to read crc from " + c0088a.getAbsolutePath(), e);
                    obj = null;
                } catch (Throwable th) {
                    try {
                        zipFile.close();
                    } catch (Throwable e2) {
                        Log.w("MultiDex", "Failed to close resource", e2);
                    }
                }
                Log.i("MultiDex", "Extraction " + (obj != null ? "succeeded" : "failed") + " '" + c0088a.getAbsolutePath() + "': length " + c0088a.length() + " - crc: " + c0088a.f412a);
                if (obj == null) {
                    c0088a.delete();
                    if (c0088a.exists()) {
                        Log.w("MultiDex", "Failed to delete corrupted secondary dex '" + c0088a.getPath() + "'");
                        i2 = i3;
                    }
                }
                i2 = i3;
            }
            if (obj == null) {
                throw new IOException("Could not create zip file " + c0088a.getAbsolutePath() + " for secondary dex (" + i + ")");
            }
            int i4 = i + 1;
            entry = zipFile.getEntry("classes" + i4 + ".dex");
            i = i4;
        }
        try {
            zipFile.close();
        } catch (Throwable e3) {
            Log.w("MultiDex", "Failed to close resource", e3);
        }
        return arrayList;
    }

    private List<C0088a> m372a(Context context, String str) {
        Log.i("MultiDex", "loading existing secondary dex files");
        String str2 = this.f413a.getName() + ".classes";
        SharedPreferences a = C0089b.m370a(context);
        int i = a.getInt(str + "dex.number", 1);
        List<C0088a> arrayList = new ArrayList(i - 1);
        int i2 = 2;
        while (i2 <= i) {
            File c0088a = new C0088a(this.f415c, str2 + i2 + ".zip");
            if (c0088a.isFile()) {
                c0088a.f412a = C0089b.m377b(c0088a);
                long j = a.getLong(str + "dex.crc." + i2, -1);
                long j2 = a.getLong(str + "dex.time." + i2, -1);
                long lastModified = c0088a.lastModified();
                if (j2 == lastModified && j == c0088a.f412a) {
                    arrayList.add(c0088a);
                    i2++;
                } else {
                    throw new IOException("Invalid extracted dex: " + c0088a + " (key \"" + str + "\"), expected modification time: " + j2 + ", modification time: " + lastModified + ", expected crc: " + j + ", file crc: " + c0088a.f412a);
                }
            }
            throw new IOException("Missing extracted secondary dex file '" + c0088a.getPath() + "'");
        }
        return arrayList;
    }

    private static void m373a(Context context, String str, long j, long j2, List<C0088a> list) {
        Editor edit = C0089b.m370a(context).edit();
        edit.putLong(str + "timestamp", j);
        edit.putLong(str + "crc", j2);
        edit.putInt(str + "dex.number", list.size() + 1);
        int i = 2;
        for (C0088a c0088a : list) {
            edit.putLong(str + "dex.crc." + i, c0088a.f412a);
            edit.putLong(str + "dex.time." + i, c0088a.lastModified());
            i++;
        }
        edit.commit();
    }

    private static void m374a(Closeable closeable) {
        try {
            closeable.close();
        } catch (Throwable e) {
            Log.w("MultiDex", "Failed to close resource", e);
        }
    }

    private static void m375a(ZipFile zipFile, ZipEntry zipEntry, File file, String str) {
        Closeable inputStream = zipFile.getInputStream(zipEntry);
        File createTempFile = File.createTempFile("tmp-" + str, ".zip", file.getParentFile());
        Log.i("MultiDex", "Extracting " + createTempFile.getPath());
        ZipOutputStream zipOutputStream;
        try {
            zipOutputStream = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(createTempFile)));
            ZipEntry zipEntry2 = new ZipEntry("classes.dex");
            zipEntry2.setTime(zipEntry.getTime());
            zipOutputStream.putNextEntry(zipEntry2);
            byte[] bArr = new byte[16384];
            for (int read = inputStream.read(bArr); read != -1; read = inputStream.read(bArr)) {
                zipOutputStream.write(bArr, 0, read);
            }
            zipOutputStream.closeEntry();
            zipOutputStream.close();
            if (createTempFile.setReadOnly()) {
                Log.i("MultiDex", "Renaming to " + file.getPath());
                if (createTempFile.renameTo(file)) {
                    C0089b.m374a(inputStream);
                    createTempFile.delete();
                    return;
                }
                throw new IOException("Failed to rename \"" + createTempFile.getAbsolutePath() + "\" to \"" + file.getAbsolutePath() + "\"");
            }
            throw new IOException("Failed to mark readonly \"" + createTempFile.getAbsolutePath() + "\" (tmp of \"" + file.getAbsolutePath() + "\")");
        } catch (Throwable th) {
            C0089b.m374a(inputStream);
            createTempFile.delete();
        }
    }

    private static boolean m376a(Context context, File file, long j, String str) {
        SharedPreferences a = C0089b.m370a(context);
        return (a.getLong(new StringBuilder().append(str).append("timestamp").toString(), -1) == C0089b.m369a(file) && a.getLong(str + "crc", -1) == j) ? false : true;
    }

    private static long m377b(File file) {
        long a = C0091c.m380a(file);
        return a == -1 ? a - 1 : a;
    }

    private void m378b() {
        File[] listFiles = this.f415c.listFiles(new C00871(this));
        if (listFiles == null) {
            Log.w("MultiDex", "Failed to list secondary dex dir content (" + this.f415c.getPath() + ").");
            return;
        }
        for (File file : listFiles) {
            Log.i("MultiDex", "Trying to delete old file " + file.getPath() + " of size " + file.length());
            if (file.delete()) {
                Log.i("MultiDex", "Deleted old file " + file.getPath());
            } else {
                Log.w("MultiDex", "Failed to delete old file " + file.getPath());
            }
        }
    }

    List<? extends File> m379a(Context context, String str, boolean z) {
        Log.i("MultiDex", "MultiDexExtractor.load(" + this.f413a.getPath() + ", " + z + ", " + str + ")");
        if (this.f418f.isValid()) {
            List<? extends File> a;
            if (z || C0089b.m376a(context, this.f413a, this.f414b, str)) {
                if (z) {
                    Log.i("MultiDex", "Forced extraction must be performed.");
                } else {
                    Log.i("MultiDex", "Detected that extraction must be performed.");
                }
                a = m371a();
                C0089b.m373a(context, str, C0089b.m369a(this.f413a), this.f414b, a);
            } else {
                try {
                    a = m372a(context, str);
                } catch (Throwable e) {
                    Log.w("MultiDex", "Failed to reload existing extracted secondary dex files, falling back to fresh extraction", e);
                    a = m371a();
                    C0089b.m373a(context, str, C0089b.m369a(this.f413a), this.f414b, a);
                }
            }
            Log.i("MultiDex", "load found " + a.size() + " secondary dex files");
            return a;
        }
        throw new IllegalStateException("MultiDexExtractor was closed");
    }

    public void close() {
        this.f418f.release();
        this.f417e.close();
        this.f416d.close();
    }
}
