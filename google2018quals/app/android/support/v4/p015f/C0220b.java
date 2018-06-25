package android.support.v4.p015f;

import android.content.ContentUris;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.ProviderInfo;
import android.content.pm.Signature;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Typeface;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Build.VERSION;
import android.os.CancellationSignal;
import android.support.v4.p005c.C0193c;
import android.support.v4.p005c.C0201h;
import android.support.v4.p009b.p011a.C0169a;
import android.support.v4.p015f.C0225c.C0214a;
import android.support.v4.p016g.C0228k;
import android.support.v4.p016g.C0236g;
import android.support.v4.p016g.C0243j;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;

public class C0220b {
    private static final C0236g<String, Typeface> f800a = new C0236g(16);
    private static final C0225c f801b = new C0225c("fonts", 10, 10000);
    private static final Object f802c = new Object();
    private static final C0228k<String, ArrayList<C0214a<Typeface>>> f803d = new C0228k();
    private static final Comparator<byte[]> f804e = new C02174();

    static class C02174 implements Comparator<byte[]> {
        C02174() {
        }

        public int m1051a(byte[] bArr, byte[] bArr2) {
            if (bArr.length != bArr2.length) {
                return bArr.length - bArr2.length;
            }
            for (int i = 0; i < bArr.length; i++) {
                if (bArr[i] != bArr2[i]) {
                    return bArr[i] - bArr2[i];
                }
            }
            return 0;
        }

        public /* synthetic */ int compare(Object obj, Object obj2) {
            return m1051a((byte[]) obj, (byte[]) obj2);
        }
    }

    public static class C0218a {
        private final int f793a;
        private final C0219b[] f794b;

        public C0218a(int i, C0219b[] c0219bArr) {
            this.f793a = i;
            this.f794b = c0219bArr;
        }

        public int m1052a() {
            return this.f793a;
        }

        public C0219b[] m1053b() {
            return this.f794b;
        }
    }

    public static class C0219b {
        private final Uri f795a;
        private final int f796b;
        private final int f797c;
        private final boolean f798d;
        private final int f799e;

        public C0219b(Uri uri, int i, int i2, boolean z, int i3) {
            this.f795a = (Uri) C0243j.m1166a(uri);
            this.f796b = i;
            this.f797c = i2;
            this.f798d = z;
            this.f799e = i3;
        }

        public Uri m1054a() {
            return this.f795a;
        }

        public int m1055b() {
            return this.f796b;
        }

        public int m1056c() {
            return this.f797c;
        }

        public boolean m1057d() {
            return this.f798d;
        }

        public int m1058e() {
            return this.f799e;
        }
    }

    public static ProviderInfo m1059a(PackageManager packageManager, C0212a c0212a, Resources resources) {
        String a = c0212a.m1039a();
        ProviderInfo resolveContentProvider = packageManager.resolveContentProvider(a, 0);
        if (resolveContentProvider == null) {
            throw new NameNotFoundException("No package found for authority: " + a);
        } else if (resolveContentProvider.packageName.equals(c0212a.m1040b())) {
            List a2 = C0220b.m1065a(packageManager.getPackageInfo(resolveContentProvider.packageName, 64).signatures);
            Collections.sort(a2, f804e);
            List a3 = C0220b.m1064a(c0212a, resources);
            for (int i = 0; i < a3.size(); i++) {
                List arrayList = new ArrayList((Collection) a3.get(i));
                Collections.sort(arrayList, f804e);
                if (C0220b.m1067a(a2, arrayList)) {
                    return resolveContentProvider;
                }
            }
            return null;
        } else {
            throw new NameNotFoundException("Found content provider " + a + ", but package was not " + c0212a.m1040b());
        }
    }

    public static Typeface m1061a(final Context context, final C0212a c0212a, final TextView textView, int i, int i2, final int i3) {
        final Object obj = c0212a.m1044f() + "-" + i3;
        Typeface typeface = (Typeface) f800a.m1157a(obj);
        if (typeface != null) {
            return typeface;
        }
        Object obj2 = i == 0 ? 1 : null;
        if (obj2 != null && i2 == -1) {
            return C0220b.m1069b(context, c0212a, i3);
        }
        Callable c02131 = new Callable<Typeface>() {
            public Typeface m1045a() {
                Typeface a = C0220b.m1069b(context, c0212a, i3);
                if (a != null) {
                    C0220b.f800a.m1158a(obj, a);
                }
                return a;
            }

            public /* synthetic */ Object call() {
                return m1045a();
            }
        };
        if (obj2 != null) {
            try {
                return (Typeface) f801b.m1077a(c02131, i2);
            } catch (InterruptedException e) {
                return null;
            }
        }
        final WeakReference weakReference = new WeakReference(textView);
        C02152 c02152 = new C0214a<Typeface>() {
            public void m1047a(Typeface typeface) {
                if (((TextView) weakReference.get()) != null) {
                    textView.setTypeface(typeface, i3);
                }
            }
        };
        synchronized (f802c) {
            if (f803d.containsKey(obj)) {
                ((ArrayList) f803d.get(obj)).add(c02152);
                return null;
            }
            ArrayList arrayList = new ArrayList();
            arrayList.add(c02152);
            f803d.put(obj, arrayList);
            f801b.m1078a(c02131, new C0214a<Typeface>() {
                public void m1049a(Typeface typeface) {
                    synchronized (C0220b.f802c) {
                        ArrayList arrayList = (ArrayList) C0220b.f803d.get(obj);
                        C0220b.f803d.remove(obj);
                    }
                    for (int i = 0; i < arrayList.size(); i++) {
                        ((C0214a) arrayList.get(i)).mo94a(typeface);
                    }
                }
            });
            return null;
        }
    }

    public static C0218a m1062a(Context context, CancellationSignal cancellationSignal, C0212a c0212a) {
        ProviderInfo a = C0220b.m1059a(context.getPackageManager(), c0212a, context.getResources());
        return a == null ? new C0218a(1, null) : new C0218a(0, C0220b.m1068a(context, c0212a, a.authority, cancellationSignal));
    }

    private static List<List<byte[]>> m1064a(C0212a c0212a, Resources resources) {
        return c0212a.m1042d() != null ? c0212a.m1042d() : C0169a.m861a(resources, c0212a.m1043e());
    }

    private static List<byte[]> m1065a(Signature[] signatureArr) {
        List<byte[]> arrayList = new ArrayList();
        for (Signature toByteArray : signatureArr) {
            arrayList.add(toByteArray.toByteArray());
        }
        return arrayList;
    }

    public static Map<Uri, ByteBuffer> m1066a(Context context, C0219b[] c0219bArr, CancellationSignal cancellationSignal) {
        Map hashMap = new HashMap();
        for (C0219b c0219b : c0219bArr) {
            if (c0219b.m1058e() == 0) {
                Uri a = c0219b.m1054a();
                if (!hashMap.containsKey(a)) {
                    hashMap.put(a, C0201h.m1023a(context, cancellationSignal, a));
                }
            }
        }
        return Collections.unmodifiableMap(hashMap);
    }

    private static boolean m1067a(List<byte[]> list, List<byte[]> list2) {
        if (list.size() != list2.size()) {
            return false;
        }
        for (int i = 0; i < list.size(); i++) {
            if (!Arrays.equals((byte[]) list.get(i), (byte[]) list2.get(i))) {
                return false;
            }
        }
        return true;
    }

    static C0219b[] m1068a(Context context, C0212a c0212a, String str, CancellationSignal cancellationSignal) {
        Throwable th;
        Cursor cursor;
        ArrayList arrayList = new ArrayList();
        Uri build = new Builder().scheme("content").authority(str).build();
        Uri build2 = new Builder().scheme("content").authority(str).appendPath("file").build();
        try {
            ArrayList arrayList2;
            Cursor query = VERSION.SDK_INT > 16 ? context.getContentResolver().query(build, new String[]{"_id", "file_id", "font_ttc_index", "font_variation_settings", "font_weight", "font_italic", "result_code"}, "query = ?", new String[]{c0212a.m1041c()}, null, cancellationSignal) : context.getContentResolver().query(build, new String[]{"_id", "file_id", "font_ttc_index", "font_variation_settings", "font_weight", "font_italic", "result_code"}, "query = ?", new String[]{c0212a.m1041c()}, null);
            if (query != null) {
                try {
                    if (query.getCount() > 0) {
                        int columnIndex = query.getColumnIndex("result_code");
                        arrayList2 = new ArrayList();
                        int columnIndex2 = query.getColumnIndex("_id");
                        int columnIndex3 = query.getColumnIndex("file_id");
                        int columnIndex4 = query.getColumnIndex("font_ttc_index");
                        int columnIndex5 = query.getColumnIndex("font_weight");
                        int columnIndex6 = query.getColumnIndex("font_italic");
                        while (query.moveToNext()) {
                            int i = columnIndex != -1 ? query.getInt(columnIndex) : 0;
                            int i2 = columnIndex4 != -1 ? query.getInt(columnIndex4) : 0;
                            Uri withAppendedId = columnIndex3 == -1 ? ContentUris.withAppendedId(build, query.getLong(columnIndex2)) : ContentUris.withAppendedId(build2, query.getLong(columnIndex3));
                            int i3 = columnIndex5 != -1 ? query.getInt(columnIndex5) : 400;
                            boolean z = columnIndex6 != -1 && query.getInt(columnIndex6) == 1;
                            arrayList2.add(new C0219b(withAppendedId, i2, i3, z, i));
                        }
                        if (query != null) {
                            query.close();
                        }
                        return (C0219b[]) arrayList2.toArray(new C0219b[0]);
                    }
                } catch (Throwable th2) {
                    th = th2;
                    cursor = query;
                }
            }
            arrayList2 = arrayList;
            if (query != null) {
                query.close();
            }
            return (C0219b[]) arrayList2.toArray(new C0219b[0]);
        } catch (Throwable th3) {
            th = th3;
            cursor = null;
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    private static Typeface m1069b(Context context, C0212a c0212a, int i) {
        try {
            C0218a a = C0220b.m1062a(context, null, c0212a);
            return a.m1052a() == 0 ? C0193c.m982a(context, null, a.m1053b(), i) : null;
        } catch (NameNotFoundException e) {
            return null;
        }
    }
}
