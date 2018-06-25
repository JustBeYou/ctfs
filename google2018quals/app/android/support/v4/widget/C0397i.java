package android.support.v4.widget;

import android.os.Build.VERSION;
import android.support.v4.p017h.C0287d;
import android.support.v4.p017h.C0315p;
import android.util.Log;
import android.view.View;
import android.widget.PopupWindow;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public final class C0397i {
    static final C0393d f1113a;

    static class C0393d {
        private static Method f1110a;
        private static boolean f1111b;

        C0393d() {
        }

        public void mo256a(PopupWindow popupWindow, int i) {
            if (!f1111b) {
                try {
                    f1110a = PopupWindow.class.getDeclaredMethod("setWindowLayoutType", new Class[]{Integer.TYPE});
                    f1110a.setAccessible(true);
                } catch (Exception e) {
                }
                f1111b = true;
            }
            if (f1110a != null) {
                try {
                    f1110a.invoke(popupWindow, new Object[]{Integer.valueOf(i)});
                } catch (Exception e2) {
                }
            }
        }

        public void mo254a(PopupWindow popupWindow, View view, int i, int i2, int i3) {
            if ((C0287d.m1269a(i3, C0315p.m1387b(view)) & 7) == 5) {
                i -= popupWindow.getWidth() - view.getWidth();
            }
            popupWindow.showAsDropDown(view, i, i2);
        }

        public void mo255a(PopupWindow popupWindow, boolean z) {
        }
    }

    static class C0394a extends C0393d {
        C0394a() {
        }

        public void mo254a(PopupWindow popupWindow, View view, int i, int i2, int i3) {
            popupWindow.showAsDropDown(view, i, i2, i3);
        }
    }

    static class C0395b extends C0394a {
        private static Field f1112a;

        static {
            try {
                f1112a = PopupWindow.class.getDeclaredField("mOverlapAnchor");
                f1112a.setAccessible(true);
            } catch (Throwable e) {
                Log.i("PopupWindowCompatApi21", "Could not fetch mOverlapAnchor field from PopupWindow", e);
            }
        }

        C0395b() {
        }

        public void mo255a(PopupWindow popupWindow, boolean z) {
            if (f1112a != null) {
                try {
                    f1112a.set(popupWindow, Boolean.valueOf(z));
                } catch (Throwable e) {
                    Log.i("PopupWindowCompatApi21", "Could not set overlap anchor field in PopupWindow", e);
                }
            }
        }
    }

    static class C0396c extends C0395b {
        C0396c() {
        }

        public void mo256a(PopupWindow popupWindow, int i) {
            popupWindow.setWindowLayoutType(i);
        }

        public void mo255a(PopupWindow popupWindow, boolean z) {
            popupWindow.setOverlapAnchor(z);
        }
    }

    static {
        if (VERSION.SDK_INT >= 23) {
            f1113a = new C0396c();
        } else if (VERSION.SDK_INT >= 21) {
            f1113a = new C0395b();
        } else if (VERSION.SDK_INT >= 19) {
            f1113a = new C0394a();
        } else {
            f1113a = new C0393d();
        }
    }

    public static void m1838a(PopupWindow popupWindow, int i) {
        f1113a.mo256a(popupWindow, i);
    }

    public static void m1839a(PopupWindow popupWindow, View view, int i, int i2, int i3) {
        f1113a.mo254a(popupWindow, view, i, i2, i3);
    }

    public static void m1840a(PopupWindow popupWindow, boolean z) {
        f1113a.mo255a(popupWindow, z);
    }
}
