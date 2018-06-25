package android.support.v7.widget;

import android.annotation.TargetApi;
import android.os.Build.VERSION;
import android.view.View;

public class ay {
    private static final C0592c f2157a;

    private interface C0592c {
        void mo527a(View view, CharSequence charSequence);
    }

    @TargetApi(26)
    private static class C0593a implements C0592c {
        private C0593a() {
        }

        public void mo527a(View view, CharSequence charSequence) {
            view.setTooltipText(charSequence);
        }
    }

    private static class C0594b implements C0592c {
        private C0594b() {
        }

        public void mo527a(View view, CharSequence charSequence) {
            az.m3025a(view, charSequence);
        }
    }

    static {
        if (VERSION.SDK_INT >= 26) {
            f2157a = new C0593a();
        } else {
            f2157a = new C0594b();
        }
    }

    public static void m3021a(View view, CharSequence charSequence) {
        f2157a.mo527a(view, charSequence);
    }
}
