package android.support.v4.p017h;

import android.os.Build.VERSION;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.LayoutInflater.Factory;
import android.view.LayoutInflater.Factory2;
import java.lang.reflect.Field;

public final class C0290e {
    static final C0288b f917a;
    private static Field f918b;
    private static boolean f919c;

    static class C0288b {
        C0288b() {
        }

        public void mo119a(LayoutInflater layoutInflater, Factory2 factory2) {
            layoutInflater.setFactory2(factory2);
            Factory factory = layoutInflater.getFactory();
            if (factory instanceof Factory2) {
                C0290e.m1272a(layoutInflater, (Factory2) factory);
            } else {
                C0290e.m1272a(layoutInflater, factory2);
            }
        }
    }

    static class C0289a extends C0288b {
        C0289a() {
        }

        public void mo119a(LayoutInflater layoutInflater, Factory2 factory2) {
            layoutInflater.setFactory2(factory2);
        }
    }

    static {
        if (VERSION.SDK_INT >= 21) {
            f917a = new C0289a();
        } else {
            f917a = new C0288b();
        }
    }

    static void m1272a(LayoutInflater layoutInflater, Factory2 factory2) {
        if (!f919c) {
            try {
                f918b = LayoutInflater.class.getDeclaredField("mFactory2");
                f918b.setAccessible(true);
            } catch (Throwable e) {
                Log.e("LayoutInflaterCompatHC", "forceSetFactory2 Could not find field 'mFactory2' on class " + LayoutInflater.class.getName() + "; inflation may have unexpected results.", e);
            }
            f919c = true;
        }
        if (f918b != null) {
            try {
                f918b.set(layoutInflater, factory2);
            } catch (Throwable e2) {
                Log.e("LayoutInflaterCompatHC", "forceSetFactory2 could not set the Factory2 on LayoutInflater " + layoutInflater + "; inflation may have unexpected results.", e2);
            }
        }
    }

    public static void m1273b(LayoutInflater layoutInflater, Factory2 factory2) {
        f917a.mo119a(layoutInflater, factory2);
    }
}
