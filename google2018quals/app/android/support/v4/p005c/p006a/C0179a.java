package android.support.v4.p005c.p006a;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.graphics.ColorFilter;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.util.AttributeSet;
import android.util.Log;
import java.lang.reflect.Method;
import org.xmlpull.v1.XmlPullParser;

public final class C0179a {
    static final C0174e f738a;

    static class C0174e {
        C0174e() {
        }

        public int mo67a(Drawable drawable) {
            return 0;
        }

        public void mo73a(Drawable drawable, float f, float f2) {
        }

        public void mo74a(Drawable drawable, int i, int i2, int i3, int i4) {
        }

        public void mo75a(Drawable drawable, ColorStateList colorStateList) {
            if (drawable instanceof C0029f) {
                ((C0029f) drawable).setTintList(colorStateList);
            }
        }

        public void mo76a(Drawable drawable, Theme theme) {
        }

        public void mo77a(Drawable drawable, Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet, Theme theme) {
            drawable.inflate(resources, xmlPullParser, attributeSet);
        }

        public void mo78a(Drawable drawable, Mode mode) {
            if (drawable instanceof C0029f) {
                ((C0029f) drawable).setTintMode(mode);
            }
        }

        public void mo69a(Drawable drawable, boolean z) {
        }

        public boolean mo68a(Drawable drawable, int i) {
            return false;
        }

        public void mo79b(Drawable drawable, int i) {
            if (drawable instanceof C0029f) {
                ((C0029f) drawable).setTint(i);
            }
        }

        public boolean mo70b(Drawable drawable) {
            return false;
        }

        public Drawable mo71c(Drawable drawable) {
            return !(drawable instanceof C0029f) ? new C0183c(drawable) : drawable;
        }

        public int mo72d(Drawable drawable) {
            return 0;
        }

        public boolean mo80e(Drawable drawable) {
            return false;
        }

        public ColorFilter mo81f(Drawable drawable) {
            return null;
        }

        public void m909g(Drawable drawable) {
            drawable.jumpToCurrentState();
        }
    }

    static class C0175a extends C0174e {
        private static Method f734a;
        private static boolean f735b;
        private static Method f736c;
        private static boolean f737d;

        C0175a() {
        }

        public int mo67a(Drawable drawable) {
            if (!f737d) {
                try {
                    f736c = Drawable.class.getDeclaredMethod("getLayoutDirection", new Class[0]);
                    f736c.setAccessible(true);
                } catch (Throwable e) {
                    Log.i("DrawableCompatApi17", "Failed to retrieve getLayoutDirection() method", e);
                }
                f737d = true;
            }
            if (f736c != null) {
                try {
                    return ((Integer) f736c.invoke(drawable, new Object[0])).intValue();
                } catch (Throwable e2) {
                    Log.i("DrawableCompatApi17", "Failed to invoke getLayoutDirection() via reflection", e2);
                    f736c = null;
                }
            }
            return 0;
        }

        public boolean mo68a(Drawable drawable, int i) {
            if (!f735b) {
                try {
                    f734a = Drawable.class.getDeclaredMethod("setLayoutDirection", new Class[]{Integer.TYPE});
                    f734a.setAccessible(true);
                } catch (Throwable e) {
                    Log.i("DrawableCompatApi17", "Failed to retrieve setLayoutDirection(int) method", e);
                }
                f735b = true;
            }
            if (f734a != null) {
                try {
                    f734a.invoke(drawable, new Object[]{Integer.valueOf(i)});
                    return true;
                } catch (Throwable e2) {
                    Log.i("DrawableCompatApi17", "Failed to invoke setLayoutDirection(int) via reflection", e2);
                    f734a = null;
                }
            }
            return false;
        }
    }

    static class C0176b extends C0175a {
        C0176b() {
        }

        public void mo69a(Drawable drawable, boolean z) {
            drawable.setAutoMirrored(z);
        }

        public boolean mo70b(Drawable drawable) {
            return drawable.isAutoMirrored();
        }

        public Drawable mo71c(Drawable drawable) {
            return !(drawable instanceof C0029f) ? new C0185d(drawable) : drawable;
        }

        public int mo72d(Drawable drawable) {
            return drawable.getAlpha();
        }
    }

    static class C0177c extends C0176b {
        C0177c() {
        }

        public void mo73a(Drawable drawable, float f, float f2) {
            drawable.setHotspot(f, f2);
        }

        public void mo74a(Drawable drawable, int i, int i2, int i3, int i4) {
            drawable.setHotspotBounds(i, i2, i3, i4);
        }

        public void mo75a(Drawable drawable, ColorStateList colorStateList) {
            drawable.setTintList(colorStateList);
        }

        public void mo76a(Drawable drawable, Theme theme) {
            drawable.applyTheme(theme);
        }

        public void mo77a(Drawable drawable, Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet, Theme theme) {
            drawable.inflate(resources, xmlPullParser, attributeSet, theme);
        }

        public void mo78a(Drawable drawable, Mode mode) {
            drawable.setTintMode(mode);
        }

        public void mo79b(Drawable drawable, int i) {
            drawable.setTint(i);
        }

        public Drawable mo71c(Drawable drawable) {
            return !(drawable instanceof C0029f) ? new C0187e(drawable) : drawable;
        }

        public boolean mo80e(Drawable drawable) {
            return drawable.canApplyTheme();
        }

        public ColorFilter mo81f(Drawable drawable) {
            return drawable.getColorFilter();
        }
    }

    static class C0178d extends C0177c {
        C0178d() {
        }

        public int mo67a(Drawable drawable) {
            return drawable.getLayoutDirection();
        }

        public boolean mo68a(Drawable drawable, int i) {
            return drawable.setLayoutDirection(i);
        }

        public Drawable mo71c(Drawable drawable) {
            return drawable;
        }
    }

    static {
        if (VERSION.SDK_INT >= 23) {
            f738a = new C0178d();
        } else if (VERSION.SDK_INT >= 21) {
            f738a = new C0177c();
        } else if (VERSION.SDK_INT >= 19) {
            f738a = new C0176b();
        } else if (VERSION.SDK_INT >= 17) {
            f738a = new C0175a();
        } else {
            f738a = new C0174e();
        }
    }

    public static void m929a(Drawable drawable) {
        f738a.m909g(drawable);
    }

    public static void m930a(Drawable drawable, float f, float f2) {
        f738a.mo73a(drawable, f, f2);
    }

    public static void m931a(Drawable drawable, int i) {
        f738a.mo79b(drawable, i);
    }

    public static void m932a(Drawable drawable, int i, int i2, int i3, int i4) {
        f738a.mo74a(drawable, i, i2, i3, i4);
    }

    public static void m933a(Drawable drawable, ColorStateList colorStateList) {
        f738a.mo75a(drawable, colorStateList);
    }

    public static void m934a(Drawable drawable, Theme theme) {
        f738a.mo76a(drawable, theme);
    }

    public static void m935a(Drawable drawable, Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet, Theme theme) {
        f738a.mo77a(drawable, resources, xmlPullParser, attributeSet, theme);
    }

    public static void m936a(Drawable drawable, Mode mode) {
        f738a.mo78a(drawable, mode);
    }

    public static void m937a(Drawable drawable, boolean z) {
        f738a.mo69a(drawable, z);
    }

    public static boolean m938b(Drawable drawable) {
        return f738a.mo70b(drawable);
    }

    public static boolean m939b(Drawable drawable, int i) {
        return f738a.mo68a(drawable, i);
    }

    public static int m940c(Drawable drawable) {
        return f738a.mo72d(drawable);
    }

    public static boolean m941d(Drawable drawable) {
        return f738a.mo80e(drawable);
    }

    public static ColorFilter m942e(Drawable drawable) {
        return f738a.mo81f(drawable);
    }

    public static Drawable m943f(Drawable drawable) {
        return f738a.mo71c(drawable);
    }

    public static int m944g(Drawable drawable) {
        return f738a.mo67a(drawable);
    }
}
