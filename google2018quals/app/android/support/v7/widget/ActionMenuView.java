package android.support.v7.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.support.v7.view.menu.ActionMenuItemView;
import android.support.v7.view.menu.C0504p;
import android.support.v7.view.menu.C0506o.C0459a;
import android.support.v7.view.menu.C0521h;
import android.support.v7.view.menu.C0521h.C0442a;
import android.support.v7.view.menu.C0521h.C0503b;
import android.support.v7.view.menu.C0524j;
import android.support.v7.widget.ai.C0548a;
import android.util.AttributeSet;
import android.view.ContextThemeWrapper;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewDebug.ExportedProperty;
import android.view.ViewGroup.LayoutParams;
import android.view.accessibility.AccessibilityEvent;

public class ActionMenuView extends ai implements C0503b, C0504p {
    C0442a f1825a;
    C0551e f1826b;
    private C0521h f1827c;
    private Context f1828d;
    private int f1829e;
    private boolean f1830f;
    private C0607d f1831g;
    private C0459a f1832h;
    private boolean f1833i;
    private int f1834j;
    private int f1835k;
    private int f1836l;

    public interface C0502a {
        boolean mo374c();

        boolean mo375d();
    }

    private static class C0547b implements C0459a {
        C0547b() {
        }

        public void mo321a(C0521h c0521h, boolean z) {
        }

        public boolean mo322a(C0521h c0521h) {
            return false;
        }
    }

    public static class C0549c extends C0548a {
        @ExportedProperty
        public boolean f1803a;
        @ExportedProperty
        public int f1804b;
        @ExportedProperty
        public int f1805c;
        @ExportedProperty
        public boolean f1806d;
        @ExportedProperty
        public boolean f1807e;
        boolean f1808f;

        public C0549c(int i, int i2) {
            super(i, i2);
            this.f1803a = false;
        }

        public C0549c(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
        }

        public C0549c(C0549c c0549c) {
            super(c0549c);
            this.f1803a = c0549c.f1803a;
        }

        public C0549c(LayoutParams layoutParams) {
            super(layoutParams);
        }
    }

    private class C0550d implements C0442a {
        final /* synthetic */ ActionMenuView f1809a;

        C0550d(ActionMenuView actionMenuView) {
            this.f1809a = actionMenuView;
        }

        public void mo297a(C0521h c0521h) {
            if (this.f1809a.f1825a != null) {
                this.f1809a.f1825a.mo297a(c0521h);
            }
        }

        public boolean mo301a(C0521h c0521h, MenuItem menuItem) {
            return this.f1809a.f1826b != null && this.f1809a.f1826b.mo476a(menuItem);
        }
    }

    public interface C0551e {
        boolean mo476a(MenuItem menuItem);
    }

    public ActionMenuView(Context context) {
        this(context, null);
    }

    public ActionMenuView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setBaselineAligned(false);
        float f = context.getResources().getDisplayMetrics().density;
        this.f1835k = (int) (56.0f * f);
        this.f1836l = (int) (f * 4.0f);
        this.f1828d = context;
        this.f1829e = 0;
    }

    static int m2648a(View view, int i, int i2, int i3, int i4) {
        int i5;
        boolean z = false;
        C0549c c0549c = (C0549c) view.getLayoutParams();
        int makeMeasureSpec = MeasureSpec.makeMeasureSpec(MeasureSpec.getSize(i3) - i4, MeasureSpec.getMode(i3));
        ActionMenuItemView actionMenuItemView = view instanceof ActionMenuItemView ? (ActionMenuItemView) view : null;
        boolean z2 = actionMenuItemView != null && actionMenuItemView.m2303b();
        if (i2 <= 0 || (z2 && i2 < 2)) {
            i5 = 0;
        } else {
            view.measure(MeasureSpec.makeMeasureSpec(i * i2, Integer.MIN_VALUE), makeMeasureSpec);
            int measuredWidth = view.getMeasuredWidth();
            i5 = measuredWidth / i;
            if (measuredWidth % i != 0) {
                i5++;
            }
            if (z2 && r1 < 2) {
                i5 = 2;
            }
        }
        if (!c0549c.f1803a && z2) {
            z = true;
        }
        c0549c.f1806d = z;
        c0549c.f1804b = i5;
        view.measure(MeasureSpec.makeMeasureSpec(i5 * i, 1073741824), makeMeasureSpec);
        return i5;
    }

    private void m2649c(int i, int i2) {
        int mode = MeasureSpec.getMode(i2);
        int size = MeasureSpec.getSize(i);
        int size2 = MeasureSpec.getSize(i2);
        int paddingLeft = getPaddingLeft() + getPaddingRight();
        int paddingTop = getPaddingTop() + getPaddingBottom();
        int childMeasureSpec = getChildMeasureSpec(i2, paddingTop, -2);
        int i3 = size - paddingLeft;
        int i4 = i3 / this.f1835k;
        size = i3 % this.f1835k;
        if (i4 == 0) {
            setMeasuredDimension(i3, 0);
            return;
        }
        Object obj;
        int i5 = this.f1835k + (size / i4);
        int i6 = 0;
        int i7 = 0;
        int i8 = 0;
        paddingLeft = 0;
        Object obj2 = null;
        long j = 0;
        int childCount = getChildCount();
        int i9 = 0;
        while (i9 < childCount) {
            int i10;
            long j2;
            int i11;
            int i12;
            int i13;
            View childAt = getChildAt(i9);
            if (childAt.getVisibility() == 8) {
                i10 = paddingLeft;
                j2 = j;
                i11 = i6;
                i12 = i4;
                i4 = i7;
            } else {
                boolean z = childAt instanceof ActionMenuItemView;
                i13 = paddingLeft + 1;
                if (z) {
                    childAt.setPadding(this.f1836l, 0, this.f1836l, 0);
                }
                C0549c c0549c = (C0549c) childAt.getLayoutParams();
                c0549c.f1808f = false;
                c0549c.f1805c = 0;
                c0549c.f1804b = 0;
                c0549c.f1806d = false;
                c0549c.leftMargin = 0;
                c0549c.rightMargin = 0;
                boolean z2 = z && ((ActionMenuItemView) childAt).m2303b();
                c0549c.f1807e = z2;
                int a = m2648a(childAt, i5, c0549c.f1803a ? 1 : i4, childMeasureSpec, paddingTop);
                i7 = Math.max(i7, a);
                paddingLeft = c0549c.f1806d ? i8 + 1 : i8;
                obj = c0549c.f1803a ? 1 : obj2;
                int i14 = i4 - a;
                i8 = Math.max(i6, childAt.getMeasuredHeight());
                if (a == 1) {
                    long j3 = ((long) (1 << i9)) | j;
                    i11 = i8;
                    i12 = i14;
                    i8 = paddingLeft;
                    obj2 = obj;
                    j2 = j3;
                    i4 = i7;
                    i10 = i13;
                } else {
                    i10 = i13;
                    i4 = i7;
                    long j4 = j;
                    i11 = i8;
                    i12 = i14;
                    obj2 = obj;
                    i8 = paddingLeft;
                    j2 = j4;
                }
            }
            i9++;
            i7 = i4;
            i6 = i11;
            i4 = i12;
            j = j2;
            paddingLeft = i10;
        }
        Object obj3 = (obj2 == null || paddingLeft != 2) ? null : 1;
        Object obj4 = null;
        long j5 = j;
        paddingTop = i4;
        while (i8 > 0 && paddingTop > 0) {
            i13 = Integer.MAX_VALUE;
            j = 0;
            i4 = 0;
            int i15 = 0;
            while (i15 < childCount) {
                c0549c = (C0549c) getChildAt(i15).getLayoutParams();
                if (!c0549c.f1806d) {
                    size = i4;
                    i4 = i13;
                } else if (c0549c.f1804b < i13) {
                    i4 = c0549c.f1804b;
                    j = (long) (1 << i15);
                    size = 1;
                } else if (c0549c.f1804b == i13) {
                    j |= (long) (1 << i15);
                    size = i4 + 1;
                    i4 = i13;
                } else {
                    size = i4;
                    i4 = i13;
                }
                i15++;
                i13 = i4;
                i4 = size;
            }
            j5 |= j;
            if (i4 > paddingTop) {
                j = j5;
                break;
            }
            i15 = i13 + 1;
            i13 = 0;
            i4 = paddingTop;
            long j6 = j5;
            while (i13 < childCount) {
                View childAt2 = getChildAt(i13);
                c0549c = (C0549c) childAt2.getLayoutParams();
                if ((((long) (1 << i13)) & j) != 0) {
                    if (obj3 != null && c0549c.f1807e && i4 == 1) {
                        childAt2.setPadding(this.f1836l + i5, 0, this.f1836l, 0);
                    }
                    c0549c.f1804b++;
                    c0549c.f1808f = true;
                    size = i4 - 1;
                } else if (c0549c.f1804b == i15) {
                    j6 |= (long) (1 << i13);
                    size = i4;
                } else {
                    size = i4;
                }
                i13++;
                i4 = size;
            }
            j5 = j6;
            i9 = 1;
            paddingTop = i4;
        }
        j = j5;
        obj = (obj2 == null && paddingLeft == 1) ? 1 : null;
        if (paddingTop <= 0 || j == 0 || (paddingTop >= paddingLeft - 1 && obj == null && i7 <= 1)) {
            obj3 = obj4;
        } else {
            float f;
            View childAt3;
            float bitCount = (float) Long.bitCount(j);
            if (obj == null) {
                if (!((1 & j) == 0 || ((C0549c) getChildAt(0).getLayoutParams()).f1807e)) {
                    bitCount -= 0.5f;
                }
                if (!((((long) (1 << (childCount - 1))) & j) == 0 || ((C0549c) getChildAt(childCount - 1).getLayoutParams()).f1807e)) {
                    f = bitCount - 0.5f;
                    paddingLeft = f <= 0.0f ? (int) (((float) (paddingTop * i5)) / f) : 0;
                    i4 = 0;
                    obj3 = obj4;
                    while (i4 < childCount) {
                        if ((((long) (1 << i4)) & j) != 0) {
                            obj = obj3;
                        } else {
                            childAt3 = getChildAt(i4);
                            c0549c = (C0549c) childAt3.getLayoutParams();
                            if (childAt3 instanceof ActionMenuItemView) {
                                c0549c.f1805c = paddingLeft;
                                c0549c.f1808f = true;
                                if (i4 == 0 && !c0549c.f1807e) {
                                    c0549c.leftMargin = (-paddingLeft) / 2;
                                }
                                obj = 1;
                            } else if (c0549c.f1803a) {
                                if (i4 != 0) {
                                    c0549c.leftMargin = paddingLeft / 2;
                                }
                                if (i4 != childCount - 1) {
                                    c0549c.rightMargin = paddingLeft / 2;
                                }
                                obj = obj3;
                            } else {
                                c0549c.f1805c = paddingLeft;
                                c0549c.f1808f = true;
                                c0549c.rightMargin = (-paddingLeft) / 2;
                                obj = 1;
                            }
                        }
                        i4++;
                        obj3 = obj;
                    }
                }
            }
            f = bitCount;
            if (f <= 0.0f) {
            }
            i4 = 0;
            obj3 = obj4;
            while (i4 < childCount) {
                if ((((long) (1 << i4)) & j) != 0) {
                    childAt3 = getChildAt(i4);
                    c0549c = (C0549c) childAt3.getLayoutParams();
                    if (childAt3 instanceof ActionMenuItemView) {
                        c0549c.f1805c = paddingLeft;
                        c0549c.f1808f = true;
                        c0549c.leftMargin = (-paddingLeft) / 2;
                        obj = 1;
                    } else if (c0549c.f1803a) {
                        if (i4 != 0) {
                            c0549c.leftMargin = paddingLeft / 2;
                        }
                        if (i4 != childCount - 1) {
                            c0549c.rightMargin = paddingLeft / 2;
                        }
                        obj = obj3;
                    } else {
                        c0549c.f1805c = paddingLeft;
                        c0549c.f1808f = true;
                        c0549c.rightMargin = (-paddingLeft) / 2;
                        obj = 1;
                    }
                } else {
                    obj = obj3;
                }
                i4++;
                obj3 = obj;
            }
        }
        if (obj3 != null) {
            for (paddingLeft = 0; paddingLeft < childCount; paddingLeft++) {
                childAt = getChildAt(paddingLeft);
                c0549c = (C0549c) childAt.getLayoutParams();
                if (c0549c.f1808f) {
                    childAt.measure(MeasureSpec.makeMeasureSpec(c0549c.f1805c + (c0549c.f1804b * i5), 1073741824), childMeasureSpec);
                }
            }
        }
        if (mode == 1073741824) {
            i6 = size2;
        }
        setMeasuredDimension(i3, i6);
    }

    public C0549c m2650a(AttributeSet attributeSet) {
        return new C0549c(getContext(), attributeSet);
    }

    protected C0549c m2651a(LayoutParams layoutParams) {
        if (layoutParams == null) {
            return m2657b();
        }
        C0549c c0549c = layoutParams instanceof C0549c ? new C0549c((C0549c) layoutParams) : new C0549c(layoutParams);
        if (c0549c.h > 0) {
            return c0549c;
        }
        c0549c.h = 16;
        return c0549c;
    }

    public void mo377a(C0521h c0521h) {
        this.f1827c = c0521h;
    }

    public void m2653a(C0459a c0459a, C0442a c0442a) {
        this.f1832h = c0459a;
        this.f1825a = c0442a;
    }

    public boolean m2654a() {
        return this.f1830f;
    }

    protected boolean m2655a(int i) {
        boolean z = false;
        if (i == 0) {
            return false;
        }
        View childAt = getChildAt(i - 1);
        View childAt2 = getChildAt(i);
        if (i < getChildCount() && (childAt instanceof C0502a)) {
            z = 0 | ((C0502a) childAt).mo375d();
        }
        return (i <= 0 || !(childAt2 instanceof C0502a)) ? z : ((C0502a) childAt2).mo374c() | z;
    }

    public boolean mo378a(C0524j c0524j) {
        return this.f1827c.m2449a((MenuItem) c0524j, 0);
    }

    protected C0549c m2657b() {
        C0549c c0549c = new C0549c(-2, -2);
        c0549c.h = 16;
        return c0549c;
    }

    public /* synthetic */ C0548a mo465b(AttributeSet attributeSet) {
        return m2650a(attributeSet);
    }

    protected /* synthetic */ C0548a mo466b(LayoutParams layoutParams) {
        return m2651a(layoutParams);
    }

    public C0549c m2660c() {
        C0549c b = m2657b();
        b.f1803a = true;
        return b;
    }

    protected boolean checkLayoutParams(LayoutParams layoutParams) {
        return layoutParams != null && (layoutParams instanceof C0549c);
    }

    public C0521h m2661d() {
        return this.f1827c;
    }

    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        return false;
    }

    public boolean m2662e() {
        return this.f1831g != null && this.f1831g.m3071d();
    }

    public boolean m2663f() {
        return this.f1831g != null && this.f1831g.m3072e();
    }

    public boolean m2664g() {
        return this.f1831g != null && this.f1831g.m3075h();
    }

    protected /* synthetic */ LayoutParams generateDefaultLayoutParams() {
        return m2657b();
    }

    public /* synthetic */ LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return m2650a(attributeSet);
    }

    protected /* synthetic */ LayoutParams generateLayoutParams(LayoutParams layoutParams) {
        return m2651a(layoutParams);
    }

    public Menu getMenu() {
        if (this.f1827c == null) {
            Context context = getContext();
            this.f1827c = new C0521h(context);
            this.f1827c.mo438a(new C0550d(this));
            this.f1831g = new C0607d(context);
            this.f1831g.m3069c(true);
            this.f1831g.mo404a(this.f1832h != null ? this.f1832h : new C0547b());
            this.f1827c.m2444a(this.f1831g, this.f1828d);
            this.f1831g.m3061a(this);
        }
        return this.f1827c;
    }

    public Drawable getOverflowIcon() {
        getMenu();
        return this.f1831g.m3068c();
    }

    public int getPopupTheme() {
        return this.f1829e;
    }

    public int getWindowAnimations() {
        return 0;
    }

    public boolean m2665h() {
        return this.f1831g != null && this.f1831g.m3076i();
    }

    public void m2666i() {
        if (this.f1831g != null) {
            this.f1831g.m3073f();
        }
    }

    protected /* synthetic */ C0548a mo471j() {
        return m2657b();
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (this.f1831g != null) {
            this.f1831g.mo407b(false);
            if (this.f1831g.m3075h()) {
                this.f1831g.m3072e();
                this.f1831g.m3071d();
            }
        }
    }

    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        m2666i();
    }

    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        if (this.f1833i) {
            int i5;
            int i6;
            C0549c c0549c;
            int paddingLeft;
            int childCount = getChildCount();
            int i7 = (i4 - i2) / 2;
            int dividerWidth = getDividerWidth();
            int i8 = 0;
            int i9 = 0;
            int paddingRight = ((i3 - i) - getPaddingRight()) - getPaddingLeft();
            Object obj = null;
            boolean a = bc.m3035a(this);
            int i10 = 0;
            while (i10 < childCount) {
                Object obj2;
                View childAt = getChildAt(i10);
                if (childAt.getVisibility() == 8) {
                    obj2 = obj;
                    i5 = i9;
                    i6 = paddingRight;
                    paddingRight = i8;
                } else {
                    c0549c = (C0549c) childAt.getLayoutParams();
                    if (c0549c.f1803a) {
                        i6 = childAt.getMeasuredWidth();
                        if (m2655a(i10)) {
                            i6 += dividerWidth;
                        }
                        int measuredHeight = childAt.getMeasuredHeight();
                        if (a) {
                            paddingLeft = c0549c.leftMargin + getPaddingLeft();
                            i5 = paddingLeft + i6;
                        } else {
                            i5 = (getWidth() - getPaddingRight()) - c0549c.rightMargin;
                            paddingLeft = i5 - i6;
                        }
                        int i11 = i7 - (measuredHeight / 2);
                        childAt.layout(paddingLeft, i11, i5, measuredHeight + i11);
                        i6 = paddingRight - i6;
                        obj2 = 1;
                        i5 = i9;
                        paddingRight = i8;
                    } else {
                        i5 = (childAt.getMeasuredWidth() + c0549c.leftMargin) + c0549c.rightMargin;
                        paddingLeft = i8 + i5;
                        i5 = paddingRight - i5;
                        if (m2655a(i10)) {
                            paddingLeft += dividerWidth;
                        }
                        Object obj3 = obj;
                        i6 = i5;
                        i5 = i9 + 1;
                        paddingRight = paddingLeft;
                        obj2 = obj3;
                    }
                }
                i10++;
                i8 = paddingRight;
                paddingRight = i6;
                i9 = i5;
                obj = obj2;
            }
            if (childCount == 1 && obj == null) {
                View childAt2 = getChildAt(0);
                i6 = childAt2.getMeasuredWidth();
                i5 = childAt2.getMeasuredHeight();
                paddingRight = ((i3 - i) / 2) - (i6 / 2);
                i9 = i7 - (i5 / 2);
                childAt2.layout(paddingRight, i9, i6 + paddingRight, i5 + i9);
                return;
            }
            paddingLeft = i9 - (obj != null ? 0 : 1);
            paddingRight = Math.max(0, paddingLeft > 0 ? paddingRight / paddingLeft : 0);
            View childAt3;
            if (a) {
                i6 = getWidth() - getPaddingRight();
                i5 = 0;
                while (i5 < childCount) {
                    childAt3 = getChildAt(i5);
                    c0549c = (C0549c) childAt3.getLayoutParams();
                    if (childAt3.getVisibility() == 8) {
                        paddingLeft = i6;
                    } else if (c0549c.f1803a) {
                        paddingLeft = i6;
                    } else {
                        i6 -= c0549c.rightMargin;
                        i8 = childAt3.getMeasuredWidth();
                        i10 = childAt3.getMeasuredHeight();
                        dividerWidth = i7 - (i10 / 2);
                        childAt3.layout(i6 - i8, dividerWidth, i6, i10 + dividerWidth);
                        paddingLeft = i6 - ((c0549c.leftMargin + i8) + paddingRight);
                    }
                    i5++;
                    i6 = paddingLeft;
                }
                return;
            }
            i6 = getPaddingLeft();
            i5 = 0;
            while (i5 < childCount) {
                childAt3 = getChildAt(i5);
                c0549c = (C0549c) childAt3.getLayoutParams();
                if (childAt3.getVisibility() == 8) {
                    paddingLeft = i6;
                } else if (c0549c.f1803a) {
                    paddingLeft = i6;
                } else {
                    i6 += c0549c.leftMargin;
                    i8 = childAt3.getMeasuredWidth();
                    i10 = childAt3.getMeasuredHeight();
                    dividerWidth = i7 - (i10 / 2);
                    childAt3.layout(i6, dividerWidth, i6 + i8, i10 + dividerWidth);
                    paddingLeft = ((c0549c.rightMargin + i8) + paddingRight) + i6;
                }
                i5++;
                i6 = paddingLeft;
            }
            return;
        }
        super.onLayout(z, i, i2, i3, i4);
    }

    protected void onMeasure(int i, int i2) {
        boolean z = this.f1833i;
        this.f1833i = MeasureSpec.getMode(i) == 1073741824;
        if (z != this.f1833i) {
            this.f1834j = 0;
        }
        int size = MeasureSpec.getSize(i);
        if (!(!this.f1833i || this.f1827c == null || size == this.f1834j)) {
            this.f1834j = size;
            this.f1827c.m2455b(true);
        }
        int childCount = getChildCount();
        if (!this.f1833i || childCount <= 0) {
            for (int i3 = 0; i3 < childCount; i3++) {
                C0549c c0549c = (C0549c) getChildAt(i3).getLayoutParams();
                c0549c.rightMargin = 0;
                c0549c.leftMargin = 0;
            }
            super.onMeasure(i, i2);
            return;
        }
        m2649c(i, i2);
    }

    public void setExpandedActionViewsExclusive(boolean z) {
        this.f1831g.m3070d(z);
    }

    public void setOnMenuItemClickListener(C0551e c0551e) {
        this.f1826b = c0551e;
    }

    public void setOverflowIcon(Drawable drawable) {
        getMenu();
        this.f1831g.m3058a(drawable);
    }

    public void setOverflowReserved(boolean z) {
        this.f1830f = z;
    }

    public void setPopupTheme(int i) {
        if (this.f1829e != i) {
            this.f1829e = i;
            if (i == 0) {
                this.f1828d = getContext();
            } else {
                this.f1828d = new ContextThemeWrapper(getContext(), i);
            }
        }
    }

    public void setPresenter(C0607d c0607d) {
        this.f1831g = c0607d;
        this.f1831g.m3061a(this);
    }
}
