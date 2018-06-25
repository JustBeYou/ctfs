package android.support.v7.widget;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.support.v4.p017h.C0315p;
import android.support.v7.p020a.C0411a.C0410j;
import android.util.AttributeSet;
import android.view.View;

class C0614g {
    private final View f2234a;
    private final C0623l f2235b;
    private int f2236c = -1;
    private au f2237d;
    private au f2238e;
    private au f2239f;

    C0614g(View view) {
        this.f2234a = view;
        this.f2235b = C0623l.m3126a();
    }

    private boolean m3095b(Drawable drawable) {
        if (this.f2239f == null) {
            this.f2239f = new au();
        }
        au auVar = this.f2239f;
        auVar.m2950a();
        ColorStateList i = C0315p.m1394i(this.f2234a);
        if (i != null) {
            auVar.f2130d = true;
            auVar.f2127a = i;
        }
        Mode j = C0315p.m1395j(this.f2234a);
        if (j != null) {
            auVar.f2129c = true;
            auVar.f2128b = j;
        }
        if (!auVar.f2130d && !auVar.f2129c) {
            return false;
        }
        C0623l.m3129a(drawable, auVar, this.f2234a.getDrawableState());
        return true;
    }

    private boolean m3096d() {
        int i = VERSION.SDK_INT;
        return i > 21 ? this.f2237d != null : i == 21;
    }

    ColorStateList m3097a() {
        return this.f2238e != null ? this.f2238e.f2127a : null;
    }

    void m3098a(int i) {
        this.f2236c = i;
        m3104b(this.f2235b != null ? this.f2235b.m3149b(this.f2234a.getContext(), i) : null);
        m3105c();
    }

    void m3099a(ColorStateList colorStateList) {
        if (this.f2238e == null) {
            this.f2238e = new au();
        }
        this.f2238e.f2127a = colorStateList;
        this.f2238e.f2130d = true;
        m3105c();
    }

    void m3100a(Mode mode) {
        if (this.f2238e == null) {
            this.f2238e = new au();
        }
        this.f2238e.f2128b = mode;
        this.f2238e.f2129c = true;
        m3105c();
    }

    void m3101a(Drawable drawable) {
        this.f2236c = -1;
        m3104b(null);
        m3105c();
    }

    void m3102a(AttributeSet attributeSet, int i) {
        aw a = aw.m2953a(this.f2234a.getContext(), attributeSet, C0410j.ViewBackgroundHelper, i, 0);
        try {
            if (a.m2971g(C0410j.ViewBackgroundHelper_android_background)) {
                this.f2236c = a.m2970g(C0410j.ViewBackgroundHelper_android_background, -1);
                ColorStateList b = this.f2235b.m3149b(this.f2234a.getContext(), this.f2236c);
                if (b != null) {
                    m3104b(b);
                }
            }
            if (a.m2971g(C0410j.ViewBackgroundHelper_backgroundTint)) {
                C0315p.m1380a(this.f2234a, a.m2967e(C0410j.ViewBackgroundHelper_backgroundTint));
            }
            if (a.m2971g(C0410j.ViewBackgroundHelper_backgroundTintMode)) {
                C0315p.m1381a(this.f2234a, ae.m2842a(a.m2955a(C0410j.ViewBackgroundHelper_backgroundTintMode, -1), null));
            }
            a.m2958a();
        } catch (Throwable th) {
            a.m2958a();
        }
    }

    Mode m3103b() {
        return this.f2238e != null ? this.f2238e.f2128b : null;
    }

    void m3104b(ColorStateList colorStateList) {
        if (colorStateList != null) {
            if (this.f2237d == null) {
                this.f2237d = new au();
            }
            this.f2237d.f2127a = colorStateList;
            this.f2237d.f2130d = true;
        } else {
            this.f2237d = null;
        }
        m3105c();
    }

    void m3105c() {
        Drawable background = this.f2234a.getBackground();
        if (background == null) {
            return;
        }
        if (!m3096d() || !m3095b(background)) {
            if (this.f2238e != null) {
                C0623l.m3129a(background, this.f2238e, this.f2234a.getDrawableState());
            } else if (this.f2237d != null) {
                C0623l.m3129a(background, this.f2237d, this.f2234a.getDrawableState());
            }
        }
    }
}
