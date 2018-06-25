package android.support.v4.p016g;

public class C0235f<E> implements Cloneable {
    private static final Object f855a = new Object();
    private boolean f856b;
    private long[] f857c;
    private Object[] f858d;
    private int f859e;

    public C0235f() {
        this(10);
    }

    public C0235f(int i) {
        this.f856b = false;
        if (i == 0) {
            this.f857c = C0232c.f851b;
            this.f858d = C0232c.f852c;
        } else {
            int b = C0232c.m1142b(i);
            this.f857c = new long[b];
            this.f858d = new Object[b];
        }
        this.f859e = 0;
    }

    private void m1146d() {
        int i = this.f859e;
        long[] jArr = this.f857c;
        Object[] objArr = this.f858d;
        int i2 = 0;
        for (int i3 = 0; i3 < i; i3++) {
            Object obj = objArr[i3];
            if (obj != f855a) {
                if (i3 != i2) {
                    jArr[i2] = jArr[i3];
                    objArr[i2] = obj;
                    objArr[i3] = null;
                }
                i2++;
            }
        }
        this.f856b = false;
        this.f859e = i2;
    }

    public long m1147a(int i) {
        if (this.f856b) {
            m1146d();
        }
        return this.f857c[i];
    }

    public C0235f<E> m1148a() {
        try {
            C0235f<E> c0235f = (C0235f) super.clone();
            try {
                c0235f.f857c = (long[]) this.f857c.clone();
                c0235f.f858d = (Object[]) this.f858d.clone();
                return c0235f;
            } catch (CloneNotSupportedException e) {
                return c0235f;
            }
        } catch (CloneNotSupportedException e2) {
            return null;
        }
    }

    public E m1149a(long j) {
        return m1150a(j, null);
    }

    public E m1150a(long j, E e) {
        int a = C0232c.m1140a(this.f857c, this.f859e, j);
        return (a < 0 || this.f858d[a] == f855a) ? e : this.f858d[a];
    }

    public int m1151b() {
        if (this.f856b) {
            m1146d();
        }
        return this.f859e;
    }

    public E m1152b(int i) {
        if (this.f856b) {
            m1146d();
        }
        return this.f858d[i];
    }

    public void m1153b(long j) {
        int a = C0232c.m1140a(this.f857c, this.f859e, j);
        if (a >= 0 && this.f858d[a] != f855a) {
            this.f858d[a] = f855a;
            this.f856b = true;
        }
    }

    public void m1154b(long j, E e) {
        int a = C0232c.m1140a(this.f857c, this.f859e, j);
        if (a >= 0) {
            this.f858d[a] = e;
            return;
        }
        a ^= -1;
        if (a >= this.f859e || this.f858d[a] != f855a) {
            if (this.f856b && this.f859e >= this.f857c.length) {
                m1146d();
                a = C0232c.m1140a(this.f857c, this.f859e, j) ^ -1;
            }
            if (this.f859e >= this.f857c.length) {
                int b = C0232c.m1142b(this.f859e + 1);
                Object obj = new long[b];
                Object obj2 = new Object[b];
                System.arraycopy(this.f857c, 0, obj, 0, this.f857c.length);
                System.arraycopy(this.f858d, 0, obj2, 0, this.f858d.length);
                this.f857c = obj;
                this.f858d = obj2;
            }
            if (this.f859e - a != 0) {
                System.arraycopy(this.f857c, a, this.f857c, a + 1, this.f859e - a);
                System.arraycopy(this.f858d, a, this.f858d, a + 1, this.f859e - a);
            }
            this.f857c[a] = j;
            this.f858d[a] = e;
            this.f859e++;
            return;
        }
        this.f857c[a] = j;
        this.f858d[a] = e;
    }

    public void m1155c() {
        int i = this.f859e;
        Object[] objArr = this.f858d;
        for (int i2 = 0; i2 < i; i2++) {
            objArr[i2] = null;
        }
        this.f859e = 0;
        this.f856b = false;
    }

    public /* synthetic */ Object clone() {
        return m1148a();
    }

    public String toString() {
        if (m1151b() <= 0) {
            return "{}";
        }
        StringBuilder stringBuilder = new StringBuilder(this.f859e * 28);
        stringBuilder.append('{');
        for (int i = 0; i < this.f859e; i++) {
            if (i > 0) {
                stringBuilder.append(", ");
            }
            stringBuilder.append(m1147a(i));
            stringBuilder.append('=');
            C0235f b = m1152b(i);
            if (b != this) {
                stringBuilder.append(b);
            } else {
                stringBuilder.append("(this Map)");
            }
        }
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
