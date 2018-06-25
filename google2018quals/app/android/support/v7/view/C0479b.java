package android.support.v7.view;

import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;

public abstract class C0479b {
    private Object f1379a;
    private boolean f1380b;

    public interface C0462a {
        void mo323a(C0479b c0479b);

        boolean mo324a(C0479b c0479b, Menu menu);

        boolean mo325a(C0479b c0479b, MenuItem menuItem);

        boolean mo326b(C0479b c0479b, Menu menu);
    }

    public abstract MenuInflater mo344a();

    public abstract void mo345a(int i);

    public abstract void mo346a(View view);

    public abstract void mo347a(CharSequence charSequence);

    public void m2136a(Object obj) {
        this.f1379a = obj;
    }

    public void mo348a(boolean z) {
        this.f1380b = z;
    }

    public abstract Menu mo349b();

    public abstract void mo350b(int i);

    public abstract void mo351b(CharSequence charSequence);

    public abstract void mo352c();

    public abstract void mo353d();

    public abstract CharSequence mo354f();

    public abstract CharSequence mo355g();

    public boolean mo356h() {
        return false;
    }

    public abstract View mo357i();

    public Object m2147j() {
        return this.f1379a;
    }

    public boolean m2148k() {
        return this.f1380b;
    }
}
