package android.support.v7.view.menu;

import android.content.Context;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Build.VERSION;
import android.support.v4.p017h.C0287d;
import android.support.v4.p017h.C0315p;
import android.support.v7.p020a.C0411a.C0404d;
import android.support.v7.view.menu.C0506o.C0459a;
import android.view.Display;
import android.view.View;
import android.view.WindowManager;
import android.widget.PopupWindow.OnDismissListener;

public class C0533n {
    private final Context f1702a;
    private final C0521h f1703b;
    private final boolean f1704c;
    private final int f1705d;
    private final int f1706e;
    private View f1707f;
    private int f1708g;
    private boolean f1709h;
    private C0459a f1710i;
    private C0516m f1711j;
    private OnDismissListener f1712k;
    private final OnDismissListener f1713l;

    class C05321 implements OnDismissListener {
        final /* synthetic */ C0533n f1701a;

        C05321(C0533n c0533n) {
            this.f1701a = c0533n;
        }

        public void onDismiss() {
            this.f1701a.mo528e();
        }
    }

    public C0533n(Context context, C0521h c0521h, View view, boolean z, int i) {
        this(context, c0521h, view, z, i, 0);
    }

    public C0533n(Context context, C0521h c0521h, View view, boolean z, int i, int i2) {
        this.f1708g = 8388611;
        this.f1713l = new C05321(this);
        this.f1702a = context;
        this.f1703b = c0521h;
        this.f1707f = view;
        this.f1704c = z;
        this.f1705d = i;
        this.f1706e = i2;
    }

    private void m2527a(int i, int i2, boolean z, boolean z2) {
        C0516m b = m2536b();
        b.mo421c(z2);
        if (z) {
            if ((C0287d.m1269a(this.f1708g, C0315p.m1387b(this.f1707f)) & 7) == 5) {
                i += this.f1707f.getWidth();
            }
            b.mo418b(i);
            b.mo420c(i2);
            int i3 = (int) ((this.f1702a.getResources().getDisplayMetrics().density * 48.0f) / 2.0f);
            b.m2368a(new Rect(i - i3, i2 - i3, i + i3, i3 + i2));
        }
        b.mo412a();
    }

    private C0516m m2528g() {
        Display defaultDisplay = ((WindowManager) this.f1702a.getSystemService("window")).getDefaultDisplay();
        Point point = new Point();
        if (VERSION.SDK_INT >= 17) {
            defaultDisplay.getRealSize(point);
        } else {
            defaultDisplay.getSize(point);
        }
        C0516m c0517e = (Math.min(point.x, point.y) >= this.f1702a.getResources().getDimensionPixelSize(C0404d.abc_cascading_menus_min_smallest_width) ? 1 : null) != null ? new C0517e(this.f1702a, this.f1707f, this.f1705d, this.f1706e, this.f1704c) : new C0538t(this.f1702a, this.f1703b, this.f1707f, this.f1705d, this.f1706e, this.f1704c);
        c0517e.mo414a(this.f1703b);
        c0517e.mo416a(this.f1713l);
        c0517e.mo415a(this.f1707f);
        c0517e.mo404a(this.f1710i);
        c0517e.mo417a(this.f1709h);
        c0517e.mo413a(this.f1708g);
        return c0517e;
    }

    public void m2529a() {
        if (!m2537c()) {
            throw new IllegalStateException("MenuPopupHelper cannot be used without an anchor");
        }
    }

    public void m2530a(int i) {
        this.f1708g = i;
    }

    public void m2531a(C0459a c0459a) {
        this.f1710i = c0459a;
        if (this.f1711j != null) {
            this.f1711j.mo404a(c0459a);
        }
    }

    public void m2532a(View view) {
        this.f1707f = view;
    }

    public void m2533a(OnDismissListener onDismissListener) {
        this.f1712k = onDismissListener;
    }

    public void m2534a(boolean z) {
        this.f1709h = z;
        if (this.f1711j != null) {
            this.f1711j.mo417a(z);
        }
    }

    public boolean m2535a(int i, int i2) {
        if (m2540f()) {
            return true;
        }
        if (this.f1707f == null) {
            return false;
        }
        m2527a(i, i2, true, true);
        return true;
    }

    public C0516m m2536b() {
        if (this.f1711j == null) {
            this.f1711j = m2528g();
        }
        return this.f1711j;
    }

    public boolean m2537c() {
        if (m2540f()) {
            return true;
        }
        if (this.f1707f == null) {
            return false;
        }
        m2527a(0, 0, false, false);
        return true;
    }

    public void m2538d() {
        if (m2540f()) {
            this.f1711j.mo419c();
        }
    }

    protected void mo528e() {
        this.f1711j = null;
        if (this.f1712k != null) {
            this.f1712k.onDismiss();
        }
    }

    public boolean m2540f() {
        return this.f1711j != null && this.f1711j.mo422d();
    }
}
