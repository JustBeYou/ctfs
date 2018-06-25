package android.support.v4.p017h.p018a;

import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.v4.p017h.p018a.C0268c.C0259a;
import android.support.v4.p017h.p018a.C0270d.C0263a;
import java.util.ArrayList;
import java.util.List;

public class C0266b {
    private static final C0258a f896a;
    private final Object f897b;

    interface C0258a {
        Object mo108a(C0266b c0266b);
    }

    static class C0261d implements C0258a {
        C0261d() {
        }

        public Object mo108a(C0266b c0266b) {
            return null;
        }
    }

    private static class C0262b extends C0261d {
        C0262b() {
        }

        public Object mo108a(final C0266b c0266b) {
            return C0268c.m1232a(new C0259a(this) {
                final /* synthetic */ C0262b f893b;

                public Object mo105a(int i) {
                    C0257a a = c0266b.m1227a(i);
                    return a == null ? null : a.m1187a();
                }

                public List<Object> mo106a(String str, int i) {
                    List a = c0266b.m1229a(str, i);
                    if (a == null) {
                        return null;
                    }
                    List<Object> arrayList = new ArrayList();
                    int size = a.size();
                    for (int i2 = 0; i2 < size; i2++) {
                        arrayList.add(((C0257a) a.get(i2)).m1187a());
                    }
                    return arrayList;
                }

                public boolean mo107a(int i, int i2, Bundle bundle) {
                    return c0266b.m1230a(i, i2, bundle);
                }
            });
        }
    }

    private static class C0265c extends C0261d {
        C0265c() {
        }

        public Object mo108a(final C0266b c0266b) {
            return C0270d.m1233a(new C0263a(this) {
                final /* synthetic */ C0265c f895b;

                public Object mo109a(int i) {
                    C0257a a = c0266b.m1227a(i);
                    return a == null ? null : a.m1187a();
                }

                public List<Object> mo110a(String str, int i) {
                    List a = c0266b.m1229a(str, i);
                    if (a == null) {
                        return null;
                    }
                    List<Object> arrayList = new ArrayList();
                    int size = a.size();
                    for (int i2 = 0; i2 < size; i2++) {
                        arrayList.add(((C0257a) a.get(i2)).m1187a());
                    }
                    return arrayList;
                }

                public boolean mo111a(int i, int i2, Bundle bundle) {
                    return c0266b.m1230a(i, i2, bundle);
                }

                public Object mo112b(int i) {
                    C0257a b = c0266b.m1231b(i);
                    return b == null ? null : b.m1187a();
                }
            });
        }
    }

    static {
        if (VERSION.SDK_INT >= 19) {
            f896a = new C0265c();
        } else if (VERSION.SDK_INT >= 16) {
            f896a = new C0262b();
        } else {
            f896a = new C0261d();
        }
    }

    public C0266b() {
        this.f897b = f896a.mo108a(this);
    }

    public C0266b(Object obj) {
        this.f897b = obj;
    }

    public C0257a m1227a(int i) {
        return null;
    }

    public Object m1228a() {
        return this.f897b;
    }

    public List<C0257a> m1229a(String str, int i) {
        return null;
    }

    public boolean m1230a(int i, int i2, Bundle bundle) {
        return false;
    }

    public C0257a m1231b(int i) {
        return null;
    }
}
