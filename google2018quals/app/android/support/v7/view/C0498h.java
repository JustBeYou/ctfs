package android.support.v7.view;

import android.support.v4.p017h.C0322s;
import android.support.v4.p017h.C0324r;
import android.support.v4.p017h.C0325t;
import android.view.View;
import android.view.animation.Interpolator;
import java.util.ArrayList;
import java.util.Iterator;

public class C0498h {
    final ArrayList<C0324r> f1490a = new ArrayList();
    C0322s f1491b;
    private long f1492c = -1;
    private Interpolator f1493d;
    private boolean f1494e;
    private final C0325t f1495f = new C04971(this);

    class C04971 extends C0325t {
        final /* synthetic */ C0498h f1487a;
        private boolean f1488b = false;
        private int f1489c = 0;

        C04971(C0498h c0498h) {
            this.f1487a = c0498h;
        }

        void m2271a() {
            this.f1489c = 0;
            this.f1488b = false;
            this.f1487a.m2280b();
        }

        public void mo155a(View view) {
            if (!this.f1488b) {
                this.f1488b = true;
                if (this.f1487a.f1491b != null) {
                    this.f1487a.f1491b.mo155a(null);
                }
            }
        }

        public void mo156b(View view) {
            int i = this.f1489c + 1;
            this.f1489c = i;
            if (i == this.f1487a.f1490a.size()) {
                if (this.f1487a.f1491b != null) {
                    this.f1487a.f1491b.mo156b(null);
                }
                m2271a();
            }
        }
    }

    public C0498h m2274a(long j) {
        if (!this.f1494e) {
            this.f1492c = j;
        }
        return this;
    }

    public C0498h m2275a(C0324r c0324r) {
        if (!this.f1494e) {
            this.f1490a.add(c0324r);
        }
        return this;
    }

    public C0498h m2276a(C0324r c0324r, C0324r c0324r2) {
        this.f1490a.add(c0324r);
        c0324r2.m1435b(c0324r.m1428a());
        this.f1490a.add(c0324r2);
        return this;
    }

    public C0498h m2277a(C0322s c0322s) {
        if (!this.f1494e) {
            this.f1491b = c0322s;
        }
        return this;
    }

    public C0498h m2278a(Interpolator interpolator) {
        if (!this.f1494e) {
            this.f1493d = interpolator;
        }
        return this;
    }

    public void m2279a() {
        if (!this.f1494e) {
            Iterator it = this.f1490a.iterator();
            while (it.hasNext()) {
                C0324r c0324r = (C0324r) it.next();
                if (this.f1492c >= 0) {
                    c0324r.m1430a(this.f1492c);
                }
                if (this.f1493d != null) {
                    c0324r.m1433a(this.f1493d);
                }
                if (this.f1491b != null) {
                    c0324r.m1431a(this.f1495f);
                }
                c0324r.m1437c();
            }
            this.f1494e = true;
        }
    }

    void m2280b() {
        this.f1494e = false;
    }

    public void m2281c() {
        if (this.f1494e) {
            Iterator it = this.f1490a.iterator();
            while (it.hasNext()) {
                ((C0324r) it.next()).m1436b();
            }
            this.f1494e = false;
        }
    }
}
