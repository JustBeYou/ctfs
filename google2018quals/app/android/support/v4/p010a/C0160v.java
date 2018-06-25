package android.support.v4.p010a;

import android.os.Bundle;
import android.support.v4.p009b.C0172b;
import android.support.v4.p009b.C0172b.C0157a;
import android.support.v4.p009b.C0172b.C0158b;
import android.support.v4.p010a.C0156u.C0155a;
import android.support.v4.p016g.C0233d;
import android.support.v4.p016g.C0244l;
import android.util.Log;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.lang.reflect.Modifier;

class C0160v extends C0156u {
    static boolean f707a = false;
    final C0244l<C0159a> f708b = new C0244l();
    final C0244l<C0159a> f709c = new C0244l();
    final String f710d;
    boolean f711e;
    boolean f712f;
    C0116l f713g;

    final class C0159a implements C0157a<Object>, C0158b<Object> {
        final int f692a;
        final Bundle f693b;
        C0155a<Object> f694c;
        C0172b<Object> f695d;
        boolean f696e;
        boolean f697f;
        Object f698g;
        boolean f699h;
        boolean f700i;
        boolean f701j;
        boolean f702k;
        boolean f703l;
        boolean f704m;
        C0159a f705n;
        final /* synthetic */ C0160v f706o;

        void m823a() {
            if (this.f700i && this.f701j) {
                this.f699h = true;
            } else if (!this.f699h) {
                this.f699h = true;
                if (C0160v.f707a) {
                    Log.v("LoaderManager", "  Starting: " + this);
                }
                if (this.f695d == null && this.f694c != null) {
                    this.f695d = this.f694c.m819a(this.f692a, this.f693b);
                }
                if (this.f695d == null) {
                    return;
                }
                if (!this.f695d.getClass().isMemberClass() || Modifier.isStatic(this.f695d.getClass().getModifiers())) {
                    if (!this.f704m) {
                        this.f695d.m882a(this.f692a, this);
                        this.f695d.m883a((C0157a) this);
                        this.f704m = true;
                    }
                    this.f695d.m881a();
                    return;
                }
                throw new IllegalArgumentException("Object returned from onCreateLoader must not be a non-static inner member class: " + this.f695d);
            }
        }

        void m824a(C0172b<Object> c0172b, Object obj) {
            String str;
            if (this.f694c != null) {
                if (this.f706o.f713g != null) {
                    String str2 = this.f706o.f713g.f545d.f616u;
                    this.f706o.f713g.f545d.f616u = "onLoadFinished";
                    str = str2;
                } else {
                    str = null;
                }
                try {
                    if (C0160v.f707a) {
                        Log.v("LoaderManager", "  onLoadFinished in " + c0172b + ": " + c0172b.m880a(obj));
                    }
                    this.f694c.m821a((C0172b) c0172b, obj);
                    this.f697f = true;
                } finally {
                    if (this.f706o.f713g != null) {
                        this.f706o.f713g.f545d.f616u = str;
                    }
                }
            }
        }

        public void m825a(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
            printWriter.print(str);
            printWriter.print("mId=");
            printWriter.print(this.f692a);
            printWriter.print(" mArgs=");
            printWriter.println(this.f693b);
            printWriter.print(str);
            printWriter.print("mCallbacks=");
            printWriter.println(this.f694c);
            printWriter.print(str);
            printWriter.print("mLoader=");
            printWriter.println(this.f695d);
            if (this.f695d != null) {
                this.f695d.m885a(str + "  ", fileDescriptor, printWriter, strArr);
            }
            if (this.f696e || this.f697f) {
                printWriter.print(str);
                printWriter.print("mHaveData=");
                printWriter.print(this.f696e);
                printWriter.print("  mDeliveredData=");
                printWriter.println(this.f697f);
                printWriter.print(str);
                printWriter.print("mData=");
                printWriter.println(this.f698g);
            }
            printWriter.print(str);
            printWriter.print("mStarted=");
            printWriter.print(this.f699h);
            printWriter.print(" mReportNextStart=");
            printWriter.print(this.f702k);
            printWriter.print(" mDestroyed=");
            printWriter.println(this.f703l);
            printWriter.print(str);
            printWriter.print("mRetaining=");
            printWriter.print(this.f700i);
            printWriter.print(" mRetainingStarted=");
            printWriter.print(this.f701j);
            printWriter.print(" mListenerRegistered=");
            printWriter.println(this.f704m);
            if (this.f705n != null) {
                printWriter.print(str);
                printWriter.println("Pending Loader ");
                printWriter.print(this.f705n);
                printWriter.println(":");
                this.f705n.m825a(str + "  ", fileDescriptor, printWriter, strArr);
            }
        }

        void m826b() {
            if (C0160v.f707a) {
                Log.v("LoaderManager", "  Retaining: " + this);
            }
            this.f700i = true;
            this.f701j = this.f699h;
            this.f699h = false;
            this.f694c = null;
        }

        void m827c() {
            if (this.f700i) {
                if (C0160v.f707a) {
                    Log.v("LoaderManager", "  Finished Retaining: " + this);
                }
                this.f700i = false;
                if (!(this.f699h == this.f701j || this.f699h)) {
                    m829e();
                }
            }
            if (this.f699h && this.f696e && !this.f702k) {
                m824a(this.f695d, this.f698g);
            }
        }

        void m828d() {
            if (this.f699h && this.f702k) {
                this.f702k = false;
                if (this.f696e && !this.f700i) {
                    m824a(this.f695d, this.f698g);
                }
            }
        }

        void m829e() {
            if (C0160v.f707a) {
                Log.v("LoaderManager", "  Stopping: " + this);
            }
            this.f699h = false;
            if (!this.f700i && this.f695d != null && this.f704m) {
                this.f704m = false;
                this.f695d.m884a((C0158b) this);
                this.f695d.m887b(this);
                this.f695d.m888c();
            }
        }

        void m830f() {
            String str;
            C0155a c0155a = null;
            if (C0160v.f707a) {
                Log.v("LoaderManager", "  Destroying: " + this);
            }
            this.f703l = true;
            boolean z = this.f697f;
            this.f697f = false;
            if (this.f694c != null && this.f695d != null && this.f696e && z) {
                if (C0160v.f707a) {
                    Log.v("LoaderManager", "  Resetting: " + this);
                }
                if (this.f706o.f713g != null) {
                    String str2 = this.f706o.f713g.f545d.f616u;
                    this.f706o.f713g.f545d.f616u = "onLoaderReset";
                    str = str2;
                } else {
                    str = null;
                }
                try {
                    this.f694c.m820a(this.f695d);
                } finally {
                    c0155a = this.f706o.f713g;
                    if (c0155a != null) {
                        c0155a = this.f706o.f713g.f545d;
                        c0155a.f616u = str;
                    }
                }
            }
            this.f694c = c0155a;
            this.f698g = c0155a;
            this.f696e = false;
            if (this.f695d != null) {
                if (this.f704m) {
                    this.f704m = false;
                    this.f695d.m884a((C0158b) this);
                    this.f695d.m887b(this);
                }
                this.f695d.m890e();
            }
            if (this.f705n != null) {
                this.f705n.m830f();
            }
        }

        public String toString() {
            StringBuilder stringBuilder = new StringBuilder(64);
            stringBuilder.append("LoaderInfo{");
            stringBuilder.append(Integer.toHexString(System.identityHashCode(this)));
            stringBuilder.append(" #");
            stringBuilder.append(this.f692a);
            stringBuilder.append(" : ");
            C0233d.m1144a(this.f695d, stringBuilder);
            stringBuilder.append("}}");
            return stringBuilder.toString();
        }
    }

    C0160v(String str, C0116l c0116l, boolean z) {
        this.f710d = str;
        this.f713g = c0116l;
        this.f711e = z;
    }

    void m831a(C0116l c0116l) {
        this.f713g = c0116l;
    }

    public void m832a(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        int i = 0;
        if (this.f708b.m1171b() > 0) {
            printWriter.print(str);
            printWriter.println("Active Loaders:");
            String str2 = str + "    ";
            for (int i2 = 0; i2 < this.f708b.m1171b(); i2++) {
                C0159a c0159a = (C0159a) this.f708b.m1178e(i2);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(this.f708b.m1177d(i2));
                printWriter.print(": ");
                printWriter.println(c0159a.toString());
                c0159a.m825a(str2, fileDescriptor, printWriter, strArr);
            }
        }
        if (this.f709c.m1171b() > 0) {
            printWriter.print(str);
            printWriter.println("Inactive Loaders:");
            String str3 = str + "    ";
            while (i < this.f709c.m1171b()) {
                c0159a = (C0159a) this.f709c.m1178e(i);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(this.f709c.m1177d(i));
                printWriter.print(": ");
                printWriter.println(c0159a.toString());
                c0159a.m825a(str3, fileDescriptor, printWriter, strArr);
                i++;
            }
        }
    }

    public boolean mo66a() {
        int b = this.f708b.m1171b();
        boolean z = false;
        for (int i = 0; i < b; i++) {
            C0159a c0159a = (C0159a) this.f708b.m1178e(i);
            int i2 = (!c0159a.f699h || c0159a.f697f) ? 0 : 1;
            z |= i2;
        }
        return z;
    }

    void m834b() {
        if (f707a) {
            Log.v("LoaderManager", "Starting in " + this);
        }
        if (this.f711e) {
            Throwable runtimeException = new RuntimeException("here");
            runtimeException.fillInStackTrace();
            Log.w("LoaderManager", "Called doStart when already started: " + this, runtimeException);
            return;
        }
        this.f711e = true;
        for (int b = this.f708b.m1171b() - 1; b >= 0; b--) {
            ((C0159a) this.f708b.m1178e(b)).m823a();
        }
    }

    void m835c() {
        if (f707a) {
            Log.v("LoaderManager", "Stopping in " + this);
        }
        if (this.f711e) {
            for (int b = this.f708b.m1171b() - 1; b >= 0; b--) {
                ((C0159a) this.f708b.m1178e(b)).m829e();
            }
            this.f711e = false;
            return;
        }
        Throwable runtimeException = new RuntimeException("here");
        runtimeException.fillInStackTrace();
        Log.w("LoaderManager", "Called doStop when not started: " + this, runtimeException);
    }

    void m836d() {
        if (f707a) {
            Log.v("LoaderManager", "Retaining in " + this);
        }
        if (this.f711e) {
            this.f712f = true;
            this.f711e = false;
            for (int b = this.f708b.m1171b() - 1; b >= 0; b--) {
                ((C0159a) this.f708b.m1178e(b)).m826b();
            }
            return;
        }
        Throwable runtimeException = new RuntimeException("here");
        runtimeException.fillInStackTrace();
        Log.w("LoaderManager", "Called doRetain when not started: " + this, runtimeException);
    }

    void m837e() {
        if (this.f712f) {
            if (f707a) {
                Log.v("LoaderManager", "Finished Retaining in " + this);
            }
            this.f712f = false;
            for (int b = this.f708b.m1171b() - 1; b >= 0; b--) {
                ((C0159a) this.f708b.m1178e(b)).m827c();
            }
        }
    }

    void m838f() {
        for (int b = this.f708b.m1171b() - 1; b >= 0; b--) {
            ((C0159a) this.f708b.m1178e(b)).f702k = true;
        }
    }

    void m839g() {
        for (int b = this.f708b.m1171b() - 1; b >= 0; b--) {
            ((C0159a) this.f708b.m1178e(b)).m828d();
        }
    }

    void m840h() {
        int b;
        if (!this.f712f) {
            if (f707a) {
                Log.v("LoaderManager", "Destroying Active in " + this);
            }
            for (b = this.f708b.m1171b() - 1; b >= 0; b--) {
                ((C0159a) this.f708b.m1178e(b)).m830f();
            }
            this.f708b.m1174c();
        }
        if (f707a) {
            Log.v("LoaderManager", "Destroying Inactive in " + this);
        }
        for (b = this.f709c.m1171b() - 1; b >= 0; b--) {
            ((C0159a) this.f709c.m1178e(b)).m830f();
        }
        this.f709c.m1174c();
        this.f713g = null;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder(128);
        stringBuilder.append("LoaderManager{");
        stringBuilder.append(Integer.toHexString(System.identityHashCode(this)));
        stringBuilder.append(" in ");
        C0233d.m1144a(this.f713g, stringBuilder);
        stringBuilder.append("}}");
        return stringBuilder.toString();
    }
}
