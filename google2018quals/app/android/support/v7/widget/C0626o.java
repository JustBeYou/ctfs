package android.support.v7.widget;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build.VERSION;
import android.support.v4.widget.C0390f;
import android.support.v7.p020a.C0411a.C0410j;
import android.support.v7.p021b.p022a.C0485b;
import android.util.AttributeSet;
import android.widget.ImageView;

public class C0626o {
    private final ImageView f2271a;
    private au f2272b;
    private au f2273c;
    private au f2274d;

    public C0626o(ImageView imageView) {
        this.f2271a = imageView;
    }

    private boolean m3150a(Drawable drawable) {
        if (this.f2274d == null) {
            this.f2274d = new au();
        }
        au auVar = this.f2274d;
        auVar.m2950a();
        ColorStateList a = C0390f.m1823a(this.f2271a);
        if (a != null) {
            auVar.f2130d = true;
            auVar.f2127a = a;
        }
        Mode b = C0390f.m1826b(this.f2271a);
        if (b != null) {
            auVar.f2129c = true;
            auVar.f2128b = b;
        }
        if (!auVar.f2130d && !auVar.f2129c) {
            return false;
        }
        C0623l.m3129a(drawable, auVar, this.f2271a.getDrawableState());
        return true;
    }

    private boolean m3151e() {
        int i = VERSION.SDK_INT;
        return i > 21 ? this.f2272b != null : i == 21;
    }

    public void m3152a(int i) {
        if (i != 0) {
            Drawable b = C0485b.m2214b(this.f2271a.getContext(), i);
            if (b != null) {
                ae.m2843a(b);
            }
            this.f2271a.setImageDrawable(b);
        } else {
            this.f2271a.setImageDrawable(null);
        }
        m3159d();
    }

    void m3153a(ColorStateList colorStateList) {
        if (this.f2273c == null) {
            this.f2273c = new au();
        }
        this.f2273c.f2127a = colorStateList;
        this.f2273c.f2130d = true;
        m3159d();
    }

    void m3154a(Mode mode) {
        if (this.f2273c == null) {
            this.f2273c = new au();
        }
        this.f2273c.f2128b = mode;
        this.f2273c.f2129c = true;
        m3159d();
    }

    public void m3155a(AttributeSet attributeSet, int i) {
        aw a = aw.m2953a(this.f2271a.getContext(), attributeSet, C0410j.AppCompatImageView, i, 0);
        try {
            Drawable drawable = this.f2271a.getDrawable();
            if (drawable == null) {
                int g = a.m2970g(C0410j.AppCompatImageView_srcCompat, -1);
                if (g != -1) {
                    drawable = C0485b.m2214b(this.f2271a.getContext(), g);
                    if (drawable != null) {
                        this.f2271a.setImageDrawable(drawable);
                    }
                }
            }
            if (drawable != null) {
                ae.m2843a(drawable);
            }
            if (a.m2971g(C0410j.AppCompatImageView_tint)) {
                C0390f.m1824a(this.f2271a, a.m2967e(C0410j.AppCompatImageView_tint));
            }
            if (a.m2971g(C0410j.AppCompatImageView_tintMode)) {
                C0390f.m1825a(this.f2271a, ae.m2842a(a.m2955a(C0410j.AppCompatImageView_tintMode, -1), null));
            }
            a.m2958a();
        } catch (Throwable th) {
            a.m2958a();
        }
    }

    boolean m3156a() {
        return VERSION.SDK_INT < 21 || !(this.f2271a.getBackground() instanceof RippleDrawable);
    }

    ColorStateList m3157b() {
        return this.f2273c != null ? this.f2273c.f2127a : null;
    }

    Mode m3158c() {
        return this.f2273c != null ? this.f2273c.f2128b : null;
    }

    void m3159d() {
        Drawable drawable = this.f2271a.getDrawable();
        if (drawable != null) {
            ae.m2843a(drawable);
        }
        if (drawable == null) {
            return;
        }
        if (!m3151e() || !m3150a(drawable)) {
            if (this.f2273c != null) {
                C0623l.m3129a(drawable, this.f2273c, this.f2271a.getDrawableState());
            } else if (this.f2272b != null) {
                C0623l.m3129a(drawable, this.f2272b, this.f2271a.getDrawableState());
            }
        }
    }
}
