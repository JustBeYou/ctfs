package android.support.v7.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.support.v4.widget.C0399k;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.p021b.p022a.C0485b;
import android.util.AttributeSet;
import android.widget.RadioButton;

public class C0631t extends RadioButton implements C0399k {
    private final C0618k f2286a;

    public C0631t(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, C0401a.radioButtonStyle);
    }

    public C0631t(Context context, AttributeSet attributeSet, int i) {
        super(at.m2948a(context), attributeSet, i);
        this.f2286a = new C0618k(this);
        this.f2286a.m3110a(attributeSet, i);
    }

    public int getCompoundPaddingLeft() {
        int compoundPaddingLeft = super.getCompoundPaddingLeft();
        return this.f2286a != null ? this.f2286a.m3106a(compoundPaddingLeft) : compoundPaddingLeft;
    }

    public ColorStateList getSupportButtonTintList() {
        return this.f2286a != null ? this.f2286a.m3107a() : null;
    }

    public Mode getSupportButtonTintMode() {
        return this.f2286a != null ? this.f2286a.m3111b() : null;
    }

    public void setButtonDrawable(int i) {
        setButtonDrawable(C0485b.m2214b(getContext(), i));
    }

    public void setButtonDrawable(Drawable drawable) {
        super.setButtonDrawable(drawable);
        if (this.f2286a != null) {
            this.f2286a.m3112c();
        }
    }

    public void setSupportButtonTintList(ColorStateList colorStateList) {
        if (this.f2286a != null) {
            this.f2286a.m3108a(colorStateList);
        }
    }

    public void setSupportButtonTintMode(Mode mode) {
        if (this.f2286a != null) {
            this.f2286a.m3109a(mode);
        }
    }
}
