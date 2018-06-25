package android.support.constraint.p007a.p008a;

import android.support.constraint.p007a.C0066b;
import android.support.constraint.p007a.C0067c;
import android.support.constraint.p007a.C0069e;
import android.support.constraint.p007a.C0074g;
import android.support.constraint.p007a.p008a.C0053a.C0050a;
import android.support.constraint.p007a.p008a.C0053a.C0051b;
import android.support.constraint.p007a.p008a.C0053a.C0052c;
import java.util.ArrayList;

public class C0056b {
    public static float f285D = 0.5f;
    int f286A = 0;
    protected int f287B;
    protected int f288C;
    float f289E = f285D;
    float f290F = f285D;
    C0055a f291G = C0055a.FIXED;
    C0055a f292H = C0055a.FIXED;
    int f293I;
    int f294J;
    int f295K;
    int f296L;
    boolean f297M;
    boolean f298N;
    boolean f299O;
    boolean f300P;
    boolean f301Q;
    boolean f302R;
    int f303S = 0;
    int f304T = 0;
    boolean f305U;
    boolean f306V;
    float f307W = 0.0f;
    float f308X = 0.0f;
    C0056b f309Y = null;
    C0056b f310Z = null;
    public int f311a = -1;
    private int aa = 0;
    private int ab = 0;
    private int ac = 0;
    private int ad = 0;
    private int ae = 0;
    private int af = 0;
    private int ag = 0;
    private int ah = 0;
    private int ai;
    private int aj;
    private Object ak;
    private int al = 0;
    private int am = 0;
    private String an = null;
    private String ao = null;
    public int f312b = -1;
    int f313c = 0;
    int f314d = 0;
    int f315e = 0;
    int f316f = 0;
    int f317g = 0;
    int f318h = 0;
    C0053a f319i = new C0053a(this, C0052c.LEFT);
    C0053a f320j = new C0053a(this, C0052c.TOP);
    C0053a f321k = new C0053a(this, C0052c.RIGHT);
    C0053a f322l = new C0053a(this, C0052c.BOTTOM);
    C0053a f323m = new C0053a(this, C0052c.BASELINE);
    C0053a f324n = new C0053a(this, C0052c.CENTER_X);
    C0053a f325o = new C0053a(this, C0052c.CENTER_Y);
    C0053a f326p = new C0053a(this, C0052c.CENTER);
    protected ArrayList<C0053a> f327q = new ArrayList();
    C0056b f328r = null;
    int f329s = 0;
    int f330t = 0;
    protected float f331u = 0.0f;
    protected int f332v = -1;
    protected int f333w = 0;
    protected int f334x = 0;
    protected int f335y = 0;
    protected int f336z = 0;

    public enum C0055a {
        FIXED,
        WRAP_CONTENT,
        MATCH_CONSTRAINT,
        MATCH_PARENT
    }

    public C0056b() {
        mo29D();
    }

    private void mo29D() {
        this.f327q.add(this.f319i);
        this.f327q.add(this.f320j);
        this.f327q.add(this.f321k);
        this.f327q.add(this.f322l);
        this.f327q.add(this.f324n);
        this.f327q.add(this.f325o);
        this.f327q.add(this.f323m);
    }

    private void m149a(C0069e c0069e, boolean z, boolean z2, C0053a c0053a, C0053a c0053a2, int i, int i2, int i3, int i4, float f, boolean z3, boolean z4, int i5, int i6, int i7) {
        int i8;
        C0074g a = c0069e.m313a((Object) c0053a);
        C0074g a2 = c0069e.m313a((Object) c0053a2);
        C0074g a3 = c0069e.m313a(c0053a.m143f());
        C0074g a4 = c0069e.m313a(c0053a2.m143f());
        int d = c0053a.m141d();
        int d2 = c0053a2.m141d();
        if (this.am == 8) {
            i8 = 0;
            z2 = true;
        } else {
            i8 = i3;
        }
        if (a3 == null && a4 == null) {
            c0069e.m315a(c0069e.m321b().m286b(a, i));
            if (!z3) {
                if (z) {
                    c0069e.m315a(C0069e.m299a(c0069e, a2, a, i4, true));
                } else if (z2) {
                    c0069e.m315a(C0069e.m299a(c0069e, a2, a, i8, false));
                } else {
                    c0069e.m315a(c0069e.m321b().m286b(a2, i2));
                }
            }
        } else if (a3 != null && a4 == null) {
            c0069e.m315a(c0069e.m321b().m278a(a, a3, d));
            if (z) {
                c0069e.m315a(C0069e.m299a(c0069e, a2, a, i4, true));
            } else if (!z3) {
                if (z2) {
                    c0069e.m315a(c0069e.m321b().m278a(a2, a, i8));
                } else {
                    c0069e.m315a(c0069e.m321b().m286b(a2, i2));
                }
            }
        } else if (a3 == null && a4 != null) {
            c0069e.m315a(c0069e.m321b().m278a(a2, a4, d2 * -1));
            if (z) {
                c0069e.m315a(C0069e.m299a(c0069e, a2, a, i4, true));
            } else if (!z3) {
                if (z2) {
                    c0069e.m315a(c0069e.m321b().m278a(a2, a, i8));
                } else {
                    c0069e.m315a(c0069e.m321b().m286b(a, i));
                }
            }
        } else if (z2) {
            if (z) {
                c0069e.m315a(C0069e.m299a(c0069e, a2, a, i4, true));
            } else {
                c0069e.m315a(c0069e.m321b().m278a(a2, a, i8));
            }
            if (c0053a.m142e() != c0053a2.m142e()) {
                C0074g c;
                if (c0053a.m142e() == C0051b.STRONG) {
                    c0069e.m315a(c0069e.m321b().m278a(a, a3, d));
                    c = c0069e.m324c();
                    C0066b b = c0069e.m321b();
                    b.m287b(a2, a4, c, d2 * -1);
                    c0069e.m315a(b);
                    return;
                }
                c = c0069e.m324c();
                C0066b b2 = c0069e.m321b();
                b2.m281a(a, a3, c, d);
                c0069e.m315a(b2);
                c0069e.m315a(c0069e.m321b().m278a(a2, a4, d2 * -1));
            } else if (a3 == a4) {
                c0069e.m315a(C0069e.m298a(c0069e, a, a3, 0, 0.5f, a4, a2, 0, true));
            } else if (!z4) {
                c0069e.m315a(C0069e.m304b(c0069e, a, a3, d, c0053a.m144g() != C0050a.STRICT));
                c0069e.m315a(C0069e.m307c(c0069e, a2, a4, d2 * -1, c0053a2.m144g() != C0050a.STRICT));
                c0069e.m315a(C0069e.m298a(c0069e, a, a3, d, f, a4, a2, d2, false));
            }
        } else if (z3) {
            c0069e.m319a(a, a3, d, 3);
            c0069e.m322b(a2, a4, d2 * -1, 3);
            c0069e.m315a(C0069e.m298a(c0069e, a, a3, d, f, a4, a2, d2, true));
        } else if (!z4) {
            if (i5 == 1) {
                if (i6 > i8) {
                    i8 = i6;
                }
                if (i7 > 0) {
                    if (i7 >= i8) {
                        c0069e.m322b(a2, a, i7, 3);
                    }
                    c0069e.m323c(a2, a, i7, 3);
                    c0069e.m319a(a, a3, d, 2);
                    c0069e.m322b(a2, a4, -d2, 2);
                    c0069e.m318a(a, a3, d, f, a4, a2, d2, 4);
                }
                i7 = i8;
                c0069e.m323c(a2, a, i7, 3);
                c0069e.m319a(a, a3, d, 2);
                c0069e.m322b(a2, a4, -d2, 2);
                c0069e.m318a(a, a3, d, f, a4, a2, d2, 4);
            } else if (i6 == 0 && i7 == 0) {
                c0069e.m315a(c0069e.m321b().m278a(a, a3, d));
                c0069e.m315a(c0069e.m321b().m278a(a2, a4, d2 * -1));
            } else {
                if (i7 > 0) {
                    c0069e.m322b(a2, a, i7, 3);
                }
                c0069e.m319a(a, a3, d, 2);
                c0069e.m322b(a2, a4, -d2, 2);
                c0069e.m318a(a, a3, d, f, a4, a2, d2, 4);
            }
        }
    }

    public void m150A() {
        C0056b c = m174c();
        if (c == null || !(c instanceof C0058c) || !((C0058c) m174c()).m231G()) {
            int size = this.f327q.size();
            for (int i = 0; i < size; i++) {
                ((C0053a) this.f327q.get(i)).m146i();
            }
        }
    }

    public C0055a m151B() {
        return this.f291G;
    }

    public C0055a m152C() {
        return this.f292H;
    }

    public C0053a mo31a(C0052c c0052c) {
        switch (c0052c) {
            case LEFT:
                return this.f319i;
            case TOP:
                return this.f320j;
            case RIGHT:
                return this.f321k;
            case BOTTOM:
                return this.f322l;
            case BASELINE:
                return this.f323m;
            case CENTER_X:
                return this.f324n;
            case CENTER_Y:
                return this.f325o;
            case CENTER:
                return this.f326p;
            default:
                return null;
        }
    }

    public void mo25a() {
        this.f319i.m146i();
        this.f320j.m146i();
        this.f321k.m146i();
        this.f322l.m146i();
        this.f323m.m146i();
        this.f324n.m146i();
        this.f325o.m146i();
        this.f326p.m146i();
        this.f328r = null;
        this.f329s = 0;
        this.f330t = 0;
        this.f331u = 0.0f;
        this.f332v = -1;
        this.f333w = 0;
        this.f334x = 0;
        this.ae = 0;
        this.af = 0;
        this.ag = 0;
        this.ah = 0;
        this.f335y = 0;
        this.f336z = 0;
        this.f286A = 0;
        this.f287B = 0;
        this.f288C = 0;
        this.ai = 0;
        this.aj = 0;
        this.f289E = f285D;
        this.f290F = f285D;
        this.f291G = C0055a.FIXED;
        this.f292H = C0055a.FIXED;
        this.ak = null;
        this.al = 0;
        this.am = 0;
        this.an = null;
        this.ao = null;
        this.f301Q = false;
        this.f302R = false;
        this.f303S = 0;
        this.f304T = 0;
        this.f305U = false;
        this.f306V = false;
        this.f307W = 0.0f;
        this.f308X = 0.0f;
        this.f311a = -1;
        this.f312b = -1;
    }

    public void m155a(float f) {
        this.f289E = f;
    }

    public void m156a(int i) {
        this.am = i;
    }

    public void m157a(int i, int i2) {
        this.f333w = i;
        this.f334x = i2;
    }

    public void m158a(int i, int i2, int i3) {
        this.f313c = i;
        this.f315e = i2;
        this.f316f = i3;
    }

    public void m159a(int i, int i2, int i3, int i4) {
        int i5 = i3 - i;
        int i6 = i4 - i2;
        this.f333w = i;
        this.f334x = i2;
        if (this.am == 8) {
            this.f329s = 0;
            this.f330t = 0;
            return;
        }
        if (this.f291G == C0055a.FIXED && i5 < this.f329s) {
            i5 = this.f329s;
        }
        if (this.f292H == C0055a.FIXED && i6 < this.f330t) {
            i6 = this.f330t;
        }
        this.f329s = i5;
        this.f330t = i6;
        if (this.f330t < this.f288C) {
            this.f330t = this.f288C;
        }
        if (this.f329s < this.f287B) {
            this.f329s = this.f287B;
        }
    }

    public void m160a(C0052c c0052c, C0056b c0056b, C0052c c0052c2, int i, int i2) {
        mo31a(c0052c).m137a(c0056b.mo31a(c0052c2), i, i2, C0051b.STRONG, 0, true);
    }

    public void m161a(C0055a c0055a) {
        this.f291G = c0055a;
        if (this.f291G == C0055a.WRAP_CONTENT) {
            m180d(this.ai);
        }
    }

    public void m162a(C0056b c0056b) {
        this.f328r = c0056b;
    }

    public void mo26a(C0067c c0067c) {
        this.f319i.m135a(c0067c);
        this.f320j.m135a(c0067c);
        this.f321k.m135a(c0067c);
        this.f322l.m135a(c0067c);
        this.f323m.m135a(c0067c);
        this.f326p.m135a(c0067c);
        this.f324n.m135a(c0067c);
        this.f325o.m135a(c0067c);
    }

    public void mo32a(C0069e c0069e, int i) {
        C0074g a;
        boolean z;
        boolean z2;
        float f;
        int i2;
        Object obj;
        boolean z3;
        int i3;
        int i4;
        boolean z4;
        C0053a c0053a;
        C0066b b;
        C0074g d;
        C0074g a2 = (i == Integer.MAX_VALUE || this.f319i.f275g == i) ? c0069e.m313a(this.f319i) : null;
        C0074g a3 = (i == Integer.MAX_VALUE || this.f321k.f275g == i) ? c0069e.m313a(this.f321k) : null;
        C0074g a4 = (i == Integer.MAX_VALUE || this.f320j.f275g == i) ? c0069e.m313a(this.f320j) : null;
        C0074g a5 = (i == Integer.MAX_VALUE || this.f322l.f275g == i) ? c0069e.m313a(this.f322l) : null;
        C0074g a6 = (i == Integer.MAX_VALUE || this.f323m.f275g == i) ? c0069e.m313a(this.f323m) : null;
        if (this.f328r != null) {
            boolean z5;
            boolean z6;
            C0066b b2;
            if ((this.f319i.f271c == null || this.f319i.f271c.f271c != this.f319i) && (this.f321k.f271c == null || this.f321k.f271c.f271c != this.f321k)) {
                z5 = false;
            } else {
                ((C0058c) this.f328r).m233a(this, 0);
                z5 = true;
            }
            if ((this.f320j.f271c == null || this.f320j.f271c.f271c != this.f320j) && (this.f322l.f271c == null || this.f322l.f271c.f271c != this.f322l)) {
                z6 = false;
            } else {
                ((C0058c) this.f328r).m233a(this, 1);
                z6 = true;
            }
            if (this.f328r.m151B() == C0055a.WRAP_CONTENT && !z5) {
                if (this.f319i.f271c == null || this.f319i.f271c.f269a != this.f328r) {
                    a = c0069e.m313a(this.f328r.f319i);
                    b2 = c0069e.m321b();
                    b2.m281a(a2, a, c0069e.m324c(), 0);
                    c0069e.m315a(b2);
                } else if (this.f319i.f271c != null && this.f319i.f271c.f269a == this.f328r) {
                    this.f319i.m134a(C0050a.STRICT);
                }
                if (this.f321k.f271c == null || this.f321k.f271c.f269a != this.f328r) {
                    a = c0069e.m313a(this.f328r.f321k);
                    b2 = c0069e.m321b();
                    b2.m281a(a, a3, c0069e.m324c(), 0);
                    c0069e.m315a(b2);
                } else if (this.f321k.f271c != null && this.f321k.f271c.f269a == this.f328r) {
                    this.f321k.m134a(C0050a.STRICT);
                }
            }
            if (this.f328r.m152C() == C0055a.WRAP_CONTENT && !z6) {
                if (this.f320j.f271c == null || this.f320j.f271c.f269a != this.f328r) {
                    a = c0069e.m313a(this.f328r.f320j);
                    b2 = c0069e.m321b();
                    b2.m281a(a4, a, c0069e.m324c(), 0);
                    c0069e.m315a(b2);
                } else if (this.f320j.f271c != null && this.f320j.f271c.f269a == this.f328r) {
                    this.f320j.m134a(C0050a.STRICT);
                }
                if (this.f322l.f271c == null || this.f322l.f271c.f269a != this.f328r) {
                    a = c0069e.m313a(this.f328r.f322l);
                    b2 = c0069e.m321b();
                    b2.m281a(a, a5, c0069e.m324c(), 0);
                    c0069e.m315a(b2);
                    z = z6;
                    z2 = z5;
                } else if (this.f322l.f271c != null && this.f322l.f271c.f269a == this.f328r) {
                    this.f322l.m134a(C0050a.STRICT);
                }
            }
            z = z6;
            z2 = z5;
        } else {
            z = false;
            z2 = false;
        }
        int i5 = this.f329s;
        if (i5 < this.f287B) {
            i5 = this.f287B;
        }
        int i6 = this.f330t;
        if (i6 < this.f288C) {
            i6 = this.f288C;
        }
        boolean z7 = this.f291G != C0055a.MATCH_CONSTRAINT;
        boolean z8 = this.f292H != C0055a.MATCH_CONSTRAINT;
        boolean z9 = (z7 || this.f319i == null || this.f321k == null || !(this.f319i.f271c == null || this.f321k.f271c == null)) ? z7 : true;
        z7 = (z8 || this.f320j == null || this.f322l == null || (!(this.f320j.f271c == null || this.f322l.f271c == null) || (this.f286A != 0 && (this.f323m == null || !(this.f320j.f271c == null || this.f323m.f271c == null))))) ? z8 : true;
        Object obj2 = null;
        int i7 = this.f332v;
        float f2 = this.f331u;
        if (this.f331u > 0.0f && this.am != 8) {
            if (this.f291G == C0055a.MATCH_CONSTRAINT && this.f292H == C0055a.MATCH_CONSTRAINT) {
                obj2 = 1;
                if (z9 && !z7) {
                    f = f2;
                    i2 = 0;
                    obj = 1;
                    z3 = z7;
                    i3 = i6;
                    i4 = i5;
                    z8 = z9;
                    if (obj == null) {
                    }
                    if (this.f291G != C0055a.WRAP_CONTENT) {
                    }
                    if (z4) {
                    }
                    m149a(c0069e, z7, z8, this.f319i, this.f321k, this.f333w, this.f333w + i4, i4, this.f287B, this.f289E, z4, z2, this.f313c, this.f315e, this.f316f);
                    if (this.f312b != 2) {
                        if (this.f292H != C0055a.WRAP_CONTENT) {
                        }
                        if (obj == null) {
                        }
                        if (this.f286A <= 0) {
                            c0053a = this.f322l;
                            c0069e.m323c(a6, a4, m208w(), 5);
                            if (this.f323m.f271c == null) {
                                i4 = this.f286A;
                                c0053a = this.f323m;
                            } else {
                                i4 = i3;
                            }
                            if (z4) {
                            }
                            m149a(c0069e, z7, z3, this.f320j, c0053a, this.f334x, this.f334x + i4, i4, this.f288C, this.f290F, z4, z, this.f314d, this.f317g, this.f318h);
                            c0069e.m323c(a5, a4, i3, 5);
                        } else {
                            if (z4) {
                            }
                            m149a(c0069e, z7, z3, this.f320j, this.f322l, this.f334x, this.f334x + i3, i3, this.f288C, this.f290F, z4, z, this.f314d, this.f317g, this.f318h);
                        }
                        if (obj == null) {
                            b = c0069e.m321b();
                            if (i == Integer.MAX_VALUE) {
                            }
                            if (i2 != 0) {
                                c0069e.m315a(b.m282a(a3, a2, a5, a4, f));
                            } else if (i2 != 1) {
                                c0069e.m315a(b.m282a(a5, a4, a3, a2, f));
                            } else {
                                if (this.f315e > 0) {
                                    c0069e.m319a(a3, a2, this.f315e, 3);
                                }
                                if (this.f317g > 0) {
                                    c0069e.m319a(a5, a4, this.f317g, 3);
                                }
                                b.m282a(a3, a2, a5, a4, f);
                                d = c0069e.m325d();
                                a = c0069e.m325d();
                                d.f394c = 4;
                                a.f394c = 4;
                                b.m277a(d, a);
                                c0069e.m315a(b);
                            }
                        }
                    }
                } else if (!z9 && z7) {
                    i7 = 1;
                    if (this.f332v == -1) {
                        f = 1.0f / f2;
                        i2 = 1;
                        int i8 = 1;
                        z3 = z7;
                        i3 = i6;
                        i4 = i5;
                        z8 = z9;
                        if (obj == null) {
                        }
                        if (this.f291G != C0055a.WRAP_CONTENT) {
                        }
                        if (z4) {
                        }
                        m149a(c0069e, z7, z8, this.f319i, this.f321k, this.f333w, this.f333w + i4, i4, this.f287B, this.f289E, z4, z2, this.f313c, this.f315e, this.f316f);
                        if (this.f312b != 2) {
                            if (this.f292H != C0055a.WRAP_CONTENT) {
                            }
                            if (obj == null) {
                            }
                            if (this.f286A <= 0) {
                                if (z4) {
                                }
                                m149a(c0069e, z7, z3, this.f320j, this.f322l, this.f334x, this.f334x + i3, i3, this.f288C, this.f290F, z4, z, this.f314d, this.f317g, this.f318h);
                            } else {
                                c0053a = this.f322l;
                                c0069e.m323c(a6, a4, m208w(), 5);
                                if (this.f323m.f271c == null) {
                                    i4 = i3;
                                } else {
                                    i4 = this.f286A;
                                    c0053a = this.f323m;
                                }
                                if (z4) {
                                }
                                m149a(c0069e, z7, z3, this.f320j, c0053a, this.f334x, this.f334x + i4, i4, this.f288C, this.f290F, z4, z, this.f314d, this.f317g, this.f318h);
                                c0069e.m323c(a5, a4, i3, 5);
                            }
                            if (obj == null) {
                                b = c0069e.m321b();
                                if (i == Integer.MAX_VALUE) {
                                }
                                if (i2 != 0) {
                                    c0069e.m315a(b.m282a(a3, a2, a5, a4, f));
                                } else if (i2 != 1) {
                                    if (this.f315e > 0) {
                                        c0069e.m319a(a3, a2, this.f315e, 3);
                                    }
                                    if (this.f317g > 0) {
                                        c0069e.m319a(a5, a4, this.f317g, 3);
                                    }
                                    b.m282a(a3, a2, a5, a4, f);
                                    d = c0069e.m325d();
                                    a = c0069e.m325d();
                                    d.f394c = 4;
                                    a.f394c = 4;
                                    b.m277a(d, a);
                                    c0069e.m315a(b);
                                } else {
                                    c0069e.m315a(b.m282a(a5, a4, a3, a2, f));
                                }
                            }
                        }
                    }
                }
            }
            C0074g a7;
            C0074g a8;
            if (this.f291G == C0055a.MATCH_CONSTRAINT) {
                i4 = (int) (((float) this.f330t) * f2);
                f = f2;
                i2 = 0;
                obj = null;
                z3 = z7;
                i3 = i6;
                z8 = true;
            } else if (this.f292H == C0055a.MATCH_CONSTRAINT) {
                float f3 = this.f332v == -1 ? 1.0f / f2 : f2;
                i3 = (int) (((float) this.f329s) * f3);
                f = f3;
                i2 = 1;
                obj = null;
                z3 = true;
                i4 = i5;
                z8 = z9;
            }
            z4 = obj == null && (i2 == 0 || i2 == -1);
            z7 = this.f291G != C0055a.WRAP_CONTENT && (this instanceof C0058c);
            if (this.f311a != 2 && (i == Integer.MAX_VALUE || (this.f319i.f275g == i && this.f321k.f275g == i))) {
                if (z4 || this.f319i.f271c == null || this.f321k.f271c == null) {
                    m149a(c0069e, z7, z8, this.f319i, this.f321k, this.f333w, this.f333w + i4, i4, this.f287B, this.f289E, z4, z2, this.f313c, this.f315e, this.f316f);
                } else {
                    d = c0069e.m313a(this.f319i);
                    a7 = c0069e.m313a(this.f321k);
                    a = c0069e.m313a(this.f319i.m143f());
                    a8 = c0069e.m313a(this.f321k.m143f());
                    c0069e.m319a(d, a, this.f319i.m141d(), 3);
                    c0069e.m322b(a7, a8, this.f321k.m141d() * -1, 3);
                    if (!z2) {
                        c0069e.m318a(d, a, this.f319i.m141d(), this.f289E, a8, a7, this.f321k.m141d(), 4);
                    }
                }
            }
            if (this.f312b != 2) {
                z7 = this.f292H != C0055a.WRAP_CONTENT && (this instanceof C0058c);
                z4 = obj == null && (i2 == 1 || i2 == -1);
                if (this.f286A <= 0) {
                    c0053a = this.f322l;
                    if (i == Integer.MAX_VALUE || (this.f322l.f275g == i && this.f323m.f275g == i)) {
                        c0069e.m323c(a6, a4, m208w(), 5);
                    }
                    if (this.f323m.f271c == null) {
                        i4 = this.f286A;
                        c0053a = this.f323m;
                    } else {
                        i4 = i3;
                    }
                    if (i == Integer.MAX_VALUE || (this.f320j.f275g == i && c0053a.f275g == i)) {
                        if (z4 || this.f320j.f271c == null || this.f322l.f271c == null) {
                            m149a(c0069e, z7, z3, this.f320j, c0053a, this.f334x, this.f334x + i4, i4, this.f288C, this.f290F, z4, z, this.f314d, this.f317g, this.f318h);
                            c0069e.m323c(a5, a4, i3, 5);
                        } else {
                            d = c0069e.m313a(this.f320j);
                            a7 = c0069e.m313a(this.f322l);
                            a = c0069e.m313a(this.f320j.m143f());
                            a8 = c0069e.m313a(this.f322l.m143f());
                            c0069e.m319a(d, a, this.f320j.m141d(), 3);
                            c0069e.m322b(a7, a8, this.f322l.m141d() * -1, 3);
                            if (!z) {
                                c0069e.m318a(d, a, this.f320j.m141d(), this.f290F, a8, a7, this.f322l.m141d(), 4);
                            }
                        }
                    }
                } else if (i == Integer.MAX_VALUE || (this.f320j.f275g == i && this.f322l.f275g == i)) {
                    if (z4 || this.f320j.f271c == null || this.f322l.f271c == null) {
                        m149a(c0069e, z7, z3, this.f320j, this.f322l, this.f334x, this.f334x + i3, i3, this.f288C, this.f290F, z4, z, this.f314d, this.f317g, this.f318h);
                    } else {
                        d = c0069e.m313a(this.f320j);
                        a7 = c0069e.m313a(this.f322l);
                        a = c0069e.m313a(this.f320j.m143f());
                        a8 = c0069e.m313a(this.f322l.m143f());
                        c0069e.m319a(d, a, this.f320j.m141d(), 3);
                        c0069e.m322b(a7, a8, this.f322l.m141d() * -1, 3);
                        if (!z) {
                            c0069e.m318a(d, a, this.f320j.m141d(), this.f290F, a8, a7, this.f322l.m141d(), 4);
                        }
                    }
                }
                if (obj == null) {
                    b = c0069e.m321b();
                    if (i == Integer.MAX_VALUE && (this.f319i.f275g != i || this.f321k.f275g != i)) {
                        return;
                    }
                    if (i2 != 0) {
                        c0069e.m315a(b.m282a(a3, a2, a5, a4, f));
                    } else if (i2 != 1) {
                        c0069e.m315a(b.m282a(a5, a4, a3, a2, f));
                    } else {
                        if (this.f315e > 0) {
                            c0069e.m319a(a3, a2, this.f315e, 3);
                        }
                        if (this.f317g > 0) {
                            c0069e.m319a(a5, a4, this.f317g, 3);
                        }
                        b.m282a(a3, a2, a5, a4, f);
                        d = c0069e.m325d();
                        a = c0069e.m325d();
                        d.f394c = 4;
                        a.f394c = 4;
                        b.m277a(d, a);
                        c0069e.m315a(b);
                    }
                }
            }
        }
        f = f2;
        i2 = i7;
        obj = obj2;
        z3 = z7;
        i3 = i6;
        i4 = i5;
        z8 = z9;
        if (obj == null) {
        }
        if (this.f291G != C0055a.WRAP_CONTENT) {
        }
        if (z4) {
        }
        m149a(c0069e, z7, z8, this.f319i, this.f321k, this.f333w, this.f333w + i4, i4, this.f287B, this.f289E, z4, z2, this.f313c, this.f315e, this.f316f);
        if (this.f312b != 2) {
            if (this.f292H != C0055a.WRAP_CONTENT) {
            }
            if (obj == null) {
            }
            if (this.f286A <= 0) {
                if (z4) {
                }
                m149a(c0069e, z7, z3, this.f320j, this.f322l, this.f334x, this.f334x + i3, i3, this.f288C, this.f290F, z4, z, this.f314d, this.f317g, this.f318h);
            } else {
                c0053a = this.f322l;
                c0069e.m323c(a6, a4, m208w(), 5);
                if (this.f323m.f271c == null) {
                    i4 = i3;
                } else {
                    i4 = this.f286A;
                    c0053a = this.f323m;
                }
                if (z4) {
                }
                m149a(c0069e, z7, z3, this.f320j, c0053a, this.f334x, this.f334x + i4, i4, this.f288C, this.f290F, z4, z, this.f314d, this.f317g, this.f318h);
                c0069e.m323c(a5, a4, i3, 5);
            }
            if (obj == null) {
                b = c0069e.m321b();
                if (i == Integer.MAX_VALUE) {
                }
                if (i2 != 0) {
                    c0069e.m315a(b.m282a(a3, a2, a5, a4, f));
                } else if (i2 != 1) {
                    if (this.f315e > 0) {
                        c0069e.m319a(a3, a2, this.f315e, 3);
                    }
                    if (this.f317g > 0) {
                        c0069e.m319a(a5, a4, this.f317g, 3);
                    }
                    b.m282a(a3, a2, a5, a4, f);
                    d = c0069e.m325d();
                    a = c0069e.m325d();
                    d.f394c = 4;
                    a.f394c = 4;
                    b.m277a(d, a);
                    c0069e.m315a(b);
                } else {
                    c0069e.m315a(b.m282a(a5, a4, a3, a2, f));
                }
            }
        }
    }

    public void m165a(Object obj) {
        this.ak = obj;
    }

    public void m166a(String str) {
        int i = 0;
        if (str == null || str.length() == 0) {
            this.f331u = 0.0f;
            return;
        }
        float parseFloat;
        int i2 = -1;
        int length = str.length();
        int indexOf = str.indexOf(44);
        if (indexOf > 0 && indexOf < length - 1) {
            String substring = str.substring(0, indexOf);
            if (!substring.equalsIgnoreCase("W")) {
                i = substring.equalsIgnoreCase("H") ? 1 : -1;
            }
            i2 = i;
            i = indexOf + 1;
        }
        indexOf = str.indexOf(58);
        String substring2;
        if (indexOf < 0 || indexOf >= length - 1) {
            substring2 = str.substring(i);
            if (substring2.length() > 0) {
                try {
                    parseFloat = Float.parseFloat(substring2);
                } catch (NumberFormatException e) {
                    parseFloat = 0.0f;
                }
            }
            parseFloat = 0.0f;
        } else {
            substring2 = str.substring(i, indexOf);
            String substring3 = str.substring(indexOf + 1);
            if (substring2.length() > 0 && substring3.length() > 0) {
                try {
                    parseFloat = Float.parseFloat(substring2);
                    float parseFloat2 = Float.parseFloat(substring3);
                    if (parseFloat > 0.0f && parseFloat2 > 0.0f) {
                        parseFloat = i2 == 1 ? Math.abs(parseFloat2 / parseFloat) : Math.abs(parseFloat / parseFloat2);
                    }
                } catch (NumberFormatException e2) {
                    parseFloat = 0.0f;
                }
            }
            parseFloat = 0.0f;
        }
        if (parseFloat > 0.0f) {
            this.f331u = parseFloat;
            this.f332v = i2;
        }
    }

    public void m167b(float f) {
        this.f290F = f;
    }

    public void m168b(int i) {
        this.f333w = i;
    }

    public void mo27b(int i, int i2) {
        this.f335y = i;
        this.f336z = i2;
    }

    public void m170b(int i, int i2, int i3) {
        this.f314d = i;
        this.f317g = i2;
        this.f318h = i3;
    }

    public void m171b(C0055a c0055a) {
        this.f292H = c0055a;
        if (this.f292H == C0055a.WRAP_CONTENT) {
            m183e(this.aj);
        }
    }

    public void mo33b(C0069e c0069e, int i) {
        if (i == Integer.MAX_VALUE) {
            m159a(c0069e.m320b(this.f319i), c0069e.m320b(this.f320j), c0069e.m320b(this.f321k), c0069e.m320b(this.f322l));
        } else if (i == -2) {
            m159a(this.aa, this.ab, this.ac, this.ad);
        } else {
            if (this.f319i.f275g == i) {
                this.aa = c0069e.m320b(this.f319i);
            }
            if (this.f320j.f275g == i) {
                this.ab = c0069e.m320b(this.f320j);
            }
            if (this.f321k.f275g == i) {
                this.ac = c0069e.m320b(this.f321k);
            }
            if (this.f322l.f275g == i) {
                this.ad = c0069e.m320b(this.f322l);
            }
        }
    }

    public boolean m173b() {
        return this.f328r == null;
    }

    public C0056b m174c() {
        return this.f328r;
    }

    public void m175c(float f) {
        this.f307W = f;
    }

    public void m176c(int i) {
        this.f334x = i;
    }

    public void m177c(int i, int i2) {
        this.f333w = i;
        this.f329s = i2 - i;
        if (this.f329s < this.f287B) {
            this.f329s = this.f287B;
        }
    }

    public int m178d() {
        return this.am;
    }

    public void m179d(float f) {
        this.f308X = f;
    }

    public void m180d(int i) {
        this.f329s = i;
        if (this.f329s < this.f287B) {
            this.f329s = this.f287B;
        }
    }

    public void m181d(int i, int i2) {
        this.f334x = i;
        this.f330t = i2 - i;
        if (this.f330t < this.f288C) {
            this.f330t = this.f288C;
        }
    }

    public String m182e() {
        return this.an;
    }

    public void m183e(int i) {
        this.f330t = i;
        if (this.f330t < this.f288C) {
            this.f330t = this.f288C;
        }
    }

    public int m184f() {
        return this.f333w;
    }

    public void m185f(int i) {
        if (i < 0) {
            this.f287B = 0;
        } else {
            this.f287B = i;
        }
    }

    public int m186g() {
        return this.f334x;
    }

    public void m187g(int i) {
        if (i < 0) {
            this.f288C = 0;
        } else {
            this.f288C = i;
        }
    }

    public int m188h() {
        return this.am == 8 ? 0 : this.f329s;
    }

    public void m189h(int i) {
        this.ai = i;
    }

    public int m190i() {
        int i = this.f329s;
        if (this.f291G != C0055a.MATCH_CONSTRAINT) {
            return i;
        }
        if (this.f313c == 1) {
            i = Math.max(this.f315e, i);
        } else if (this.f315e > 0) {
            i = this.f315e;
            this.f329s = i;
        } else {
            i = 0;
        }
        return (this.f316f <= 0 || this.f316f >= i) ? i : this.f316f;
    }

    public void m191i(int i) {
        this.aj = i;
    }

    public int m192j() {
        int i = this.f330t;
        if (this.f292H != C0055a.MATCH_CONSTRAINT) {
            return i;
        }
        if (this.f314d == 1) {
            i = Math.max(this.f317g, i);
        } else if (this.f317g > 0) {
            i = this.f317g;
            this.f330t = i;
        } else {
            i = 0;
        }
        return (this.f318h <= 0 || this.f318h >= i) ? i : this.f318h;
    }

    public void m193j(int i) {
        this.f286A = i;
    }

    public int m194k() {
        return this.ai;
    }

    public void m195k(int i) {
        this.f303S = i;
    }

    public int m196l() {
        return this.am == 8 ? 0 : this.f330t;
    }

    public void m197l(int i) {
        this.f304T = i;
    }

    public int m198m() {
        return this.aj;
    }

    public int m199n() {
        return this.ae + this.f335y;
    }

    public int m200o() {
        return this.af + this.f336z;
    }

    public int m201p() {
        return m200o() + this.ah;
    }

    public int m202q() {
        return m199n() + this.ag;
    }

    protected int m203r() {
        return this.f333w + this.f335y;
    }

    protected int m204s() {
        return this.f334x + this.f336z;
    }

    public int m205t() {
        return m184f() + this.f329s;
    }

    public String toString() {
        return (this.ao != null ? "type: " + this.ao + " " : "") + (this.an != null ? "id: " + this.an + " " : "") + "(" + this.f333w + ", " + this.f334x + ") - (" + this.f329s + " x " + this.f330t + ")" + " wrap: (" + this.ai + " x " + this.aj + ")";
    }

    public int m206u() {
        return m186g() + this.f330t;
    }

    public boolean m207v() {
        return this.f286A > 0;
    }

    public int m208w() {
        return this.f286A;
    }

    public Object m209x() {
        return this.ak;
    }

    public ArrayList<C0053a> mo34y() {
        return this.f327q;
    }

    public void mo28z() {
        int i = this.f333w;
        int i2 = this.f334x;
        int i3 = this.f333w + this.f329s;
        int i4 = this.f334x + this.f330t;
        this.ae = i;
        this.af = i2;
        this.ag = i3 - i;
        this.ah = i4 - i2;
    }
}
