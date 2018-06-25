package android.support.v7.app;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.support.v7.p020a.C0411a.C0410j;
import android.support.v7.view.C0479b;
import android.support.v7.view.C0479b.C0462a;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;

public abstract class C0428a {

    public static class C0425a extends MarginLayoutParams {
        public int f1225a;

        public C0425a(int i, int i2) {
            super(i, i2);
            this.f1225a = 0;
            this.f1225a = 8388627;
        }

        public C0425a(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            this.f1225a = 0;
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, C0410j.ActionBarLayout);
            this.f1225a = obtainStyledAttributes.getInt(C0410j.ActionBarLayout_android_layout_gravity, 0);
            obtainStyledAttributes.recycle();
        }

        public C0425a(C0425a c0425a) {
            super(c0425a);
            this.f1225a = 0;
            this.f1225a = c0425a.f1225a;
        }

        public C0425a(LayoutParams layoutParams) {
            super(layoutParams);
            this.f1225a = 0;
        }
    }

    public interface C0426b {
        void m1873a(boolean z);
    }

    @Deprecated
    public static abstract class C0427c {
        public abstract Drawable m1874a();

        public abstract CharSequence m1875b();

        public abstract View m1876c();

        public abstract void m1877d();

        public abstract CharSequence m1878e();
    }

    public abstract int mo327a();

    public C0479b mo358a(C0462a c0462a) {
        return null;
    }

    public void mo328a(float f) {
        if (f != 0.0f) {
            throw new UnsupportedOperationException("Setting a non-zero elevation is not supported in this action bar configuration.");
        }
    }

    public void mo329a(Configuration configuration) {
    }

    public void mo330a(CharSequence charSequence) {
    }

    public void mo331a(boolean z) {
    }

    public boolean mo332a(int i, KeyEvent keyEvent) {
        return false;
    }

    public boolean mo333a(KeyEvent keyEvent) {
        return false;
    }

    public Context mo334b() {
        return null;
    }

    public void mo360b(boolean z) {
        if (z) {
            throw new UnsupportedOperationException("Hide on content scroll is not supported in this action bar configuration.");
        }
    }

    public void mo335c(boolean z) {
    }

    public boolean mo336c() {
        return false;
    }

    public void mo337d(boolean z) {
    }

    public boolean mo338d() {
        return false;
    }

    public void mo339e(boolean z) {
    }

    public boolean mo340e() {
        return false;
    }

    public boolean mo341f() {
        return false;
    }

    void mo342g() {
    }
}
