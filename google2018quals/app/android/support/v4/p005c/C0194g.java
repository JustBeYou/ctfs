package android.support.v4.p005c;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.os.CancellationSignal;
import android.support.v4.p005c.C0193c.C0192a;
import android.support.v4.p009b.p011a.C0169a.C0166b;
import android.support.v4.p009b.p011a.C0169a.C0167c;
import android.support.v4.p015f.C0220b.C0219b;
import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

class C0194g implements C0192a {

    private interface C0198a<T> {
        boolean mo91a(T t);

        int mo92b(T t);
    }

    class C01991 implements C0198a<C0219b> {
        final /* synthetic */ C0194g f769a;

        C01991(C0194g c0194g) {
            this.f769a = c0194g;
        }

        public int m1013a(C0219b c0219b) {
            return c0219b.m1056c();
        }

        public /* synthetic */ boolean mo91a(Object obj) {
            return m1016b((C0219b) obj);
        }

        public /* synthetic */ int mo92b(Object obj) {
            return m1013a((C0219b) obj);
        }

        public boolean m1016b(C0219b c0219b) {
            return c0219b.m1057d();
        }
    }

    class C02002 implements C0198a<C0167c> {
        final /* synthetic */ C0194g f770a;

        C02002(C0194g c0194g) {
            this.f770a = c0194g;
        }

        public int m1017a(C0167c c0167c) {
            return c0167c.m854b();
        }

        public /* synthetic */ boolean mo91a(Object obj) {
            return m1020b((C0167c) obj);
        }

        public /* synthetic */ int mo92b(Object obj) {
            return m1017a((C0167c) obj);
        }

        public boolean m1020b(C0167c c0167c) {
            return c0167c.m855c();
        }
    }

    C0194g() {
    }

    private C0167c m986a(C0166b c0166b, int i) {
        return (C0167c) C0194g.m987a(c0166b.m852a(), i, new C02002(this));
    }

    private static <T> T m987a(T[] tArr, int i, C0198a<T> c0198a) {
        int i2 = (i & 1) == 0 ? 400 : 700;
        boolean z = (i & 2) != 0;
        T t = null;
        int i3 = Integer.MAX_VALUE;
        int length = tArr.length;
        int i4 = 0;
        while (i4 < length) {
            T t2;
            T t3 = tArr[i4];
            int abs = (c0198a.mo91a(t3) == z ? 0 : 1) + (Math.abs(c0198a.mo92b(t3) - i2) * 2);
            if (t == null || r3 > abs) {
                i3 = abs;
                t2 = t3;
            } else {
                t2 = t;
            }
            i4++;
            t = t2;
        }
        return t;
    }

    public Typeface mo88a(Context context, Resources resources, int i, String str, int i2) {
        Typeface typeface = null;
        File a = C0201h.m1021a(context);
        if (a != null) {
            try {
                if (C0201h.m1026a(a, resources, i)) {
                    typeface = Typeface.createFromFile(a.getPath());
                    a.delete();
                }
            } catch (RuntimeException e) {
            } finally {
                a.delete();
            }
        }
        return typeface;
    }

    public Typeface mo89a(Context context, CancellationSignal cancellationSignal, C0219b[] c0219bArr, int i) {
        Closeable openInputStream;
        Throwable th;
        Typeface typeface = null;
        if (c0219bArr.length >= 1) {
            try {
                openInputStream = context.getContentResolver().openInputStream(m992a(c0219bArr, i).m1054a());
                try {
                    typeface = m991a(context, (InputStream) openInputStream);
                    C0201h.m1025a(openInputStream);
                } catch (IOException e) {
                    C0201h.m1025a(openInputStream);
                    return typeface;
                } catch (Throwable th2) {
                    th = th2;
                    C0201h.m1025a(openInputStream);
                    throw th;
                }
            } catch (IOException e2) {
                openInputStream = typeface;
                C0201h.m1025a(openInputStream);
                return typeface;
            } catch (Throwable th3) {
                Throwable th4 = th3;
                openInputStream = typeface;
                th = th4;
                C0201h.m1025a(openInputStream);
                throw th;
            }
        }
        return typeface;
    }

    public Typeface mo90a(Context context, C0166b c0166b, Resources resources, int i) {
        C0167c a = m986a(c0166b, i);
        return a == null ? null : C0193c.m981a(context, resources, a.m856d(), a.m853a(), i);
    }

    protected Typeface m991a(Context context, InputStream inputStream) {
        Typeface typeface = null;
        File a = C0201h.m1021a(context);
        if (a != null) {
            try {
                if (C0201h.m1027a(a, inputStream)) {
                    typeface = Typeface.createFromFile(a.getPath());
                    a.delete();
                }
            } catch (RuntimeException e) {
            } finally {
                a.delete();
            }
        }
        return typeface;
    }

    protected C0219b m992a(C0219b[] c0219bArr, int i) {
        return (C0219b) C0194g.m987a(c0219bArr, i, new C01991(this));
    }
}
