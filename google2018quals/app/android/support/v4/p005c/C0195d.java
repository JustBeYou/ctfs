package android.support.v4.p005c;

import android.os.ParcelFileDescriptor;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import java.io.File;

class C0195d extends C0194g {
    C0195d() {
    }

    private File m993a(ParcelFileDescriptor parcelFileDescriptor) {
        try {
            String readlink = Os.readlink("/proc/self/fd/" + parcelFileDescriptor.getFd());
            return OsConstants.S_ISREG(Os.stat(readlink).st_mode) ? new File(readlink) : null;
        } catch (ErrnoException e) {
            return null;
        }
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public android.graphics.Typeface mo89a(android.content.Context r8, android.os.CancellationSignal r9, android.support.v4.p015f.C0220b.C0219b[] r10, int r11) {
        /*
        r7 = this;
        r0 = 0;
        r1 = r10.length;
        r2 = 1;
        if (r1 >= r2) goto L_0x0006;
    L_0x0005:
        return r0;
    L_0x0006:
        r1 = r7.m992a(r10, r11);
        r2 = r8.getContentResolver();
        r1 = r1.m1054a();	 Catch:{ IOException -> 0x0056 }
        r3 = "r";
        r3 = r2.openFileDescriptor(r1, r3, r9);	 Catch:{ IOException -> 0x0056 }
        r2 = 0;
        r1 = r7.m993a(r3);	 Catch:{ Throwable -> 0x0048, all -> 0x005c }
        if (r1 == 0) goto L_0x0025;
    L_0x001f:
        r4 = r1.canRead();	 Catch:{ Throwable -> 0x0048, all -> 0x005c }
        if (r4 != 0) goto L_0x007c;
    L_0x0025:
        r4 = new java.io.FileInputStream;	 Catch:{ Throwable -> 0x0048, all -> 0x005c }
        r1 = r3.getFileDescriptor();	 Catch:{ Throwable -> 0x0048, all -> 0x005c }
        r4.<init>(r1);	 Catch:{ Throwable -> 0x0048, all -> 0x005c }
        r5 = 0;
        r1 = super.m991a(r8, r4);	 Catch:{ Throwable -> 0x0068, all -> 0x009c }
        if (r4 == 0) goto L_0x003a;
    L_0x0035:
        if (r0 == 0) goto L_0x0058;
    L_0x0037:
        r4.close();	 Catch:{ Throwable -> 0x0043, all -> 0x005c }
    L_0x003a:
        if (r3 == 0) goto L_0x0041;
    L_0x003c:
        if (r0 == 0) goto L_0x0064;
    L_0x003e:
        r3.close();	 Catch:{ Throwable -> 0x005f }
    L_0x0041:
        r0 = r1;
        goto L_0x0005;
    L_0x0043:
        r4 = move-exception;
        r5.addSuppressed(r4);	 Catch:{ Throwable -> 0x0048, all -> 0x005c }
        goto L_0x003a;
    L_0x0048:
        r1 = move-exception;
        throw r1;	 Catch:{ all -> 0x004a }
    L_0x004a:
        r2 = move-exception;
        r6 = r2;
        r2 = r1;
        r1 = r6;
    L_0x004e:
        if (r3 == 0) goto L_0x0055;
    L_0x0050:
        if (r2 == 0) goto L_0x0098;
    L_0x0052:
        r3.close();	 Catch:{ Throwable -> 0x0093 }
    L_0x0055:
        throw r1;	 Catch:{ IOException -> 0x0056 }
    L_0x0056:
        r1 = move-exception;
        goto L_0x0005;
    L_0x0058:
        r4.close();	 Catch:{ Throwable -> 0x0048, all -> 0x005c }
        goto L_0x003a;
    L_0x005c:
        r1 = move-exception;
        r2 = r0;
        goto L_0x004e;
    L_0x005f:
        r3 = move-exception;
        r2.addSuppressed(r3);	 Catch:{ IOException -> 0x0056 }
        goto L_0x0041;
    L_0x0064:
        r3.close();	 Catch:{ IOException -> 0x0056 }
        goto L_0x0041;
    L_0x0068:
        r2 = move-exception;
        throw r2;	 Catch:{ all -> 0x006a }
    L_0x006a:
        r1 = move-exception;
    L_0x006b:
        if (r4 == 0) goto L_0x0072;
    L_0x006d:
        if (r2 == 0) goto L_0x0078;
    L_0x006f:
        r4.close();	 Catch:{ Throwable -> 0x0073, all -> 0x005c }
    L_0x0072:
        throw r1;	 Catch:{ Throwable -> 0x0048, all -> 0x005c }
    L_0x0073:
        r4 = move-exception;
        r2.addSuppressed(r4);	 Catch:{ Throwable -> 0x0048, all -> 0x005c }
        goto L_0x0072;
    L_0x0078:
        r4.close();	 Catch:{ Throwable -> 0x0048, all -> 0x005c }
        goto L_0x0072;
    L_0x007c:
        r1 = android.graphics.Typeface.createFromFile(r1);	 Catch:{ Throwable -> 0x0048, all -> 0x005c }
        if (r3 == 0) goto L_0x0087;
    L_0x0082:
        if (r0 == 0) goto L_0x008f;
    L_0x0084:
        r3.close();	 Catch:{ Throwable -> 0x008a }
    L_0x0087:
        r0 = r1;
        goto L_0x0005;
    L_0x008a:
        r3 = move-exception;
        r2.addSuppressed(r3);	 Catch:{ IOException -> 0x0056 }
        goto L_0x0087;
    L_0x008f:
        r3.close();	 Catch:{ IOException -> 0x0056 }
        goto L_0x0087;
    L_0x0093:
        r3 = move-exception;
        r2.addSuppressed(r3);	 Catch:{ IOException -> 0x0056 }
        goto L_0x0055;
    L_0x0098:
        r3.close();	 Catch:{ IOException -> 0x0056 }
        goto L_0x0055;
    L_0x009c:
        r1 = move-exception;
        r2 = r0;
        goto L_0x006b;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.c.d.a(android.content.Context, android.os.CancellationSignal, android.support.v4.f.b$b[], int):android.graphics.Typeface");
    }
}
