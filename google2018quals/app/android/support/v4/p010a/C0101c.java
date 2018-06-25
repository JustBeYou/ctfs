package android.support.v4.p010a;

import android.os.Build.VERSION;
import android.support.v4.p010a.C0114h.C0113c;
import android.support.v4.p010a.C0135n.C0100f;
import android.util.Log;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;

final class C0101c extends C0099r implements C0100f {
    static final boolean f434a = (VERSION.SDK_INT >= 21);
    final C0135n f435b;
    ArrayList<C0098a> f436c = new ArrayList();
    int f437d;
    int f438e;
    int f439f;
    int f440g;
    int f441h;
    int f442i;
    boolean f443j;
    boolean f444k = true;
    String f445l;
    boolean f446m;
    int f447n = -1;
    int f448o;
    CharSequence f449p;
    int f450q;
    CharSequence f451r;
    ArrayList<String> f452s;
    ArrayList<String> f453t;
    boolean f454u = false;
    ArrayList<Runnable> f455v;

    static final class C0098a {
        int f428a;
        C0114h f429b;
        int f430c;
        int f431d;
        int f432e;
        int f433f;

        C0098a() {
        }

        C0098a(int i, C0114h c0114h) {
            this.f428a = i;
            this.f429b = c0114h;
        }
    }

    public C0101c(C0135n c0135n) {
        this.f435b = c0135n;
    }

    private static boolean m397b(C0098a c0098a) {
        C0114h c0114h = c0098a.f429b;
        return (c0114h == null || !c0114h.f525k || c0114h.f502H == null || c0114h.f495A || c0114h.f540z || !c0114h.m461U()) ? false : true;
    }

    C0114h m398a(ArrayList<C0114h> arrayList, C0114h c0114h) {
        int i = 0;
        while (i < this.f436c.size()) {
            C0098a c0098a = (C0098a) this.f436c.get(i);
            switch (c0098a.f428a) {
                case 1:
                case 7:
                    arrayList.add(c0098a.f429b);
                    break;
                case 2:
                    C0114h c0114h2 = c0098a.f429b;
                    int i2 = c0114h2.f538x;
                    Object obj = null;
                    int size = arrayList.size() - 1;
                    C0114h c0114h3 = c0114h;
                    int i3 = i;
                    while (size >= 0) {
                        Object obj2;
                        C0114h c0114h4 = (C0114h) arrayList.get(size);
                        if (c0114h4.f538x != i2) {
                            obj2 = obj;
                        } else if (c0114h4 == c0114h2) {
                            obj2 = 1;
                        } else {
                            if (c0114h4 == c0114h3) {
                                this.f436c.add(i3, new C0098a(9, c0114h4));
                                i3++;
                                c0114h3 = null;
                            }
                            C0098a c0098a2 = new C0098a(3, c0114h4);
                            c0098a2.f430c = c0098a.f430c;
                            c0098a2.f432e = c0098a.f432e;
                            c0098a2.f431d = c0098a.f431d;
                            c0098a2.f433f = c0098a.f433f;
                            this.f436c.add(i3, c0098a2);
                            arrayList.remove(c0114h4);
                            i3++;
                            obj2 = obj;
                        }
                        size--;
                        obj = obj2;
                    }
                    if (obj != null) {
                        this.f436c.remove(i3);
                        i3--;
                    } else {
                        c0098a.f428a = 1;
                        arrayList.add(c0114h2);
                    }
                    i = i3;
                    c0114h = c0114h3;
                    break;
                case 3:
                case 6:
                    arrayList.remove(c0098a.f429b);
                    if (c0098a.f429b != c0114h) {
                        break;
                    }
                    this.f436c.add(i, new C0098a(9, c0098a.f429b));
                    i++;
                    c0114h = null;
                    break;
                case 8:
                    this.f436c.add(i, new C0098a(9, c0114h));
                    i++;
                    c0114h = c0098a.f429b;
                    break;
                default:
                    break;
            }
            i++;
        }
        return c0114h;
    }

    public void m399a() {
        if (this.f455v != null) {
            int size = this.f455v.size();
            for (int i = 0; i < size; i++) {
                ((Runnable) this.f455v.get(i)).run();
            }
            this.f455v = null;
        }
    }

    void m400a(int i) {
        if (this.f443j) {
            if (C0135n.f591a) {
                Log.v("FragmentManager", "Bump nesting in " + this + " by " + i);
            }
            int size = this.f436c.size();
            for (int i2 = 0; i2 < size; i2++) {
                C0098a c0098a = (C0098a) this.f436c.get(i2);
                if (c0098a.f429b != null) {
                    C0114h c0114h = c0098a.f429b;
                    c0114h.f531q += i;
                    if (C0135n.f591a) {
                        Log.v("FragmentManager", "Bump nesting of " + c0098a.f429b + " to " + c0098a.f429b.f531q);
                    }
                }
            }
        }
    }

    void m401a(C0098a c0098a) {
        this.f436c.add(c0098a);
        c0098a.f430c = this.f437d;
        c0098a.f431d = this.f438e;
        c0098a.f432e = this.f439f;
        c0098a.f433f = this.f440g;
    }

    void m402a(C0113c c0113c) {
        for (int i = 0; i < this.f436c.size(); i++) {
            C0098a c0098a = (C0098a) this.f436c.get(i);
            if (C0101c.m397b(c0098a)) {
                c0098a.f429b.m479a(c0113c);
            }
        }
    }

    public void m403a(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        m404a(str, printWriter, true);
    }

    public void m404a(String str, PrintWriter printWriter, boolean z) {
        if (z) {
            printWriter.print(str);
            printWriter.print("mName=");
            printWriter.print(this.f445l);
            printWriter.print(" mIndex=");
            printWriter.print(this.f447n);
            printWriter.print(" mCommitted=");
            printWriter.println(this.f446m);
            if (this.f441h != 0) {
                printWriter.print(str);
                printWriter.print("mTransition=#");
                printWriter.print(Integer.toHexString(this.f441h));
                printWriter.print(" mTransitionStyle=#");
                printWriter.println(Integer.toHexString(this.f442i));
            }
            if (!(this.f437d == 0 && this.f438e == 0)) {
                printWriter.print(str);
                printWriter.print("mEnterAnim=#");
                printWriter.print(Integer.toHexString(this.f437d));
                printWriter.print(" mExitAnim=#");
                printWriter.println(Integer.toHexString(this.f438e));
            }
            if (!(this.f439f == 0 && this.f440g == 0)) {
                printWriter.print(str);
                printWriter.print("mPopEnterAnim=#");
                printWriter.print(Integer.toHexString(this.f439f));
                printWriter.print(" mPopExitAnim=#");
                printWriter.println(Integer.toHexString(this.f440g));
            }
            if (!(this.f448o == 0 && this.f449p == null)) {
                printWriter.print(str);
                printWriter.print("mBreadCrumbTitleRes=#");
                printWriter.print(Integer.toHexString(this.f448o));
                printWriter.print(" mBreadCrumbTitleText=");
                printWriter.println(this.f449p);
            }
            if (!(this.f450q == 0 && this.f451r == null)) {
                printWriter.print(str);
                printWriter.print("mBreadCrumbShortTitleRes=#");
                printWriter.print(Integer.toHexString(this.f450q));
                printWriter.print(" mBreadCrumbShortTitleText=");
                printWriter.println(this.f451r);
            }
        }
        if (!this.f436c.isEmpty()) {
            printWriter.print(str);
            printWriter.println("Operations:");
            str + "    ";
            int size = this.f436c.size();
            for (int i = 0; i < size; i++) {
                String str2;
                C0098a c0098a = (C0098a) this.f436c.get(i);
                switch (c0098a.f428a) {
                    case 0:
                        str2 = "NULL";
                        break;
                    case 1:
                        str2 = "ADD";
                        break;
                    case 2:
                        str2 = "REPLACE";
                        break;
                    case 3:
                        str2 = "REMOVE";
                        break;
                    case 4:
                        str2 = "HIDE";
                        break;
                    case 5:
                        str2 = "SHOW";
                        break;
                    case 6:
                        str2 = "DETACH";
                        break;
                    case 7:
                        str2 = "ATTACH";
                        break;
                    case 8:
                        str2 = "SET_PRIMARY_NAV";
                        break;
                    case 9:
                        str2 = "UNSET_PRIMARY_NAV";
                        break;
                    default:
                        str2 = "cmd=" + c0098a.f428a;
                        break;
                }
                printWriter.print(str);
                printWriter.print("  Op #");
                printWriter.print(i);
                printWriter.print(": ");
                printWriter.print(str2);
                printWriter.print(" ");
                printWriter.println(c0098a.f429b);
                if (z) {
                    if (!(c0098a.f430c == 0 && c0098a.f431d == 0)) {
                        printWriter.print(str);
                        printWriter.print("enterAnim=#");
                        printWriter.print(Integer.toHexString(c0098a.f430c));
                        printWriter.print(" exitAnim=#");
                        printWriter.println(Integer.toHexString(c0098a.f431d));
                    }
                    if (c0098a.f432e != 0 || c0098a.f433f != 0) {
                        printWriter.print(str);
                        printWriter.print("popEnterAnim=#");
                        printWriter.print(Integer.toHexString(c0098a.f432e));
                        printWriter.print(" popExitAnim=#");
                        printWriter.println(Integer.toHexString(c0098a.f433f));
                    }
                }
            }
        }
    }

    void m405a(boolean z) {
        for (int size = this.f436c.size() - 1; size >= 0; size--) {
            C0098a c0098a = (C0098a) this.f436c.get(size);
            C0114h c0114h = c0098a.f429b;
            if (c0114h != null) {
                c0114h.m468a(C0135n.m670d(this.f441h), this.f442i);
            }
            switch (c0098a.f428a) {
                case 1:
                    c0114h.m467a(c0098a.f433f);
                    this.f435b.m729h(c0114h);
                    break;
                case 3:
                    c0114h.m467a(c0098a.f432e);
                    this.f435b.m690a(c0114h, false);
                    break;
                case 4:
                    c0114h.m467a(c0098a.f432e);
                    this.f435b.m734j(c0114h);
                    break;
                case 5:
                    c0114h.m467a(c0098a.f433f);
                    this.f435b.m732i(c0114h);
                    break;
                case 6:
                    c0114h.m467a(c0098a.f432e);
                    this.f435b.m738l(c0114h);
                    break;
                case 7:
                    c0114h.m467a(c0098a.f433f);
                    this.f435b.m736k(c0114h);
                    break;
                case 8:
                    this.f435b.m744o(null);
                    break;
                case 9:
                    this.f435b.m744o(c0114h);
                    break;
                default:
                    throw new IllegalArgumentException("Unknown cmd: " + c0098a.f428a);
            }
            if (!(this.f454u || c0098a.f428a == 3 || c0114h == null)) {
                this.f435b.m719e(c0114h);
            }
        }
        if (!this.f454u && z) {
            this.f435b.m680a(this.f435b.f608l, true);
        }
    }

    boolean m406a(ArrayList<C0101c> arrayList, int i, int i2) {
        if (i2 == i) {
            return false;
        }
        int size = this.f436c.size();
        int i3 = -1;
        int i4 = 0;
        while (i4 < size) {
            int i5;
            C0098a c0098a = (C0098a) this.f436c.get(i4);
            int i6 = c0098a.f429b != null ? c0098a.f429b.f538x : 0;
            if (i6 == 0 || i6 == i3) {
                i5 = i3;
            } else {
                for (int i7 = i; i7 < i2; i7++) {
                    C0101c c0101c = (C0101c) arrayList.get(i7);
                    int size2 = c0101c.f436c.size();
                    for (int i8 = 0; i8 < size2; i8++) {
                        C0098a c0098a2 = (C0098a) c0101c.f436c.get(i8);
                        if ((c0098a2.f429b != null ? c0098a2.f429b.f538x : 0) == i6) {
                            return true;
                        }
                    }
                }
                i5 = i6;
            }
            i4++;
            i3 = i5;
        }
        return false;
    }

    public boolean mo40a(ArrayList<C0101c> arrayList, ArrayList<Boolean> arrayList2) {
        if (C0135n.f591a) {
            Log.v("FragmentManager", "Run: " + this);
        }
        arrayList.add(this);
        arrayList2.add(Boolean.valueOf(false));
        if (this.f443j) {
            this.f435b.m684a(this);
        }
        return true;
    }

    C0114h m408b(ArrayList<C0114h> arrayList, C0114h c0114h) {
        for (int i = 0; i < this.f436c.size(); i++) {
            C0098a c0098a = (C0098a) this.f436c.get(i);
            switch (c0098a.f428a) {
                case 1:
                case 7:
                    arrayList.remove(c0098a.f429b);
                    break;
                case 3:
                case 6:
                    arrayList.add(c0098a.f429b);
                    break;
                case 8:
                    c0114h = null;
                    break;
                case 9:
                    c0114h = c0098a.f429b;
                    break;
                default:
                    break;
            }
        }
        return c0114h;
    }

    void m409b() {
        int size = this.f436c.size();
        for (int i = 0; i < size; i++) {
            C0098a c0098a = (C0098a) this.f436c.get(i);
            C0114h c0114h = c0098a.f429b;
            if (c0114h != null) {
                c0114h.m468a(this.f441h, this.f442i);
            }
            switch (c0098a.f428a) {
                case 1:
                    c0114h.m467a(c0098a.f430c);
                    this.f435b.m690a(c0114h, false);
                    break;
                case 3:
                    c0114h.m467a(c0098a.f431d);
                    this.f435b.m729h(c0114h);
                    break;
                case 4:
                    c0114h.m467a(c0098a.f431d);
                    this.f435b.m732i(c0114h);
                    break;
                case 5:
                    c0114h.m467a(c0098a.f430c);
                    this.f435b.m734j(c0114h);
                    break;
                case 6:
                    c0114h.m467a(c0098a.f431d);
                    this.f435b.m736k(c0114h);
                    break;
                case 7:
                    c0114h.m467a(c0098a.f430c);
                    this.f435b.m738l(c0114h);
                    break;
                case 8:
                    this.f435b.m744o(c0114h);
                    break;
                case 9:
                    this.f435b.m744o(null);
                    break;
                default:
                    throw new IllegalArgumentException("Unknown cmd: " + c0098a.f428a);
            }
            if (!(this.f454u || c0098a.f428a == 1 || c0114h == null)) {
                this.f435b.m719e(c0114h);
            }
        }
        if (!this.f454u) {
            this.f435b.m680a(this.f435b.f608l, true);
        }
    }

    boolean m410b(int i) {
        int size = this.f436c.size();
        for (int i2 = 0; i2 < size; i2++) {
            C0098a c0098a = (C0098a) this.f436c.get(i2);
            int i3 = c0098a.f429b != null ? c0098a.f429b.f538x : 0;
            if (i3 != 0 && i3 == i) {
                return true;
            }
        }
        return false;
    }

    boolean m411c() {
        for (int i = 0; i < this.f436c.size(); i++) {
            if (C0101c.m397b((C0098a) this.f436c.get(i))) {
                return true;
            }
        }
        return false;
    }

    public String m412d() {
        return this.f445l;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder(128);
        stringBuilder.append("BackStackEntry{");
        stringBuilder.append(Integer.toHexString(System.identityHashCode(this)));
        if (this.f447n >= 0) {
            stringBuilder.append(" #");
            stringBuilder.append(this.f447n);
        }
        if (this.f445l != null) {
            stringBuilder.append(" ");
            stringBuilder.append(this.f445l);
        }
        stringBuilder.append("}");
        return stringBuilder.toString();
    }
}
