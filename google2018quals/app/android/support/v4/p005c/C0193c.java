package android.support.v4.p005c;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.os.Build.VERSION;
import android.os.CancellationSignal;
import android.support.v4.p009b.p011a.C0169a.C0165a;
import android.support.v4.p009b.p011a.C0169a.C0166b;
import android.support.v4.p009b.p011a.C0169a.C0168d;
import android.support.v4.p015f.C0220b;
import android.support.v4.p015f.C0220b.C0219b;
import android.support.v4.p016g.C0236g;
import android.widget.TextView;

public class C0193c {
    private static final C0192a f756a;
    private static final C0236g<String, Typeface> f757b = new C0236g(16);

    interface C0192a {
        Typeface mo88a(Context context, Resources resources, int i, String str, int i2);

        Typeface mo89a(Context context, CancellationSignal cancellationSignal, C0219b[] c0219bArr, int i);

        Typeface mo90a(Context context, C0166b c0166b, Resources resources, int i);
    }

    static {
        if (VERSION.SDK_INT >= 26) {
            f756a = new C0197f();
        } else if (VERSION.SDK_INT >= 24 && C0196e.m996a()) {
            f756a = new C0196e();
        } else if (VERSION.SDK_INT >= 21) {
            f756a = new C0195d();
        } else {
            f756a = new C0194g();
        }
    }

    public static Typeface m981a(Context context, Resources resources, int i, String str, int i2) {
        Typeface a = f756a.mo88a(context, resources, i, str, i2);
        if (a != null) {
            f757b.m1158a(C0193c.m985b(resources, i, i2), a);
        }
        return a;
    }

    public static Typeface m982a(Context context, CancellationSignal cancellationSignal, C0219b[] c0219bArr, int i) {
        return f756a.mo89a(context, cancellationSignal, c0219bArr, i);
    }

    public static Typeface m983a(Context context, C0165a c0165a, Resources resources, int i, int i2, TextView textView) {
        Typeface a;
        if (c0165a instanceof C0168d) {
            C0168d c0168d = (C0168d) c0165a;
            a = C0220b.m1061a(context, c0168d.m857a(), textView, c0168d.m858b(), c0168d.m859c(), i2);
        } else {
            a = f756a.mo90a(context, (C0166b) c0165a, resources, i2);
        }
        if (a != null) {
            f757b.m1158a(C0193c.m985b(resources, i, i2), a);
        }
        return a;
    }

    public static Typeface m984a(Resources resources, int i, int i2) {
        return (Typeface) f757b.m1157a(C0193c.m985b(resources, i, i2));
    }

    private static String m985b(Resources resources, int i, int i2) {
        return resources.getResourcePackageName(i) + "-" + i + "-" + i2;
    }
}
