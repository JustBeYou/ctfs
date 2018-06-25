package android.support.v4.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.p017h.C0283b;
import android.support.v4.p017h.C0297i;
import android.support.v4.p017h.C0298j;
import android.support.v4.p017h.C0299k;
import android.support.v4.p017h.C0301m;
import android.support.v4.p017h.C0315p;
import android.support.v4.p017h.p018a.C0257a;
import android.support.v4.p017h.p018a.C0274e;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.FocusFinder;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.AnimationUtils;
import android.widget.EdgeEffect;
import android.widget.FrameLayout;
import android.widget.OverScroller;
import android.widget.ScrollView;
import java.util.List;

public class NestedScrollView extends FrameLayout implements C0297i, C0299k {
    private static final C0368a f1034w = new C0368a();
    private static final int[] f1035x = new int[]{16843130};
    private float f1036A;
    private C0369b f1037B;
    private long f1038a;
    private final Rect f1039b;
    private OverScroller f1040c;
    private EdgeEffect f1041d;
    private EdgeEffect f1042e;
    private int f1043f;
    private boolean f1044g;
    private boolean f1045h;
    private View f1046i;
    private boolean f1047j;
    private VelocityTracker f1048k;
    private boolean f1049l;
    private boolean f1050m;
    private int f1051n;
    private int f1052o;
    private int f1053p;
    private int f1054q;
    private final int[] f1055r;
    private final int[] f1056s;
    private int f1057t;
    private int f1058u;
    private C0371c f1059v;
    private final C0301m f1060y;
    private final C0298j f1061z;

    static class C0368a extends C0283b {
        C0368a() {
        }

        public void mo228a(View view, C0257a c0257a) {
            super.mo228a(view, c0257a);
            NestedScrollView nestedScrollView = (NestedScrollView) view;
            c0257a.m1190a(ScrollView.class.getName());
            if (nestedScrollView.isEnabled()) {
                int scrollRange = nestedScrollView.getScrollRange();
                if (scrollRange > 0) {
                    c0257a.m1191a(true);
                    if (nestedScrollView.getScrollY() > 0) {
                        c0257a.m1188a(8192);
                    }
                    if (nestedScrollView.getScrollY() < scrollRange) {
                        c0257a.m1188a(4096);
                    }
                }
            }
        }

        public boolean mo229a(View view, int i, Bundle bundle) {
            if (super.mo229a(view, i, bundle)) {
                return true;
            }
            NestedScrollView nestedScrollView = (NestedScrollView) view;
            if (!nestedScrollView.isEnabled()) {
                return false;
            }
            int min;
            switch (i) {
                case 4096:
                    min = Math.min(((nestedScrollView.getHeight() - nestedScrollView.getPaddingBottom()) - nestedScrollView.getPaddingTop()) + nestedScrollView.getScrollY(), nestedScrollView.getScrollRange());
                    if (min == nestedScrollView.getScrollY()) {
                        return false;
                    }
                    nestedScrollView.m1744c(0, min);
                    return true;
                case 8192:
                    min = Math.max(nestedScrollView.getScrollY() - ((nestedScrollView.getHeight() - nestedScrollView.getPaddingBottom()) - nestedScrollView.getPaddingTop()), 0);
                    if (min == nestedScrollView.getScrollY()) {
                        return false;
                    }
                    nestedScrollView.m1744c(0, min);
                    return true;
                default:
                    return false;
            }
        }

        public void mo230d(View view, AccessibilityEvent accessibilityEvent) {
            super.mo230d(view, accessibilityEvent);
            NestedScrollView nestedScrollView = (NestedScrollView) view;
            accessibilityEvent.setClassName(ScrollView.class.getName());
            accessibilityEvent.setScrollable(nestedScrollView.getScrollRange() > 0);
            accessibilityEvent.setScrollX(nestedScrollView.getScrollX());
            accessibilityEvent.setScrollY(nestedScrollView.getScrollY());
            C0274e.m1238a(accessibilityEvent, nestedScrollView.getScrollX());
            C0274e.m1239b(accessibilityEvent, nestedScrollView.getScrollRange());
        }
    }

    public interface C0369b {
        void mo259a(NestedScrollView nestedScrollView, int i, int i2, int i3, int i4);
    }

    static class C0371c extends BaseSavedState {
        public static final Creator<C0371c> CREATOR = new C03701();
        public int f1033a;

        static class C03701 implements Creator<C0371c> {
            C03701() {
            }

            public C0371c m1714a(Parcel parcel) {
                return new C0371c(parcel);
            }

            public C0371c[] m1715a(int i) {
                return new C0371c[i];
            }

            public /* synthetic */ Object createFromParcel(Parcel parcel) {
                return m1714a(parcel);
            }

            public /* synthetic */ Object[] newArray(int i) {
                return m1715a(i);
            }
        }

        C0371c(Parcel parcel) {
            super(parcel);
            this.f1033a = parcel.readInt();
        }

        C0371c(Parcelable parcelable) {
            super(parcelable);
        }

        public String toString() {
            return "HorizontalScrollView.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " scrollPosition=" + this.f1033a + "}";
        }

        public void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeInt(this.f1033a);
        }
    }

    public NestedScrollView(Context context) {
        this(context, null);
    }

    public NestedScrollView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public NestedScrollView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.f1039b = new Rect();
        this.f1044g = true;
        this.f1045h = false;
        this.f1046i = null;
        this.f1047j = false;
        this.f1050m = true;
        this.f1054q = -1;
        this.f1055r = new int[2];
        this.f1056s = new int[2];
        m1717a();
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, f1035x, i, 0);
        setFillViewport(obtainStyledAttributes.getBoolean(0, false));
        obtainStyledAttributes.recycle();
        this.f1060y = new C0301m(this);
        this.f1061z = new C0298j(this);
        setNestedScrollingEnabled(true);
        C0315p.m1383a((View) this, f1034w);
    }

    private View m1716a(boolean z, int i, int i2) {
        List focusables = getFocusables(2);
        View view = null;
        Object obj = null;
        int size = focusables.size();
        int i3 = 0;
        while (i3 < size) {
            View view2;
            Object obj2;
            View view3 = (View) focusables.get(i3);
            int top = view3.getTop();
            int bottom = view3.getBottom();
            if (i < bottom && top < i2) {
                Object obj3 = (i >= top || bottom >= i2) ? null : 1;
                if (view == null) {
                    Object obj4 = obj3;
                    view2 = view3;
                    obj2 = obj4;
                } else {
                    Object obj5 = ((!z || top >= view.getTop()) && (z || bottom <= view.getBottom())) ? null : 1;
                    if (obj != null) {
                        if (!(obj3 == null || obj5 == null)) {
                            view2 = view3;
                            obj2 = obj;
                        }
                    } else if (obj3 != null) {
                        view2 = view3;
                        int i4 = 1;
                    } else if (obj5 != null) {
                        view2 = view3;
                        obj2 = obj;
                    }
                }
                i3++;
                view = view2;
                obj = obj2;
            }
            obj2 = obj;
            view2 = view;
            i3++;
            view = view2;
            obj = obj2;
        }
        return view;
    }

    private void m1717a() {
        this.f1040c = new OverScroller(getContext());
        setFocusable(true);
        setDescendantFocusability(262144);
        setWillNotDraw(false);
        ViewConfiguration viewConfiguration = ViewConfiguration.get(getContext());
        this.f1051n = viewConfiguration.getScaledTouchSlop();
        this.f1052o = viewConfiguration.getScaledMinimumFlingVelocity();
        this.f1053p = viewConfiguration.getScaledMaximumFlingVelocity();
    }

    private void m1718a(MotionEvent motionEvent) {
        int actionIndex = motionEvent.getActionIndex();
        if (motionEvent.getPointerId(actionIndex) == this.f1054q) {
            actionIndex = actionIndex == 0 ? 1 : 0;
            this.f1043f = (int) motionEvent.getY(actionIndex);
            this.f1054q = motionEvent.getPointerId(actionIndex);
            if (this.f1048k != null) {
                this.f1048k.clear();
            }
        }
    }

    private boolean m1719a(int i, int i2, int i3) {
        boolean z = false;
        int height = getHeight();
        int scrollY = getScrollY();
        int i4 = scrollY + height;
        boolean z2 = i == 33;
        View a = m1716a(z2, i2, i3);
        if (a == null) {
            a = this;
        }
        if (i2 < scrollY || i3 > i4) {
            m1733g(z2 ? i2 - scrollY : i3 - i4);
            z = true;
        }
        if (a != findFocus()) {
            a.requestFocus(i);
        }
        return z;
    }

    private boolean m1720a(Rect rect, boolean z) {
        int a = m1735a(rect);
        boolean z2 = a != 0;
        if (z2) {
            if (z) {
                scrollBy(0, a);
            } else {
                m1742b(0, a);
            }
        }
        return z2;
    }

    private boolean m1721a(View view) {
        return !m1722a(view, 0, getHeight());
    }

    private boolean m1722a(View view, int i, int i2) {
        view.getDrawingRect(this.f1039b);
        offsetDescendantRectToMyCoords(view, this.f1039b);
        return this.f1039b.bottom + i >= getScrollY() && this.f1039b.top - i <= getScrollY() + i2;
    }

    private static boolean m1723a(View view, View view2) {
        if (view == view2) {
            return true;
        }
        ViewParent parent = view.getParent();
        boolean z = (parent instanceof ViewGroup) && m1723a((View) parent, view2);
        return z;
    }

    private static int m1724b(int i, int i2, int i3) {
        return (i2 >= i3 || i < 0) ? 0 : i2 + i > i3 ? i3 - i2 : i;
    }

    private void m1725b(View view) {
        view.getDrawingRect(this.f1039b);
        offsetDescendantRectToMyCoords(view, this.f1039b);
        int a = m1735a(this.f1039b);
        if (a != 0) {
            scrollBy(0, a);
        }
    }

    private boolean m1726b() {
        View childAt = getChildAt(0);
        if (childAt == null) {
            return false;
        }
        return getHeight() < (childAt.getHeight() + getPaddingTop()) + getPaddingBottom();
    }

    private void m1727c() {
        if (this.f1048k == null) {
            this.f1048k = VelocityTracker.obtain();
        } else {
            this.f1048k.clear();
        }
    }

    private void m1728d() {
        if (this.f1048k == null) {
            this.f1048k = VelocityTracker.obtain();
        }
    }

    private boolean m1729d(int i, int i2) {
        if (getChildCount() <= 0) {
            return false;
        }
        int scrollY = getScrollY();
        View childAt = getChildAt(0);
        return i2 >= childAt.getTop() - scrollY && i2 < childAt.getBottom() - scrollY && i >= childAt.getLeft() && i < childAt.getRight();
    }

    private void m1730e() {
        if (this.f1048k != null) {
            this.f1048k.recycle();
            this.f1048k = null;
        }
    }

    private void m1731f() {
        this.f1047j = false;
        m1730e();
        m1736a(0);
        if (this.f1041d != null) {
            this.f1041d.onRelease();
            this.f1042e.onRelease();
        }
    }

    private void m1732g() {
        if (getOverScrollMode() == 2) {
            this.f1041d = null;
            this.f1042e = null;
        } else if (this.f1041d == null) {
            Context context = getContext();
            this.f1041d = new EdgeEffect(context);
            this.f1042e = new EdgeEffect(context);
        }
    }

    private void m1733g(int i) {
        if (i == 0) {
            return;
        }
        if (this.f1050m) {
            m1742b(0, i);
        } else {
            scrollBy(0, i);
        }
    }

    private float getVerticalScrollFactorCompat() {
        if (this.f1036A == 0.0f) {
            TypedValue typedValue = new TypedValue();
            Context context = getContext();
            if (context.getTheme().resolveAttribute(16842829, typedValue, true)) {
                this.f1036A = typedValue.getDimension(context.getResources().getDisplayMetrics());
            } else {
                throw new IllegalStateException("Expected theme to define listPreferredItemHeight.");
            }
        }
        return this.f1036A;
    }

    private void m1734h(int i) {
        int scrollY = getScrollY();
        boolean z = (scrollY > 0 || i > 0) && (scrollY < getScrollRange() || i < 0);
        if (!dispatchNestedPreFling(0.0f, (float) i)) {
            dispatchNestedFling(0.0f, (float) i, z);
            m1748f(i);
        }
    }

    protected int m1735a(Rect rect) {
        if (getChildCount() == 0) {
            return 0;
        }
        int height = getHeight();
        int scrollY = getScrollY();
        int i = scrollY + height;
        int verticalFadingEdgeLength = getVerticalFadingEdgeLength();
        if (rect.top > 0) {
            scrollY += verticalFadingEdgeLength;
        }
        if (rect.bottom < getChildAt(0).getHeight()) {
            i -= verticalFadingEdgeLength;
        }
        if (rect.bottom > i && rect.top > scrollY) {
            scrollY = Math.min(rect.height() > height ? (rect.top - scrollY) + 0 : (rect.bottom - i) + 0, getChildAt(0).getBottom() - i);
        } else if (rect.top >= scrollY || rect.bottom >= i) {
            scrollY = 0;
        } else {
            scrollY = Math.max(rect.height() > height ? 0 - (i - rect.bottom) : 0 - (scrollY - rect.top), -getScrollY());
        }
        return scrollY;
    }

    public void m1736a(int i) {
        this.f1061z.m1316c(i);
    }

    public boolean m1737a(int i, int i2) {
        return this.f1061z.m1308a(i, i2);
    }

    boolean m1738a(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, boolean z) {
        boolean z2;
        boolean z3;
        int overScrollMode = getOverScrollMode();
        Object obj = computeHorizontalScrollRange() > computeHorizontalScrollExtent() ? 1 : null;
        Object obj2 = computeVerticalScrollRange() > computeVerticalScrollExtent() ? 1 : null;
        Object obj3 = (overScrollMode == 0 || (overScrollMode == 1 && obj != null)) ? 1 : null;
        obj = (overScrollMode == 0 || (overScrollMode == 1 && obj2 != null)) ? 1 : null;
        int i9 = i3 + i;
        if (obj3 == null) {
            i7 = 0;
        }
        int i10 = i4 + i2;
        if (obj == null) {
            i8 = 0;
        }
        int i11 = -i7;
        int i12 = i7 + i5;
        overScrollMode = -i8;
        int i13 = i8 + i6;
        if (i9 > i12) {
            z2 = true;
        } else if (i9 < i11) {
            z2 = true;
            i12 = i11;
        } else {
            z2 = false;
            i12 = i9;
        }
        if (i10 > i13) {
            z3 = true;
        } else if (i10 < overScrollMode) {
            z3 = true;
            i13 = overScrollMode;
        } else {
            z3 = false;
            i13 = i10;
        }
        if (z3 && !m1743b(1)) {
            this.f1040c.springBack(i12, i13, 0, 0, 0, getScrollRange());
        }
        onOverScrolled(i12, i13, z2, z3);
        return z2 || z3;
    }

    public boolean m1739a(int i, int i2, int i3, int i4, int[] iArr, int i5) {
        return this.f1061z.m1310a(i, i2, i3, i4, iArr, i5);
    }

    public boolean m1740a(int i, int i2, int[] iArr, int[] iArr2, int i3) {
        return this.f1061z.m1312a(i, i2, iArr, iArr2, i3);
    }

    public boolean m1741a(KeyEvent keyEvent) {
        int i = 33;
        this.f1039b.setEmpty();
        if (m1726b()) {
            if (keyEvent.getAction() != 0) {
                return false;
            }
            switch (keyEvent.getKeyCode()) {
                case 19:
                    return !keyEvent.isAltPressed() ? m1747e(33) : m1746d(33);
                case 20:
                    return !keyEvent.isAltPressed() ? m1747e(130) : m1746d(130);
                case 62:
                    if (!keyEvent.isShiftPressed()) {
                        i = 130;
                    }
                    m1745c(i);
                    return false;
                default:
                    return false;
            }
        } else if (!isFocused() || keyEvent.getKeyCode() == 4) {
            return false;
        } else {
            View findFocus = findFocus();
            if (findFocus == this) {
                findFocus = null;
            }
            findFocus = FocusFinder.getInstance().findNextFocus(this, findFocus, 130);
            boolean z = (findFocus == null || findFocus == this || !findFocus.requestFocus(130)) ? false : true;
            return z;
        }
    }

    public void addView(View view) {
        if (getChildCount() > 0) {
            throw new IllegalStateException("ScrollView can host only one direct child");
        }
        super.addView(view);
    }

    public void addView(View view, int i) {
        if (getChildCount() > 0) {
            throw new IllegalStateException("ScrollView can host only one direct child");
        }
        super.addView(view, i);
    }

    public void addView(View view, int i, LayoutParams layoutParams) {
        if (getChildCount() > 0) {
            throw new IllegalStateException("ScrollView can host only one direct child");
        }
        super.addView(view, i, layoutParams);
    }

    public void addView(View view, LayoutParams layoutParams) {
        if (getChildCount() > 0) {
            throw new IllegalStateException("ScrollView can host only one direct child");
        }
        super.addView(view, layoutParams);
    }

    public final void m1742b(int i, int i2) {
        if (getChildCount() != 0) {
            if (AnimationUtils.currentAnimationTimeMillis() - this.f1038a > 250) {
                int max = Math.max(0, getChildAt(0).getHeight() - ((getHeight() - getPaddingBottom()) - getPaddingTop()));
                int scrollY = getScrollY();
                this.f1040c.startScroll(getScrollX(), scrollY, 0, Math.max(0, Math.min(scrollY + i2, max)) - scrollY);
                C0315p.m1377a(this);
            } else {
                if (!this.f1040c.isFinished()) {
                    this.f1040c.abortAnimation();
                }
                scrollBy(i, i2);
            }
            this.f1038a = AnimationUtils.currentAnimationTimeMillis();
        }
    }

    public boolean m1743b(int i) {
        return this.f1061z.m1307a(i);
    }

    public final void m1744c(int i, int i2) {
        m1742b(i - getScrollX(), i2 - getScrollY());
    }

    public boolean m1745c(int i) {
        int i2 = i == 130 ? 1 : 0;
        int height = getHeight();
        if (i2 != 0) {
            this.f1039b.top = getScrollY() + height;
            i2 = getChildCount();
            if (i2 > 0) {
                View childAt = getChildAt(i2 - 1);
                if (this.f1039b.top + height > childAt.getBottom()) {
                    this.f1039b.top = childAt.getBottom() - height;
                }
            }
        } else {
            this.f1039b.top = getScrollY() - height;
            if (this.f1039b.top < 0) {
                this.f1039b.top = 0;
            }
        }
        this.f1039b.bottom = this.f1039b.top + height;
        return m1719a(i, this.f1039b.top, this.f1039b.bottom);
    }

    public int computeHorizontalScrollExtent() {
        return super.computeHorizontalScrollExtent();
    }

    public int computeHorizontalScrollOffset() {
        return super.computeHorizontalScrollOffset();
    }

    public int computeHorizontalScrollRange() {
        return super.computeHorizontalScrollRange();
    }

    public void computeScroll() {
        if (this.f1040c.computeScrollOffset()) {
            this.f1040c.getCurrX();
            int currY = this.f1040c.getCurrY();
            int i = currY - this.f1058u;
            if (m1740a(0, i, this.f1056s, null, 1)) {
                i -= this.f1056s[1];
            }
            if (i != 0) {
                int scrollRange = getScrollRange();
                int scrollY = getScrollY();
                m1738a(0, i, getScrollX(), scrollY, 0, scrollRange, 0, 0, false);
                int scrollY2 = getScrollY() - scrollY;
                if (!m1739a(0, scrollY2, 0, i - scrollY2, null, 1)) {
                    int overScrollMode = getOverScrollMode();
                    Object obj = (overScrollMode == 0 || (overScrollMode == 1 && scrollRange > 0)) ? 1 : null;
                    if (obj != null) {
                        m1732g();
                        if (currY <= 0 && scrollY > 0) {
                            this.f1041d.onAbsorb((int) this.f1040c.getCurrVelocity());
                        } else if (currY >= scrollRange && scrollY < scrollRange) {
                            this.f1042e.onAbsorb((int) this.f1040c.getCurrVelocity());
                        }
                    }
                }
            }
            this.f1058u = currY;
            C0315p.m1377a(this);
            return;
        }
        if (m1743b(1)) {
            m1736a(1);
        }
        this.f1058u = 0;
    }

    public int computeVerticalScrollExtent() {
        return super.computeVerticalScrollExtent();
    }

    public int computeVerticalScrollOffset() {
        return Math.max(0, super.computeVerticalScrollOffset());
    }

    public int computeVerticalScrollRange() {
        int height = (getHeight() - getPaddingBottom()) - getPaddingTop();
        if (getChildCount() == 0) {
            return height;
        }
        int bottom = getChildAt(0).getBottom();
        int scrollY = getScrollY();
        height = Math.max(0, bottom - height);
        return scrollY < 0 ? bottom - scrollY : scrollY > height ? bottom + (scrollY - height) : bottom;
    }

    public boolean m1746d(int i) {
        int i2 = i == 130 ? 1 : 0;
        int height = getHeight();
        this.f1039b.top = 0;
        this.f1039b.bottom = height;
        if (i2 != 0) {
            i2 = getChildCount();
            if (i2 > 0) {
                this.f1039b.bottom = getChildAt(i2 - 1).getBottom() + getPaddingBottom();
                this.f1039b.top = this.f1039b.bottom - height;
            }
        }
        return m1719a(i, this.f1039b.top, this.f1039b.bottom);
    }

    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        return super.dispatchKeyEvent(keyEvent) || m1741a(keyEvent);
    }

    public boolean dispatchNestedFling(float f, float f2, boolean z) {
        return this.f1061z.m1306a(f, f2, z);
    }

    public boolean dispatchNestedPreFling(float f, float f2) {
        return this.f1061z.m1305a(f, f2);
    }

    public boolean dispatchNestedPreScroll(int i, int i2, int[] iArr, int[] iArr2) {
        return this.f1061z.m1311a(i, i2, iArr, iArr2);
    }

    public boolean dispatchNestedScroll(int i, int i2, int i3, int i4, int[] iArr) {
        return this.f1061z.m1309a(i, i2, i3, i4, iArr);
    }

    public void draw(Canvas canvas) {
        super.draw(canvas);
        if (this.f1041d != null) {
            int save;
            int width;
            int scrollY = getScrollY();
            if (!this.f1041d.isFinished()) {
                save = canvas.save();
                width = (getWidth() - getPaddingLeft()) - getPaddingRight();
                canvas.translate((float) getPaddingLeft(), (float) Math.min(0, scrollY));
                this.f1041d.setSize(width, getHeight());
                if (this.f1041d.draw(canvas)) {
                    C0315p.m1377a(this);
                }
                canvas.restoreToCount(save);
            }
            if (!this.f1042e.isFinished()) {
                save = canvas.save();
                width = (getWidth() - getPaddingLeft()) - getPaddingRight();
                int height = getHeight();
                canvas.translate((float) ((-width) + getPaddingLeft()), (float) (Math.max(getScrollRange(), scrollY) + height));
                canvas.rotate(180.0f, (float) width, 0.0f);
                this.f1042e.setSize(width, height);
                if (this.f1042e.draw(canvas)) {
                    C0315p.m1377a(this);
                }
                canvas.restoreToCount(save);
            }
        }
    }

    public boolean m1747e(int i) {
        View findFocus = findFocus();
        if (findFocus == this) {
            findFocus = null;
        }
        View findNextFocus = FocusFinder.getInstance().findNextFocus(this, findFocus, i);
        int maxScrollAmount = getMaxScrollAmount();
        if (findNextFocus == null || !m1722a(findNextFocus, maxScrollAmount, getHeight())) {
            if (i == 33 && getScrollY() < maxScrollAmount) {
                maxScrollAmount = getScrollY();
            } else if (i == 130 && getChildCount() > 0) {
                int bottom = getChildAt(0).getBottom();
                int scrollY = (getScrollY() + getHeight()) - getPaddingBottom();
                if (bottom - scrollY < maxScrollAmount) {
                    maxScrollAmount = bottom - scrollY;
                }
            }
            if (maxScrollAmount == 0) {
                return false;
            }
            if (i != 130) {
                maxScrollAmount = -maxScrollAmount;
            }
            m1733g(maxScrollAmount);
        } else {
            findNextFocus.getDrawingRect(this.f1039b);
            offsetDescendantRectToMyCoords(findNextFocus, this.f1039b);
            m1733g(m1735a(this.f1039b));
            findNextFocus.requestFocus(i);
        }
        if (findFocus != null && findFocus.isFocused() && m1721a(findFocus)) {
            int descendantFocusability = getDescendantFocusability();
            setDescendantFocusability(131072);
            requestFocus();
            setDescendantFocusability(descendantFocusability);
        }
        return true;
    }

    public void m1748f(int i) {
        if (getChildCount() > 0) {
            m1737a(2, 1);
            this.f1040c.fling(getScrollX(), getScrollY(), 0, i, 0, 0, Integer.MIN_VALUE, Integer.MAX_VALUE, 0, 0);
            this.f1058u = getScrollY();
            C0315p.m1377a(this);
        }
    }

    protected float getBottomFadingEdgeStrength() {
        if (getChildCount() == 0) {
            return 0.0f;
        }
        int verticalFadingEdgeLength = getVerticalFadingEdgeLength();
        int bottom = (getChildAt(0).getBottom() - getScrollY()) - (getHeight() - getPaddingBottom());
        return bottom < verticalFadingEdgeLength ? ((float) bottom) / ((float) verticalFadingEdgeLength) : 1.0f;
    }

    public int getMaxScrollAmount() {
        return (int) (0.5f * ((float) getHeight()));
    }

    public int getNestedScrollAxes() {
        return this.f1060y.m1322a();
    }

    int getScrollRange() {
        return getChildCount() > 0 ? Math.max(0, getChildAt(0).getHeight() - ((getHeight() - getPaddingBottom()) - getPaddingTop())) : 0;
    }

    protected float getTopFadingEdgeStrength() {
        if (getChildCount() == 0) {
            return 0.0f;
        }
        int verticalFadingEdgeLength = getVerticalFadingEdgeLength();
        int scrollY = getScrollY();
        return scrollY < verticalFadingEdgeLength ? ((float) scrollY) / ((float) verticalFadingEdgeLength) : 1.0f;
    }

    public boolean hasNestedScrollingParent() {
        return this.f1061z.m1313b();
    }

    public boolean isNestedScrollingEnabled() {
        return this.f1061z.m1304a();
    }

    protected void measureChild(View view, int i, int i2) {
        view.measure(getChildMeasureSpec(i, getPaddingLeft() + getPaddingRight(), view.getLayoutParams().width), MeasureSpec.makeMeasureSpec(0, 0));
    }

    protected void measureChildWithMargins(View view, int i, int i2, int i3, int i4) {
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        view.measure(getChildMeasureSpec(i, (((getPaddingLeft() + getPaddingRight()) + marginLayoutParams.leftMargin) + marginLayoutParams.rightMargin) + i2, marginLayoutParams.width), MeasureSpec.makeMeasureSpec(marginLayoutParams.bottomMargin + marginLayoutParams.topMargin, 0));
    }

    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.f1045h = false;
    }

    public boolean onGenericMotionEvent(MotionEvent motionEvent) {
        if ((motionEvent.getSource() & 2) == 0) {
            return false;
        }
        switch (motionEvent.getAction()) {
            case 8:
                if (this.f1047j) {
                    return false;
                }
                float axisValue = motionEvent.getAxisValue(9);
                if (axisValue == 0.0f) {
                    return false;
                }
                int verticalScrollFactorCompat = (int) (axisValue * getVerticalScrollFactorCompat());
                int scrollRange = getScrollRange();
                int scrollY = getScrollY();
                verticalScrollFactorCompat = scrollY - verticalScrollFactorCompat;
                if (verticalScrollFactorCompat < 0) {
                    scrollRange = 0;
                } else if (verticalScrollFactorCompat <= scrollRange) {
                    scrollRange = verticalScrollFactorCompat;
                }
                if (scrollRange == scrollY) {
                    return false;
                }
                super.scrollTo(getScrollX(), scrollRange);
                return true;
            default:
                return false;
        }
    }

    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        boolean z = true;
        int action = motionEvent.getAction();
        if (action == 2 && this.f1047j) {
            return true;
        }
        switch (action & 255) {
            case 0:
                action = (int) motionEvent.getY();
                if (!m1729d((int) motionEvent.getX(), action)) {
                    this.f1047j = false;
                    m1730e();
                    break;
                }
                this.f1043f = action;
                this.f1054q = motionEvent.getPointerId(0);
                m1727c();
                this.f1048k.addMovement(motionEvent);
                this.f1040c.computeScrollOffset();
                if (this.f1040c.isFinished()) {
                    z = false;
                }
                this.f1047j = z;
                m1737a(2, 0);
                break;
            case 1:
            case 3:
                this.f1047j = false;
                this.f1054q = -1;
                m1730e();
                if (this.f1040c.springBack(getScrollX(), getScrollY(), 0, 0, 0, getScrollRange())) {
                    C0315p.m1377a(this);
                }
                m1736a(0);
                break;
            case 2:
                action = this.f1054q;
                if (action != -1) {
                    int findPointerIndex = motionEvent.findPointerIndex(action);
                    if (findPointerIndex != -1) {
                        action = (int) motionEvent.getY(findPointerIndex);
                        if (Math.abs(action - this.f1043f) > this.f1051n && (getNestedScrollAxes() & 2) == 0) {
                            this.f1047j = true;
                            this.f1043f = action;
                            m1728d();
                            this.f1048k.addMovement(motionEvent);
                            this.f1057t = 0;
                            ViewParent parent = getParent();
                            if (parent != null) {
                                parent.requestDisallowInterceptTouchEvent(true);
                                break;
                            }
                        }
                    }
                    Log.e("NestedScrollView", "Invalid pointerId=" + action + " in onInterceptTouchEvent");
                    break;
                }
                break;
            case 6:
                m1718a(motionEvent);
                break;
        }
        return this.f1047j;
    }

    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        this.f1044g = false;
        if (this.f1046i != null && m1723a(this.f1046i, (View) this)) {
            m1725b(this.f1046i);
        }
        this.f1046i = null;
        if (!this.f1045h) {
            if (this.f1059v != null) {
                scrollTo(getScrollX(), this.f1059v.f1033a);
                this.f1059v = null;
            }
            int max = Math.max(0, (getChildCount() > 0 ? getChildAt(0).getMeasuredHeight() : 0) - (((i4 - i2) - getPaddingBottom()) - getPaddingTop()));
            if (getScrollY() > max) {
                scrollTo(getScrollX(), max);
            } else if (getScrollY() < 0) {
                scrollTo(getScrollX(), 0);
            }
        }
        scrollTo(getScrollX(), getScrollY());
        this.f1045h = true;
    }

    protected void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        if (this.f1049l && MeasureSpec.getMode(i2) != 0 && getChildCount() > 0) {
            View childAt = getChildAt(0);
            int measuredHeight = getMeasuredHeight();
            if (childAt.getMeasuredHeight() < measuredHeight) {
                childAt.measure(getChildMeasureSpec(i, getPaddingLeft() + getPaddingRight(), ((FrameLayout.LayoutParams) childAt.getLayoutParams()).width), MeasureSpec.makeMeasureSpec((measuredHeight - getPaddingTop()) - getPaddingBottom(), 1073741824));
            }
        }
    }

    public boolean onNestedFling(View view, float f, float f2, boolean z) {
        if (z) {
            return false;
        }
        m1734h((int) f2);
        return true;
    }

    public boolean onNestedPreFling(View view, float f, float f2) {
        return dispatchNestedPreFling(f, f2);
    }

    public void onNestedPreScroll(View view, int i, int i2, int[] iArr) {
        dispatchNestedPreScroll(i, i2, iArr, null);
    }

    public void onNestedScroll(View view, int i, int i2, int i3, int i4) {
        int scrollY = getScrollY();
        scrollBy(0, i4);
        int scrollY2 = getScrollY() - scrollY;
        dispatchNestedScroll(0, scrollY2, 0, i4 - scrollY2, null);
    }

    public void onNestedScrollAccepted(View view, View view2, int i) {
        this.f1060y.m1325a(view, view2, i);
        startNestedScroll(2);
    }

    protected void onOverScrolled(int i, int i2, boolean z, boolean z2) {
        super.scrollTo(i, i2);
    }

    protected boolean onRequestFocusInDescendants(int i, Rect rect) {
        if (i == 2) {
            i = 130;
        } else if (i == 1) {
            i = 33;
        }
        View findNextFocus = rect == null ? FocusFinder.getInstance().findNextFocus(this, null, i) : FocusFinder.getInstance().findNextFocusFromRect(this, rect, i);
        return (findNextFocus == null || m1721a(findNextFocus)) ? false : findNextFocus.requestFocus(i, rect);
    }

    protected void onRestoreInstanceState(Parcelable parcelable) {
        if (parcelable instanceof C0371c) {
            C0371c c0371c = (C0371c) parcelable;
            super.onRestoreInstanceState(c0371c.getSuperState());
            this.f1059v = c0371c;
            requestLayout();
            return;
        }
        super.onRestoreInstanceState(parcelable);
    }

    protected Parcelable onSaveInstanceState() {
        Parcelable c0371c = new C0371c(super.onSaveInstanceState());
        c0371c.f1033a = getScrollY();
        return c0371c;
    }

    protected void onScrollChanged(int i, int i2, int i3, int i4) {
        super.onScrollChanged(i, i2, i3, i4);
        if (this.f1037B != null) {
            this.f1037B.mo259a(this, i, i2, i3, i4);
        }
    }

    protected void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        View findFocus = findFocus();
        if (findFocus != null && this != findFocus && m1722a(findFocus, 0, i4)) {
            findFocus.getDrawingRect(this.f1039b);
            offsetDescendantRectToMyCoords(findFocus, this.f1039b);
            m1733g(m1735a(this.f1039b));
        }
    }

    public boolean onStartNestedScroll(View view, View view2, int i) {
        return (i & 2) != 0;
    }

    public void onStopNestedScroll(View view) {
        this.f1060y.m1323a(view);
        stopNestedScroll();
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        m1728d();
        MotionEvent obtain = MotionEvent.obtain(motionEvent);
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0) {
            this.f1057t = 0;
        }
        obtain.offsetLocation(0.0f, (float) this.f1057t);
        ViewParent parent;
        switch (actionMasked) {
            case 0:
                if (getChildCount() != 0) {
                    boolean z = !this.f1040c.isFinished();
                    this.f1047j = z;
                    if (z) {
                        parent = getParent();
                        if (parent != null) {
                            parent.requestDisallowInterceptTouchEvent(true);
                        }
                    }
                    if (!this.f1040c.isFinished()) {
                        this.f1040c.abortAnimation();
                    }
                    this.f1043f = (int) motionEvent.getY();
                    this.f1054q = motionEvent.getPointerId(0);
                    m1737a(2, 0);
                    break;
                }
                return false;
            case 1:
                VelocityTracker velocityTracker = this.f1048k;
                velocityTracker.computeCurrentVelocity(1000, (float) this.f1053p);
                actionMasked = (int) velocityTracker.getYVelocity(this.f1054q);
                if (Math.abs(actionMasked) > this.f1052o) {
                    m1734h(-actionMasked);
                } else if (this.f1040c.springBack(getScrollX(), getScrollY(), 0, 0, 0, getScrollRange())) {
                    C0315p.m1377a(this);
                }
                this.f1054q = -1;
                m1731f();
                break;
            case 2:
                int findPointerIndex = motionEvent.findPointerIndex(this.f1054q);
                if (findPointerIndex != -1) {
                    int y = (int) motionEvent.getY(findPointerIndex);
                    int i = this.f1043f - y;
                    if (m1740a(0, i, this.f1056s, this.f1055r, 0)) {
                        i -= this.f1056s[1];
                        obtain.offsetLocation(0.0f, (float) this.f1055r[1]);
                        this.f1057t += this.f1055r[1];
                    }
                    if (!this.f1047j && Math.abs(i) > this.f1051n) {
                        parent = getParent();
                        if (parent != null) {
                            parent.requestDisallowInterceptTouchEvent(true);
                        }
                        this.f1047j = true;
                        i = i > 0 ? i - this.f1051n : i + this.f1051n;
                    }
                    if (this.f1047j) {
                        this.f1043f = y - this.f1055r[1];
                        int scrollY = getScrollY();
                        y = getScrollRange();
                        actionMasked = getOverScrollMode();
                        Object obj = (actionMasked == 0 || (actionMasked == 1 && y > 0)) ? 1 : null;
                        if (m1738a(0, i, 0, getScrollY(), 0, y, 0, 0, true) && !m1743b(0)) {
                            this.f1048k.clear();
                        }
                        int scrollY2 = getScrollY() - scrollY;
                        if (!m1739a(0, scrollY2, 0, i - scrollY2, this.f1055r, 0)) {
                            if (obj != null) {
                                m1732g();
                                actionMasked = scrollY + i;
                                if (actionMasked < 0) {
                                    C0386e.m1810a(this.f1041d, ((float) i) / ((float) getHeight()), motionEvent.getX(findPointerIndex) / ((float) getWidth()));
                                    if (!this.f1042e.isFinished()) {
                                        this.f1042e.onRelease();
                                    }
                                } else if (actionMasked > y) {
                                    C0386e.m1810a(this.f1042e, ((float) i) / ((float) getHeight()), 1.0f - (motionEvent.getX(findPointerIndex) / ((float) getWidth())));
                                    if (!this.f1041d.isFinished()) {
                                        this.f1041d.onRelease();
                                    }
                                }
                                if (!(this.f1041d == null || (this.f1041d.isFinished() && this.f1042e.isFinished()))) {
                                    C0315p.m1377a(this);
                                    break;
                                }
                            }
                        }
                        this.f1043f -= this.f1055r[1];
                        obtain.offsetLocation(0.0f, (float) this.f1055r[1]);
                        this.f1057t += this.f1055r[1];
                        break;
                    }
                }
                Log.e("NestedScrollView", "Invalid pointerId=" + this.f1054q + " in onTouchEvent");
                break;
                break;
            case 3:
                if (this.f1047j && getChildCount() > 0 && this.f1040c.springBack(getScrollX(), getScrollY(), 0, 0, 0, getScrollRange())) {
                    C0315p.m1377a(this);
                }
                this.f1054q = -1;
                m1731f();
                break;
            case 5:
                actionMasked = motionEvent.getActionIndex();
                this.f1043f = (int) motionEvent.getY(actionMasked);
                this.f1054q = motionEvent.getPointerId(actionMasked);
                break;
            case 6:
                m1718a(motionEvent);
                this.f1043f = (int) motionEvent.getY(motionEvent.findPointerIndex(this.f1054q));
                break;
        }
        if (this.f1048k != null) {
            this.f1048k.addMovement(obtain);
        }
        obtain.recycle();
        return true;
    }

    public void requestChildFocus(View view, View view2) {
        if (this.f1044g) {
            this.f1046i = view2;
        } else {
            m1725b(view2);
        }
        super.requestChildFocus(view, view2);
    }

    public boolean requestChildRectangleOnScreen(View view, Rect rect, boolean z) {
        rect.offset(view.getLeft() - view.getScrollX(), view.getTop() - view.getScrollY());
        return m1720a(rect, z);
    }

    public void requestDisallowInterceptTouchEvent(boolean z) {
        if (z) {
            m1730e();
        }
        super.requestDisallowInterceptTouchEvent(z);
    }

    public void requestLayout() {
        this.f1044g = true;
        super.requestLayout();
    }

    public void scrollTo(int i, int i2) {
        if (getChildCount() > 0) {
            View childAt = getChildAt(0);
            int b = m1724b(i, (getWidth() - getPaddingRight()) - getPaddingLeft(), childAt.getWidth());
            int b2 = m1724b(i2, (getHeight() - getPaddingBottom()) - getPaddingTop(), childAt.getHeight());
            if (b != getScrollX() || b2 != getScrollY()) {
                super.scrollTo(b, b2);
            }
        }
    }

    public void setFillViewport(boolean z) {
        if (z != this.f1049l) {
            this.f1049l = z;
            requestLayout();
        }
    }

    public void setNestedScrollingEnabled(boolean z) {
        this.f1061z.m1303a(z);
    }

    public void setOnScrollChangeListener(C0369b c0369b) {
        this.f1037B = c0369b;
    }

    public void setSmoothScrollingEnabled(boolean z) {
        this.f1050m = z;
    }

    public boolean shouldDelayChildPressedState() {
        return true;
    }

    public boolean startNestedScroll(int i) {
        return this.f1061z.m1314b(i);
    }

    public void stopNestedScroll() {
        this.f1061z.m1315c();
    }
}
