package android.support.v7.widget;

import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.support.v4.p005c.p006a.C0179a;
import android.support.v4.widget.C0378b;
import android.support.v7.p020a.C0411a.C0410j;
import android.support.v7.p021b.p022a.C0485b;
import android.util.AttributeSet;
import android.widget.CompoundButton;

class C0618k {
    private final CompoundButton f2245a;
    private ColorStateList f2246b = null;
    private Mode f2247c = null;
    private boolean f2248d = false;
    private boolean f2249e = false;
    private boolean f2250f;

    C0618k(CompoundButton compoundButton) {
        this.f2245a = compoundButton;
    }

    int m3106a(int i) {
        if (VERSION.SDK_INT >= 17) {
            return i;
        }
        Drawable a = C0378b.m1791a(this.f2245a);
        return a != null ? i + a.getIntrinsicWidth() : i;
    }

    ColorStateList m3107a() {
        return this.f2246b;
    }

    void m3108a(ColorStateList colorStateList) {
        this.f2246b = colorStateList;
        this.f2248d = true;
        m3113d();
    }

    void m3109a(Mode mode) {
        this.f2247c = mode;
        this.f2249e = true;
        m3113d();
    }

    void m3110a(AttributeSet attributeSet, int i) {
        TypedArray obtainStyledAttributes = this.f2245a.getContext().obtainStyledAttributes(attributeSet, C0410j.CompoundButton, i, 0);
        try {
            if (obtainStyledAttributes.hasValue(C0410j.CompoundButton_android_button)) {
                int resourceId = obtainStyledAttributes.getResourceId(C0410j.CompoundButton_android_button, 0);
                if (resourceId != 0) {
                    this.f2245a.setButtonDrawable(C0485b.m2214b(this.f2245a.getContext(), resourceId));
                }
            }
            if (obtainStyledAttributes.hasValue(C0410j.CompoundButton_buttonTint)) {
                C0378b.m1792a(this.f2245a, obtainStyledAttributes.getColorStateList(C0410j.CompoundButton_buttonTint));
            }
            if (obtainStyledAttributes.hasValue(C0410j.CompoundButton_buttonTintMode)) {
                C0378b.m1793a(this.f2245a, ae.m2842a(obtainStyledAttributes.getInt(C0410j.CompoundButton_buttonTintMode, -1), null));
            }
            obtainStyledAttributes.recycle();
        } catch (Throwable th) {
            obtainStyledAttributes.recycle();
        }
    }

    Mode m3111b() {
        return this.f2247c;
    }

    void m3112c() {
        if (this.f2250f) {
            this.f2250f = false;
            return;
        }
        this.f2250f = true;
        m3113d();
    }

    void m3113d() {
        Drawable a = C0378b.m1791a(this.f2245a);
        if (a == null) {
            return;
        }
        if (this.f2248d || this.f2249e) {
            a = C0179a.m943f(a).mutate();
            if (this.f2248d) {
                C0179a.m933a(a, this.f2246b);
            }
            if (this.f2249e) {
                C0179a.m936a(a, this.f2247c);
            }
            if (a.isStateful()) {
                a.setState(this.f2245a.getDrawableState());
            }
            this.f2245a.setButtonDrawable(a);
        }
    }
}
