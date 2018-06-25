package android.support.constraint.p007a.p008a;

import android.support.constraint.p007a.C0069e;
import android.support.constraint.p007a.p008a.C0056b.C0055a;

public class C0061e {
    static void m252a(C0058c c0058c, C0069e c0069e, int i, C0056b c0056b) {
        int i2;
        float f;
        int i3 = 0;
        int i4 = 0;
        float f2 = 0.0f;
        C0056b c0056b2 = null;
        C0056b c0056b3 = c0056b;
        while (c0056b3 != null) {
            if ((c0056b3.m178d() == 8 ? 1 : null) == null) {
                i2 = i4 + 1;
                if (c0056b3.f291G != C0055a.MATCH_CONSTRAINT) {
                    i3 = (c0056b3.f321k.f271c != null ? c0056b3.f321k.m141d() : 0) + ((i3 + c0056b3.m188h()) + (c0056b3.f319i.f271c != null ? c0056b3.f319i.m141d() : 0));
                } else {
                    f2 = c0056b3.f307W + f2;
                }
            } else {
                i2 = i4;
            }
            C0056b c0056b4 = c0056b3.f321k.f271c != null ? c0056b3.f321k.f271c.f269a : null;
            if (c0056b4 != null && (c0056b4.f319i.f271c == null || !(c0056b4.f319i.f271c == null || c0056b4.f319i.f271c.f269a == c0056b3))) {
                c0056b4 = null;
            }
            c0056b2 = c0056b3;
            c0056b3 = c0056b4;
            i4 = i2;
        }
        i2 = 0;
        if (c0056b2 != null) {
            i2 = c0056b2.f321k.f271c != null ? c0056b2.f321k.f271c.f269a.m184f() : 0;
            if (c0056b2.f321k.f271c != null && c0056b2.f321k.f271c.f269a == c0058c) {
                i2 = c0058c.m205t();
            }
        }
        float f3 = ((float) (i2 - 0)) - ((float) i3);
        float f4 = f3 / ((float) (i4 + 1));
        if (i == 0) {
            f = f4;
        } else {
            f = f3 / ((float) i);
            f4 = 0.0f;
        }
        while (c0056b != null) {
            float h;
            i4 = c0056b.f319i.f271c != null ? c0056b.f319i.m141d() : 0;
            i2 = c0056b.f321k.f271c != null ? c0056b.f321k.m141d() : 0;
            if (c0056b.m178d() != 8) {
                f4 += (float) i4;
                c0069e.m317a(c0056b.f319i.f274f, (int) (0.5f + f4));
                h = c0056b.f291G == C0055a.MATCH_CONSTRAINT ? f2 == 0.0f ? ((f - ((float) i4)) - ((float) i2)) + f4 : ((((c0056b.f307W * f3) / f2) - ((float) i4)) - ((float) i2)) + f4 : ((float) c0056b.m188h()) + f4;
                c0069e.m317a(c0056b.f321k.f274f, (int) (0.5f + h));
                if (i == 0) {
                    h += f;
                }
                h += (float) i2;
            } else {
                h = f4 - (f / 2.0f);
                c0069e.m317a(c0056b.f319i.f274f, (int) (0.5f + h));
                c0069e.m317a(c0056b.f321k.f274f, (int) (h + 0.5f));
                h = f4;
            }
            C0056b c0056b5 = c0056b.f321k.f271c != null ? c0056b.f321k.f271c.f269a : null;
            if (!(c0056b5 == null || c0056b5.f319i.f271c == null || c0056b5.f319i.f271c.f269a == c0056b)) {
                c0056b5 = null;
            }
            if (c0056b5 == c0058c) {
                c0056b5 = null;
            }
            f4 = h;
            c0056b = c0056b5;
        }
    }

    static void m253a(C0058c c0058c, C0069e c0069e, C0056b c0056b) {
        if (c0058c.G != C0055a.WRAP_CONTENT && c0056b.f291G == C0055a.MATCH_PARENT) {
            c0056b.f319i.f274f = c0069e.m313a(c0056b.f319i);
            c0056b.f321k.f274f = c0069e.m313a(c0056b.f321k);
            int i = c0056b.f319i.f272d;
            int h = c0058c.m188h() - c0056b.f321k.f272d;
            c0069e.m317a(c0056b.f319i.f274f, i);
            c0069e.m317a(c0056b.f321k.f274f, h);
            c0056b.m177c(i, h);
            c0056b.f311a = 2;
        }
        if (c0058c.H != C0055a.WRAP_CONTENT && c0056b.f292H == C0055a.MATCH_PARENT) {
            c0056b.f320j.f274f = c0069e.m313a(c0056b.f320j);
            c0056b.f322l.f274f = c0069e.m313a(c0056b.f322l);
            i = c0056b.f320j.f272d;
            h = c0058c.m196l() - c0056b.f322l.f272d;
            c0069e.m317a(c0056b.f320j.f274f, i);
            c0069e.m317a(c0056b.f322l.f274f, h);
            if (c0056b.f286A > 0 || c0056b.m178d() == 8) {
                c0056b.f323m.f274f = c0069e.m313a(c0056b.f323m);
                c0069e.m317a(c0056b.f323m.f274f, c0056b.f286A + i);
            }
            c0056b.m181d(i, h);
            c0056b.f312b = 2;
        }
    }

    static void m254b(C0058c c0058c, C0069e c0069e, int i, C0056b c0056b) {
        int i2;
        float f;
        int i3 = 0;
        int i4 = 0;
        float f2 = 0.0f;
        C0056b c0056b2 = null;
        C0056b c0056b3 = c0056b;
        while (c0056b3 != null) {
            if ((c0056b3.m178d() == 8 ? 1 : null) == null) {
                i2 = i4 + 1;
                if (c0056b3.f292H != C0055a.MATCH_CONSTRAINT) {
                    i3 = (c0056b3.f322l.f271c != null ? c0056b3.f322l.m141d() : 0) + ((i3 + c0056b3.m196l()) + (c0056b3.f320j.f271c != null ? c0056b3.f320j.m141d() : 0));
                } else {
                    f2 = c0056b3.f308X + f2;
                }
            } else {
                i2 = i4;
            }
            C0056b c0056b4 = c0056b3.f322l.f271c != null ? c0056b3.f322l.f271c.f269a : null;
            if (c0056b4 != null && (c0056b4.f320j.f271c == null || !(c0056b4.f320j.f271c == null || c0056b4.f320j.f271c.f269a == c0056b3))) {
                c0056b4 = null;
            }
            c0056b2 = c0056b3;
            c0056b3 = c0056b4;
            i4 = i2;
        }
        i2 = 0;
        if (c0056b2 != null) {
            i2 = c0056b2.f322l.f271c != null ? c0056b2.f322l.f271c.f269a.m184f() : 0;
            if (c0056b2.f322l.f271c != null && c0056b2.f322l.f271c.f269a == c0058c) {
                i2 = c0058c.m206u();
            }
        }
        float f3 = ((float) (i2 - 0)) - ((float) i3);
        float f4 = f3 / ((float) (i4 + 1));
        if (i == 0) {
            f = f4;
        } else {
            f = f3 / ((float) i);
            f4 = 0.0f;
        }
        while (c0056b != null) {
            float l;
            i4 = c0056b.f320j.f271c != null ? c0056b.f320j.m141d() : 0;
            i2 = c0056b.f322l.f271c != null ? c0056b.f322l.m141d() : 0;
            if (c0056b.m178d() != 8) {
                f4 += (float) i4;
                c0069e.m317a(c0056b.f320j.f274f, (int) (0.5f + f4));
                l = c0056b.f292H == C0055a.MATCH_CONSTRAINT ? f2 == 0.0f ? ((f - ((float) i4)) - ((float) i2)) + f4 : ((((c0056b.f308X * f3) / f2) - ((float) i4)) - ((float) i2)) + f4 : ((float) c0056b.m196l()) + f4;
                c0069e.m317a(c0056b.f322l.f274f, (int) (0.5f + l));
                if (i == 0) {
                    l += f;
                }
                l += (float) i2;
            } else {
                l = f4 - (f / 2.0f);
                c0069e.m317a(c0056b.f320j.f274f, (int) (0.5f + l));
                c0069e.m317a(c0056b.f322l.f274f, (int) (l + 0.5f));
                l = f4;
            }
            C0056b c0056b5 = c0056b.f322l.f271c != null ? c0056b.f322l.f271c.f269a : null;
            if (!(c0056b5 == null || c0056b5.f320j.f271c == null || c0056b5.f320j.f271c.f269a == c0056b)) {
                c0056b5 = null;
            }
            if (c0056b5 == c0058c) {
                c0056b5 = null;
            }
            f4 = l;
            c0056b = c0056b5;
        }
    }

    static void m255b(C0058c c0058c, C0069e c0069e, C0056b c0056b) {
        if (c0056b.f291G == C0055a.MATCH_CONSTRAINT) {
            c0056b.f311a = 1;
        } else if (c0058c.G != C0055a.WRAP_CONTENT && c0056b.f291G == C0055a.MATCH_PARENT) {
            c0056b.f319i.f274f = c0069e.m313a(c0056b.f319i);
            c0056b.f321k.f274f = c0069e.m313a(c0056b.f321k);
            r0 = c0056b.f319i.f272d;
            r1 = c0058c.m188h() - c0056b.f321k.f272d;
            c0069e.m317a(c0056b.f319i.f274f, r0);
            c0069e.m317a(c0056b.f321k.f274f, r1);
            c0056b.m177c(r0, r1);
            c0056b.f311a = 2;
        } else if (c0056b.f319i.f271c == null || c0056b.f321k.f271c == null) {
            if (c0056b.f319i.f271c != null && c0056b.f319i.f271c.f269a == c0058c) {
                r0 = c0056b.f319i.m141d();
                r1 = c0056b.m188h() + r0;
                c0056b.f319i.f274f = c0069e.m313a(c0056b.f319i);
                c0056b.f321k.f274f = c0069e.m313a(c0056b.f321k);
                c0069e.m317a(c0056b.f319i.f274f, r0);
                c0069e.m317a(c0056b.f321k.f274f, r1);
                c0056b.f311a = 2;
                c0056b.m177c(r0, r1);
            } else if (c0056b.f321k.f271c != null && c0056b.f321k.f271c.f269a == c0058c) {
                c0056b.f319i.f274f = c0069e.m313a(c0056b.f319i);
                c0056b.f321k.f274f = c0069e.m313a(c0056b.f321k);
                r0 = c0058c.m188h() - c0056b.f321k.m141d();
                r1 = r0 - c0056b.m188h();
                c0069e.m317a(c0056b.f319i.f274f, r1);
                c0069e.m317a(c0056b.f321k.f274f, r0);
                c0056b.f311a = 2;
                c0056b.m177c(r1, r0);
            } else if (c0056b.f319i.f271c != null && c0056b.f319i.f271c.f269a.f311a == 2) {
                r0 = c0056b.f319i.f271c.f274f;
                c0056b.f319i.f274f = c0069e.m313a(c0056b.f319i);
                c0056b.f321k.f274f = c0069e.m313a(c0056b.f321k);
                r0 = (int) ((r0.f395d + ((float) c0056b.f319i.m141d())) + 0.5f);
                r1 = c0056b.m188h() + r0;
                c0069e.m317a(c0056b.f319i.f274f, r0);
                c0069e.m317a(c0056b.f321k.f274f, r1);
                c0056b.f311a = 2;
                c0056b.m177c(r0, r1);
            } else if (c0056b.f321k.f271c == null || c0056b.f321k.f271c.f269a.f311a != 2) {
                r0 = c0056b.f319i.f271c != null ? 1 : 0;
                int i = c0056b.f321k.f271c != null ? 1 : 0;
                if (r0 != 0 || i != 0) {
                    return;
                }
                if (c0056b instanceof C0060d) {
                    C0060d c0060d = (C0060d) c0056b;
                    if (c0060d.mo29D() == 1) {
                        c0056b.f319i.f274f = c0069e.m313a(c0056b.f319i);
                        c0056b.f321k.f274f = c0069e.m313a(c0056b.f321k);
                        float F = c0060d.m242F() != -1 ? (float) c0060d.m242F() : c0060d.m243G() != -1 ? (float) (c0058c.m188h() - c0060d.m243G()) : c0060d.m241E() * ((float) c0058c.m188h());
                        r0 = (int) (F + 0.5f);
                        c0069e.m317a(c0056b.f319i.f274f, r0);
                        c0069e.m317a(c0056b.f321k.f274f, r0);
                        c0056b.f311a = 2;
                        c0056b.f312b = 2;
                        c0056b.m177c(r0, r0);
                        c0056b.m181d(0, c0058c.m196l());
                        return;
                    }
                    return;
                }
                c0056b.f319i.f274f = c0069e.m313a(c0056b.f319i);
                c0056b.f321k.f274f = c0069e.m313a(c0056b.f321k);
                r0 = c0056b.m184f();
                r1 = c0056b.m188h() + r0;
                c0069e.m317a(c0056b.f319i.f274f, r0);
                c0069e.m317a(c0056b.f321k.f274f, r1);
                c0056b.f311a = 2;
            } else {
                r0 = c0056b.f321k.f271c.f274f;
                c0056b.f319i.f274f = c0069e.m313a(c0056b.f319i);
                c0056b.f321k.f274f = c0069e.m313a(c0056b.f321k);
                r0 = (int) ((r0.f395d - ((float) c0056b.f321k.m141d())) + 0.5f);
                r1 = r0 - c0056b.m188h();
                c0069e.m317a(c0056b.f319i.f274f, r1);
                c0069e.m317a(c0056b.f321k.f274f, r0);
                c0056b.f311a = 2;
                c0056b.m177c(r1, r0);
            }
        } else if (c0056b.f319i.f271c.f269a == c0058c && c0056b.f321k.f271c.f269a == c0058c) {
            r1 = c0056b.f319i.m141d();
            r0 = c0056b.f321k.m141d();
            if (c0058c.G == C0055a.MATCH_CONSTRAINT) {
                r0 = c0058c.m188h() - r0;
            } else {
                r1 += (int) ((((float) (((c0058c.m188h() - r1) - r0) - c0056b.m188h())) * c0056b.f289E) + 0.5f);
                r0 = c0056b.m188h() + r1;
            }
            c0056b.f319i.f274f = c0069e.m313a(c0056b.f319i);
            c0056b.f321k.f274f = c0069e.m313a(c0056b.f321k);
            c0069e.m317a(c0056b.f319i.f274f, r1);
            c0069e.m317a(c0056b.f321k.f274f, r0);
            c0056b.f311a = 2;
            c0056b.m177c(r1, r0);
        } else {
            c0056b.f311a = 1;
        }
    }

    static void m256c(C0058c c0058c, C0069e c0069e, C0056b c0056b) {
        int i = 1;
        if (c0056b.f292H == C0055a.MATCH_CONSTRAINT) {
            c0056b.f312b = 1;
        } else if (c0058c.H != C0055a.WRAP_CONTENT && c0056b.f292H == C0055a.MATCH_PARENT) {
            c0056b.f320j.f274f = c0069e.m313a(c0056b.f320j);
            c0056b.f322l.f274f = c0069e.m313a(c0056b.f322l);
            r0 = c0056b.f320j.f272d;
            i = c0058c.m196l() - c0056b.f322l.f272d;
            c0069e.m317a(c0056b.f320j.f274f, r0);
            c0069e.m317a(c0056b.f322l.f274f, i);
            if (c0056b.f286A > 0 || c0056b.m178d() == 8) {
                c0056b.f323m.f274f = c0069e.m313a(c0056b.f323m);
                c0069e.m317a(c0056b.f323m.f274f, c0056b.f286A + r0);
            }
            c0056b.m181d(r0, i);
            c0056b.f312b = 2;
        } else if (c0056b.f320j.f271c == null || c0056b.f322l.f271c == null) {
            if (c0056b.f320j.f271c != null && c0056b.f320j.f271c.f269a == c0058c) {
                r0 = c0056b.f320j.m141d();
                i = c0056b.m196l() + r0;
                c0056b.f320j.f274f = c0069e.m313a(c0056b.f320j);
                c0056b.f322l.f274f = c0069e.m313a(c0056b.f322l);
                c0069e.m317a(c0056b.f320j.f274f, r0);
                c0069e.m317a(c0056b.f322l.f274f, i);
                if (c0056b.f286A > 0 || c0056b.m178d() == 8) {
                    c0056b.f323m.f274f = c0069e.m313a(c0056b.f323m);
                    c0069e.m317a(c0056b.f323m.f274f, c0056b.f286A + r0);
                }
                c0056b.f312b = 2;
                c0056b.m181d(r0, i);
            } else if (c0056b.f322l.f271c != null && c0056b.f322l.f271c.f269a == c0058c) {
                c0056b.f320j.f274f = c0069e.m313a(c0056b.f320j);
                c0056b.f322l.f274f = c0069e.m313a(c0056b.f322l);
                r0 = c0058c.m196l() - c0056b.f322l.m141d();
                i = r0 - c0056b.m196l();
                c0069e.m317a(c0056b.f320j.f274f, i);
                c0069e.m317a(c0056b.f322l.f274f, r0);
                if (c0056b.f286A > 0 || c0056b.m178d() == 8) {
                    c0056b.f323m.f274f = c0069e.m313a(c0056b.f323m);
                    c0069e.m317a(c0056b.f323m.f274f, c0056b.f286A + i);
                }
                c0056b.f312b = 2;
                c0056b.m181d(i, r0);
            } else if (c0056b.f320j.f271c != null && c0056b.f320j.f271c.f269a.f312b == 2) {
                r0 = c0056b.f320j.f271c.f274f;
                c0056b.f320j.f274f = c0069e.m313a(c0056b.f320j);
                c0056b.f322l.f274f = c0069e.m313a(c0056b.f322l);
                r0 = (int) ((r0.f395d + ((float) c0056b.f320j.m141d())) + 0.5f);
                i = c0056b.m196l() + r0;
                c0069e.m317a(c0056b.f320j.f274f, r0);
                c0069e.m317a(c0056b.f322l.f274f, i);
                if (c0056b.f286A > 0 || c0056b.m178d() == 8) {
                    c0056b.f323m.f274f = c0069e.m313a(c0056b.f323m);
                    c0069e.m317a(c0056b.f323m.f274f, c0056b.f286A + r0);
                }
                c0056b.f312b = 2;
                c0056b.m181d(r0, i);
            } else if (c0056b.f322l.f271c != null && c0056b.f322l.f271c.f269a.f312b == 2) {
                r0 = c0056b.f322l.f271c.f274f;
                c0056b.f320j.f274f = c0069e.m313a(c0056b.f320j);
                c0056b.f322l.f274f = c0069e.m313a(c0056b.f322l);
                r0 = (int) ((r0.f395d - ((float) c0056b.f322l.m141d())) + 0.5f);
                i = r0 - c0056b.m196l();
                c0069e.m317a(c0056b.f320j.f274f, i);
                c0069e.m317a(c0056b.f322l.f274f, r0);
                if (c0056b.f286A > 0 || c0056b.m178d() == 8) {
                    c0056b.f323m.f274f = c0069e.m313a(c0056b.f323m);
                    c0069e.m317a(c0056b.f323m.f274f, c0056b.f286A + i);
                }
                c0056b.f312b = 2;
                c0056b.m181d(i, r0);
            } else if (c0056b.f323m.f271c == null || c0056b.f323m.f271c.f269a.f312b != 2) {
                r0 = c0056b.f323m.f271c != null ? 1 : 0;
                int i2 = c0056b.f320j.f271c != null ? 1 : 0;
                if (c0056b.f322l.f271c == null) {
                    i = 0;
                }
                if (r0 != 0 || i2 != 0 || r1 != 0) {
                    return;
                }
                if (c0056b instanceof C0060d) {
                    C0060d c0060d = (C0060d) c0056b;
                    if (c0060d.mo29D() == 0) {
                        c0056b.f320j.f274f = c0069e.m313a(c0056b.f320j);
                        c0056b.f322l.f274f = c0069e.m313a(c0056b.f322l);
                        float F = c0060d.m242F() != -1 ? (float) c0060d.m242F() : c0060d.m243G() != -1 ? (float) (c0058c.m196l() - c0060d.m243G()) : c0060d.m241E() * ((float) c0058c.m196l());
                        r0 = (int) (F + 0.5f);
                        c0069e.m317a(c0056b.f320j.f274f, r0);
                        c0069e.m317a(c0056b.f322l.f274f, r0);
                        c0056b.f312b = 2;
                        c0056b.f311a = 2;
                        c0056b.m181d(r0, r0);
                        c0056b.m177c(0, c0058c.m188h());
                        return;
                    }
                    return;
                }
                c0056b.f320j.f274f = c0069e.m313a(c0056b.f320j);
                c0056b.f322l.f274f = c0069e.m313a(c0056b.f322l);
                r0 = c0056b.m186g();
                i = c0056b.m196l() + r0;
                c0069e.m317a(c0056b.f320j.f274f, r0);
                c0069e.m317a(c0056b.f322l.f274f, i);
                if (c0056b.f286A > 0 || c0056b.m178d() == 8) {
                    c0056b.f323m.f274f = c0069e.m313a(c0056b.f323m);
                    c0069e.m317a(c0056b.f323m.f274f, r0 + c0056b.f286A);
                }
                c0056b.f312b = 2;
            } else {
                r0 = c0056b.f323m.f271c.f274f;
                c0056b.f320j.f274f = c0069e.m313a(c0056b.f320j);
                c0056b.f322l.f274f = c0069e.m313a(c0056b.f322l);
                r0 = (int) ((r0.f395d - ((float) c0056b.f286A)) + 0.5f);
                i = c0056b.m196l() + r0;
                c0069e.m317a(c0056b.f320j.f274f, r0);
                c0069e.m317a(c0056b.f322l.f274f, i);
                c0056b.f323m.f274f = c0069e.m313a(c0056b.f323m);
                c0069e.m317a(c0056b.f323m.f274f, c0056b.f286A + r0);
                c0056b.f312b = 2;
                c0056b.m181d(r0, i);
            }
        } else if (c0056b.f320j.f271c.f269a == c0058c && c0056b.f322l.f271c.f269a == c0058c) {
            i = c0056b.f320j.m141d();
            r0 = c0056b.f322l.m141d();
            if (c0058c.H == C0055a.MATCH_CONSTRAINT) {
                r0 = c0056b.m196l() + i;
            } else {
                i = (int) (((((float) (((c0058c.m196l() - i) - r0) - c0056b.m196l())) * c0056b.f290F) + ((float) i)) + 0.5f);
                r0 = c0056b.m196l() + i;
            }
            c0056b.f320j.f274f = c0069e.m313a(c0056b.f320j);
            c0056b.f322l.f274f = c0069e.m313a(c0056b.f322l);
            c0069e.m317a(c0056b.f320j.f274f, i);
            c0069e.m317a(c0056b.f322l.f274f, r0);
            if (c0056b.f286A > 0 || c0056b.m178d() == 8) {
                c0056b.f323m.f274f = c0069e.m313a(c0056b.f323m);
                c0069e.m317a(c0056b.f323m.f274f, c0056b.f286A + i);
            }
            c0056b.f312b = 2;
            c0056b.m181d(i, r0);
        } else {
            c0056b.f312b = 1;
        }
    }
}
