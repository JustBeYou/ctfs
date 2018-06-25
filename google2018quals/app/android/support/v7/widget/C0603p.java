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
import android.util.AttributeSet;
import android.widget.ImageView;

public class C0603p extends ImageView implements C0303o, C0400l {
    private final C0614g f2185a;
    private final C0626o f2186b;

    public C0603p(Context context) {
        this(context, null);
    }

    public C0603p(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public C0603p(Context context, AttributeSet attributeSet, int i) {
        super(at.m2948a(context), attributeSet, i);
        this.f2185a = new C0614g(this);
        this.f2185a.m3102a(attributeSet, i);
        this.f2186b = new C0626o(this);
        this.f2186b.m3155a(attributeSet, i);
    }

    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.f2185a != null) {
            this.f2185a.m3105c();
        }
        if (this.f2186b != null) {
            this.f2186b.m3159d();
        }
    }

    public ColorStateList getSupportBackgroundTintList() {
        return this.f2185a != null ? this.f2185a.m3097a() : null;
    }

    public Mode getSupportBackgroundTintMode() {
        return this.f2185a != null ? this.f2185a.m3103b() : null;
    }

    public ColorStateList getSupportImageTintList() {
        return this.f2186b != null ? this.f2186b.m3157b() : null;
    }

    public Mode getSupportImageTintMode() {
        return this.f2186b != null ? this.f2186b.m3158c() : null;
    }

    public boolean hasOverlappingRendering() {
        return this.f2186b.m3156a() && super.hasOverlappingRendering();
    }

    public void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        if (this.f2185a != null) {
            this.f2185a.m3101a(drawable);
        }
    }

    public void setBackgroundResource(int i) {
        super.setBackgroundResource(i);
        if (this.f2185a != null) {
            this.f2185a.m3098a(i);
        }
    }

    public void setImageBitmap(Bitmap bitmap) {
        super.setImageBitmap(bitmap);
        if (this.f2186b != null) {
            this.f2186b.m3159d();
        }
    }

    public void setImageDrawable(Drawable drawable) {
        super.setImageDrawable(drawable);
        if (this.f2186b != null) {
            this.f2186b.m3159d();
        }
    }

    public void setImageIcon(Icon icon) {
        super.setImageIcon(icon);
        if (this.f2186b != null) {
            this.f2186b.m3159d();
        }
    }

    public void setImageResource(int i) {
        if (this.f2186b != null) {
            this.f2186b.m3152a(i);
        }
    }

    public void setImageURI(Uri uri) {
        super.setImageURI(uri);
        if (this.f2186b != null) {
            this.f2186b.m3159d();
        }
    }

    public void setSupportBackgroundTintList(ColorStateList colorStateList) {
        if (this.f2185a != null) {
            this.f2185a.m3099a(colorStateList);
        }
    }

    public void setSupportBackgroundTintMode(Mode mode) {
        if (this.f2185a != null) {
            this.f2185a.m3100a(mode);
        }
    }

    public void setSupportImageTintList(ColorStateList colorStateList) {
        if (this.f2186b != null) {
            this.f2186b.m3153a(colorStateList);
        }
    }

    public void setSupportImageTintMode(Mode mode) {
        if (this.f2186b != null) {
            this.f2186b.m3154a(mode);
        }
    }
}
