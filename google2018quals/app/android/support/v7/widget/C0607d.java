package android.support.v7.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.support.v4.p005c.p006a.C0179a;
import android.support.v4.p017h.C0286c;
import android.support.v4.p017h.C0286c.C0284a;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.p020a.C0411a.C0407g;
import android.support.v7.view.C0488a;
import android.support.v7.view.menu.ActionMenuItemView;
import android.support.v7.view.menu.ActionMenuItemView.C0500b;
import android.support.v7.view.menu.C0504p;
import android.support.v7.view.menu.C0504p.C0501a;
import android.support.v7.view.menu.C0506o.C0459a;
import android.support.v7.view.menu.C0507b;
import android.support.v7.view.menu.C0515s;
import android.support.v7.view.menu.C0521h;
import android.support.v7.view.menu.C0524j;
import android.support.v7.view.menu.C0533n;
import android.support.v7.view.menu.C0539u;
import android.support.v7.widget.ActionMenuView.C0502a;
import android.util.SparseBooleanArray;
import android.view.MenuItem;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import java.util.ArrayList;

class C0607d extends C0507b implements C0284a {
    private C0600b f2191A;
    C0604d f2192g;
    C0605e f2193h;
    C0599a f2194i;
    C0601c f2195j;
    final C0606f f2196k = new C0606f(this);
    int f2197l;
    private Drawable f2198m;
    private boolean f2199n;
    private boolean f2200o;
    private boolean f2201p;
    private int f2202q;
    private int f2203r;
    private int f2204s;
    private boolean f2205t;
    private boolean f2206u;
    private boolean f2207v;
    private boolean f2208w;
    private int f2209x;
    private final SparseBooleanArray f2210y = new SparseBooleanArray();
    private View f2211z;

    private class C0599a extends C0533n {
        final /* synthetic */ C0607d f2179a;

        public C0599a(C0607d c0607d, Context context, C0539u c0539u, View view) {
            this.f2179a = c0607d;
            super(context, c0539u, view, false, C0401a.actionOverflowMenuStyle);
            if (!((C0524j) c0539u.getItem()).m2508j()) {
                m2532a(c0607d.f2192g == null ? (View) c0607d.f : c0607d.f2192g);
            }
            m2531a(c0607d.f2196k);
        }

        protected void mo528e() {
            this.f2179a.f2194i = null;
            this.f2179a.f2197l = 0;
            super.mo528e();
        }
    }

    private class C0600b extends C0500b {
        final /* synthetic */ C0607d f2180a;

        C0600b(C0607d c0607d) {
            this.f2180a = c0607d;
        }

        public C0515s mo529a() {
            return this.f2180a.f2194i != null ? this.f2180a.f2194i.m2536b() : null;
        }
    }

    private class C0601c implements Runnable {
        final /* synthetic */ C0607d f2181a;
        private C0605e f2182b;

        public C0601c(C0607d c0607d, C0605e c0605e) {
            this.f2181a = c0607d;
            this.f2182b = c0605e;
        }

        public void run() {
            if (this.f2181a.c != null) {
                this.f2181a.c.m2466f();
            }
            View view = (View) this.f2181a.f;
            if (!(view == null || view.getWindowToken() == null || !this.f2182b.m2537c())) {
                this.f2181a.f2193h = this.f2182b;
            }
            this.f2181a.f2195j = null;
        }
    }

    private class C0604d extends C0603p implements C0502a {
        final /* synthetic */ C0607d f2187a;
        private final float[] f2188b = new float[2];

        public C0604d(final C0607d c0607d, Context context) {
            this.f2187a = c0607d;
            super(context, null, C0401a.actionOverflowButtonStyle);
            setClickable(true);
            setFocusable(true);
            setVisibility(0);
            setEnabled(true);
            ay.m3021a(this, getContentDescription());
            setOnTouchListener(new ah(this, this) {
                final /* synthetic */ C0604d f2184b;

                public C0515s mo366a() {
                    return this.f2184b.f2187a.f2193h == null ? null : this.f2184b.f2187a.f2193h.m2536b();
                }

                public boolean mo367b() {
                    this.f2184b.f2187a.m3071d();
                    return true;
                }

                public boolean mo530c() {
                    if (this.f2184b.f2187a.f2195j != null) {
                        return false;
                    }
                    this.f2184b.f2187a.m3072e();
                    return true;
                }
            });
        }

        public boolean mo374c() {
            return false;
        }

        public boolean mo375d() {
            return false;
        }

        public boolean performClick() {
            if (!super.performClick()) {
                playSoundEffect(0);
                this.f2187a.m3071d();
            }
            return true;
        }

        protected boolean setFrame(int i, int i2, int i3, int i4) {
            boolean frame = super.setFrame(i, i2, i3, i4);
            Drawable drawable = getDrawable();
            Drawable background = getBackground();
            if (!(drawable == null || background == null)) {
                int width = getWidth();
                int height = getHeight();
                int max = Math.max(width, height) / 2;
                width = (width + (getPaddingLeft() - getPaddingRight())) / 2;
                height = (height + (getPaddingTop() - getPaddingBottom())) / 2;
                C0179a.m932a(background, width - max, height - max, width + max, height + max);
            }
            return frame;
        }
    }

    private class C0605e extends C0533n {
        final /* synthetic */ C0607d f2189a;

        public C0605e(C0607d c0607d, Context context, C0521h c0521h, View view, boolean z) {
            this.f2189a = c0607d;
            super(context, c0521h, view, z, C0401a.actionOverflowMenuStyle);
            m2530a(8388613);
            m2531a(c0607d.f2196k);
        }

        protected void mo528e() {
            if (this.f2189a.c != null) {
                this.f2189a.c.close();
            }
            this.f2189a.f2193h = null;
            super.mo528e();
        }
    }

    private class C0606f implements C0459a {
        final /* synthetic */ C0607d f2190a;

        C0606f(C0607d c0607d) {
            this.f2190a = c0607d;
        }

        public void mo321a(C0521h c0521h, boolean z) {
            if (c0521h instanceof C0539u) {
                c0521h.mo444p().m2447a(false);
            }
            C0459a a = this.f2190a.m2332a();
            if (a != null) {
                a.mo321a(c0521h, z);
            }
        }

        public boolean mo322a(C0521h c0521h) {
            if (c0521h == null) {
                return false;
            }
            this.f2190a.f2197l = ((C0539u) c0521h).getItem().getItemId();
            C0459a a = this.f2190a.m2332a();
            return a != null ? a.mo322a(c0521h) : false;
        }
    }

    public C0607d(Context context) {
        super(context, C0407g.abc_action_menu_layout, C0407g.abc_action_menu_item_layout);
    }

    private View m3048a(MenuItem menuItem) {
        ViewGroup viewGroup = (ViewGroup) this.f;
        if (viewGroup == null) {
            return null;
        }
        int childCount = viewGroup.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = viewGroup.getChildAt(i);
            if ((childAt instanceof C0501a) && ((C0501a) childAt).getItemData() == menuItem) {
                return childAt;
            }
        }
        return null;
    }

    public C0504p mo535a(ViewGroup viewGroup) {
        C0504p c0504p = this.f;
        C0504p a = super.mo535a(viewGroup);
        if (c0504p != a) {
            ((ActionMenuView) a).setPresenter(this);
        }
        return a;
    }

    public View mo536a(C0524j c0524j, View view, ViewGroup viewGroup) {
        View actionView = c0524j.getActionView();
        if (actionView == null || c0524j.m2512n()) {
            actionView = super.mo536a(c0524j, view, viewGroup);
        }
        actionView.setVisibility(c0524j.isActionViewExpanded() ? 8 : 0);
        ActionMenuView actionMenuView = (ActionMenuView) viewGroup;
        LayoutParams layoutParams = actionView.getLayoutParams();
        if (!actionMenuView.checkLayoutParams(layoutParams)) {
            actionView.setLayoutParams(actionMenuView.m2651a(layoutParams));
        }
        return actionView;
    }

    public void mo402a(Context context, C0521h c0521h) {
        super.mo402a(context, c0521h);
        Resources resources = context.getResources();
        C0488a a = C0488a.m2223a(context);
        if (!this.f2201p) {
            this.f2200o = a.m2225b();
        }
        if (!this.f2207v) {
            this.f2202q = a.m2226c();
        }
        if (!this.f2205t) {
            this.f2204s = a.m2224a();
        }
        int i = this.f2202q;
        if (this.f2200o) {
            if (this.f2192g == null) {
                this.f2192g = new C0604d(this, this.a);
                if (this.f2199n) {
                    this.f2192g.setImageDrawable(this.f2198m);
                    this.f2198m = null;
                    this.f2199n = false;
                }
                int makeMeasureSpec = MeasureSpec.makeMeasureSpec(0, 0);
                this.f2192g.measure(makeMeasureSpec, makeMeasureSpec);
            }
            i -= this.f2192g.getMeasuredWidth();
        } else {
            this.f2192g = null;
        }
        this.f2203r = i;
        this.f2209x = (int) (56.0f * resources.getDisplayMetrics().density);
        this.f2211z = null;
    }

    public void m3057a(Configuration configuration) {
        if (!this.f2205t) {
            this.f2204s = C0488a.m2223a(this.b).m2224a();
        }
        if (this.c != null) {
            this.c.m2455b(true);
        }
    }

    public void m3058a(Drawable drawable) {
        if (this.f2192g != null) {
            this.f2192g.setImageDrawable(drawable);
            return;
        }
        this.f2199n = true;
        this.f2198m = drawable;
    }

    public void mo403a(C0521h c0521h, boolean z) {
        m3073f();
        super.mo403a(c0521h, z);
    }

    public void mo537a(C0524j c0524j, C0501a c0501a) {
        c0501a.mo372a(c0524j, 0);
        ActionMenuItemView actionMenuItemView = (ActionMenuItemView) c0501a;
        actionMenuItemView.setItemInvoker((ActionMenuView) this.f);
        if (this.f2191A == null) {
            this.f2191A = new C0600b(this);
        }
        actionMenuItemView.setPopupCallback(this.f2191A);
    }

    public void m3061a(ActionMenuView actionMenuView) {
        this.f = actionMenuView;
        actionMenuView.mo377a(this.c);
    }

    public void mo538a(boolean z) {
        if (z) {
            super.mo406a(null);
        } else if (this.c != null) {
            this.c.m2447a(false);
        }
    }

    public boolean mo539a(int i, C0524j c0524j) {
        return c0524j.m2508j();
    }

    public boolean mo406a(C0539u c0539u) {
        if (!c0539u.hasVisibleItems()) {
            return false;
        }
        C0539u c0539u2 = c0539u;
        while (c0539u2.m2573s() != this.c) {
            c0539u2 = (C0539u) c0539u2.m2573s();
        }
        View a = m3048a(c0539u2.getItem());
        if (a == null) {
            return false;
        }
        boolean z;
        this.f2197l = c0539u.getItem().getItemId();
        int size = c0539u.size();
        for (int i = 0; i < size; i++) {
            MenuItem item = c0539u.getItem(i);
            if (item.isVisible() && item.getIcon() != null) {
                z = true;
                break;
            }
        }
        z = false;
        this.f2194i = new C0599a(this, this.b, c0539u, a);
        this.f2194i.m2534a(z);
        this.f2194i.m2529a();
        super.mo406a(c0539u);
        return true;
    }

    public boolean mo540a(ViewGroup viewGroup, int i) {
        return viewGroup.getChildAt(i) == this.f2192g ? false : super.mo540a(viewGroup, i);
    }

    public void mo407b(boolean z) {
        int i;
        int i2 = 1;
        int i3 = 0;
        super.mo407b(z);
        ((View) this.f).requestLayout();
        if (this.c != null) {
            ArrayList k = this.c.m2471k();
            int size = k.size();
            for (i = 0; i < size; i++) {
                C0286c a = ((C0524j) k.get(i)).mo381a();
                if (a != null) {
                    a.m1260a((C0284a) this);
                }
            }
        }
        ArrayList l = this.c != null ? this.c.m2472l() : null;
        if (this.f2200o && l != null) {
            i = l.size();
            if (i == 1) {
                i3 = !((C0524j) l.get(0)).isActionViewExpanded() ? 1 : 0;
            } else {
                if (i <= 0) {
                    i2 = 0;
                }
                i3 = i2;
            }
        }
        if (i3 != 0) {
            if (this.f2192g == null) {
                this.f2192g = new C0604d(this, this.a);
            }
            ViewGroup viewGroup = (ViewGroup) this.f2192g.getParent();
            if (viewGroup != this.f) {
                if (viewGroup != null) {
                    viewGroup.removeView(this.f2192g);
                }
                ActionMenuView actionMenuView = (ActionMenuView) this.f;
                actionMenuView.addView(this.f2192g, actionMenuView.m2660c());
            }
        } else if (this.f2192g != null && this.f2192g.getParent() == this.f) {
            ((ViewGroup) this.f).removeView(this.f2192g);
        }
        ((ActionMenuView) this.f).setOverflowReserved(this.f2200o);
    }

    public boolean mo408b() {
        int size;
        ArrayList arrayList;
        int i;
        if (this.c != null) {
            ArrayList i2 = this.c.m2469i();
            size = i2.size();
            arrayList = i2;
        } else {
            size = 0;
            arrayList = null;
        }
        int i3 = this.f2204s;
        int i4 = this.f2203r;
        int makeMeasureSpec = MeasureSpec.makeMeasureSpec(0, 0);
        ViewGroup viewGroup = (ViewGroup) this.f;
        int i5 = 0;
        int i6 = 0;
        Object obj = null;
        int i7 = 0;
        while (i7 < size) {
            C0524j c0524j = (C0524j) arrayList.get(i7);
            if (c0524j.m2510l()) {
                i5++;
            } else if (c0524j.m2509k()) {
                i6++;
            } else {
                obj = 1;
            }
            i = (this.f2208w && c0524j.isActionViewExpanded()) ? 0 : i3;
            i7++;
            i3 = i;
        }
        if (this.f2200o && (r4 != null || i5 + i6 > i3)) {
            i3--;
        }
        i7 = i3 - i5;
        SparseBooleanArray sparseBooleanArray = this.f2210y;
        sparseBooleanArray.clear();
        i = 0;
        if (this.f2206u) {
            i = i4 / this.f2209x;
            i6 = ((i4 % this.f2209x) / i) + this.f2209x;
        } else {
            i6 = 0;
        }
        int i8 = 0;
        i3 = 0;
        int i9 = i;
        while (i8 < size) {
            c0524j = (C0524j) arrayList.get(i8);
            int i10;
            if (c0524j.m2510l()) {
                View a = mo536a(c0524j, this.f2211z, viewGroup);
                if (this.f2211z == null) {
                    this.f2211z = a;
                }
                if (this.f2206u) {
                    i9 -= ActionMenuView.m2648a(a, i6, i9, makeMeasureSpec, 0);
                } else {
                    a.measure(makeMeasureSpec, makeMeasureSpec);
                }
                i5 = a.getMeasuredWidth();
                i10 = i4 - i5;
                if (i3 != 0) {
                    i5 = i3;
                }
                i3 = c0524j.getGroupId();
                if (i3 != 0) {
                    sparseBooleanArray.put(i3, true);
                }
                c0524j.m2501d(true);
                i = i10;
                i3 = i7;
            } else if (c0524j.m2509k()) {
                boolean z;
                int groupId = c0524j.getGroupId();
                boolean z2 = sparseBooleanArray.get(groupId);
                boolean z3 = (i7 > 0 || z2) && i4 > 0 && (!this.f2206u || i9 > 0);
                if (z3) {
                    View a2 = mo536a(c0524j, this.f2211z, viewGroup);
                    if (this.f2211z == null) {
                        this.f2211z = a2;
                    }
                    boolean z4;
                    if (this.f2206u) {
                        int a3 = ActionMenuView.m2648a(a2, i6, i9, makeMeasureSpec, 0);
                        i10 = i9 - a3;
                        if (a3 == 0) {
                            i9 = 0;
                        } else {
                            z4 = z3;
                        }
                        i5 = i10;
                    } else {
                        a2.measure(makeMeasureSpec, makeMeasureSpec);
                        boolean z5 = z3;
                        i5 = i9;
                        z4 = z5;
                    }
                    i10 = a2.getMeasuredWidth();
                    i4 -= i10;
                    if (i3 == 0) {
                        i3 = i10;
                    }
                    if (this.f2206u) {
                        z = i9 & (i4 >= 0 ? 1 : 0);
                        i10 = i3;
                        i3 = i5;
                    } else {
                        z = i9 & (i4 + i3 > 0 ? 1 : 0);
                        i10 = i3;
                        i3 = i5;
                    }
                } else {
                    z = z3;
                    i10 = i3;
                    i3 = i9;
                }
                if (z && groupId != 0) {
                    sparseBooleanArray.put(groupId, true);
                    i9 = i7;
                } else if (z2) {
                    sparseBooleanArray.put(groupId, false);
                    i5 = i7;
                    for (i7 = 0; i7 < i8; i7++) {
                        C0524j c0524j2 = (C0524j) arrayList.get(i7);
                        if (c0524j2.getGroupId() == groupId) {
                            if (c0524j2.m2508j()) {
                                i5++;
                            }
                            c0524j2.m2501d(false);
                        }
                    }
                    i9 = i5;
                } else {
                    i9 = i7;
                }
                if (z) {
                    i9--;
                }
                c0524j.m2501d(z);
                i5 = i10;
                i = i4;
                int i11 = i3;
                i3 = i9;
                i9 = i11;
            } else {
                c0524j.m2501d(false);
                i5 = i3;
                i = i4;
                i3 = i7;
            }
            i8++;
            i4 = i;
            i7 = i3;
            i3 = i5;
        }
        return true;
    }

    public Drawable m3068c() {
        return this.f2192g != null ? this.f2192g.getDrawable() : this.f2199n ? this.f2198m : null;
    }

    public void m3069c(boolean z) {
        this.f2200o = z;
        this.f2201p = true;
    }

    public void m3070d(boolean z) {
        this.f2208w = z;
    }

    public boolean m3071d() {
        if (!this.f2200o || m3075h() || this.c == null || this.f == null || this.f2195j != null || this.c.m2472l().isEmpty()) {
            return false;
        }
        this.f2195j = new C0601c(this, new C0605e(this, this.b, this.c, this.f2192g, true));
        ((View) this.f).post(this.f2195j);
        super.mo406a(null);
        return true;
    }

    public boolean m3072e() {
        if (this.f2195j == null || this.f == null) {
            C0533n c0533n = this.f2193h;
            if (c0533n == null) {
                return false;
            }
            c0533n.m2538d();
            return true;
        }
        ((View) this.f).removeCallbacks(this.f2195j);
        this.f2195j = null;
        return true;
    }

    public boolean m3073f() {
        return m3072e() | m3074g();
    }

    public boolean m3074g() {
        if (this.f2194i == null) {
            return false;
        }
        this.f2194i.m2538d();
        return true;
    }

    public boolean m3075h() {
        return this.f2193h != null && this.f2193h.m2540f();
    }

    public boolean m3076i() {
        return this.f2195j != null || m3075h();
    }
}
