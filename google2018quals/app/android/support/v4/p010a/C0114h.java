package android.support.v4.p010a;

import android.animation.Animator;
import android.app.Activity;
import android.arch.lifecycle.C0013b;
import android.arch.lifecycle.C0013b.C0011a;
import android.arch.lifecycle.C0014c;
import android.arch.lifecycle.C0017d;
import android.content.ComponentCallbacks;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Looper;
import android.os.Parcelable;
import android.support.v4.p016g.C0228k;
import android.support.v4.p016g.C0233d;
import android.support.v4.p017h.C0290e;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.ContextMenu;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnCreateContextMenuListener;
import android.view.ViewGroup;
import android.view.animation.Animation;
import java.io.FileDescriptor;
import java.io.PrintWriter;

public class C0114h implements C0014c, ComponentCallbacks, OnCreateContextMenuListener {
    private static final C0228k<String, Class<?>> f493V = new C0228k();
    static final Object f494a = new Object();
    boolean f495A;
    boolean f496B;
    boolean f497C;
    boolean f498D;
    boolean f499E = true;
    boolean f500F;
    ViewGroup f501G;
    View f502H;
    View f503I;
    boolean f504J;
    boolean f505K = true;
    C0160v f506L;
    boolean f507M;
    boolean f508N;
    C0111a f509O;
    boolean f510P;
    boolean f511Q;
    float f512R;
    LayoutInflater f513S;
    boolean f514T;
    C0017d f515U = new C0017d(this);
    int f516b = 0;
    Bundle f517c;
    SparseArray<Parcelable> f518d;
    int f519e = -1;
    String f520f;
    Bundle f521g;
    C0114h f522h;
    int f523i = -1;
    int f524j;
    boolean f525k;
    boolean f526l;
    boolean f527m;
    boolean f528n;
    boolean f529o;
    boolean f530p;
    int f531q;
    C0135n f532r;
    C0116l f533s;
    C0135n f534t;
    C0136o f535u;
    C0114h f536v;
    int f537w;
    int f538x;
    String f539y;
    boolean f540z;

    class C01081 implements Runnable {
        final /* synthetic */ C0114h f472a;

        C01081(C0114h c0114h) {
            this.f472a = c0114h;
        }

        public void run() {
            this.f472a.m436W();
        }
    }

    class C01102 extends C0109j {
        final /* synthetic */ C0114h f473a;

        C01102(C0114h c0114h) {
            this.f473a = c0114h;
        }

        public C0114h mo41a(Context context, String str, Bundle bundle) {
            return this.f473a.f533s.mo41a(context, str, bundle);
        }

        public View mo42a(int i) {
            if (this.f473a.f502H != null) {
                return this.f473a.f502H.findViewById(i);
            }
            throw new IllegalStateException("Fragment does not have a view");
        }

        public boolean mo43a() {
            return this.f473a.f502H != null;
        }
    }

    static class C0111a {
        View f474a;
        Animator f475b;
        int f476c;
        int f477d;
        int f478e;
        int f479f;
        C0163y f480g = null;
        C0163y f481h = null;
        boolean f482i;
        C0113c f483j;
        boolean f484k;
        private Object f485l = null;
        private Object f486m = C0114h.f494a;
        private Object f487n = null;
        private Object f488o = C0114h.f494a;
        private Object f489p = null;
        private Object f490q = C0114h.f494a;
        private Boolean f491r;
        private Boolean f492s;

        C0111a() {
        }
    }

    public static class C0112b extends RuntimeException {
        public C0112b(String str, Exception exception) {
            super(str, exception);
        }
    }

    interface C0113c {
        void mo60a();

        void mo61b();
    }

    private void m436W() {
        C0113c c0113c = null;
        if (this.f509O != null) {
            this.f509O.f482i = false;
            C0113c c0113c2 = this.f509O.f483j;
            this.f509O.f483j = null;
            c0113c = c0113c2;
        }
        if (c0113c != null) {
            c0113c.mo60a();
        }
    }

    private C0111a m437X() {
        if (this.f509O == null) {
            this.f509O = new C0111a();
        }
        return this.f509O;
    }

    public static C0114h m438a(Context context, String str, Bundle bundle) {
        try {
            Class cls = (Class) f493V.get(str);
            if (cls == null) {
                cls = context.getClassLoader().loadClass(str);
                f493V.put(str, cls);
            }
            C0114h c0114h = (C0114h) cls.getConstructor(new Class[0]).newInstance(new Object[0]);
            if (bundle != null) {
                bundle.setClassLoader(c0114h.getClass().getClassLoader());
                c0114h.m491b(bundle);
            }
            return c0114h;
        } catch (Exception e) {
            throw new C0112b("Unable to instantiate fragment " + str + ": make sure class name exists, is public, and has an" + " empty constructor that is public", e);
        } catch (Exception e2) {
            throw new C0112b("Unable to instantiate fragment " + str + ": make sure class name exists, is public, and has an" + " empty constructor that is public", e2);
        } catch (Exception e22) {
            throw new C0112b("Unable to instantiate fragment " + str + ": make sure class name exists, is public, and has an" + " empty constructor that is public", e22);
        } catch (Exception e222) {
            throw new C0112b("Unable to instantiate fragment " + str + ": could not find Fragment constructor", e222);
        } catch (Exception e2222) {
            throw new C0112b("Unable to instantiate fragment " + str + ": calling Fragment constructor caused an exception", e2222);
        }
    }

    static boolean m439a(Context context, String str) {
        try {
            Class cls = (Class) f493V.get(str);
            if (cls == null) {
                cls = context.getClassLoader().loadClass(str);
                f493V.put(str, cls);
            }
            return C0114h.class.isAssignableFrom(cls);
        } catch (ClassNotFoundException e) {
            return false;
        }
    }

    public void m441A() {
        if (this.f532r == null || this.f532r.f609m == null) {
            m437X().f482i = false;
        } else if (Looper.myLooper() != this.f532r.f609m.m556h().getLooper()) {
            this.f532r.f609m.m556h().postAtFrontOfQueue(new C01081(this));
        } else {
            m436W();
        }
    }

    void m442B() {
        if (this.f533s == null) {
            throw new IllegalStateException("Fragment has not been attached yet.");
        }
        this.f534t = new C0135n();
        this.f534t.m691a(this.f533s, new C01102(this), this);
    }

    void m443C() {
        if (this.f534t != null) {
            this.f534t.m735k();
            this.f534t.m721e();
        }
        this.f516b = 4;
        this.f500F = false;
        m519j();
        if (this.f500F) {
            if (this.f534t != null) {
                this.f534t.m742n();
            }
            if (this.f506L != null) {
                this.f506L.m839g();
            }
            this.f515U.m33a(C0011a.ON_START);
            return;
        }
        throw new C0164z("Fragment " + this + " did not call through to super.onStart()");
    }

    void m444D() {
        if (this.f534t != null) {
            this.f534t.m735k();
            this.f534t.m721e();
        }
        this.f516b = 5;
        this.f500F = false;
        m521k();
        if (this.f500F) {
            if (this.f534t != null) {
                this.f534t.m743o();
                this.f534t.m721e();
            }
            this.f515U.m33a(C0011a.ON_RESUME);
            return;
        }
        throw new C0164z("Fragment " + this + " did not call through to super.onResume()");
    }

    void m445E() {
        if (this.f534t != null) {
            this.f534t.m735k();
        }
    }

    void m446F() {
        onLowMemory();
        if (this.f534t != null) {
            this.f534t.m750u();
        }
    }

    void m447G() {
        this.f515U.m33a(C0011a.ON_PAUSE);
        if (this.f534t != null) {
            this.f534t.m745p();
        }
        this.f516b = 4;
        this.f500F = false;
        m523l();
        if (!this.f500F) {
            throw new C0164z("Fragment " + this + " did not call through to super.onPause()");
        }
    }

    void m448H() {
        this.f515U.m33a(C0011a.ON_STOP);
        if (this.f534t != null) {
            this.f534t.m746q();
        }
        this.f516b = 3;
        this.f500F = false;
        m525m();
        if (!this.f500F) {
            throw new C0164z("Fragment " + this + " did not call through to super.onStop()");
        }
    }

    void m449I() {
        if (this.f534t != null) {
            this.f534t.m747r();
        }
        this.f516b = 2;
        if (this.f507M) {
            this.f507M = false;
            if (!this.f508N) {
                this.f508N = true;
                this.f506L = this.f533s.m540a(this.f520f, this.f507M, false);
            }
            if (this.f506L == null) {
                return;
            }
            if (this.f533s.m558j()) {
                this.f506L.m836d();
            } else {
                this.f506L.m835c();
            }
        }
    }

    void m450J() {
        if (this.f534t != null) {
            this.f534t.m748s();
        }
        this.f516b = 1;
        this.f500F = false;
        m527n();
        if (this.f500F) {
            if (this.f506L != null) {
                this.f506L.m838f();
            }
            this.f530p = false;
            return;
        }
        throw new C0164z("Fragment " + this + " did not call through to super.onDestroyView()");
    }

    void m451K() {
        this.f515U.m33a(C0011a.ON_DESTROY);
        if (this.f534t != null) {
            this.f534t.m749t();
        }
        this.f516b = 0;
        this.f500F = false;
        this.f514T = false;
        m528o();
        if (this.f500F) {
            this.f534t = null;
            return;
        }
        throw new C0164z("Fragment " + this + " did not call through to super.onDestroy()");
    }

    void m452L() {
        this.f500F = false;
        m530q();
        this.f513S = null;
        if (!this.f500F) {
            throw new C0164z("Fragment " + this + " did not call through to super.onDetach()");
        } else if (this.f534t == null) {
        } else {
            if (this.f497C) {
                this.f534t.m749t();
                this.f534t = null;
                return;
            }
            throw new IllegalStateException("Child FragmentManager of " + this + " was not " + " destroyed and this fragment is not retaining instance");
        }
    }

    int m453M() {
        return this.f509O == null ? 0 : this.f509O.f477d;
    }

    int m454N() {
        return this.f509O == null ? 0 : this.f509O.f478e;
    }

    int m455O() {
        return this.f509O == null ? 0 : this.f509O.f479f;
    }

    C0163y m456P() {
        return this.f509O == null ? null : this.f509O.f480g;
    }

    C0163y m457Q() {
        return this.f509O == null ? null : this.f509O.f481h;
    }

    View m458R() {
        return this.f509O == null ? null : this.f509O.f474a;
    }

    Animator m459S() {
        return this.f509O == null ? null : this.f509O.f475b;
    }

    int m460T() {
        return this.f509O == null ? 0 : this.f509O.f476c;
    }

    boolean m461U() {
        return this.f509O == null ? false : this.f509O.f482i;
    }

    boolean m462V() {
        return this.f509O == null ? false : this.f509O.f484k;
    }

    public C0013b mo39a() {
        return this.f515U;
    }

    C0114h m464a(String str) {
        return str.equals(this.f520f) ? this : this.f534t != null ? this.f534t.m701b(str) : null;
    }

    public View m465a(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return null;
    }

    public Animation m466a(int i, boolean z, int i2) {
        return null;
    }

    void m467a(int i) {
        if (this.f509O != null || i != 0) {
            m437X().f477d = i;
        }
    }

    void m468a(int i, int i2) {
        if (this.f509O != null || i != 0 || i2 != 0) {
            m437X();
            this.f509O.f478e = i;
            this.f509O.f479f = i2;
        }
    }

    public void m469a(int i, int i2, Intent intent) {
    }

    final void m470a(int i, C0114h c0114h) {
        this.f519e = i;
        if (c0114h != null) {
            this.f520f = c0114h.f520f + ":" + this.f519e;
        } else {
            this.f520f = "android:fragment:" + this.f519e;
        }
    }

    public void m471a(int i, String[] strArr, int[] iArr) {
    }

    void m472a(Animator animator) {
        m437X().f475b = animator;
    }

    @Deprecated
    public void m473a(Activity activity) {
        this.f500F = true;
    }

    @Deprecated
    public void m474a(Activity activity, AttributeSet attributeSet, Bundle bundle) {
        this.f500F = true;
    }

    public void m475a(Context context) {
        this.f500F = true;
        Activity f = this.f533s == null ? null : this.f533s.m554f();
        if (f != null) {
            this.f500F = false;
            m473a(f);
        }
    }

    public void m476a(Context context, AttributeSet attributeSet, Bundle bundle) {
        this.f500F = true;
        Activity f = this.f533s == null ? null : this.f533s.m554f();
        if (f != null) {
            this.f500F = false;
            m474a(f, attributeSet, bundle);
        }
    }

    void m477a(Configuration configuration) {
        onConfigurationChanged(configuration);
        if (this.f534t != null) {
            this.f534t.m681a(configuration);
        }
    }

    final void m478a(Bundle bundle) {
        if (this.f518d != null) {
            this.f503I.restoreHierarchyState(this.f518d);
            this.f518d = null;
        }
        this.f500F = false;
        m518i(bundle);
        if (!this.f500F) {
            throw new C0164z("Fragment " + this + " did not call through to super.onViewStateRestored()");
        }
    }

    void m479a(C0113c c0113c) {
        m437X();
        if (c0113c != this.f509O.f483j) {
            if (c0113c == null || this.f509O.f483j == null) {
                if (this.f509O.f482i) {
                    this.f509O.f483j = c0113c;
                }
                if (c0113c != null) {
                    c0113c.mo61b();
                    return;
                }
                return;
            }
            throw new IllegalStateException("Trying to set a replacement startPostponedEnterTransition on " + this);
        }
    }

    public void m480a(C0114h c0114h) {
    }

    public void m481a(Menu menu) {
    }

    public void m482a(Menu menu, MenuInflater menuInflater) {
    }

    void m483a(View view) {
        m437X().f474a = view;
    }

    public void m484a(View view, Bundle bundle) {
    }

    public void m485a(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        printWriter.print(str);
        printWriter.print("mFragmentId=#");
        printWriter.print(Integer.toHexString(this.f537w));
        printWriter.print(" mContainerId=#");
        printWriter.print(Integer.toHexString(this.f538x));
        printWriter.print(" mTag=");
        printWriter.println(this.f539y);
        printWriter.print(str);
        printWriter.print("mState=");
        printWriter.print(this.f516b);
        printWriter.print(" mIndex=");
        printWriter.print(this.f519e);
        printWriter.print(" mWho=");
        printWriter.print(this.f520f);
        printWriter.print(" mBackStackNesting=");
        printWriter.println(this.f531q);
        printWriter.print(str);
        printWriter.print("mAdded=");
        printWriter.print(this.f525k);
        printWriter.print(" mRemoving=");
        printWriter.print(this.f526l);
        printWriter.print(" mFromLayout=");
        printWriter.print(this.f527m);
        printWriter.print(" mInLayout=");
        printWriter.println(this.f528n);
        printWriter.print(str);
        printWriter.print("mHidden=");
        printWriter.print(this.f540z);
        printWriter.print(" mDetached=");
        printWriter.print(this.f495A);
        printWriter.print(" mMenuVisible=");
        printWriter.print(this.f499E);
        printWriter.print(" mHasMenu=");
        printWriter.println(this.f498D);
        printWriter.print(str);
        printWriter.print("mRetainInstance=");
        printWriter.print(this.f496B);
        printWriter.print(" mRetaining=");
        printWriter.print(this.f497C);
        printWriter.print(" mUserVisibleHint=");
        printWriter.println(this.f505K);
        if (this.f532r != null) {
            printWriter.print(str);
            printWriter.print("mFragmentManager=");
            printWriter.println(this.f532r);
        }
        if (this.f533s != null) {
            printWriter.print(str);
            printWriter.print("mHost=");
            printWriter.println(this.f533s);
        }
        if (this.f536v != null) {
            printWriter.print(str);
            printWriter.print("mParentFragment=");
            printWriter.println(this.f536v);
        }
        if (this.f521g != null) {
            printWriter.print(str);
            printWriter.print("mArguments=");
            printWriter.println(this.f521g);
        }
        if (this.f517c != null) {
            printWriter.print(str);
            printWriter.print("mSavedFragmentState=");
            printWriter.println(this.f517c);
        }
        if (this.f518d != null) {
            printWriter.print(str);
            printWriter.print("mSavedViewState=");
            printWriter.println(this.f518d);
        }
        if (this.f522h != null) {
            printWriter.print(str);
            printWriter.print("mTarget=");
            printWriter.print(this.f522h);
            printWriter.print(" mTargetRequestCode=");
            printWriter.println(this.f524j);
        }
        if (m453M() != 0) {
            printWriter.print(str);
            printWriter.print("mNextAnim=");
            printWriter.println(m453M());
        }
        if (this.f501G != null) {
            printWriter.print(str);
            printWriter.print("mContainer=");
            printWriter.println(this.f501G);
        }
        if (this.f502H != null) {
            printWriter.print(str);
            printWriter.print("mView=");
            printWriter.println(this.f502H);
        }
        if (this.f503I != null) {
            printWriter.print(str);
            printWriter.print("mInnerView=");
            printWriter.println(this.f502H);
        }
        if (m458R() != null) {
            printWriter.print(str);
            printWriter.print("mAnimatingAway=");
            printWriter.println(m458R());
            printWriter.print(str);
            printWriter.print("mStateAfterAnimating=");
            printWriter.println(m460T());
        }
        if (this.f506L != null) {
            printWriter.print(str);
            printWriter.println("Loader Manager:");
            this.f506L.m832a(str + "  ", fileDescriptor, printWriter, strArr);
        }
        if (this.f534t != null) {
            printWriter.print(str);
            printWriter.println("Child " + this.f534t + ":");
            this.f534t.mo62a(str + "  ", fileDescriptor, printWriter, strArr);
        }
    }

    public void m486a(boolean z) {
    }

    public boolean m487a(MenuItem menuItem) {
        return false;
    }

    public Animator m488b(int i, boolean z, int i2) {
        return null;
    }

    View m489b(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        if (this.f534t != null) {
            this.f534t.m735k();
        }
        this.f530p = true;
        return m465a(layoutInflater, viewGroup, bundle);
    }

    void m490b(int i) {
        m437X().f476c = i;
    }

    public void m491b(Bundle bundle) {
        if (this.f519e < 0 || !m499c()) {
            this.f521g = bundle;
            return;
        }
        throw new IllegalStateException("Fragment already active and state has been saved");
    }

    public void m492b(Menu menu) {
    }

    public void m493b(boolean z) {
    }

    final boolean m494b() {
        return this.f531q > 0;
    }

    boolean m495b(Menu menu, MenuInflater menuInflater) {
        boolean z = false;
        if (this.f540z) {
            return false;
        }
        if (this.f498D && this.f499E) {
            z = true;
            m482a(menu, menuInflater);
        }
        return this.f534t != null ? z | this.f534t.m697a(menu, menuInflater) : z;
    }

    public boolean m496b(MenuItem menuItem) {
        return false;
    }

    public LayoutInflater m497c(Bundle bundle) {
        return m508e(bundle);
    }

    public void m498c(boolean z) {
    }

    public final boolean m499c() {
        return this.f532r == null ? false : this.f532r.mo65c();
    }

    boolean m500c(Menu menu) {
        boolean z = false;
        if (this.f540z) {
            return false;
        }
        if (this.f498D && this.f499E) {
            z = true;
            m481a(menu);
        }
        return this.f534t != null ? z | this.f534t.m696a(menu) : z;
    }

    boolean m501c(MenuItem menuItem) {
        if (!this.f540z) {
            if (this.f498D && this.f499E && m487a(menuItem)) {
                return true;
            }
            if (this.f534t != null && this.f534t.m698a(menuItem)) {
                return true;
            }
        }
        return false;
    }

    public final C0119i m502d() {
        return this.f533s == null ? null : (C0119i) this.f533s.m554f();
    }

    LayoutInflater m503d(Bundle bundle) {
        this.f513S = m497c(bundle);
        return this.f513S;
    }

    void m504d(Menu menu) {
        if (!this.f540z) {
            if (this.f498D && this.f499E) {
                m492b(menu);
            }
            if (this.f534t != null) {
                this.f534t.m707b(menu);
            }
        }
    }

    void m505d(boolean z) {
        m493b(z);
        if (this.f534t != null) {
            this.f534t.m693a(z);
        }
    }

    boolean m506d(MenuItem menuItem) {
        if (!this.f540z) {
            if (m496b(menuItem)) {
                return true;
            }
            if (this.f534t != null && this.f534t.m709b(menuItem)) {
                return true;
            }
        }
        return false;
    }

    public final Resources m507e() {
        if (this.f533s != null) {
            return this.f533s.m555g().getResources();
        }
        throw new IllegalStateException("Fragment " + this + " not attached to Activity");
    }

    @Deprecated
    public LayoutInflater m508e(Bundle bundle) {
        if (this.f533s == null) {
            throw new IllegalStateException("onGetLayoutInflater() cannot be executed until the Fragment is attached to the FragmentManager.");
        }
        LayoutInflater b = this.f533s.mo46b();
        m513g();
        C0290e.m1273b(b, this.f534t.m752w());
        return b;
    }

    void m509e(boolean z) {
        m498c(z);
        if (this.f534t != null) {
            this.f534t.m708b(z);
        }
    }

    public final boolean equals(Object obj) {
        return super.equals(obj);
    }

    public final C0123m m510f() {
        return this.f532r;
    }

    public void m511f(Bundle bundle) {
        this.f500F = true;
        m514g(bundle);
        if (this.f534t != null && !this.f534t.m695a(1)) {
            this.f534t.m737l();
        }
    }

    void m512f(boolean z) {
        m437X().f484k = z;
    }

    public final C0123m m513g() {
        if (this.f534t == null) {
            m442B();
            if (this.f516b >= 5) {
                this.f534t.m743o();
            } else if (this.f516b >= 4) {
                this.f534t.m742n();
            } else if (this.f516b >= 2) {
                this.f534t.m739m();
            } else if (this.f516b >= 1) {
                this.f534t.m737l();
            }
        }
        return this.f534t;
    }

    void m514g(Bundle bundle) {
        if (bundle != null) {
            Parcelable parcelable = bundle.getParcelable("android:support:fragments");
            if (parcelable != null) {
                if (this.f534t == null) {
                    m442B();
                }
                this.f534t.m683a(parcelable, this.f535u);
                this.f535u = null;
                this.f534t.m737l();
            }
        }
    }

    C0123m m515h() {
        return this.f534t;
    }

    public void m516h(Bundle bundle) {
        this.f500F = true;
    }

    public final int hashCode() {
        return super.hashCode();
    }

    public View m517i() {
        return this.f502H;
    }

    public void m518i(Bundle bundle) {
        this.f500F = true;
    }

    public void m519j() {
        this.f500F = true;
        if (!this.f507M) {
            this.f507M = true;
            if (!this.f508N) {
                this.f508N = true;
                this.f506L = this.f533s.m540a(this.f520f, this.f507M, false);
            } else if (this.f506L != null) {
                this.f506L.m834b();
            }
        }
    }

    public void m520j(Bundle bundle) {
    }

    public void m521k() {
        this.f500F = true;
    }

    void m522k(Bundle bundle) {
        if (this.f534t != null) {
            this.f534t.m735k();
        }
        this.f516b = 1;
        this.f500F = false;
        m511f(bundle);
        this.f514T = true;
        if (this.f500F) {
            this.f515U.m33a(C0011a.ON_CREATE);
            return;
        }
        throw new C0164z("Fragment " + this + " did not call through to super.onCreate()");
    }

    public void m523l() {
        this.f500F = true;
    }

    void m524l(Bundle bundle) {
        if (this.f534t != null) {
            this.f534t.m735k();
        }
        this.f516b = 2;
        this.f500F = false;
        m516h(bundle);
        if (!this.f500F) {
            throw new C0164z("Fragment " + this + " did not call through to super.onActivityCreated()");
        } else if (this.f534t != null) {
            this.f534t.m739m();
        }
    }

    public void m525m() {
        this.f500F = true;
    }

    void m526m(Bundle bundle) {
        m520j(bundle);
        if (this.f534t != null) {
            Parcelable j = this.f534t.m733j();
            if (j != null) {
                bundle.putParcelable("android:support:fragments", j);
            }
        }
    }

    public void m527n() {
        this.f500F = true;
    }

    public void m528o() {
        this.f500F = true;
        if (!this.f508N) {
            this.f508N = true;
            this.f506L = this.f533s.m540a(this.f520f, this.f507M, false);
        }
        if (this.f506L != null) {
            this.f506L.m840h();
        }
    }

    public void onConfigurationChanged(Configuration configuration) {
        this.f500F = true;
    }

    public void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenuInfo contextMenuInfo) {
        m502d().onCreateContextMenu(contextMenu, view, contextMenuInfo);
    }

    public void onLowMemory() {
        this.f500F = true;
    }

    void m529p() {
        this.f519e = -1;
        this.f520f = null;
        this.f525k = false;
        this.f526l = false;
        this.f527m = false;
        this.f528n = false;
        this.f529o = false;
        this.f531q = 0;
        this.f532r = null;
        this.f534t = null;
        this.f533s = null;
        this.f537w = 0;
        this.f538x = 0;
        this.f539y = null;
        this.f540z = false;
        this.f495A = false;
        this.f497C = false;
        this.f506L = null;
        this.f507M = false;
        this.f508N = false;
    }

    public void m530q() {
        this.f500F = true;
    }

    public void m531r() {
    }

    public Object m532s() {
        return this.f509O == null ? null : this.f509O.f485l;
    }

    public Object m533t() {
        return this.f509O == null ? null : this.f509O.f486m == f494a ? m532s() : this.f509O.f486m;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder(128);
        C0233d.m1144a(this, stringBuilder);
        if (this.f519e >= 0) {
            stringBuilder.append(" #");
            stringBuilder.append(this.f519e);
        }
        if (this.f537w != 0) {
            stringBuilder.append(" id=0x");
            stringBuilder.append(Integer.toHexString(this.f537w));
        }
        if (this.f539y != null) {
            stringBuilder.append(" ");
            stringBuilder.append(this.f539y);
        }
        stringBuilder.append('}');
        return stringBuilder.toString();
    }

    public Object m534u() {
        return this.f509O == null ? null : this.f509O.f487n;
    }

    public Object m535v() {
        return this.f509O == null ? null : this.f509O.f488o == f494a ? m534u() : this.f509O.f488o;
    }

    public Object m536w() {
        return this.f509O == null ? null : this.f509O.f489p;
    }

    public Object m537x() {
        return this.f509O == null ? null : this.f509O.f490q == f494a ? m536w() : this.f509O.f490q;
    }

    public boolean m538y() {
        return (this.f509O == null || this.f509O.f492s == null) ? true : this.f509O.f492s.booleanValue();
    }

    public boolean m539z() {
        return (this.f509O == null || this.f509O.f491r == null) ? true : this.f509O.f491r.booleanValue();
    }
}
