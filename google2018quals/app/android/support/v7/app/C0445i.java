package android.support.v7.app;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.v7.app.C0438f.C0437a;
import android.support.v7.view.C0479b;
import android.support.v7.view.C0479b.C0462a;
import android.support.v7.view.C0493f.C0492a;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.ActionMode;
import android.view.Window;
import android.view.Window.Callback;

class C0445i extends C0444h {
    private int f1285t = -100;
    private boolean f1286u;
    private boolean f1287v = true;
    private C0449b f1288w;

    class C0439a extends C0437a {
        final /* synthetic */ C0445i f1256c;

        C0439a(C0445i c0445i, Callback callback) {
            this.f1256c = c0445i;
            super(c0445i, callback);
        }

        final ActionMode m1975a(ActionMode.Callback callback) {
            Object c0492a = new C0492a(this.f1256c.a, callback);
            C0479b b = this.f1256c.m2011b((C0462a) c0492a);
            return b != null ? c0492a.m2257b(b) : null;
        }

        public ActionMode onWindowStartingActionMode(ActionMode.Callback callback) {
            return this.f1256c.mo316o() ? m1975a(callback) : super.onWindowStartingActionMode(callback);
        }
    }

    final class C0449b {
        final /* synthetic */ C0445i f1291a;
        private C0475q f1292b;
        private boolean f1293c;
        private BroadcastReceiver f1294d;
        private IntentFilter f1295e;

        class C04481 extends BroadcastReceiver {
            final /* synthetic */ C0449b f1290a;

            C04481(C0449b c0449b) {
                this.f1290a = c0449b;
            }

            public void onReceive(Context context, Intent intent) {
                this.f1290a.m2053b();
            }
        }

        C0449b(C0445i c0445i, C0475q c0475q) {
            this.f1291a = c0445i;
            this.f1292b = c0475q;
            this.f1293c = c0475q.m2128a();
        }

        final int m2052a() {
            this.f1293c = this.f1292b.m2128a();
            return this.f1293c ? 2 : 1;
        }

        final void m2053b() {
            boolean a = this.f1292b.m2128a();
            if (a != this.f1293c) {
                this.f1293c = a;
                this.f1291a.mo288i();
            }
        }

        final void m2054c() {
            m2055d();
            if (this.f1294d == null) {
                this.f1294d = new C04481(this);
            }
            if (this.f1295e == null) {
                this.f1295e = new IntentFilter();
                this.f1295e.addAction("android.intent.action.TIME_SET");
                this.f1295e.addAction("android.intent.action.TIMEZONE_CHANGED");
                this.f1295e.addAction("android.intent.action.TIME_TICK");
            }
            this.f1291a.a.registerReceiver(this.f1294d, this.f1295e);
        }

        final void m2055d() {
            if (this.f1294d != null) {
                this.f1291a.a.unregisterReceiver(this.f1294d);
                this.f1294d = null;
            }
        }
    }

    C0445i(Context context, Window window, C0430d c0430d) {
        super(context, window, c0430d);
    }

    private boolean m2036h(int i) {
        Resources resources = this.a.getResources();
        Configuration configuration = resources.getConfiguration();
        int i2 = configuration.uiMode & 48;
        int i3 = i == 2 ? 32 : 16;
        if (i2 == i3) {
            return false;
        }
        if (m2039y()) {
            ((Activity) this.a).recreate();
        } else {
            Configuration configuration2 = new Configuration(configuration);
            DisplayMetrics displayMetrics = resources.getDisplayMetrics();
            configuration2.uiMode = i3 | (configuration2.uiMode & -49);
            resources.updateConfiguration(configuration2, displayMetrics);
            if (VERSION.SDK_INT < 26) {
                C0469n.m2095a(resources);
            }
        }
        return true;
    }

    private int m2037w() {
        return this.f1285t != -100 ? this.f1285t : C0434e.m1930j();
    }

    private void m2038x() {
        if (this.f1288w == null) {
            this.f1288w = new C0449b(this, C0475q.m2124a(this.a));
        }
    }

    private boolean m2039y() {
        if (!this.f1286u || !(this.a instanceof Activity)) {
            return false;
        }
        try {
            return (this.a.getPackageManager().getActivityInfo(new ComponentName(this.a, this.a.getClass()), 0).configChanges & 512) == 0;
        } catch (Throwable e) {
            Log.d("AppCompatDelegate", "Exception while getting ActivityInfo", e);
            return true;
        }
    }

    Callback mo314a(Callback callback) {
        return new C0439a(this, callback);
    }

    public void mo296a(Bundle bundle) {
        super.mo296a(bundle);
        if (bundle != null && this.f1285t == -100) {
            this.f1285t = bundle.getInt("appcompat:local_night_mode", -100);
        }
    }

    public void mo284c() {
        super.mo284c();
        mo288i();
    }

    public void mo285c(Bundle bundle) {
        super.mo285c(bundle);
        if (this.f1285t != -100) {
            bundle.putInt("appcompat:local_night_mode", this.f1285t);
        }
    }

    int mo315d(int i) {
        switch (i) {
            case -100:
                return -1;
            case 0:
                m2038x();
                return this.f1288w.m2052a();
            default:
                return i;
        }
    }

    public void mo286d() {
        super.mo286d();
        if (this.f1288w != null) {
            this.f1288w.m2055d();
        }
    }

    public void mo287g() {
        super.mo287g();
        if (this.f1288w != null) {
            this.f1288w.m2055d();
        }
    }

    public boolean mo288i() {
        boolean z = false;
        int w = m2037w();
        int d = mo315d(w);
        if (d != -1) {
            z = m2036h(d);
        }
        if (w == 0) {
            m2038x();
            this.f1288w.m2054c();
        }
        this.f1286u = true;
        return z;
    }

    public boolean mo316o() {
        return this.f1287v;
    }
}
