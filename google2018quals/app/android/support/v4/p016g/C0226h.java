package android.support.v4.p016g;

import java.lang.reflect.Array;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NoSuchElementException;
import java.util.Set;

abstract class C0226h<K, V> {
    C0238b f826b;
    C0239c f827c;
    C0241e f828d;

    final class C0237a<T> implements Iterator<T> {
        final int f868a;
        int f869b;
        int f870c;
        boolean f871d = false;
        final /* synthetic */ C0226h f872e;

        C0237a(C0226h c0226h, int i) {
            this.f872e = c0226h;
            this.f868a = i;
            this.f869b = c0226h.mo95a();
        }

        public boolean hasNext() {
            return this.f870c < this.f869b;
        }

        public T next() {
            if (hasNext()) {
                T a = this.f872e.mo97a(this.f870c, this.f868a);
                this.f870c++;
                this.f871d = true;
                return a;
            }
            throw new NoSuchElementException();
        }

        public void remove() {
            if (this.f871d) {
                this.f870c--;
                this.f869b--;
                this.f871d = false;
                this.f872e.mo99a(this.f870c);
                return;
            }
            throw new IllegalStateException();
        }
    }

    final class C0238b implements Set<Entry<K, V>> {
        final /* synthetic */ C0226h f873a;

        C0238b(C0226h c0226h) {
            this.f873a = c0226h;
        }

        public boolean m1163a(Entry<K, V> entry) {
            throw new UnsupportedOperationException();
        }

        public /* synthetic */ boolean add(Object obj) {
            return m1163a((Entry) obj);
        }

        public boolean addAll(Collection<? extends Entry<K, V>> collection) {
            int a = this.f873a.mo95a();
            for (Entry entry : collection) {
                this.f873a.mo100a(entry.getKey(), entry.getValue());
            }
            return a != this.f873a.mo95a();
        }

        public void clear() {
            this.f873a.mo103c();
        }

        public boolean contains(Object obj) {
            if (!(obj instanceof Entry)) {
                return false;
            }
            Entry entry = (Entry) obj;
            int a = this.f873a.mo96a(entry.getKey());
            return a >= 0 ? C0232c.m1141a(this.f873a.mo97a(a, 1), entry.getValue()) : false;
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
            return C0226h.m1080a((Set) this, obj);
        }

        public int hashCode() {
            int a = this.f873a.mo95a() - 1;
            int i = 0;
            while (a >= 0) {
                Object a2 = this.f873a.mo97a(a, 0);
                Object a3 = this.f873a.mo97a(a, 1);
                a--;
                i += (a3 == null ? 0 : a3.hashCode()) ^ (a2 == null ? 0 : a2.hashCode());
            }
            return i;
        }

        public boolean isEmpty() {
            return this.f873a.mo95a() == 0;
        }

        public Iterator<Entry<K, V>> iterator() {
            return new C0240d(this.f873a);
        }

        public boolean remove(Object obj) {
            throw new UnsupportedOperationException();
        }

        public boolean removeAll(Collection<?> collection) {
            throw new UnsupportedOperationException();
        }

        public boolean retainAll(Collection<?> collection) {
            throw new UnsupportedOperationException();
        }

        public int size() {
            return this.f873a.mo95a();
        }

        public Object[] toArray() {
            throw new UnsupportedOperationException();
        }

        public <T> T[] toArray(T[] tArr) {
            throw new UnsupportedOperationException();
        }
    }

    final class C0239c implements Set<K> {
        final /* synthetic */ C0226h f874a;

        C0239c(C0226h c0226h) {
            this.f874a = c0226h;
        }

        public boolean add(K k) {
            throw new UnsupportedOperationException();
        }

        public boolean addAll(Collection<? extends K> collection) {
            throw new UnsupportedOperationException();
        }

        public void clear() {
            this.f874a.mo103c();
        }

        public boolean contains(Object obj) {
            return this.f874a.mo96a(obj) >= 0;
        }

        public boolean containsAll(Collection<?> collection) {
            return C0226h.m1079a(this.f874a.mo102b(), (Collection) collection);
        }

        public boolean equals(Object obj) {
            return C0226h.m1080a((Set) this, obj);
        }

        public int hashCode() {
            int i = 0;
            for (int a = this.f874a.mo95a() - 1; a >= 0; a--) {
                Object a2 = this.f874a.mo97a(a, 0);
                i += a2 == null ? 0 : a2.hashCode();
            }
            return i;
        }

        public boolean isEmpty() {
            return this.f874a.mo95a() == 0;
        }

        public Iterator<K> iterator() {
            return new C0237a(this.f874a, 0);
        }

        public boolean remove(Object obj) {
            int a = this.f874a.mo96a(obj);
            if (a < 0) {
                return false;
            }
            this.f874a.mo99a(a);
            return true;
        }

        public boolean removeAll(Collection<?> collection) {
            return C0226h.m1081b(this.f874a.mo102b(), collection);
        }

        public boolean retainAll(Collection<?> collection) {
            return C0226h.m1082c(this.f874a.mo102b(), collection);
        }

        public int size() {
            return this.f874a.mo95a();
        }

        public Object[] toArray() {
            return this.f874a.m1092b(0);
        }

        public <T> T[] toArray(T[] tArr) {
            return this.f874a.m1089a((Object[]) tArr, 0);
        }
    }

    final class C0240d implements Iterator<Entry<K, V>>, Entry<K, V> {
        int f875a;
        int f876b;
        boolean f877c = false;
        final /* synthetic */ C0226h f878d;

        C0240d(C0226h c0226h) {
            this.f878d = c0226h;
            this.f875a = c0226h.mo95a() - 1;
            this.f876b = -1;
        }

        public Entry<K, V> m1164a() {
            if (hasNext()) {
                this.f876b++;
                this.f877c = true;
                return this;
            }
            throw new NoSuchElementException();
        }

        public final boolean equals(Object obj) {
            boolean z = true;
            if (!this.f877c) {
                throw new IllegalStateException("This container does not support retaining Map.Entry objects");
            } else if (!(obj instanceof Entry)) {
                return false;
            } else {
                Entry entry = (Entry) obj;
                if (!(C0232c.m1141a(entry.getKey(), this.f878d.mo97a(this.f876b, 0)) && C0232c.m1141a(entry.getValue(), this.f878d.mo97a(this.f876b, 1)))) {
                    z = false;
                }
                return z;
            }
        }

        public K getKey() {
            if (this.f877c) {
                return this.f878d.mo97a(this.f876b, 0);
            }
            throw new IllegalStateException("This container does not support retaining Map.Entry objects");
        }

        public V getValue() {
            if (this.f877c) {
                return this.f878d.mo97a(this.f876b, 1);
            }
            throw new IllegalStateException("This container does not support retaining Map.Entry objects");
        }

        public boolean hasNext() {
            return this.f876b < this.f875a;
        }

        public final int hashCode() {
            int i = 0;
            if (this.f877c) {
                Object a = this.f878d.mo97a(this.f876b, 0);
                Object a2 = this.f878d.mo97a(this.f876b, 1);
                int hashCode = a == null ? 0 : a.hashCode();
                if (a2 != null) {
                    i = a2.hashCode();
                }
                return i ^ hashCode;
            }
            throw new IllegalStateException("This container does not support retaining Map.Entry objects");
        }

        public /* synthetic */ Object next() {
            return m1164a();
        }

        public void remove() {
            if (this.f877c) {
                this.f878d.mo99a(this.f876b);
                this.f876b--;
                this.f875a--;
                this.f877c = false;
                return;
            }
            throw new IllegalStateException();
        }

        public V setValue(V v) {
            if (this.f877c) {
                return this.f878d.mo98a(this.f876b, (Object) v);
            }
            throw new IllegalStateException("This container does not support retaining Map.Entry objects");
        }

        public final String toString() {
            return getKey() + "=" + getValue();
        }
    }

    final class C0241e implements Collection<V> {
        final /* synthetic */ C0226h f879a;

        C0241e(C0226h c0226h) {
            this.f879a = c0226h;
        }

        public boolean add(V v) {
            throw new UnsupportedOperationException();
        }

        public boolean addAll(Collection<? extends V> collection) {
            throw new UnsupportedOperationException();
        }

        public void clear() {
            this.f879a.mo103c();
        }

        public boolean contains(Object obj) {
            return this.f879a.mo101b(obj) >= 0;
        }

        public boolean containsAll(Collection<?> collection) {
            for (Object contains : collection) {
                if (!contains(contains)) {
                    return false;
                }
            }
            return true;
        }

        public boolean isEmpty() {
            return this.f879a.mo95a() == 0;
        }

        public Iterator<V> iterator() {
            return new C0237a(this.f879a, 1);
        }

        public boolean remove(Object obj) {
            int b = this.f879a.mo101b(obj);
            if (b < 0) {
                return false;
            }
            this.f879a.mo99a(b);
            return true;
        }

        public boolean removeAll(Collection<?> collection) {
            int i = 0;
            int a = this.f879a.mo95a();
            boolean z = false;
            while (i < a) {
                if (collection.contains(this.f879a.mo97a(i, 1))) {
                    this.f879a.mo99a(i);
                    i--;
                    a--;
                    z = true;
                }
                i++;
            }
            return z;
        }

        public boolean retainAll(Collection<?> collection) {
            int i = 0;
            int a = this.f879a.mo95a();
            boolean z = false;
            while (i < a) {
                if (!collection.contains(this.f879a.mo97a(i, 1))) {
                    this.f879a.mo99a(i);
                    i--;
                    a--;
                    z = true;
                }
                i++;
            }
            return z;
        }

        public int size() {
            return this.f879a.mo95a();
        }

        public Object[] toArray() {
            return this.f879a.m1092b(1);
        }

        public <T> T[] toArray(T[] tArr) {
            return this.f879a.m1089a((Object[]) tArr, 1);
        }
    }

    C0226h() {
    }

    public static <K, V> boolean m1079a(Map<K, V> map, Collection<?> collection) {
        for (Object containsKey : collection) {
            if (!map.containsKey(containsKey)) {
                return false;
            }
        }
        return true;
    }

    public static <T> boolean m1080a(Set<T> set, Object obj) {
        boolean z = true;
        if (set == obj) {
            return true;
        }
        if (!(obj instanceof Set)) {
            return false;
        }
        Set set2 = (Set) obj;
        try {
            if (!(set.size() == set2.size() && set.containsAll(set2))) {
                z = false;
            }
            return z;
        } catch (NullPointerException e) {
            return false;
        } catch (ClassCastException e2) {
            return false;
        }
    }

    public static <K, V> boolean m1081b(Map<K, V> map, Collection<?> collection) {
        int size = map.size();
        for (Object remove : collection) {
            map.remove(remove);
        }
        return size != map.size();
    }

    public static <K, V> boolean m1082c(Map<K, V> map, Collection<?> collection) {
        int size = map.size();
        Iterator it = map.keySet().iterator();
        while (it.hasNext()) {
            if (!collection.contains(it.next())) {
                it.remove();
            }
        }
        return size != map.size();
    }

    protected abstract int mo95a();

    protected abstract int mo96a(Object obj);

    protected abstract Object mo97a(int i, int i2);

    protected abstract V mo98a(int i, V v);

    protected abstract void mo99a(int i);

    protected abstract void mo100a(K k, V v);

    public <T> T[] m1089a(T[] tArr, int i) {
        int a = mo95a();
        T[] tArr2 = tArr.length < a ? (Object[]) Array.newInstance(tArr.getClass().getComponentType(), a) : tArr;
        for (int i2 = 0; i2 < a; i2++) {
            tArr2[i2] = mo97a(i2, i);
        }
        if (tArr2.length > a) {
            tArr2[a] = null;
        }
        return tArr2;
    }

    protected abstract int mo101b(Object obj);

    protected abstract Map<K, V> mo102b();

    public Object[] m1092b(int i) {
        int a = mo95a();
        Object[] objArr = new Object[a];
        for (int i2 = 0; i2 < a; i2++) {
            objArr[i2] = mo97a(i2, i);
        }
        return objArr;
    }

    protected abstract void mo103c();

    public Set<Entry<K, V>> m1094d() {
        if (this.f826b == null) {
            this.f826b = new C0238b(this);
        }
        return this.f826b;
    }

    public Set<K> m1095e() {
        if (this.f827c == null) {
            this.f827c = new C0239c(this);
        }
        return this.f827c;
    }

    public Collection<V> m1096f() {
        if (this.f828d == null) {
            this.f828d = new C0241e(this);
        }
        return this.f828d;
    }
}
