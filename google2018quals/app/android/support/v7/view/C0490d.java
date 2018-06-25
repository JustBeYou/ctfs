package android.support.v7.view;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.AssetManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.os.Build.VERSION;
import android.support.v7.p020a.C0411a.C0409i;
import android.view.LayoutInflater;

public class C0490d extends ContextWrapper {
    private int f1428a;
    private Theme f1429b;
    private LayoutInflater f1430c;
    private Configuration f1431d;
    private Resources f1432e;

    public C0490d() {
        super(null);
    }

    public C0490d(Context context, int i) {
        super(context);
        this.f1428a = i;
    }

    public C0490d(Context context, Theme theme) {
        super(context);
        this.f1429b = theme;
    }

    private Resources m2233b() {
        if (this.f1432e == null) {
            if (this.f1431d == null) {
                this.f1432e = super.getResources();
            } else if (VERSION.SDK_INT >= 17) {
                this.f1432e = createConfigurationContext(this.f1431d).getResources();
            }
        }
        return this.f1432e;
    }

    private void m2234c() {
        boolean z = this.f1429b == null;
        if (z) {
            this.f1429b = getResources().newTheme();
            Theme theme = getBaseContext().getTheme();
            if (theme != null) {
                this.f1429b.setTo(theme);
            }
        }
        m2236a(this.f1429b, this.f1428a, z);
    }

    public int m2235a() {
        return this.f1428a;
    }

    protected void m2236a(Theme theme, int i, boolean z) {
        theme.applyStyle(i, true);
    }

    protected void attachBaseContext(Context context) {
        super.attachBaseContext(context);
    }

    public AssetManager getAssets() {
        return getResources().getAssets();
    }

    public Resources getResources() {
        return m2233b();
    }

    public Object getSystemService(String str) {
        if (!"layout_inflater".equals(str)) {
            return getBaseContext().getSystemService(str);
        }
        if (this.f1430c == null) {
            this.f1430c = LayoutInflater.from(getBaseContext()).cloneInContext(this);
        }
        return this.f1430c;
    }

    public Theme getTheme() {
        if (this.f1429b != null) {
            return this.f1429b;
        }
        if (this.f1428a == 0) {
            this.f1428a = C0409i.Theme_AppCompat_Light;
        }
        m2234c();
        return this.f1429b;
    }

    public void setTheme(int i) {
        if (this.f1428a != i) {
            this.f1428a = i;
            m2234c();
        }
    }
}
