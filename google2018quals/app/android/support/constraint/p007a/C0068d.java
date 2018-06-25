package android.support.constraint.p007a;

import android.support.constraint.p007a.C0074g.C0073a;
import java.util.ArrayList;

public class C0068d {
    ArrayList<C0074g> f367a = new ArrayList();

    private void m295b(C0069e c0069e) {
        this.f367a.clear();
        for (int i = 1; i < c0069e.f370b; i++) {
            C0074g c0074g = c0069e.f371c.f366c[i];
            for (int i2 = 0; i2 < 6; i2++) {
                c0074g.f396e[i2] = 0.0f;
            }
            c0074g.f396e[c0074g.f394c] = 1.0f;
            if (c0074g.f397f == C0073a.ERROR) {
                this.f367a.add(c0074g);
            }
        }
    }

    C0074g m296a() {
        int size = this.f367a.size();
        int i = 0;
        int i2 = 0;
        C0074g c0074g = null;
        while (i < size) {
            C0074g c0074g2 = (C0074g) this.f367a.get(i);
            C0074g c0074g3 = c0074g;
            int i3 = 5;
            while (i3 >= 0) {
                float f = c0074g2.f396e[i3];
                if (c0074g3 == null && f < 0.0f && i3 >= r1) {
                    i2 = i3;
                    c0074g3 = c0074g2;
                }
                if (f > 0.0f && i3 > r1) {
                    i2 = i3;
                    c0074g3 = null;
                }
                i3--;
            }
            i++;
            c0074g = c0074g3;
        }
        return c0074g;
    }

    void m297a(C0069e c0069e) {
        m295b(c0069e);
        int size = this.f367a.size();
        for (int i = 0; i < size; i++) {
            C0074g c0074g = (C0074g) this.f367a.get(i);
            if (c0074g.f393b != -1) {
                C0065a c0065a = c0069e.m312a(c0074g.f393b).f362d;
                int i2 = c0065a.f348a;
                for (int i3 = 0; i3 < i2; i3++) {
                    C0074g a = c0065a.m262a(i3);
                    if (a != null) {
                        float b = c0065a.m269b(i3);
                        for (int i4 = 0; i4 < 6; i4++) {
                            float[] fArr = a.f396e;
                            fArr[i4] = fArr[i4] + (c0074g.f396e[i4] * b);
                        }
                        if (!this.f367a.contains(a)) {
                            this.f367a.add(a);
                        }
                    }
                }
                c0074g.m334a();
            }
        }
    }

    public String toString() {
        int size = this.f367a.size();
        String str = "Goal: ";
        for (int i = 0; i < size; i++) {
            str = str + ((C0074g) this.f367a.get(i)).m337b();
        }
        return str;
    }
}
