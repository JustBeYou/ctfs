package android.support.v7.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.support.v4.p005c.C0188a;
import android.util.TypedValue;

class ar {
    static final int[] f2113a = new int[]{-16842910};
    static final int[] f2114b = new int[]{16842908};
    static final int[] f2115c = new int[]{16843518};
    static final int[] f2116d = new int[]{16842919};
    static final int[] f2117e = new int[]{16842912};
    static final int[] f2118f = new int[]{16842913};
    static final int[] f2119g = new int[]{-16842919, -16842908};
    static final int[] f2120h = new int[0];
    private static final ThreadLocal<TypedValue> f2121i = new ThreadLocal();
    private static final int[] f2122j = new int[1];

    public static int m2941a(Context context, int i) {
        f2122j[0] = i;
        aw a = aw.m2952a(context, null, f2122j);
        try {
            int b = a.m2960b(0, 0);
            return b;
        } finally {
            a.m2958a();
        }
    }

    static int m2942a(Context context, int i, float f) {
        int a = m2941a(context, i);
        return C0188a.m961b(a, Math.round(((float) Color.alpha(a)) * f));
    }

    private static TypedValue m2943a() {
        TypedValue typedValue = (TypedValue) f2121i.get();
        if (typedValue != null) {
            return typedValue;
        }
        typedValue = new TypedValue();
        f2121i.set(typedValue);
        return typedValue;
    }

    public static ColorStateList m2944b(Context context, int i) {
        f2122j[0] = i;
        aw a = aw.m2952a(context, null, f2122j);
        try {
            ColorStateList e = a.m2967e(0);
            return e;
        } finally {
            a.m2958a();
        }
    }

    public static int m2945c(Context context, int i) {
        ColorStateList b = m2944b(context, i);
        if (b != null && b.isStateful()) {
            return b.getColorForState(f2113a, b.getDefaultColor());
        }
        TypedValue a = m2943a();
        context.getTheme().resolveAttribute(16842803, a, true);
        return m2942a(context, i, a.getFloat());
    }
}
