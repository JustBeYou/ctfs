package android.support.v7.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources.NotFoundException;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.support.v7.p020a.C0411a.C0410j;
import android.text.method.PasswordTransformationMethod;
import android.util.AttributeSet;
import android.widget.TextView;

class C0642y {
    final TextView f2317a;
    private au f2318b;
    private au f2319c;
    private au f2320d;
    private au f2321e;
    private final ab f2322f;
    private int f2323g = 0;
    private Typeface f2324h;

    C0642y(TextView textView) {
        this.f2317a = textView;
        this.f2322f = new ab(this.f2317a);
    }

    protected static au m3187a(Context context, C0623l c0623l, int i) {
        ColorStateList b = c0623l.m3149b(context, i);
        if (b == null) {
            return null;
        }
        au auVar = new au();
        auVar.f2130d = true;
        auVar.f2127a = b;
        return auVar;
    }

    static C0642y m3188a(TextView textView) {
        return VERSION.SDK_INT >= 17 ? new C0643z(textView) : new C0642y(textView);
    }

    private void m3189a(Context context, aw awVar) {
        this.f2323g = awVar.m2955a(C0410j.TextAppearance_android_textStyle, this.f2323g);
        if (awVar.m2971g(C0410j.TextAppearance_android_fontFamily) || awVar.m2971g(C0410j.TextAppearance_fontFamily)) {
            this.f2324h = null;
            int i = awVar.m2971g(C0410j.TextAppearance_android_fontFamily) ? C0410j.TextAppearance_android_fontFamily : C0410j.TextAppearance_fontFamily;
            if (!context.isRestricted()) {
                try {
                    this.f2324h = awVar.m2956a(i, this.f2323g, this.f2317a);
                } catch (UnsupportedOperationException e) {
                } catch (NotFoundException e2) {
                }
            }
            if (this.f2324h == null) {
                this.f2324h = Typeface.create(awVar.m2965d(i), this.f2323g);
            }
        }
    }

    private void m3190b(int i, float f) {
        this.f2322f.m2802a(i, f);
    }

    void mo550a() {
        if (this.f2318b != null || this.f2319c != null || this.f2320d != null || this.f2321e != null) {
            Drawable[] compoundDrawables = this.f2317a.getCompoundDrawables();
            m3196a(compoundDrawables[0], this.f2318b);
            m3196a(compoundDrawables[1], this.f2319c);
            m3196a(compoundDrawables[2], this.f2320d);
            m3196a(compoundDrawables[3], this.f2321e);
        }
    }

    void m3192a(int i) {
        this.f2322f.m2801a(i);
    }

    void m3193a(int i, float f) {
        if (VERSION.SDK_INT < 26 && !m3202c()) {
            m3190b(i, f);
        }
    }

    void m3194a(int i, int i2, int i3, int i4) {
        this.f2322f.m2803a(i, i2, i3, i4);
    }

    void m3195a(Context context, int i) {
        aw a = aw.m2951a(context, i, C0410j.TextAppearance);
        if (a.m2971g(C0410j.TextAppearance_textAllCaps)) {
            m3198a(a.m2959a(C0410j.TextAppearance_textAllCaps, false));
        }
        if (VERSION.SDK_INT < 23 && a.m2971g(C0410j.TextAppearance_android_textColor)) {
            ColorStateList e = a.m2967e(C0410j.TextAppearance_android_textColor);
            if (e != null) {
                this.f2317a.setTextColor(e);
            }
        }
        m3189a(context, a);
        a.m2958a();
        if (this.f2324h != null) {
            this.f2317a.setTypeface(this.f2324h, this.f2323g);
        }
    }

    final void m3196a(Drawable drawable, au auVar) {
        if (drawable != null && auVar != null) {
            C0623l.m3129a(drawable, auVar, this.f2317a.getDrawableState());
        }
    }

    void mo551a(AttributeSet attributeSet, int i) {
        aw a;
        boolean z;
        boolean z2;
        ColorStateList e;
        ColorStateList e2;
        ColorStateList colorStateList = null;
        Context context = this.f2317a.getContext();
        C0623l a2 = C0623l.m3126a();
        aw a3 = aw.m2953a(context, attributeSet, C0410j.AppCompatTextHelper, i, 0);
        int g = a3.m2970g(C0410j.AppCompatTextHelper_android_textAppearance, -1);
        if (a3.m2971g(C0410j.AppCompatTextHelper_android_drawableLeft)) {
            this.f2318b = C0642y.m3187a(context, a2, a3.m2970g(C0410j.AppCompatTextHelper_android_drawableLeft, 0));
        }
        if (a3.m2971g(C0410j.AppCompatTextHelper_android_drawableTop)) {
            this.f2319c = C0642y.m3187a(context, a2, a3.m2970g(C0410j.AppCompatTextHelper_android_drawableTop, 0));
        }
        if (a3.m2971g(C0410j.AppCompatTextHelper_android_drawableRight)) {
            this.f2320d = C0642y.m3187a(context, a2, a3.m2970g(C0410j.AppCompatTextHelper_android_drawableRight, 0));
        }
        if (a3.m2971g(C0410j.AppCompatTextHelper_android_drawableBottom)) {
            this.f2321e = C0642y.m3187a(context, a2, a3.m2970g(C0410j.AppCompatTextHelper_android_drawableBottom, 0));
        }
        a3.m2958a();
        boolean z3 = this.f2317a.getTransformationMethod() instanceof PasswordTransformationMethod;
        if (g != -1) {
            a = aw.m2951a(context, g, C0410j.TextAppearance);
            if (z3 || !a.m2971g(C0410j.TextAppearance_textAllCaps)) {
                z = false;
                z2 = false;
            } else {
                z2 = a.m2959a(C0410j.TextAppearance_textAllCaps, false);
                z = true;
            }
            m3189a(context, a);
            if (VERSION.SDK_INT < 23) {
                e = a.m2971g(C0410j.TextAppearance_android_textColor) ? a.m2967e(C0410j.TextAppearance_android_textColor) : null;
                e2 = a.m2971g(C0410j.TextAppearance_android_textColorHint) ? a.m2967e(C0410j.TextAppearance_android_textColorHint) : null;
                if (a.m2971g(C0410j.TextAppearance_android_textColorLink)) {
                    colorStateList = a.m2967e(C0410j.TextAppearance_android_textColorLink);
                }
            } else {
                e2 = null;
                e = null;
            }
            a.m2958a();
        } else {
            e2 = null;
            e = null;
            z = false;
            z2 = false;
        }
        a = aw.m2953a(context, attributeSet, C0410j.TextAppearance, i, 0);
        if (!z3 && a.m2971g(C0410j.TextAppearance_textAllCaps)) {
            z2 = a.m2959a(C0410j.TextAppearance_textAllCaps, false);
            z = true;
        }
        if (VERSION.SDK_INT < 23) {
            if (a.m2971g(C0410j.TextAppearance_android_textColor)) {
                e = a.m2967e(C0410j.TextAppearance_android_textColor);
            }
            if (a.m2971g(C0410j.TextAppearance_android_textColorHint)) {
                e2 = a.m2967e(C0410j.TextAppearance_android_textColorHint);
            }
            if (a.m2971g(C0410j.TextAppearance_android_textColorLink)) {
                colorStateList = a.m2967e(C0410j.TextAppearance_android_textColorLink);
            }
        }
        m3189a(context, a);
        a.m2958a();
        if (e != null) {
            this.f2317a.setTextColor(e);
        }
        if (e2 != null) {
            this.f2317a.setHintTextColor(e2);
        }
        if (colorStateList != null) {
            this.f2317a.setLinkTextColor(colorStateList);
        }
        if (!z3 && r0) {
            m3198a(z2);
        }
        if (this.f2324h != null) {
            this.f2317a.setTypeface(this.f2324h, this.f2323g);
        }
        this.f2322f.m2804a(attributeSet, i);
        if (VERSION.SDK_INT >= 26 && this.f2322f.m2800a() != 0) {
            int[] e3 = this.f2322f.m2809e();
            if (e3.length <= 0) {
                return;
            }
            if (((float) this.f2317a.getAutoSizeStepGranularity()) != -1.0f) {
                this.f2317a.setAutoSizeTextTypeUniformWithConfiguration(this.f2322f.m2807c(), this.f2322f.m2808d(), this.f2322f.m2806b(), 0);
            } else {
                this.f2317a.setAutoSizeTextTypeUniformWithPresetSizes(e3, 0);
            }
        }
    }

    void m3198a(boolean z) {
        this.f2317a.setAllCaps(z);
    }

    void m3199a(boolean z, int i, int i2, int i3, int i4) {
        if (VERSION.SDK_INT < 26) {
            m3201b();
        }
    }

    void m3200a(int[] iArr, int i) {
        this.f2322f.m2805a(iArr, i);
    }

    void m3201b() {
        this.f2322f.m2810f();
    }

    boolean m3202c() {
        return this.f2322f.m2811g();
    }

    int m3203d() {
        return this.f2322f.m2800a();
    }

    int m3204e() {
        return this.f2322f.m2806b();
    }

    int m3205f() {
        return this.f2322f.m2807c();
    }

    int m3206g() {
        return this.f2322f.m2808d();
    }

    int[] m3207h() {
        return this.f2322f.m2809e();
    }
}
