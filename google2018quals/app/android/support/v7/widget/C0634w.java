package android.support.v7.widget;

import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.support.v4.p005c.p006a.C0179a;
import android.support.v4.p017h.C0315p;
import android.support.v7.p020a.C0411a.C0410j;
import android.util.AttributeSet;
import android.widget.SeekBar;

class C0634w extends C0630s {
    private final SeekBar f2289a;
    private Drawable f2290b;
    private ColorStateList f2291c = null;
    private Mode f2292d = null;
    private boolean f2293e = false;
    private boolean f2294f = false;

    C0634w(SeekBar seekBar) {
        super(seekBar);
        this.f2289a = seekBar;
    }

    private void m3168d() {
        if (this.f2290b == null) {
            return;
        }
        if (this.f2293e || this.f2294f) {
            this.f2290b = C0179a.m943f(this.f2290b.mutate());
            if (this.f2293e) {
                C0179a.m933a(this.f2290b, this.f2291c);
            }
            if (this.f2294f) {
                C0179a.m936a(this.f2290b, this.f2292d);
            }
            if (this.f2290b.isStateful()) {
                this.f2290b.setState(this.f2289a.getDrawableState());
            }
        }
    }

    void m3169a(Canvas canvas) {
        int i = 1;
        if (this.f2290b != null) {
            int max = this.f2289a.getMax();
            if (max > 1) {
                int intrinsicWidth = this.f2290b.getIntrinsicWidth();
                int intrinsicHeight = this.f2290b.getIntrinsicHeight();
                intrinsicWidth = intrinsicWidth >= 0 ? intrinsicWidth / 2 : 1;
                if (intrinsicHeight >= 0) {
                    i = intrinsicHeight / 2;
                }
                this.f2290b.setBounds(-intrinsicWidth, -i, intrinsicWidth, i);
                float width = ((float) ((this.f2289a.getWidth() - this.f2289a.getPaddingLeft()) - this.f2289a.getPaddingRight())) / ((float) max);
                intrinsicHeight = canvas.save();
                canvas.translate((float) this.f2289a.getPaddingLeft(), (float) (this.f2289a.getHeight() / 2));
                for (i = 0; i <= max; i++) {
                    this.f2290b.draw(canvas);
                    canvas.translate(width, 0.0f);
                }
                canvas.restoreToCount(intrinsicHeight);
            }
        }
    }

    void mo544a(Drawable drawable) {
        if (this.f2290b != null) {
            this.f2290b.setCallback(null);
        }
        this.f2290b = drawable;
        if (drawable != null) {
            drawable.setCallback(this.f2289a);
            C0179a.m939b(drawable, C0315p.m1387b(this.f2289a));
            if (drawable.isStateful()) {
                drawable.setState(this.f2289a.getDrawableState());
            }
            m3168d();
        }
        this.f2289a.invalidate();
    }

    void mo545a(AttributeSet attributeSet, int i) {
        super.mo545a(attributeSet, i);
        aw a = aw.m2953a(this.f2289a.getContext(), attributeSet, C0410j.AppCompatSeekBar, i, 0);
        Drawable b = a.m2961b(C0410j.AppCompatSeekBar_android_thumb);
        if (b != null) {
            this.f2289a.setThumb(b);
        }
        mo544a(a.m2957a(C0410j.AppCompatSeekBar_tickMark));
        if (a.m2971g(C0410j.AppCompatSeekBar_tickMarkTintMode)) {
            this.f2292d = ae.m2842a(a.m2955a(C0410j.AppCompatSeekBar_tickMarkTintMode, -1), this.f2292d);
            this.f2294f = true;
        }
        if (a.m2971g(C0410j.AppCompatSeekBar_tickMarkTint)) {
            this.f2291c = a.m2967e(C0410j.AppCompatSeekBar_tickMarkTint);
            this.f2293e = true;
        }
        a.m2958a();
        m3168d();
    }

    void mo546b() {
        if (this.f2290b != null) {
            this.f2290b.jumpToCurrentState();
        }
    }

    void m3173c() {
        Drawable drawable = this.f2290b;
        if (drawable != null && drawable.isStateful() && drawable.setState(this.f2289a.getDrawableState())) {
            this.f2289a.invalidateDrawable(drawable);
        }
    }
}
