package android.support.constraint;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.Build.VERSION;
import android.support.constraint.C0078c.C0077a;
import android.support.constraint.p007a.p008a.C0053a.C0051b;
import android.support.constraint.p007a.p008a.C0053a.C0052c;
import android.support.constraint.p007a.p008a.C0056b;
import android.support.constraint.p007a.p008a.C0056b.C0055a;
import android.support.constraint.p007a.p008a.C0058c;
import android.support.constraint.p007a.p008a.C0060d;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import java.util.ArrayList;

public class ConstraintLayout extends ViewGroup {
    SparseArray<View> f189a = new SparseArray();
    C0058c f190b = new C0058c();
    private final ArrayList<C0056b> f191c = new ArrayList(100);
    private int f192d = 0;
    private int f193e = 0;
    private int f194f = Integer.MAX_VALUE;
    private int f195g = Integer.MAX_VALUE;
    private boolean f196h = true;
    private int f197i = 2;
    private C0075a f198j = null;

    public static class C0046a extends MarginLayoutParams {
        int f137A = 1;
        public float f138B = 0.0f;
        public float f139C = 0.0f;
        public int f140D = 0;
        public int f141E = 0;
        public int f142F = 0;
        public int f143G = 0;
        public int f144H = 0;
        public int f145I = 0;
        public int f146J = 0;
        public int f147K = 0;
        public int f148L = -1;
        public int f149M = -1;
        public int f150N = -1;
        boolean f151O = true;
        boolean f152P = true;
        boolean f153Q = false;
        boolean f154R = false;
        int f155S = -1;
        int f156T = -1;
        int f157U = -1;
        int f158V = -1;
        int f159W = -1;
        int f160X = -1;
        float f161Y = 0.5f;
        C0056b f162Z = new C0056b();
        public int f163a = -1;
        public int f164b = -1;
        public float f165c = -1.0f;
        public int f166d = -1;
        public int f167e = -1;
        public int f168f = -1;
        public int f169g = -1;
        public int f170h = -1;
        public int f171i = -1;
        public int f172j = -1;
        public int f173k = -1;
        public int f174l = -1;
        public int f175m = -1;
        public int f176n = -1;
        public int f177o = -1;
        public int f178p = -1;
        public int f179q = -1;
        public int f180r = -1;
        public int f181s = -1;
        public int f182t = -1;
        public int f183u = -1;
        public int f184v = -1;
        public float f185w = 0.5f;
        public float f186x = 0.5f;
        public String f187y = null;
        float f188z = 0.0f;

        public C0046a(int i, int i2) {
            super(i, i2);
        }

        public C0046a(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, C0077a.ConstraintLayout_Layout);
            int indexCount = obtainStyledAttributes.getIndexCount();
            for (int i = 0; i < indexCount; i++) {
                int index = obtainStyledAttributes.getIndex(i);
                if (index == C0077a.ConstraintLayout_Layout_layout_constraintLeft_toLeftOf) {
                    this.f166d = obtainStyledAttributes.getResourceId(index, this.f166d);
                    if (this.f166d == -1) {
                        this.f166d = obtainStyledAttributes.getInt(index, -1);
                    }
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintLeft_toRightOf) {
                    this.f167e = obtainStyledAttributes.getResourceId(index, this.f167e);
                    if (this.f167e == -1) {
                        this.f167e = obtainStyledAttributes.getInt(index, -1);
                    }
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintRight_toLeftOf) {
                    this.f168f = obtainStyledAttributes.getResourceId(index, this.f168f);
                    if (this.f168f == -1) {
                        this.f168f = obtainStyledAttributes.getInt(index, -1);
                    }
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintRight_toRightOf) {
                    this.f169g = obtainStyledAttributes.getResourceId(index, this.f169g);
                    if (this.f169g == -1) {
                        this.f169g = obtainStyledAttributes.getInt(index, -1);
                    }
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintTop_toTopOf) {
                    this.f170h = obtainStyledAttributes.getResourceId(index, this.f170h);
                    if (this.f170h == -1) {
                        this.f170h = obtainStyledAttributes.getInt(index, -1);
                    }
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintTop_toBottomOf) {
                    this.f171i = obtainStyledAttributes.getResourceId(index, this.f171i);
                    if (this.f171i == -1) {
                        this.f171i = obtainStyledAttributes.getInt(index, -1);
                    }
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintBottom_toTopOf) {
                    this.f172j = obtainStyledAttributes.getResourceId(index, this.f172j);
                    if (this.f172j == -1) {
                        this.f172j = obtainStyledAttributes.getInt(index, -1);
                    }
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintBottom_toBottomOf) {
                    this.f173k = obtainStyledAttributes.getResourceId(index, this.f173k);
                    if (this.f173k == -1) {
                        this.f173k = obtainStyledAttributes.getInt(index, -1);
                    }
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintBaseline_toBaselineOf) {
                    this.f174l = obtainStyledAttributes.getResourceId(index, this.f174l);
                    if (this.f174l == -1) {
                        this.f174l = obtainStyledAttributes.getInt(index, -1);
                    }
                } else if (index == C0077a.ConstraintLayout_Layout_layout_editor_absoluteX) {
                    this.f148L = obtainStyledAttributes.getDimensionPixelOffset(index, this.f148L);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_editor_absoluteY) {
                    this.f149M = obtainStyledAttributes.getDimensionPixelOffset(index, this.f149M);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintGuide_begin) {
                    this.f163a = obtainStyledAttributes.getDimensionPixelOffset(index, this.f163a);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintGuide_end) {
                    this.f164b = obtainStyledAttributes.getDimensionPixelOffset(index, this.f164b);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintGuide_percent) {
                    this.f165c = obtainStyledAttributes.getFloat(index, this.f165c);
                } else if (index == C0077a.ConstraintLayout_Layout_android_orientation) {
                    this.f150N = obtainStyledAttributes.getInt(index, this.f150N);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintStart_toEndOf) {
                    this.f175m = obtainStyledAttributes.getResourceId(index, this.f175m);
                    if (this.f175m == -1) {
                        this.f175m = obtainStyledAttributes.getInt(index, -1);
                    }
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintStart_toStartOf) {
                    this.f176n = obtainStyledAttributes.getResourceId(index, this.f176n);
                    if (this.f176n == -1) {
                        this.f176n = obtainStyledAttributes.getInt(index, -1);
                    }
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintEnd_toStartOf) {
                    this.f177o = obtainStyledAttributes.getResourceId(index, this.f177o);
                    if (this.f177o == -1) {
                        this.f177o = obtainStyledAttributes.getInt(index, -1);
                    }
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintEnd_toEndOf) {
                    this.f178p = obtainStyledAttributes.getResourceId(index, this.f178p);
                    if (this.f178p == -1) {
                        this.f178p = obtainStyledAttributes.getInt(index, -1);
                    }
                } else if (index == C0077a.ConstraintLayout_Layout_layout_goneMarginLeft) {
                    this.f179q = obtainStyledAttributes.getDimensionPixelSize(index, this.f179q);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_goneMarginTop) {
                    this.f180r = obtainStyledAttributes.getDimensionPixelSize(index, this.f180r);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_goneMarginRight) {
                    this.f181s = obtainStyledAttributes.getDimensionPixelSize(index, this.f181s);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_goneMarginBottom) {
                    this.f182t = obtainStyledAttributes.getDimensionPixelSize(index, this.f182t);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_goneMarginStart) {
                    this.f183u = obtainStyledAttributes.getDimensionPixelSize(index, this.f183u);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_goneMarginEnd) {
                    this.f184v = obtainStyledAttributes.getDimensionPixelSize(index, this.f184v);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintHorizontal_bias) {
                    this.f185w = obtainStyledAttributes.getFloat(index, this.f185w);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintVertical_bias) {
                    this.f186x = obtainStyledAttributes.getFloat(index, this.f186x);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintDimensionRatio) {
                    this.f187y = obtainStyledAttributes.getString(index);
                    this.f188z = Float.NaN;
                    this.f137A = -1;
                    if (this.f187y != null) {
                        int length = this.f187y.length();
                        index = this.f187y.indexOf(44);
                        if (index <= 0 || index >= length - 1) {
                            index = 0;
                        } else {
                            String substring = this.f187y.substring(0, index);
                            if (substring.equalsIgnoreCase("W")) {
                                this.f137A = 0;
                            } else if (substring.equalsIgnoreCase("H")) {
                                this.f137A = 1;
                            }
                            index++;
                        }
                        int indexOf = this.f187y.indexOf(58);
                        String substring2;
                        if (indexOf < 0 || indexOf >= length - 1) {
                            substring2 = this.f187y.substring(index);
                            if (substring2.length() > 0) {
                                try {
                                    this.f188z = Float.parseFloat(substring2);
                                } catch (NumberFormatException e) {
                                }
                            }
                        } else {
                            substring2 = this.f187y.substring(index, indexOf);
                            String substring3 = this.f187y.substring(indexOf + 1);
                            if (substring2.length() > 0 && substring3.length() > 0) {
                                try {
                                    float parseFloat = Float.parseFloat(substring2);
                                    float parseFloat2 = Float.parseFloat(substring3);
                                    if (parseFloat > 0.0f && parseFloat2 > 0.0f) {
                                        if (this.f137A == 1) {
                                            this.f188z = Math.abs(parseFloat2 / parseFloat);
                                        } else {
                                            this.f188z = Math.abs(parseFloat / parseFloat2);
                                        }
                                    }
                                } catch (NumberFormatException e2) {
                                }
                            }
                        }
                    }
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintHorizontal_weight) {
                    this.f138B = obtainStyledAttributes.getFloat(index, 0.0f);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintVertical_weight) {
                    this.f139C = obtainStyledAttributes.getFloat(index, 0.0f);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintHorizontal_chainStyle) {
                    this.f140D = obtainStyledAttributes.getInt(index, 0);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintVertical_chainStyle) {
                    this.f141E = obtainStyledAttributes.getInt(index, 0);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintWidth_default) {
                    this.f142F = obtainStyledAttributes.getInt(index, 0);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintHeight_default) {
                    this.f143G = obtainStyledAttributes.getInt(index, 0);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintWidth_min) {
                    this.f144H = obtainStyledAttributes.getDimensionPixelSize(index, this.f144H);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintWidth_max) {
                    this.f146J = obtainStyledAttributes.getDimensionPixelSize(index, this.f146J);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintHeight_min) {
                    this.f145I = obtainStyledAttributes.getDimensionPixelSize(index, this.f145I);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_constraintHeight_max) {
                    this.f147K = obtainStyledAttributes.getDimensionPixelSize(index, this.f147K);
                } else if (!(index == C0077a.ConstraintLayout_Layout_layout_constraintLeft_creator || index == C0077a.ConstraintLayout_Layout_layout_constraintTop_creator || index == C0077a.ConstraintLayout_Layout_layout_constraintRight_creator || index == C0077a.ConstraintLayout_Layout_layout_constraintBottom_creator || index != C0077a.ConstraintLayout_Layout_layout_constraintBaseline_creator)) {
                }
            }
            obtainStyledAttributes.recycle();
            m119a();
        }

        public C0046a(LayoutParams layoutParams) {
            super(layoutParams);
        }

        public void m119a() {
            this.f154R = false;
            this.f151O = true;
            this.f152P = true;
            if (this.width == 0 || this.width == -1) {
                this.f151O = false;
            }
            if (this.height == 0 || this.height == -1) {
                this.f152P = false;
            }
            if (this.f165c != -1.0f || this.f163a != -1 || this.f164b != -1) {
                this.f154R = true;
                this.f151O = true;
                this.f152P = true;
                if (!(this.f162Z instanceof C0060d)) {
                    this.f162Z = new C0060d();
                }
                ((C0060d) this.f162Z).m248m(this.f150N);
            }
        }

        @TargetApi(17)
        public void resolveLayoutDirection(int i) {
            Object obj = 1;
            super.resolveLayoutDirection(i);
            this.f157U = -1;
            this.f158V = -1;
            this.f155S = -1;
            this.f156T = -1;
            this.f159W = -1;
            this.f160X = -1;
            this.f159W = this.f179q;
            this.f160X = this.f181s;
            this.f161Y = this.f185w;
            if (1 != getLayoutDirection()) {
                obj = null;
            }
            if (obj != null) {
                if (this.f175m != -1) {
                    this.f157U = this.f175m;
                } else if (this.f176n != -1) {
                    this.f158V = this.f176n;
                }
                if (this.f177o != -1) {
                    this.f156T = this.f177o;
                }
                if (this.f178p != -1) {
                    this.f155S = this.f178p;
                }
                if (this.f183u != -1) {
                    this.f160X = this.f183u;
                }
                if (this.f184v != -1) {
                    this.f159W = this.f184v;
                }
                this.f161Y = 1.0f - this.f185w;
            } else {
                if (this.f175m != -1) {
                    this.f156T = this.f175m;
                }
                if (this.f176n != -1) {
                    this.f155S = this.f176n;
                }
                if (this.f177o != -1) {
                    this.f157U = this.f177o;
                }
                if (this.f178p != -1) {
                    this.f158V = this.f178p;
                }
                if (this.f183u != -1) {
                    this.f159W = this.f183u;
                }
                if (this.f184v != -1) {
                    this.f160X = this.f184v;
                }
            }
            if (this.f177o == -1 && this.f178p == -1) {
                if (this.f168f != -1) {
                    this.f157U = this.f168f;
                } else if (this.f169g != -1) {
                    this.f158V = this.f169g;
                }
            }
            if (this.f176n != -1 || this.f175m != -1) {
                return;
            }
            if (this.f166d != -1) {
                this.f155S = this.f166d;
            } else if (this.f167e != -1) {
                this.f156T = this.f167e;
            }
        }
    }

    public ConstraintLayout(Context context) {
        super(context);
        m124b(null);
    }

    public ConstraintLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        m124b(attributeSet);
    }

    public ConstraintLayout(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        m124b(attributeSet);
    }

    private final C0056b m120a(int i) {
        if (i == 0) {
            return this.f190b;
        }
        View view = (View) this.f189a.get(i);
        return view == this ? this.f190b : view == null ? null : ((C0046a) view.getLayoutParams()).f162Z;
    }

    private final C0056b m121a(View view) {
        return view == this ? this.f190b : view == null ? null : ((C0046a) view.getLayoutParams()).f162Z;
    }

    private void m122a(int i, int i2) {
        int paddingTop = getPaddingTop() + getPaddingBottom();
        int paddingLeft = getPaddingLeft() + getPaddingRight();
        int childCount = getChildCount();
        for (int i3 = 0; i3 < childCount; i3++) {
            View childAt = getChildAt(i3);
            if (childAt.getVisibility() != 8) {
                C0046a c0046a = (C0046a) childAt.getLayoutParams();
                C0056b c0056b = c0046a.f162Z;
                if (!c0046a.f154R) {
                    int i4 = c0046a.width;
                    int i5 = c0046a.height;
                    Object obj = (c0046a.f151O || c0046a.f152P || ((!c0046a.f151O && c0046a.f142F == 1) || c0046a.width == -1 || (!c0046a.f152P && (c0046a.f143G == 1 || c0046a.height == -1)))) ? 1 : null;
                    Object obj2 = null;
                    Object obj3 = null;
                    if (obj != null) {
                        Object obj4;
                        int childMeasureSpec;
                        int childMeasureSpec2;
                        if (i4 == 0 || i4 == -1) {
                            obj4 = 1;
                            childMeasureSpec = getChildMeasureSpec(i, paddingLeft, -2);
                        } else {
                            childMeasureSpec = getChildMeasureSpec(i, paddingLeft, i4);
                            obj4 = null;
                        }
                        if (i5 == 0 || i5 == -1) {
                            childMeasureSpec2 = getChildMeasureSpec(i2, paddingTop, -2);
                            obj3 = 1;
                        } else {
                            childMeasureSpec2 = getChildMeasureSpec(i2, paddingTop, i5);
                        }
                        childAt.measure(childMeasureSpec, childMeasureSpec2);
                        i5 = childAt.getMeasuredWidth();
                        Object obj5 = obj4;
                        i4 = childAt.getMeasuredHeight();
                        obj2 = obj5;
                    } else {
                        int i6 = i5;
                        i5 = i4;
                        i4 = i6;
                    }
                    c0056b.m180d(i5);
                    c0056b.m183e(i4);
                    if (obj2 != null) {
                        c0056b.m189h(i5);
                    }
                    if (obj3 != null) {
                        c0056b.m191i(i4);
                    }
                    if (c0046a.f153Q) {
                        int baseline = childAt.getBaseline();
                        if (baseline != -1) {
                            c0056b.m193j(baseline);
                        }
                    }
                }
            }
        }
    }

    private void m123b(int i, int i2) {
        int mode = MeasureSpec.getMode(i);
        int size = MeasureSpec.getSize(i);
        int mode2 = MeasureSpec.getMode(i2);
        int size2 = MeasureSpec.getSize(i2);
        int paddingTop = getPaddingTop() + getPaddingBottom();
        int paddingLeft = getPaddingLeft() + getPaddingRight();
        C0055a c0055a = C0055a.FIXED;
        C0055a c0055a2 = C0055a.FIXED;
        getLayoutParams();
        switch (mode) {
            case Integer.MIN_VALUE:
                c0055a = C0055a.WRAP_CONTENT;
                break;
            case 0:
                c0055a = C0055a.WRAP_CONTENT;
                size = 0;
                break;
            case 1073741824:
                size = Math.min(this.f194f, size) - paddingLeft;
                break;
            default:
                size = 0;
                break;
        }
        switch (mode2) {
            case Integer.MIN_VALUE:
                c0055a2 = C0055a.WRAP_CONTENT;
                break;
            case 0:
                c0055a2 = C0055a.WRAP_CONTENT;
                size2 = 0;
                break;
            case 1073741824:
                size2 = Math.min(this.f195g, size2) - paddingTop;
                break;
            default:
                size2 = 0;
                break;
        }
        this.f190b.m185f(0);
        this.f190b.m187g(0);
        this.f190b.m161a(c0055a);
        this.f190b.m180d(size);
        this.f190b.m171b(c0055a2);
        this.f190b.m183e(size2);
        this.f190b.m185f((this.f192d - getPaddingLeft()) - getPaddingRight());
        this.f190b.m187g((this.f193e - getPaddingTop()) - getPaddingBottom());
    }

    private void m124b(AttributeSet attributeSet) {
        this.f190b.m165a((Object) this);
        this.f189a.put(getId(), this);
        this.f198j = null;
        if (attributeSet != null) {
            TypedArray obtainStyledAttributes = getContext().obtainStyledAttributes(attributeSet, C0077a.ConstraintLayout_Layout);
            int indexCount = obtainStyledAttributes.getIndexCount();
            for (int i = 0; i < indexCount; i++) {
                int index = obtainStyledAttributes.getIndex(i);
                if (index == C0077a.ConstraintLayout_Layout_android_minWidth) {
                    this.f192d = obtainStyledAttributes.getDimensionPixelOffset(index, this.f192d);
                } else if (index == C0077a.ConstraintLayout_Layout_android_minHeight) {
                    this.f193e = obtainStyledAttributes.getDimensionPixelOffset(index, this.f193e);
                } else if (index == C0077a.ConstraintLayout_Layout_android_maxWidth) {
                    this.f194f = obtainStyledAttributes.getDimensionPixelOffset(index, this.f194f);
                } else if (index == C0077a.ConstraintLayout_Layout_android_maxHeight) {
                    this.f195g = obtainStyledAttributes.getDimensionPixelOffset(index, this.f195g);
                } else if (index == C0077a.ConstraintLayout_Layout_layout_optimizationLevel) {
                    this.f197i = obtainStyledAttributes.getInt(index, this.f197i);
                } else if (index == C0077a.ConstraintLayout_Layout_constraintSet) {
                    index = obtainStyledAttributes.getResourceId(index, 0);
                    this.f198j = new C0075a();
                    this.f198j.m343a(getContext(), index);
                }
            }
            obtainStyledAttributes.recycle();
        }
        this.f190b.m239m(this.f197i);
    }

    private void m125c() {
        Object obj = null;
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            if (getChildAt(i).isLayoutRequested()) {
                obj = 1;
                break;
            }
        }
        if (obj != null) {
            this.f191c.clear();
            m126d();
        }
    }

    private void m126d() {
        if (this.f198j != null) {
            this.f198j.m344a(this);
        }
        int childCount = getChildCount();
        this.f190b.m214I();
        for (int i = 0; i < childCount; i++) {
            Object childAt = getChildAt(i);
            C0056b a = m121a((View) childAt);
            if (a != null) {
                C0046a c0046a = (C0046a) childAt.getLayoutParams();
                a.mo25a();
                a.m156a(childAt.getVisibility());
                a.m165a(childAt);
                this.f190b.m218b(a);
                if (!(c0046a.f152P && c0046a.f151O)) {
                    this.f191c.add(a);
                }
                if (c0046a.f154R) {
                    C0060d c0060d = (C0060d) a;
                    if (c0046a.f163a != -1) {
                        c0060d.m249n(c0046a.f163a);
                    }
                    if (c0046a.f164b != -1) {
                        c0060d.m250o(c0046a.f164b);
                    }
                    if (c0046a.f165c != -1.0f) {
                        c0060d.m247e(c0046a.f165c);
                    }
                } else if (c0046a.f155S != -1 || c0046a.f156T != -1 || c0046a.f157U != -1 || c0046a.f158V != -1 || c0046a.f170h != -1 || c0046a.f171i != -1 || c0046a.f172j != -1 || c0046a.f173k != -1 || c0046a.f174l != -1 || c0046a.f148L != -1 || c0046a.f149M != -1 || c0046a.width == -1 || c0046a.height == -1) {
                    float f;
                    int i2;
                    int i3;
                    C0056b a2;
                    View view;
                    C0046a c0046a2;
                    int i4 = c0046a.f155S;
                    int i5 = c0046a.f156T;
                    int i6 = c0046a.f157U;
                    int i7 = c0046a.f158V;
                    int i8 = c0046a.f159W;
                    int i9 = c0046a.f160X;
                    float f2 = c0046a.f161Y;
                    if (VERSION.SDK_INT < 17) {
                        i4 = c0046a.f166d;
                        i5 = c0046a.f167e;
                        i6 = c0046a.f168f;
                        i7 = c0046a.f169g;
                        i8 = c0046a.f179q;
                        i9 = c0046a.f181s;
                        f2 = c0046a.f185w;
                        if (i4 == -1 && i5 == -1) {
                            if (c0046a.f176n != -1) {
                                i4 = c0046a.f176n;
                            } else if (c0046a.f175m != -1) {
                                i5 = c0046a.f175m;
                            }
                        }
                        if (i6 == -1 && i7 == -1) {
                            if (c0046a.f177o != -1) {
                                f = f2;
                                i2 = c0046a.f177o;
                                i3 = i5;
                                i5 = i9;
                                i9 = i4;
                                i4 = i7;
                            } else if (c0046a.f178p != -1) {
                                f = f2;
                                i2 = i6;
                                i3 = i5;
                                i5 = i9;
                                i9 = i4;
                                i4 = c0046a.f178p;
                            }
                            if (i9 != -1) {
                                a2 = m120a(i9);
                                if (a2 != null) {
                                    a.m160a(C0052c.LEFT, a2, C0052c.LEFT, c0046a.leftMargin, i8);
                                }
                            } else if (i3 != -1) {
                                a2 = m120a(i3);
                                if (a2 != null) {
                                    a.m160a(C0052c.LEFT, a2, C0052c.RIGHT, c0046a.leftMargin, i8);
                                }
                            }
                            if (i2 != -1) {
                                a2 = m120a(i2);
                                if (a2 != null) {
                                    a.m160a(C0052c.RIGHT, a2, C0052c.LEFT, c0046a.rightMargin, i5);
                                }
                            } else if (i4 != -1) {
                                a2 = m120a(i4);
                                if (a2 != null) {
                                    a.m160a(C0052c.RIGHT, a2, C0052c.RIGHT, c0046a.rightMargin, i5);
                                }
                            }
                            if (c0046a.f170h != -1) {
                                a2 = m120a(c0046a.f170h);
                                if (a2 != null) {
                                    a.m160a(C0052c.TOP, a2, C0052c.TOP, c0046a.topMargin, c0046a.f180r);
                                }
                            } else if (c0046a.f171i != -1) {
                                a2 = m120a(c0046a.f171i);
                                if (a2 != null) {
                                    a.m160a(C0052c.TOP, a2, C0052c.BOTTOM, c0046a.topMargin, c0046a.f180r);
                                }
                            }
                            if (c0046a.f172j != -1) {
                                a2 = m120a(c0046a.f172j);
                                if (a2 != null) {
                                    a.m160a(C0052c.BOTTOM, a2, C0052c.TOP, c0046a.bottomMargin, c0046a.f182t);
                                }
                            } else if (c0046a.f173k != -1) {
                                a2 = m120a(c0046a.f173k);
                                if (a2 != null) {
                                    a.m160a(C0052c.BOTTOM, a2, C0052c.BOTTOM, c0046a.bottomMargin, c0046a.f182t);
                                }
                            }
                            if (c0046a.f174l != -1) {
                                view = (View) this.f189a.get(c0046a.f174l);
                                a2 = m120a(c0046a.f174l);
                                if (!(a2 == null || view == null || !(view.getLayoutParams() instanceof C0046a))) {
                                    c0046a2 = (C0046a) view.getLayoutParams();
                                    c0046a.f153Q = true;
                                    c0046a2.f153Q = true;
                                    a.mo31a(C0052c.BASELINE).m137a(a2.mo31a(C0052c.BASELINE), 0, -1, C0051b.STRONG, 0, true);
                                    a.mo31a(C0052c.TOP).m146i();
                                    a.mo31a(C0052c.BOTTOM).m146i();
                                }
                            }
                            if (f >= 0.0f && f != 0.5f) {
                                a.m155a(f);
                            }
                            if (c0046a.f186x >= 0.0f && c0046a.f186x != 0.5f) {
                                a.m167b(c0046a.f186x);
                            }
                            if (isInEditMode() && !(c0046a.f148L == -1 && c0046a.f149M == -1)) {
                                a.m157a(c0046a.f148L, c0046a.f149M);
                            }
                            if (!c0046a.f151O) {
                                a.m161a(C0055a.FIXED);
                                a.m180d(c0046a.width);
                            } else if (c0046a.width != -1) {
                                a.m161a(C0055a.MATCH_PARENT);
                                a.mo31a(C0052c.LEFT).f272d = c0046a.leftMargin;
                                a.mo31a(C0052c.RIGHT).f272d = c0046a.rightMargin;
                            } else {
                                a.m161a(C0055a.MATCH_CONSTRAINT);
                                a.m180d(0);
                            }
                            if (!c0046a.f152P) {
                                a.m171b(C0055a.FIXED);
                                a.m183e(c0046a.height);
                            } else if (c0046a.height != -1) {
                                a.m171b(C0055a.MATCH_PARENT);
                                a.mo31a(C0052c.TOP).f272d = c0046a.topMargin;
                                a.mo31a(C0052c.BOTTOM).f272d = c0046a.bottomMargin;
                            } else {
                                a.m171b(C0055a.MATCH_CONSTRAINT);
                                a.m183e(0);
                            }
                            if (c0046a.f187y != null) {
                                a.m166a(c0046a.f187y);
                            }
                            a.m175c(c0046a.f138B);
                            a.m179d(c0046a.f139C);
                            a.m195k(c0046a.f140D);
                            a.m197l(c0046a.f141E);
                            a.m158a(c0046a.f142F, c0046a.f144H, c0046a.f146J);
                            a.m170b(c0046a.f143G, c0046a.f145I, c0046a.f147K);
                        }
                    }
                    f = f2;
                    i2 = i6;
                    i3 = i5;
                    i5 = i9;
                    i9 = i4;
                    i4 = i7;
                    if (i9 != -1) {
                        a2 = m120a(i9);
                        if (a2 != null) {
                            a.m160a(C0052c.LEFT, a2, C0052c.LEFT, c0046a.leftMargin, i8);
                        }
                    } else if (i3 != -1) {
                        a2 = m120a(i3);
                        if (a2 != null) {
                            a.m160a(C0052c.LEFT, a2, C0052c.RIGHT, c0046a.leftMargin, i8);
                        }
                    }
                    if (i2 != -1) {
                        a2 = m120a(i2);
                        if (a2 != null) {
                            a.m160a(C0052c.RIGHT, a2, C0052c.LEFT, c0046a.rightMargin, i5);
                        }
                    } else if (i4 != -1) {
                        a2 = m120a(i4);
                        if (a2 != null) {
                            a.m160a(C0052c.RIGHT, a2, C0052c.RIGHT, c0046a.rightMargin, i5);
                        }
                    }
                    if (c0046a.f170h != -1) {
                        a2 = m120a(c0046a.f170h);
                        if (a2 != null) {
                            a.m160a(C0052c.TOP, a2, C0052c.TOP, c0046a.topMargin, c0046a.f180r);
                        }
                    } else if (c0046a.f171i != -1) {
                        a2 = m120a(c0046a.f171i);
                        if (a2 != null) {
                            a.m160a(C0052c.TOP, a2, C0052c.BOTTOM, c0046a.topMargin, c0046a.f180r);
                        }
                    }
                    if (c0046a.f172j != -1) {
                        a2 = m120a(c0046a.f172j);
                        if (a2 != null) {
                            a.m160a(C0052c.BOTTOM, a2, C0052c.TOP, c0046a.bottomMargin, c0046a.f182t);
                        }
                    } else if (c0046a.f173k != -1) {
                        a2 = m120a(c0046a.f173k);
                        if (a2 != null) {
                            a.m160a(C0052c.BOTTOM, a2, C0052c.BOTTOM, c0046a.bottomMargin, c0046a.f182t);
                        }
                    }
                    if (c0046a.f174l != -1) {
                        view = (View) this.f189a.get(c0046a.f174l);
                        a2 = m120a(c0046a.f174l);
                        c0046a2 = (C0046a) view.getLayoutParams();
                        c0046a.f153Q = true;
                        c0046a2.f153Q = true;
                        a.mo31a(C0052c.BASELINE).m137a(a2.mo31a(C0052c.BASELINE), 0, -1, C0051b.STRONG, 0, true);
                        a.mo31a(C0052c.TOP).m146i();
                        a.mo31a(C0052c.BOTTOM).m146i();
                    }
                    a.m155a(f);
                    a.m167b(c0046a.f186x);
                    a.m157a(c0046a.f148L, c0046a.f149M);
                    if (!c0046a.f151O) {
                        a.m161a(C0055a.FIXED);
                        a.m180d(c0046a.width);
                    } else if (c0046a.width != -1) {
                        a.m161a(C0055a.MATCH_CONSTRAINT);
                        a.m180d(0);
                    } else {
                        a.m161a(C0055a.MATCH_PARENT);
                        a.mo31a(C0052c.LEFT).f272d = c0046a.leftMargin;
                        a.mo31a(C0052c.RIGHT).f272d = c0046a.rightMargin;
                    }
                    if (!c0046a.f152P) {
                        a.m171b(C0055a.FIXED);
                        a.m183e(c0046a.height);
                    } else if (c0046a.height != -1) {
                        a.m171b(C0055a.MATCH_CONSTRAINT);
                        a.m183e(0);
                    } else {
                        a.m171b(C0055a.MATCH_PARENT);
                        a.mo31a(C0052c.TOP).f272d = c0046a.topMargin;
                        a.mo31a(C0052c.BOTTOM).f272d = c0046a.bottomMargin;
                    }
                    if (c0046a.f187y != null) {
                        a.m166a(c0046a.f187y);
                    }
                    a.m175c(c0046a.f138B);
                    a.m179d(c0046a.f139C);
                    a.m195k(c0046a.f140D);
                    a.m197l(c0046a.f141E);
                    a.m158a(c0046a.f142F, c0046a.f144H, c0046a.f146J);
                    a.m170b(c0046a.f143G, c0046a.f145I, c0046a.f147K);
                }
            }
        }
    }

    public C0046a m127a(AttributeSet attributeSet) {
        return new C0046a(getContext(), attributeSet);
    }

    protected void m128a() {
        this.f190b.mo30F();
    }

    public void addView(View view, int i, LayoutParams layoutParams) {
        super.addView(view, i, layoutParams);
        if (VERSION.SDK_INT < 14) {
            onViewAdded(view);
        }
    }

    protected C0046a m129b() {
        return new C0046a(-2, -2);
    }

    protected boolean checkLayoutParams(LayoutParams layoutParams) {
        return layoutParams instanceof C0046a;
    }

    protected /* synthetic */ LayoutParams generateDefaultLayoutParams() {
        return m129b();
    }

    public /* synthetic */ LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return m127a(attributeSet);
    }

    protected LayoutParams generateLayoutParams(LayoutParams layoutParams) {
        return new C0046a(layoutParams);
    }

    public int getMaxHeight() {
        return this.f195g;
    }

    public int getMaxWidth() {
        return this.f194f;
    }

    public int getMinHeight() {
        return this.f193e;
    }

    public int getMinWidth() {
        return this.f192d;
    }

    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int childCount = getChildCount();
        boolean isInEditMode = isInEditMode();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = getChildAt(i5);
            C0046a c0046a = (C0046a) childAt.getLayoutParams();
            if (childAt.getVisibility() != 8 || c0046a.f154R || isInEditMode) {
                C0056b c0056b = c0046a.f162Z;
                int n = c0056b.m199n();
                int o = c0056b.m200o();
                childAt.layout(n, o, c0056b.m188h() + n, c0056b.m196l() + o);
            }
        }
    }

    protected void onMeasure(int i, int i2) {
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        this.f190b.m168b(paddingLeft);
        this.f190b.m176c(paddingTop);
        m123b(i, i2);
        if (this.f196h) {
            this.f196h = false;
            m125c();
        }
        m122a(i, i2);
        if (getChildCount() > 0) {
            m128a();
        }
        int i3 = 0;
        int size = this.f191c.size();
        int paddingBottom = paddingTop + getPaddingBottom();
        int paddingRight = paddingLeft + getPaddingRight();
        if (size > 0) {
            Object obj = null;
            Object obj2 = this.f190b.m151B() == C0055a.WRAP_CONTENT ? 1 : null;
            Object obj3 = this.f190b.m152C() == C0055a.WRAP_CONTENT ? 1 : null;
            int i4 = 0;
            while (i4 < size) {
                C0056b c0056b = (C0056b) this.f191c.get(i4);
                if (c0056b instanceof C0060d) {
                    paddingLeft = i3;
                } else {
                    View view = (View) c0056b.m209x();
                    if (view == null) {
                        paddingLeft = i3;
                    } else if (view.getVisibility() == 8) {
                        paddingLeft = i3;
                    } else {
                        Object obj4;
                        C0046a c0046a = (C0046a) view.getLayoutParams();
                        view.measure(c0046a.width == -2 ? getChildMeasureSpec(i, paddingRight, c0046a.width) : MeasureSpec.makeMeasureSpec(c0056b.m188h(), 1073741824), c0046a.height == -2 ? getChildMeasureSpec(i2, paddingBottom, c0046a.height) : MeasureSpec.makeMeasureSpec(c0056b.m196l(), 1073741824));
                        int measuredWidth = view.getMeasuredWidth();
                        int measuredHeight = view.getMeasuredHeight();
                        if (measuredWidth != c0056b.m188h()) {
                            c0056b.m180d(measuredWidth);
                            if (obj2 != null && c0056b.m205t() > this.f190b.m188h()) {
                                this.f190b.m180d(Math.max(this.f192d, c0056b.m205t() + c0056b.mo31a(C0052c.RIGHT).m141d()));
                            }
                            obj4 = 1;
                        } else {
                            obj4 = obj;
                        }
                        if (measuredHeight != c0056b.m196l()) {
                            c0056b.m183e(measuredHeight);
                            if (obj3 != null && c0056b.m206u() > this.f190b.m196l()) {
                                this.f190b.m183e(Math.max(this.f193e, c0056b.m206u() + c0056b.mo31a(C0052c.BOTTOM).m141d()));
                            }
                            obj4 = 1;
                        }
                        if (c0046a.f153Q) {
                            int baseline = view.getBaseline();
                            if (!(baseline == -1 || baseline == c0056b.m208w())) {
                                c0056b.m193j(baseline);
                                obj4 = 1;
                            }
                        }
                        if (VERSION.SDK_INT >= 11) {
                            paddingLeft = combineMeasuredStates(i3, view.getMeasuredState());
                            obj = obj4;
                        } else {
                            obj = obj4;
                            paddingLeft = i3;
                        }
                    }
                }
                i4++;
                i3 = paddingLeft;
            }
            if (obj != null) {
                m128a();
            }
        }
        paddingLeft = this.f190b.m188h() + paddingRight;
        paddingTop = this.f190b.m196l() + paddingBottom;
        if (VERSION.SDK_INT >= 11) {
            paddingLeft = Math.min(this.f194f, resolveSizeAndState(paddingLeft, i, i3)) & 16777215;
            paddingTop = Math.min(this.f195g, resolveSizeAndState(paddingTop, i2, i3 << 16)) & 16777215;
            if (this.f190b.mo29D()) {
                paddingLeft |= 16777216;
            }
            if (this.f190b.m229E()) {
                paddingTop |= 16777216;
            }
            setMeasuredDimension(paddingLeft, paddingTop);
            return;
        }
        setMeasuredDimension(paddingLeft, paddingTop);
    }

    public void onViewAdded(View view) {
        if (VERSION.SDK_INT >= 14) {
            super.onViewAdded(view);
        }
        C0056b a = m121a(view);
        if ((view instanceof C0076b) && !(a instanceof C0060d)) {
            C0046a c0046a = (C0046a) view.getLayoutParams();
            c0046a.f162Z = new C0060d();
            c0046a.f154R = true;
            ((C0060d) c0046a.f162Z).m248m(c0046a.f150N);
            a = c0046a.f162Z;
        }
        this.f189a.put(view.getId(), view);
        this.f196h = true;
    }

    public void onViewRemoved(View view) {
        if (VERSION.SDK_INT >= 14) {
            super.onViewRemoved(view);
        }
        this.f189a.remove(view.getId());
        this.f190b.m219c(m121a(view));
        this.f196h = true;
    }

    public void removeView(View view) {
        super.removeView(view);
        if (VERSION.SDK_INT < 14) {
            onViewRemoved(view);
        }
    }

    public void requestLayout() {
        super.requestLayout();
        this.f196h = true;
    }

    public void setConstraintSet(C0075a c0075a) {
        this.f198j = c0075a;
    }

    public void setId(int i) {
        this.f189a.remove(getId());
        super.setId(i);
        this.f189a.put(getId(), this);
    }

    public void setMaxHeight(int i) {
        if (i != this.f195g) {
            this.f195g = i;
            requestLayout();
        }
    }

    public void setMaxWidth(int i) {
        if (i != this.f194f) {
            this.f194f = i;
            requestLayout();
        }
    }

    public void setMinHeight(int i) {
        if (i != this.f193e) {
            this.f193e = i;
            requestLayout();
        }
    }

    public void setMinWidth(int i) {
        if (i != this.f192d) {
            this.f192d = i;
            requestLayout();
        }
    }

    public void setOptimizationLevel(int i) {
        this.f190b.m239m(i);
    }
}
