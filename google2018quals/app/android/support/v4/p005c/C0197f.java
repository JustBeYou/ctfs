package android.support.v4.p005c;

import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.graphics.Typeface.Builder;
import android.graphics.fonts.FontVariationAxis;
import android.os.CancellationSignal;
import android.os.ParcelFileDescriptor;
import android.support.v4.p009b.p011a.C0169a.C0166b;
import android.support.v4.p009b.p011a.C0169a.C0167c;
import android.support.v4.p015f.C0220b;
import android.support.v4.p015f.C0220b.C0219b;
import android.util.Log;
import java.io.IOException;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.util.Map;

public class C0197f extends C0195d {
    private static final Class f762a;
    private static final Constructor f763b;
    private static final Method f764c;
    private static final Method f765d;
    private static final Method f766e;
    private static final Method f767f;
    private static final Method f768g;

    static {
        Method method;
        Method method2;
        Method method3;
        Method declaredMethod;
        Constructor constructor;
        Class cls;
        Throwable e;
        Method method4 = null;
        try {
            Class cls2 = Class.forName("android.graphics.FontFamily");
            Constructor constructor2 = cls2.getConstructor(new Class[0]);
            Method method5 = cls2.getMethod("addFontFromAssetManager", new Class[]{AssetManager.class, String.class, Integer.TYPE, Boolean.TYPE, Integer.TYPE, Integer.TYPE, Integer.TYPE, FontVariationAxis[].class});
            method = cls2.getMethod("addFontFromBuffer", new Class[]{ByteBuffer.class, Integer.TYPE, FontVariationAxis[].class, Integer.TYPE, Integer.TYPE});
            method2 = cls2.getMethod("freeze", new Class[0]);
            method3 = cls2.getMethod("abortCreation", new Class[0]);
            declaredMethod = Typeface.class.getDeclaredMethod("createFromFamiliesWithDefault", new Class[]{Array.newInstance(cls2, 1).getClass(), Integer.TYPE, Integer.TYPE});
            declaredMethod.setAccessible(true);
            method4 = method3;
            method3 = method2;
            method2 = method;
            method = method5;
            constructor = constructor2;
            cls = cls2;
        } catch (ClassNotFoundException e2) {
            e = e2;
            Log.e("TypefaceCompatApi26Impl", "Unable to collect necessary methods for class " + e.getClass().getName(), e);
            declaredMethod = null;
            method3 = null;
            method2 = null;
            method = null;
            constructor = null;
            cls = null;
            f763b = constructor;
            f762a = cls;
            f764c = method;
            f765d = method2;
            f766e = method3;
            f767f = method4;
            f768g = declaredMethod;
        } catch (NoSuchMethodException e3) {
            e = e3;
            Log.e("TypefaceCompatApi26Impl", "Unable to collect necessary methods for class " + e.getClass().getName(), e);
            declaredMethod = null;
            method3 = null;
            method2 = null;
            method = null;
            constructor = null;
            cls = null;
            f763b = constructor;
            f762a = cls;
            f764c = method;
            f765d = method2;
            f766e = method3;
            f767f = method4;
            f768g = declaredMethod;
        }
        f763b = constructor;
        f762a = cls;
        f764c = method;
        f765d = method2;
        f766e = method3;
        f767f = method4;
        f768g = declaredMethod;
    }

    private static Typeface m1001a(Object obj) {
        Throwable e;
        try {
            Array.set(Array.newInstance(f762a, 1), 0, obj);
            return (Typeface) f768g.invoke(null, new Object[]{r0, Integer.valueOf(-1), Integer.valueOf(-1)});
        } catch (IllegalAccessException e2) {
            e = e2;
            throw new RuntimeException(e);
        } catch (InvocationTargetException e3) {
            e = e3;
            throw new RuntimeException(e);
        }
    }

    private static boolean m1002a() {
        if (f764c == null) {
            Log.w("TypefaceCompatApi26Impl", "Unable to collect necessary private methods.Fallback to legacy implementation.");
        }
        return f764c != null;
    }

    private static boolean m1003a(Context context, Object obj, String str, int i, int i2, int i3) {
        Throwable e;
        try {
            return ((Boolean) f764c.invoke(obj, new Object[]{context.getAssets(), str, Integer.valueOf(0), Boolean.valueOf(false), Integer.valueOf(i), Integer.valueOf(i2), Integer.valueOf(i3), null})).booleanValue();
        } catch (IllegalAccessException e2) {
            e = e2;
            throw new RuntimeException(e);
        } catch (InvocationTargetException e3) {
            e = e3;
            throw new RuntimeException(e);
        }
    }

    private static boolean m1004a(Object obj, ByteBuffer byteBuffer, int i, int i2, int i3) {
        Throwable e;
        try {
            return ((Boolean) f765d.invoke(obj, new Object[]{byteBuffer, Integer.valueOf(i), null, Integer.valueOf(i2), Integer.valueOf(i3)})).booleanValue();
        } catch (IllegalAccessException e2) {
            e = e2;
            throw new RuntimeException(e);
        } catch (InvocationTargetException e3) {
            e = e3;
            throw new RuntimeException(e);
        }
    }

    private static Object m1005b() {
        Throwable e;
        try {
            return f763b.newInstance(new Object[0]);
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

    private static boolean m1006b(Object obj) {
        Throwable e;
        try {
            return ((Boolean) f766e.invoke(obj, new Object[0])).booleanValue();
        } catch (IllegalAccessException e2) {
            e = e2;
            throw new RuntimeException(e);
        } catch (InvocationTargetException e3) {
            e = e3;
            throw new RuntimeException(e);
        }
    }

    private static boolean m1007c(Object obj) {
        Throwable e;
        try {
            return ((Boolean) f767f.invoke(obj, new Object[0])).booleanValue();
        } catch (IllegalAccessException e2) {
            e = e2;
            throw new RuntimeException(e);
        } catch (InvocationTargetException e3) {
            e = e3;
            throw new RuntimeException(e);
        }
    }

    public Typeface mo88a(Context context, Resources resources, int i, String str, int i2) {
        if (!C0197f.m1002a()) {
            return super.mo88a(context, resources, i, str, i2);
        }
        Object b = C0197f.m1005b();
        if (C0197f.m1003a(context, b, str, 0, -1, -1)) {
            return !C0197f.m1006b(b) ? null : C0197f.m1001a(b);
        } else {
            C0197f.m1007c(b);
            return null;
        }
    }

    public Typeface mo89a(Context context, CancellationSignal cancellationSignal, C0219b[] c0219bArr, int i) {
        ParcelFileDescriptor openFileDescriptor;
        Throwable th;
        Throwable th2;
        if (c0219bArr.length < 1) {
            return null;
        }
        if (C0197f.m1002a()) {
            Map a = C0220b.m1066a(context, c0219bArr, cancellationSignal);
            Object b = C0197f.m1005b();
            Object obj = null;
            int length = c0219bArr.length;
            int i2 = 0;
            while (i2 < length) {
                Object obj2;
                C0219b c0219b = c0219bArr[i2];
                ByteBuffer byteBuffer = (ByteBuffer) a.get(c0219b.m1054a());
                if (byteBuffer == null) {
                    obj2 = obj;
                } else {
                    if (C0197f.m1004a(b, byteBuffer, c0219b.m1055b(), c0219b.m1056c(), c0219b.m1057d() ? 1 : 0)) {
                        obj2 = 1;
                    } else {
                        C0197f.m1007c(b);
                        return null;
                    }
                }
                i2++;
                obj = obj2;
            }
            if (obj != null) {
                return !C0197f.m1006b(b) ? null : C0197f.m1001a(b);
            } else {
                C0197f.m1007c(b);
                return null;
            }
        }
        C0219b a2 = m992a(c0219bArr, i);
        try {
            openFileDescriptor = context.getContentResolver().openFileDescriptor(a2.m1054a(), "r", cancellationSignal);
            th = null;
            try {
                Typeface build = new Builder(openFileDescriptor.getFileDescriptor()).setWeight(a2.m1056c()).setItalic(a2.m1057d()).build();
                if (openFileDescriptor == null) {
                    return build;
                }
                if (th != null) {
                    try {
                        openFileDescriptor.close();
                        return build;
                    } catch (Throwable th3) {
                        th.addSuppressed(th3);
                        return build;
                    }
                }
                openFileDescriptor.close();
                return build;
            } catch (Throwable th4) {
                Throwable th5 = th4;
                th4 = th2;
                th2 = th5;
            }
        } catch (IOException e) {
            return null;
        }
        if (openFileDescriptor != null) {
            if (th4 != null) {
                try {
                    openFileDescriptor.close();
                } catch (Throwable th32) {
                    th4.addSuppressed(th32);
                }
            } else {
                openFileDescriptor.close();
            }
        }
        throw th2;
        throw th2;
    }

    public Typeface mo90a(Context context, C0166b c0166b, Resources resources, int i) {
        if (!C0197f.m1002a()) {
            return super.mo90a(context, c0166b, resources, i);
        }
        Object b = C0197f.m1005b();
        C0167c[] a = c0166b.m852a();
        int length = a.length;
        int i2 = 0;
        while (i2 < length) {
            C0167c c0167c = a[i2];
            if (C0197f.m1003a(context, b, c0167c.m853a(), 0, c0167c.m854b(), c0167c.m855c() ? 1 : 0)) {
                i2++;
            } else {
                C0197f.m1007c(b);
                return null;
            }
        }
        return !C0197f.m1006b(b) ? null : C0197f.m1001a(b);
    }
}
