package android.support.v7.app;

import android.content.Context;
import android.content.res.Configuration;
import android.support.v4.p017h.C0315p;
import android.support.v7.app.C0428a.C0426b;
import android.support.v7.p020a.C0411a.C0410j;
import android.support.v7.view.menu.C0506o.C0459a;
import android.support.v7.view.menu.C0521h;
import android.support.v7.view.menu.C0521h.C0442a;
import android.support.v7.widget.ad;
import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.Window.Callback;
import java.util.ArrayList;

class C0472o extends C0428a {
    ad f1356a;
    Callback f1357b;
    private boolean f1358c;
    private boolean f1359d;
    private ArrayList<C0426b> f1360e;
    private final Runnable f1361f;

    private final class C0470a implements C0459a {
        final /* synthetic */ C0472o f1353a;
        private boolean f1354b;

        C0470a(C0472o c0472o) {
            this.f1353a = c0472o;
        }

        public void mo321a(C0521h c0521h, boolean z) {
            if (!this.f1354b) {
                this.f1354b = true;
                this.f1353a.f1356a.mo523n();
                if (this.f1353a.f1357b != null) {
                    this.f1353a.f1357b.onPanelClosed(C0410j.AppCompatTheme_tooltipFrameBackground, c0521h);
                }
                this.f1354b = false;
            }
        }

        public boolean mo322a(C0521h c0521h) {
            if (this.f1353a.f1357b == null) {
                return false;
            }
            this.f1353a.f1357b.onMenuOpened(C0410j.AppCompatTheme_tooltipFrameBackground, c0521h);
            return true;
        }
    }

    private final class C0471b implements C0442a {
        final /* synthetic */ C0472o f1355a;

        C0471b(C0472o c0472o) {
            this.f1355a = c0472o;
        }

        public void mo297a(C0521h c0521h) {
            if (this.f1355a.f1357b == null) {
                return;
            }
            if (this.f1355a.f1356a.mo518i()) {
                this.f1355a.f1357b.onPanelClosed(C0410j.AppCompatTheme_tooltipFrameBackground, c0521h);
            } else if (this.f1355a.f1357b.onPreparePanel(0, null, c0521h)) {
                this.f1355a.f1357b.onMenuOpened(C0410j.AppCompatTheme_tooltipFrameBackground, c0521h);
            }
        }

        public boolean mo301a(C0521h c0521h, MenuItem menuItem) {
            return false;
        }
    }

    private Menu m2104h() {
        if (!this.f1358c) {
            this.f1356a.mo501a(new C0470a(this), new C0471b(this));
            this.f1358c = true;
        }
        return this.f1356a.mo526q();
    }

    public int mo327a() {
        return this.f1356a.mo524o();
    }

    public void mo328a(float f) {
        C0315p.m1378a(this.f1356a.mo498a(), f);
    }

    public void mo329a(Configuration configuration) {
        super.mo329a(configuration);
    }

    public void mo330a(CharSequence charSequence) {
        this.f1356a.mo505a(charSequence);
    }

    public void mo331a(boolean z) {
    }

    public boolean mo332a(int i, KeyEvent keyEvent) {
        Menu h = m2104h();
        if (h == null) {
            return false;
        }
        h.setQwertyMode(KeyCharacterMap.load(keyEvent != null ? keyEvent.getDeviceId() : -1).getKeyboardType() != 1);
        return h.performShortcut(i, keyEvent, 0);
    }

    public boolean mo333a(KeyEvent keyEvent) {
        if (keyEvent.getAction() == 1) {
            mo336c();
        }
        return true;
    }

    public Context mo334b() {
        return this.f1356a.mo507b();
    }

    public void mo335c(boolean z) {
    }

    public boolean mo336c() {
        return this.f1356a.mo520k();
    }

    public void mo337d(boolean z) {
    }

    public boolean mo338d() {
        return this.f1356a.mo521l();
    }

    public void mo339e(boolean z) {
        if (z != this.f1359d) {
            this.f1359d = z;
            int size = this.f1360e.size();
            for (int i = 0; i < size; i++) {
                ((C0426b) this.f1360e.get(i)).m1873a(z);
            }
        }
    }

    public boolean mo340e() {
        this.f1356a.mo498a().removeCallbacks(this.f1361f);
        C0315p.m1385a(this.f1356a.mo498a(), this.f1361f);
        return true;
    }

    public boolean mo341f() {
        if (!this.f1356a.mo511c()) {
            return false;
        }
        this.f1356a.mo512d();
        return true;
    }

    void mo342g() {
        this.f1356a.mo498a().removeCallbacks(this.f1361f);
    }
}
