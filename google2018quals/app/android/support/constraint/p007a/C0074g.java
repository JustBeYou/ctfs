package android.support.constraint.p007a;

import java.util.Arrays;

public class C0074g {
    private static int f391i = 1;
    public int f392a = -1;
    int f393b = -1;
    public int f394c = 0;
    public float f395d;
    float[] f396e = new float[6];
    C0073a f397f;
    C0066b[] f398g = new C0066b[8];
    int f399h = 0;
    private String f400j;

    public enum C0073a {
        UNRESTRICTED,
        CONSTANT,
        SLACK,
        ERROR,
        UNKNOWN
    }

    public C0074g(C0073a c0073a) {
        this.f397f = c0073a;
    }

    void m334a() {
        for (int i = 0; i < 6; i++) {
            this.f396e[i] = 0.0f;
        }
    }

    void m335a(C0066b c0066b) {
        int i = 0;
        while (i < this.f399h) {
            if (this.f398g[i] != c0066b) {
                i++;
            } else {
                return;
            }
        }
        if (this.f399h >= this.f398g.length) {
            this.f398g = (C0066b[]) Arrays.copyOf(this.f398g, this.f398g.length * 2);
        }
        this.f398g[this.f399h] = c0066b;
        this.f399h++;
    }

    public void m336a(C0073a c0073a) {
        this.f397f = c0073a;
    }

    String m337b() {
        String str = this + "[";
        int i = 0;
        while (i < this.f396e.length) {
            str = str + this.f396e[i];
            str = i < this.f396e.length + -1 ? str + ", " : str + "] ";
            i++;
        }
        return str;
    }

    void m338b(C0066b c0066b) {
        int i = 0;
        for (int i2 = 0; i2 < this.f399h; i2++) {
            if (this.f398g[i2] == c0066b) {
                while (i < (this.f399h - i2) - 1) {
                    this.f398g[i2 + i] = this.f398g[(i2 + i) + 1];
                    i++;
                }
                this.f399h--;
                return;
            }
        }
    }

    public void m339c() {
        this.f400j = null;
        this.f397f = C0073a.UNKNOWN;
        this.f394c = 0;
        this.f392a = -1;
        this.f393b = -1;
        this.f395d = 0.0f;
        this.f399h = 0;
    }

    public String toString() {
        return "" + this.f400j;
    }
}
