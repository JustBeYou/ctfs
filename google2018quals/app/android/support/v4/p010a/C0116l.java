package android.support.v4.p010a;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.support.v4.p016g.C0228k;
import android.view.LayoutInflater;
import android.view.View;
import java.io.FileDescriptor;
import java.io.PrintWriter;

public abstract class C0116l<E> extends C0109j {
    private final Activity f542a;
    final Context f543b;
    final int f544c;
    final C0135n f545d;
    private final Handler f546e;
    private C0228k<String, C0156u> f547f;
    private boolean f548g;
    private C0160v f549h;
    private boolean f550i;
    private boolean f551j;

    C0116l(Activity activity, Context context, Handler handler, int i) {
        this.f545d = new C0135n();
        this.f542a = activity;
        this.f543b = context;
        this.f546e = handler;
        this.f544c = i;
    }

    C0116l(C0119i c0119i) {
        this(c0119i, c0119i, c0119i.f556c, 0);
    }

    C0160v m540a(String str, boolean z, boolean z2) {
        if (this.f547f == null) {
            this.f547f = new C0228k();
        }
        C0160v c0160v = (C0160v) this.f547f.get(str);
        if (c0160v == null && z2) {
            c0160v = new C0160v(str, this, z);
            this.f547f.put(str, c0160v);
            return c0160v;
        } else if (!z || c0160v == null || c0160v.f711e) {
            return c0160v;
        } else {
            c0160v.m834b();
            return c0160v;
        }
    }

    public View mo42a(int i) {
        return null;
    }

    void m542a(C0228k<String, C0156u> c0228k) {
        if (c0228k != null) {
            int size = c0228k.size();
            for (int i = 0; i < size; i++) {
                ((C0160v) c0228k.m1116c(i)).m831a(this);
            }
        }
        this.f547f = c0228k;
    }

    void m543a(String str) {
        if (this.f547f != null) {
            C0160v c0160v = (C0160v) this.f547f.get(str);
            if (c0160v != null && !c0160v.f712f) {
                c0160v.m840h();
                this.f547f.remove(str);
            }
        }
    }

    public void mo44a(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
    }

    void m545a(boolean z) {
        this.f548g = z;
        if (this.f549h != null && this.f551j) {
            this.f551j = false;
            if (z) {
                this.f549h.m836d();
            } else {
                this.f549h.m835c();
            }
        }
    }

    public boolean mo43a() {
        return true;
    }

    public boolean mo45a(C0114h c0114h) {
        return true;
    }

    public LayoutInflater mo46b() {
        return (LayoutInflater) this.f543b.getSystemService("layout_inflater");
    }

    void mo47b(C0114h c0114h) {
    }

    void m550b(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        printWriter.print(str);
        printWriter.print("mLoadersStarted=");
        printWriter.println(this.f551j);
        if (this.f549h != null) {
            printWriter.print(str);
            printWriter.print("Loader Manager ");
            printWriter.print(Integer.toHexString(System.identityHashCode(this.f549h)));
            printWriter.println(":");
            this.f549h.m832a(str + "  ", fileDescriptor, printWriter, strArr);
        }
    }

    public void mo48c() {
    }

    public boolean mo49d() {
        return true;
    }

    public int mo50e() {
        return this.f544c;
    }

    Activity m554f() {
        return this.f542a;
    }

    Context m555g() {
        return this.f543b;
    }

    Handler m556h() {
        return this.f546e;
    }

    C0135n m557i() {
        return this.f545d;
    }

    boolean m558j() {
        return this.f548g;
    }

    void m559k() {
        if (!this.f551j) {
            this.f551j = true;
            if (this.f549h != null) {
                this.f549h.m834b();
            } else if (!this.f550i) {
                this.f549h = m540a("(root)", this.f551j, false);
                if (!(this.f549h == null || this.f549h.f711e)) {
                    this.f549h.m834b();
                }
            }
            this.f550i = true;
        }
    }

    void m560l() {
        if (this.f549h != null) {
            this.f549h.m840h();
        }
    }

    void m561m() {
        if (this.f547f != null) {
            int size = this.f547f.size();
            C0160v[] c0160vArr = new C0160v[size];
            for (int i = size - 1; i >= 0; i--) {
                c0160vArr[i] = (C0160v) this.f547f.m1116c(i);
            }
            for (int i2 = 0; i2 < size; i2++) {
                C0160v c0160v = c0160vArr[i2];
                c0160v.m837e();
                c0160v.m839g();
            }
        }
    }

    C0228k<String, C0156u> m562n() {
        int i;
        int i2 = 0;
        if (this.f547f != null) {
            int size = this.f547f.size();
            C0160v[] c0160vArr = new C0160v[size];
            for (int i3 = size - 1; i3 >= 0; i3--) {
                c0160vArr[i3] = (C0160v) this.f547f.m1116c(i3);
            }
            boolean j = m558j();
            i = 0;
            while (i2 < size) {
                C0160v c0160v = c0160vArr[i2];
                if (!c0160v.f712f && j) {
                    if (!c0160v.f711e) {
                        c0160v.m834b();
                    }
                    c0160v.m836d();
                }
                if (c0160v.f712f) {
                    i = 1;
                } else {
                    c0160v.m840h();
                    this.f547f.remove(c0160v.f710d);
                }
                i2++;
            }
        } else {
            i = 0;
        }
        return i != 0 ? this.f547f : null;
    }
}
