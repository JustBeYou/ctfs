package android.support.v4.widget;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.util.Log;
import android.widget.CompoundButton;
import java.lang.reflect.Field;

public final class C0378b {
    private static final C0375c f1094a;

    static class C0375c {
        private static Field f1092a;
        private static boolean f1093b;

        C0375c() {
        }

        public Drawable mo241a(CompoundButton compoundButton) {
            if (!f1093b) {
                try {
                    f1092a = CompoundButton.class.getDeclaredField("mButtonDrawable");
                    f1092a.setAccessible(true);
                } catch (Throwable e) {
                    Log.i("CompoundButtonCompat", "Failed to retrieve mButtonDrawable field", e);
                }
                f1093b = true;
            }
            if (f1092a != null) {
                try {
                    return (Drawable) f1092a.get(compoundButton);
                } catch (Throwable e2) {
                    Log.i("CompoundButtonCompat", "Failed to get button drawable via reflection", e2);
                    f1092a = null;
                }
            }
            return null;
        }

        public void mo239a(CompoundButton compoundButton, ColorStateList colorStateList) {
            if (compoundButton instanceof C0399k) {
                ((C0399k) compoundButton).setSupportButtonTintList(colorStateList);
            }
        }

        public void mo240a(CompoundButton compoundButton, Mode mode) {
            if (compoundButton instanceof C0399k) {
                ((C0399k) compoundButton).setSupportButtonTintMode(mode);
            }
        }
    }

    static class C0376a extends C0375c {
        C0376a() {
        }

        public void mo239a(CompoundButton compoundButton, ColorStateList colorStateList) {
            compoundButton.setButtonTintList(colorStateList);
        }

        public void mo240a(CompoundButton compoundButton, Mode mode) {
            compoundButton.setButtonTintMode(mode);
        }
    }

    static class C0377b extends C0376a {
        C0377b() {
        }

        public Drawable mo241a(CompoundButton compoundButton) {
            return compoundButton.getButtonDrawable();
        }
    }

    static {
        if (VERSION.SDK_INT >= 23) {
            f1094a = new C0377b();
        } else if (VERSION.SDK_INT >= 21) {
            f1094a = new C0376a();
        } else {
            f1094a = new C0375c();
        }
    }

    public static Drawable m1791a(CompoundButton compoundButton) {
        return f1094a.mo241a(compoundButton);
    }

    public static void m1792a(CompoundButton compoundButton, ColorStateList colorStateList) {
        f1094a.mo239a(compoundButton, colorStateList);
    }

    public static void m1793a(CompoundButton compoundButton, Mode mode) {
        f1094a.mo240a(compoundButton, mode);
    }
}
