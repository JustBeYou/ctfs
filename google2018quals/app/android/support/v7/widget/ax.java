package android.support.v7.widget;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.v4.p017h.C0315p;
import android.support.v4.p017h.C0324r;
import android.support.v4.p017h.C0325t;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.p020a.C0411a.C0405e;
import android.support.v7.p020a.C0411a.C0406f;
import android.support.v7.p020a.C0411a.C0408h;
import android.support.v7.p020a.C0411a.C0410j;
import android.support.v7.p021b.p022a.C0485b;
import android.support.v7.view.menu.C0505a;
import android.support.v7.view.menu.C0506o.C0459a;
import android.support.v7.view.menu.C0521h;
import android.support.v7.view.menu.C0521h.C0442a;
import android.support.v7.widget.Toolbar.C0567b;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.Window.Callback;

public class ax implements ad {
    Toolbar f2140a;
    CharSequence f2141b;
    Callback f2142c;
    boolean f2143d;
    private int f2144e;
    private View f2145f;
    private View f2146g;
    private Drawable f2147h;
    private Drawable f2148i;
    private Drawable f2149j;
    private boolean f2150k;
    private CharSequence f2151l;
    private CharSequence f2152m;
    private C0607d f2153n;
    private int f2154o;
    private int f2155p;
    private Drawable f2156q;

    class C05891 implements OnClickListener {
        final C0505a f2135a = new C0505a(this.f2136b.f2140a.getContext(), 0, 16908332, 0, 0, this.f2136b.f2141b);
        final /* synthetic */ ax f2136b;

        C05891(ax axVar) {
            this.f2136b = axVar;
        }

        public void onClick(View view) {
            if (this.f2136b.f2142c != null && this.f2136b.f2143d) {
                this.f2136b.f2142c.onMenuItemSelected(0, this.f2135a);
            }
        }
    }

    public ax(Toolbar toolbar, boolean z) {
        this(toolbar, z, C0408h.abc_action_bar_up_description, C0405e.abc_ic_ab_back_material);
    }

    public ax(Toolbar toolbar, boolean z, int i, int i2) {
        this.f2154o = 0;
        this.f2155p = 0;
        this.f2140a = toolbar;
        this.f2141b = toolbar.getTitle();
        this.f2151l = toolbar.getSubtitle();
        this.f2150k = this.f2141b != null;
        this.f2149j = toolbar.getNavigationIcon();
        aw a = aw.m2953a(toolbar.getContext(), null, C0410j.ActionBar, C0401a.actionBarStyle, 0);
        this.f2156q = a.m2957a(C0410j.ActionBar_homeAsUpIndicator);
        if (z) {
            CharSequence c = a.m2963c(C0410j.ActionBar_title);
            if (!TextUtils.isEmpty(c)) {
                m2994b(c);
            }
            c = a.m2963c(C0410j.ActionBar_subtitle);
            if (!TextUtils.isEmpty(c)) {
                m2998c(c);
            }
            Drawable a2 = a.m2957a(C0410j.ActionBar_logo);
            if (a2 != null) {
                m2993b(a2);
            }
            a2 = a.m2957a(C0410j.ActionBar_icon);
            if (a2 != null) {
                mo500a(a2);
            }
            if (this.f2149j == null && this.f2156q != null) {
                m2997c(this.f2156q);
            }
            mo510c(a.m2955a(C0410j.ActionBar_displayOptions, 0));
            int g = a.m2970g(C0410j.ActionBar_customNavigationLayout, 0);
            if (g != 0) {
                m2987a(LayoutInflater.from(this.f2140a.getContext()).inflate(g, this.f2140a, false));
                mo510c(this.f2144e | 16);
            }
            g = a.m2968f(C0410j.ActionBar_height, 0);
            if (g > 0) {
                LayoutParams layoutParams = this.f2140a.getLayoutParams();
                layoutParams.height = g;
                this.f2140a.setLayoutParams(layoutParams);
            }
            g = a.m2964d(C0410j.ActionBar_contentInsetStart, -1);
            int d = a.m2964d(C0410j.ActionBar_contentInsetEnd, -1);
            if (g >= 0 || d >= 0) {
                this.f2140a.m2763a(Math.max(g, 0), Math.max(d, 0));
            }
            g = a.m2970g(C0410j.ActionBar_titleTextStyle, 0);
            if (g != 0) {
                this.f2140a.m2764a(this.f2140a.getContext(), g);
            }
            g = a.m2970g(C0410j.ActionBar_subtitleTextStyle, 0);
            if (g != 0) {
                this.f2140a.m2768b(this.f2140a.getContext(), g);
            }
            int g2 = a.m2970g(C0410j.ActionBar_popupTheme, 0);
            if (g2 != 0) {
                this.f2140a.setPopupTheme(g2);
            }
        } else {
            this.f2144e = m2976r();
        }
        a.m2958a();
        m3004e(i);
        this.f2152m = this.f2140a.getNavigationContentDescription();
        this.f2140a.setNavigationOnClickListener(new C05891(this));
    }

    private void m2975e(CharSequence charSequence) {
        this.f2141b = charSequence;
        if ((this.f2144e & 8) != 0) {
            this.f2140a.setTitle(charSequence);
        }
    }

    private int m2976r() {
        if (this.f2140a.getNavigationIcon() == null) {
            return 11;
        }
        this.f2156q = this.f2140a.getNavigationIcon();
        return 15;
    }

    private void m2977s() {
        Drawable drawable = null;
        if ((this.f2144e & 2) != 0) {
            drawable = (this.f2144e & 1) != 0 ? this.f2148i != null ? this.f2148i : this.f2147h : this.f2147h;
        }
        this.f2140a.setLogo(drawable);
    }

    private void m2978t() {
        if ((this.f2144e & 4) != 0) {
            this.f2140a.setNavigationIcon(this.f2149j != null ? this.f2149j : this.f2156q);
        } else {
            this.f2140a.setNavigationIcon(null);
        }
    }

    private void m2979u() {
        if ((this.f2144e & 4) == 0) {
            return;
        }
        if (TextUtils.isEmpty(this.f2152m)) {
            this.f2140a.setNavigationContentDescription(this.f2155p);
        } else {
            this.f2140a.setNavigationContentDescription(this.f2152m);
        }
    }

    public C0324r mo497a(final int i, long j) {
        return C0315p.m1389d(this.f2140a).m1429a(i == 0 ? 1.0f : 0.0f).m1430a(j).m1431a(new C0325t(this) {
            final /* synthetic */ ax f2138b;
            private boolean f2139c = false;

            public void mo155a(View view) {
                this.f2138b.f2140a.setVisibility(0);
            }

            public void mo156b(View view) {
                if (!this.f2139c) {
                    this.f2138b.f2140a.setVisibility(i);
                }
            }

            public void mo157c(View view) {
                this.f2139c = true;
            }
        });
    }

    public ViewGroup mo498a() {
        return this.f2140a;
    }

    public void mo499a(int i) {
        mo500a(i != 0 ? C0485b.m2214b(mo507b(), i) : null);
    }

    public void mo500a(Drawable drawable) {
        this.f2147h = drawable;
        m2977s();
    }

    public void mo501a(C0459a c0459a, C0442a c0442a) {
        this.f2140a.m2766a(c0459a, c0442a);
    }

    public void mo502a(ap apVar) {
        if (this.f2145f != null && this.f2145f.getParent() == this.f2140a) {
            this.f2140a.removeView(this.f2145f);
        }
        this.f2145f = apVar;
        if (apVar != null && this.f2154o == 2) {
            this.f2140a.addView(this.f2145f, 0);
            C0567b c0567b = (C0567b) this.f2145f.getLayoutParams();
            c0567b.width = -2;
            c0567b.height = -2;
            c0567b.a = 8388691;
            apVar.setAllowCollapse(true);
        }
    }

    public void mo503a(Menu menu, C0459a c0459a) {
        if (this.f2153n == null) {
            this.f2153n = new C0607d(this.f2140a.getContext());
            this.f2153n.m2335a(C0406f.action_menu_presenter);
        }
        this.f2153n.mo404a(c0459a);
        this.f2140a.m2765a((C0521h) menu, this.f2153n);
    }

    public void m2987a(View view) {
        if (!(this.f2146g == null || (this.f2144e & 16) == 0)) {
            this.f2140a.removeView(this.f2146g);
        }
        this.f2146g = view;
        if (view != null && (this.f2144e & 16) != 0) {
            this.f2140a.addView(this.f2146g);
        }
    }

    public void mo504a(Callback callback) {
        this.f2142c = callback;
    }

    public void mo505a(CharSequence charSequence) {
        if (!this.f2150k) {
            m2975e(charSequence);
        }
    }

    public void mo506a(boolean z) {
        this.f2140a.setCollapsible(z);
    }

    public Context mo507b() {
        return this.f2140a.getContext();
    }

    public void mo508b(int i) {
        m2993b(i != 0 ? C0485b.m2214b(mo507b(), i) : null);
    }

    public void m2993b(Drawable drawable) {
        this.f2148i = drawable;
        m2977s();
    }

    public void m2994b(CharSequence charSequence) {
        this.f2150k = true;
        m2975e(charSequence);
    }

    public void mo509b(boolean z) {
    }

    public void mo510c(int i) {
        int i2 = this.f2144e ^ i;
        this.f2144e = i;
        if (i2 != 0) {
            if ((i2 & 4) != 0) {
                if ((i & 4) != 0) {
                    m2979u();
                }
                m2978t();
            }
            if ((i2 & 3) != 0) {
                m2977s();
            }
            if ((i2 & 8) != 0) {
                if ((i & 8) != 0) {
                    this.f2140a.setTitle(this.f2141b);
                    this.f2140a.setSubtitle(this.f2151l);
                } else {
                    this.f2140a.setTitle(null);
                    this.f2140a.setSubtitle(null);
                }
            }
            if ((i2 & 16) != 0 && this.f2146g != null) {
                if ((i & 16) != 0) {
                    this.f2140a.addView(this.f2146g);
                } else {
                    this.f2140a.removeView(this.f2146g);
                }
            }
        }
    }

    public void m2997c(Drawable drawable) {
        this.f2149j = drawable;
        m2978t();
    }

    public void m2998c(CharSequence charSequence) {
        this.f2151l = charSequence;
        if ((this.f2144e & 8) != 0) {
            this.f2140a.setSubtitle(charSequence);
        }
    }

    public boolean mo511c() {
        return this.f2140a.m2774g();
    }

    public void mo512d() {
        this.f2140a.m2775h();
    }

    public void mo513d(int i) {
        this.f2140a.setVisibility(i);
    }

    public void m3002d(CharSequence charSequence) {
        this.f2152m = charSequence;
        m2979u();
    }

    public CharSequence mo514e() {
        return this.f2140a.getTitle();
    }

    public void m3004e(int i) {
        if (i != this.f2155p) {
            this.f2155p = i;
            if (TextUtils.isEmpty(this.f2140a.getNavigationContentDescription())) {
                m3006f(this.f2155p);
            }
        }
    }

    public void mo515f() {
        Log.i("ToolbarWidgetWrapper", "Progress display unsupported");
    }

    public void m3006f(int i) {
        m3002d(i == 0 ? null : mo507b().getString(i));
    }

    public void mo516g() {
        Log.i("ToolbarWidgetWrapper", "Progress display unsupported");
    }

    public boolean mo517h() {
        return this.f2140a.m2767a();
    }

    public boolean mo518i() {
        return this.f2140a.m2769b();
    }

    public boolean mo519j() {
        return this.f2140a.m2770c();
    }

    public boolean mo520k() {
        return this.f2140a.m2771d();
    }

    public boolean mo521l() {
        return this.f2140a.m2772e();
    }

    public void mo522m() {
        this.f2143d = true;
    }

    public void mo523n() {
        this.f2140a.m2773f();
    }

    public int mo524o() {
        return this.f2144e;
    }

    public int mo525p() {
        return this.f2154o;
    }

    public Menu mo526q() {
        return this.f2140a.getMenu();
    }
}
