package android.support.v7.app;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.media.AudioManager;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.v4.p010a.C0161w;
import android.support.v4.p017h.C0290e;
import android.support.v4.p017h.C0302n;
import android.support.v4.p017h.C0315p;
import android.support.v4.p017h.C0324r;
import android.support.v4.p017h.C0325t;
import android.support.v4.p017h.C0327v;
import android.support.v4.widget.C0397i;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.p020a.C0411a.C0403c;
import android.support.v7.p020a.C0411a.C0406f;
import android.support.v7.p020a.C0411a.C0407g;
import android.support.v7.p020a.C0411a.C0409i;
import android.support.v7.p020a.C0411a.C0410j;
import android.support.v7.p021b.p022a.C0485b;
import android.support.v7.view.C0479b;
import android.support.v7.view.C0479b.C0462a;
import android.support.v7.view.C0490d;
import android.support.v7.view.C0491e;
import android.support.v7.view.menu.C0504p;
import android.support.v7.view.menu.C0506o.C0459a;
import android.support.v7.view.menu.C0519f;
import android.support.v7.view.menu.C0521h;
import android.support.v7.view.menu.C0521h.C0442a;
import android.support.v7.widget.ActionBarContextView;
import android.support.v7.widget.C0623l;
import android.support.v7.widget.ContentFrameLayout;
import android.support.v7.widget.ContentFrameLayout.C0454a;
import android.support.v7.widget.ViewStubCompat;
import android.support.v7.widget.ac;
import android.support.v7.widget.ag;
import android.support.v7.widget.ag.C0452a;
import android.support.v7.widget.bb;
import android.support.v7.widget.bc;
import android.text.TextUtils;
import android.util.AndroidRuntimeException;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.LayoutInflater.Factory;
import android.view.LayoutInflater.Factory2;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.ViewParent;
import android.view.Window;
import android.view.Window.Callback;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.PopupWindow;
import android.widget.TextView;
import org.xmlpull.v1.XmlPullParser;

class C0443k extends C0438f implements C0442a, Factory2 {
    private static final boolean f1259t = (VERSION.SDK_INT < 21);
    private View f1260A;
    private boolean f1261B;
    private boolean f1262C;
    private boolean f1263D;
    private C0465d[] f1264E;
    private C0465d f1265F;
    private boolean f1266G;
    private final Runnable f1267H = new C04501(this);
    private boolean f1268I;
    private Rect f1269J;
    private Rect f1270K;
    private C0468m f1271L;
    C0479b f1272m;
    ActionBarContextView f1273n;
    PopupWindow f1274o;
    Runnable f1275p;
    C0324r f1276q = null;
    boolean f1277r;
    int f1278s;
    private ac f1279u;
    private C0460a f1280v;
    private C0466e f1281w;
    private boolean f1282x;
    private ViewGroup f1283y;
    private TextView f1284z;

    class C04501 implements Runnable {
        final /* synthetic */ C0443k f1296a;

        C04501(C0443k c0443k) {
            this.f1296a = c0443k;
        }

        public void run() {
            if ((this.f1296a.f1278s & 1) != 0) {
                this.f1296a.m2026f(0);
            }
            if ((this.f1296a.f1278s & 4096) != 0) {
                this.f1296a.m2026f(C0410j.AppCompatTheme_tooltipFrameBackground);
            }
            this.f1296a.f1277r = false;
            this.f1296a.f1278s = 0;
        }
    }

    class C04512 implements C0302n {
        final /* synthetic */ C0443k f1297a;

        C04512(C0443k c0443k) {
            this.f1297a = c0443k;
        }

        public C0327v mo317a(View view, C0327v c0327v) {
            int b = c0327v.m1446b();
            int g = this.f1297a.m2027g(b);
            if (b != g) {
                c0327v = c0327v.m1445a(c0327v.m1444a(), g, c0327v.m1447c(), c0327v.m1448d());
            }
            return C0315p.m1376a(view, c0327v);
        }
    }

    class C04533 implements C0452a {
        final /* synthetic */ C0443k f1298a;

        C04533(C0443k c0443k) {
            this.f1298a = c0443k;
        }

        public void mo318a(Rect rect) {
            rect.top = this.f1298a.m2027g(rect.top);
        }
    }

    class C04554 implements C0454a {
        final /* synthetic */ C0443k f1299a;

        C04554(C0443k c0443k) {
            this.f1299a = c0443k;
        }

        public void mo319a() {
        }

        public void mo320b() {
            this.f1299a.m2034v();
        }
    }

    class C04575 implements Runnable {
        final /* synthetic */ C0443k f1301a;

        class C04561 extends C0325t {
            final /* synthetic */ C04575 f1300a;

            C04561(C04575 c04575) {
                this.f1300a = c04575;
            }

            public void mo155a(View view) {
                this.f1300a.f1301a.f1273n.setVisibility(0);
            }

            public void mo156b(View view) {
                this.f1300a.f1301a.f1273n.setAlpha(1.0f);
                this.f1300a.f1301a.f1276q.m1431a(null);
                this.f1300a.f1301a.f1276q = null;
            }
        }

        C04575(C0443k c0443k) {
            this.f1301a = c0443k;
        }

        public void run() {
            this.f1301a.f1274o.showAtLocation(this.f1301a.f1273n, 55, 0, 0);
            this.f1301a.m2032t();
            if (this.f1301a.m2031s()) {
                this.f1301a.f1273n.setAlpha(0.0f);
                this.f1301a.f1276q = C0315p.m1389d(this.f1301a.f1273n).m1429a(1.0f);
                this.f1301a.f1276q.m1431a(new C04561(this));
                return;
            }
            this.f1301a.f1273n.setAlpha(1.0f);
            this.f1301a.f1273n.setVisibility(0);
        }
    }

    class C04586 extends C0325t {
        final /* synthetic */ C0443k f1302a;

        C04586(C0443k c0443k) {
            this.f1302a = c0443k;
        }

        public void mo155a(View view) {
            this.f1302a.f1273n.setVisibility(0);
            this.f1302a.f1273n.sendAccessibilityEvent(32);
            if (this.f1302a.f1273n.getParent() instanceof View) {
                C0315p.m1392g((View) this.f1302a.f1273n.getParent());
            }
        }

        public void mo156b(View view) {
            this.f1302a.f1273n.setAlpha(1.0f);
            this.f1302a.f1276q.m1431a(null);
            this.f1302a.f1276q = null;
        }
    }

    private final class C0460a implements C0459a {
        final /* synthetic */ C0443k f1303a;

        C0460a(C0443k c0443k) {
            this.f1303a = c0443k;
        }

        public void mo321a(C0521h c0521h, boolean z) {
            this.f1303a.m2015b(c0521h);
        }

        public boolean mo322a(C0521h c0521h) {
            Callback q = this.f1303a.m1973q();
            if (q != null) {
                q.onMenuOpened(C0410j.AppCompatTheme_tooltipFrameBackground, c0521h);
            }
            return true;
        }
    }

    class C0463b implements C0462a {
        final /* synthetic */ C0443k f1305a;
        private C0462a f1306b;

        class C04611 extends C0325t {
            final /* synthetic */ C0463b f1304a;

            C04611(C0463b c0463b) {
                this.f1304a = c0463b;
            }

            public void mo156b(View view) {
                this.f1304a.f1305a.f1273n.setVisibility(8);
                if (this.f1304a.f1305a.f1274o != null) {
                    this.f1304a.f1305a.f1274o.dismiss();
                } else if (this.f1304a.f1305a.f1273n.getParent() instanceof View) {
                    C0315p.m1392g((View) this.f1304a.f1305a.f1273n.getParent());
                }
                this.f1304a.f1305a.f1273n.removeAllViews();
                this.f1304a.f1305a.f1276q.m1431a(null);
                this.f1304a.f1305a.f1276q = null;
            }
        }

        public C0463b(C0443k c0443k, C0462a c0462a) {
            this.f1305a = c0443k;
            this.f1306b = c0462a;
        }

        public void mo323a(C0479b c0479b) {
            this.f1306b.mo323a(c0479b);
            if (this.f1305a.f1274o != null) {
                this.f1305a.b.getDecorView().removeCallbacks(this.f1305a.f1275p);
            }
            if (this.f1305a.f1273n != null) {
                this.f1305a.m2032t();
                this.f1305a.f1276q = C0315p.m1389d(this.f1305a.f1273n).m1429a(0.0f);
                this.f1305a.f1276q.m1431a(new C04611(this));
            }
            if (this.f1305a.e != null) {
                this.f1305a.e.mo262b(this.f1305a.f1272m);
            }
            this.f1305a.f1272m = null;
        }

        public boolean mo324a(C0479b c0479b, Menu menu) {
            return this.f1306b.mo324a(c0479b, menu);
        }

        public boolean mo325a(C0479b c0479b, MenuItem menuItem) {
            return this.f1306b.mo325a(c0479b, menuItem);
        }

        public boolean mo326b(C0479b c0479b, Menu menu) {
            return this.f1306b.mo326b(c0479b, menu);
        }
    }

    private class C0464c extends ContentFrameLayout {
        final /* synthetic */ C0443k f1315a;

        public C0464c(C0443k c0443k, Context context) {
            this.f1315a = c0443k;
            super(context);
        }

        private boolean m2082a(int i, int i2) {
            return i < -5 || i2 < -5 || i > getWidth() + 5 || i2 > getHeight() + 5;
        }

        public boolean dispatchKeyEvent(KeyEvent keyEvent) {
            return this.f1315a.mo302a(keyEvent) || super.dispatchKeyEvent(keyEvent);
        }

        public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
            if (motionEvent.getAction() != 0 || !m2082a((int) motionEvent.getX(), (int) motionEvent.getY())) {
                return super.onInterceptTouchEvent(motionEvent);
            }
            this.f1315a.m2024e(0);
            return true;
        }

        public void setBackgroundResource(int i) {
            setBackgroundDrawable(C0485b.m2214b(getContext(), i));
        }
    }

    protected static final class C0465d {
        int f1316a;
        int f1317b;
        int f1318c;
        int f1319d;
        int f1320e;
        int f1321f;
        ViewGroup f1322g;
        View f1323h;
        View f1324i;
        C0521h f1325j;
        C0519f f1326k;
        Context f1327l;
        boolean f1328m;
        boolean f1329n;
        boolean f1330o;
        public boolean f1331p;
        boolean f1332q = false;
        boolean f1333r;
        Bundle f1334s;

        C0465d(int i) {
            this.f1316a = i;
        }

        C0504p m2083a(C0459a c0459a) {
            if (this.f1325j == null) {
                return null;
            }
            if (this.f1326k == null) {
                this.f1326k = new C0519f(this.f1327l, C0407g.abc_list_menu_item_layout);
                this.f1326k.mo404a(c0459a);
                this.f1325j.m2443a(this.f1326k);
            }
            return this.f1326k.m2410a(this.f1322g);
        }

        void m2084a(Context context) {
            TypedValue typedValue = new TypedValue();
            Theme newTheme = context.getResources().newTheme();
            newTheme.setTo(context.getTheme());
            newTheme.resolveAttribute(C0401a.actionBarPopupTheme, typedValue, true);
            if (typedValue.resourceId != 0) {
                newTheme.applyStyle(typedValue.resourceId, true);
            }
            newTheme.resolveAttribute(C0401a.panelMenuListTheme, typedValue, true);
            if (typedValue.resourceId != 0) {
                newTheme.applyStyle(typedValue.resourceId, true);
            } else {
                newTheme.applyStyle(C0409i.Theme_AppCompat_CompactMenu, true);
            }
            Context c0490d = new C0490d(context, 0);
            c0490d.getTheme().setTo(newTheme);
            this.f1327l = c0490d;
            TypedArray obtainStyledAttributes = c0490d.obtainStyledAttributes(C0410j.AppCompatTheme);
            this.f1317b = obtainStyledAttributes.getResourceId(C0410j.AppCompatTheme_panelBackground, 0);
            this.f1321f = obtainStyledAttributes.getResourceId(C0410j.AppCompatTheme_android_windowAnimationStyle, 0);
            obtainStyledAttributes.recycle();
        }

        void m2085a(C0521h c0521h) {
            if (c0521h != this.f1325j) {
                if (this.f1325j != null) {
                    this.f1325j.m2454b(this.f1326k);
                }
                this.f1325j = c0521h;
                if (c0521h != null && this.f1326k != null) {
                    c0521h.m2443a(this.f1326k);
                }
            }
        }

        public boolean m2086a() {
            return this.f1323h == null ? false : this.f1324i != null || this.f1326k.m2411a().getCount() > 0;
        }
    }

    private final class C0466e implements C0459a {
        final /* synthetic */ C0443k f1335a;

        C0466e(C0443k c0443k) {
            this.f1335a = c0443k;
        }

        public void mo321a(C0521h c0521h, boolean z) {
            Menu menu;
            Menu p = c0521h.mo444p();
            boolean z2 = p != c0521h;
            C0443k c0443k = this.f1335a;
            if (z2) {
                menu = p;
            }
            C0465d a = c0443k.m1995a(menu);
            if (a == null) {
                return;
            }
            if (z2) {
                this.f1335a.m1999a(a.f1316a, a, p);
                this.f1335a.m2003a(a, true);
                return;
            }
            this.f1335a.m2003a(a, z);
        }

        public boolean mo322a(C0521h c0521h) {
            if (c0521h == null && this.f1335a.h) {
                Callback q = this.f1335a.m1973q();
                if (!(q == null || this.f1335a.m1972p())) {
                    q.onMenuOpened(C0410j.AppCompatTheme_tooltipFrameBackground, c0521h);
                }
            }
            return true;
        }
    }

    C0443k(Context context, Window window, C0430d c0430d) {
        super(context, window, c0430d);
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void m1978a(android.support.v7.app.C0443k.C0465d r11, android.view.KeyEvent r12) {
        /*
        r10 = this;
        r1 = -1;
        r3 = 0;
        r9 = 1;
        r2 = -2;
        r0 = r11.f1330o;
        if (r0 != 0) goto L_0x000e;
    L_0x0008:
        r0 = r10.m1972p();
        if (r0 == 0) goto L_0x000f;
    L_0x000e:
        return;
    L_0x000f:
        r0 = r11.f1316a;
        if (r0 != 0) goto L_0x0034;
    L_0x0013:
        r4 = r10.a;
        r0 = r4.getResources();
        r0 = r0.getConfiguration();
        r0 = r0.screenLayout;
        r0 = r0 & 15;
        r5 = 4;
        if (r0 != r5) goto L_0x0048;
    L_0x0024:
        r0 = r9;
    L_0x0025:
        r4 = r4.getApplicationInfo();
        r4 = r4.targetSdkVersion;
        r5 = 11;
        if (r4 < r5) goto L_0x004a;
    L_0x002f:
        r4 = r9;
    L_0x0030:
        if (r0 == 0) goto L_0x0034;
    L_0x0032:
        if (r4 != 0) goto L_0x000e;
    L_0x0034:
        r0 = r10.m1973q();
        if (r0 == 0) goto L_0x004c;
    L_0x003a:
        r4 = r11.f1316a;
        r5 = r11.f1325j;
        r0 = r0.onMenuOpened(r4, r5);
        if (r0 != 0) goto L_0x004c;
    L_0x0044:
        r10.m2003a(r11, r9);
        goto L_0x000e;
    L_0x0048:
        r0 = r3;
        goto L_0x0025;
    L_0x004a:
        r4 = r3;
        goto L_0x0030;
    L_0x004c:
        r0 = r10.a;
        r4 = "window";
        r0 = r0.getSystemService(r4);
        r8 = r0;
        r8 = (android.view.WindowManager) r8;
        if (r8 == 0) goto L_0x000e;
    L_0x0059:
        r0 = r10.m1984b(r11, r12);
        if (r0 == 0) goto L_0x000e;
    L_0x005f:
        r0 = r11.f1322g;
        if (r0 == 0) goto L_0x0067;
    L_0x0063:
        r0 = r11.f1332q;
        if (r0 == 0) goto L_0x00f1;
    L_0x0067:
        r0 = r11.f1322g;
        if (r0 != 0) goto L_0x00df;
    L_0x006b:
        r0 = r10.m1980a(r11);
        if (r0 == 0) goto L_0x000e;
    L_0x0071:
        r0 = r11.f1322g;
        if (r0 == 0) goto L_0x000e;
    L_0x0075:
        r0 = r10.m1985c(r11);
        if (r0 == 0) goto L_0x000e;
    L_0x007b:
        r0 = r11.m2086a();
        if (r0 == 0) goto L_0x000e;
    L_0x0081:
        r0 = r11.f1323h;
        r0 = r0.getLayoutParams();
        if (r0 != 0) goto L_0x0103;
    L_0x0089:
        r0 = new android.view.ViewGroup$LayoutParams;
        r0.<init>(r2, r2);
        r1 = r0;
    L_0x008f:
        r0 = r11.f1317b;
        r4 = r11.f1322g;
        r4.setBackgroundResource(r0);
        r0 = r11.f1323h;
        r0 = r0.getParent();
        if (r0 == 0) goto L_0x00a9;
    L_0x009e:
        r4 = r0 instanceof android.view.ViewGroup;
        if (r4 == 0) goto L_0x00a9;
    L_0x00a2:
        r0 = (android.view.ViewGroup) r0;
        r4 = r11.f1323h;
        r0.removeView(r4);
    L_0x00a9:
        r0 = r11.f1322g;
        r4 = r11.f1323h;
        r0.addView(r4, r1);
        r0 = r11.f1323h;
        r0 = r0.hasFocus();
        if (r0 != 0) goto L_0x00bd;
    L_0x00b8:
        r0 = r11.f1323h;
        r0.requestFocus();
    L_0x00bd:
        r1 = r2;
    L_0x00be:
        r11.f1329n = r3;
        r0 = new android.view.WindowManager$LayoutParams;
        r3 = r11.f1319d;
        r4 = r11.f1320e;
        r5 = 1002; // 0x3ea float:1.404E-42 double:4.95E-321;
        r6 = 8519680; // 0x820000 float:1.1938615E-38 double:4.209281E-317;
        r7 = -3;
        r0.<init>(r1, r2, r3, r4, r5, r6, r7);
        r1 = r11.f1318c;
        r0.gravity = r1;
        r1 = r11.f1321f;
        r0.windowAnimations = r1;
        r1 = r11.f1322g;
        r8.addView(r1, r0);
        r11.f1330o = r9;
        goto L_0x000e;
    L_0x00df:
        r0 = r11.f1332q;
        if (r0 == 0) goto L_0x0075;
    L_0x00e3:
        r0 = r11.f1322g;
        r0 = r0.getChildCount();
        if (r0 <= 0) goto L_0x0075;
    L_0x00eb:
        r0 = r11.f1322g;
        r0.removeAllViews();
        goto L_0x0075;
    L_0x00f1:
        r0 = r11.f1324i;
        if (r0 == 0) goto L_0x0101;
    L_0x00f5:
        r0 = r11.f1324i;
        r0 = r0.getLayoutParams();
        if (r0 == 0) goto L_0x0101;
    L_0x00fd:
        r0 = r0.width;
        if (r0 == r1) goto L_0x00be;
    L_0x0101:
        r1 = r2;
        goto L_0x00be;
    L_0x0103:
        r1 = r0;
        goto L_0x008f;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v7.app.k.a(android.support.v7.app.k$d, android.view.KeyEvent):void");
    }

    private void m1979a(C0521h c0521h, boolean z) {
        if (this.f1279u == null || !this.f1279u.mo456e() || (ViewConfiguration.get(this.a).hasPermanentMenuKey() && !this.f1279u.mo458g())) {
            C0465d a = m1994a(0, true);
            a.f1332q = true;
            m2003a(a, false);
            m1978a(a, null);
            return;
        }
        Callback q = m1973q();
        if (this.f1279u.mo457f() && z) {
            this.f1279u.mo460i();
            if (!m1972p()) {
                q.onPanelClosed(C0410j.AppCompatTheme_tooltipFrameBackground, m1994a(0, true).f1325j);
            }
        } else if (q != null && !m1972p()) {
            if (this.f1277r && (this.f1278s & 1) != 0) {
                this.b.getDecorView().removeCallbacks(this.f1267H);
                this.f1267H.run();
            }
            C0465d a2 = m1994a(0, true);
            if (a2.f1325j != null && !a2.f1333r && q.onPreparePanel(0, a2.f1324i, a2.f1325j)) {
                q.onMenuOpened(C0410j.AppCompatTheme_tooltipFrameBackground, a2.f1325j);
                this.f1279u.mo459h();
            }
        }
    }

    private boolean m1980a(C0465d c0465d) {
        c0465d.m2084a(m1970n());
        c0465d.f1322g = new C0464c(this, c0465d.f1327l);
        c0465d.f1318c = 81;
        return true;
    }

    private boolean m1981a(C0465d c0465d, int i, KeyEvent keyEvent, int i2) {
        boolean z = false;
        if (!keyEvent.isSystem()) {
            if ((c0465d.f1328m || m1984b(c0465d, keyEvent)) && c0465d.f1325j != null) {
                z = c0465d.f1325j.performShortcut(i, keyEvent, i2);
            }
            if (z && (i2 & 1) == 0 && this.f1279u == null) {
                m2003a(c0465d, true);
            }
        }
        return z;
    }

    private boolean m1982a(ViewParent viewParent) {
        if (viewParent == null) {
            return false;
        }
        ViewParent decorView = this.b.getDecorView();
        ViewParent viewParent2 = viewParent;
        while (viewParent2 != null) {
            if (viewParent2 == decorView || !(viewParent2 instanceof View) || C0315p.m1398m((View) viewParent2)) {
                return false;
            }
            viewParent2 = viewParent2.getParent();
        }
        return true;
    }

    private boolean m1983b(C0465d c0465d) {
        Context c0490d;
        C0521h c0521h;
        Context context = this.a;
        if ((c0465d.f1316a == 0 || c0465d.f1316a == C0410j.AppCompatTheme_tooltipFrameBackground) && this.f1279u != null) {
            TypedValue typedValue = new TypedValue();
            Theme theme = context.getTheme();
            theme.resolveAttribute(C0401a.actionBarTheme, typedValue, true);
            Theme theme2 = null;
            if (typedValue.resourceId != 0) {
                theme2 = context.getResources().newTheme();
                theme2.setTo(theme);
                theme2.applyStyle(typedValue.resourceId, true);
                theme2.resolveAttribute(C0401a.actionBarWidgetTheme, typedValue, true);
            } else {
                theme.resolveAttribute(C0401a.actionBarWidgetTheme, typedValue, true);
            }
            if (typedValue.resourceId != 0) {
                if (theme2 == null) {
                    theme2 = context.getResources().newTheme();
                    theme2.setTo(theme);
                }
                theme2.applyStyle(typedValue.resourceId, true);
            }
            Theme theme3 = theme2;
            if (theme3 != null) {
                c0490d = new C0490d(context, 0);
                c0490d.getTheme().setTo(theme3);
                c0521h = new C0521h(c0490d);
                c0521h.mo438a((C0442a) this);
                c0465d.m2085a(c0521h);
                return true;
            }
        }
        c0490d = context;
        c0521h = new C0521h(c0490d);
        c0521h.mo438a((C0442a) this);
        c0465d.m2085a(c0521h);
        return true;
    }

    private boolean m1984b(C0465d c0465d, KeyEvent keyEvent) {
        if (m1972p()) {
            return false;
        }
        if (c0465d.f1328m) {
            return true;
        }
        if (!(this.f1265F == null || this.f1265F == c0465d)) {
            m2003a(this.f1265F, false);
        }
        Callback q = m1973q();
        if (q != null) {
            c0465d.f1324i = q.onCreatePanelView(c0465d.f1316a);
        }
        boolean z = c0465d.f1316a == 0 || c0465d.f1316a == C0410j.AppCompatTheme_tooltipFrameBackground;
        if (z && this.f1279u != null) {
            this.f1279u.mo461j();
        }
        if (c0465d.f1324i == null && !(z && (m1969m() instanceof C0472o))) {
            if (c0465d.f1325j == null || c0465d.f1333r) {
                if (c0465d.f1325j == null && (!m1983b(c0465d) || c0465d.f1325j == null)) {
                    return false;
                }
                if (z && this.f1279u != null) {
                    if (this.f1280v == null) {
                        this.f1280v = new C0460a(this);
                    }
                    this.f1279u.mo455a(c0465d.f1325j, this.f1280v);
                }
                c0465d.f1325j.m2467g();
                if (q.onCreatePanelMenu(c0465d.f1316a, c0465d.f1325j)) {
                    c0465d.f1333r = false;
                } else {
                    c0465d.m2085a(null);
                    if (!z || this.f1279u == null) {
                        return false;
                    }
                    this.f1279u.mo455a(null, this.f1280v);
                    return false;
                }
            }
            c0465d.f1325j.m2467g();
            if (c0465d.f1334s != null) {
                c0465d.f1325j.m2452b(c0465d.f1334s);
                c0465d.f1334s = null;
            }
            if (q.onPreparePanel(0, c0465d.f1324i, c0465d.f1325j)) {
                c0465d.f1331p = KeyCharacterMap.load(keyEvent != null ? keyEvent.getDeviceId() : -1).getKeyboardType() != 1;
                c0465d.f1325j.setQwertyMode(c0465d.f1331p);
                c0465d.f1325j.m2468h();
            } else {
                if (z && this.f1279u != null) {
                    this.f1279u.mo455a(null, this.f1280v);
                }
                c0465d.f1325j.m2468h();
                return false;
            }
        }
        c0465d.f1328m = true;
        c0465d.f1329n = false;
        this.f1265F = c0465d;
        return true;
    }

    private boolean m1985c(C0465d c0465d) {
        if (c0465d.f1324i != null) {
            c0465d.f1323h = c0465d.f1324i;
            return true;
        } else if (c0465d.f1325j == null) {
            return false;
        } else {
            if (this.f1281w == null) {
                this.f1281w = new C0466e(this);
            }
            c0465d.f1323h = (View) c0465d.m2083a(this.f1281w);
            return c0465d.f1323h != null;
        }
    }

    private void mo315d(int i) {
        this.f1278s |= 1 << i;
        if (!this.f1277r) {
            C0315p.m1385a(this.b.getDecorView(), this.f1267H);
            this.f1277r = true;
        }
    }

    private boolean m1987d(int i, KeyEvent keyEvent) {
        if (keyEvent.getRepeatCount() == 0) {
            C0465d a = m1994a(i, true);
            if (!a.f1330o) {
                return m1984b(a, keyEvent);
            }
        }
        return false;
    }

    private boolean m1988e(int i, KeyEvent keyEvent) {
        boolean z = true;
        if (this.f1272m != null) {
            return false;
        }
        C0465d a = m1994a(i, true);
        if (i != 0 || this.f1279u == null || !this.f1279u.mo456e() || ViewConfiguration.get(this.a).hasPermanentMenuKey()) {
            boolean z2;
            if (a.f1330o || a.f1329n) {
                z2 = a.f1330o;
                m2003a(a, true);
                z = z2;
            } else {
                if (a.f1328m) {
                    if (a.f1333r) {
                        a.f1328m = false;
                        z2 = m1984b(a, keyEvent);
                    } else {
                        z2 = true;
                    }
                    if (z2) {
                        m1978a(a, keyEvent);
                    }
                }
                z = false;
            }
        } else if (this.f1279u.mo457f()) {
            z = this.f1279u.mo460i();
        } else {
            if (!m1972p() && m1984b(a, keyEvent)) {
                z = this.f1279u.mo459h();
            }
            z = false;
        }
        if (z) {
            AudioManager audioManager = (AudioManager) this.a.getSystemService("audio");
            if (audioManager != null) {
                audioManager.playSoundEffect(0);
            } else {
                Log.w("AppCompatDelegate", "Couldn't get audio manager");
            }
        }
        return z;
    }

    private int m1989h(int i) {
        if (i == 8) {
            Log.i("AppCompatDelegate", "You should now use the AppCompatDelegate.FEATURE_SUPPORT_ACTION_BAR id when requesting this feature.");
            return C0410j.AppCompatTheme_tooltipFrameBackground;
        } else if (i != 9) {
            return i;
        } else {
            Log.i("AppCompatDelegate", "You should now use the AppCompatDelegate.FEATURE_SUPPORT_ACTION_BAR_OVERLAY id when requesting this feature.");
            return C0410j.AppCompatTheme_windowActionBar;
        }
    }

    private void m1990w() {
        if (!this.f1282x) {
            this.f1283y = m1991x();
            CharSequence r = m1974r();
            if (!TextUtils.isEmpty(r)) {
                mo306b(r);
            }
            m1992y();
            m2007a(this.f1283y);
            this.f1282x = true;
            C0465d a = m1994a(0, false);
            if (!m1972p()) {
                if (a == null || a.f1325j == null) {
                    mo315d(C0410j.AppCompatTheme_tooltipFrameBackground);
                }
            }
        }
    }

    private ViewGroup m1991x() {
        TypedArray obtainStyledAttributes = this.a.obtainStyledAttributes(C0410j.AppCompatTheme);
        if (obtainStyledAttributes.hasValue(C0410j.AppCompatTheme_windowActionBar)) {
            View view;
            if (obtainStyledAttributes.getBoolean(C0410j.AppCompatTheme_windowNoTitle, false)) {
                mo308c(1);
            } else if (obtainStyledAttributes.getBoolean(C0410j.AppCompatTheme_windowActionBar, false)) {
                mo308c((int) C0410j.AppCompatTheme_tooltipFrameBackground);
            }
            if (obtainStyledAttributes.getBoolean(C0410j.AppCompatTheme_windowActionBarOverlay, false)) {
                mo308c((int) C0410j.AppCompatTheme_windowActionBar);
            }
            if (obtainStyledAttributes.getBoolean(C0410j.AppCompatTheme_windowActionModeOverlay, false)) {
                mo308c(10);
            }
            this.k = obtainStyledAttributes.getBoolean(C0410j.AppCompatTheme_android_windowIsFloating, false);
            obtainStyledAttributes.recycle();
            this.b.getDecorView();
            LayoutInflater from = LayoutInflater.from(this.a);
            if (this.l) {
                View view2 = this.j ? (ViewGroup) from.inflate(C0407g.abc_screen_simple_overlay_action_mode, null) : (ViewGroup) from.inflate(C0407g.abc_screen_simple, null);
                if (VERSION.SDK_INT >= 21) {
                    C0315p.m1384a(view2, new C04512(this));
                    view = view2;
                } else {
                    ((ag) view2).setOnFitSystemWindowsListener(new C04533(this));
                    view = view2;
                }
            } else if (this.k) {
                r0 = (ViewGroup) from.inflate(C0407g.abc_dialog_title_material, null);
                this.i = false;
                this.h = false;
                view = r0;
            } else if (this.h) {
                TypedValue typedValue = new TypedValue();
                this.a.getTheme().resolveAttribute(C0401a.actionBarTheme, typedValue, true);
                r0 = (ViewGroup) LayoutInflater.from(typedValue.resourceId != 0 ? new C0490d(this.a, typedValue.resourceId) : this.a).inflate(C0407g.abc_screen_toolbar, null);
                this.f1279u = (ac) r0.findViewById(C0406f.decor_content_parent);
                this.f1279u.setWindowCallback(m1973q());
                if (this.i) {
                    this.f1279u.mo454a(C0410j.AppCompatTheme_windowActionBar);
                }
                if (this.f1261B) {
                    this.f1279u.mo454a(2);
                }
                if (this.f1262C) {
                    this.f1279u.mo454a(5);
                }
                view = r0;
            } else {
                view = null;
            }
            if (view == null) {
                throw new IllegalArgumentException("AppCompat does not support the current theme features: { windowActionBar: " + this.h + ", windowActionBarOverlay: " + this.i + ", android:windowIsFloating: " + this.k + ", windowActionModeOverlay: " + this.j + ", windowNoTitle: " + this.l + " }");
            }
            if (this.f1279u == null) {
                this.f1284z = (TextView) view.findViewById(C0406f.title);
            }
            bc.m3036b(view);
            ContentFrameLayout contentFrameLayout = (ContentFrameLayout) view.findViewById(C0406f.action_bar_activity_content);
            ViewGroup viewGroup = (ViewGroup) this.b.findViewById(16908290);
            if (viewGroup != null) {
                while (viewGroup.getChildCount() > 0) {
                    View childAt = viewGroup.getChildAt(0);
                    viewGroup.removeViewAt(0);
                    contentFrameLayout.addView(childAt);
                }
                viewGroup.setId(-1);
                contentFrameLayout.setId(16908290);
                if (viewGroup instanceof FrameLayout) {
                    ((FrameLayout) viewGroup).setForeground(null);
                }
            }
            this.b.setContentView(view);
            contentFrameLayout.setAttachListener(new C04554(this));
            return view;
        }
        obtainStyledAttributes.recycle();
        throw new IllegalStateException("You need to use a Theme.AppCompat theme (or descendant) with this activity.");
    }

    private void m1992y() {
        ContentFrameLayout contentFrameLayout = (ContentFrameLayout) this.f1283y.findViewById(16908290);
        View decorView = this.b.getDecorView();
        contentFrameLayout.m2080a(decorView.getPaddingLeft(), decorView.getPaddingTop(), decorView.getPaddingRight(), decorView.getPaddingBottom());
        TypedArray obtainStyledAttributes = this.a.obtainStyledAttributes(C0410j.AppCompatTheme);
        obtainStyledAttributes.getValue(C0410j.AppCompatTheme_windowMinWidthMajor, contentFrameLayout.getMinWidthMajor());
        obtainStyledAttributes.getValue(C0410j.AppCompatTheme_windowMinWidthMinor, contentFrameLayout.getMinWidthMinor());
        if (obtainStyledAttributes.hasValue(C0410j.AppCompatTheme_windowFixedWidthMajor)) {
            obtainStyledAttributes.getValue(C0410j.AppCompatTheme_windowFixedWidthMajor, contentFrameLayout.getFixedWidthMajor());
        }
        if (obtainStyledAttributes.hasValue(C0410j.AppCompatTheme_windowFixedWidthMinor)) {
            obtainStyledAttributes.getValue(C0410j.AppCompatTheme_windowFixedWidthMinor, contentFrameLayout.getFixedWidthMinor());
        }
        if (obtainStyledAttributes.hasValue(C0410j.AppCompatTheme_windowFixedHeightMajor)) {
            obtainStyledAttributes.getValue(C0410j.AppCompatTheme_windowFixedHeightMajor, contentFrameLayout.getFixedHeightMajor());
        }
        if (obtainStyledAttributes.hasValue(C0410j.AppCompatTheme_windowFixedHeightMinor)) {
            obtainStyledAttributes.getValue(C0410j.AppCompatTheme_windowFixedHeightMinor, contentFrameLayout.getFixedHeightMinor());
        }
        obtainStyledAttributes.recycle();
        contentFrameLayout.requestLayout();
    }

    private void m1993z() {
        if (this.f1282x) {
            throw new AndroidRuntimeException("Window feature must be requested before adding content");
        }
    }

    protected C0465d m1994a(int i, boolean z) {
        Object obj = this.f1264E;
        if (obj == null || obj.length <= i) {
            Object obj2 = new C0465d[(i + 1)];
            if (obj != null) {
                System.arraycopy(obj, 0, obj2, 0, obj.length);
            }
            this.f1264E = obj2;
            obj = obj2;
        }
        C0465d c0465d = obj[i];
        if (c0465d != null) {
            return c0465d;
        }
        c0465d = new C0465d(i);
        obj[i] = c0465d;
        return c0465d;
    }

    C0465d m1995a(Menu menu) {
        C0465d[] c0465dArr = this.f1264E;
        int length = c0465dArr != null ? c0465dArr.length : 0;
        for (int i = 0; i < length; i++) {
            C0465d c0465d = c0465dArr[i];
            if (c0465d != null && c0465d.f1325j == menu) {
                return c0465d;
            }
        }
        return null;
    }

    C0479b mo292a(C0462a c0462a) {
        C0479b c0479b;
        m2032t();
        if (this.f1272m != null) {
            this.f1272m.mo352c();
        }
        if (!(c0462a instanceof C0463b)) {
            c0462a = new C0463b(this, c0462a);
        }
        if (this.e == null || m1972p()) {
            c0479b = null;
        } else {
            try {
                c0479b = this.e.mo260a(c0462a);
            } catch (AbstractMethodError e) {
                c0479b = null;
            }
        }
        if (c0479b != null) {
            this.f1272m = c0479b;
        } else {
            if (this.f1273n == null) {
                if (this.k) {
                    Context c0490d;
                    TypedValue typedValue = new TypedValue();
                    Theme theme = this.a.getTheme();
                    theme.resolveAttribute(C0401a.actionBarTheme, typedValue, true);
                    if (typedValue.resourceId != 0) {
                        Theme newTheme = this.a.getResources().newTheme();
                        newTheme.setTo(theme);
                        newTheme.applyStyle(typedValue.resourceId, true);
                        c0490d = new C0490d(this.a, 0);
                        c0490d.getTheme().setTo(newTheme);
                    } else {
                        c0490d = this.a;
                    }
                    this.f1273n = new ActionBarContextView(c0490d);
                    this.f1274o = new PopupWindow(c0490d, null, C0401a.actionModePopupWindowStyle);
                    C0397i.m1838a(this.f1274o, 2);
                    this.f1274o.setContentView(this.f1273n);
                    this.f1274o.setWidth(-1);
                    c0490d.getTheme().resolveAttribute(C0401a.actionBarSize, typedValue, true);
                    this.f1273n.setContentHeight(TypedValue.complexToDimensionPixelSize(typedValue.data, c0490d.getResources().getDisplayMetrics()));
                    this.f1274o.setHeight(-2);
                    this.f1275p = new C04575(this);
                } else {
                    ViewStubCompat viewStubCompat = (ViewStubCompat) this.f1283y.findViewById(C0406f.action_mode_bar_stub);
                    if (viewStubCompat != null) {
                        viewStubCompat.setLayoutInflater(LayoutInflater.from(m1970n()));
                        this.f1273n = (ActionBarContextView) viewStubCompat.m2781a();
                    }
                }
            }
            if (this.f1273n != null) {
                m2032t();
                this.f1273n.m2589c();
                C0479b c0491e = new C0491e(this.f1273n.getContext(), this.f1273n, c0462a, this.f1274o == null);
                if (c0462a.mo324a(c0491e, c0491e.mo349b())) {
                    c0491e.mo353d();
                    this.f1273n.m2586a(c0491e);
                    this.f1272m = c0491e;
                    if (m2031s()) {
                        this.f1273n.setAlpha(0.0f);
                        this.f1276q = C0315p.m1389d(this.f1273n).m1429a(1.0f);
                        this.f1276q.m1431a(new C04586(this));
                    } else {
                        this.f1273n.setAlpha(1.0f);
                        this.f1273n.setVisibility(0);
                        this.f1273n.sendAccessibilityEvent(32);
                        if (this.f1273n.getParent() instanceof View) {
                            C0315p.m1392g((View) this.f1273n.getParent());
                        }
                    }
                    if (this.f1274o != null) {
                        this.b.getDecorView().post(this.f1275p);
                    }
                } else {
                    this.f1272m = null;
                }
            }
        }
        if (!(this.f1272m == null || this.e == null)) {
            this.e.mo261a(this.f1272m);
        }
        return this.f1272m;
    }

    public <T extends View> T mo293a(int i) {
        m1990w();
        return this.b.findViewById(i);
    }

    View mo313a(View view, String str, Context context, AttributeSet attributeSet) {
        if (this.c instanceof Factory) {
            View onCreateView = ((Factory) this.c).onCreateView(str, context, attributeSet);
            if (onCreateView != null) {
                return onCreateView;
            }
        }
        return null;
    }

    void m1999a(int i, C0465d c0465d, Menu menu) {
        if (menu == null) {
            if (c0465d == null && i >= 0 && i < this.f1264E.length) {
                c0465d = this.f1264E[i];
            }
            if (c0465d != null) {
                menu = c0465d.f1325j;
            }
        }
        if ((c0465d == null || c0465d.f1330o) && !m1972p()) {
            this.c.onPanelClosed(i, menu);
        }
    }

    void mo294a(int i, Menu menu) {
        if (i == C0410j.AppCompatTheme_tooltipFrameBackground) {
            C0428a a = mo281a();
            if (a != null) {
                a.mo339e(false);
            }
        } else if (i == 0) {
            C0465d a2 = m1994a(i, true);
            if (a2.f1330o) {
                m2003a(a2, false);
            }
        }
    }

    public void mo295a(Configuration configuration) {
        if (this.h && this.f1282x) {
            C0428a a = mo281a();
            if (a != null) {
                a.mo329a(configuration);
            }
        }
        C0623l.m3126a().m3148a(this.a);
        mo288i();
    }

    public void mo296a(Bundle bundle) {
        if ((this.c instanceof Activity) && C0161w.m844b((Activity) this.c) != null) {
            C0428a m = m1969m();
            if (m == null) {
                this.f1268I = true;
            } else {
                m.mo335c(true);
            }
        }
    }

    void m2003a(C0465d c0465d, boolean z) {
        if (z && c0465d.f1316a == 0 && this.f1279u != null && this.f1279u.mo457f()) {
            m2015b(c0465d.f1325j);
            return;
        }
        WindowManager windowManager = (WindowManager) this.a.getSystemService("window");
        if (!(windowManager == null || !c0465d.f1330o || c0465d.f1322g == null)) {
            windowManager.removeView(c0465d.f1322g);
            if (z) {
                m1999a(c0465d.f1316a, c0465d, null);
            }
        }
        c0465d.f1328m = false;
        c0465d.f1329n = false;
        c0465d.f1330o = false;
        c0465d.f1323h = null;
        c0465d.f1332q = true;
        if (this.f1265F == c0465d) {
            this.f1265F = null;
        }
    }

    public void mo297a(C0521h c0521h) {
        m1979a(c0521h, true);
    }

    public void mo298a(View view) {
        m1990w();
        ViewGroup viewGroup = (ViewGroup) this.f1283y.findViewById(16908290);
        viewGroup.removeAllViews();
        viewGroup.addView(view);
        this.c.onContentChanged();
    }

    public void mo299a(View view, LayoutParams layoutParams) {
        m1990w();
        ViewGroup viewGroup = (ViewGroup) this.f1283y.findViewById(16908290);
        viewGroup.removeAllViews();
        viewGroup.addView(view, layoutParams);
        this.c.onContentChanged();
    }

    void m2007a(ViewGroup viewGroup) {
    }

    boolean mo300a(int i, KeyEvent keyEvent) {
        C0428a a = mo281a();
        if (a != null && a.mo332a(i, keyEvent)) {
            return true;
        }
        if (this.f1265F == null || !m1981a(this.f1265F, keyEvent.getKeyCode(), keyEvent, 1)) {
            if (this.f1265F == null) {
                C0465d a2 = m1994a(0, true);
                m1984b(a2, keyEvent);
                boolean a3 = m1981a(a2, keyEvent.getKeyCode(), keyEvent, 1);
                a2.f1328m = false;
                if (a3) {
                    return true;
                }
            }
            return false;
        } else if (this.f1265F == null) {
            return true;
        } else {
            this.f1265F.f1329n = true;
            return true;
        }
    }

    public boolean mo301a(C0521h c0521h, MenuItem menuItem) {
        Callback q = m1973q();
        if (!(q == null || m1972p())) {
            C0465d a = m1995a(c0521h.mo444p());
            if (a != null) {
                return q.onMenuItemSelected(a.f1316a, menuItem);
            }
        }
        return false;
    }

    boolean mo302a(KeyEvent keyEvent) {
        boolean z = true;
        if (keyEvent.getKeyCode() == 82 && this.c.dispatchKeyEvent(keyEvent)) {
            return true;
        }
        int keyCode = keyEvent.getKeyCode();
        if (keyEvent.getAction() != 0) {
            z = false;
        }
        return z ? m2021c(keyCode, keyEvent) : m2018b(keyCode, keyEvent);
    }

    public C0479b m2011b(C0462a c0462a) {
        if (c0462a == null) {
            throw new IllegalArgumentException("ActionMode callback can not be null.");
        }
        if (this.f1272m != null) {
            this.f1272m.mo352c();
        }
        C0462a c0463b = new C0463b(this, c0462a);
        C0428a a = mo281a();
        if (a != null) {
            this.f1272m = a.mo358a(c0463b);
            if (!(this.f1272m == null || this.e == null)) {
                this.e.mo261a(this.f1272m);
            }
        }
        if (this.f1272m == null) {
            this.f1272m = mo292a(c0463b);
        }
        return this.f1272m;
    }

    public View m2012b(View view, String str, Context context, AttributeSet attributeSet) {
        boolean z;
        if (this.f1271L == null) {
            this.f1271L = new C0468m();
        }
        if (f1259t) {
            boolean a = attributeSet instanceof XmlPullParser ? ((XmlPullParser) attributeSet).getDepth() > 1 : m1982a((ViewParent) view);
            z = a;
        } else {
            z = false;
        }
        return this.f1271L.m2094a(view, str, context, attributeSet, z, f1259t, true, bb.m3032a());
    }

    public void mo303b(int i) {
        m1990w();
        ViewGroup viewGroup = (ViewGroup) this.f1283y.findViewById(16908290);
        viewGroup.removeAllViews();
        LayoutInflater.from(this.a).inflate(i, viewGroup);
        this.c.onContentChanged();
    }

    public void mo304b(Bundle bundle) {
        m1990w();
    }

    void m2015b(C0521h c0521h) {
        if (!this.f1263D) {
            this.f1263D = true;
            this.f1279u.mo462k();
            Callback q = m1973q();
            if (!(q == null || m1972p())) {
                q.onPanelClosed(C0410j.AppCompatTheme_tooltipFrameBackground, c0521h);
            }
            this.f1263D = false;
        }
    }

    public void mo305b(View view, LayoutParams layoutParams) {
        m1990w();
        ((ViewGroup) this.f1283y.findViewById(16908290)).addView(view, layoutParams);
        this.c.onContentChanged();
    }

    void mo306b(CharSequence charSequence) {
        if (this.f1279u != null) {
            this.f1279u.setWindowTitle(charSequence);
        } else if (m1969m() != null) {
            m1969m().mo330a(charSequence);
        } else if (this.f1284z != null) {
            this.f1284z.setText(charSequence);
        }
    }

    boolean m2018b(int i, KeyEvent keyEvent) {
        switch (i) {
            case 4:
                boolean z = this.f1266G;
                this.f1266G = false;
                C0465d a = m1994a(0, false);
                if (a == null || !a.f1330o) {
                    if (m2033u()) {
                        return true;
                    }
                } else if (z) {
                    return true;
                } else {
                    m2003a(a, true);
                    return true;
                }
                break;
            case C0410j.AppCompatTheme_popupMenuStyle /*82*/:
                m1988e(0, keyEvent);
                return true;
        }
        return false;
    }

    boolean mo307b(int i, Menu menu) {
        if (i != C0410j.AppCompatTheme_tooltipFrameBackground) {
            return false;
        }
        C0428a a = mo281a();
        if (a == null) {
            return true;
        }
        a.mo339e(true);
        return true;
    }

    public boolean mo308c(int i) {
        int h = m1989h(i);
        if (this.l && h == C0410j.AppCompatTheme_tooltipFrameBackground) {
            return false;
        }
        if (this.h && h == 1) {
            this.h = false;
        }
        switch (h) {
            case 1:
                m1993z();
                this.l = true;
                return true;
            case 2:
                m1993z();
                this.f1261B = true;
                return true;
            case 5:
                m1993z();
                this.f1262C = true;
                return true;
            case 10:
                m1993z();
                this.j = true;
                return true;
            case C0410j.AppCompatTheme_tooltipFrameBackground /*108*/:
                m1993z();
                this.h = true;
                return true;
            case C0410j.AppCompatTheme_windowActionBar /*109*/:
                m1993z();
                this.i = true;
                return true;
            default:
                return this.b.requestFeature(h);
        }
    }

    boolean m2021c(int i, KeyEvent keyEvent) {
        boolean z = true;
        switch (i) {
            case 4:
                if ((keyEvent.getFlags() & 128) == 0) {
                    z = false;
                }
                this.f1266G = z;
                break;
            case C0410j.AppCompatTheme_popupMenuStyle /*82*/:
                m1987d(0, keyEvent);
                return true;
        }
        if (VERSION.SDK_INT < 11) {
            mo300a(i, keyEvent);
        }
        return false;
    }

    public void mo286d() {
        C0428a a = mo281a();
        if (a != null) {
            a.mo337d(false);
        }
    }

    public void mo309e() {
        C0428a a = mo281a();
        if (a != null) {
            a.mo337d(true);
        }
    }

    void m2024e(int i) {
        m2003a(m1994a(i, true), true);
    }

    public void mo310f() {
        C0428a a = mo281a();
        if (a == null || !a.mo340e()) {
            mo315d(0);
        }
    }

    void m2026f(int i) {
        C0465d a = m1994a(i, true);
        if (a.f1325j != null) {
            Bundle bundle = new Bundle();
            a.f1325j.m2440a(bundle);
            if (bundle.size() > 0) {
                a.f1334s = bundle;
            }
            a.f1325j.m2467g();
            a.f1325j.clear();
        }
        a.f1333r = true;
        a.f1332q = true;
        if ((i == C0410j.AppCompatTheme_tooltipFrameBackground || i == 0) && this.f1279u != null) {
            a = m1994a(0, false);
            if (a != null) {
                a.f1328m = false;
                m1984b(a, null);
            }
        }
    }

    int m2027g(int i) {
        int i2;
        int i3 = 1;
        int i4 = 0;
        if (this.f1273n == null || !(this.f1273n.getLayoutParams() instanceof MarginLayoutParams)) {
            i2 = 0;
        } else {
            int i5;
            MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.f1273n.getLayoutParams();
            if (this.f1273n.isShown()) {
                if (this.f1269J == null) {
                    this.f1269J = new Rect();
                    this.f1270K = new Rect();
                }
                Rect rect = this.f1269J;
                Rect rect2 = this.f1270K;
                rect.set(0, i, 0, 0);
                bc.m3034a(this.f1283y, rect, rect2);
                if (marginLayoutParams.topMargin != (rect2.top == 0 ? i : 0)) {
                    marginLayoutParams.topMargin = i;
                    if (this.f1260A == null) {
                        this.f1260A = new View(this.a);
                        this.f1260A.setBackgroundColor(this.a.getResources().getColor(C0403c.abc_input_method_navigation_guard));
                        this.f1283y.addView(this.f1260A, -1, new LayoutParams(-1, i));
                        i5 = 1;
                    } else {
                        LayoutParams layoutParams = this.f1260A.getLayoutParams();
                        if (layoutParams.height != i) {
                            layoutParams.height = i;
                            this.f1260A.setLayoutParams(layoutParams);
                        }
                        i5 = 1;
                    }
                } else {
                    i5 = 0;
                }
                if (this.f1260A == null) {
                    i3 = 0;
                }
                if (!(this.j || i3 == 0)) {
                    i = 0;
                }
                int i6 = i5;
                i5 = i3;
                i3 = i6;
            } else if (marginLayoutParams.topMargin != 0) {
                marginLayoutParams.topMargin = 0;
                i5 = 0;
            } else {
                i3 = 0;
                i5 = 0;
            }
            if (i3 != 0) {
                this.f1273n.setLayoutParams(marginLayoutParams);
            }
            i2 = i5;
        }
        if (this.f1260A != null) {
            View view = this.f1260A;
            if (i2 == 0) {
                i4 = 8;
            }
            view.setVisibility(i4);
        }
        return i;
    }

    public void mo287g() {
        if (this.f1277r) {
            this.b.getDecorView().removeCallbacks(this.f1267H);
        }
        super.mo287g();
        if (this.f != null) {
            this.f.mo342g();
        }
    }

    public void mo311h() {
        LayoutInflater from = LayoutInflater.from(this.a);
        if (from.getFactory() == null) {
            C0290e.m1273b(from, this);
        } else if (!(from.getFactory2() instanceof C0443k)) {
            Log.i("AppCompatDelegate", "The Activity's LayoutInflater already has a Factory installed so we can not install AppCompat's");
        }
    }

    public void mo312l() {
        m1990w();
        if (this.h && this.f == null) {
            if (this.c instanceof Activity) {
                this.f = new C0482r((Activity) this.c, this.i);
            } else if (this.c instanceof Dialog) {
                this.f = new C0482r((Dialog) this.c);
            }
            if (this.f != null) {
                this.f.mo335c(this.f1268I);
            }
        }
    }

    public final View onCreateView(View view, String str, Context context, AttributeSet attributeSet) {
        View a = mo313a(view, str, context, attributeSet);
        return a != null ? a : m2012b(view, str, context, attributeSet);
    }

    public View onCreateView(String str, Context context, AttributeSet attributeSet) {
        return onCreateView(null, str, context, attributeSet);
    }

    final boolean m2031s() {
        return this.f1282x && this.f1283y != null && C0315p.m1397l(this.f1283y);
    }

    void m2032t() {
        if (this.f1276q != null) {
            this.f1276q.m1436b();
        }
    }

    boolean m2033u() {
        if (this.f1272m != null) {
            this.f1272m.mo352c();
            return true;
        }
        C0428a a = mo281a();
        return a != null && a.mo341f();
    }

    void m2034v() {
        if (this.f1279u != null) {
            this.f1279u.mo462k();
        }
        if (this.f1274o != null) {
            this.b.getDecorView().removeCallbacks(this.f1275p);
            if (this.f1274o.isShowing()) {
                try {
                    this.f1274o.dismiss();
                } catch (IllegalArgumentException e) {
                }
            }
            this.f1274o = null;
        }
        m2032t();
        C0465d a = m1994a(0, false);
        if (a != null && a.f1325j != null) {
            a.f1325j.close();
        }
    }
}
