package android.support.v7.view.menu;

import android.content.Context;
import android.content.res.Resources;
import android.support.v7.p020a.C0411a.C0404d;
import android.support.v7.p020a.C0411a.C0407g;
import android.support.v7.view.menu.C0506o.C0459a;
import android.support.v7.widget.am;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnAttachStateChangeListener;
import android.view.View.OnKeyListener;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.FrameLayout;
import android.widget.ListView;
import android.widget.PopupWindow.OnDismissListener;
import android.widget.TextView;

final class C0538t extends C0516m implements C0506o, OnKeyListener, OnItemClickListener, OnDismissListener {
    final am f1716a;
    View f1717b;
    private final Context f1718c;
    private final C0521h f1719d;
    private final C0520g f1720e;
    private final boolean f1721f;
    private final int f1722g;
    private final int f1723h;
    private final int f1724i;
    private final OnGlobalLayoutListener f1725j = new C05361(this);
    private final OnAttachStateChangeListener f1726k = new C05372(this);
    private OnDismissListener f1727l;
    private View f1728m;
    private C0459a f1729n;
    private ViewTreeObserver f1730o;
    private boolean f1731p;
    private boolean f1732q;
    private int f1733r;
    private int f1734s = 0;
    private boolean f1735t;

    class C05361 implements OnGlobalLayoutListener {
        final /* synthetic */ C0538t f1714a;

        C05361(C0538t c0538t) {
            this.f1714a = c0538t;
        }

        public void onGlobalLayout() {
            if (this.f1714a.mo422d() && !this.f1714a.f1716a.m2883g()) {
                View view = this.f1714a.f1717b;
                if (view == null || !view.isShown()) {
                    this.f1714a.mo419c();
                } else {
                    this.f1714a.f1716a.mo412a();
                }
            }
        }
    }

    class C05372 implements OnAttachStateChangeListener {
        final /* synthetic */ C0538t f1715a;

        C05372(C0538t c0538t) {
            this.f1715a = c0538t;
        }

        public void onViewAttachedToWindow(View view) {
        }

        public void onViewDetachedFromWindow(View view) {
            if (this.f1715a.f1730o != null) {
                if (!this.f1715a.f1730o.isAlive()) {
                    this.f1715a.f1730o = view.getViewTreeObserver();
                }
                this.f1715a.f1730o.removeGlobalOnLayoutListener(this.f1715a.f1725j);
            }
            view.removeOnAttachStateChangeListener(this);
        }
    }

    public C0538t(Context context, C0521h c0521h, View view, int i, int i2, boolean z) {
        this.f1718c = context;
        this.f1719d = c0521h;
        this.f1721f = z;
        this.f1720e = new C0520g(c0521h, LayoutInflater.from(context), this.f1721f);
        this.f1723h = i;
        this.f1724i = i2;
        Resources resources = context.getResources();
        this.f1722g = Math.max(resources.getDisplayMetrics().widthPixels / 2, resources.getDimensionPixelSize(C0404d.abc_config_prefDialogWidth));
        this.f1728m = view;
        this.f1716a = new am(this.f1718c, null, this.f1723h, this.f1724i);
        c0521h.m2444a((C0506o) this, context);
    }

    private boolean m2547h() {
        if (mo422d()) {
            return true;
        }
        if (this.f1731p || this.f1728m == null) {
            return false;
        }
        this.f1717b = this.f1728m;
        this.f1716a.m2870a((OnDismissListener) this);
        this.f1716a.m2868a((OnItemClickListener) this);
        this.f1716a.m2871a(true);
        View view = this.f1717b;
        boolean z = this.f1730o == null;
        this.f1730o = view.getViewTreeObserver();
        if (z) {
            this.f1730o.addOnGlobalLayoutListener(this.f1725j);
        }
        view.addOnAttachStateChangeListener(this.f1726k);
        this.f1716a.m2873b(view);
        this.f1716a.m2880e(this.f1734s);
        if (!this.f1732q) {
            this.f1733r = C0516m.m2363a(this.f1720e, null, this.f1718c, this.f1722g);
            this.f1732q = true;
        }
        this.f1716a.m2882g(this.f1733r);
        this.f1716a.m2885h(2);
        this.f1716a.m2866a(m2379g());
        this.f1716a.mo412a();
        ViewGroup e = this.f1716a.mo423e();
        e.setOnKeyListener(this);
        if (this.f1735t && this.f1719d.m2473m() != null) {
            FrameLayout frameLayout = (FrameLayout) LayoutInflater.from(this.f1718c).inflate(C0407g.abc_popup_menu_header_item_layout, e, false);
            TextView textView = (TextView) frameLayout.findViewById(16908310);
            if (textView != null) {
                textView.setText(this.f1719d.m2473m());
            }
            frameLayout.setEnabled(false);
            e.addHeaderView(frameLayout, null, false);
        }
        this.f1716a.mo547a(this.f1720e);
        this.f1716a.mo412a();
        return true;
    }

    public void mo412a() {
        if (!m2547h()) {
            throw new IllegalStateException("StandardMenuPopup cannot be used without an anchor");
        }
    }

    public void mo413a(int i) {
        this.f1734s = i;
    }

    public void mo414a(C0521h c0521h) {
    }

    public void mo403a(C0521h c0521h, boolean z) {
        if (c0521h == this.f1719d) {
            mo419c();
            if (this.f1729n != null) {
                this.f1729n.mo321a(c0521h, z);
            }
        }
    }

    public void mo404a(C0459a c0459a) {
        this.f1729n = c0459a;
    }

    public void mo415a(View view) {
        this.f1728m = view;
    }

    public void mo416a(OnDismissListener onDismissListener) {
        this.f1727l = onDismissListener;
    }

    public void mo417a(boolean z) {
        this.f1720e.m2422a(z);
    }

    public boolean mo406a(C0539u c0539u) {
        if (c0539u.hasVisibleItems()) {
            C0533n c0533n = new C0533n(this.f1718c, c0539u, this.f1717b, this.f1721f, this.f1723h, this.f1724i);
            c0533n.m2531a(this.f1729n);
            c0533n.m2534a(C0516m.m2365b((C0521h) c0539u));
            c0533n.m2530a(this.f1734s);
            c0533n.m2533a(this.f1727l);
            this.f1727l = null;
            this.f1719d.m2447a(false);
            if (c0533n.m2535a(this.f1716a.m2888j(), this.f1716a.m2889k())) {
                if (this.f1729n != null) {
                    this.f1729n.mo322a(c0539u);
                }
                return true;
            }
        }
        return false;
    }

    public void mo418b(int i) {
        this.f1716a.m2876c(i);
    }

    public void mo407b(boolean z) {
        this.f1732q = false;
        if (this.f1720e != null) {
            this.f1720e.notifyDataSetChanged();
        }
    }

    public boolean mo408b() {
        return false;
    }

    public void mo419c() {
        if (mo422d()) {
            this.f1716a.mo419c();
        }
    }

    public void mo420c(int i) {
        this.f1716a.m2877d(i);
    }

    public void mo421c(boolean z) {
        this.f1735t = z;
    }

    public boolean mo422d() {
        return !this.f1731p && this.f1716a.mo422d();
    }

    public ListView mo423e() {
        return this.f1716a.mo423e();
    }

    public void onDismiss() {
        this.f1731p = true;
        this.f1719d.close();
        if (this.f1730o != null) {
            if (!this.f1730o.isAlive()) {
                this.f1730o = this.f1717b.getViewTreeObserver();
            }
            this.f1730o.removeGlobalOnLayoutListener(this.f1725j);
            this.f1730o = null;
        }
        this.f1717b.removeOnAttachStateChangeListener(this.f1726k);
        if (this.f1727l != null) {
            this.f1727l.onDismiss();
        }
    }

    public boolean onKey(View view, int i, KeyEvent keyEvent) {
        if (keyEvent.getAction() != 1 || i != 82) {
            return false;
        }
        mo419c();
        return true;
    }
}
