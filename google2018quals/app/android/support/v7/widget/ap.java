package android.support.v7.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.support.v7.app.C0428a.C0427c;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.view.C0488a;
import android.support.v7.widget.ai.C0548a;
import android.text.TextUtils;
import android.text.TextUtils.TruncateAt;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.BaseAdapter;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;

public class ap extends HorizontalScrollView implements OnItemSelectedListener {
    private static final Interpolator f2083j = new DecelerateInterpolator();
    Runnable f2084a;
    ai f2085b;
    int f2086c;
    int f2087d;
    private C0586b f2088e;
    private Spinner f2089f;
    private boolean f2090g;
    private int f2091h;
    private int f2092i;

    private class C0585a extends BaseAdapter {
        final /* synthetic */ ap f2075a;

        C0585a(ap apVar) {
            this.f2075a = apVar;
        }

        public int getCount() {
            return this.f2075a.f2085b.getChildCount();
        }

        public Object getItem(int i) {
            return ((C0587c) this.f2075a.f2085b.getChildAt(i)).m2911b();
        }

        public long getItemId(int i) {
            return (long) i;
        }

        public View getView(int i, View view, ViewGroup viewGroup) {
            if (view == null) {
                return this.f2075a.m2916a((C0427c) getItem(i), true);
            }
            ((C0587c) view).m2910a((C0427c) getItem(i));
            return view;
        }
    }

    private class C0586b implements OnClickListener {
        final /* synthetic */ ap f2076a;

        C0586b(ap apVar) {
            this.f2076a = apVar;
        }

        public void onClick(View view) {
            ((C0587c) view).m2911b().m1877d();
            int childCount = this.f2076a.f2085b.getChildCount();
            for (int i = 0; i < childCount; i++) {
                View childAt = this.f2076a.f2085b.getChildAt(i);
                childAt.setSelected(childAt == view);
            }
        }
    }

    private class C0587c extends ai {
        final /* synthetic */ ap f2077a;
        private final int[] f2078b = new int[]{16842964};
        private C0427c f2079c;
        private TextView f2080d;
        private ImageView f2081e;
        private View f2082f;

        public C0587c(ap apVar, Context context, C0427c c0427c, boolean z) {
            this.f2077a = apVar;
            super(context, null, C0401a.actionBarTabStyle);
            this.f2079c = c0427c;
            aw a = aw.m2953a(context, null, this.f2078b, C0401a.actionBarTabStyle, 0);
            if (a.m2971g(0)) {
                setBackgroundDrawable(a.m2957a(0));
            }
            a.m2958a();
            if (z) {
                setGravity(8388627);
            }
            m2909a();
        }

        public void m2909a() {
            C0427c c0427c = this.f2079c;
            View c = c0427c.m1876c();
            if (c != null) {
                C0587c parent = c.getParent();
                if (parent != this) {
                    if (parent != null) {
                        parent.removeView(c);
                    }
                    addView(c);
                }
                this.f2082f = c;
                if (this.f2080d != null) {
                    this.f2080d.setVisibility(8);
                }
                if (this.f2081e != null) {
                    this.f2081e.setVisibility(8);
                    this.f2081e.setImageDrawable(null);
                    return;
                }
                return;
            }
            if (this.f2082f != null) {
                removeView(this.f2082f);
                this.f2082f = null;
            }
            Drawable a = c0427c.m1874a();
            CharSequence b = c0427c.m1875b();
            if (a != null) {
                if (this.f2081e == null) {
                    View c0603p = new C0603p(getContext());
                    LayoutParams c0548a = new C0548a(-2, -2);
                    c0548a.f1802h = 16;
                    c0603p.setLayoutParams(c0548a);
                    addView(c0603p, 0);
                    this.f2081e = c0603p;
                }
                this.f2081e.setImageDrawable(a);
                this.f2081e.setVisibility(0);
            } else if (this.f2081e != null) {
                this.f2081e.setVisibility(8);
                this.f2081e.setImageDrawable(null);
            }
            int i = !TextUtils.isEmpty(b) ? 1 : 0;
            if (i != 0) {
                if (this.f2080d == null) {
                    c0603p = new aa(getContext(), null, C0401a.actionBarTabTextStyle);
                    c0603p.setEllipsize(TruncateAt.END);
                    c0548a = new C0548a(-2, -2);
                    c0548a.f1802h = 16;
                    c0603p.setLayoutParams(c0548a);
                    addView(c0603p);
                    this.f2080d = c0603p;
                }
                this.f2080d.setText(b);
                this.f2080d.setVisibility(0);
            } else if (this.f2080d != null) {
                this.f2080d.setVisibility(8);
                this.f2080d.setText(null);
            }
            if (this.f2081e != null) {
                this.f2081e.setContentDescription(c0427c.m1878e());
            }
            ay.m3021a(this, i != 0 ? null : c0427c.m1878e());
        }

        public void m2910a(C0427c c0427c) {
            this.f2079c = c0427c;
            m2909a();
        }

        public C0427c m2911b() {
            return this.f2079c;
        }

        public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
            super.onInitializeAccessibilityEvent(accessibilityEvent);
            accessibilityEvent.setClassName(C0427c.class.getName());
        }

        public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
            super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
            accessibilityNodeInfo.setClassName(C0427c.class.getName());
        }

        public void onMeasure(int i, int i2) {
            super.onMeasure(i, i2);
            if (this.f2077a.f2086c > 0 && getMeasuredWidth() > this.f2077a.f2086c) {
                super.onMeasure(MeasureSpec.makeMeasureSpec(this.f2077a.f2086c, 1073741824), i2);
            }
        }

        public void setSelected(boolean z) {
            Object obj = isSelected() != z ? 1 : null;
            super.setSelected(z);
            if (obj != null && z) {
                sendAccessibilityEvent(4);
            }
        }
    }

    private boolean m2912a() {
        return this.f2089f != null && this.f2089f.getParent() == this;
    }

    private void m2913b() {
        if (!m2912a()) {
            if (this.f2089f == null) {
                this.f2089f = m2915d();
            }
            removeView(this.f2085b);
            addView(this.f2089f, new LayoutParams(-2, -1));
            if (this.f2089f.getAdapter() == null) {
                this.f2089f.setAdapter(new C0585a(this));
            }
            if (this.f2084a != null) {
                removeCallbacks(this.f2084a);
                this.f2084a = null;
            }
            this.f2089f.setSelection(this.f2092i);
        }
    }

    private boolean m2914c() {
        if (m2912a()) {
            removeView(this.f2089f);
            addView(this.f2085b, new LayoutParams(-2, -1));
            setTabSelected(this.f2089f.getSelectedItemPosition());
        }
        return false;
    }

    private Spinner m2915d() {
        Spinner c0641x = new C0641x(getContext(), null, C0401a.actionDropDownStyle);
        c0641x.setLayoutParams(new C0548a(-2, -1));
        c0641x.setOnItemSelectedListener(this);
        return c0641x;
    }

    C0587c m2916a(C0427c c0427c, boolean z) {
        C0587c c0587c = new C0587c(this, getContext(), c0427c, z);
        if (z) {
            c0587c.setBackgroundDrawable(null);
            c0587c.setLayoutParams(new AbsListView.LayoutParams(-1, this.f2091h));
        } else {
            c0587c.setFocusable(true);
            if (this.f2088e == null) {
                this.f2088e = new C0586b(this);
            }
            c0587c.setOnClickListener(this.f2088e);
        }
        return c0587c;
    }

    public void m2917a(int i) {
        final View childAt = this.f2085b.getChildAt(i);
        if (this.f2084a != null) {
            removeCallbacks(this.f2084a);
        }
        this.f2084a = new Runnable(this) {
            final /* synthetic */ ap f2074b;

            public void run() {
                this.f2074b.smoothScrollTo(childAt.getLeft() - ((this.f2074b.getWidth() - childAt.getWidth()) / 2), 0);
                this.f2074b.f2084a = null;
            }
        };
        post(this.f2084a);
    }

    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.f2084a != null) {
            post(this.f2084a);
        }
    }

    protected void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        C0488a a = C0488a.m2223a(getContext());
        setContentHeight(a.m2228e());
        this.f2087d = a.m2230g();
    }

    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.f2084a != null) {
            removeCallbacks(this.f2084a);
        }
    }

    public void onItemSelected(AdapterView<?> adapterView, View view, int i, long j) {
        ((C0587c) view).m2911b().m1877d();
    }

    public void onMeasure(int i, int i2) {
        int i3 = 1;
        int mode = MeasureSpec.getMode(i);
        boolean z = mode == 1073741824;
        setFillViewport(z);
        int childCount = this.f2085b.getChildCount();
        if (childCount <= 1 || !(mode == 1073741824 || mode == Integer.MIN_VALUE)) {
            this.f2086c = -1;
        } else {
            if (childCount > 2) {
                this.f2086c = (int) (((float) MeasureSpec.getSize(i)) * 0.4f);
            } else {
                this.f2086c = MeasureSpec.getSize(i) / 2;
            }
            this.f2086c = Math.min(this.f2086c, this.f2087d);
        }
        mode = MeasureSpec.makeMeasureSpec(this.f2091h, 1073741824);
        if (z || !this.f2090g) {
            i3 = 0;
        }
        if (i3 != 0) {
            this.f2085b.measure(0, mode);
            if (this.f2085b.getMeasuredWidth() > MeasureSpec.getSize(i)) {
                m2913b();
            } else {
                m2914c();
            }
        } else {
            m2914c();
        }
        i3 = getMeasuredWidth();
        super.onMeasure(i, mode);
        int measuredWidth = getMeasuredWidth();
        if (z && i3 != measuredWidth) {
            setTabSelected(this.f2092i);
        }
    }

    public void onNothingSelected(AdapterView<?> adapterView) {
    }

    public void setAllowCollapse(boolean z) {
        this.f2090g = z;
    }

    public void setContentHeight(int i) {
        this.f2091h = i;
        requestLayout();
    }

    public void setTabSelected(int i) {
        this.f2092i = i;
        int childCount = this.f2085b.getChildCount();
        int i2 = 0;
        while (i2 < childCount) {
            View childAt = this.f2085b.getChildAt(i2);
            boolean z = i2 == i;
            childAt.setSelected(z);
            if (z) {
                m2917a(i);
            }
            i2++;
        }
        if (this.f2089f != null && i >= 0) {
            this.f2089f.setSelection(i);
        }
    }
}
