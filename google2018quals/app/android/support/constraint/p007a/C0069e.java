package android.support.constraint.p007a;

import android.support.constraint.p007a.C0074g.C0073a;
import android.support.constraint.p007a.p008a.C0053a;
import java.util.Arrays;
import java.util.HashMap;

public class C0069e {
    private static int f368d = 1000;
    int f369a;
    int f370b;
    final C0067c f371c;
    private HashMap<String, C0074g> f372e;
    private C0068d f373f;
    private int f374g;
    private int f375h;
    private C0066b[] f376i;
    private boolean[] f377j;
    private int f378k;
    private int f379l;
    private C0074g[] f380m;
    private int f381n;
    private C0066b[] f382o;

    public C0069e() {
        this.f369a = 0;
        this.f372e = null;
        this.f373f = new C0068d();
        this.f374g = 32;
        this.f375h = this.f374g;
        this.f376i = null;
        this.f377j = new boolean[this.f374g];
        this.f370b = 1;
        this.f378k = 0;
        this.f379l = this.f374g;
        this.f380m = new C0074g[f368d];
        this.f381n = 0;
        this.f382o = new C0066b[this.f374g];
        this.f376i = new C0066b[this.f374g];
        m310h();
        this.f371c = new C0067c();
    }

    public static C0066b m298a(C0069e c0069e, C0074g c0074g, C0074g c0074g2, int i, float f, C0074g c0074g3, C0074g c0074g4, int i2, boolean z) {
        C0066b b = c0069e.m321b();
        b.m279a(c0074g, c0074g2, i, f, c0074g3, c0074g4, i2);
        if (z) {
            C0074g d = c0069e.m325d();
            C0074g d2 = c0069e.m325d();
            d.f394c = 4;
            d2.f394c = 4;
            b.m277a(d, d2);
        }
        return b;
    }

    public static C0066b m299a(C0069e c0069e, C0074g c0074g, C0074g c0074g2, int i, boolean z) {
        C0066b b = c0069e.m321b();
        b.m278a(c0074g, c0074g2, i);
        if (z) {
            c0069e.m302a(b, 1);
        }
        return b;
    }

    public static C0066b m300a(C0069e c0069e, C0074g c0074g, C0074g c0074g2, C0074g c0074g3, float f, boolean z) {
        C0066b b = c0069e.m321b();
        if (z) {
            c0069e.m305b(b);
        }
        return b.m280a(c0074g, c0074g2, c0074g3, f);
    }

    private C0074g m301a(C0073a c0073a) {
        C0074g c0074g;
        C0074g c0074g2 = (C0074g) this.f371c.f365b.mo35a();
        if (c0074g2 == null) {
            c0074g = new C0074g(c0073a);
        } else {
            c0074g2.m339c();
            c0074g2.m336a(c0073a);
            c0074g = c0074g2;
        }
        if (this.f381n >= f368d) {
            f368d *= 2;
            this.f380m = (C0074g[]) Arrays.copyOf(this.f380m, f368d);
        }
        C0074g[] c0074gArr = this.f380m;
        int i = this.f381n;
        this.f381n = i + 1;
        c0074gArr[i] = c0074g;
        return c0074g;
    }

    private void m302a(C0066b c0066b, int i) {
        c0066b.m290c(m325d(), i);
    }

    private int m303b(C0068d c0068d) {
        int i;
        for (i = 0; i < this.f370b; i++) {
            this.f377j[i] = false;
        }
        int i2 = 0;
        i = 0;
        boolean z = false;
        while (!z) {
            C0074g c0074g;
            int i3;
            float f;
            C0066b c0066b;
            float c;
            float f2;
            C0066b c0066b2;
            boolean z2;
            int i4 = i + 1;
            C0074g a = c0068d.m296a();
            if (a != null) {
                if (this.f377j[a.f392a]) {
                    c0074g = null;
                    i3 = i2;
                } else {
                    this.f377j[a.f392a] = true;
                    i2++;
                    if (i2 >= this.f370b) {
                        c0074g = a;
                        i3 = i2;
                        z = true;
                    }
                }
                if (c0074g == null) {
                    i2 = -1;
                    f = Float.MAX_VALUE;
                    for (i = 0; i < this.f378k; i++) {
                        c0066b = this.f376i[i];
                        if (c0066b.f359a.f397f != C0073a.UNRESTRICTED && c0066b.m285a(c0074g)) {
                            c = c0066b.f362d.m273c(c0074g);
                            if (c < 0.0f) {
                                f2 = (-c0066b.f360b) / c;
                                if (f2 < f) {
                                    i2 = i;
                                    f = f2;
                                }
                            }
                        }
                    }
                    if (i2 <= -1) {
                        c0066b2 = this.f376i[i2];
                        c0066b2.f359a.f393b = -1;
                        c0066b2.m288b(c0074g);
                        c0066b2.f359a.f393b = i2;
                        for (i = 0; i < this.f378k; i++) {
                            this.f376i[i].m284a(c0066b2);
                        }
                        c0068d.m297a(this);
                        try {
                            m306c(c0068d);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        z2 = z;
                    } else {
                        z2 = true;
                    }
                } else {
                    z2 = true;
                }
                i2 = i3;
                z = z2;
                i = i4;
            }
            c0074g = a;
            i3 = i2;
            if (c0074g == null) {
                z2 = true;
            } else {
                i2 = -1;
                f = Float.MAX_VALUE;
                for (i = 0; i < this.f378k; i++) {
                    c0066b = this.f376i[i];
                    c = c0066b.f362d.m273c(c0074g);
                    if (c < 0.0f) {
                        f2 = (-c0066b.f360b) / c;
                        if (f2 < f) {
                            i2 = i;
                            f = f2;
                        }
                    }
                }
                if (i2 <= -1) {
                    z2 = true;
                } else {
                    c0066b2 = this.f376i[i2];
                    c0066b2.f359a.f393b = -1;
                    c0066b2.m288b(c0074g);
                    c0066b2.f359a.f393b = i2;
                    for (i = 0; i < this.f378k; i++) {
                        this.f376i[i].m284a(c0066b2);
                    }
                    c0068d.m297a(this);
                    m306c(c0068d);
                    z2 = z;
                }
            }
            i2 = i3;
            z = z2;
            i = i4;
        }
        return i;
    }

    public static C0066b m304b(C0069e c0069e, C0074g c0074g, C0074g c0074g2, int i, boolean z) {
        C0074g c = c0069e.m324c();
        C0066b b = c0069e.m321b();
        b.m281a(c0074g, c0074g2, c, i);
        if (z) {
            c0069e.m302a(b, (int) (b.f362d.m273c(c) * -1.0f));
        }
        return b;
    }

    private void m305b(C0066b c0066b) {
        c0066b.m277a(m325d(), m325d());
    }

    private int m306c(C0068d c0068d) {
        Object obj;
        int i;
        int i2 = 0;
        while (i2 < this.f378k) {
            if (this.f376i[i2].f359a.f397f != C0073a.UNRESTRICTED && this.f376i[i2].f360b < 0.0f) {
                obj = 1;
                break;
            }
            i2++;
        }
        obj = null;
        if (obj != null) {
            Object obj2 = null;
            i2 = 0;
            while (obj2 == null) {
                int i3 = i2 + 1;
                float f = Float.MAX_VALUE;
                int i4 = 0;
                int i5 = -1;
                i = -1;
                for (i2 = 0; i2 < this.f378k; i2++) {
                    C0066b c0066b = this.f376i[i2];
                    if (c0066b.f359a.f397f != C0073a.UNRESTRICTED && c0066b.f360b < 0.0f) {
                        float f2 = f;
                        int i6 = i4;
                        i4 = i5;
                        i5 = i;
                        for (i = 1; i < this.f370b; i++) {
                            C0074g c0074g = this.f371c.f366c[i];
                            float c = c0066b.f362d.m273c(c0074g);
                            if (c > 0.0f) {
                                float f3 = f2;
                                int i7 = 0;
                                while (i7 < 6) {
                                    float f4 = c0074g.f396e[i7] / c;
                                    if ((f4 >= f3 || i7 != r6) && i7 <= r6) {
                                        f4 = f3;
                                    } else {
                                        i5 = i;
                                        i4 = i2;
                                        i6 = i7;
                                    }
                                    i7++;
                                    f3 = f4;
                                }
                                f2 = f3;
                            }
                        }
                        i = i5;
                        i5 = i4;
                        i4 = i6;
                        f = f2;
                    }
                }
                if (i5 != -1) {
                    C0066b c0066b2 = this.f376i[i5];
                    c0066b2.f359a.f393b = -1;
                    c0066b2.m288b(this.f371c.f366c[i]);
                    c0066b2.f359a.f393b = i5;
                    for (i2 = 0; i2 < this.f378k; i2++) {
                        this.f376i[i2].m284a(c0066b2);
                    }
                    c0068d.m297a(this);
                    obj = obj2;
                } else {
                    obj = 1;
                }
                obj2 = obj;
                i2 = i3;
            }
        } else {
            i2 = 0;
        }
        i = 0;
        while (i < this.f378k && (this.f376i[i].f359a.f397f == C0073a.UNRESTRICTED || this.f376i[i].f360b >= 0.0f)) {
            i++;
        }
        return i2;
    }

    public static C0066b m307c(C0069e c0069e, C0074g c0074g, C0074g c0074g2, int i, boolean z) {
        C0074g c = c0069e.m324c();
        C0066b b = c0069e.m321b();
        b.m287b(c0074g, c0074g2, c, i);
        if (z) {
            c0069e.m302a(b, (int) (b.f362d.m273c(c) * -1.0f));
        }
        return b;
    }

    private void m308c(C0066b c0066b) {
        if (this.f378k > 0) {
            c0066b.f362d.m267a(c0066b, this.f376i);
            if (c0066b.f362d.f348a == 0) {
                c0066b.f363e = true;
            }
        }
    }

    private void m309g() {
        this.f374g *= 2;
        this.f376i = (C0066b[]) Arrays.copyOf(this.f376i, this.f374g);
        this.f371c.f366c = (C0074g[]) Arrays.copyOf(this.f371c.f366c, this.f374g);
        this.f377j = new boolean[this.f374g];
        this.f375h = this.f374g;
        this.f379l = this.f374g;
        this.f373f.f367a.clear();
    }

    private void m310h() {
        for (int i = 0; i < this.f376i.length; i++) {
            Object obj = this.f376i[i];
            if (obj != null) {
                this.f371c.f364a.mo37a(obj);
            }
            this.f376i[i] = null;
        }
    }

    private void m311i() {
        for (int i = 0; i < this.f378k; i++) {
            C0066b c0066b = this.f376i[i];
            c0066b.f359a.f395d = c0066b.f360b;
        }
    }

    C0066b m312a(int i) {
        return this.f376i[i];
    }

    public C0074g m313a(Object obj) {
        C0074g c0074g = null;
        if (obj != null) {
            if (this.f370b + 1 >= this.f375h) {
                m309g();
            }
            if (obj instanceof C0053a) {
                c0074g = ((C0053a) obj).m133a();
                if (c0074g == null) {
                    ((C0053a) obj).m135a(this.f371c);
                    c0074g = ((C0053a) obj).m133a();
                }
                if (c0074g.f392a == -1 || c0074g.f392a > this.f369a || this.f371c.f366c[c0074g.f392a] == null) {
                    if (c0074g.f392a != -1) {
                        c0074g.m339c();
                    }
                    this.f369a++;
                    this.f370b++;
                    c0074g.f392a = this.f369a;
                    c0074g.f397f = C0073a.UNRESTRICTED;
                    this.f371c.f366c[this.f369a] = c0074g;
                }
            }
        }
        return c0074g;
    }

    public void m314a() {
        int i;
        for (C0074g c0074g : this.f371c.f366c) {
            if (c0074g != null) {
                c0074g.m339c();
            }
        }
        this.f371c.f365b.mo36a(this.f380m, this.f381n);
        this.f381n = 0;
        Arrays.fill(this.f371c.f366c, null);
        if (this.f372e != null) {
            this.f372e.clear();
        }
        this.f369a = 0;
        this.f373f.f367a.clear();
        this.f370b = 1;
        for (i = 0; i < this.f378k; i++) {
            this.f376i[i].f361c = false;
        }
        m310h();
        this.f378k = 0;
    }

    public void m315a(C0066b c0066b) {
        int i = 0;
        if (c0066b != null) {
            if (this.f378k + 1 >= this.f379l || this.f370b + 1 >= this.f375h) {
                m309g();
            }
            if (!c0066b.f363e) {
                m308c(c0066b);
                c0066b.m293e();
                c0066b.m294f();
                if (!c0066b.m289b()) {
                    return;
                }
            }
            if (this.f376i[this.f378k] != null) {
                this.f371c.f364a.mo37a(this.f376i[this.f378k]);
            }
            if (!c0066b.f363e) {
                c0066b.m283a();
            }
            this.f376i[this.f378k] = c0066b;
            c0066b.f359a.f393b = this.f378k;
            this.f378k++;
            int i2 = c0066b.f359a.f399h;
            if (i2 > 0) {
                while (this.f382o.length < i2) {
                    this.f382o = new C0066b[(this.f382o.length * 2)];
                }
                C0066b[] c0066bArr = this.f382o;
                for (int i3 = 0; i3 < i2; i3++) {
                    c0066bArr[i3] = c0066b.f359a.f398g[i3];
                }
                while (i < i2) {
                    C0066b c0066b2 = c0066bArr[i];
                    if (c0066b2 != c0066b) {
                        c0066b2.f362d.m266a(c0066b2, c0066b);
                        c0066b2.m283a();
                    }
                    i++;
                }
            }
        }
    }

    void m316a(C0068d c0068d) {
        c0068d.m297a(this);
        m306c(c0068d);
        m303b(c0068d);
        m311i();
    }

    public void m317a(C0074g c0074g, int i) {
        int i2 = c0074g.f393b;
        C0066b c0066b;
        if (c0074g.f393b != -1) {
            c0066b = this.f376i[i2];
            if (c0066b.f363e) {
                c0066b.f360b = (float) i;
                return;
            }
            c0066b = m321b();
            c0066b.m286b(c0074g, i);
            m315a(c0066b);
            return;
        }
        c0066b = m321b();
        c0066b.m276a(c0074g, i);
        m315a(c0066b);
    }

    public void m318a(C0074g c0074g, C0074g c0074g2, int i, float f, C0074g c0074g3, C0074g c0074g4, int i2, int i3) {
        C0066b b = m321b();
        b.m279a(c0074g, c0074g2, i, f, c0074g3, c0074g4, i2);
        C0074g d = m325d();
        C0074g d2 = m325d();
        d.f394c = i3;
        d2.f394c = i3;
        b.m277a(d, d2);
        m315a(b);
    }

    public void m319a(C0074g c0074g, C0074g c0074g2, int i, int i2) {
        C0066b b = m321b();
        C0074g c = m324c();
        c.f394c = i2;
        b.m281a(c0074g, c0074g2, c, i);
        m315a(b);
    }

    public int m320b(Object obj) {
        C0074g a = ((C0053a) obj).m133a();
        return a != null ? (int) (a.f395d + 0.5f) : 0;
    }

    public C0066b m321b() {
        C0066b c0066b = (C0066b) this.f371c.f364a.mo35a();
        if (c0066b == null) {
            return new C0066b(this.f371c);
        }
        c0066b.m292d();
        return c0066b;
    }

    public void m322b(C0074g c0074g, C0074g c0074g2, int i, int i2) {
        C0066b b = m321b();
        C0074g c = m324c();
        c.f394c = i2;
        b.m287b(c0074g, c0074g2, c, i);
        m315a(b);
    }

    public C0066b m323c(C0074g c0074g, C0074g c0074g2, int i, int i2) {
        C0066b b = m321b();
        b.m278a(c0074g, c0074g2, i);
        C0074g d = m325d();
        C0074g d2 = m325d();
        d.f394c = i2;
        d2.f394c = i2;
        b.m277a(d, d2);
        m315a(b);
        return b;
    }

    public C0074g m324c() {
        if (this.f370b + 1 >= this.f375h) {
            m309g();
        }
        C0074g a = m301a(C0073a.SLACK);
        this.f369a++;
        this.f370b++;
        a.f392a = this.f369a;
        this.f371c.f366c[this.f369a] = a;
        return a;
    }

    public C0074g m325d() {
        if (this.f370b + 1 >= this.f375h) {
            m309g();
        }
        C0074g a = m301a(C0073a.ERROR);
        this.f369a++;
        this.f370b++;
        a.f392a = this.f369a;
        this.f371c.f366c[this.f369a] = a;
        return a;
    }

    public void m326e() {
        m316a(this.f373f);
    }

    public C0067c m327f() {
        return this.f371c;
    }
}
