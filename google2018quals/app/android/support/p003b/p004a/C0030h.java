package android.support.p003b.p004a;

import android.content.res.Resources.Theme;
import android.graphics.ColorFilter;
import android.graphics.PorterDuff.Mode;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.drawable.Drawable;
import android.support.v4.p005c.p006a.C0029f;
import android.support.v4.p005c.p006a.C0179a;

abstract class C0030h extends Drawable implements C0029f {
    Drawable f58b;

    C0030h() {
    }

    public void applyTheme(Theme theme) {
        if (this.f58b != null) {
            C0179a.m934a(this.f58b, theme);
        }
    }

    public void clearColorFilter() {
        if (this.f58b != null) {
            this.f58b.clearColorFilter();
        } else {
            super.clearColorFilter();
        }
    }

    public ColorFilter getColorFilter() {
        return this.f58b != null ? C0179a.m942e(this.f58b) : null;
    }

    public Drawable getCurrent() {
        return this.f58b != null ? this.f58b.getCurrent() : super.getCurrent();
    }

    public int getMinimumHeight() {
        return this.f58b != null ? this.f58b.getMinimumHeight() : super.getMinimumHeight();
    }

    public int getMinimumWidth() {
        return this.f58b != null ? this.f58b.getMinimumWidth() : super.getMinimumWidth();
    }

    public boolean getPadding(Rect rect) {
        return this.f58b != null ? this.f58b.getPadding(rect) : super.getPadding(rect);
    }

    public int[] getState() {
        return this.f58b != null ? this.f58b.getState() : super.getState();
    }

    public Region getTransparentRegion() {
        return this.f58b != null ? this.f58b.getTransparentRegion() : super.getTransparentRegion();
    }

    public void jumpToCurrentState() {
        if (this.f58b != null) {
            C0179a.m929a(this.f58b);
        }
    }

    protected void onBoundsChange(Rect rect) {
        if (this.f58b != null) {
            this.f58b.setBounds(rect);
        } else {
            super.onBoundsChange(rect);
        }
    }

    protected boolean onLevelChange(int i) {
        return this.f58b != null ? this.f58b.setLevel(i) : super.onLevelChange(i);
    }

    public void setChangingConfigurations(int i) {
        if (this.f58b != null) {
            this.f58b.setChangingConfigurations(i);
        } else {
            super.setChangingConfigurations(i);
        }
    }

    public void setColorFilter(int i, Mode mode) {
        if (this.f58b != null) {
            this.f58b.setColorFilter(i, mode);
        } else {
            super.setColorFilter(i, mode);
        }
    }

    public void setFilterBitmap(boolean z) {
        if (this.f58b != null) {
            this.f58b.setFilterBitmap(z);
        }
    }

    public void setHotspot(float f, float f2) {
        if (this.f58b != null) {
            C0179a.m930a(this.f58b, f, f2);
        }
    }

    public void setHotspotBounds(int i, int i2, int i3, int i4) {
        if (this.f58b != null) {
            C0179a.m932a(this.f58b, i, i2, i3, i4);
        }
    }

    public boolean setState(int[] iArr) {
        return this.f58b != null ? this.f58b.setState(iArr) : super.setState(iArr);
    }
}
