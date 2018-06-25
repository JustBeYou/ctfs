package android.support.v7.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.support.v7.p020a.C0411a.C0410j;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import java.lang.ref.WeakReference;

public final class ViewStubCompat extends View {
    private int f1976a;
    private int f1977b;
    private WeakReference<View> f1978c;
    private LayoutInflater f1979d;
    private C0571a f1980e;

    public interface C0571a {
        void m2780a(ViewStubCompat viewStubCompat, View view);
    }

    public ViewStubCompat(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public ViewStubCompat(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.f1976a = 0;
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, C0410j.ViewStubCompat, i, 0);
        this.f1977b = obtainStyledAttributes.getResourceId(C0410j.ViewStubCompat_android_inflatedId, -1);
        this.f1976a = obtainStyledAttributes.getResourceId(C0410j.ViewStubCompat_android_layout, 0);
        setId(obtainStyledAttributes.getResourceId(C0410j.ViewStubCompat_android_id, -1));
        obtainStyledAttributes.recycle();
        setVisibility(8);
        setWillNotDraw(true);
    }

    public View m2781a() {
        ViewParent parent = getParent();
        if (parent == null || !(parent instanceof ViewGroup)) {
            throw new IllegalStateException("ViewStub must have a non-null ViewGroup viewParent");
        } else if (this.f1976a != 0) {
            ViewGroup viewGroup = (ViewGroup) parent;
            View inflate = (this.f1979d != null ? this.f1979d : LayoutInflater.from(getContext())).inflate(this.f1976a, viewGroup, false);
            if (this.f1977b != -1) {
                inflate.setId(this.f1977b);
            }
            int indexOfChild = viewGroup.indexOfChild(this);
            viewGroup.removeViewInLayout(this);
            LayoutParams layoutParams = getLayoutParams();
            if (layoutParams != null) {
                viewGroup.addView(inflate, indexOfChild, layoutParams);
            } else {
                viewGroup.addView(inflate, indexOfChild);
            }
            this.f1978c = new WeakReference(inflate);
            if (this.f1980e != null) {
                this.f1980e.m2780a(this, inflate);
            }
            return inflate;
        } else {
            throw new IllegalArgumentException("ViewStub must have a valid layoutResource");
        }
    }

    protected void dispatchDraw(Canvas canvas) {
    }

    public void draw(Canvas canvas) {
    }

    public int getInflatedId() {
        return this.f1977b;
    }

    public LayoutInflater getLayoutInflater() {
        return this.f1979d;
    }

    public int getLayoutResource() {
        return this.f1976a;
    }

    protected void onMeasure(int i, int i2) {
        setMeasuredDimension(0, 0);
    }

    public void setInflatedId(int i) {
        this.f1977b = i;
    }

    public void setLayoutInflater(LayoutInflater layoutInflater) {
        this.f1979d = layoutInflater;
    }

    public void setLayoutResource(int i) {
        this.f1976a = i;
    }

    public void setOnInflateListener(C0571a c0571a) {
        this.f1980e = c0571a;
    }

    public void setVisibility(int i) {
        if (this.f1978c != null) {
            View view = (View) this.f1978c.get();
            if (view != null) {
                view.setVisibility(i);
                return;
            }
            throw new IllegalStateException("setVisibility called on un-referenced view");
        }
        super.setVisibility(i);
        if (i == 0 || i == 4) {
            m2781a();
        }
    }
}
