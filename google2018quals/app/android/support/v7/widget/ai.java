package android.support.v7.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.support.v4.p017h.C0287d;
import android.support.v4.p017h.C0315p;
import android.support.v7.p020a.C0411a.C0410j;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

public class ai extends ViewGroup {
    private boolean f1810a;
    private int f1811b;
    private int f1812c;
    private int f1813d;
    private int f1814e;
    private int f1815f;
    private float f1816g;
    private boolean f1817h;
    private int[] f1818i;
    private int[] f1819j;
    private Drawable f1820k;
    private int f1821l;
    private int f1822m;
    private int f1823n;
    private int f1824o;

    public static class C0548a extends MarginLayoutParams {
        public float f1801g;
        public int f1802h;

        public C0548a(int i, int i2) {
            super(i, i2);
            this.f1802h = -1;
            this.f1801g = 0.0f;
        }

        public C0548a(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            this.f1802h = -1;
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, C0410j.LinearLayoutCompat_Layout);
            this.f1801g = obtainStyledAttributes.getFloat(C0410j.LinearLayoutCompat_Layout_android_layout_weight, 0.0f);
            this.f1802h = obtainStyledAttributes.getInt(C0410j.LinearLayoutCompat_Layout_android_layout_gravity, -1);
            obtainStyledAttributes.recycle();
        }

        public C0548a(LayoutParams layoutParams) {
            super(layoutParams);
            this.f1802h = -1;
        }
    }

    public ai(Context context) {
        this(context, null);
    }

    public ai(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public ai(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.f1810a = true;
        this.f1811b = -1;
        this.f1812c = 0;
        this.f1814e = 8388659;
        aw a = aw.m2953a(context, attributeSet, C0410j.LinearLayoutCompat, i, 0);
        int a2 = a.m2955a(C0410j.LinearLayoutCompat_android_orientation, -1);
        if (a2 >= 0) {
            setOrientation(a2);
        }
        a2 = a.m2955a(C0410j.LinearLayoutCompat_android_gravity, -1);
        if (a2 >= 0) {
            setGravity(a2);
        }
        boolean a3 = a.m2959a(C0410j.LinearLayoutCompat_android_baselineAligned, true);
        if (!a3) {
            setBaselineAligned(a3);
        }
        this.f1816g = a.m2954a(C0410j.LinearLayoutCompat_android_weightSum, -1.0f);
        this.f1811b = a.m2955a(C0410j.LinearLayoutCompat_android_baselineAlignedChildIndex, -1);
        this.f1817h = a.m2959a(C0410j.LinearLayoutCompat_measureWithLargestChild, false);
        setDividerDrawable(a.m2957a(C0410j.LinearLayoutCompat_divider));
        this.f1823n = a.m2955a(C0410j.LinearLayoutCompat_showDividers, 0);
        this.f1824o = a.m2966e(C0410j.LinearLayoutCompat_dividerPadding, 0);
        a.m2958a();
    }

    private void m2627a(View view, int i, int i2, int i3, int i4) {
        view.layout(i, i2, i + i3, i2 + i4);
    }

    private void m2628c(int i, int i2) {
        int makeMeasureSpec = MeasureSpec.makeMeasureSpec(getMeasuredWidth(), 1073741824);
        for (int i3 = 0; i3 < i; i3++) {
            View b = m2640b(i3);
            if (b.getVisibility() != 8) {
                C0548a c0548a = (C0548a) b.getLayoutParams();
                if (c0548a.width == -1) {
                    int i4 = c0548a.height;
                    c0548a.height = b.getMeasuredHeight();
                    measureChildWithMargins(b, makeMeasureSpec, 0, i2, 0);
                    c0548a.height = i4;
                }
            }
        }
    }

    private void m2629d(int i, int i2) {
        int makeMeasureSpec = MeasureSpec.makeMeasureSpec(getMeasuredHeight(), 1073741824);
        for (int i3 = 0; i3 < i; i3++) {
            View b = m2640b(i3);
            if (b.getVisibility() != 8) {
                C0548a c0548a = (C0548a) b.getLayoutParams();
                if (c0548a.height == -1) {
                    int i4 = c0548a.width;
                    c0548a.width = b.getMeasuredWidth();
                    measureChildWithMargins(b, i2, 0, makeMeasureSpec, 0);
                    c0548a.width = i4;
                }
            }
        }
    }

    int m2630a(View view) {
        return 0;
    }

    int m2631a(View view, int i) {
        return 0;
    }

    void m2632a(int i, int i2) {
        int i3;
        Object obj;
        int i4;
        int i5;
        View b;
        this.f1815f = 0;
        int i6 = 0;
        int i7 = 0;
        int i8 = 0;
        int i9 = 0;
        Object obj2 = 1;
        float f = 0.0f;
        int virtualChildCount = getVirtualChildCount();
        int mode = MeasureSpec.getMode(i);
        int mode2 = MeasureSpec.getMode(i2);
        Object obj3 = null;
        Object obj4 = null;
        int i10 = this.f1811b;
        boolean z = this.f1817h;
        int i11 = Integer.MIN_VALUE;
        int i12 = 0;
        while (i12 < virtualChildCount) {
            Object obj5;
            int i13;
            View b2 = m2640b(i12);
            if (b2 == null) {
                this.f1815f += m2646d(i12);
                i3 = i11;
                obj5 = obj4;
                obj = obj2;
                i4 = i7;
                i13 = i6;
            } else if (b2.getVisibility() == 8) {
                i12 += m2631a(b2, i12);
                i3 = i11;
                obj5 = obj4;
                obj = obj2;
                i4 = i7;
                i13 = i6;
            } else {
                if (m2645c(i12)) {
                    this.f1815f += this.f1822m;
                }
                C0548a c0548a = (C0548a) b2.getLayoutParams();
                float f2 = f + c0548a.f1801g;
                if (mode2 == 1073741824 && c0548a.height == 0 && c0548a.f1801g > 0.0f) {
                    i3 = this.f1815f;
                    this.f1815f = Math.max(i3, (c0548a.topMargin + i3) + c0548a.bottomMargin);
                    obj4 = 1;
                } else {
                    i3 = Integer.MIN_VALUE;
                    if (c0548a.height == 0 && c0548a.f1801g > 0.0f) {
                        i3 = 0;
                        c0548a.height = -2;
                    }
                    int i14 = i3;
                    m2636a(b2, i12, i, 0, i2, f2 == 0.0f ? this.f1815f : 0);
                    if (i14 != Integer.MIN_VALUE) {
                        c0548a.height = i14;
                    }
                    i3 = b2.getMeasuredHeight();
                    int i15 = this.f1815f;
                    this.f1815f = Math.max(i15, (((i15 + i3) + c0548a.topMargin) + c0548a.bottomMargin) + m2637b(b2));
                    if (z) {
                        i11 = Math.max(i3, i11);
                    }
                }
                if (i10 >= 0 && i10 == i12 + 1) {
                    this.f1812c = this.f1815f;
                }
                if (i12 >= i10 || c0548a.f1801g <= 0.0f) {
                    Object obj6;
                    Object obj7 = null;
                    if (mode == 1073741824 || c0548a.width != -1) {
                        obj6 = obj3;
                    } else {
                        obj6 = 1;
                        obj7 = 1;
                    }
                    i4 = c0548a.rightMargin + c0548a.leftMargin;
                    i13 = b2.getMeasuredWidth() + i4;
                    i6 = Math.max(i6, i13);
                    int combineMeasuredStates = View.combineMeasuredStates(i7, b2.getMeasuredState());
                    obj = (obj2 == null || c0548a.width != -1) ? null : 1;
                    if (c0548a.f1801g > 0.0f) {
                        i3 = Math.max(i9, obj7 != null ? i4 : i13);
                        i4 = i8;
                    } else {
                        if (obj7 == null) {
                            i4 = i13;
                        }
                        i4 = Math.max(i8, i4);
                        i3 = i9;
                    }
                    i12 += m2631a(b2, i12);
                    obj5 = obj4;
                    i9 = i3;
                    i8 = i4;
                    i13 = i6;
                    i3 = i11;
                    i4 = combineMeasuredStates;
                    obj3 = obj6;
                    f = f2;
                } else {
                    throw new RuntimeException("A child of LinearLayout with index less than mBaselineAlignedChildIndex has weight > 0, which won't work.  Either remove the weight, or don't set mBaselineAlignedChildIndex.");
                }
            }
            i12++;
            i11 = i3;
            obj4 = obj5;
            obj2 = obj;
            i7 = i4;
            i6 = i13;
        }
        if (this.f1815f > 0 && m2645c(virtualChildCount)) {
            this.f1815f += this.f1822m;
        }
        if (z && (mode2 == Integer.MIN_VALUE || mode2 == 0)) {
            this.f1815f = 0;
            i5 = 0;
            while (i5 < virtualChildCount) {
                b = m2640b(i5);
                if (b == null) {
                    this.f1815f += m2646d(i5);
                    i3 = i5;
                } else if (b.getVisibility() == 8) {
                    i3 = m2631a(b, i5) + i5;
                } else {
                    C0548a c0548a2 = (C0548a) b.getLayoutParams();
                    int i16 = this.f1815f;
                    this.f1815f = Math.max(i16, (c0548a2.bottomMargin + ((i16 + i11) + c0548a2.topMargin)) + m2637b(b));
                    i3 = i5;
                }
                i5 = i3 + 1;
            }
        }
        this.f1815f += getPaddingTop() + getPaddingBottom();
        int resolveSizeAndState = View.resolveSizeAndState(Math.max(this.f1815f, getSuggestedMinimumHeight()), i2, 0);
        i5 = (16777215 & resolveSizeAndState) - this.f1815f;
        int i17;
        if (obj4 != null || (i5 != 0 && f > 0.0f)) {
            if (this.f1816g > 0.0f) {
                f = this.f1816g;
            }
            this.f1815f = 0;
            i11 = 0;
            float f3 = f;
            Object obj8 = obj2;
            i17 = i8;
            i16 = i7;
            i9 = i6;
            i15 = i5;
            while (i11 < virtualChildCount) {
                View b3 = m2640b(i11);
                if (b3.getVisibility() == 8) {
                    i3 = i17;
                    i5 = i16;
                    i4 = i9;
                    obj = obj8;
                } else {
                    float f4;
                    float f5;
                    c0548a2 = (C0548a) b3.getLayoutParams();
                    float f6 = c0548a2.f1801g;
                    if (f6 > 0.0f) {
                        i5 = (int) ((((float) i15) * f6) / f3);
                        f3 -= f6;
                        i15 -= i5;
                        i4 = getChildMeasureSpec(i, ((getPaddingLeft() + getPaddingRight()) + c0548a2.leftMargin) + c0548a2.rightMargin, c0548a2.width);
                        if (c0548a2.height == 0 && mode2 == 1073741824) {
                            if (i5 <= 0) {
                                i5 = 0;
                            }
                            b3.measure(i4, MeasureSpec.makeMeasureSpec(i5, 1073741824));
                        } else {
                            i5 += b3.getMeasuredHeight();
                            if (i5 < 0) {
                                i5 = 0;
                            }
                            b3.measure(i4, MeasureSpec.makeMeasureSpec(i5, 1073741824));
                        }
                        f4 = f3;
                        i12 = i15;
                        i15 = View.combineMeasuredStates(i16, b3.getMeasuredState() & -256);
                        f5 = f4;
                    } else {
                        f5 = f3;
                        i12 = i15;
                        i15 = i16;
                    }
                    i16 = c0548a2.leftMargin + c0548a2.rightMargin;
                    i4 = b3.getMeasuredWidth() + i16;
                    i9 = Math.max(i9, i4);
                    Object obj9 = (mode == 1073741824 || c0548a2.width != -1) ? null : 1;
                    if (obj9 == null) {
                        i16 = i4;
                    }
                    i4 = Math.max(i17, i16);
                    obj = (obj8 == null || c0548a2.width != -1) ? null : 1;
                    i13 = this.f1815f;
                    this.f1815f = Math.max(i13, (c0548a2.bottomMargin + ((b3.getMeasuredHeight() + i13) + c0548a2.topMargin)) + m2637b(b3));
                    i3 = i4;
                    i4 = i9;
                    f4 = f5;
                    i5 = i15;
                    i15 = i12;
                    f3 = f4;
                }
                i11++;
                i17 = i3;
                i9 = i4;
                obj8 = obj;
                i16 = i5;
            }
            this.f1815f += getPaddingTop() + getPaddingBottom();
            obj2 = obj8;
            i3 = i17;
            i7 = i16;
            i5 = i9;
        } else {
            i17 = Math.max(i8, i9);
            if (z && mode2 != 1073741824) {
                for (i5 = 0; i5 < virtualChildCount; i5++) {
                    b = m2640b(i5);
                    if (!(b == null || b.getVisibility() == 8 || ((C0548a) b.getLayoutParams()).f1801g <= 0.0f)) {
                        b.measure(MeasureSpec.makeMeasureSpec(b.getMeasuredWidth(), 1073741824), MeasureSpec.makeMeasureSpec(i11, 1073741824));
                    }
                }
            }
            i3 = i17;
            i5 = i6;
        }
        if (obj2 != null || mode == 1073741824) {
            i3 = i5;
        }
        setMeasuredDimension(View.resolveSizeAndState(Math.max(i3 + (getPaddingLeft() + getPaddingRight()), getSuggestedMinimumWidth()), i, i7), resolveSizeAndState);
        if (obj3 != null) {
            m2628c(virtualChildCount, i2);
        }
    }

    void m2633a(int i, int i2, int i3, int i4) {
        int paddingLeft = getPaddingLeft();
        int i5 = i3 - i;
        int paddingRight = i5 - getPaddingRight();
        int paddingRight2 = (i5 - paddingLeft) - getPaddingRight();
        int virtualChildCount = getVirtualChildCount();
        int i6 = this.f1814e & 8388615;
        switch (this.f1814e & C0410j.AppCompatTheme_windowFixedHeightMajor) {
            case 16:
                i5 = getPaddingTop() + (((i4 - i2) - this.f1815f) / 2);
                break;
            case C0410j.AppCompatTheme_panelMenuListTheme /*80*/:
                i5 = ((getPaddingTop() + i4) - i2) - this.f1815f;
                break;
            default:
                i5 = getPaddingTop();
                break;
        }
        int i7 = 0;
        int i8 = i5;
        while (i7 < virtualChildCount) {
            View b = m2640b(i7);
            if (b == null) {
                i8 += m2646d(i7);
                i5 = i7;
            } else if (b.getVisibility() != 8) {
                int i9;
                int measuredWidth = b.getMeasuredWidth();
                int measuredHeight = b.getMeasuredHeight();
                C0548a c0548a = (C0548a) b.getLayoutParams();
                i5 = c0548a.f1802h;
                if (i5 < 0) {
                    i5 = i6;
                }
                switch (C0287d.m1269a(i5, C0315p.m1387b(this)) & 7) {
                    case 1:
                        i9 = ((((paddingRight2 - measuredWidth) / 2) + paddingLeft) + c0548a.leftMargin) - c0548a.rightMargin;
                        break;
                    case 5:
                        i9 = (paddingRight - measuredWidth) - c0548a.rightMargin;
                        break;
                    default:
                        i9 = paddingLeft + c0548a.leftMargin;
                        break;
                }
                int i10 = (m2645c(i7) ? this.f1822m + i8 : i8) + c0548a.topMargin;
                m2627a(b, i9, i10 + m2630a(b), measuredWidth, measuredHeight);
                i8 = i10 + ((c0548a.bottomMargin + measuredHeight) + m2637b(b));
                i5 = m2631a(b, i7) + i7;
            } else {
                i5 = i7;
            }
            i7 = i5 + 1;
        }
    }

    void m2634a(Canvas canvas) {
        int virtualChildCount = getVirtualChildCount();
        int i = 0;
        while (i < virtualChildCount) {
            View b = m2640b(i);
            if (!(b == null || b.getVisibility() == 8 || !m2645c(i))) {
                m2635a(canvas, (b.getTop() - ((C0548a) b.getLayoutParams()).topMargin) - this.f1822m);
            }
            i++;
        }
        if (m2645c(virtualChildCount)) {
            int height;
            View b2 = m2640b(virtualChildCount - 1);
            if (b2 == null) {
                height = (getHeight() - getPaddingBottom()) - this.f1822m;
            } else {
                C0548a c0548a = (C0548a) b2.getLayoutParams();
                height = c0548a.bottomMargin + b2.getBottom();
            }
            m2635a(canvas, height);
        }
    }

    void m2635a(Canvas canvas, int i) {
        this.f1820k.setBounds(getPaddingLeft() + this.f1824o, i, (getWidth() - getPaddingRight()) - this.f1824o, this.f1822m + i);
        this.f1820k.draw(canvas);
    }

    void m2636a(View view, int i, int i2, int i3, int i4, int i5) {
        measureChildWithMargins(view, i2, i3, i4, i5);
    }

    int m2637b(View view) {
        return 0;
    }

    public C0548a mo465b(AttributeSet attributeSet) {
        return new C0548a(getContext(), attributeSet);
    }

    protected C0548a mo466b(LayoutParams layoutParams) {
        return new C0548a(layoutParams);
    }

    View m2640b(int i) {
        return getChildAt(i);
    }

    void m2641b(int i, int i2) {
        int i3;
        int i4;
        C0548a c0548a;
        this.f1815f = 0;
        int i5 = 0;
        int i6 = 0;
        int i7 = 0;
        int i8 = 0;
        Object obj = 1;
        float f = 0.0f;
        int virtualChildCount = getVirtualChildCount();
        int mode = MeasureSpec.getMode(i);
        int mode2 = MeasureSpec.getMode(i2);
        Object obj2 = null;
        Object obj3 = null;
        if (this.f1818i == null || this.f1819j == null) {
            this.f1818i = new int[4];
            this.f1819j = new int[4];
        }
        int[] iArr = this.f1818i;
        int[] iArr2 = this.f1819j;
        iArr[3] = -1;
        iArr[2] = -1;
        iArr[1] = -1;
        iArr[0] = -1;
        iArr2[3] = -1;
        iArr2[2] = -1;
        iArr2[1] = -1;
        iArr2[0] = -1;
        boolean z = this.f1810a;
        boolean z2 = this.f1817h;
        Object obj4 = mode == 1073741824 ? 1 : null;
        int i9 = Integer.MIN_VALUE;
        int i10 = 0;
        while (i10 < virtualChildCount) {
            Object obj5;
            Object obj6;
            int i11;
            int i12;
            View b = m2640b(i10);
            if (b == null) {
                this.f1815f += m2646d(i10);
                i3 = i9;
                obj5 = obj3;
                obj6 = obj;
                i11 = i6;
                i12 = i5;
            } else if (b.getVisibility() == 8) {
                i10 += m2631a(b, i10);
                i3 = i9;
                obj5 = obj3;
                obj6 = obj;
                i11 = i6;
                i12 = i5;
            } else {
                Object obj7;
                if (m2645c(i10)) {
                    this.f1815f += this.f1821l;
                }
                C0548a c0548a2 = (C0548a) b.getLayoutParams();
                float f2 = f + c0548a2.f1801g;
                if (mode == 1073741824 && c0548a2.width == 0 && c0548a2.f1801g > 0.0f) {
                    if (obj4 != null) {
                        this.f1815f += c0548a2.leftMargin + c0548a2.rightMargin;
                    } else {
                        i3 = this.f1815f;
                        this.f1815f = Math.max(i3, (c0548a2.leftMargin + i3) + c0548a2.rightMargin);
                    }
                    if (z) {
                        i3 = MeasureSpec.makeMeasureSpec(0, 0);
                        b.measure(i3, i3);
                    } else {
                        obj3 = 1;
                    }
                } else {
                    i3 = Integer.MIN_VALUE;
                    if (c0548a2.width == 0 && c0548a2.f1801g > 0.0f) {
                        i3 = 0;
                        c0548a2.width = -2;
                    }
                    int i13 = i3;
                    m2636a(b, i10, i, f2 == 0.0f ? this.f1815f : 0, i2, 0);
                    if (i13 != Integer.MIN_VALUE) {
                        c0548a2.width = i13;
                    }
                    i3 = b.getMeasuredWidth();
                    if (obj4 != null) {
                        this.f1815f += ((c0548a2.leftMargin + i3) + c0548a2.rightMargin) + m2637b(b);
                    } else {
                        int i14 = this.f1815f;
                        this.f1815f = Math.max(i14, (((i14 + i3) + c0548a2.leftMargin) + c0548a2.rightMargin) + m2637b(b));
                    }
                    if (z2) {
                        i9 = Math.max(i3, i9);
                    }
                }
                Object obj8 = null;
                if (mode2 == 1073741824 || c0548a2.height != -1) {
                    obj7 = obj2;
                } else {
                    obj7 = 1;
                    obj8 = 1;
                }
                i11 = c0548a2.bottomMargin + c0548a2.topMargin;
                i12 = b.getMeasuredHeight() + i11;
                int combineMeasuredStates = View.combineMeasuredStates(i6, b.getMeasuredState());
                if (z) {
                    i6 = b.getBaseline();
                    if (i6 != -1) {
                        int i15 = ((((c0548a2.f1802h < 0 ? this.f1814e : c0548a2.f1802h) & C0410j.AppCompatTheme_windowFixedHeightMajor) >> 4) & -2) >> 1;
                        iArr[i15] = Math.max(iArr[i15], i6);
                        iArr2[i15] = Math.max(iArr2[i15], i12 - i6);
                    }
                }
                i6 = Math.max(i5, i12);
                obj6 = (obj == null || c0548a2.height != -1) ? null : 1;
                if (c0548a2.f1801g > 0.0f) {
                    i3 = Math.max(i8, obj8 != null ? i11 : i12);
                    i11 = i7;
                } else {
                    if (obj8 == null) {
                        i11 = i12;
                    }
                    i11 = Math.max(i7, i11);
                    i3 = i8;
                }
                i10 += m2631a(b, i10);
                obj5 = obj3;
                i8 = i3;
                i7 = i11;
                i12 = i6;
                i3 = i9;
                i11 = combineMeasuredStates;
                obj2 = obj7;
                f = f2;
            }
            i10++;
            i9 = i3;
            obj3 = obj5;
            obj = obj6;
            i6 = i11;
            i5 = i12;
        }
        if (this.f1815f > 0 && m2645c(virtualChildCount)) {
            this.f1815f += this.f1821l;
        }
        i10 = (iArr[1] == -1 && iArr[0] == -1 && iArr[2] == -1 && iArr[3] == -1) ? i5 : Math.max(i5, Math.max(iArr[3], Math.max(iArr[0], Math.max(iArr[1], iArr[2]))) + Math.max(iArr2[3], Math.max(iArr2[0], Math.max(iArr2[1], iArr2[2]))));
        if (z2 && (mode == Integer.MIN_VALUE || mode == 0)) {
            this.f1815f = 0;
            i4 = 0;
            while (i4 < virtualChildCount) {
                View b2 = m2640b(i4);
                if (b2 == null) {
                    this.f1815f += m2646d(i4);
                    i3 = i4;
                } else if (b2.getVisibility() == 8) {
                    i3 = m2631a(b2, i4) + i4;
                } else {
                    c0548a = (C0548a) b2.getLayoutParams();
                    if (obj4 != null) {
                        this.f1815f = ((c0548a.rightMargin + (c0548a.leftMargin + i9)) + m2637b(b2)) + this.f1815f;
                        i3 = i4;
                    } else {
                        i11 = this.f1815f;
                        this.f1815f = Math.max(i11, (c0548a.rightMargin + ((i11 + i9) + c0548a.leftMargin)) + m2637b(b2));
                        i3 = i4;
                    }
                }
                i4 = i3 + 1;
            }
        }
        this.f1815f += getPaddingLeft() + getPaddingRight();
        int resolveSizeAndState = View.resolveSizeAndState(Math.max(this.f1815f, getSuggestedMinimumWidth()), i, 0);
        i4 = (16777215 & resolveSizeAndState) - this.f1815f;
        int i16;
        if (obj3 != null || (i4 != 0 && f > 0.0f)) {
            if (this.f1816g > 0.0f) {
                f = this.f1816g;
            }
            iArr[3] = -1;
            iArr[2] = -1;
            iArr[1] = -1;
            iArr[0] = -1;
            iArr2[3] = -1;
            iArr2[2] = -1;
            iArr2[1] = -1;
            iArr2[0] = -1;
            this.f1815f = 0;
            i9 = 0;
            float f3 = f;
            Object obj9 = obj;
            i16 = i7;
            i15 = i6;
            i14 = i4;
            i7 = -1;
            while (i9 < virtualChildCount) {
                float f4;
                Object obj10;
                View b3 = m2640b(i9);
                if (b3 == null) {
                    f4 = f3;
                    i4 = i14;
                    i11 = i7;
                    i14 = i16;
                    obj10 = obj9;
                } else if (b3.getVisibility() == 8) {
                    f4 = f3;
                    i4 = i14;
                    i11 = i7;
                    i14 = i16;
                    obj10 = obj9;
                } else {
                    float f5;
                    c0548a = (C0548a) b3.getLayoutParams();
                    float f6 = c0548a.f1801g;
                    if (f6 > 0.0f) {
                        i4 = (int) ((((float) i14) * f6) / f3);
                        f3 -= f6;
                        i11 = i14 - i4;
                        i14 = getChildMeasureSpec(i2, ((getPaddingTop() + getPaddingBottom()) + c0548a.topMargin) + c0548a.bottomMargin, c0548a.height);
                        if (c0548a.width == 0 && mode == 1073741824) {
                            if (i4 <= 0) {
                                i4 = 0;
                            }
                            b3.measure(MeasureSpec.makeMeasureSpec(i4, 1073741824), i14);
                        } else {
                            i4 += b3.getMeasuredWidth();
                            if (i4 < 0) {
                                i4 = 0;
                            }
                            b3.measure(MeasureSpec.makeMeasureSpec(i4, 1073741824), i14);
                        }
                        i8 = View.combineMeasuredStates(i15, b3.getMeasuredState() & -16777216);
                        f5 = f3;
                    } else {
                        i11 = i14;
                        i8 = i15;
                        f5 = f3;
                    }
                    if (obj4 != null) {
                        this.f1815f += ((b3.getMeasuredWidth() + c0548a.leftMargin) + c0548a.rightMargin) + m2637b(b3);
                    } else {
                        i4 = this.f1815f;
                        this.f1815f = Math.max(i4, (((b3.getMeasuredWidth() + i4) + c0548a.leftMargin) + c0548a.rightMargin) + m2637b(b3));
                    }
                    obj5 = (mode2 == 1073741824 || c0548a.height != -1) ? null : 1;
                    i10 = c0548a.topMargin + c0548a.bottomMargin;
                    i14 = b3.getMeasuredHeight() + i10;
                    i7 = Math.max(i7, i14);
                    i10 = Math.max(i16, obj5 != null ? i10 : i14);
                    obj5 = (obj9 == null || c0548a.height != -1) ? null : 1;
                    if (z) {
                        i12 = b3.getBaseline();
                        if (i12 != -1) {
                            i3 = ((((c0548a.f1802h < 0 ? this.f1814e : c0548a.f1802h) & C0410j.AppCompatTheme_windowFixedHeightMajor) >> 4) & -2) >> 1;
                            iArr[i3] = Math.max(iArr[i3], i12);
                            iArr2[i3] = Math.max(iArr2[i3], i14 - i12);
                        }
                    }
                    f4 = f5;
                    i14 = i10;
                    obj10 = obj5;
                    i15 = i8;
                    i4 = i11;
                    i11 = i7;
                }
                i9++;
                i16 = i14;
                i7 = i11;
                obj9 = obj10;
                i14 = i4;
                f3 = f4;
            }
            this.f1815f += getPaddingLeft() + getPaddingRight();
            if (!(iArr[1] == -1 && iArr[0] == -1 && iArr[2] == -1 && iArr[3] == -1)) {
                i7 = Math.max(i7, Math.max(iArr[3], Math.max(iArr[0], Math.max(iArr[1], iArr[2]))) + Math.max(iArr2[3], Math.max(iArr2[0], Math.max(iArr2[1], iArr2[2]))));
            }
            obj = obj9;
            i3 = i16;
            i6 = i15;
            i4 = i7;
        } else {
            i16 = Math.max(i7, i8);
            if (z2 && mode != 1073741824) {
                for (i4 = 0; i4 < virtualChildCount; i4++) {
                    View b4 = m2640b(i4);
                    if (!(b4 == null || b4.getVisibility() == 8 || ((C0548a) b4.getLayoutParams()).f1801g <= 0.0f)) {
                        b4.measure(MeasureSpec.makeMeasureSpec(i9, 1073741824), MeasureSpec.makeMeasureSpec(b4.getMeasuredHeight(), 1073741824));
                    }
                }
            }
            i3 = i16;
            i4 = i10;
        }
        if (obj != null || mode2 == 1073741824) {
            i3 = i4;
        }
        setMeasuredDimension((-16777216 & i6) | resolveSizeAndState, View.resolveSizeAndState(Math.max(i3 + (getPaddingTop() + getPaddingBottom()), getSuggestedMinimumHeight()), i2, i6 << 16));
        if (obj2 != null) {
            m2629d(virtualChildCount, i);
        }
    }

    void m2642b(int i, int i2, int i3, int i4) {
        int paddingLeft;
        int i5;
        int i6;
        boolean a = bc.m3035a(this);
        int paddingTop = getPaddingTop();
        int i7 = i4 - i2;
        int paddingBottom = i7 - getPaddingBottom();
        int paddingBottom2 = (i7 - paddingTop) - getPaddingBottom();
        int virtualChildCount = getVirtualChildCount();
        i7 = this.f1814e & 8388615;
        int i8 = this.f1814e & C0410j.AppCompatTheme_windowFixedHeightMajor;
        boolean z = this.f1810a;
        int[] iArr = this.f1818i;
        int[] iArr2 = this.f1819j;
        switch (C0287d.m1269a(i7, C0315p.m1387b(this))) {
            case 1:
                paddingLeft = getPaddingLeft() + (((i3 - i) - this.f1815f) / 2);
                break;
            case 5:
                paddingLeft = ((getPaddingLeft() + i3) - i) - this.f1815f;
                break;
            default:
                paddingLeft = getPaddingLeft();
                break;
        }
        if (a) {
            i5 = -1;
            i6 = virtualChildCount - 1;
        } else {
            i5 = 1;
            i6 = 0;
        }
        int i9 = 0;
        while (i9 < virtualChildCount) {
            int i10 = i6 + (i5 * i9);
            View b = m2640b(i10);
            if (b == null) {
                paddingLeft += m2646d(i10);
                i7 = i9;
            } else if (b.getVisibility() != 8) {
                int i11;
                int measuredWidth = b.getMeasuredWidth();
                int measuredHeight = b.getMeasuredHeight();
                C0548a c0548a = (C0548a) b.getLayoutParams();
                i7 = (!z || c0548a.height == -1) ? -1 : b.getBaseline();
                int i12 = c0548a.f1802h;
                if (i12 < 0) {
                    i12 = i8;
                }
                switch (i12 & C0410j.AppCompatTheme_windowFixedHeightMajor) {
                    case 16:
                        i11 = ((((paddingBottom2 - measuredHeight) / 2) + paddingTop) + c0548a.topMargin) - c0548a.bottomMargin;
                        break;
                    case 48:
                        i11 = paddingTop + c0548a.topMargin;
                        if (i7 != -1) {
                            i11 += iArr[1] - i7;
                            break;
                        }
                        break;
                    case C0410j.AppCompatTheme_panelMenuListTheme /*80*/:
                        i11 = (paddingBottom - measuredHeight) - c0548a.bottomMargin;
                        if (i7 != -1) {
                            i11 -= iArr2[2] - (b.getMeasuredHeight() - i7);
                            break;
                        }
                        break;
                    default:
                        i11 = paddingTop;
                        break;
                }
                paddingLeft = (m2645c(i10) ? this.f1821l + paddingLeft : paddingLeft) + c0548a.leftMargin;
                m2627a(b, paddingLeft + m2630a(b), i11, measuredWidth, measuredHeight);
                paddingLeft += (c0548a.rightMargin + measuredWidth) + m2637b(b);
                i7 = m2631a(b, i10) + i9;
            } else {
                i7 = i9;
            }
            i9 = i7 + 1;
        }
    }

    void m2643b(Canvas canvas) {
        int virtualChildCount = getVirtualChildCount();
        boolean a = bc.m3035a(this);
        int i = 0;
        while (i < virtualChildCount) {
            View b = m2640b(i);
            if (!(b == null || b.getVisibility() == 8 || !m2645c(i))) {
                C0548a c0548a = (C0548a) b.getLayoutParams();
                m2644b(canvas, a ? c0548a.rightMargin + b.getRight() : (b.getLeft() - c0548a.leftMargin) - this.f1821l);
            }
            i++;
        }
        if (m2645c(virtualChildCount)) {
            int paddingLeft;
            View b2 = m2640b(virtualChildCount - 1);
            if (b2 == null) {
                paddingLeft = a ? getPaddingLeft() : (getWidth() - getPaddingRight()) - this.f1821l;
            } else {
                c0548a = (C0548a) b2.getLayoutParams();
                paddingLeft = a ? (b2.getLeft() - c0548a.leftMargin) - this.f1821l : c0548a.rightMargin + b2.getRight();
            }
            m2644b(canvas, paddingLeft);
        }
    }

    void m2644b(Canvas canvas, int i) {
        this.f1820k.setBounds(i, getPaddingTop() + this.f1824o, this.f1821l + i, (getHeight() - getPaddingBottom()) - this.f1824o);
        this.f1820k.draw(canvas);
    }

    protected boolean m2645c(int i) {
        if (i == 0) {
            return (this.f1823n & 1) != 0;
        } else {
            if (i == getChildCount()) {
                return (this.f1823n & 4) != 0;
            } else {
                if ((this.f1823n & 2) == 0) {
                    return false;
                }
                for (int i2 = i - 1; i2 >= 0; i2--) {
                    if (getChildAt(i2).getVisibility() != 8) {
                        return true;
                    }
                }
                return false;
            }
        }
    }

    protected boolean checkLayoutParams(LayoutParams layoutParams) {
        return layoutParams instanceof C0548a;
    }

    int m2646d(int i) {
        return 0;
    }

    protected /* synthetic */ LayoutParams generateDefaultLayoutParams() {
        return mo471j();
    }

    public /* synthetic */ LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return mo465b(attributeSet);
    }

    protected /* synthetic */ LayoutParams generateLayoutParams(LayoutParams layoutParams) {
        return mo466b(layoutParams);
    }

    public int getBaseline() {
        if (this.f1811b < 0) {
            return super.getBaseline();
        }
        if (getChildCount() <= this.f1811b) {
            throw new RuntimeException("mBaselineAlignedChildIndex of LinearLayout set to an index that is out of bounds.");
        }
        View childAt = getChildAt(this.f1811b);
        int baseline = childAt.getBaseline();
        if (baseline != -1) {
            int i;
            int i2 = this.f1812c;
            if (this.f1813d == 1) {
                i = this.f1814e & C0410j.AppCompatTheme_windowFixedHeightMajor;
                if (i != 48) {
                    switch (i) {
                        case 16:
                            i = i2 + (((((getBottom() - getTop()) - getPaddingTop()) - getPaddingBottom()) - this.f1815f) / 2);
                            break;
                        case C0410j.AppCompatTheme_panelMenuListTheme /*80*/:
                            i = ((getBottom() - getTop()) - getPaddingBottom()) - this.f1815f;
                            break;
                    }
                }
            }
            i = i2;
            return (((C0548a) childAt.getLayoutParams()).topMargin + i) + baseline;
        } else if (this.f1811b == 0) {
            return -1;
        } else {
            throw new RuntimeException("mBaselineAlignedChildIndex of LinearLayout points to a View that doesn't know how to get its baseline.");
        }
    }

    public int getBaselineAlignedChildIndex() {
        return this.f1811b;
    }

    public Drawable getDividerDrawable() {
        return this.f1820k;
    }

    public int getDividerPadding() {
        return this.f1824o;
    }

    public int getDividerWidth() {
        return this.f1821l;
    }

    public int getGravity() {
        return this.f1814e;
    }

    public int getOrientation() {
        return this.f1813d;
    }

    public int getShowDividers() {
        return this.f1823n;
    }

    int getVirtualChildCount() {
        return getChildCount();
    }

    public float getWeightSum() {
        return this.f1816g;
    }

    protected C0548a mo471j() {
        return this.f1813d == 0 ? new C0548a(-2, -2) : this.f1813d == 1 ? new C0548a(-1, -2) : null;
    }

    protected void onDraw(Canvas canvas) {
        if (this.f1820k != null) {
            if (this.f1813d == 1) {
                m2634a(canvas);
            } else {
                m2643b(canvas);
            }
        }
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        if (VERSION.SDK_INT >= 14) {
            super.onInitializeAccessibilityEvent(accessibilityEvent);
            accessibilityEvent.setClassName(ai.class.getName());
        }
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        if (VERSION.SDK_INT >= 14) {
            super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
            accessibilityNodeInfo.setClassName(ai.class.getName());
        }
    }

    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        if (this.f1813d == 1) {
            m2633a(i, i2, i3, i4);
        } else {
            m2642b(i, i2, i3, i4);
        }
    }

    protected void onMeasure(int i, int i2) {
        if (this.f1813d == 1) {
            m2632a(i, i2);
        } else {
            m2641b(i, i2);
        }
    }

    public void setBaselineAligned(boolean z) {
        this.f1810a = z;
    }

    public void setBaselineAlignedChildIndex(int i) {
        if (i < 0 || i >= getChildCount()) {
            throw new IllegalArgumentException("base aligned child index out of range (0, " + getChildCount() + ")");
        }
        this.f1811b = i;
    }

    public void setDividerDrawable(Drawable drawable) {
        boolean z = false;
        if (drawable != this.f1820k) {
            this.f1820k = drawable;
            if (drawable != null) {
                this.f1821l = drawable.getIntrinsicWidth();
                this.f1822m = drawable.getIntrinsicHeight();
            } else {
                this.f1821l = 0;
                this.f1822m = 0;
            }
            if (drawable == null) {
                z = true;
            }
            setWillNotDraw(z);
            requestLayout();
        }
    }

    public void setDividerPadding(int i) {
        this.f1824o = i;
    }

    public void setGravity(int i) {
        if (this.f1814e != i) {
            int i2 = (8388615 & i) == 0 ? 8388611 | i : i;
            if ((i2 & C0410j.AppCompatTheme_windowFixedHeightMajor) == 0) {
                i2 |= 48;
            }
            this.f1814e = i2;
            requestLayout();
        }
    }

    public void setHorizontalGravity(int i) {
        int i2 = i & 8388615;
        if ((this.f1814e & 8388615) != i2) {
            this.f1814e = i2 | (this.f1814e & -8388616);
            requestLayout();
        }
    }

    public void setMeasureWithLargestChildEnabled(boolean z) {
        this.f1817h = z;
    }

    public void setOrientation(int i) {
        if (this.f1813d != i) {
            this.f1813d = i;
            requestLayout();
        }
    }

    public void setShowDividers(int i) {
        if (i != this.f1823n) {
            requestLayout();
        }
        this.f1823n = i;
    }

    public void setVerticalGravity(int i) {
        int i2 = i & C0410j.AppCompatTheme_windowFixedHeightMajor;
        if ((this.f1814e & C0410j.AppCompatTheme_windowFixedHeightMajor) != i2) {
            this.f1814e = i2 | (this.f1814e & -113);
            requestLayout();
        }
    }

    public void setWeightSum(float f) {
        this.f1816g = Math.max(0.0f, f);
    }

    public boolean shouldDelayChildPressedState() {
        return false;
    }
}
