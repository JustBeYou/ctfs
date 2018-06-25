package android.support.v4.p016g;

import java.util.ConcurrentModificationException;
import java.util.Map;

public class C0228k<K, V> {
    static Object[] f830b;
    static int f831c;
    static Object[] f832d;
    static int f833e;
    int[] f834f;
    Object[] f835g;
    int f836h;

    public C0228k() {
        this.f834f = C0232c.f850a;
        this.f835g = C0232c.f852c;
        this.f836h = 0;
    }

    public C0228k(int i) {
        if (i == 0) {
            this.f834f = C0232c.f850a;
            this.f835g = C0232c.f852c;
        } else {
            m1108e(i);
        }
        this.f836h = 0;
    }

    private static int m1106a(int[] iArr, int i, int i2) {
        try {
            return C0232c.m1139a(iArr, i, i2);
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new ConcurrentModificationException();
        }
    }

    private static void m1107a(int[] iArr, Object[] objArr, int i) {
        int i2;
        if (iArr.length == 8) {
            synchronized (C0229a.class) {
                if (f833e < 10) {
                    objArr[0] = f832d;
                    objArr[1] = iArr;
                    for (i2 = (i << 1) - 1; i2 >= 2; i2--) {
                        objArr[i2] = null;
                    }
                    f832d = objArr;
                    f833e++;
                }
            }
        } else if (iArr.length == 4) {
            synchronized (C0229a.class) {
                if (f831c < 10) {
                    objArr[0] = f830b;
                    objArr[1] = iArr;
                    for (i2 = (i << 1) - 1; i2 >= 2; i2--) {
                        objArr[i2] = null;
                    }
                    f830b = objArr;
                    f831c++;
                }
            }
        }
    }

    private void m1108e(int i) {
        Object[] objArr;
        if (i == 8) {
            synchronized (C0229a.class) {
                if (f832d != null) {
                    objArr = f832d;
                    this.f835g = objArr;
                    f832d = (Object[]) objArr[0];
                    this.f834f = (int[]) objArr[1];
                    objArr[1] = null;
                    objArr[0] = null;
                    f833e--;
                    return;
                }
            }
        } else if (i == 4) {
            synchronized (C0229a.class) {
                if (f830b != null) {
                    objArr = f830b;
                    this.f835g = objArr;
                    f830b = (Object[]) objArr[0];
                    this.f834f = (int[]) objArr[1];
                    objArr[1] = null;
                    objArr[0] = null;
                    f831c--;
                    return;
                }
            }
        }
        this.f834f = new int[i];
        this.f835g = new Object[(i << 1)];
    }

    int m1109a() {
        int i = this.f836h;
        if (i == 0) {
            return -1;
        }
        int a = C0228k.m1106a(this.f834f, i, 0);
        if (a < 0 || this.f835g[a << 1] == null) {
            return a;
        }
        int i2 = a + 1;
        while (i2 < i && this.f834f[i2] == 0) {
            if (this.f835g[i2 << 1] == null) {
                return i2;
            }
            i2++;
        }
        a--;
        while (a >= 0 && this.f834f[a] == 0) {
            if (this.f835g[a << 1] == null) {
                return a;
            }
            a--;
        }
        return i2 ^ -1;
    }

    public int m1110a(Object obj) {
        return obj == null ? m1109a() : m1111a(obj, obj.hashCode());
    }

    int m1111a(Object obj, int i) {
        int i2 = this.f836h;
        if (i2 == 0) {
            return -1;
        }
        int a = C0228k.m1106a(this.f834f, i2, i);
        if (a < 0 || obj.equals(this.f835g[a << 1])) {
            return a;
        }
        int i3 = a + 1;
        while (i3 < i2 && this.f834f[i3] == i) {
            if (obj.equals(this.f835g[i3 << 1])) {
                return i3;
            }
            i3++;
        }
        a--;
        while (a >= 0 && this.f834f[a] == i) {
            if (obj.equals(this.f835g[a << 1])) {
                return a;
            }
            a--;
        }
        return i3 ^ -1;
    }

    public V m1112a(int i, V v) {
        int i2 = (i << 1) + 1;
        V v2 = this.f835g[i2];
        this.f835g[i2] = v;
        return v2;
    }

    public void m1113a(int i) {
        int i2 = this.f836h;
        if (this.f834f.length < i) {
            int[] iArr = this.f834f;
            Object[] objArr = this.f835g;
            m1108e(i);
            if (this.f836h > 0) {
                System.arraycopy(iArr, 0, this.f834f, 0, i2);
                System.arraycopy(objArr, 0, this.f835g, 0, i2 << 1);
            }
            C0228k.m1107a(iArr, objArr, i2);
        }
        if (this.f836h != i2) {
            throw new ConcurrentModificationException();
        }
    }

    int m1114b(Object obj) {
        int i = 1;
        int i2 = this.f836h * 2;
        Object[] objArr = this.f835g;
        if (obj == null) {
            while (i < i2) {
                if (objArr[i] == null) {
                    return i >> 1;
                }
                i += 2;
            }
        } else {
            while (i < i2) {
                if (obj.equals(objArr[i])) {
                    return i >> 1;
                }
                i += 2;
            }
        }
        return -1;
    }

    public K m1115b(int i) {
        return this.f835g[i << 1];
    }

    public V m1116c(int i) {
        return this.f835g[(i << 1) + 1];
    }

    public void clear() {
        if (this.f836h > 0) {
            int[] iArr = this.f834f;
            Object[] objArr = this.f835g;
            int i = this.f836h;
            this.f834f = C0232c.f850a;
            this.f835g = C0232c.f852c;
            this.f836h = 0;
            C0228k.m1107a(iArr, objArr, i);
        }
        if (this.f836h > 0) {
            throw new ConcurrentModificationException();
        }
    }

    public boolean containsKey(Object obj) {
        return m1110a(obj) >= 0;
    }

    public boolean containsValue(Object obj) {
        return m1114b(obj) >= 0;
    }

    public V m1117d(int i) {
        int i2 = 8;
        V v = this.f835g[(i << 1) + 1];
        int i3 = this.f836h;
        if (i3 <= 1) {
            C0228k.m1107a(this.f834f, this.f835g, i3);
            this.f834f = C0232c.f850a;
            this.f835g = C0232c.f852c;
            i2 = 0;
        } else {
            int i4 = i3 - 1;
            if (this.f834f.length <= 8 || this.f836h >= this.f834f.length / 3) {
                if (i < i4) {
                    System.arraycopy(this.f834f, i + 1, this.f834f, i, i4 - i);
                    System.arraycopy(this.f835g, (i + 1) << 1, this.f835g, i << 1, (i4 - i) << 1);
                }
                this.f835g[i4 << 1] = null;
                this.f835g[(i4 << 1) + 1] = null;
                i2 = i4;
            } else {
                if (i3 > 8) {
                    i2 = (i3 >> 1) + i3;
                }
                Object obj = this.f834f;
                Object obj2 = this.f835g;
                m1108e(i2);
                if (i3 != this.f836h) {
                    throw new ConcurrentModificationException();
                }
                if (i > 0) {
                    System.arraycopy(obj, 0, this.f834f, 0, i);
                    System.arraycopy(obj2, 0, this.f835g, 0, i << 1);
                }
                if (i < i4) {
                    System.arraycopy(obj, i + 1, this.f834f, i, i4 - i);
                    System.arraycopy(obj2, (i + 1) << 1, this.f835g, i << 1, (i4 - i) << 1);
                }
                i2 = i4;
            }
        }
        if (i3 != this.f836h) {
            throw new ConcurrentModificationException();
        }
        this.f836h = i2;
        return v;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        int i;
        Object b;
        Object c;
        Object obj2;
        if (obj instanceof C0228k) {
            C0228k c0228k = (C0228k) obj;
            if (size() != c0228k.size()) {
                return false;
            }
            i = 0;
            while (i < this.f836h) {
                try {
                    b = m1115b(i);
                    c = m1116c(i);
                    obj2 = c0228k.get(b);
                    if (c == null) {
                        if (obj2 != null || !c0228k.containsKey(b)) {
                            return false;
                        }
                    } else if (!c.equals(obj2)) {
                        return false;
                    }
                    i++;
                } catch (NullPointerException e) {
                    return false;
                } catch (ClassCastException e2) {
                    return false;
                }
            }
            return true;
        } else if (!(obj instanceof Map)) {
            return false;
        } else {
            Map map = (Map) obj;
            if (size() != map.size()) {
                return false;
            }
            i = 0;
            while (i < this.f836h) {
                try {
                    b = m1115b(i);
                    c = m1116c(i);
                    obj2 = map.get(b);
                    if (c == null) {
                        if (obj2 != null || !map.containsKey(b)) {
                            return false;
                        }
                    } else if (!c.equals(obj2)) {
                        return false;
                    }
                    i++;
                } catch (NullPointerException e3) {
                    return false;
                } catch (ClassCastException e4) {
                    return false;
                }
            }
            return true;
        }
    }

    public V get(Object obj) {
        int a = m1110a(obj);
        return a >= 0 ? this.f835g[(a << 1) + 1] : null;
    }

    public int hashCode() {
        int[] iArr = this.f834f;
        Object[] objArr = this.f835g;
        int i = this.f836h;
        int i2 = 1;
        int i3 = 0;
        int i4 = 0;
        while (i3 < i) {
            Object obj = objArr[i2];
            i4 += (obj == null ? 0 : obj.hashCode()) ^ iArr[i3];
            i3++;
            i2 += 2;
        }
        return i4;
    }

    public boolean isEmpty() {
        return this.f836h <= 0;
    }

    public V put(K k, V v) {
        int a;
        int i;
        int i2 = 8;
        int i3 = this.f836h;
        if (k == null) {
            a = m1109a();
            i = 0;
        } else {
            i = k.hashCode();
            a = m1111a((Object) k, i);
        }
        if (a >= 0) {
            int i4 = (a << 1) + 1;
            V v2 = this.f835g[i4];
            this.f835g[i4] = v;
            return v2;
        }
        a ^= -1;
        if (i3 >= this.f834f.length) {
            if (i3 >= 8) {
                i2 = (i3 >> 1) + i3;
            } else if (i3 < 4) {
                i2 = 4;
            }
            int[] iArr = this.f834f;
            Object[] objArr = this.f835g;
            m1108e(i2);
            if (i3 != this.f836h) {
                throw new ConcurrentModificationException();
            }
            if (this.f834f.length > 0) {
                System.arraycopy(iArr, 0, this.f834f, 0, iArr.length);
                System.arraycopy(objArr, 0, this.f835g, 0, objArr.length);
            }
            C0228k.m1107a(iArr, objArr, i3);
        }
        if (a < i3) {
            System.arraycopy(this.f834f, a, this.f834f, a + 1, i3 - a);
            System.arraycopy(this.f835g, a << 1, this.f835g, (a + 1) << 1, (this.f836h - a) << 1);
        }
        if (i3 != this.f836h || a >= this.f834f.length) {
            throw new ConcurrentModificationException();
        }
        this.f834f[a] = i;
        this.f835g[a << 1] = k;
        this.f835g[(a << 1) + 1] = v;
        this.f836h++;
        return null;
    }

    public V remove(Object obj) {
        int a = m1110a(obj);
        return a >= 0 ? m1117d(a) : null;
    }

    public int size() {
        return this.f836h;
    }

    public String toString() {
        if (isEmpty()) {
            return "{}";
        }
        StringBuilder stringBuilder = new StringBuilder(this.f836h * 28);
        stringBuilder.append('{');
        for (int i = 0; i < this.f836h; i++) {
            if (i > 0) {
                stringBuilder.append(", ");
            }
            C0228k b = m1115b(i);
            if (b != this) {
                stringBuilder.append(b);
            } else {
                stringBuilder.append("(this Map)");
            }
            stringBuilder.append('=');
            b = m1116c(i);
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
