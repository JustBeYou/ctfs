package android.support.v7.app;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.support.v4.p017h.C0315p;
import android.support.v4.p017h.C0322s;
import android.support.v4.p017h.C0324r;
import android.support.v4.p017h.C0325t;
import android.support.v4.p017h.C0326u;
import android.support.v7.app.C0428a.C0426b;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.p020a.C0411a.C0406f;
import android.support.v7.p020a.C0411a.C0410j;
import android.support.v7.view.C0479b;
import android.support.v7.view.C0479b.C0462a;
import android.support.v7.view.C0488a;
import android.support.v7.view.C0496g;
import android.support.v7.view.C0498h;
import android.support.v7.view.menu.C0521h;
import android.support.v7.view.menu.C0521h.C0442a;
import android.support.v7.widget.ActionBarContainer;
import android.support.v7.widget.ActionBarContextView;
import android.support.v7.widget.ActionBarOverlayLayout;
import android.support.v7.widget.ActionBarOverlayLayout.C0481a;
import android.support.v7.widget.Toolbar;
import android.support.v7.widget.ad;
import android.support.v7.widget.ap;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

public class C0482r extends C0428a implements C0481a {
    static final /* synthetic */ boolean f1386s = (!C0482r.class.desiredAssertionStatus());
    private static final Interpolator f1387t = new AccelerateInterpolator();
    private static final Interpolator f1388u = new DecelerateInterpolator();
    private boolean f1389A;
    private boolean f1390B;
    private ArrayList<C0426b> f1391C = new ArrayList();
    private boolean f1392D;
    private int f1393E = 0;
    private boolean f1394F;
    private boolean f1395G = true;
    private boolean f1396H;
    Context f1397a;
    ActionBarOverlayLayout f1398b;
    ActionBarContainer f1399c;
    ad f1400d;
    ActionBarContextView f1401e;
    View f1402f;
    ap f1403g;
    C0480a f1404h;
    C0479b f1405i;
    C0462a f1406j;
    boolean f1407k = true;
    boolean f1408l;
    boolean f1409m;
    C0498h f1410n;
    boolean f1411o;
    final C0322s f1412p = new C04761(this);
    final C0322s f1413q = new C04772(this);
    final C0326u f1414r = new C04783(this);
    private Context f1415v;
    private Activity f1416w;
    private Dialog f1417x;
    private ArrayList<Object> f1418y = new ArrayList();
    private int f1419z = -1;

    class C04761 extends C0325t {
        final /* synthetic */ C0482r f1376a;

        C04761(C0482r c0482r) {
            this.f1376a = c0482r;
        }

        public void mo156b(View view) {
            if (this.f1376a.f1407k && this.f1376a.f1402f != null) {
                this.f1376a.f1402f.setTranslationY(0.0f);
                this.f1376a.f1399c.setTranslationY(0.0f);
            }
            this.f1376a.f1399c.setVisibility(8);
            this.f1376a.f1399c.setTransitioning(false);
            this.f1376a.f1410n = null;
            this.f1376a.m2197h();
            if (this.f1376a.f1398b != null) {
                C0315p.m1392g(this.f1376a.f1398b);
            }
        }
    }

    class C04772 extends C0325t {
        final /* synthetic */ C0482r f1377a;

        C04772(C0482r c0482r) {
            this.f1377a = c0482r;
        }

        public void mo156b(View view) {
            this.f1377a.f1410n = null;
            this.f1377a.f1399c.requestLayout();
        }
    }

    class C04783 implements C0326u {
        final /* synthetic */ C0482r f1378a;

        C04783(C0482r c0482r) {
            this.f1378a = c0482r;
        }

        public void mo343a(View view) {
            ((View) this.f1378a.f1399c.getParent()).invalidate();
        }
    }

    public class C0480a extends C0479b implements C0442a {
        final /* synthetic */ C0482r f1381a;
        private final Context f1382b;
        private final C0521h f1383c;
        private C0462a f1384d;
        private WeakReference<View> f1385e;

        public C0480a(C0482r c0482r, Context context, C0462a c0462a) {
            this.f1381a = c0482r;
            this.f1382b = context;
            this.f1384d = c0462a;
            this.f1383c = new C0521h(context).m2433a(1);
            this.f1383c.mo438a((C0442a) this);
        }

        public MenuInflater mo344a() {
            return new C0496g(this.f1382b);
        }

        public void mo345a(int i) {
            mo351b(this.f1381a.f1397a.getResources().getString(i));
        }

        public void mo297a(C0521h c0521h) {
            if (this.f1384d != null) {
                mo353d();
                this.f1381a.f1401e.mo447a();
            }
        }

        public void mo346a(View view) {
            this.f1381a.f1401e.setCustomView(view);
            this.f1385e = new WeakReference(view);
        }

        public void mo347a(CharSequence charSequence) {
            this.f1381a.f1401e.setSubtitle(charSequence);
        }

        public void mo348a(boolean z) {
            super.mo348a(z);
            this.f1381a.f1401e.setTitleOptional(z);
        }

        public boolean mo301a(C0521h c0521h, MenuItem menuItem) {
            return this.f1384d != null ? this.f1384d.mo325a((C0479b) this, menuItem) : false;
        }

        public Menu mo349b() {
            return this.f1383c;
        }

        public void mo350b(int i) {
            mo347a(this.f1381a.f1397a.getResources().getString(i));
        }

        public void mo351b(CharSequence charSequence) {
            this.f1381a.f1401e.setTitle(charSequence);
        }

        public void mo352c() {
            if (this.f1381a.f1404h == this) {
                if (C0482r.m2173a(this.f1381a.f1408l, this.f1381a.f1409m, false)) {
                    this.f1384d.mo323a(this);
                } else {
                    this.f1381a.f1405i = this;
                    this.f1381a.f1406j = this.f1384d;
                }
                this.f1384d = null;
                this.f1381a.m2202j(false);
                this.f1381a.f1401e.m2588b();
                this.f1381a.f1400d.mo498a().sendAccessibilityEvent(32);
                this.f1381a.f1398b.setHideOnContentScrollEnabled(this.f1381a.f1411o);
                this.f1381a.f1404h = null;
            }
        }

        public void mo353d() {
            if (this.f1381a.f1404h == this) {
                this.f1383c.m2467g();
                try {
                    this.f1384d.mo326b(this, this.f1383c);
                } finally {
                    this.f1383c.m2468h();
                }
            }
        }

        public boolean m2161e() {
            this.f1383c.m2467g();
            try {
                boolean a = this.f1384d.mo324a((C0479b) this, this.f1383c);
                return a;
            } finally {
                this.f1383c.m2468h();
            }
        }

        public CharSequence mo354f() {
            return this.f1381a.f1401e.getTitle();
        }

        public CharSequence mo355g() {
            return this.f1381a.f1401e.getSubtitle();
        }

        public boolean mo356h() {
            return this.f1381a.f1401e.m2590d();
        }

        public View mo357i() {
            return this.f1385e != null ? (View) this.f1385e.get() : null;
        }
    }

    public C0482r(Activity activity, boolean z) {
        this.f1416w = activity;
        View decorView = activity.getWindow().getDecorView();
        m2172a(decorView);
        if (!z) {
            this.f1402f = decorView.findViewById(16908290);
        }
    }

    public C0482r(Dialog dialog) {
        this.f1417x = dialog;
        m2172a(dialog.getWindow().getDecorView());
    }

    private void m2172a(View view) {
        this.f1398b = (ActionBarOverlayLayout) view.findViewById(C0406f.decor_content_parent);
        if (this.f1398b != null) {
            this.f1398b.setActionBarVisibilityCallback(this);
        }
        this.f1400d = m2174b(view.findViewById(C0406f.action_bar));
        this.f1401e = (ActionBarContextView) view.findViewById(C0406f.action_context_bar);
        this.f1399c = (ActionBarContainer) view.findViewById(C0406f.action_bar_container);
        if (this.f1400d == null || this.f1401e == null || this.f1399c == null) {
            throw new IllegalStateException(getClass().getSimpleName() + " can only be used " + "with a compatible window decor layout");
        }
        this.f1397a = this.f1400d.mo507b();
        boolean z = (this.f1400d.mo524o() & 4) != 0;
        if (z) {
            this.f1389A = true;
        }
        C0488a a = C0488a.m2223a(this.f1397a);
        z = a.m2229f() || z;
        mo331a(z);
        m2175k(a.m2227d());
        TypedArray obtainStyledAttributes = this.f1397a.obtainStyledAttributes(null, C0410j.ActionBar, C0401a.actionBarStyle, 0);
        if (obtainStyledAttributes.getBoolean(C0410j.ActionBar_hideOnContentScroll, false)) {
            mo360b(true);
        }
        int dimensionPixelSize = obtainStyledAttributes.getDimensionPixelSize(C0410j.ActionBar_elevation, 0);
        if (dimensionPixelSize != 0) {
            mo328a((float) dimensionPixelSize);
        }
        obtainStyledAttributes.recycle();
    }

    static boolean m2173a(boolean z, boolean z2, boolean z3) {
        return z3 ? true : (z || z2) ? false : true;
    }

    private ad m2174b(View view) {
        if (view instanceof ad) {
            return (ad) view;
        }
        if (view instanceof Toolbar) {
            return ((Toolbar) view).getWrapper();
        }
        throw new IllegalStateException(new StringBuilder().append("Can't make a decor toolbar out of ").append(view).toString() != null ? view.getClass().getSimpleName() : "null");
    }

    private void m2175k(boolean z) {
        boolean z2 = true;
        this.f1392D = z;
        if (this.f1392D) {
            this.f1399c.setTabContainer(null);
            this.f1400d.mo502a(this.f1403g);
        } else {
            this.f1400d.mo502a(null);
            this.f1399c.setTabContainer(this.f1403g);
        }
        boolean z3 = m2199i() == 2;
        if (this.f1403g != null) {
            if (z3) {
                this.f1403g.setVisibility(0);
                if (this.f1398b != null) {
                    C0315p.m1392g(this.f1398b);
                }
            } else {
                this.f1403g.setVisibility(8);
            }
        }
        ad adVar = this.f1400d;
        boolean z4 = !this.f1392D && z3;
        adVar.mo506a(z4);
        ActionBarOverlayLayout actionBarOverlayLayout = this.f1398b;
        if (this.f1392D || !z3) {
            z2 = false;
        }
        actionBarOverlayLayout.setHasNonEmbeddedTabs(z2);
    }

    private void m2176l(boolean z) {
        if (C0482r.m2173a(this.f1408l, this.f1409m, this.f1394F)) {
            if (!this.f1395G) {
                this.f1395G = true;
                m2198h(z);
            }
        } else if (this.f1395G) {
            this.f1395G = false;
            m2200i(z);
        }
    }

    private void m2177n() {
        if (!this.f1394F) {
            this.f1394F = true;
            if (this.f1398b != null) {
                this.f1398b.setShowingForActionMode(true);
            }
            m2176l(false);
        }
    }

    private void m2178o() {
        if (this.f1394F) {
            this.f1394F = false;
            if (this.f1398b != null) {
                this.f1398b.setShowingForActionMode(false);
            }
            m2176l(false);
        }
    }

    private boolean m2179p() {
        return C0315p.m1397l(this.f1399c);
    }

    public int mo327a() {
        return this.f1400d.mo524o();
    }

    public C0479b mo358a(C0462a c0462a) {
        if (this.f1404h != null) {
            this.f1404h.mo352c();
        }
        this.f1398b.setHideOnContentScrollEnabled(false);
        this.f1401e.m2589c();
        C0479b c0480a = new C0480a(this, this.f1401e.getContext(), c0462a);
        if (!c0480a.m2161e()) {
            return null;
        }
        this.f1404h = c0480a;
        c0480a.mo353d();
        this.f1401e.m2586a(c0480a);
        m2202j(true);
        this.f1401e.sendAccessibilityEvent(32);
        return c0480a;
    }

    public void mo328a(float f) {
        C0315p.m1378a(this.f1399c, f);
    }

    public void mo359a(int i) {
        this.f1393E = i;
    }

    public void m2184a(int i, int i2) {
        int o = this.f1400d.mo524o();
        if ((i2 & 4) != 0) {
            this.f1389A = true;
        }
        this.f1400d.mo510c((o & (i2 ^ -1)) | (i & i2));
    }

    public void mo329a(Configuration configuration) {
        m2175k(C0488a.m2223a(this.f1397a).m2227d());
    }

    public void mo330a(CharSequence charSequence) {
        this.f1400d.mo505a(charSequence);
    }

    public void mo331a(boolean z) {
        this.f1400d.mo509b(z);
    }

    public boolean mo332a(int i, KeyEvent keyEvent) {
        if (this.f1404h == null) {
            return false;
        }
        Menu b = this.f1404h.mo349b();
        if (b == null) {
            return false;
        }
        b.setQwertyMode(KeyCharacterMap.load(keyEvent != null ? keyEvent.getDeviceId() : -1).getKeyboardType() != 1);
        return b.performShortcut(i, keyEvent, 0);
    }

    public Context mo334b() {
        if (this.f1415v == null) {
            TypedValue typedValue = new TypedValue();
            this.f1397a.getTheme().resolveAttribute(C0401a.actionBarWidgetTheme, typedValue, true);
            int i = typedValue.resourceId;
            if (i != 0) {
                this.f1415v = new ContextThemeWrapper(this.f1397a, i);
            } else {
                this.f1415v = this.f1397a;
            }
        }
        return this.f1415v;
    }

    public void mo360b(boolean z) {
        if (!z || this.f1398b.m2611a()) {
            this.f1411o = z;
            this.f1398b.setHideOnContentScrollEnabled(z);
            return;
        }
        throw new IllegalStateException("Action bar must be in overlay mode (Window.FEATURE_OVERLAY_ACTION_BAR) to enable hide on content scroll");
    }

    public void mo335c(boolean z) {
        if (!this.f1389A) {
            m2194f(z);
        }
    }

    public void mo337d(boolean z) {
        this.f1396H = z;
        if (!z && this.f1410n != null) {
            this.f1410n.m2281c();
        }
    }

    public void mo339e(boolean z) {
        if (z != this.f1390B) {
            this.f1390B = z;
            int size = this.f1391C.size();
            for (int i = 0; i < size; i++) {
                ((C0426b) this.f1391C.get(i)).m1873a(z);
            }
        }
    }

    public void m2194f(boolean z) {
        m2184a(z ? 4 : 0, 4);
    }

    public boolean mo341f() {
        if (this.f1400d == null || !this.f1400d.mo511c()) {
            return false;
        }
        this.f1400d.mo512d();
        return true;
    }

    public void mo361g(boolean z) {
        this.f1407k = z;
    }

    void m2197h() {
        if (this.f1406j != null) {
            this.f1406j.mo323a(this.f1405i);
            this.f1405i = null;
            this.f1406j = null;
        }
    }

    public void m2198h(boolean z) {
        if (this.f1410n != null) {
            this.f1410n.m2281c();
        }
        this.f1399c.setVisibility(0);
        if (this.f1393E == 0 && (this.f1396H || z)) {
            this.f1399c.setTranslationY(0.0f);
            float f = (float) (-this.f1399c.getHeight());
            if (z) {
                int[] iArr = new int[]{0, 0};
                this.f1399c.getLocationInWindow(iArr);
                f -= (float) iArr[1];
            }
            this.f1399c.setTranslationY(f);
            C0498h c0498h = new C0498h();
            C0324r b = C0315p.m1389d(this.f1399c).m1434b(0.0f);
            b.m1432a(this.f1414r);
            c0498h.m2275a(b);
            if (this.f1407k && this.f1402f != null) {
                this.f1402f.setTranslationY(f);
                c0498h.m2275a(C0315p.m1389d(this.f1402f).m1434b(0.0f));
            }
            c0498h.m2278a(f1388u);
            c0498h.m2274a(250);
            c0498h.m2277a(this.f1413q);
            this.f1410n = c0498h;
            c0498h.m2279a();
        } else {
            this.f1399c.setAlpha(1.0f);
            this.f1399c.setTranslationY(0.0f);
            if (this.f1407k && this.f1402f != null) {
                this.f1402f.setTranslationY(0.0f);
            }
            this.f1413q.mo156b(null);
        }
        if (this.f1398b != null) {
            C0315p.m1392g(this.f1398b);
        }
    }

    public int m2199i() {
        return this.f1400d.mo525p();
    }

    public void m2200i(boolean z) {
        if (this.f1410n != null) {
            this.f1410n.m2281c();
        }
        if (this.f1393E == 0 && (this.f1396H || z)) {
            this.f1399c.setAlpha(1.0f);
            this.f1399c.setTransitioning(true);
            C0498h c0498h = new C0498h();
            float f = (float) (-this.f1399c.getHeight());
            if (z) {
                int[] iArr = new int[]{0, 0};
                this.f1399c.getLocationInWindow(iArr);
                f -= (float) iArr[1];
            }
            C0324r b = C0315p.m1389d(this.f1399c).m1434b(f);
            b.m1432a(this.f1414r);
            c0498h.m2275a(b);
            if (this.f1407k && this.f1402f != null) {
                c0498h.m2275a(C0315p.m1389d(this.f1402f).m1434b(f));
            }
            c0498h.m2278a(f1387t);
            c0498h.m2274a(250);
            c0498h.m2277a(this.f1412p);
            this.f1410n = c0498h;
            c0498h.m2279a();
            return;
        }
        this.f1412p.mo156b(null);
    }

    public void mo362j() {
        if (this.f1409m) {
            this.f1409m = false;
            m2176l(true);
        }
    }

    public void m2202j(boolean z) {
        if (z) {
            m2177n();
        } else {
            m2178o();
        }
        if (m2179p()) {
            C0324r a;
            C0324r a2;
            if (z) {
                a = this.f1400d.mo497a(4, 100);
                a2 = this.f1401e.mo446a(0, 200);
            } else {
                a2 = this.f1400d.mo497a(0, 200);
                a = this.f1401e.mo446a(8, 100);
            }
            C0498h c0498h = new C0498h();
            c0498h.m2276a(a, a2);
            c0498h.m2279a();
        } else if (z) {
            this.f1400d.mo513d(4);
            this.f1401e.setVisibility(0);
        } else {
            this.f1400d.mo513d(0);
            this.f1401e.setVisibility(8);
        }
    }

    public void mo363k() {
        if (!this.f1409m) {
            this.f1409m = true;
            m2176l(true);
        }
    }

    public void mo364l() {
        if (this.f1410n != null) {
            this.f1410n.m2281c();
            this.f1410n = null;
        }
    }

    public void mo365m() {
    }
}
