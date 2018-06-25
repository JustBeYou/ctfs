package android.support.constraint.p007a;

import android.support.constraint.p007a.C0074g.C0073a;
import java.util.Arrays;

public class C0065a {
    int f348a = 0;
    private final C0066b f349b;
    private final C0067c f350c;
    private int f351d = 8;
    private C0074g f352e = null;
    private int[] f353f = new int[this.f351d];
    private int[] f354g = new int[this.f351d];
    private float[] f355h = new float[this.f351d];
    private int f356i = -1;
    private int f357j = -1;
    private boolean f358k = false;

    C0065a(C0066b c0066b, C0067c c0067c) {
        this.f349b = c0066b;
        this.f350c = c0067c;
    }

    public final float m261a(C0074g c0074g) {
        if (this.f352e == c0074g) {
            this.f352e = null;
        }
        if (this.f356i == -1) {
            return 0.0f;
        }
        int i = this.f356i;
        int i2 = 0;
        int i3 = -1;
        while (i != -1 && i2 < this.f348a) {
            int i4 = this.f353f[i];
            if (i4 == c0074g.f392a) {
                if (i == this.f356i) {
                    this.f356i = this.f354g[i];
                } else {
                    this.f354g[i3] = this.f354g[i];
                }
                this.f350c.f366c[i4].m338b(this.f349b);
                this.f348a--;
                this.f353f[i] = -1;
                if (this.f358k) {
                    this.f357j = i;
                }
                return this.f355h[i];
            }
            i2++;
            int i5 = i;
            i = this.f354g[i];
            i3 = i5;
        }
        return 0.0f;
    }

    final C0074g m262a(int i) {
        int i2 = this.f356i;
        int i3 = 0;
        while (i2 != -1 && i3 < this.f348a) {
            if (i3 == i) {
                return this.f350c.f366c[this.f353f[i2]];
            }
            i2 = this.f354g[i2];
            i3++;
        }
        return null;
    }

    public final void m263a() {
        this.f356i = -1;
        this.f357j = -1;
        this.f358k = false;
        this.f348a = 0;
    }

    void m264a(float f) {
        int i = this.f356i;
        int i2 = 0;
        while (i != -1 && i2 < this.f348a) {
            float[] fArr = this.f355h;
            fArr[i] = fArr[i] / f;
            i = this.f354g[i];
            i2++;
        }
    }

    void m265a(C0066b c0066b) {
        int i = this.f356i;
        int i2 = 0;
        while (i != -1 && i2 < this.f348a) {
            this.f350c.f366c[this.f353f[i]].m335a(c0066b);
            i = this.f354g[i];
            i2++;
        }
    }

    void m266a(C0066b c0066b, C0066b c0066b2) {
        int i = this.f356i;
        int i2 = 0;
        while (i != -1 && i2 < this.f348a) {
            if (this.f353f[i] == c0066b2.f359a.f392a) {
                float f = this.f355h[i];
                m261a(c0066b2.f359a);
                C0065a c0065a = c0066b2.f362d;
                i = c0065a.f356i;
                i2 = 0;
                while (i != -1 && i2 < c0065a.f348a) {
                    m271b(this.f350c.f366c[c0065a.f353f[i]], c0065a.f355h[i] * f);
                    i = c0065a.f354g[i];
                    i2++;
                }
                c0066b.f360b += c0066b2.f360b * f;
                c0066b2.f359a.m338b(c0066b);
                i = this.f356i;
                i2 = 0;
            } else {
                i = this.f354g[i];
                i2++;
            }
        }
    }

    void m267a(C0066b c0066b, C0066b[] c0066bArr) {
        int i = this.f356i;
        int i2 = 0;
        while (i != -1 && i2 < this.f348a) {
            C0074g c0074g = this.f350c.f366c[this.f353f[i]];
            if (c0074g.f393b != -1) {
                float f = this.f355h[i];
                m261a(c0074g);
                C0066b c0066b2 = c0066bArr[c0074g.f393b];
                if (!c0066b2.f363e) {
                    C0065a c0065a = c0066b2.f362d;
                    i = c0065a.f356i;
                    i2 = 0;
                    while (i != -1 && i2 < c0065a.f348a) {
                        m271b(this.f350c.f366c[c0065a.f353f[i]], c0065a.f355h[i] * f);
                        i = c0065a.f354g[i];
                        i2++;
                    }
                }
                c0066b.f360b += c0066b2.f360b * f;
                c0066b2.f359a.m338b(c0066b);
                i = this.f356i;
                i2 = 0;
            } else {
                i = this.f354g[i];
                i2++;
            }
        }
    }

    public final void m268a(C0074g c0074g, float f) {
        if (f == 0.0f) {
            m261a(c0074g);
        } else if (this.f356i == -1) {
            this.f356i = 0;
            this.f355h[this.f356i] = f;
            this.f353f[this.f356i] = c0074g.f392a;
            this.f354g[this.f356i] = -1;
            this.f348a++;
            if (!this.f358k) {
                this.f357j++;
            }
        } else {
            int i = this.f356i;
            int i2 = 0;
            int i3 = -1;
            while (i != -1 && i2 < this.f348a) {
                if (this.f353f[i] == c0074g.f392a) {
                    this.f355h[i] = f;
                    return;
                }
                if (this.f353f[i] < c0074g.f392a) {
                    i3 = i;
                }
                i2++;
                i = this.f354g[i];
            }
            i = this.f357j + 1;
            if (this.f358k) {
                i = this.f353f[this.f357j] == -1 ? this.f357j : this.f353f.length;
            }
            if (i >= this.f353f.length && this.f348a < this.f353f.length) {
                for (i2 = 0; i2 < this.f353f.length; i2++) {
                    if (this.f353f[i2] == -1) {
                        i = i2;
                        break;
                    }
                }
            }
            if (i >= this.f353f.length) {
                i = this.f353f.length;
                this.f351d *= 2;
                this.f358k = false;
                this.f357j = i - 1;
                this.f355h = Arrays.copyOf(this.f355h, this.f351d);
                this.f353f = Arrays.copyOf(this.f353f, this.f351d);
                this.f354g = Arrays.copyOf(this.f354g, this.f351d);
            }
            this.f353f[i] = c0074g.f392a;
            this.f355h[i] = f;
            if (i3 != -1) {
                this.f354g[i] = this.f354g[i3];
                this.f354g[i3] = i;
            } else {
                this.f354g[i] = this.f356i;
                this.f356i = i;
            }
            this.f348a++;
            if (!this.f358k) {
                this.f357j++;
            }
            if (this.f348a >= this.f353f.length) {
                this.f358k = true;
            }
        }
    }

    final float m269b(int i) {
        int i2 = this.f356i;
        int i3 = 0;
        while (i2 != -1 && i3 < this.f348a) {
            if (i3 == i) {
                return this.f355h[i2];
            }
            i2 = this.f354g[i2];
            i3++;
        }
        return 0.0f;
    }

    void m270b() {
        int i = this.f356i;
        int i2 = 0;
        while (i != -1 && i2 < this.f348a) {
            float[] fArr = this.f355h;
            fArr[i] = fArr[i] * -1.0f;
            i = this.f354g[i];
            i2++;
        }
    }

    public final void m271b(C0074g c0074g, float f) {
        if (f != 0.0f) {
            if (this.f356i == -1) {
                this.f356i = 0;
                this.f355h[this.f356i] = f;
                this.f353f[this.f356i] = c0074g.f392a;
                this.f354g[this.f356i] = -1;
                this.f348a++;
                if (!this.f358k) {
                    this.f357j++;
                    return;
                }
                return;
            }
            int i = this.f356i;
            int i2 = 0;
            int i3 = -1;
            while (i != -1 && i2 < this.f348a) {
                int i4 = this.f353f[i];
                if (i4 == c0074g.f392a) {
                    float[] fArr = this.f355h;
                    fArr[i] = fArr[i] + f;
                    if (this.f355h[i] == 0.0f) {
                        if (i == this.f356i) {
                            this.f356i = this.f354g[i];
                        } else {
                            this.f354g[i3] = this.f354g[i];
                        }
                        this.f350c.f366c[i4].m338b(this.f349b);
                        if (this.f358k) {
                            this.f357j = i;
                        }
                        this.f348a--;
                        return;
                    }
                    return;
                }
                if (this.f353f[i] < c0074g.f392a) {
                    i3 = i;
                }
                i2++;
                i = this.f354g[i];
            }
            i = this.f357j + 1;
            if (this.f358k) {
                i = this.f353f[this.f357j] == -1 ? this.f357j : this.f353f.length;
            }
            if (i >= this.f353f.length && this.f348a < this.f353f.length) {
                for (i2 = 0; i2 < this.f353f.length; i2++) {
                    if (this.f353f[i2] == -1) {
                        i = i2;
                        break;
                    }
                }
            }
            if (i >= this.f353f.length) {
                i = this.f353f.length;
                this.f351d *= 2;
                this.f358k = false;
                this.f357j = i - 1;
                this.f355h = Arrays.copyOf(this.f355h, this.f351d);
                this.f353f = Arrays.copyOf(this.f353f, this.f351d);
                this.f354g = Arrays.copyOf(this.f354g, this.f351d);
            }
            this.f353f[i] = c0074g.f392a;
            this.f355h[i] = f;
            if (i3 != -1) {
                this.f354g[i] = this.f354g[i3];
                this.f354g[i3] = i;
            } else {
                this.f354g[i] = this.f356i;
                this.f356i = i;
            }
            this.f348a++;
            if (!this.f358k) {
                this.f357j++;
            }
            if (this.f357j >= this.f353f.length) {
                this.f358k = true;
                this.f357j = this.f353f.length - 1;
            }
        }
    }

    final boolean m272b(C0074g c0074g) {
        if (this.f356i == -1) {
            return false;
        }
        int i = this.f356i;
        int i2 = 0;
        while (i != -1 && i2 < this.f348a) {
            if (this.f353f[i] == c0074g.f392a) {
                return true;
            }
            i = this.f354g[i];
            i2++;
        }
        return false;
    }

    public final float m273c(C0074g c0074g) {
        int i = this.f356i;
        int i2 = 0;
        while (i != -1 && i2 < this.f348a) {
            if (this.f353f[i] == c0074g.f392a) {
                return this.f355h[i];
            }
            i = this.f354g[i];
            i2++;
        }
        return 0.0f;
    }

    C0074g m274c() {
        C0074g c0074g = null;
        int i = 0;
        int i2 = this.f356i;
        C0074g c0074g2 = null;
        while (i2 != -1 && i < this.f348a) {
            float f;
            C0074g c0074g3;
            float f2 = this.f355h[i2];
            if (f2 < 0.0f) {
                if (f2 > (-981668463)) {
                    this.f355h[i2] = 0.0f;
                    f = 0.0f;
                }
                f = f2;
            } else {
                if (f2 < 0.001f) {
                    this.f355h[i2] = 0.0f;
                    f = 0.0f;
                }
                f = f2;
            }
            if (f != 0.0f) {
                c0074g3 = this.f350c.f366c[this.f353f[i2]];
                if (c0074g3.f397f == C0073a.UNRESTRICTED) {
                    if (f < 0.0f) {
                        return c0074g3;
                    }
                    if (c0074g2 == null) {
                        c0074g2 = c0074g;
                        i++;
                        i2 = this.f354g[i2];
                        c0074g = c0074g2;
                        c0074g2 = c0074g3;
                    }
                } else if (f < 0.0f && (c0074g == null || c0074g3.f394c < c0074g.f394c)) {
                    C0074g c0074g4 = c0074g2;
                    c0074g2 = c0074g3;
                    c0074g3 = c0074g4;
                    i++;
                    i2 = this.f354g[i2];
                    c0074g = c0074g2;
                    c0074g2 = c0074g3;
                }
            }
            c0074g3 = c0074g2;
            c0074g2 = c0074g;
            i++;
            i2 = this.f354g[i2];
            c0074g = c0074g2;
            c0074g2 = c0074g3;
        }
        return c0074g2 != null ? c0074g2 : c0074g;
    }

    public String toString() {
        String str = "";
        int i = this.f356i;
        int i2 = 0;
        while (i != -1 && i2 < this.f348a) {
            str = ((str + " -> ") + this.f355h[i] + " : ") + this.f350c.f366c[this.f353f[i]];
            i = this.f354g[i];
            i2++;
        }
        return str;
    }
}
