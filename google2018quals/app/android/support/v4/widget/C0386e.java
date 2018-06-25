package android.support.v4.widget;

import android.os.Build.VERSION;
import android.widget.EdgeEffect;

public final class C0386e {
    private static final C0384b f1107a;

    static class C0384b {
        C0384b() {
        }

        public void mo246a(EdgeEffect edgeEffect, float f, float f2) {
            edgeEffect.onPull(f);
        }
    }

    static class C0385a extends C0384b {
        C0385a() {
        }

        public void mo246a(EdgeEffect edgeEffect, float f, float f2) {
            edgeEffect.onPull(f, f2);
        }
    }

    static {
        if (VERSION.SDK_INT >= 21) {
            f1107a = new C0385a();
        } else {
            f1107a = new C0384b();
        }
    }

    public static void m1810a(EdgeEffect edgeEffect, float f, float f2) {
        f1107a.mo246a(edgeEffect, f, f2);
    }
}
