package android.support.v7.widget;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.support.v4.p017h.C0299k;
import android.support.v4.p017h.C0301m;
import android.support.v4.p017h.C0315p;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.p020a.C0411a.C0406f;
import android.support.v7.p020a.C0411a.C0410j;
import android.support.v7.view.menu.C0506o.C0459a;
import android.util.AttributeSet;
import android.view.Menu;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.ViewPropertyAnimator;
import android.view.Window.Callback;
import android.widget.OverScroller;

public class ActionBarOverlayLayout extends ViewGroup implements C0299k, ac {
    static final int[] f1772e = new int[]{C0401a.actionBarSize, 16842841};
    private final Runnable f1773A;
    private final Runnable f1774B;
    private final C0301m f1775C;
    ActionBarContainer f1776a;
    boolean f1777b;
    ViewPropertyAnimator f1778c;
    final AnimatorListenerAdapter f1779d;
    private int f1780f;
    private int f1781g;
    private ContentFrameLayout f1782h;
    private ad f1783i;
    private Drawable f1784j;
    private boolean f1785k;
    private boolean f1786l;
    private boolean f1787m;
    private boolean f1788n;
    private int f1789o;
    private int f1790p;
    private final Rect f1791q;
    private final Rect f1792r;
    private final Rect f1793s;
    private final Rect f1794t;
    private final Rect f1795u;
    private final Rect f1796v;
    private final Rect f1797w;
    private C0481a f1798x;
    private final int f1799y;
    private OverScroller f1800z;

    public interface C0481a {
        void mo359a(int i);

        void mo361g(boolean z);

        void mo362j();

        void mo363k();

        void mo364l();

        void mo365m();
    }

    class C05431 extends AnimatorListenerAdapter {
        final /* synthetic */ ActionBarOverlayLayout f1769a;

        C05431(ActionBarOverlayLayout actionBarOverlayLayout) {
            this.f1769a = actionBarOverlayLayout;
        }

        public void onAnimationCancel(Animator animator) {
            this.f1769a.f1778c = null;
            this.f1769a.f1777b = false;
        }

        public void onAnimationEnd(Animator animator) {
            this.f1769a.f1778c = null;
            this.f1769a.f1777b = false;
        }
    }

    class C05442 implements Runnable {
        final /* synthetic */ ActionBarOverlayLayout f1770a;

        C05442(ActionBarOverlayLayout actionBarOverlayLayout) {
            this.f1770a = actionBarOverlayLayout;
        }

        public void run() {
            this.f1770a.m2614d();
            this.f1770a.f1778c = this.f1770a.f1776a.animate().translationY(0.0f).setListener(this.f1770a.f1779d);
        }
    }

    class C05453 implements Runnable {
        final /* synthetic */ ActionBarOverlayLayout f1771a;

        C05453(ActionBarOverlayLayout actionBarOverlayLayout) {
            this.f1771a = actionBarOverlayLayout;
        }

        public void run() {
            this.f1771a.m2614d();
            this.f1771a.f1778c = this.f1771a.f1776a.animate().translationY((float) (-this.f1771a.f1776a.getHeight())).setListener(this.f1771a.f1779d);
        }
    }

    public static class C0546b extends MarginLayoutParams {
        public C0546b(int i, int i2) {
            super(i, i2);
        }

        public C0546b(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
        }

        public C0546b(LayoutParams layoutParams) {
            super(layoutParams);
        }
    }

    public ActionBarOverlayLayout(Context context) {
        this(context, null);
    }

    public ActionBarOverlayLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f1781g = 0;
        this.f1791q = new Rect();
        this.f1792r = new Rect();
        this.f1793s = new Rect();
        this.f1794t = new Rect();
        this.f1795u = new Rect();
        this.f1796v = new Rect();
        this.f1797w = new Rect();
        this.f1799y = 600;
        this.f1779d = new C05431(this);
        this.f1773A = new C05442(this);
        this.f1774B = new C05453(this);
        m2601a(context);
        this.f1775C = new C0301m(this);
    }

    private ad m2600a(View view) {
        if (view instanceof ad) {
            return (ad) view;
        }
        if (view instanceof Toolbar) {
            return ((Toolbar) view).getWrapper();
        }
        throw new IllegalStateException("Can't make a decor toolbar out of " + view.getClass().getSimpleName());
    }

    private void m2601a(Context context) {
        boolean z = true;
        TypedArray obtainStyledAttributes = getContext().getTheme().obtainStyledAttributes(f1772e);
        this.f1780f = obtainStyledAttributes.getDimensionPixelSize(0, 0);
        this.f1784j = obtainStyledAttributes.getDrawable(1);
        setWillNotDraw(this.f1784j == null);
        obtainStyledAttributes.recycle();
        if (context.getApplicationInfo().targetSdkVersion >= 19) {
            z = false;
        }
        this.f1785k = z;
        this.f1800z = new OverScroller(context);
    }

    private boolean m2602a(float f, float f2) {
        this.f1800z.fling(0, 0, 0, (int) f2, 0, 0, Integer.MIN_VALUE, Integer.MAX_VALUE);
        return this.f1800z.getFinalY() > this.f1776a.getHeight();
    }

    private boolean m2603a(View view, Rect rect, boolean z, boolean z2, boolean z3, boolean z4) {
        boolean z5 = false;
        C0546b c0546b = (C0546b) view.getLayoutParams();
        if (z && c0546b.leftMargin != rect.left) {
            c0546b.leftMargin = rect.left;
            z5 = true;
        }
        if (z2 && c0546b.topMargin != rect.top) {
            c0546b.topMargin = rect.top;
            z5 = true;
        }
        if (z4 && c0546b.rightMargin != rect.right) {
            c0546b.rightMargin = rect.right;
            z5 = true;
        }
        if (!z3 || c0546b.bottomMargin == rect.bottom) {
            return z5;
        }
        c0546b.bottomMargin = rect.bottom;
        return true;
    }

    private void m2604l() {
        m2614d();
        postDelayed(this.f1773A, 600);
    }

    private void m2605m() {
        m2614d();
        postDelayed(this.f1774B, 600);
    }

    private void m2606n() {
        m2614d();
        this.f1773A.run();
    }

    private void m2607o() {
        m2614d();
        this.f1774B.run();
    }

    public C0546b m2608a(AttributeSet attributeSet) {
        return new C0546b(getContext(), attributeSet);
    }

    public void mo454a(int i) {
        m2613c();
        switch (i) {
            case 2:
                this.f1783i.mo515f();
                return;
            case 5:
                this.f1783i.mo516g();
                return;
            case C0410j.AppCompatTheme_windowActionBar /*109*/:
                setOverlayMode(true);
                return;
            default:
                return;
        }
    }

    public void mo455a(Menu menu, C0459a c0459a) {
        m2613c();
        this.f1783i.mo503a(menu, c0459a);
    }

    public boolean m2611a() {
        return this.f1786l;
    }

    protected C0546b m2612b() {
        return new C0546b(-1, -1);
    }

    void m2613c() {
        if (this.f1782h == null) {
            this.f1782h = (ContentFrameLayout) findViewById(C0406f.action_bar_activity_content);
            this.f1776a = (ActionBarContainer) findViewById(C0406f.action_bar_container);
            this.f1783i = m2600a(findViewById(C0406f.action_bar));
        }
    }

    protected boolean checkLayoutParams(LayoutParams layoutParams) {
        return layoutParams instanceof C0546b;
    }

    void m2614d() {
        removeCallbacks(this.f1773A);
        removeCallbacks(this.f1774B);
        if (this.f1778c != null) {
            this.f1778c.cancel();
        }
    }

    public void draw(Canvas canvas) {
        super.draw(canvas);
        if (this.f1784j != null && !this.f1785k) {
            int bottom = this.f1776a.getVisibility() == 0 ? (int) ((((float) this.f1776a.getBottom()) + this.f1776a.getTranslationY()) + 0.5f) : 0;
            this.f1784j.setBounds(0, bottom, getWidth(), this.f1784j.getIntrinsicHeight() + bottom);
            this.f1784j.draw(canvas);
        }
    }

    public boolean mo456e() {
        m2613c();
        return this.f1783i.mo517h();
    }

    public boolean mo457f() {
        m2613c();
        return this.f1783i.mo518i();
    }

    protected boolean fitSystemWindows(Rect rect) {
        boolean a;
        m2613c();
        if ((C0315p.m1391f(this) & 256) != 0) {
            a = m2603a(this.f1776a, rect, true, true, false, true);
            this.f1794t.set(rect);
            bc.m3034a(this, this.f1794t, this.f1791q);
        } else {
            a = m2603a(this.f1776a, rect, true, true, false, true);
            this.f1794t.set(rect);
            bc.m3034a(this, this.f1794t, this.f1791q);
        }
        if (!this.f1795u.equals(this.f1794t)) {
            this.f1795u.set(this.f1794t);
            a = true;
        }
        if (!this.f1792r.equals(this.f1791q)) {
            this.f1792r.set(this.f1791q);
            a = true;
        }
        if (a) {
            requestLayout();
        }
        return true;
    }

    public boolean mo458g() {
        m2613c();
        return this.f1783i.mo519j();
    }

    protected /* synthetic */ LayoutParams generateDefaultLayoutParams() {
        return m2612b();
    }

    public /* synthetic */ LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return m2608a(attributeSet);
    }

    protected LayoutParams generateLayoutParams(LayoutParams layoutParams) {
        return new C0546b(layoutParams);
    }

    public int getActionBarHideOffset() {
        return this.f1776a != null ? -((int) this.f1776a.getTranslationY()) : 0;
    }

    public int getNestedScrollAxes() {
        return this.f1775C.m1322a();
    }

    public CharSequence getTitle() {
        m2613c();
        return this.f1783i.mo514e();
    }

    public boolean mo459h() {
        m2613c();
        return this.f1783i.mo520k();
    }

    public boolean mo460i() {
        m2613c();
        return this.f1783i.mo521l();
    }

    public void mo461j() {
        m2613c();
        this.f1783i.mo522m();
    }

    public void mo462k() {
        m2613c();
        this.f1783i.mo523n();
    }

    protected void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        m2601a(getContext());
        C0315p.m1392g(this);
    }

    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        m2614d();
    }

    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int childCount = getChildCount();
        int paddingLeft = getPaddingLeft();
        int paddingRight = (i3 - i) - getPaddingRight();
        int paddingTop = getPaddingTop();
        paddingRight = (i4 - i2) - getPaddingBottom();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = getChildAt(i5);
            if (childAt.getVisibility() != 8) {
                C0546b c0546b = (C0546b) childAt.getLayoutParams();
                int i6 = c0546b.leftMargin + paddingLeft;
                paddingRight = c0546b.topMargin + paddingTop;
                childAt.layout(i6, paddingRight, childAt.getMeasuredWidth() + i6, childAt.getMeasuredHeight() + paddingRight);
            }
        }
    }

    protected void onMeasure(int i, int i2) {
        int i3;
        m2613c();
        measureChildWithMargins(this.f1776a, i, 0, i2, 0);
        C0546b c0546b = (C0546b) this.f1776a.getLayoutParams();
        int max = Math.max(0, (this.f1776a.getMeasuredWidth() + c0546b.leftMargin) + c0546b.rightMargin);
        int max2 = Math.max(0, c0546b.bottomMargin + (this.f1776a.getMeasuredHeight() + c0546b.topMargin));
        int combineMeasuredStates = View.combineMeasuredStates(0, this.f1776a.getMeasuredState());
        Object obj = (C0315p.m1391f(this) & 256) != 0 ? 1 : null;
        if (obj != null) {
            i3 = this.f1780f;
            if (this.f1787m && this.f1776a.getTabContainer() != null) {
                i3 += this.f1780f;
            }
        } else {
            i3 = this.f1776a.getVisibility() != 8 ? this.f1776a.getMeasuredHeight() : 0;
        }
        this.f1793s.set(this.f1791q);
        this.f1796v.set(this.f1794t);
        Rect rect;
        Rect rect2;
        if (this.f1786l || obj != null) {
            rect = this.f1796v;
            rect.top = i3 + rect.top;
            rect2 = this.f1796v;
            rect2.bottom += 0;
        } else {
            rect = this.f1793s;
            rect.top = i3 + rect.top;
            rect2 = this.f1793s;
            rect2.bottom += 0;
        }
        m2603a(this.f1782h, this.f1793s, true, true, true, true);
        if (!this.f1797w.equals(this.f1796v)) {
            this.f1797w.set(this.f1796v);
            this.f1782h.m2081a(this.f1796v);
        }
        measureChildWithMargins(this.f1782h, i, 0, i2, 0);
        c0546b = (C0546b) this.f1782h.getLayoutParams();
        int max3 = Math.max(max, (this.f1782h.getMeasuredWidth() + c0546b.leftMargin) + c0546b.rightMargin);
        i3 = Math.max(max2, c0546b.bottomMargin + (this.f1782h.getMeasuredHeight() + c0546b.topMargin));
        int combineMeasuredStates2 = View.combineMeasuredStates(combineMeasuredStates, this.f1782h.getMeasuredState());
        setMeasuredDimension(View.resolveSizeAndState(Math.max(max3 + (getPaddingLeft() + getPaddingRight()), getSuggestedMinimumWidth()), i, combineMeasuredStates2), View.resolveSizeAndState(Math.max(i3 + (getPaddingTop() + getPaddingBottom()), getSuggestedMinimumHeight()), i2, combineMeasuredStates2 << 16));
    }

    public boolean onNestedFling(View view, float f, float f2, boolean z) {
        if (!this.f1788n || !z) {
            return false;
        }
        if (m2602a(f, f2)) {
            m2607o();
        } else {
            m2606n();
        }
        this.f1777b = true;
        return true;
    }

    public boolean onNestedPreFling(View view, float f, float f2) {
        return false;
    }

    public void onNestedPreScroll(View view, int i, int i2, int[] iArr) {
    }

    public void onNestedScroll(View view, int i, int i2, int i3, int i4) {
        this.f1789o += i2;
        setActionBarHideOffset(this.f1789o);
    }

    public void onNestedScrollAccepted(View view, View view2, int i) {
        this.f1775C.m1325a(view, view2, i);
        this.f1789o = getActionBarHideOffset();
        m2614d();
        if (this.f1798x != null) {
            this.f1798x.mo364l();
        }
    }

    public boolean onStartNestedScroll(View view, View view2, int i) {
        return ((i & 2) == 0 || this.f1776a.getVisibility() != 0) ? false : this.f1788n;
    }

    public void onStopNestedScroll(View view) {
        if (this.f1788n && !this.f1777b) {
            if (this.f1789o <= this.f1776a.getHeight()) {
                m2604l();
            } else {
                m2605m();
            }
        }
        if (this.f1798x != null) {
            this.f1798x.mo365m();
        }
    }

    public void onWindowSystemUiVisibilityChanged(int i) {
        boolean z = true;
        if (VERSION.SDK_INT >= 16) {
            super.onWindowSystemUiVisibilityChanged(i);
        }
        m2613c();
        int i2 = this.f1790p ^ i;
        this.f1790p = i;
        boolean z2 = (i & 4) == 0;
        boolean z3 = (i & 256) != 0;
        if (this.f1798x != null) {
            C0481a c0481a = this.f1798x;
            if (z3) {
                z = false;
            }
            c0481a.mo361g(z);
            if (z2 || !z3) {
                this.f1798x.mo362j();
            } else {
                this.f1798x.mo363k();
            }
        }
        if ((i2 & 256) != 0 && this.f1798x != null) {
            C0315p.m1392g(this);
        }
    }

    protected void onWindowVisibilityChanged(int i) {
        super.onWindowVisibilityChanged(i);
        this.f1781g = i;
        if (this.f1798x != null) {
            this.f1798x.mo359a(i);
        }
    }

    public void setActionBarHideOffset(int i) {
        m2614d();
        this.f1776a.setTranslationY((float) (-Math.max(0, Math.min(i, this.f1776a.getHeight()))));
    }

    public void setActionBarVisibilityCallback(C0481a c0481a) {
        this.f1798x = c0481a;
        if (getWindowToken() != null) {
            this.f1798x.mo359a(this.f1781g);
            if (this.f1790p != 0) {
                onWindowSystemUiVisibilityChanged(this.f1790p);
                C0315p.m1392g(this);
            }
        }
    }

    public void setHasNonEmbeddedTabs(boolean z) {
        this.f1787m = z;
    }

    public void setHideOnContentScrollEnabled(boolean z) {
        if (z != this.f1788n) {
            this.f1788n = z;
            if (!z) {
                m2614d();
                setActionBarHideOffset(0);
            }
        }
    }

    public void setIcon(int i) {
        m2613c();
        this.f1783i.mo499a(i);
    }

    public void setIcon(Drawable drawable) {
        m2613c();
        this.f1783i.mo500a(drawable);
    }

    public void setLogo(int i) {
        m2613c();
        this.f1783i.mo508b(i);
    }

    public void setOverlayMode(boolean z) {
        this.f1786l = z;
        boolean z2 = z && getContext().getApplicationInfo().targetSdkVersion < 19;
        this.f1785k = z2;
    }

    public void setShowingForActionMode(boolean z) {
    }

    public void setUiOptions(int i) {
    }

    public void setWindowCallback(Callback callback) {
        m2613c();
        this.f1783i.mo504a(callback);
    }

    public void setWindowTitle(CharSequence charSequence) {
        m2613c();
        this.f1783i.mo505a(charSequence);
    }

    public boolean shouldDelayChildPressedState() {
        return false;
    }
}
