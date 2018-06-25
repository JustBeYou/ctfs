package android.arch.lifecycle;

import android.arch.lifecycle.C0013b.C0011a;
import android.arch.lifecycle.C0013b.C0012b;
import android.arch.p000a.p001a.C0001a;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map.Entry;

public class C0017d extends C0013b {
    private C0001a<Object, C0016a> f31a = new C0001a();
    private C0012b f32b;
    private final C0014c f33c;
    private int f34d = 0;
    private boolean f35e = false;
    private boolean f36f = false;
    private ArrayList<C0012b> f37g = new ArrayList();

    static class C0016a {
        C0012b f29a;
        C0010a f30b;

        void m22a(C0014c c0014c, C0011a c0011a) {
            C0012b b = C0017d.m25b(c0011a);
            this.f29a = C0017d.m23a(this.f29a, b);
            this.f30b.mo2a(c0014c, c0011a);
            this.f29a = b;
        }
    }

    public C0017d(C0014c c0014c) {
        this.f33c = c0014c;
        this.f32b = C0012b.INITIALIZED;
    }

    static C0012b m23a(C0012b c0012b, C0012b c0012b2) {
        return (c0012b2 == null || c0012b2.compareTo(c0012b) >= 0) ? c0012b : c0012b2;
    }

    private boolean m24a() {
        if (this.f31a.m1a() == 0) {
            return true;
        }
        C0012b c0012b = ((C0016a) this.f31a.m4d().getValue()).f29a;
        C0012b c0012b2 = ((C0016a) this.f31a.m5e().getValue()).f29a;
        boolean z = c0012b == c0012b2 && this.f32b == c0012b2;
        return z;
    }

    static C0012b m25b(C0011a c0011a) {
        switch (c0011a) {
            case ON_CREATE:
            case ON_STOP:
                return C0012b.CREATED;
            case ON_START:
            case ON_PAUSE:
                return C0012b.STARTED;
            case ON_RESUME:
                return C0012b.RESUMED;
            case ON_DESTROY:
                return C0012b.DESTROYED;
            default:
                throw new IllegalArgumentException("Unexpected event value " + c0011a);
        }
    }

    private void m26b() {
        this.f37g.remove(this.f37g.size() - 1);
    }

    private void m27b(C0012b c0012b) {
        this.f37g.add(c0012b);
    }

    private static C0011a m28c(C0012b c0012b) {
        switch (c0012b) {
            case INITIALIZED:
                throw new IllegalArgumentException();
            case CREATED:
                return C0011a.ON_DESTROY;
            case STARTED:
                return C0011a.ON_STOP;
            case RESUMED:
                return C0011a.ON_PAUSE;
            case DESTROYED:
                throw new IllegalArgumentException();
            default:
                throw new IllegalArgumentException("Unexpected state value " + c0012b);
        }
    }

    private void m29c() {
        Iterator c = this.f31a.m3c();
        while (c.hasNext() && !this.f36f) {
            Entry entry = (Entry) c.next();
            C0016a c0016a = (C0016a) entry.getValue();
            while (c0016a.f29a.compareTo(this.f32b) < 0 && !this.f36f && this.f31a.m6a(entry.getKey())) {
                m27b(c0016a.f29a);
                c0016a.m22a(this.f33c, C0017d.m30d(c0016a.f29a));
                m26b();
            }
        }
    }

    private static C0011a m30d(C0012b c0012b) {
        switch (c0012b) {
            case INITIALIZED:
            case DESTROYED:
                return C0011a.ON_CREATE;
            case CREATED:
                return C0011a.ON_START;
            case STARTED:
                return C0011a.ON_RESUME;
            case RESUMED:
                throw new IllegalArgumentException();
            default:
                throw new IllegalArgumentException("Unexpected state value " + c0012b);
        }
    }

    private void m31d() {
        Iterator b = this.f31a.m2b();
        while (b.hasNext() && !this.f36f) {
            Entry entry = (Entry) b.next();
            C0016a c0016a = (C0016a) entry.getValue();
            while (c0016a.f29a.compareTo(this.f32b) > 0 && !this.f36f && this.f31a.m6a(entry.getKey())) {
                C0011a c = C0017d.m28c(c0016a.f29a);
                m27b(C0017d.m25b(c));
                c0016a.m22a(this.f33c, c);
                m26b();
            }
        }
    }

    private void m32e() {
        while (!m24a()) {
            this.f36f = false;
            if (this.f32b.compareTo(((C0016a) this.f31a.m4d().getValue()).f29a) < 0) {
                m31d();
            }
            Entry e = this.f31a.m5e();
            if (!(this.f36f || e == null || this.f32b.compareTo(((C0016a) e.getValue()).f29a) <= 0)) {
                m29c();
            }
        }
        this.f36f = false;
    }

    public void m33a(C0011a c0011a) {
        this.f32b = C0017d.m25b(c0011a);
        if (this.f35e || this.f34d != 0) {
            this.f36f = true;
            return;
        }
        this.f35e = true;
        m32e();
        this.f35e = false;
    }

    public void m34a(C0012b c0012b) {
        this.f32b = c0012b;
    }
}
