package android.support.v7.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.support.v4.p017h.C0303o;
import android.support.v4.widget.C0400l;
import android.support.v7.p020a.C0411a.C0401a;
import android.util.AttributeSet;
import android.widget.ImageButton;

public class C0625n extends ImageButton implements C0303o, C0400l {
    private final C0614g f2269a;
    private final C0626o f2270b;

    public C0625n(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, C0401a.imageButtonStyle);
    }

    public C0625n(Context context, AttributeSet attributeSet, int i) {
        super(at.m2948a(context), attributeSet, i);
        this.f2269a = new C0614g(this);
        this.f2269a.m3102a(attributeSet, i);
        this.f2270b = new C0626o(this);
        this.f2270b.m3155a(attributeSet, i);
    }

    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.f2269a != null) {
            this.f2269a.m3105c();
        }
        if (this.f2270b != null) {
            this.f2270b.m3159d();
        }
    }

    public ColorStateList getSupportBackgroundTintList() {
        return this.f2269a != null ? this.f2269a.m3097a() : null;
    }

    public Mode getSupportBackgroundTintMode() {
        return this.f2269a != null ? this.f2269a.m3103b() : null;
    }

    public ColorStateList getSupportImageTintList() {
        return this.f2270b != null ? this.f2270b.m3157b() : null;
    }

    public Mode getSupportImageTintMode() {
        return this.f2270b != null ? this.f2270b.m3158c() : null;
    }

    public boolean hasOverlappingRendering() {
        return this.f2270b.m3156a() && super.hasOverlappingRendering();
    }

    public void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        if (this.f2269a != null) {
            this.f2269a.m3101a(drawable);
        }
    }

    public void setBackgroundResource(int i) {
        super.setBackgroundResource(i);
        if (this.f2269a != null) {
            this.f2269a.m3098a(i);
        }
    }

    public void setImageBitmap(Bitmap bitmap) {
        super.setImageBitmap(bitmap);
        if (this.f2270b != null) {
            this.f2270b.m3159d();
        }
    }

    public void setImageDrawable(Drawable drawable) {
        super.setImageDrawable(drawable);
        if (this.f2270b != null) {
            this.f2270b.m3159d();
        }
    }

    public void setImageIcon(Icon icon) {
        super.setImageIcon(icon);
        if (this.f2270b != null) {
            this.f2270b.m3159d();
        }
    }

    public void setImageResource(int i) {
        this.f2270b.m3152a(i);
    }

    public void setImageURI(Uri uri) {
        super.setImageURI(uri);
        if (this.f2270b != null) {
            this.f2270b.m3159d();
        }
    }

    public void setSupportBackgroundTintList(ColorStateList colorStateList) {
        if (this.f2269a != null) {
            this.f2269a.m3099a(colorStateList);
        }
    }

    public void setSupportBackgroundTintMode(Mode mode) {
        if (this.f2269a != null) {
            this.f2269a.m3100a(mode);
        }
    }

    public void setSupportImageTintList(ColorStateList colorStateList) {
        if (this.f2270b != null) {
            this.f2270b.m3153a(colorStateList);
        }
    }

    public void setSupportImageTintMode(Mode mode) {
        if (this.f2270b != null) {
            this.f2270b.m3154a(mode);
        }
    }
}
