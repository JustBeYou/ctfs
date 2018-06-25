package android.support.v7.p021b.p022a;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.support.v4.p009b.C0092a;
import android.support.v7.widget.C0623l;
import android.util.Log;
import android.util.SparseArray;
import android.util.TypedValue;
import java.util.WeakHashMap;

public final class C0485b {
    private static final ThreadLocal<TypedValue> f1422a = new ThreadLocal();
    private static final WeakHashMap<Context, SparseArray<C0484a>> f1423b = new WeakHashMap(0);
    private static final Object f1424c = new Object();

    private static class C0484a {
        final ColorStateList f1420a;
        final Configuration f1421b;

        C0484a(ColorStateList colorStateList, Configuration configuration) {
            this.f1420a = colorStateList;
            this.f1421b = configuration;
        }
    }

    public static ColorStateList m2211a(Context context, int i) {
        if (VERSION.SDK_INT >= 23) {
            return context.getColorStateList(i);
        }
        ColorStateList d = C0485b.m2216d(context, i);
        if (d != null) {
            return d;
        }
        d = C0485b.m2215c(context, i);
        if (d == null) {
            return C0092a.m385b(context, i);
        }
        C0485b.m2213a(context, i, d);
        return d;
    }

    private static TypedValue m2212a() {
        TypedValue typedValue = (TypedValue) f1422a.get();
        if (typedValue != null) {
            return typedValue;
        }
        typedValue = new TypedValue();
        f1422a.set(typedValue);
        return typedValue;
    }

    private static void m2213a(Context context, int i, ColorStateList colorStateList) {
        synchronized (f1424c) {
            SparseArray sparseArray = (SparseArray) f1423b.get(context);
            if (sparseArray == null) {
                sparseArray = new SparseArray();
                f1423b.put(context, sparseArray);
            }
            sparseArray.append(i, new C0484a(colorStateList, context.getResources().getConfiguration()));
        }
    }

    public static Drawable m2214b(Context context, int i) {
        return C0623l.m3126a().m3145a(context, i);
    }

    private static ColorStateList m2215c(Context context, int i) {
        ColorStateList colorStateList = null;
        if (!C0485b.m2217e(context, i)) {
            Resources resources = context.getResources();
            try {
                colorStateList = C0483a.m2207a(resources, resources.getXml(i), context.getTheme());
            } catch (Throwable e) {
                Log.e("AppCompatResources", "Failed to inflate ColorStateList, leaving it to the framework", e);
            }
        }
        return colorStateList;
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static android.content.res.ColorStateList m2216d(android.content.Context r5, int r6) {
        /*
        r2 = f1424c;
        monitor-enter(r2);
        r0 = f1423b;	 Catch:{ all -> 0x0035 }
        r0 = r0.get(r5);	 Catch:{ all -> 0x0035 }
        r0 = (android.util.SparseArray) r0;	 Catch:{ all -> 0x0035 }
        if (r0 == 0) goto L_0x0032;
    L_0x000d:
        r1 = r0.size();	 Catch:{ all -> 0x0035 }
        if (r1 <= 0) goto L_0x0032;
    L_0x0013:
        r1 = r0.get(r6);	 Catch:{ all -> 0x0035 }
        r1 = (android.support.v7.p021b.p022a.C0485b.C0484a) r1;	 Catch:{ all -> 0x0035 }
        if (r1 == 0) goto L_0x0032;
    L_0x001b:
        r3 = r1.f1421b;	 Catch:{ all -> 0x0035 }
        r4 = r5.getResources();	 Catch:{ all -> 0x0035 }
        r4 = r4.getConfiguration();	 Catch:{ all -> 0x0035 }
        r3 = r3.equals(r4);	 Catch:{ all -> 0x0035 }
        if (r3 == 0) goto L_0x002f;
    L_0x002b:
        r0 = r1.f1420a;	 Catch:{ all -> 0x0035 }
        monitor-exit(r2);	 Catch:{ all -> 0x0035 }
    L_0x002e:
        return r0;
    L_0x002f:
        r0.remove(r6);	 Catch:{ all -> 0x0035 }
    L_0x0032:
        monitor-exit(r2);	 Catch:{ all -> 0x0035 }
        r0 = 0;
        goto L_0x002e;
    L_0x0035:
        r0 = move-exception;
        monitor-exit(r2);	 Catch:{ all -> 0x0035 }
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v7.b.a.b.d(android.content.Context, int):android.content.res.ColorStateList");
    }

    private static boolean m2217e(Context context, int i) {
        Resources resources = context.getResources();
        TypedValue a = C0485b.m2212a();
        resources.getValue(i, a, true);
        return a.type >= 28 && a.type <= 31;
    }
}
