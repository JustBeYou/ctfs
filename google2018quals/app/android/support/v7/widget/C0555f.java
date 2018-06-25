package android.support.v7.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.support.v4.p017h.C0303o;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.p021b.p022a.C0485b;
import android.util.AttributeSet;
import android.widget.AutoCompleteTextView;
import android.widget.TextView;

public class C0555f extends AutoCompleteTextView implements C0303o {
    private static final int[] f1867a = new int[]{16843126};
    private final C0614g f1868b;
    private final C0642y f1869c;

    public C0555f(Context context) {
        this(context, null);
    }

    public C0555f(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, C0401a.autoCompleteTextViewStyle);
    }

    public C0555f(Context context, AttributeSet attributeSet, int i) {
        super(at.m2948a(context), attributeSet, i);
        aw a = aw.m2953a(getContext(), attributeSet, f1867a, i, 0);
        if (a.m2971g(0)) {
            setDropDownBackgroundDrawable(a.m2957a(0));
        }
        a.m2958a();
        this.f1868b = new C0614g(this);
        this.f1868b.m3102a(attributeSet, i);
        this.f1869c = C0642y.m3188a((TextView) this);
        this.f1869c.mo551a(attributeSet, i);
        this.f1869c.mo550a();
    }

    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.f1868b != null) {
            this.f1868b.m3105c();
        }
        if (this.f1869c != null) {
            this.f1869c.mo550a();
        }
    }

    public ColorStateList getSupportBackgroundTintList() {
        return this.f1868b != null ? this.f1868b.m3097a() : null;
    }

    public Mode getSupportBackgroundTintMode() {
        return this.f1868b != null ? this.f1868b.m3103b() : null;
    }

    public void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        if (this.f1868b != null) {
            this.f1868b.m3101a(drawable);
        }
    }

    public void setBackgroundResource(int i) {
        super.setBackgroundResource(i);
        if (this.f1868b != null) {
            this.f1868b.m3098a(i);
        }
    }

    public void setDropDownBackgroundResource(int i) {
        setDropDownBackgroundDrawable(C0485b.m2214b(getContext(), i));
    }

    public void setSupportBackgroundTintList(ColorStateList colorStateList) {
        if (this.f1868b != null) {
            this.f1868b.m3099a(colorStateList);
        }
    }

    public void setSupportBackgroundTintMode(Mode mode) {
        if (this.f1868b != null) {
            this.f1868b.m3100a(mode);
        }
    }

    public void setTextAppearance(Context context, int i) {
        super.setTextAppearance(context, i);
        if (this.f1869c != null) {
            this.f1869c.m3195a(context, i);
        }
    }
}
