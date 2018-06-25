package android.support.v4.p017h;

import android.content.Context;
import android.util.Log;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;

public abstract class C0286c {
    private final Context f914a;
    private C0284a f915b;
    private C0285b f916c;

    public interface C0284a {
        void mo538a(boolean z);
    }

    public interface C0285b {
        void mo425a(boolean z);
    }

    public C0286c(Context context) {
        this.f914a = context;
    }

    public abstract View mo426a();

    public View mo432a(MenuItem menuItem) {
        return mo426a();
    }

    public void m1260a(C0284a c0284a) {
        this.f915b = c0284a;
    }

    public void mo433a(C0285b c0285b) {
        if (!(this.f916c == null || c0285b == null)) {
            Log.w("ActionProvider(support)", "setVisibilityListener: Setting a new ActionProvider.VisibilityListener when one is already set. Are you reusing this " + getClass().getSimpleName() + " instance while it is still in use somewhere else?");
        }
        this.f916c = c0285b;
    }

    public void mo427a(SubMenu subMenu) {
    }

    public void m1263a(boolean z) {
        if (this.f915b != null) {
            this.f915b.mo538a(z);
        }
    }

    public boolean mo434b() {
        return false;
    }

    public boolean mo435c() {
        return true;
    }

    public boolean mo428d() {
        return false;
    }

    public boolean mo429e() {
        return false;
    }

    public void m1268f() {
        this.f916c = null;
        this.f915b = null;
    }
}
