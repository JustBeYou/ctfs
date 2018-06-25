package android.support.constraint.p007a.p008a;

import android.support.constraint.p007a.C0069e;
import android.support.constraint.p007a.p008a.C0053a.C0052c;
import java.util.ArrayList;

public class C0060d extends C0056b {
    protected float aa = -1.0f;
    protected int ab = -1;
    protected int ac = -1;
    private C0053a ad = this.j;
    private int ae = 0;
    private boolean af = false;
    private int ag = 0;
    private C0062f ah = new C0062f();
    private int ai = 8;

    public C0060d() {
        this.q.clear();
        this.q.add(this.ad);
    }

    public int mo29D() {
        return this.ae;
    }

    public float m241E() {
        return this.aa;
    }

    public int m242F() {
        return this.ab;
    }

    public int m243G() {
        return this.ac;
    }

    public C0053a mo31a(C0052c c0052c) {
        switch (c0052c) {
            case LEFT:
            case RIGHT:
                if (this.ae == 1) {
                    return this.ad;
                }
                break;
            case TOP:
            case BOTTOM:
                if (this.ae == 0) {
                    return this.ad;
                }
                break;
        }
        return null;
    }

    public void mo32a(C0069e c0069e, int i) {
        C0058c c0058c = (C0058c) m174c();
        if (c0058c != null) {
            Object a;
            Object a2 = c0058c.mo31a(C0052c.LEFT);
            C0053a a3 = c0058c.mo31a(C0052c.RIGHT);
            if (this.ae == 0) {
                a3 = c0058c.mo31a(C0052c.TOP);
                a = c0058c.mo31a(C0052c.BOTTOM);
                a2 = a3;
            } else {
                C0053a c0053a = a3;
            }
            if (this.ab != -1) {
                c0069e.m315a(C0069e.m299a(c0069e, c0069e.m313a(this.ad), c0069e.m313a(a2), this.ab, false));
            } else if (this.ac != -1) {
                c0069e.m315a(C0069e.m299a(c0069e, c0069e.m313a(this.ad), c0069e.m313a(a), -this.ac, false));
            } else if (this.aa != -1.0f) {
                c0069e.m315a(C0069e.m300a(c0069e, c0069e.m313a(this.ad), c0069e.m313a(a2), c0069e.m313a(a), this.aa, this.af));
            }
        }
    }

    public void mo33b(C0069e c0069e, int i) {
        if (m174c() != null) {
            int b = c0069e.m320b(this.ad);
            if (this.ae == 1) {
                m168b(b);
                m176c(0);
                m183e(m174c().m196l());
                m180d(0);
                return;
            }
            m168b(0);
            m176c(b);
            m180d(m174c().m188h());
            m183e(0);
        }
    }

    public void m247e(float f) {
        if (f > -1.0f) {
            this.aa = f;
            this.ab = -1;
            this.ac = -1;
        }
    }

    public void m248m(int i) {
        if (this.ae != i) {
            this.ae = i;
            this.q.clear();
            if (this.ae == 1) {
                this.ad = this.i;
            } else {
                this.ad = this.j;
            }
            this.q.add(this.ad);
        }
    }

    public void m249n(int i) {
        if (i > -1) {
            this.aa = -1.0f;
            this.ab = i;
            this.ac = -1;
        }
    }

    public void m250o(int i) {
        if (i > -1) {
            this.aa = -1.0f;
            this.ab = -1;
            this.ac = i;
        }
    }

    public ArrayList<C0053a> mo34y() {
        return this.q;
    }
}
