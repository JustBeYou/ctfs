package android.support.v7.p023c.p024a;

import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PorterDuff.Mode;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.Callback;
import android.support.v4.p005c.p006a.C0179a;

public class C0487a extends Drawable implements Callback {
    private Drawable f1426a;

    public C0487a(Drawable drawable) {
        m2222a(drawable);
    }

    public Drawable m2221a() {
        return this.f1426a;
    }

    public void m2222a(Drawable drawable) {
        if (this.f1426a != null) {
            this.f1426a.setCallback(null);
        }
        this.f1426a = drawable;
        if (drawable != null) {
            drawable.setCallback(this);
        }
    }

    public void draw(Canvas canvas) {
        this.f1426a.draw(canvas);
    }

    public int getChangingConfigurations() {
        return this.f1426a.getChangingConfigurations();
    }

    public Drawable getCurrent() {
        return this.f1426a.getCurrent();
    }

    public int getIntrinsicHeight() {
        return this.f1426a.getIntrinsicHeight();
    }

    public int getIntrinsicWidth() {
        return this.f1426a.getIntrinsicWidth();
    }

    public int getMinimumHeight() {
        return this.f1426a.getMinimumHeight();
    }

    public int getMinimumWidth() {
        return this.f1426a.getMinimumWidth();
    }

    public int getOpacity() {
        return this.f1426a.getOpacity();
    }

    public boolean getPadding(Rect rect) {
        return this.f1426a.getPadding(rect);
    }

    public int[] getState() {
        return this.f1426a.getState();
    }

    public Region getTransparentRegion() {
        return this.f1426a.getTransparentRegion();
    }

    public void invalidateDrawable(Drawable drawable) {
        invalidateSelf();
    }

    public boolean isAutoMirrored() {
        return C0179a.m938b(this.f1426a);
    }

    public boolean isStateful() {
        return this.f1426a.isStateful();
    }

    public void jumpToCurrentState() {
        C0179a.m929a(this.f1426a);
    }

    protected void onBoundsChange(Rect rect) {
        this.f1426a.setBounds(rect);
    }

    protected boolean onLevelChange(int i) {
        return this.f1426a.setLevel(i);
    }

    public void scheduleDrawable(Drawable drawable, Runnable runnable, long j) {
        scheduleSelf(runnable, j);
    }

    public void setAlpha(int i) {
        this.f1426a.setAlpha(i);
    }

    public void setAutoMirrored(boolean z) {
        C0179a.m937a(this.f1426a, z);
    }

    public void setChangingConfigurations(int i) {
        this.f1426a.setChangingConfigurations(i);
    }

    public void setColorFilter(ColorFilter colorFilter) {
        this.f1426a.setColorFilter(colorFilter);
    }

    public void setDither(boolean z) {
        this.f1426a.setDither(z);
    }

    public void setFilterBitmap(boolean z) {
        this.f1426a.setFilterBitmap(z);
    }

    public void setHotspot(float f, float f2) {
        C0179a.m930a(this.f1426a, f, f2);
    }

    public void setHotspotBounds(int i, int i2, int i3, int i4) {
        C0179a.m932a(this.f1426a, i, i2, i3, i4);
    }

    public boolean setState(int[] iArr) {
        return this.f1426a.setState(iArr);
    }

    public void setTint(int i) {
        C0179a.m931a(this.f1426a, i);
    }

    public void setTintList(ColorStateList colorStateList) {
        C0179a.m933a(this.f1426a, colorStateList);
    }

    public void setTintMode(Mode mode) {
        C0179a.m936a(this.f1426a, mode);
    }

    public boolean setVisible(boolean z, boolean z2) {
        return super.setVisible(z, z2) || this.f1426a.setVisible(z, z2);
    }

    public void unscheduleDrawable(Drawable drawable, Runnable runnable) {
        unscheduleSelf(runnable);
    }
}
