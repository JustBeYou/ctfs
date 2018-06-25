package android.support.v4.p005c.p006a;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Outline;
import android.graphics.PorterDuff.Mode;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableContainer;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build.VERSION;
import android.support.v4.p005c.p006a.C0183c.C0181a;
import android.util.Log;
import java.lang.reflect.Method;

class C0187e extends C0185d {
    private static Method f750d;

    private static class C0186a extends C0181a {
        C0186a(C0181a c0181a, Resources resources) {
            super(c0181a, resources);
        }

        public Drawable newDrawable(Resources resources) {
            return new C0187e(this, resources);
        }
    }

    C0187e(Drawable drawable) {
        super(drawable);
        m956d();
    }

    C0187e(C0181a c0181a, Resources resources) {
        super(c0181a, resources);
        m956d();
    }

    private void m956d() {
        if (f750d == null) {
            try {
                f750d = Drawable.class.getDeclaredMethod("isProjected", new Class[0]);
            } catch (Throwable e) {
                Log.w("DrawableWrapperApi21", "Failed to retrieve Drawable#isProjected() method", e);
            }
        }
    }

    C0181a mo85b() {
        return new C0186a(this.b, null);
    }

    protected boolean mo86c() {
        if (VERSION.SDK_INT != 21) {
            return false;
        }
        Drawable drawable = this.c;
        return (drawable instanceof GradientDrawable) || (drawable instanceof DrawableContainer) || (drawable instanceof InsetDrawable) || (drawable instanceof RippleDrawable);
    }

    public Rect getDirtyBounds() {
        return this.c.getDirtyBounds();
    }

    public void getOutline(Outline outline) {
        this.c.getOutline(outline);
    }

    public void setHotspot(float f, float f2) {
        this.c.setHotspot(f, f2);
    }

    public void setHotspotBounds(int i, int i2, int i3, int i4) {
        this.c.setHotspotBounds(i, i2, i3, i4);
    }

    public boolean setState(int[] iArr) {
        if (!super.setState(iArr)) {
            return false;
        }
        invalidateSelf();
        return true;
    }

    public void setTint(int i) {
        if (mo86c()) {
            super.setTint(i);
        } else {
            this.c.setTint(i);
        }
    }

    public void setTintList(ColorStateList colorStateList) {
        if (mo86c()) {
            super.setTintList(colorStateList);
        } else {
            this.c.setTintList(colorStateList);
        }
    }

    public void setTintMode(Mode mode) {
        if (mo86c()) {
            super.setTintMode(mode);
        } else {
            this.c.setTintMode(mode);
        }
    }
}
