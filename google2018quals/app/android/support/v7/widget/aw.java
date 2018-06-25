package android.support.v7.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.support.v4.p009b.p011a.C0170b;
import android.support.v7.p021b.p022a.C0485b;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.widget.TextView;

public class aw {
    private final Context f2132a;
    private final TypedArray f2133b;
    private TypedValue f2134c;

    private aw(Context context, TypedArray typedArray) {
        this.f2132a = context;
        this.f2133b = typedArray;
    }

    public static aw m2951a(Context context, int i, int[] iArr) {
        return new aw(context, context.obtainStyledAttributes(i, iArr));
    }

    public static aw m2952a(Context context, AttributeSet attributeSet, int[] iArr) {
        return new aw(context, context.obtainStyledAttributes(attributeSet, iArr));
    }

    public static aw m2953a(Context context, AttributeSet attributeSet, int[] iArr, int i, int i2) {
        return new aw(context, context.obtainStyledAttributes(attributeSet, iArr, i, i2));
    }

    public float m2954a(int i, float f) {
        return this.f2133b.getFloat(i, f);
    }

    public int m2955a(int i, int i2) {
        return this.f2133b.getInt(i, i2);
    }

    public Typeface m2956a(int i, int i2, TextView textView) {
        int resourceId = this.f2133b.getResourceId(i, 0);
        if (resourceId == 0) {
            return null;
        }
        if (this.f2134c == null) {
            this.f2134c = new TypedValue();
        }
        return C0170b.m867a(this.f2132a, resourceId, this.f2134c, i2, textView);
    }

    public Drawable m2957a(int i) {
        if (this.f2133b.hasValue(i)) {
            int resourceId = this.f2133b.getResourceId(i, 0);
            if (resourceId != 0) {
                return C0485b.m2214b(this.f2132a, resourceId);
            }
        }
        return this.f2133b.getDrawable(i);
    }

    public void m2958a() {
        this.f2133b.recycle();
    }

    public boolean m2959a(int i, boolean z) {
        return this.f2133b.getBoolean(i, z);
    }

    public int m2960b(int i, int i2) {
        return this.f2133b.getColor(i, i2);
    }

    public Drawable m2961b(int i) {
        if (this.f2133b.hasValue(i)) {
            int resourceId = this.f2133b.getResourceId(i, 0);
            if (resourceId != 0) {
                return C0623l.m3126a().m3146a(this.f2132a, resourceId, true);
            }
        }
        return null;
    }

    public int m2962c(int i, int i2) {
        return this.f2133b.getInteger(i, i2);
    }

    public CharSequence m2963c(int i) {
        return this.f2133b.getText(i);
    }

    public int m2964d(int i, int i2) {
        return this.f2133b.getDimensionPixelOffset(i, i2);
    }

    public String m2965d(int i) {
        return this.f2133b.getString(i);
    }

    public int m2966e(int i, int i2) {
        return this.f2133b.getDimensionPixelSize(i, i2);
    }

    public ColorStateList m2967e(int i) {
        if (this.f2133b.hasValue(i)) {
            int resourceId = this.f2133b.getResourceId(i, 0);
            if (resourceId != 0) {
                ColorStateList a = C0485b.m2211a(this.f2132a, resourceId);
                if (a != null) {
                    return a;
                }
            }
        }
        return this.f2133b.getColorStateList(i);
    }

    public int m2968f(int i, int i2) {
        return this.f2133b.getLayoutDimension(i, i2);
    }

    public CharSequence[] m2969f(int i) {
        return this.f2133b.getTextArray(i);
    }

    public int m2970g(int i, int i2) {
        return this.f2133b.getResourceId(i, i2);
    }

    public boolean m2971g(int i) {
        return this.f2133b.hasValue(i);
    }
}
