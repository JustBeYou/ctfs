package android.support.v7.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.support.v7.p020a.C0411a.C0410j;
import android.util.AttributeSet;
import android.widget.TextView;

class C0643z extends C0642y {
    private au f2325b;
    private au f2326c;

    C0643z(TextView textView) {
        super(textView);
    }

    void mo550a() {
        super.mo550a();
        if (this.f2325b != null || this.f2326c != null) {
            Drawable[] compoundDrawablesRelative = this.a.getCompoundDrawablesRelative();
            m3196a(compoundDrawablesRelative[0], this.f2325b);
            m3196a(compoundDrawablesRelative[2], this.f2326c);
        }
    }

    void mo551a(AttributeSet attributeSet, int i) {
        super.mo551a(attributeSet, i);
        Context context = this.a.getContext();
        C0623l a = C0623l.m3126a();
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, C0410j.AppCompatTextHelper, i, 0);
        if (obtainStyledAttributes.hasValue(C0410j.AppCompatTextHelper_android_drawableStart)) {
            this.f2325b = C0642y.m3187a(context, a, obtainStyledAttributes.getResourceId(C0410j.AppCompatTextHelper_android_drawableStart, 0));
        }
        if (obtainStyledAttributes.hasValue(C0410j.AppCompatTextHelper_android_drawableEnd)) {
            this.f2326c = C0642y.m3187a(context, a, obtainStyledAttributes.getResourceId(C0410j.AppCompatTextHelper_android_drawableEnd, 0));
        }
        obtainStyledAttributes.recycle();
    }
}
