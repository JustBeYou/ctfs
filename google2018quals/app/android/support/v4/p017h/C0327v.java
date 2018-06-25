package android.support.v4.p017h;

import android.os.Build.VERSION;
import android.view.WindowInsets;

public class C0327v {
    private final Object f949a;

    private C0327v(Object obj) {
        this.f949a = obj;
    }

    static C0327v m1442a(Object obj) {
        return obj == null ? null : new C0327v(obj);
    }

    static Object m1443a(C0327v c0327v) {
        return c0327v == null ? null : c0327v.f949a;
    }

    public int m1444a() {
        return VERSION.SDK_INT >= 20 ? ((WindowInsets) this.f949a).getSystemWindowInsetLeft() : 0;
    }

    public C0327v m1445a(int i, int i2, int i3, int i4) {
        return VERSION.SDK_INT >= 20 ? new C0327v(((WindowInsets) this.f949a).replaceSystemWindowInsets(i, i2, i3, i4)) : null;
    }

    public int m1446b() {
        return VERSION.SDK_INT >= 20 ? ((WindowInsets) this.f949a).getSystemWindowInsetTop() : 0;
    }

    public int m1447c() {
        return VERSION.SDK_INT >= 20 ? ((WindowInsets) this.f949a).getSystemWindowInsetRight() : 0;
    }

    public int m1448d() {
        return VERSION.SDK_INT >= 20 ? ((WindowInsets) this.f949a).getSystemWindowInsetBottom() : 0;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        C0327v c0327v = (C0327v) obj;
        return this.f949a == null ? c0327v.f949a == null : this.f949a.equals(c0327v.f949a);
    }

    public int hashCode() {
        return this.f949a == null ? 0 : this.f949a.hashCode();
    }
}
