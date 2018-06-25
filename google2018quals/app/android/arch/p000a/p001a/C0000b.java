package android.arch.p000a.p001a;

import java.util.Iterator;
import java.util.Map.Entry;
import java.util.WeakHashMap;

public class C0000b<K, V> implements Iterable<Entry<K, V>> {
    private C0006c<K, V> f0a;
    private C0006c<K, V> f1b;
    private WeakHashMap<Object<K, V>, Boolean> f2c = new WeakHashMap();
    private int f3d = 0;

    private static abstract class C0003e<K, V> implements Iterator<Entry<K, V>> {
        C0006c<K, V> f5a;
        C0006c<K, V> f6b;

        C0003e(C0006c<K, V> c0006c, C0006c<K, V> c0006c2) {
            this.f5a = c0006c2;
            this.f6b = c0006c;
        }

        private C0006c<K, V> m7b() {
            return (this.f6b == this.f5a || this.f5a == null) ? null : mo1a(this.f6b);
        }

        abstract C0006c<K, V> mo1a(C0006c<K, V> c0006c);

        public Entry<K, V> m9a() {
            Entry entry = this.f6b;
            this.f6b = m7b();
            return entry;
        }

        public boolean hasNext() {
            return this.f6b != null;
        }

        public /* synthetic */ Object next() {
            return m9a();
        }
    }

    static class C0004a<K, V> extends C0003e<K, V> {
        C0004a(C0006c<K, V> c0006c, C0006c<K, V> c0006c2) {
            super(c0006c, c0006c2);
        }

        C0006c<K, V> mo1a(C0006c<K, V> c0006c) {
            return c0006c.f9c;
        }
    }

    private static class C0005b<K, V> extends C0003e<K, V> {
        C0005b(C0006c<K, V> c0006c, C0006c<K, V> c0006c2) {
            super(c0006c, c0006c2);
        }

        C0006c<K, V> mo1a(C0006c<K, V> c0006c) {
            return c0006c.f10d;
        }
    }

    static class C0006c<K, V> implements Entry<K, V> {
        final K f7a;
        final V f8b;
        C0006c<K, V> f9c;
        C0006c<K, V> f10d;

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof C0006c)) {
                return false;
            }
            C0006c c0006c = (C0006c) obj;
            return this.f7a.equals(c0006c.f7a) && this.f8b.equals(c0006c.f8b);
        }

        public K getKey() {
            return this.f7a;
        }

        public V getValue() {
            return this.f8b;
        }

        public V setValue(V v) {
            throw new UnsupportedOperationException("An entry modification is not supported");
        }

        public String toString() {
            return this.f7a + "=" + this.f8b;
        }
    }

    private class C0007d implements Iterator<Entry<K, V>> {
        final /* synthetic */ C0000b f11a;
        private C0006c<K, V> f12b;
        private boolean f13c;

        private C0007d(C0000b c0000b) {
            this.f11a = c0000b;
            this.f13c = true;
        }

        public Entry<K, V> m12a() {
            if (this.f13c) {
                this.f13c = false;
                this.f12b = this.f11a.f0a;
            } else {
                this.f12b = this.f12b != null ? this.f12b.f9c : null;
            }
            return this.f12b;
        }

        public boolean hasNext() {
            return this.f13c ? this.f11a.f0a != null : (this.f12b == null || this.f12b.f9c == null) ? false : true;
        }

        public /* synthetic */ Object next() {
            return m12a();
        }
    }

    public int m1a() {
        return this.f3d;
    }

    public Iterator<Entry<K, V>> m2b() {
        Iterator c0005b = new C0005b(this.f1b, this.f0a);
        this.f2c.put(c0005b, Boolean.valueOf(false));
        return c0005b;
    }

    public C0007d m3c() {
        C0007d c0007d = new C0007d();
        this.f2c.put(c0007d, Boolean.valueOf(false));
        return c0007d;
    }

    public Entry<K, V> m4d() {
        return this.f0a;
    }

    public Entry<K, V> m5e() {
        return this.f1b;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof C0000b)) {
            return false;
        }
        C0000b c0000b = (C0000b) obj;
        if (m1a() != c0000b.m1a()) {
            return false;
        }
        Iterator it = iterator();
        Iterator it2 = c0000b.iterator();
        while (it.hasNext() && it2.hasNext()) {
            Entry entry = (Entry) it.next();
            Object next = it2.next();
            if (entry == null && next != null) {
                return false;
            }
            if (entry != null && !entry.equals(next)) {
                return false;
            }
        }
        boolean z = (it.hasNext() || it2.hasNext()) ? false : true;
        return z;
    }

    public Iterator<Entry<K, V>> iterator() {
        Iterator c0004a = new C0004a(this.f0a, this.f1b);
        this.f2c.put(c0004a, Boolean.valueOf(false));
        return c0004a;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("[");
        Iterator it = iterator();
        while (it.hasNext()) {
            stringBuilder.append(((Entry) it.next()).toString());
            if (it.hasNext()) {
                stringBuilder.append(", ");
            }
        }
        stringBuilder.append("]");
        return stringBuilder.toString();
    }
}
