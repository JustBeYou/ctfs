package android.support.v4.p005c.p006a;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PorterDuff.Mode;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.Callback;
import android.graphics.drawable.Drawable.ConstantState;

class C0183c extends Drawable implements Callback, C0180b, C0029f {
    static final Mode f743a = Mode.SRC_IN;
    C0181a f744b;
    Drawable f745c;
    private int f746d;
    private Mode f747e;
    private boolean f748f;
    private boolean f749g;

    protected static abstract class C0181a extends ConstantState {
        int f739a;
        ConstantState f740b;
        ColorStateList f741c = null;
        Mode f742d = C0183c.f743a;

        C0181a(C0181a c0181a, Resources resources) {
            if (c0181a != null) {
                this.f739a = c0181a.f739a;
                this.f740b = c0181a.f740b;
                this.f741c = c0181a.f741c;
                this.f742d = c0181a.f742d;
            }
        }

        boolean m947a() {
            return this.f740b != null;
        }

        public int getChangingConfigurations() {
            return (this.f740b != null ? this.f740b.getChangingConfigurations() : 0) | this.f739a;
        }

        public Drawable newDrawable() {
            return newDrawable(null);
        }

        public abstract Drawable newDrawable(Resources resources);
    }

    private static class C0182b extends C0181a {
        C0182b(C0181a c0181a, Resources resources) {
            super(c0181a, resources);
        }

        public Drawable newDrawable(Resources resources) {
            return new C0183c(this, resources);
        }
    }

    C0183c(Drawable drawable) {
        this.f744b = mo85b();
        mo84a(drawable);
    }

    C0183c(C0181a c0181a, Resources resources) {
        this.f744b = c0181a;
        m948a(resources);
    }

    private void m948a(Resources resources) {
        if (this.f744b != null && this.f744b.f740b != null) {
            mo84a(m951a(this.f744b.f740b, resources));
        }
    }

    private boolean m949a(int[] iArr) {
        if (!mo86c()) {
            return false;
        }
        ColorStateList colorStateList = this.f744b.f741c;
        Mode mode = this.f744b.f742d;
        if (colorStateList == null || mode == null) {
            this.f748f = false;
            clearColorFilter();
            return false;
        }
        int colorForState = colorStateList.getColorForState(iArr, colorStateList.getDefaultColor());
        if (this.f748f && colorForState == this.f746d && mode == this.f747e) {
            return false;
        }
        setColorFilter(colorForState, mode);
        this.f746d = colorForState;
        this.f747e = mode;
        this.f748f = true;
        return true;
    }

    public final Drawable mo83a() {
        return this.f745c;
    }

    protected Drawable m951a(ConstantState constantState, Resources resources) {
        return constantState.newDrawable(resources);
    }

    public final void mo84a(Drawable drawable) {
        if (this.f745c != null) {
            this.f745c.setCallback(null);
        }
        this.f745c = drawable;
        if (drawable != null) {
            drawable.setCallback(this);
            setVisible(drawable.isVisible(), true);
            setState(drawable.getState());
            setLevel(drawable.getLevel());
            setBounds(drawable.getBounds());
            if (this.f744b != null) {
                this.f744b.f740b = drawable.getConstantState();
            }
        }
        invalidateSelf();
    }

    C0181a mo85b() {
        return new C0182b(this.f744b, null);
    }

    protected boolean mo86c() {
        return true;
    }

    public void draw(Canvas canvas) {
        this.f745c.draw(canvas);
    }

    public int getChangingConfigurations() {
        return ((this.f744b != null ? this.f744b.getChangingConfigurations() : 0) | super.getChangingConfigurations()) | this.f745c.getChangingConfigurations();
    }

    public ConstantState getConstantState() {
        if (this.f744b == null || !this.f744b.m947a()) {
            return null;
        }
        this.f744b.f739a = getChangingConfigurations();
        return this.f744b;
    }

    public Drawable getCurrent() {
        return this.f745c.getCurrent();
    }

    public int getIntrinsicHeight() {
        return this.f745c.getIntrinsicHeight();
    }

    public int getIntrinsicWidth() {
        return this.f745c.getIntrinsicWidth();
    }

    public int getMinimumHeight() {
        return this.f745c.getMinimumHeight();
    }

    public int getMinimumWidth() {
        return this.f745c.getMinimumWidth();
    }

    public int getOpacity() {
        return this.f745c.getOpacity();
    }

    public boolean getPadding(Rect rect) {
        return this.f745c.getPadding(rect);
    }

    public int[] getState() {
        return this.f745c.getState();
    }

    public Region getTransparentRegion() {
        return this.f745c.getTransparentRegion();
    }

    public void invalidateDrawable(Drawable drawable) {
        invalidateSelf();
    }

    public boolean isStateful() {
        ColorStateList colorStateList = (!mo86c() || this.f744b == null) ? null : this.f744b.f741c;
        return (colorStateList != null && colorStateList.isStateful()) || this.f745c.isStateful();
    }

    public void jumpToCurrentState() {
        this.f745c.jumpToCurrentState();
    }

    public Drawable mutate() {
        if (!this.f749g && super.mutate() == this) {
            this.f744b = mo85b();
            if (this.f745c != null) {
                this.f745c.mutate();
            }
            if (this.f744b != null) {
                this.f744b.f740b = this.f745c != null ? this.f745c.getConstantState() : null;
            }
            this.f749g = true;
        }
        return this;
    }

    protected void onBoundsChange(Rect rect) {
        if (this.f745c != null) {
            this.f745c.setBounds(rect);
        }
    }

    protected boolean onLevelChange(int i) {
        return this.f745c.setLevel(i);
    }

    public void scheduleDrawable(Drawable drawable, Runnable runnable, long j) {
        scheduleSelf(runnable, j);
    }

    public void setAlpha(int i) {
        this.f745c.setAlpha(i);
    }

    public void setChangingConfigurations(int i) {
        this.f745c.setChangingConfigurations(i);
    }

    public void setColorFilter(ColorFilter colorFilter) {
        this.f745c.setColorFilter(colorFilter);
    }

    public void setDither(boolean z) {
        this.f745c.setDither(z);
    }

    public void setFilterBitmap(boolean z) {
        this.f745c.setFilterBitmap(z);
    }

    public boolean setState(int[] iArr) {
        return m949a(iArr) || this.f745c.setState(iArr);
    }

    public void setTint(int i) {
        setTintList(ColorStateList.valueOf(i));
    }

    public void setTintList(ColorStateList colorStateList) {
        this.f744b.f741c = colorStateList;
        m949a(getState());
    }

    public void setTintMode(Mode mode) {
        this.f744b.f742d = mode;
        m949a(getState());
    }

    public boolean setVisible(boolean z, boolean z2) {
        return super.setVisible(z, z2) || this.f745c.setVisible(z, z2);
    }

    public void unscheduleDrawable(Drawable drawable, Runnable runnable) {
        unscheduleSelf(runnable);
    }
}
