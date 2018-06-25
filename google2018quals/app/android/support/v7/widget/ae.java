package android.support.v7.widget;

import android.graphics.PorterDuff.Mode;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.graphics.drawable.DrawableContainer;
import android.graphics.drawable.DrawableContainer.DrawableContainerState;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.ScaleDrawable;
import android.os.Build.VERSION;
import android.support.v4.p005c.p006a.C0180b;
import android.support.v7.p023c.p024a.C0487a;

public class ae {
    public static final Rect f1996a = new Rect();
    private static Class<?> f1997b;

    static {
        if (VERSION.SDK_INT >= 18) {
            try {
                f1997b = Class.forName("android.graphics.Insets");
            } catch (ClassNotFoundException e) {
            }
        }
    }

    public static Mode m2842a(int i, Mode mode) {
        switch (i) {
            case 3:
                return Mode.SRC_OVER;
            case 5:
                return Mode.SRC_IN;
            case 9:
                return Mode.SRC_ATOP;
            case 14:
                return Mode.MULTIPLY;
            case 15:
                return Mode.SCREEN;
            case 16:
                return VERSION.SDK_INT >= 11 ? Mode.valueOf("ADD") : mode;
            default:
                return mode;
        }
    }

    static void m2843a(Drawable drawable) {
        if (VERSION.SDK_INT == 21 && "android.graphics.drawable.VectorDrawable".equals(drawable.getClass().getName())) {
            m2845c(drawable);
        }
    }

    public static boolean m2844b(Drawable drawable) {
        if (VERSION.SDK_INT < 15 && (drawable instanceof InsetDrawable)) {
            return false;
        }
        if (VERSION.SDK_INT < 15 && (drawable instanceof GradientDrawable)) {
            return false;
        }
        if (VERSION.SDK_INT < 17 && (drawable instanceof LayerDrawable)) {
            return false;
        }
        if (drawable instanceof DrawableContainer) {
            ConstantState constantState = drawable.getConstantState();
            if (constantState instanceof DrawableContainerState) {
                for (Drawable b : ((DrawableContainerState) constantState).getChildren()) {
                    if (!m2844b(b)) {
                        return false;
                    }
                }
            }
        } else if (drawable instanceof C0180b) {
            return m2844b(((C0180b) drawable).mo83a());
        } else {
            if (drawable instanceof C0487a) {
                return m2844b(((C0487a) drawable).m2221a());
            }
            if (drawable instanceof ScaleDrawable) {
                return m2844b(((ScaleDrawable) drawable).getDrawable());
            }
        }
        return true;
    }

    private static void m2845c(Drawable drawable) {
        int[] state = drawable.getState();
        if (state == null || state.length == 0) {
            drawable.setState(ar.f2117e);
        } else {
            drawable.setState(ar.f2120h);
        }
        drawable.setState(state);
    }
}
