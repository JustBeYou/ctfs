package android.support.constraint.p007a.p008a;

import android.support.constraint.p007a.C0066b;
import android.support.constraint.p007a.C0069e;
import android.support.constraint.p007a.C0074g;
import android.support.constraint.p007a.p008a.C0053a.C0052c;
import android.support.constraint.p007a.p008a.C0056b.C0055a;
import java.util.ArrayList;
import java.util.Arrays;

public class C0058c extends C0057h {
    static boolean ac = true;
    protected C0069e aa = new C0069e();
    protected C0069e ab = null;
    int ad;
    int ae;
    int af;
    int ag;
    int ah;
    int ai;
    private C0064g ak;
    private int al = 0;
    private int am = 0;
    private C0056b[] an = new C0056b[4];
    private C0056b[] ao = new C0056b[4];
    private C0056b[] ap = new C0056b[4];
    private int aq = 2;
    private boolean[] ar = new boolean[3];
    private C0056b[] as = new C0056b[4];
    private boolean at = false;
    private boolean au = false;

    private void m221J() {
        this.al = 0;
        this.am = 0;
    }

    private int m222a(C0069e c0069e, C0056b[] c0056bArr, C0056b c0056b, int i, boolean[] zArr) {
        int i2;
        zArr[0] = true;
        zArr[1] = false;
        c0056bArr[0] = null;
        c0056bArr[2] = null;
        c0056bArr[1] = null;
        c0056bArr[3] = null;
        boolean z;
        C0056b c0056b2;
        C0056b c0056b3;
        C0056b c0056b4;
        C0056b c0056b5;
        C0056b c0056b6;
        int i3;
        if (i == 0) {
            z = c0056b.f319i.f271c == null || c0056b.f319i.f271c.f269a == this;
            c0056b.f309Y = null;
            c0056b2 = null;
            if (c0056b.m178d() != 8) {
                c0056b2 = c0056b;
            }
            c0056b3 = null;
            i2 = 0;
            c0056b4 = c0056b;
            c0056b5 = c0056b2;
            while (c0056b4.f321k.f271c != null) {
                c0056b4.f309Y = null;
                if (c0056b4.m178d() != 8) {
                    c0056b6 = c0056b5 == null ? c0056b4 : c0056b5;
                    if (!(c0056b2 == null || c0056b2 == c0056b4)) {
                        c0056b2.f309Y = c0056b4;
                    }
                    c0056b5 = c0056b4;
                } else {
                    c0069e.m323c(c0056b4.f319i.f274f, c0056b4.f319i.f271c.f274f, 0, 5);
                    c0069e.m323c(c0056b4.f321k.f274f, c0056b4.f319i.f274f, 0, 5);
                    c0056b6 = c0056b5;
                    c0056b5 = c0056b2;
                }
                if (c0056b4.m178d() != 8 && c0056b4.f291G == C0055a.MATCH_CONSTRAINT) {
                    if (c0056b4.f292H == C0055a.MATCH_CONSTRAINT) {
                        zArr[0] = false;
                    }
                    if (c0056b4.f331u <= 0.0f) {
                        zArr[0] = false;
                        if (i2 + 1 >= this.an.length) {
                            this.an = (C0056b[]) Arrays.copyOf(this.an, this.an.length * 2);
                        }
                        i3 = i2 + 1;
                        this.an[i2] = c0056b4;
                        i2 = i3;
                    }
                }
                if (c0056b4.f321k.f271c.f269a.f319i.f271c == null || c0056b4.f321k.f271c.f269a.f319i.f271c.f269a != c0056b4 || c0056b4.f321k.f271c.f269a == c0056b4) {
                    break;
                }
                c0056b2 = c0056b4.f321k.f271c.f269a;
                c0056b3 = c0056b2;
                c0056b4 = c0056b2;
                c0056b2 = c0056b5;
                c0056b5 = c0056b6;
            }
            c0056b6 = c0056b5;
            c0056b5 = c0056b2;
            if (!(c0056b4.f321k.f271c == null || c0056b4.f321k.f271c.f269a == this)) {
                z = false;
            }
            if (c0056b.f319i.f271c == null || c0056b3.f321k.f271c == null) {
                zArr[1] = true;
            }
            c0056b.f305U = z;
            c0056b3.f309Y = null;
            c0056bArr[0] = c0056b;
            c0056bArr[2] = c0056b6;
            c0056bArr[1] = c0056b3;
            c0056bArr[3] = c0056b5;
        } else {
            z = c0056b.f320j.f271c == null || c0056b.f320j.f271c.f269a == this;
            c0056b.f310Z = null;
            c0056b2 = null;
            if (c0056b.m178d() != 8) {
                c0056b2 = c0056b;
            }
            c0056b3 = null;
            i2 = 0;
            c0056b4 = c0056b;
            c0056b5 = c0056b2;
            while (c0056b4.f322l.f271c != null) {
                c0056b4.f310Z = null;
                if (c0056b4.m178d() != 8) {
                    c0056b6 = c0056b5 == null ? c0056b4 : c0056b5;
                    if (!(c0056b2 == null || c0056b2 == c0056b4)) {
                        c0056b2.f310Z = c0056b4;
                    }
                    c0056b5 = c0056b4;
                } else {
                    c0069e.m323c(c0056b4.f320j.f274f, c0056b4.f320j.f271c.f274f, 0, 5);
                    c0069e.m323c(c0056b4.f322l.f274f, c0056b4.f320j.f274f, 0, 5);
                    c0056b6 = c0056b5;
                    c0056b5 = c0056b2;
                }
                if (c0056b4.m178d() != 8 && c0056b4.f292H == C0055a.MATCH_CONSTRAINT) {
                    if (c0056b4.f291G == C0055a.MATCH_CONSTRAINT) {
                        zArr[0] = false;
                    }
                    if (c0056b4.f331u <= 0.0f) {
                        zArr[0] = false;
                        if (i2 + 1 >= this.an.length) {
                            this.an = (C0056b[]) Arrays.copyOf(this.an, this.an.length * 2);
                        }
                        i3 = i2 + 1;
                        this.an[i2] = c0056b4;
                        i2 = i3;
                    }
                }
                if (c0056b4.f322l.f271c.f269a.f320j.f271c == null || c0056b4.f322l.f271c.f269a.f320j.f271c.f269a != c0056b4 || c0056b4.f322l.f271c.f269a == c0056b4) {
                    break;
                }
                c0056b2 = c0056b4.f322l.f271c.f269a;
                c0056b3 = c0056b2;
                c0056b4 = c0056b2;
                c0056b2 = c0056b5;
                c0056b5 = c0056b6;
            }
            c0056b6 = c0056b5;
            c0056b5 = c0056b2;
            if (!(c0056b4.f322l.f271c == null || c0056b4.f322l.f271c.f269a == this)) {
                z = false;
            }
            if (c0056b.f320j.f271c == null || c0056b3.f322l.f271c == null) {
                zArr[1] = true;
            }
            c0056b.f306V = z;
            c0056b3.f310Z = null;
            c0056bArr[0] = c0056b;
            c0056bArr[2] = c0056b6;
            c0056bArr[1] = c0056b3;
            c0056bArr[3] = c0056b5;
        }
        return i2;
    }

    private boolean m223a(C0069e c0069e) {
        int i;
        int i2;
        int size = this.aj.size();
        for (i = 0; i < size; i++) {
            C0056b c0056b = (C0056b) this.aj.get(i);
            c0056b.f311a = -1;
            c0056b.f312b = -1;
            if (c0056b.f291G == C0055a.MATCH_CONSTRAINT || c0056b.f292H == C0055a.MATCH_CONSTRAINT) {
                c0056b.f311a = 1;
                c0056b.f312b = 1;
            }
        }
        int i3 = 0;
        int i4 = 0;
        int i5 = 0;
        boolean z = false;
        while (!z) {
            int i6 = i3 + 1;
            int i7 = 0;
            i2 = 0;
            i = 0;
            while (i7 < size) {
                c0056b = (C0056b) this.aj.get(i7);
                if (c0056b.f311a == -1) {
                    if (this.G == C0055a.WRAP_CONTENT) {
                        c0056b.f311a = 1;
                    } else {
                        C0061e.m255b(this, c0069e, c0056b);
                    }
                }
                if (c0056b.f312b == -1) {
                    if (this.H == C0055a.WRAP_CONTENT) {
                        c0056b.f312b = 1;
                    } else {
                        C0061e.m256c(this, c0069e, c0056b);
                    }
                }
                if (c0056b.f312b == -1) {
                    i++;
                }
                i7++;
                i2 = c0056b.f311a == -1 ? i2 + 1 : i2;
            }
            boolean z2 = (i == 0 && i2 == 0) ? true : (i5 == i && i4 == i2) ? true : z;
            i4 = i2;
            i5 = i;
            z = z2;
            i3 = i6;
        }
        int i8 = 0;
        i2 = 0;
        i = 0;
        while (i8 < size) {
            c0056b = (C0056b) this.aj.get(i8);
            if (c0056b.f311a == 1 || c0056b.f311a == -1) {
                i++;
            }
            i3 = (c0056b.f312b == 1 || c0056b.f312b == -1) ? i2 + 1 : i2;
            i8++;
            i2 = i3;
        }
        return i == 0 && i2 == 0;
    }

    private void m224b(C0069e c0069e) {
        for (int i = 0; i < this.al; i++) {
            C0056b c0056b = this.ap[i];
            int a = m222a(c0069e, this.as, this.ap[i], 0, this.ar);
            C0056b c0056b2 = this.as[2];
            if (c0056b2 != null) {
                int n;
                if (this.ar[1]) {
                    n = c0056b.m199n();
                    while (c0056b2 != null) {
                        c0069e.m317a(c0056b2.f319i.f274f, n);
                        n += (c0056b2.f319i.m141d() + c0056b2.m188h()) + c0056b2.f321k.m141d();
                        c0056b2 = c0056b2.f309Y;
                    }
                } else {
                    Object obj = c0056b.f303S == 0 ? 1 : null;
                    Object obj2 = c0056b.f303S == 2 ? 1 : null;
                    Object obj3 = this.G == C0055a.WRAP_CONTENT ? 1 : null;
                    if ((this.aq == 2 || this.aq == 8) && this.ar[0] && c0056b.f305U && obj2 == null && obj3 == null && c0056b.f303S == 0) {
                        C0061e.m252a(this, c0069e, a, c0056b);
                    } else if (a == 0 || obj2 != null) {
                        C0053a c0053a;
                        int d;
                        int d2;
                        C0074g c0074g;
                        C0056b c0056b3 = null;
                        obj3 = null;
                        C0056b c0056b4 = null;
                        C0056b c0056b5 = c0056b2;
                        while (c0056b5 != null) {
                            Object obj4;
                            C0056b c0056b6;
                            C0056b c0056b7;
                            r5 = c0056b5.f309Y;
                            if (r5 == null) {
                                obj4 = 1;
                                c0056b6 = this.as[1];
                            } else {
                                obj4 = obj3;
                                c0056b6 = c0056b3;
                            }
                            if (obj2 != null) {
                                C0053a c0053a2 = c0056b5.f319i;
                                n = c0053a2.m141d();
                                int d3 = c0056b4 != null ? n + c0056b4.f321k.m141d() : n;
                                n = 1;
                                if (c0056b2 != c0056b5) {
                                    n = 3;
                                }
                                c0069e.m319a(c0053a2.f274f, c0053a2.f271c.f274f, d3, n);
                                if (c0056b5.f291G == C0055a.MATCH_CONSTRAINT) {
                                    r4 = c0056b5.f321k;
                                    if (c0056b5.f313c == 1) {
                                        c0069e.m323c(r4.f274f, c0053a2.f274f, Math.max(c0056b5.f315e, c0056b5.m188h()), 3);
                                    } else {
                                        c0069e.m319a(c0053a2.f274f, c0053a2.f271c.f274f, c0053a2.f272d, 3);
                                        c0069e.m322b(r4.f274f, c0053a2.f274f, c0056b5.f315e, 3);
                                    }
                                }
                                c0056b7 = r5;
                            } else if (obj != null || obj4 == null || c0056b4 == null) {
                                if (obj != null || obj4 != null || c0056b4 != null) {
                                    C0056b c0056b8;
                                    C0053a c0053a3 = c0056b5.f319i;
                                    c0053a = c0056b5.f321k;
                                    d = c0053a3.m141d();
                                    d2 = c0053a.m141d();
                                    c0069e.m319a(c0053a3.f274f, c0053a3.f271c.f274f, d, 1);
                                    c0069e.m322b(c0053a.f274f, c0053a.f271c.f274f, -d2, 1);
                                    r6 = c0053a3.f271c != null ? c0053a3.f271c.f274f : null;
                                    if (c0056b4 == null) {
                                        r6 = c0056b.f319i.f271c != null ? c0056b.f319i.f271c.f274f : null;
                                    }
                                    if (r5 == null) {
                                        c0056b8 = c0056b6.f321k.f271c != null ? c0056b6.f321k.f271c.f269a : null;
                                    } else {
                                        c0056b8 = r5;
                                    }
                                    if (c0056b8 != null) {
                                        c0074g = c0056b8.f319i.f274f;
                                        if (obj4 != null) {
                                            c0074g = c0056b6.f321k.f271c != null ? c0056b6.f321k.f271c.f274f : null;
                                        }
                                        if (!(r6 == null || c0074g == null)) {
                                            c0069e.m318a(c0053a3.f274f, r6, d, 0.5f, c0074g, c0053a.f274f, d2, 4);
                                        }
                                    }
                                    c0056b7 = c0056b8;
                                } else if (c0056b5.f319i.f271c == null) {
                                    c0069e.m317a(c0056b5.f319i.f274f, c0056b5.m199n());
                                    c0056b7 = r5;
                                } else {
                                    c0069e.m323c(c0056b5.f319i.f274f, c0056b.f319i.f271c.f274f, c0056b5.f319i.m141d(), 5);
                                    c0056b7 = r5;
                                }
                            } else if (c0056b5.f321k.f271c == null) {
                                c0069e.m317a(c0056b5.f321k.f274f, c0056b5.m202q());
                                c0056b7 = r5;
                            } else {
                                c0069e.m323c(c0056b5.f321k.f274f, c0056b6.f321k.f271c.f274f, -c0056b5.f321k.m141d(), 5);
                                c0056b7 = r5;
                            }
                            if (obj4 != null) {
                                c0056b7 = null;
                            }
                            c0056b3 = c0056b6;
                            c0056b4 = c0056b5;
                            c0056b5 = c0056b7;
                            obj3 = obj4;
                        }
                        if (obj2 != null) {
                            r4 = c0056b2.f319i;
                            c0053a = c0056b3.f321k;
                            d = r4.m141d();
                            d2 = c0053a.m141d();
                            r6 = c0056b.f319i.f271c != null ? c0056b.f319i.f271c.f274f : null;
                            c0074g = c0056b3.f321k.f271c != null ? c0056b3.f321k.f271c.f274f : null;
                            if (!(r6 == null || c0074g == null)) {
                                c0069e.m322b(c0053a.f274f, c0074g, -d2, 1);
                                c0069e.m318a(r4.f274f, r6, d, c0056b.f289E, c0074g, c0053a.f274f, d2, 4);
                            }
                        }
                    } else {
                        int i2;
                        float f = 0.0f;
                        r5 = null;
                        C0056b c0056b9 = c0056b2;
                        while (c0056b9 != null) {
                            if (c0056b9.f291G != C0055a.MATCH_CONSTRAINT) {
                                n = c0056b9.f319i.m141d();
                                if (r5 != null) {
                                    n += r5.f321k.m141d();
                                }
                                i2 = 3;
                                if (c0056b9.f319i.f271c.f269a.f291G == C0055a.MATCH_CONSTRAINT) {
                                    i2 = 2;
                                }
                                c0069e.m319a(c0056b9.f319i.f274f, c0056b9.f319i.f271c.f274f, n, i2);
                                n = c0056b9.f321k.m141d();
                                if (c0056b9.f321k.f271c.f269a.f319i.f271c != null && c0056b9.f321k.f271c.f269a.f319i.f271c.f269a == c0056b9) {
                                    n += c0056b9.f321k.f271c.f269a.f319i.m141d();
                                }
                                i2 = 3;
                                if (c0056b9.f321k.f271c.f269a.f291G == C0055a.MATCH_CONSTRAINT) {
                                    i2 = 2;
                                }
                                c0069e.m322b(c0056b9.f321k.f274f, c0056b9.f321k.f271c.f274f, -n, i2);
                            } else {
                                f += c0056b9.f307W;
                                n = 0;
                                if (c0056b9.f321k.f271c != null) {
                                    n = c0056b9.f321k.m141d();
                                    if (c0056b9 != this.as[3]) {
                                        n += c0056b9.f321k.f271c.f269a.f319i.m141d();
                                    }
                                }
                                c0069e.m319a(c0056b9.f321k.f274f, c0056b9.f319i.f274f, 0, 1);
                                c0069e.m322b(c0056b9.f321k.f274f, c0056b9.f321k.f271c.f274f, -n, 1);
                            }
                            r5 = c0056b9;
                            c0056b9 = c0056b9.f309Y;
                        }
                        if (a == 1) {
                            c0056b9 = this.an[0];
                            n = c0056b9.f319i.m141d();
                            if (c0056b9.f319i.f271c != null) {
                                n += c0056b9.f319i.f271c.m141d();
                            }
                            i2 = c0056b9.f321k.m141d();
                            if (c0056b9.f321k.f271c != null) {
                                i2 += c0056b9.f321k.f271c.m141d();
                            }
                            r6 = c0056b.f321k.f271c.f274f;
                            if (c0056b9 == this.as[3]) {
                                r6 = this.as[1].f321k.f271c.f274f;
                            }
                            if (c0056b9.f313c == 1) {
                                c0069e.m319a(c0056b.f319i.f274f, c0056b.f319i.f271c.f274f, n, 1);
                                c0069e.m322b(c0056b.f321k.f274f, r6, -i2, 1);
                                c0069e.m323c(c0056b.f321k.f274f, c0056b.f319i.f274f, c0056b.m188h(), 2);
                            } else {
                                c0069e.m323c(c0056b9.f319i.f274f, c0056b9.f319i.f271c.f274f, n, 1);
                                c0069e.m323c(c0056b9.f321k.f274f, r6, -i2, 1);
                            }
                        } else {
                            for (int i3 = 0; i3 < a - 1; i3++) {
                                C0056b c0056b10 = this.an[i3];
                                c0056b2 = this.an[i3 + 1];
                                C0074g c0074g2 = c0056b10.f319i.f274f;
                                C0074g c0074g3 = c0056b10.f321k.f274f;
                                C0074g c0074g4 = c0056b2.f319i.f274f;
                                C0074g c0074g5 = c0056b2.f321k.f274f;
                                if (c0056b2 == this.as[3]) {
                                    c0074g5 = this.as[1].f321k.f274f;
                                }
                                n = c0056b10.f319i.m141d();
                                if (!(c0056b10.f319i.f271c == null || c0056b10.f319i.f271c.f269a.f321k.f271c == null || c0056b10.f319i.f271c.f269a.f321k.f271c.f269a != c0056b10)) {
                                    n += c0056b10.f319i.f271c.f269a.f321k.m141d();
                                }
                                c0069e.m319a(c0074g2, c0056b10.f319i.f271c.f274f, n, 2);
                                i2 = c0056b10.f321k.m141d();
                                if (c0056b10.f321k.f271c == null || c0056b10.f309Y == null) {
                                    n = i2;
                                } else {
                                    n = (c0056b10.f309Y.f319i.f271c != null ? c0056b10.f309Y.f319i.m141d() : 0) + i2;
                                }
                                c0069e.m322b(c0074g3, c0056b10.f321k.f271c.f274f, -n, 2);
                                if (i3 + 1 == a - 1) {
                                    n = c0056b2.f319i.m141d();
                                    if (!(c0056b2.f319i.f271c == null || c0056b2.f319i.f271c.f269a.f321k.f271c == null || c0056b2.f319i.f271c.f269a.f321k.f271c.f269a != c0056b2)) {
                                        n += c0056b2.f319i.f271c.f269a.f321k.m141d();
                                    }
                                    c0069e.m319a(c0074g4, c0056b2.f319i.f271c.f274f, n, 2);
                                    r4 = c0056b2.f321k;
                                    if (c0056b2 == this.as[3]) {
                                        r4 = this.as[1].f321k;
                                    }
                                    i2 = r4.m141d();
                                    if (!(r4.f271c == null || r4.f271c.f269a.f319i.f271c == null || r4.f271c.f269a.f319i.f271c.f269a != c0056b2)) {
                                        i2 += r4.f271c.f269a.f319i.m141d();
                                    }
                                    c0069e.m322b(c0074g5, r4.f271c.f274f, -i2, 2);
                                }
                                if (c0056b.f316f > 0) {
                                    c0069e.m322b(c0074g3, c0074g2, c0056b.f316f, 2);
                                }
                                C0066b b = c0069e.m321b();
                                b.m275a(c0056b10.f307W, f, c0056b2.f307W, c0074g2, c0056b10.f319i.m141d(), c0074g3, c0056b10.f321k.m141d(), c0074g4, c0056b2.f319i.m141d(), c0074g5, c0056b2.f321k.m141d());
                                c0069e.m315a(b);
                            }
                        }
                    }
                }
            }
        }
    }

    private void m225c(C0069e c0069e) {
        for (int i = 0; i < this.am; i++) {
            C0056b c0056b = this.ao[i];
            int a = m222a(c0069e, this.as, this.ao[i], 1, this.ar);
            C0056b c0056b2 = this.as[2];
            if (c0056b2 != null) {
                int o;
                if (this.ar[1]) {
                    o = c0056b.m200o();
                    while (c0056b2 != null) {
                        c0069e.m317a(c0056b2.f320j.f274f, o);
                        o += (c0056b2.f320j.m141d() + c0056b2.m196l()) + c0056b2.f322l.m141d();
                        c0056b2 = c0056b2.f310Z;
                    }
                } else {
                    Object obj = c0056b.f304T == 0 ? 1 : null;
                    Object obj2 = c0056b.f304T == 2 ? 1 : null;
                    Object obj3 = this.H == C0055a.WRAP_CONTENT ? 1 : null;
                    if ((this.aq == 2 || this.aq == 8) && this.ar[0] && c0056b.f306V && obj2 == null && obj3 == null && c0056b.f304T == 0) {
                        C0061e.m254b(this, c0069e, a, c0056b);
                    } else if (a == 0 || obj2 != null) {
                        C0053a c0053a;
                        int d;
                        int d2;
                        C0074g c0074g;
                        C0056b c0056b3 = null;
                        obj3 = null;
                        C0056b c0056b4 = null;
                        C0056b c0056b5 = c0056b2;
                        while (c0056b5 != null) {
                            Object obj4;
                            C0056b c0056b6;
                            C0056b c0056b7;
                            r5 = c0056b5.f310Z;
                            if (r5 == null) {
                                obj4 = 1;
                                c0056b6 = this.as[1];
                            } else {
                                obj4 = obj3;
                                c0056b6 = c0056b3;
                            }
                            if (obj2 != null) {
                                c0053a = c0056b5.f320j;
                                int d3 = c0053a.m141d();
                                if (c0056b4 != null) {
                                    d3 += c0056b4.f322l.m141d();
                                }
                                o = 1;
                                if (c0056b2 != c0056b5) {
                                    o = 3;
                                }
                                C0074g c0074g2 = null;
                                r6 = null;
                                if (c0053a.f271c != null) {
                                    c0074g2 = c0053a.f274f;
                                    r6 = c0053a.f271c.f274f;
                                } else if (c0056b5.f323m.f271c != null) {
                                    c0074g2 = c0056b5.f323m.f274f;
                                    r6 = c0056b5.f323m.f271c.f274f;
                                    d3 -= c0053a.m141d();
                                }
                                if (!(c0074g2 == null || r6 == null)) {
                                    c0069e.m319a(c0074g2, r6, d3, o);
                                }
                                if (c0056b5.f292H == C0055a.MATCH_CONSTRAINT) {
                                    r4 = c0056b5.f322l;
                                    if (c0056b5.f314d == 1) {
                                        c0069e.m323c(r4.f274f, c0053a.f274f, Math.max(c0056b5.f317g, c0056b5.m196l()), 3);
                                    } else {
                                        c0069e.m319a(c0053a.f274f, c0053a.f271c.f274f, c0053a.f272d, 3);
                                        c0069e.m322b(r4.f274f, c0053a.f274f, c0056b5.f317g, 3);
                                    }
                                }
                                c0056b7 = r5;
                            } else if (obj != null || obj4 == null || c0056b4 == null) {
                                if (obj != null || obj4 != null || c0056b4 != null) {
                                    C0056b c0056b8;
                                    C0053a c0053a2 = c0056b5.f320j;
                                    c0053a = c0056b5.f322l;
                                    d = c0053a2.m141d();
                                    d2 = c0053a.m141d();
                                    c0069e.m319a(c0053a2.f274f, c0053a2.f271c.f274f, d, 1);
                                    c0069e.m322b(c0053a.f274f, c0053a.f271c.f274f, -d2, 1);
                                    r6 = c0053a2.f271c != null ? c0053a2.f271c.f274f : null;
                                    if (c0056b4 == null) {
                                        r6 = c0056b.f320j.f271c != null ? c0056b.f320j.f271c.f274f : null;
                                    }
                                    if (r5 == null) {
                                        c0056b8 = c0056b6.f322l.f271c != null ? c0056b6.f322l.f271c.f269a : null;
                                    } else {
                                        c0056b8 = r5;
                                    }
                                    if (c0056b8 != null) {
                                        c0074g = c0056b8.f320j.f274f;
                                        if (obj4 != null) {
                                            c0074g = c0056b6.f322l.f271c != null ? c0056b6.f322l.f271c.f274f : null;
                                        }
                                        if (!(r6 == null || c0074g == null)) {
                                            c0069e.m318a(c0053a2.f274f, r6, d, 0.5f, c0074g, c0053a.f274f, d2, 4);
                                        }
                                    }
                                    c0056b7 = c0056b8;
                                } else if (c0056b5.f320j.f271c == null) {
                                    c0069e.m317a(c0056b5.f320j.f274f, c0056b5.m200o());
                                    c0056b7 = r5;
                                } else {
                                    c0069e.m323c(c0056b5.f320j.f274f, c0056b.f320j.f271c.f274f, c0056b5.f320j.m141d(), 5);
                                    c0056b7 = r5;
                                }
                            } else if (c0056b5.f322l.f271c == null) {
                                c0069e.m317a(c0056b5.f322l.f274f, c0056b5.m201p());
                                c0056b7 = r5;
                            } else {
                                c0069e.m323c(c0056b5.f322l.f274f, c0056b6.f322l.f271c.f274f, -c0056b5.f322l.m141d(), 5);
                                c0056b7 = r5;
                            }
                            if (obj4 != null) {
                                c0056b7 = null;
                            }
                            c0056b3 = c0056b6;
                            c0056b4 = c0056b5;
                            c0056b5 = c0056b7;
                            obj3 = obj4;
                        }
                        if (obj2 != null) {
                            r4 = c0056b2.f320j;
                            c0053a = c0056b3.f322l;
                            d = r4.m141d();
                            d2 = c0053a.m141d();
                            r6 = c0056b.f320j.f271c != null ? c0056b.f320j.f271c.f274f : null;
                            c0074g = c0056b3.f322l.f271c != null ? c0056b3.f322l.f271c.f274f : null;
                            if (!(r6 == null || c0074g == null)) {
                                c0069e.m322b(c0053a.f274f, c0074g, -d2, 1);
                                c0069e.m318a(r4.f274f, r6, d, c0056b.f290F, c0074g, c0053a.f274f, d2, 4);
                            }
                        }
                    } else {
                        int i2;
                        float f = 0.0f;
                        r5 = null;
                        C0056b c0056b9 = c0056b2;
                        while (c0056b9 != null) {
                            if (c0056b9.f292H != C0055a.MATCH_CONSTRAINT) {
                                o = c0056b9.f320j.m141d();
                                if (r5 != null) {
                                    o += r5.f322l.m141d();
                                }
                                i2 = 3;
                                if (c0056b9.f320j.f271c.f269a.f292H == C0055a.MATCH_CONSTRAINT) {
                                    i2 = 2;
                                }
                                c0069e.m319a(c0056b9.f320j.f274f, c0056b9.f320j.f271c.f274f, o, i2);
                                o = c0056b9.f322l.m141d();
                                if (c0056b9.f322l.f271c.f269a.f320j.f271c != null && c0056b9.f322l.f271c.f269a.f320j.f271c.f269a == c0056b9) {
                                    o += c0056b9.f322l.f271c.f269a.f320j.m141d();
                                }
                                i2 = 3;
                                if (c0056b9.f322l.f271c.f269a.f292H == C0055a.MATCH_CONSTRAINT) {
                                    i2 = 2;
                                }
                                c0069e.m322b(c0056b9.f322l.f274f, c0056b9.f322l.f271c.f274f, -o, i2);
                            } else {
                                f += c0056b9.f308X;
                                o = 0;
                                if (c0056b9.f322l.f271c != null) {
                                    o = c0056b9.f322l.m141d();
                                    if (c0056b9 != this.as[3]) {
                                        o += c0056b9.f322l.f271c.f269a.f320j.m141d();
                                    }
                                }
                                c0069e.m319a(c0056b9.f322l.f274f, c0056b9.f320j.f274f, 0, 1);
                                c0069e.m322b(c0056b9.f322l.f274f, c0056b9.f322l.f271c.f274f, -o, 1);
                            }
                            r5 = c0056b9;
                            c0056b9 = c0056b9.f310Z;
                        }
                        if (a == 1) {
                            c0056b9 = this.an[0];
                            o = c0056b9.f320j.m141d();
                            if (c0056b9.f320j.f271c != null) {
                                o += c0056b9.f320j.f271c.m141d();
                            }
                            i2 = c0056b9.f322l.m141d();
                            if (c0056b9.f322l.f271c != null) {
                                i2 += c0056b9.f322l.f271c.m141d();
                            }
                            r6 = c0056b.f322l.f271c.f274f;
                            if (c0056b9 == this.as[3]) {
                                r6 = this.as[1].f322l.f271c.f274f;
                            }
                            if (c0056b9.f314d == 1) {
                                c0069e.m319a(c0056b.f320j.f274f, c0056b.f320j.f271c.f274f, o, 1);
                                c0069e.m322b(c0056b.f322l.f274f, r6, -i2, 1);
                                c0069e.m323c(c0056b.f322l.f274f, c0056b.f320j.f274f, c0056b.m196l(), 2);
                            } else {
                                c0069e.m323c(c0056b9.f320j.f274f, c0056b9.f320j.f271c.f274f, o, 1);
                                c0069e.m323c(c0056b9.f322l.f274f, r6, -i2, 1);
                            }
                        } else {
                            for (int i3 = 0; i3 < a - 1; i3++) {
                                C0056b c0056b10 = this.an[i3];
                                c0056b2 = this.an[i3 + 1];
                                C0074g c0074g3 = c0056b10.f320j.f274f;
                                C0074g c0074g4 = c0056b10.f322l.f274f;
                                C0074g c0074g5 = c0056b2.f320j.f274f;
                                C0074g c0074g6 = c0056b2.f322l.f274f;
                                if (c0056b2 == this.as[3]) {
                                    c0074g6 = this.as[1].f322l.f274f;
                                }
                                o = c0056b10.f320j.m141d();
                                if (!(c0056b10.f320j.f271c == null || c0056b10.f320j.f271c.f269a.f322l.f271c == null || c0056b10.f320j.f271c.f269a.f322l.f271c.f269a != c0056b10)) {
                                    o += c0056b10.f320j.f271c.f269a.f322l.m141d();
                                }
                                c0069e.m319a(c0074g3, c0056b10.f320j.f271c.f274f, o, 2);
                                i2 = c0056b10.f322l.m141d();
                                if (c0056b10.f322l.f271c == null || c0056b10.f310Z == null) {
                                    o = i2;
                                } else {
                                    o = (c0056b10.f310Z.f320j.f271c != null ? c0056b10.f310Z.f320j.m141d() : 0) + i2;
                                }
                                c0069e.m322b(c0074g4, c0056b10.f322l.f271c.f274f, -o, 2);
                                if (i3 + 1 == a - 1) {
                                    o = c0056b2.f320j.m141d();
                                    if (!(c0056b2.f320j.f271c == null || c0056b2.f320j.f271c.f269a.f322l.f271c == null || c0056b2.f320j.f271c.f269a.f322l.f271c.f269a != c0056b2)) {
                                        o += c0056b2.f320j.f271c.f269a.f322l.m141d();
                                    }
                                    c0069e.m319a(c0074g5, c0056b2.f320j.f271c.f274f, o, 2);
                                    r4 = c0056b2.f322l;
                                    if (c0056b2 == this.as[3]) {
                                        r4 = this.as[1].f322l;
                                    }
                                    i2 = r4.m141d();
                                    if (!(r4.f271c == null || r4.f271c.f269a.f320j.f271c == null || r4.f271c.f269a.f320j.f271c.f269a != c0056b2)) {
                                        i2 += r4.f271c.f269a.f320j.m141d();
                                    }
                                    c0069e.m322b(c0074g6, r4.f271c.f274f, -i2, 2);
                                }
                                if (c0056b.f318h > 0) {
                                    c0069e.m322b(c0074g4, c0074g3, c0056b.f318h, 2);
                                }
                                C0066b b = c0069e.m321b();
                                b.m275a(c0056b10.f308X, f, c0056b2.f308X, c0074g3, c0056b10.f320j.m141d(), c0074g4, c0056b10.f322l.m141d(), c0074g5, c0056b2.f320j.m141d(), c0074g6, c0056b2.f322l.m141d());
                                c0069e.m315a(b);
                            }
                        }
                    }
                }
            }
        }
    }

    private void m226d(C0056b c0056b) {
        int i = 0;
        while (i < this.al) {
            if (this.ap[i] != c0056b) {
                i++;
            } else {
                return;
            }
        }
        if (this.al + 1 >= this.ap.length) {
            this.ap = (C0056b[]) Arrays.copyOf(this.ap, this.ap.length * 2);
        }
        this.ap[this.al] = c0056b;
        this.al++;
    }

    private void m227e(C0056b c0056b) {
        int i = 0;
        while (i < this.am) {
            if (this.ao[i] != c0056b) {
                i++;
            } else {
                return;
            }
        }
        if (this.am + 1 >= this.ao.length) {
            this.ao = (C0056b[]) Arrays.copyOf(this.ao, this.ao.length * 2);
        }
        this.ao[this.am] = c0056b;
        this.am++;
    }

    public boolean mo29D() {
        return this.at;
    }

    public boolean m229E() {
        return this.au;
    }

    public void mo30F() {
        boolean z;
        int size;
        int i;
        C0056b c0056b;
        int i2;
        boolean z2;
        int max;
        int i3 = this.w;
        int i4 = this.x;
        int max2 = Math.max(0, m188h());
        int max3 = Math.max(0, m196l());
        this.at = false;
        this.au = false;
        if (this.r != null) {
            if (this.ak == null) {
                this.ak = new C0064g(this);
            }
            this.ak.m259a(this);
            m168b(this.af);
            m176c(this.ag);
            m150A();
            mo26a(this.aa.m327f());
        } else {
            this.w = 0;
            this.x = 0;
        }
        boolean z3 = false;
        C0055a c0055a = this.H;
        C0055a c0055a2 = this.G;
        if (this.aq == 2 && (this.H == C0055a.WRAP_CONTENT || this.G == C0055a.WRAP_CONTENT)) {
            m236a(this.aj, this.ar);
            z3 = this.ar[0];
            if (max2 > 0 && max3 > 0 && (this.ad > max2 || this.ae > max3)) {
                z3 = false;
            }
            if (z3) {
                if (this.G == C0055a.WRAP_CONTENT) {
                    this.G = C0055a.FIXED;
                    if (max2 <= 0 || max2 >= this.ad) {
                        m180d(Math.max(this.B, this.ad));
                    } else {
                        this.at = true;
                        m180d(max2);
                    }
                }
                if (this.H == C0055a.WRAP_CONTENT) {
                    this.H = C0055a.FIXED;
                    if (max3 <= 0 || max3 >= this.ae) {
                        m183e(Math.max(this.C, this.ae));
                    } else {
                        this.au = true;
                        m183e(max3);
                        z = z3;
                        m221J();
                        size = this.aj.size();
                        for (i = 0; i < size; i++) {
                            c0056b = (C0056b) this.aj.get(i);
                            if (c0056b instanceof C0057h) {
                                ((C0057h) c0056b).mo30F();
                            }
                        }
                        i2 = 0;
                        z2 = z;
                        z = true;
                        while (z) {
                            int i5;
                            i5 = i2 + 1;
                            try {
                                this.aa.m314a();
                                z = m238c(this.aa, Integer.MAX_VALUE);
                                if (z) {
                                    this.aa.m326e();
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                            if (z) {
                                mo33b(this.aa, Integer.MAX_VALUE);
                                while (max < size) {
                                    c0056b = (C0056b) this.aj.get(max);
                                    if (c0056b.f291G == C0055a.MATCH_CONSTRAINT || c0056b.m188h() >= c0056b.m194k()) {
                                        if (c0056b.f292H != C0055a.MATCH_CONSTRAINT && c0056b.m196l() < c0056b.m198m()) {
                                            this.ar[2] = true;
                                            break;
                                        }
                                    } else {
                                        this.ar[2] = true;
                                        break;
                                    }
                                }
                            }
                            m235a(this.aa, Integer.MAX_VALUE, this.ar);
                            if (i5 < 8 || !this.ar[2]) {
                                z3 = false;
                                z = z2;
                            } else {
                                int i6;
                                int i7 = 0;
                                int i8 = 0;
                                for (i6 = 0; i6 < size; i6++) {
                                    c0056b = (C0056b) this.aj.get(i6);
                                    i7 = Math.max(i7, c0056b.f333w + c0056b.m188h());
                                    i8 = Math.max(i8, c0056b.m196l() + c0056b.f334x);
                                }
                                i2 = Math.max(this.B, i7);
                                i6 = Math.max(this.C, i8);
                                if (c0055a2 != C0055a.WRAP_CONTENT || m188h() >= i2) {
                                    z3 = false;
                                    z = z2;
                                } else {
                                    m180d(i2);
                                    this.G = C0055a.WRAP_CONTENT;
                                    z = true;
                                    z3 = true;
                                }
                                if (c0055a == C0055a.WRAP_CONTENT && m196l() < i6) {
                                    m183e(i6);
                                    this.H = C0055a.WRAP_CONTENT;
                                    z = true;
                                    z3 = true;
                                }
                            }
                            i = Math.max(this.B, m188h());
                            if (i > m188h()) {
                                m180d(i);
                                this.G = C0055a.FIXED;
                                z = true;
                                z3 = true;
                            }
                            i = Math.max(this.C, m196l());
                            if (i > m196l()) {
                                m183e(i);
                                this.H = C0055a.FIXED;
                                z = true;
                                z3 = true;
                            }
                            if (z) {
                                if (this.G == C0055a.WRAP_CONTENT && max2 > 0 && m188h() > max2) {
                                    this.at = true;
                                    z = true;
                                    this.G = C0055a.FIXED;
                                    m180d(max2);
                                    z3 = true;
                                }
                                if (this.H == C0055a.WRAP_CONTENT && max3 > 0 && m196l() > max3) {
                                    this.au = true;
                                    z = true;
                                    this.H = C0055a.FIXED;
                                    m183e(max3);
                                    z3 = true;
                                }
                            }
                            z2 = z;
                            z = z3;
                            i2 = i5;
                        }
                        if (this.r == null) {
                            i2 = Math.max(this.B, m188h());
                            max = Math.max(this.C, m196l());
                            this.ak.m260b(this);
                            m180d((i2 + this.af) + this.ah);
                            m183e((this.ag + max) + this.ai);
                        } else {
                            this.w = i3;
                            this.x = i4;
                        }
                        if (z2) {
                            this.G = c0055a2;
                            this.H = c0055a;
                        }
                        mo26a(this.aa.m327f());
                        if (this == m213H()) {
                            mo28z();
                        }
                    }
                }
            }
        }
        z = z3;
        m221J();
        size = this.aj.size();
        for (i = 0; i < size; i++) {
            c0056b = (C0056b) this.aj.get(i);
            if (c0056b instanceof C0057h) {
                ((C0057h) c0056b).mo30F();
            }
        }
        i2 = 0;
        z2 = z;
        z = true;
        while (z) {
            i5 = i2 + 1;
            this.aa.m314a();
            z = m238c(this.aa, Integer.MAX_VALUE);
            if (z) {
                this.aa.m326e();
            }
            if (z) {
                mo33b(this.aa, Integer.MAX_VALUE);
                for (max = 0; max < size; max++) {
                    c0056b = (C0056b) this.aj.get(max);
                    if (c0056b.f291G == C0055a.MATCH_CONSTRAINT) {
                    }
                    if (c0056b.f292H != C0055a.MATCH_CONSTRAINT) {
                    }
                }
            } else {
                m235a(this.aa, Integer.MAX_VALUE, this.ar);
            }
            if (i5 < 8) {
            }
            z3 = false;
            z = z2;
            i = Math.max(this.B, m188h());
            if (i > m188h()) {
                m180d(i);
                this.G = C0055a.FIXED;
                z = true;
                z3 = true;
            }
            i = Math.max(this.C, m196l());
            if (i > m196l()) {
                m183e(i);
                this.H = C0055a.FIXED;
                z = true;
                z3 = true;
            }
            if (z) {
                this.at = true;
                z = true;
                this.G = C0055a.FIXED;
                m180d(max2);
                z3 = true;
                this.au = true;
                z = true;
                this.H = C0055a.FIXED;
                m183e(max3);
                z3 = true;
            }
            z2 = z;
            z = z3;
            i2 = i5;
        }
        if (this.r == null) {
            this.w = i3;
            this.x = i4;
        } else {
            i2 = Math.max(this.B, m188h());
            max = Math.max(this.C, m196l());
            this.ak.m260b(this);
            m180d((i2 + this.af) + this.ah);
            m183e((this.ag + max) + this.ai);
        }
        if (z2) {
            this.G = c0055a2;
            this.H = c0055a;
        }
        mo26a(this.aa.m327f());
        if (this == m213H()) {
            mo28z();
        }
    }

    public boolean m231G() {
        return false;
    }

    public void mo25a() {
        this.aa.m314a();
        this.af = 0;
        this.ah = 0;
        this.ag = 0;
        this.ai = 0;
        super.mo25a();
    }

    void m233a(C0056b c0056b, int i) {
        if (i == 0) {
            while (c0056b.f319i.f271c != null && c0056b.f319i.f271c.f269a.f321k.f271c != null && c0056b.f319i.f271c.f269a.f321k.f271c == c0056b.f319i && c0056b.f319i.f271c.f269a != c0056b) {
                c0056b = c0056b.f319i.f271c.f269a;
            }
            m226d(c0056b);
        } else if (i == 1) {
            while (c0056b.f320j.f271c != null && c0056b.f320j.f271c.f269a.f322l.f271c != null && c0056b.f320j.f271c.f269a.f322l.f271c == c0056b.f320j && c0056b.f320j.f271c.f269a != c0056b) {
                c0056b = c0056b.f320j.f271c.f269a;
            }
            m227e(c0056b);
        }
    }

    public void m234a(C0056b c0056b, boolean[] zArr) {
        C0056b c0056b2 = null;
        boolean z = false;
        if (c0056b.f291G == C0055a.MATCH_CONSTRAINT && c0056b.f292H == C0055a.MATCH_CONSTRAINT && c0056b.f331u > 0.0f) {
            zArr[0] = false;
            return;
        }
        boolean i = c0056b.m190i();
        if (c0056b.f291G != C0055a.MATCH_CONSTRAINT || c0056b.f292H == C0055a.MATCH_CONSTRAINT || c0056b.f331u <= 0.0f) {
            int i2;
            int i3;
            c0056b.f301Q = true;
            if (c0056b instanceof C0060d) {
                int i4;
                C0060d c0060d = (C0060d) c0056b;
                if (c0060d.mo29D() != 1) {
                    i4 = i;
                    z = i;
                } else if (c0060d.m242F() != -1) {
                    i4 = c0060d.m242F();
                } else if (c0060d.m243G() != -1) {
                    i = c0060d.m243G();
                    i4 = 0;
                    z = i;
                } else {
                    i4 = 0;
                }
                i2 = i4;
                i3 = z;
            } else if (!c0056b.f321k.m147j() && !c0056b.f319i.m147j()) {
                boolean z2 = i;
                i2 = c0056b.m184f() + i;
            } else if (c0056b.f321k.f271c == null || c0056b.f319i.f271c == null || (c0056b.f321k.f271c != c0056b.f319i.f271c && (c0056b.f321k.f271c.f269a != c0056b.f319i.f271c.f269a || c0056b.f321k.f271c.f269a == c0056b.f328r))) {
                C0056b c0056b3;
                if (c0056b.f321k.f271c != null) {
                    c0056b3 = c0056b.f321k.f271c.f269a;
                    i3 = c0056b.f321k.m141d() + i;
                    if (!(c0056b3.m173b() || c0056b3.f301Q)) {
                        m234a(c0056b3, zArr);
                    }
                } else {
                    c0056b3 = null;
                    i3 = i;
                }
                if (c0056b.f319i.f271c != null) {
                    c0056b2 = c0056b.f319i.f271c.f269a;
                    i2 = i + c0056b.f319i.m141d();
                    if (!(c0056b2.m173b() || c0056b2.f301Q)) {
                        m234a(c0056b2, zArr);
                    }
                }
                if (!(c0056b.f321k.f271c == null || c0056b3.m173b())) {
                    if (c0056b.f321k.f271c.f270b == C0052c.RIGHT) {
                        i3 += c0056b3.f295K - c0056b3.m190i();
                    } else if (c0056b.f321k.f271c.m140c() == C0052c.LEFT) {
                        i3 += c0056b3.f295K;
                    }
                    boolean z3 = c0056b3.f298N || !(c0056b3.f319i.f271c == null || c0056b3.f321k.f271c == null || c0056b3.f291G == C0055a.MATCH_CONSTRAINT);
                    c0056b.f298N = z3;
                    if (c0056b.f298N) {
                        if (c0056b3.f319i.f271c != null) {
                            if (c0056b3.f319i.f271c.f269a != c0056b) {
                            }
                        }
                        i3 += i3 - c0056b3.f295K;
                    }
                }
                if (!(c0056b.f319i.f271c == null || c0056b2.m173b())) {
                    if (c0056b.f319i.f271c.m140c() == C0052c.LEFT) {
                        i2 += c0056b2.f294J - c0056b2.m190i();
                    } else if (c0056b.f319i.f271c.m140c() == C0052c.RIGHT) {
                        i2 += c0056b2.f294J;
                    }
                    if (c0056b2.f297M || !(c0056b2.f319i.f271c == null || c0056b2.f321k.f271c == null || c0056b2.f291G == C0055a.MATCH_CONSTRAINT)) {
                        z = true;
                    }
                    c0056b.f297M = z;
                    if (c0056b.f297M) {
                        if (c0056b2.f321k.f271c != null) {
                            if (c0056b2.f321k.f271c.f269a != c0056b) {
                            }
                        }
                        i2 += i2 - c0056b2.f294J;
                    }
                }
            } else {
                zArr[0] = false;
                return;
            }
            if (c0056b.m178d() == 8) {
                i2 -= c0056b.f329s;
                i3 -= c0056b.f329s;
            }
            c0056b.f294J = i2;
            c0056b.f295K = i3;
            return;
        }
        zArr[0] = false;
    }

    public void m235a(C0069e c0069e, int i, boolean[] zArr) {
        zArr[2] = false;
        mo33b(c0069e, i);
        int size = this.aj.size();
        for (int i2 = 0; i2 < size; i2++) {
            C0056b c0056b = (C0056b) this.aj.get(i2);
            c0056b.mo33b(c0069e, i);
            if (c0056b.f291G == C0055a.MATCH_CONSTRAINT && c0056b.m188h() < c0056b.m194k()) {
                zArr[2] = true;
            }
            if (c0056b.f292H == C0055a.MATCH_CONSTRAINT && c0056b.m196l() < c0056b.m198m()) {
                zArr[2] = true;
            }
        }
    }

    public void m236a(ArrayList<C0056b> arrayList, boolean[] zArr) {
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        int size = arrayList.size();
        zArr[0] = true;
        int i7 = 0;
        while (i7 < size) {
            int i8;
            int i9;
            int i10;
            C0056b c0056b = (C0056b) arrayList.get(i7);
            if (c0056b.m173b()) {
                i8 = i6;
                i9 = i5;
                i10 = i4;
                i6 = i3;
                i5 = i2;
                i4 = i;
            } else {
                if (!c0056b.f301Q) {
                    m234a(c0056b, zArr);
                }
                if (!c0056b.f302R) {
                    m237b(c0056b, zArr);
                }
                if (zArr[0]) {
                    i9 = (c0056b.f294J + c0056b.f295K) - c0056b.m188h();
                    i10 = (c0056b.f293I + c0056b.f296L) - c0056b.m196l();
                    if (c0056b.f291G == C0055a.MATCH_PARENT) {
                        i9 = (c0056b.m188h() + c0056b.f319i.f272d) + c0056b.f321k.f272d;
                    }
                    if (c0056b.f292H == C0055a.MATCH_PARENT) {
                        i10 = (c0056b.m196l() + c0056b.f320j.f272d) + c0056b.f322l.f272d;
                    }
                    if (c0056b.m178d() == 8) {
                        i9 = 0;
                        i10 = 0;
                    }
                    i2 = Math.max(i2, c0056b.f294J);
                    i3 = Math.max(i3, c0056b.f295K);
                    i4 = Math.max(i4, c0056b.f296L);
                    i = Math.max(i, c0056b.f293I);
                    i9 = Math.max(i5, i9);
                    i8 = Math.max(i6, i10);
                    i10 = i4;
                    i6 = i3;
                    i5 = i2;
                    i4 = i;
                } else {
                    return;
                }
            }
            i7++;
            i2 = i5;
            i = i4;
            i4 = i10;
            i3 = i6;
            i5 = i9;
            i6 = i8;
        }
        this.ad = Math.max(this.B, Math.max(Math.max(i2, i3), i5));
        this.ae = Math.max(this.C, Math.max(Math.max(i, i4), i6));
        for (i9 = 0; i9 < size; i9++) {
            c0056b = (C0056b) arrayList.get(i9);
            c0056b.f301Q = false;
            c0056b.f302R = false;
            c0056b.f297M = false;
            c0056b.f298N = false;
            c0056b.f299O = false;
            c0056b.f300P = false;
        }
    }

    public void m237b(C0056b c0056b, boolean[] zArr) {
        C0056b c0056b2 = null;
        boolean z = false;
        if (c0056b.f292H != C0055a.MATCH_CONSTRAINT || c0056b.f291G == C0055a.MATCH_CONSTRAINT || c0056b.f331u <= 0.0f) {
            int i;
            int i2;
            boolean j = c0056b.m192j();
            c0056b.f302R = true;
            int i3;
            if (c0056b instanceof C0060d) {
                C0060d c0060d = (C0060d) c0056b;
                if (c0060d.mo29D() != 0) {
                    i3 = j;
                    z = j;
                } else if (c0060d.m242F() != -1) {
                    j = c0060d.m242F();
                    i3 = 0;
                    z = j;
                } else {
                    i3 = c0060d.m243G() != -1 ? c0060d.m243G() : 0;
                }
                i = i3;
                i2 = z;
            } else if (c0056b.f323m.f271c == null && c0056b.f320j.f271c == null && c0056b.f322l.f271c == null) {
                i2 = j + c0056b.m186g();
            } else if (c0056b.f322l.f271c != null && c0056b.f320j.f271c != null && (c0056b.f322l.f271c == c0056b.f320j.f271c || (c0056b.f322l.f271c.f269a == c0056b.f320j.f271c.f269a && c0056b.f322l.f271c.f269a != c0056b.f328r))) {
                zArr[0] = false;
                return;
            } else if (c0056b.f323m.m147j()) {
                r0 = c0056b.f323m.f271c.m139b();
                if (!r0.f302R) {
                    m237b(r0, zArr);
                }
                int max = Math.max((r0.f293I - r0.f330t) + j, j);
                i3 = Math.max((r0.f296L - r0.f330t) + j, j);
                if (c0056b.m178d() == 8) {
                    max -= c0056b.f330t;
                    i3 -= c0056b.f330t;
                }
                c0056b.f293I = max;
                c0056b.f296L = i3;
                return;
            } else {
                if (c0056b.f320j.m147j()) {
                    r0 = c0056b.f320j.f271c.m139b();
                    i2 = c0056b.f320j.m141d() + j;
                    if (!(r0.m173b() || r0.f302R)) {
                        m237b(r0, zArr);
                    }
                } else {
                    r0 = null;
                    i2 = j;
                }
                if (c0056b.f322l.m147j()) {
                    c0056b2 = c0056b.f322l.f271c.m139b();
                    i = j + c0056b.f322l.m141d();
                    if (!(c0056b2.m173b() || c0056b2.f302R)) {
                        m237b(c0056b2, zArr);
                    }
                }
                if (!(c0056b.f320j.f271c == null || r0.m173b())) {
                    if (c0056b.f320j.f271c.m140c() == C0052c.TOP) {
                        i2 += r0.f293I - r0.m192j();
                    } else if (c0056b.f320j.f271c.m140c() == C0052c.BOTTOM) {
                        i2 += r0.f293I;
                    }
                    boolean z2 = r0.f299O || !(r0.f320j.f271c == null || r0.f320j.f271c.f269a == c0056b || r0.f322l.f271c == null || r0.f322l.f271c.f269a == c0056b || r0.f292H == C0055a.MATCH_CONSTRAINT);
                    c0056b.f299O = z2;
                    if (c0056b.f299O) {
                        if (r0.f322l.f271c != null) {
                            if (r0.f322l.f271c.f269a != c0056b) {
                            }
                        }
                        i2 += i2 - r0.f293I;
                    }
                }
                if (!(c0056b.f322l.f271c == null || c0056b2.m173b())) {
                    if (c0056b.f322l.f271c.m140c() == C0052c.BOTTOM) {
                        i += c0056b2.f296L - c0056b2.m192j();
                    } else if (c0056b.f322l.f271c.m140c() == C0052c.TOP) {
                        i += c0056b2.f296L;
                    }
                    if (c0056b2.f300P || !(c0056b2.f320j.f271c == null || c0056b2.f320j.f271c.f269a == c0056b || c0056b2.f322l.f271c == null || c0056b2.f322l.f271c.f269a == c0056b || c0056b2.f292H == C0055a.MATCH_CONSTRAINT)) {
                        z = true;
                    }
                    c0056b.f300P = z;
                    if (c0056b.f300P) {
                        if (c0056b2.f320j.f271c != null) {
                            if (c0056b2.f320j.f271c.f269a != c0056b) {
                            }
                        }
                        i += i - c0056b2.f296L;
                    }
                }
            }
            if (c0056b.m178d() == 8) {
                i2 -= c0056b.f330t;
                i -= c0056b.f330t;
            }
            c0056b.f293I = i2;
            c0056b.f296L = i;
            return;
        }
        zArr[0] = false;
    }

    public boolean m238c(C0069e c0069e, int i) {
        boolean z;
        mo32a(c0069e, i);
        int size = this.aj.size();
        if (this.aq != 2 && this.aq != 4) {
            z = true;
        } else if (m223a(c0069e)) {
            return false;
        } else {
            z = false;
        }
        for (int i2 = 0; i2 < size; i2++) {
            C0056b c0056b = (C0056b) this.aj.get(i2);
            if (c0056b instanceof C0058c) {
                C0055a c0055a = c0056b.f291G;
                C0055a c0055a2 = c0056b.f292H;
                if (c0055a == C0055a.WRAP_CONTENT) {
                    c0056b.m161a(C0055a.FIXED);
                }
                if (c0055a2 == C0055a.WRAP_CONTENT) {
                    c0056b.m171b(C0055a.FIXED);
                }
                c0056b.mo32a(c0069e, i);
                if (c0055a == C0055a.WRAP_CONTENT) {
                    c0056b.m161a(c0055a);
                }
                if (c0055a2 == C0055a.WRAP_CONTENT) {
                    c0056b.m171b(c0055a2);
                }
            } else {
                if (z) {
                    C0061e.m253a(this, c0069e, c0056b);
                }
                c0056b.mo32a(c0069e, i);
            }
        }
        if (this.al > 0) {
            m224b(c0069e);
        }
        if (this.am > 0) {
            m225c(c0069e);
        }
        return true;
    }

    public void m239m(int i) {
        this.aq = i;
    }
}
