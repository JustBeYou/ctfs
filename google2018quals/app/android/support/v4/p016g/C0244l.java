package android.support.v4.p016g;

public class C0244l<E> implements Cloneable {
    private static final Object f882a = new Object();
    private boolean f883b;
    private int[] f884c;
    private Object[] f885d;
    private int f886e;

    public C0244l() {
        this(10);
    }

    public C0244l(int i) {
        this.f883b = false;
        if (i == 0) {
            this.f884c = C0232c.f850a;
            this.f885d = C0232c.f852c;
        } else {
            int a = C0232c.m1138a(i);
            this.f884c = new int[a];
            this.f885d = new Object[a];
        }
        this.f886e = 0;
    }

    private void m1167d() {
        int i = this.f886e;
        int[] iArr = this.f884c;
        Object[] objArr = this.f885d;
        int i2 = 0;
        for (int i3 = 0; i3 < i; i3++) {
            Object obj = objArr[i3];
            if (obj != f882a) {
                if (i3 != i2) {
                    iArr[i2] = iArr[i3];
                    objArr[i2] = obj;
                    objArr[i3] = null;
                }
                i2++;
            }
        }
        this.f883b = false;
        this.f886e = i2;
    }

    public C0244l<E> m1168a() {
        try {
            C0244l<E> c0244l = (C0244l) super.clone();
            try {
                c0244l.f884c = (int[]) this.f884c.clone();
                c0244l.f885d = (Object[]) this.f885d.clone();
                return c0244l;
            } catch (CloneNotSupportedException e) {
                return c0244l;
            }
        } catch (CloneNotSupportedException e2) {
            return null;
        }
    }

    public E m1169a(int i) {
        return m1170a(i, null);
    }

    public E m1170a(int i, E e) {
        int a = C0232c.m1139a(this.f884c, this.f886e, i);
        return (a < 0 || this.f885d[a] == f882a) ? e : this.f885d[a];
    }

    public int m1171b() {
        if (this.f883b) {
            m1167d();
        }
        return this.f886e;
    }

    public void m1172b(int i) {
        int a = C0232c.m1139a(this.f884c, this.f886e, i);
        if (a >= 0 && this.f885d[a] != f882a) {
            this.f885d[a] = f882a;
            this.f883b = true;
        }
    }

    public void m1173b(int i, E e) {
        int a = C0232c.m1139a(this.f884c, this.f886e, i);
        if (a >= 0) {
            this.f885d[a] = e;
            return;
        }
        a ^= -1;
        if (a >= this.f886e || this.f885d[a] != f882a) {
            if (this.f883b && this.f886e >= this.f884c.length) {
                m1167d();
                a = C0232c.m1139a(this.f884c, this.f886e, i) ^ -1;
            }
            if (this.f886e >= this.f884c.length) {
                int a2 = C0232c.m1138a(this.f886e + 1);
                Object obj = new int[a2];
                Object obj2 = new Object[a2];
                System.arraycopy(this.f884c, 0, obj, 0, this.f884c.length);
                System.arraycopy(this.f885d, 0, obj2, 0, this.f885d.length);
                this.f884c = obj;
                this.f885d = obj2;
            }
            if (this.f886e - a != 0) {
                System.arraycopy(this.f884c, a, this.f884c, a + 1, this.f886e - a);
                System.arraycopy(this.f885d, a, this.f885d, a + 1, this.f886e - a);
            }
            this.f884c[a] = i;
            this.f885d[a] = e;
            this.f886e++;
            return;
        }
        this.f884c[a] = i;
        this.f885d[a] = e;
    }

    public void m1174c() {
        int i = this.f886e;
        Object[] objArr = this.f885d;
        for (int i2 = 0; i2 < i; i2++) {
            objArr[i2] = null;
        }
        this.f886e = 0;
        this.f883b = false;
    }

    public void m1175c(int i) {
        m1172b(i);
    }

    public void m1176c(int i, E e) {
        if (this.f886e == 0 || i > this.f884c[this.f886e - 1]) {
            if (this.f883b && this.f886e >= this.f884c.length) {
                m1167d();
            }
            int i2 = this.f886e;
            if (i2 >= this.f884c.length) {
                int a = C0232c.m1138a(i2 + 1);
                Object obj = new int[a];
                Object obj2 = new Object[a];
                System.arraycopy(this.f884c, 0, obj, 0, this.f884c.length);
                System.arraycopy(this.f885d, 0, obj2, 0, this.f885d.length);
                this.f884c = obj;
                this.f885d = obj2;
            }
            this.f884c[i2] = i;
            this.f885d[i2] = e;
            this.f886e = i2 + 1;
            return;
        }
        m1173b(i, e);
    }

    public /* synthetic */ Object clone() {
        return m1168a();
    }

    public int m1177d(int i) {
        if (this.f883b) {
            m1167d();
        }
        return this.f884c[i];
    }

    public E m1178e(int i) {
        if (this.f883b) {
            m1167d();
        }
        return this.f885d[i];
    }

    public String toString() {
        if (m1171b() <= 0) {
            return "{}";
        }
        StringBuilder stringBuilder = new StringBuilder(this.f886e * 28);
        stringBuilder.append('{');
        for (int i = 0; i < this.f886e; i++) {
            if (i > 0) {
                stringBuilder.append(", ");
            }
            stringBuilder.append(m1177d(i));
            stringBuilder.append('=');
            C0244l e = m1178e(i);
            if (e != this) {
                stringBuilder.append(e);
            } else {
                stringBuilder.append("(this Map)");
            }
        }
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
