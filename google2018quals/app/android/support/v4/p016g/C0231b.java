package android.support.v4.p016g;

import java.lang.reflect.Array;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public final class C0231b<E> implements Collection<E>, Set<E> {
    static Object[] f839a;
    static int f840b;
    static Object[] f841c;
    static int f842d;
    private static final int[] f843j = new int[0];
    private static final Object[] f844k = new Object[0];
    final boolean f845e;
    int[] f846f;
    Object[] f847g;
    int f848h;
    C0226h<E, E> f849i;

    class C02301 extends C0226h<E, E> {
        final /* synthetic */ C0231b f838a;

        C02301(C0231b c0231b) {
            this.f838a = c0231b;
        }

        protected int mo95a() {
            return this.f838a.f848h;
        }

        protected int mo96a(Object obj) {
            return this.f838a.m1134a(obj);
        }

        protected Object mo97a(int i, int i2) {
            return this.f838a.f847g[i];
        }

        protected E mo98a(int i, E e) {
            throw new UnsupportedOperationException("not a map");
        }

        protected void mo99a(int i) {
            this.f838a.m1137c(i);
        }

        protected void mo100a(E e, E e2) {
            this.f838a.add(e);
        }

        protected int mo101b(Object obj) {
            return this.f838a.m1134a(obj);
        }

        protected Map<E, E> mo102b() {
            throw new UnsupportedOperationException("not a map");
        }

        protected void mo103c() {
            this.f838a.clear();
        }
    }

    public C0231b() {
        this(0, false);
    }

    public C0231b(int i, boolean z) {
        this.f845e = z;
        if (i == 0) {
            this.f846f = f843j;
            this.f847g = f844k;
        } else {
            m1133d(i);
        }
        this.f848h = 0;
    }

    private int m1129a() {
        int i = this.f848h;
        if (i == 0) {
            return -1;
        }
        int a = C0232c.m1139a(this.f846f, i, 0);
        if (a < 0 || this.f847g[a] == null) {
            return a;
        }
        int i2 = a + 1;
        while (i2 < i && this.f846f[i2] == 0) {
            if (this.f847g[i2] == null) {
                return i2;
            }
            i2++;
        }
        a--;
        while (a >= 0 && this.f846f[a] == 0) {
            if (this.f847g[a] == null) {
                return a;
            }
            a--;
        }
        return i2 ^ -1;
    }

    private int m1130a(Object obj, int i) {
        int i2 = this.f848h;
        if (i2 == 0) {
            return -1;
        }
        int a = C0232c.m1139a(this.f846f, i2, i);
        if (a < 0 || obj.equals(this.f847g[a])) {
            return a;
        }
        int i3 = a + 1;
        while (i3 < i2 && this.f846f[i3] == i) {
            if (obj.equals(this.f847g[i3])) {
                return i3;
            }
            i3++;
        }
        a--;
        while (a >= 0 && this.f846f[a] == i) {
            if (obj.equals(this.f847g[a])) {
                return a;
            }
            a--;
        }
        return i3 ^ -1;
    }

    private static void m1131a(int[] iArr, Object[] objArr, int i) {
        int i2;
        if (iArr.length == 8) {
            synchronized (C0231b.class) {
                if (f842d < 10) {
                    objArr[0] = f841c;
                    objArr[1] = iArr;
                    for (i2 = i - 1; i2 >= 2; i2--) {
                        objArr[i2] = null;
                    }
                    f841c = objArr;
                    f842d++;
                }
            }
        } else if (iArr.length == 4) {
            synchronized (C0231b.class) {
                if (f840b < 10) {
                    objArr[0] = f839a;
                    objArr[1] = iArr;
                    for (i2 = i - 1; i2 >= 2; i2--) {
                        objArr[i2] = null;
                    }
                    f839a = objArr;
                    f840b++;
                }
            }
        }
    }

    private C0226h<E, E> m1132b() {
        if (this.f849i == null) {
            this.f849i = new C02301(this);
        }
        return this.f849i;
    }

    private void m1133d(int i) {
        Object[] objArr;
        if (i == 8) {
            synchronized (C0231b.class) {
                if (f841c != null) {
                    objArr = f841c;
                    this.f847g = objArr;
                    f841c = (Object[]) objArr[0];
                    this.f846f = (int[]) objArr[1];
                    objArr[1] = null;
                    objArr[0] = null;
                    f842d--;
                    return;
                }
            }
        } else if (i == 4) {
            synchronized (C0231b.class) {
                if (f839a != null) {
                    objArr = f839a;
                    this.f847g = objArr;
                    f839a = (Object[]) objArr[0];
                    this.f846f = (int[]) objArr[1];
                    objArr[1] = null;
                    objArr[0] = null;
                    f840b--;
                    return;
                }
            }
        }
        this.f846f = new int[i];
        this.f847g = new Object[i];
    }

    public int m1134a(Object obj) {
        if (obj == null) {
            return m1129a();
        }
        return m1130a(obj, this.f845e ? System.identityHashCode(obj) : obj.hashCode());
    }

    public void m1135a(int i) {
        if (this.f846f.length < i) {
            Object obj = this.f846f;
            Object obj2 = this.f847g;
            m1133d(i);
            if (this.f848h > 0) {
                System.arraycopy(obj, 0, this.f846f, 0, this.f848h);
                System.arraycopy(obj2, 0, this.f847g, 0, this.f848h);
            }
            C0231b.m1131a(obj, obj2, this.f848h);
        }
    }

    public boolean add(E e) {
        int a;
        int i;
        if (e == null) {
            a = m1129a();
            i = 0;
        } else {
            a = this.f845e ? System.identityHashCode(e) : e.hashCode();
            i = a;
            a = m1130a(e, a);
        }
        if (a >= 0) {
            return false;
        }
        int i2 = a ^ -1;
        if (this.f848h >= this.f846f.length) {
            a = this.f848h >= 8 ? this.f848h + (this.f848h >> 1) : this.f848h >= 4 ? 8 : 4;
            Object obj = this.f846f;
            Object obj2 = this.f847g;
            m1133d(a);
            if (this.f846f.length > 0) {
                System.arraycopy(obj, 0, this.f846f, 0, obj.length);
                System.arraycopy(obj2, 0, this.f847g, 0, obj2.length);
            }
            C0231b.m1131a(obj, obj2, this.f848h);
        }
        if (i2 < this.f848h) {
            System.arraycopy(this.f846f, i2, this.f846f, i2 + 1, this.f848h - i2);
            System.arraycopy(this.f847g, i2, this.f847g, i2 + 1, this.f848h - i2);
        }
        this.f846f[i2] = i;
        this.f847g[i2] = e;
        this.f848h++;
        return true;
    }

    public boolean addAll(Collection<? extends E> collection) {
        m1135a(this.f848h + collection.size());
        boolean z = false;
        for (Object add : collection) {
            z |= add(add);
        }
        return z;
    }

    public E m1136b(int i) {
        return this.f847g[i];
    }

    public E m1137c(int i) {
        int i2 = 8;
        E e = this.f847g[i];
        if (this.f848h <= 1) {
            C0231b.m1131a(this.f846f, this.f847g, this.f848h);
            this.f846f = f843j;
            this.f847g = f844k;
            this.f848h = 0;
        } else if (this.f846f.length <= 8 || this.f848h >= this.f846f.length / 3) {
            this.f848h--;
            if (i < this.f848h) {
                System.arraycopy(this.f846f, i + 1, this.f846f, i, this.f848h - i);
                System.arraycopy(this.f847g, i + 1, this.f847g, i, this.f848h - i);
            }
            this.f847g[this.f848h] = null;
        } else {
            if (this.f848h > 8) {
                i2 = this.f848h + (this.f848h >> 1);
            }
            Object obj = this.f846f;
            Object obj2 = this.f847g;
            m1133d(i2);
            this.f848h--;
            if (i > 0) {
                System.arraycopy(obj, 0, this.f846f, 0, i);
                System.arraycopy(obj2, 0, this.f847g, 0, i);
            }
            if (i < this.f848h) {
                System.arraycopy(obj, i + 1, this.f846f, i, this.f848h - i);
                System.arraycopy(obj2, i + 1, this.f847g, i, this.f848h - i);
            }
        }
        return e;
    }

    public void clear() {
        if (this.f848h != 0) {
            C0231b.m1131a(this.f846f, this.f847g, this.f848h);
            this.f846f = f843j;
            this.f847g = f844k;
            this.f848h = 0;
        }
    }

    public boolean contains(Object obj) {
        return m1134a(obj) >= 0;
    }

    public boolean containsAll(Collection<?> collection) {
        for (Object contains : collection) {
            if (!contains(contains)) {
                return false;
            }
        }
        return true;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Set)) {
            return false;
        }
        Set set = (Set) obj;
        if (size() != set.size()) {
            return false;
        }
        int i = 0;
        while (i < this.f848h) {
            try {
                if (!set.contains(m1136b(i))) {
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
    }

    public int hashCode() {
        int i = 0;
        int[] iArr = this.f846f;
        int i2 = 0;
        while (i < this.f848h) {
            i2 += iArr[i];
            i++;
        }
        return i2;
    }

    public boolean isEmpty() {
        return this.f848h <= 0;
    }

    public Iterator<E> iterator() {
        return m1132b().m1095e().iterator();
    }

    public boolean remove(Object obj) {
        int a = m1134a(obj);
        if (a < 0) {
            return false;
        }
        m1137c(a);
        return true;
    }

    public boolean removeAll(Collection<?> collection) {
        boolean z = false;
        for (Object remove : collection) {
            z |= remove(remove);
        }
        return z;
    }

    public boolean retainAll(Collection<?> collection) {
        boolean z = false;
        for (int i = this.f848h - 1; i >= 0; i--) {
            if (!collection.contains(this.f847g[i])) {
                m1137c(i);
                z = true;
            }
        }
        return z;
    }

    public int size() {
        return this.f848h;
    }

    public Object[] toArray() {
        Object obj = new Object[this.f848h];
        System.arraycopy(this.f847g, 0, obj, 0, this.f848h);
        return obj;
    }

    public <T> T[] toArray(T[] tArr) {
        Object obj = tArr.length < this.f848h ? (Object[]) Array.newInstance(tArr.getClass().getComponentType(), this.f848h) : tArr;
        System.arraycopy(this.f847g, 0, obj, 0, this.f848h);
        if (obj.length > this.f848h) {
            obj[this.f848h] = null;
        }
        return obj;
    }

    public String toString() {
        if (isEmpty()) {
            return "{}";
        }
        StringBuilder stringBuilder = new StringBuilder(this.f848h * 14);
        stringBuilder.append('{');
        for (int i = 0; i < this.f848h; i++) {
            if (i > 0) {
                stringBuilder.append(", ");
            }
            C0231b b = m1136b(i);
            if (b != this) {
                stringBuilder.append(b);
            } else {
                stringBuilder.append("(this Set)");
            }
        }
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
