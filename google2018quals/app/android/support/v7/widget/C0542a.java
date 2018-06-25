package android.support.v7.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.support.v4.p017h.C0315p;
import android.support.v4.p017h.C0322s;
import android.support.v4.p017h.C0324r;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.p020a.C0411a.C0410j;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;

abstract class C0542a extends ViewGroup {
    protected final C0572a f1750a;
    protected final Context f1751b;
    protected ActionMenuView f1752c;
    protected C0607d f1753d;
    protected int f1754e;
    protected C0324r f1755f;
    private boolean f1756g;
    private boolean f1757h;

    protected class C0572a implements C0322s {
        int f1981a;
        final /* synthetic */ C0542a f1982b;
        private boolean f1983c = false;

        protected C0572a(C0542a c0542a) {
            this.f1982b = c0542a;
        }

        public C0572a m2782a(C0324r c0324r, int i) {
            this.f1982b.f1755f = c0324r;
            this.f1981a = i;
            return this;
        }

        public void mo155a(View view) {
            super.setVisibility(0);
            this.f1983c = false;
        }

        public void mo156b(View view) {
            if (!this.f1983c) {
                this.f1982b.f1755f = null;
                super.setVisibility(this.f1981a);
            }
        }

        public void mo157c(View view) {
            this.f1983c = true;
        }
    }

    C0542a(Context context) {
        this(context, null);
    }

    C0542a(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    C0542a(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.f1750a = new C0572a(this);
        TypedValue typedValue = new TypedValue();
        if (!context.getTheme().resolveAttribute(C0401a.actionBarPopupTheme, typedValue, true) || typedValue.resourceId == 0) {
            this.f1751b = context;
        } else {
            this.f1751b = new ContextThemeWrapper(context, typedValue.resourceId);
        }
    }

    protected static int m2577a(int i, int i2, boolean z) {
        return z ? i - i2 : i + i2;
    }

    protected int m2580a(View view, int i, int i2, int i3) {
        view.measure(MeasureSpec.makeMeasureSpec(i, Integer.MIN_VALUE), i2);
        return Math.max(0, (i - view.getMeasuredWidth()) - i3);
    }

    protected int m2581a(View view, int i, int i2, int i3, boolean z) {
        int measuredWidth = view.getMeasuredWidth();
        int measuredHeight = view.getMeasuredHeight();
        int i4 = ((i3 - measuredHeight) / 2) + i2;
        if (z) {
            view.layout(i - measuredWidth, i4, i, measuredHeight + i4);
        } else {
            view.layout(i, i4, i + measuredWidth, measuredHeight + i4);
        }
        return z ? -measuredWidth : measuredWidth;
    }

    public C0324r mo446a(int i, long j) {
        if (this.f1755f != null) {
            this.f1755f.m1436b();
        }
        if (i == 0) {
            if (getVisibility() != 0) {
                setAlpha(0.0f);
            }
            C0324r a = C0315p.m1389d(this).m1429a(1.0f);
            a.m1430a(j);
            a.m1431a(this.f1750a.m2782a(a, i));
            return a;
        }
        a = C0315p.m1389d(this).m1429a(0.0f);
        a.m1430a(j);
        a.m1431a(this.f1750a.m2782a(a, i));
        return a;
    }

    public boolean mo447a() {
        return this.f1753d != null ? this.f1753d.m3071d() : false;
    }

    public int getAnimatedVisibility() {
        return this.f1755f != null ? this.f1750a.f1981a : getVisibility();
    }

    public int getContentHeight() {
        return this.f1754e;
    }

    protected void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        TypedArray obtainStyledAttributes = getContext().obtainStyledAttributes(null, C0410j.ActionBar, C0401a.actionBarStyle, 0);
        setContentHeight(obtainStyledAttributes.getLayoutDimension(C0410j.ActionBar_height, 0));
        obtainStyledAttributes.recycle();
        if (this.f1753d != null) {
            this.f1753d.m3057a(configuration);
        }
    }

    public boolean onHoverEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 9) {
            this.f1757h = false;
        }
        if (!this.f1757h) {
            boolean onHoverEvent = super.onHoverEvent(motionEvent);
            if (actionMasked == 9 && !onHoverEvent) {
                this.f1757h = true;
            }
        }
        if (actionMasked == 10 || actionMasked == 3) {
            this.f1757h = false;
        }
        return true;
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0) {
            this.f1756g = false;
        }
        if (!this.f1756g) {
            boolean onTouchEvent = super.onTouchEvent(motionEvent);
            if (actionMasked == 0 && !onTouchEvent) {
                this.f1756g = true;
            }
        }
        if (actionMasked == 1 || actionMasked == 3) {
            this.f1756g = false;
        }
        return true;
    }

    public void setContentHeight(int i) {
        this.f1754e = i;
        requestLayout();
    }

    public void setVisibility(int i) {
        if (i != getVisibility()) {
            if (this.f1755f != null) {
                this.f1755f.m1436b();
            }
            super.setVisibility(i);
        }
    }
}
