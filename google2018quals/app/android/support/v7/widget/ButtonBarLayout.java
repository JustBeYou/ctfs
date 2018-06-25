package android.support.v7.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.support.v4.p017h.C0315p;
import android.support.v7.p020a.C0411a.C0406f;
import android.support.v7.p020a.C0411a.C0410j;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.MeasureSpec;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;

public class ButtonBarLayout extends LinearLayout {
    private boolean f1861a;
    private int f1862b = -1;
    private int f1863c = 0;

    public ButtonBarLayout(Context context, AttributeSet attributeSet) {
        boolean z = false;
        super(context, attributeSet);
        if (getResources().getConfiguration().screenHeightDp >= 320) {
            z = true;
        }
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, C0410j.ButtonBarLayout);
        this.f1861a = obtainStyledAttributes.getBoolean(C0410j.ButtonBarLayout_allowStacking, z);
        obtainStyledAttributes.recycle();
    }

    private int m2686a(int i) {
        int childCount = getChildCount();
        for (int i2 = i; i2 < childCount; i2++) {
            if (getChildAt(i2).getVisibility() == 0) {
                return i2;
            }
        }
        return -1;
    }

    private boolean m2687a() {
        return getOrientation() == 1;
    }

    private void setStacked(boolean z) {
        setOrientation(z ? 1 : 0);
        setGravity(z ? 5 : 80);
        View findViewById = findViewById(C0406f.spacer);
        if (findViewById != null) {
            findViewById.setVisibility(z ? 8 : 4);
        }
        for (int childCount = getChildCount() - 2; childCount >= 0; childCount--) {
            bringChildToFront(getChildAt(childCount));
        }
    }

    public int getMinimumHeight() {
        return Math.max(this.f1863c, super.getMinimumHeight());
    }

    protected void onMeasure(int i, int i2) {
        boolean z;
        int size = MeasureSpec.getSize(i);
        if (this.f1861a) {
            if (size > this.f1862b && m2687a()) {
                setStacked(false);
            }
            this.f1862b = size;
        }
        if (m2687a() || MeasureSpec.getMode(i) != 1073741824) {
            size = i;
            z = false;
        } else {
            size = MeasureSpec.makeMeasureSpec(size, Integer.MIN_VALUE);
            z = true;
        }
        super.onMeasure(size, i2);
        if (this.f1861a && !m2687a()) {
            if ((getMeasuredWidthAndState() & -16777216) == 16777216) {
                setStacked(true);
                z = true;
            }
        }
        if (z) {
            super.onMeasure(i, i2);
        }
        int a = m2686a(0);
        if (a >= 0) {
            View childAt = getChildAt(a);
            LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
            size = (layoutParams.bottomMargin + ((childAt.getMeasuredHeight() + getPaddingTop()) + layoutParams.topMargin)) + 0;
            if (m2687a()) {
                a = m2686a(a + 1);
                if (a >= 0) {
                    size += getChildAt(a).getPaddingTop() + ((int) (16.0f * getResources().getDisplayMetrics().density));
                }
            } else {
                size += getPaddingBottom();
            }
        } else {
            size = 0;
        }
        if (C0315p.m1388c(this) != size) {
            setMinimumHeight(size);
        }
    }

    public void setAllowStacking(boolean z) {
        if (this.f1861a != z) {
            this.f1861a = z;
            if (!this.f1861a && getOrientation() == 1) {
                setStacked(false);
            }
            requestLayout();
        }
    }
}
