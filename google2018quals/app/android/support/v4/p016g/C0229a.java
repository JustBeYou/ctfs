package android.support.v4.p016g;

import java.util.Collection;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class C0229a<K, V> extends C0228k<K, V> implements Map<K, V> {
    C0226h<K, V> f837a;

    class C02271 extends C0226h<K, V> {
        final /* synthetic */ C0229a f829a;

        C02271(C0229a c0229a) {
            this.f829a = c0229a;
        }

        protected int mo95a() {
            return this.f829a.h;
        }

        protected int mo96a(Object obj) {
            return this.f829a.m1110a(obj);
        }

        protected Object mo97a(int i, int i2) {
            return this.f829a.g[(i << 1) + i2];
        }

        protected V mo98a(int i, V v) {
            return this.f829a.m1112a(i, (Object) v);
        }

        protected void mo99a(int i) {
            this.f829a.m1117d(i);
        }

        protected void mo100a(K k, V v) {
            this.f829a.put(k, v);
        }

        protected int mo101b(Object obj) {
            return this.f829a.m1114b(obj);
        }

        protected Map<K, V> mo102b() {
            return this.f829a;
        }

        protected void mo103c() {
            this.f829a.clear();
        }
    }

    public C0229a(int i) {
        super(i);
    }

    private C0226h<K, V> m1118b() {
        if (this.f837a == null) {
            this.f837a = new C02271(this);
        }
        return this.f837a;
    }

    public boolean m1119a(Collection<?> collection) {
        return C0226h.m1082c(this, collection);
    }

    public Set<Entry<K, V>> entrySet() {
        return m1118b().m1094d();
    }

    public Set<K> keySet() {
        return m1118b().m1095e();
    }

    public void putAll(Map<? extends K, ? extends V> map) {
        m1113a(this.h + map.size());
        for (Entry entry : map.entrySet()) {
            put(entry.getKey(), entry.getValue());
        }
    }

    public Collection<V> values() {
        return m1118b().m1096f();
    }
}
