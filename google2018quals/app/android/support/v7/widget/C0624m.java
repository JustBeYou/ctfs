package android.support.v7.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.support.v4.p017h.C0303o;
import android.support.v7.p020a.C0411a.C0401a;
import android.util.AttributeSet;
import android.widget.EditText;
import android.widget.TextView;

public class C0624m extends EditText implements C0303o {
    private final C0614g f2267a;
    private final C0642y f2268b;

    public C0624m(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, C0401a.editTextStyle);
    }

    public C0624m(Context context, AttributeSet attributeSet, int i) {
        super(at.m2948a(context), attributeSet, i);
        this.f2267a = new C0614g(this);
        this.f2267a.m3102a(attributeSet, i);
        this.f2268b = C0642y.m3188a((TextView) this);
        this.f2268b.mo551a(attributeSet, i);
        this.f2268b.mo550a();
    }

    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.f2267a != null) {
            this.f2267a.m3105c();
        }
        if (this.f2268b != null) {
            this.f2268b.mo550a();
        }
    }

    public ColorStateList getSupportBackgroundTintList() {
        return this.f2267a != null ? this.f2267a.m3097a() : null;
    }

    public Mode getSupportBackgroundTintMode() {
        return this.f2267a != null ? this.f2267a.m3103b() : null;
    }

    public void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        if (this.f2267a != null) {
            this.f2267a.m3101a(drawable);
        }
    }

    public void setBackgroundResource(int i) {
        super.setBackgroundResource(i);
        if (this.f2267a != null) {
            this.f2267a.m3098a(i);
        }
    }

    public void setSupportBackgroundTintList(ColorStateList colorStateList) {
        if (this.f2267a != null) {
            this.f2267a.m3099a(colorStateList);
        }
    }

    public void setSupportBackgroundTintMode(Mode mode) {
        if (this.f2267a != null) {
            this.f2267a.m3100a(mode);
        }
    }

    public void setTextAppearance(Context context, int i) {
        super.setTextAppearance(context, i);
        if (this.f2268b != null) {
            this.f2268b.m3195a(context, i);
        }
    }
}
