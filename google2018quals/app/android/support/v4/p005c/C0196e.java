package android.support.v4.p005c;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.CancellationSignal;
import android.support.v4.p009b.p011a.C0169a.C0166b;
import android.support.v4.p009b.p011a.C0169a.C0167c;
import android.support.v4.p015f.C0220b.C0219b;
import android.support.v4.p016g.C0228k;
import android.util.Log;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.util.List;

class C0196e extends C0194g {
    private static final Class f758a;
    private static final Constructor f759b;
    private static final Method f760c;
    private static final Method f761d;

    static {
        Method method;
        Constructor constructor;
        Class cls;
        Throwable e;
        Method method2 = null;
        try {
            Class cls2 = Class.forName("android.graphics.FontFamily");
            Constructor constructor2 = cls2.getConstructor(new Class[0]);
            Method method3 = cls2.getMethod("addFontWeightStyle", new Class[]{ByteBuffer.class, Integer.TYPE, List.class, Integer.TYPE, Boolean.TYPE});
            method = Typeface.class.getMethod("createFromFamiliesWithDefault", new Class[]{Array.newInstance(cls2, 1).getClass()});
            method2 = method3;
            constructor = constructor2;
            cls = cls2;
        } catch (ClassNotFoundException e2) {
            e = e2;
            Log.e("TypefaceCompatApi24Impl", e.getClass().getName(), e);
            method = null;
            constructor = null;
            cls = null;
            f759b = constructor;
            f758a = cls;
            f760c = method2;
            f761d = method;
        } catch (NoSuchMethodException e3) {
            e = e3;
            Log.e("TypefaceCompatApi24Impl", e.getClass().getName(), e);
            method = null;
            constructor = null;
            cls = null;
            f759b = constructor;
            f758a = cls;
            f760c = method2;
            f761d = method;
        }
        f759b = constructor;
        f758a = cls;
        f760c = method2;
        f761d = method;
    }

    C0196e() {
    }

    private static Typeface m995a(Object obj) {
        Throwable e;
        try {
            Array.set(Array.newInstance(f758a, 1), 0, obj);
            return (Typeface) f761d.invoke(null, new Object[]{r0});
        } catch (IllegalAccessException e2) {
            e = e2;
            throw new RuntimeException(e);
        } catch (InvocationTargetException e3) {
            e = e3;
            throw new RuntimeException(e);
        }
    }

    public static boolean m996a() {
        if (f760c == null) {
            Log.w("TypefaceCompatApi24Impl", "Unable to collect necessary private methods.Fallback to legacy implementation.");
        }
        return f760c != null;
    }

    private static boolean m997a(Object obj, ByteBuffer byteBuffer, int i, int i2, boolean z) {
        Throwable e;
        try {
            return ((Boolean) f760c.invoke(obj, new Object[]{byteBuffer, Integer.valueOf(i), null, Integer.valueOf(i2), Boolean.valueOf(z)})).booleanValue();
        } catch (IllegalAccessException e2) {
            e = e2;
            throw new RuntimeException(e);
        } catch (InvocationTargetException e3) {
            e = e3;
            throw new RuntimeException(e);
        }
    }

    private static Object m998b() {
        Throwable e;
        try {
            return f759b.newInstance(new Object[0]);
        } catch (IllegalAccessException e2) {
            e = e2;
            throw new RuntimeException(e);
        } catch (InstantiationException e3) {
            e = e3;
            throw new RuntimeException(e);
        } catch (InvocationTargetException e4) {
            e = e4;
            throw new RuntimeException(e);
        }
    }

    public Typeface mo89a(Context context, CancellationSignal cancellationSignal, C0219b[] c0219bArr, int i) {
        Object b = C0196e.m998b();
        C0228k c0228k = new C0228k();
        for (C0219b c0219b : c0219bArr) {
            Uri a = c0219b.m1054a();
            ByteBuffer byteBuffer = (ByteBuffer) c0228k.get(a);
            if (byteBuffer == null) {
                byteBuffer = C0201h.m1023a(context, cancellationSignal, a);
                c0228k.put(a, byteBuffer);
            }
            if (!C0196e.m997a(b, byteBuffer, c0219b.m1055b(), c0219b.m1056c(), c0219b.m1057d())) {
                return null;
            }
        }
        return C0196e.m995a(b);
    }

    public Typeface mo90a(Context context, C0166b c0166b, Resources resources, int i) {
        Object b = C0196e.m998b();
        for (C0167c c0167c : c0166b.m852a()) {
            if (!C0196e.m997a(b, C0201h.m1022a(context, resources, c0167c.m856d()), 0, c0167c.m854b(), c0167c.m855c())) {
                return null;
            }
        }
        return C0196e.m995a(b);
    }
}
