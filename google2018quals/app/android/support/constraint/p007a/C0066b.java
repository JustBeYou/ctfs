package android.support.constraint.p007a;

import android.support.constraint.p007a.C0074g.C0073a;

public class C0066b {
    C0074g f359a = null;
    float f360b = 0.0f;
    boolean f361c = false;
    final C0065a f362d;
    boolean f363e = false;

    public C0066b(C0067c c0067c) {
        this.f362d = new C0065a(this, c0067c);
    }

    public C0066b m275a(float f, float f2, float f3, C0074g c0074g, int i, C0074g c0074g2, int i2, C0074g c0074g3, int i3, C0074g c0074g4, int i4) {
        if (f2 == 0.0f || f == f3) {
            this.f360b = (float) ((((-i) - i2) + i3) + i4);
            this.f362d.m268a(c0074g, 1.0f);
            this.f362d.m268a(c0074g2, -1.0f);
            this.f362d.m268a(c0074g4, 1.0f);
            this.f362d.m268a(c0074g3, -1.0f);
        } else {
            float f4 = (f / f2) / (f3 / f2);
            this.f360b = (((float) ((-i) - i2)) + (((float) i3) * f4)) + (((float) i4) * f4);
            this.f362d.m268a(c0074g, 1.0f);
            this.f362d.m268a(c0074g2, -1.0f);
            this.f362d.m268a(c0074g4, f4);
            this.f362d.m268a(c0074g3, -f4);
        }
        return this;
    }

    C0066b m276a(C0074g c0074g, int i) {
        this.f359a = c0074g;
        c0074g.f395d = (float) i;
        this.f360b = (float) i;
        this.f363e = true;
        return this;
    }

    public C0066b m277a(C0074g c0074g, C0074g c0074g2) {
        this.f362d.m268a(c0074g, 1.0f);
        this.f362d.m268a(c0074g2, -1.0f);
        return this;
    }

    public C0066b m278a(C0074g c0074g, C0074g c0074g2, int i) {
        Object obj = null;
        if (i != 0) {
            if (i < 0) {
                i *= -1;
                obj = 1;
            }
            this.f360b = (float) i;
        }
        if (obj == null) {
            this.f362d.m268a(c0074g, -1.0f);
            this.f362d.m268a(c0074g2, 1.0f);
        } else {
            this.f362d.m268a(c0074g, 1.0f);
            this.f362d.m268a(c0074g2, -1.0f);
        }
        return this;
    }

    C0066b m279a(C0074g c0074g, C0074g c0074g2, int i, float f, C0074g c0074g3, C0074g c0074g4, int i2) {
        if (c0074g2 == c0074g3) {
            this.f362d.m268a(c0074g, 1.0f);
            this.f362d.m268a(c0074g4, 1.0f);
            this.f362d.m268a(c0074g2, -2.0f);
        } else if (f == 0.5f) {
            this.f362d.m268a(c0074g, 1.0f);
            this.f362d.m268a(c0074g2, -1.0f);
            this.f362d.m268a(c0074g3, -1.0f);
            this.f362d.m268a(c0074g4, 1.0f);
            if (i > 0 || i2 > 0) {
                this.f360b = (float) ((-i) + i2);
            }
        } else if (f <= 0.0f) {
            this.f362d.m268a(c0074g, -1.0f);
            this.f362d.m268a(c0074g2, 1.0f);
            this.f360b = (float) i;
        } else if (f >= 1.0f) {
            this.f362d.m268a(c0074g3, -1.0f);
            this.f362d.m268a(c0074g4, 1.0f);
            this.f360b = (float) i2;
        } else {
            this.f362d.m268a(c0074g, (1.0f - f) * 1.0f);
            this.f362d.m268a(c0074g2, (1.0f - f) * -1.0f);
            this.f362d.m268a(c0074g3, -1.0f * f);
            this.f362d.m268a(c0074g4, 1.0f * f);
            if (i > 0 || i2 > 0) {
                this.f360b = (((float) (-i)) * (1.0f - f)) + (((float) i2) * f);
            }
        }
        return this;
    }

    C0066b m280a(C0074g c0074g, C0074g c0074g2, C0074g c0074g3, float f) {
        this.f362d.m268a(c0074g, -1.0f);
        this.f362d.m268a(c0074g2, 1.0f - f);
        this.f362d.m268a(c0074g3, f);
        return this;
    }

    public C0066b m281a(C0074g c0074g, C0074g c0074g2, C0074g c0074g3, int i) {
        Object obj = null;
        if (i != 0) {
            if (i < 0) {
                i *= -1;
                obj = 1;
            }
            this.f360b = (float) i;
        }
        if (obj == null) {
            this.f362d.m268a(c0074g, -1.0f);
            this.f362d.m268a(c0074g2, 1.0f);
            this.f362d.m268a(c0074g3, 1.0f);
        } else {
            this.f362d.m268a(c0074g, 1.0f);
            this.f362d.m268a(c0074g2, -1.0f);
            this.f362d.m268a(c0074g3, -1.0f);
        }
        return this;
    }

    public C0066b m282a(C0074g c0074g, C0074g c0074g2, C0074g c0074g3, C0074g c0074g4, float f) {
        this.f362d.m268a(c0074g, -1.0f);
        this.f362d.m268a(c0074g2, 1.0f);
        this.f362d.m268a(c0074g3, f);
        this.f362d.m268a(c0074g4, -f);
        return this;
    }

    void m283a() {
        this.f362d.m265a(this);
    }

    boolean m284a(C0066b c0066b) {
        this.f362d.m266a(this, c0066b);
        return true;
    }

    boolean m285a(C0074g c0074g) {
        return this.f362d.m272b(c0074g);
    }

    public C0066b m286b(C0074g c0074g, int i) {
        if (i < 0) {
            this.f360b = (float) (i * -1);
            this.f362d.m268a(c0074g, 1.0f);
        } else {
            this.f360b = (float) i;
            this.f362d.m268a(c0074g, -1.0f);
        }
        return this;
    }

    public C0066b m287b(C0074g c0074g, C0074g c0074g2, C0074g c0074g3, int i) {
        Object obj = null;
        if (i != 0) {
            if (i < 0) {
                i *= -1;
                obj = 1;
            }
            this.f360b = (float) i;
        }
        if (obj == null) {
            this.f362d.m268a(c0074g, -1.0f);
            this.f362d.m268a(c0074g2, 1.0f);
            this.f362d.m268a(c0074g3, -1.0f);
        } else {
            this.f362d.m268a(c0074g, 1.0f);
            this.f362d.m268a(c0074g2, -1.0f);
            this.f362d.m268a(c0074g3, 1.0f);
        }
        return this;
    }

    void m288b(C0074g c0074g) {
        if (this.f359a != null) {
            this.f362d.m268a(this.f359a, -1.0f);
            this.f359a = null;
        }
        float a = this.f362d.m261a(c0074g) * -1.0f;
        this.f359a = c0074g;
        if (a != 1.0f) {
            this.f360b /= a;
            this.f362d.m264a(a);
        }
    }

    boolean m289b() {
        return this.f359a != null && (this.f359a.f397f == C0073a.UNRESTRICTED || this.f360b >= 0.0f);
    }

    C0066b m290c(C0074g c0074g, int i) {
        this.f362d.m268a(c0074g, (float) i);
        return this;
    }

    String m291c() {
        String str;
        Object obj;
        String str2 = "";
        str2 = (this.f359a == null ? str2 + "0" : str2 + this.f359a) + " = ";
        if (this.f360b != 0.0f) {
            str = str2 + this.f360b;
            obj = 1;
        } else {
            str = str2;
            obj = null;
        }
        int i = this.f362d.f348a;
        String str3 = str;
        for (int i2 = 0; i2 < i; i2++) {
            C0074g a = this.f362d.m262a(i2);
            if (a != null) {
                float f;
                float b = this.f362d.m269b(i2);
                String c0074g = a.toString();
                if (obj == null) {
                    if (b < 0.0f) {
                        str3 = str3 + "- ";
                        f = b * -1.0f;
                    } else {
                        f = b;
                    }
                } else if (b > 0.0f) {
                    str3 = str3 + " + ";
                    f = b;
                } else {
                    str3 = str3 + " - ";
                    f = b * -1.0f;
                }
                str3 = f == 1.0f ? str3 + c0074g : str3 + f + " " + c0074g;
                int i3 = 1;
            }
        }
        return obj == null ? str3 + "0.0" : str3;
    }

    public void m292d() {
        this.f359a = null;
        this.f362d.m263a();
        this.f360b = 0.0f;
        this.f363e = false;
    }

    void m293e() {
        if (this.f360b < 0.0f) {
            this.f360b *= -1.0f;
            this.f362d.m270b();
        }
    }

    void m294f() {
        C0074g c = this.f362d.m274c();
        if (c != null) {
            m288b(c);
        }
        if (this.f362d.f348a == 0) {
            this.f363e = true;
        }
    }

    public String toString() {
        return m291c();
    }
}
