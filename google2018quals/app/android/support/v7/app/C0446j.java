package android.support.v7.app;

import android.app.UiModeManager;
import android.content.Context;
import android.support.v7.app.C0445i.C0439a;
import android.view.ActionMode;
import android.view.Window;
import android.view.Window.Callback;

class C0446j extends C0445i {
    private final UiModeManager f1289t;

    class C0440a extends C0439a {
        final /* synthetic */ C0446j f1257d;

        C0440a(C0446j c0446j, Callback callback) {
            this.f1257d = c0446j;
            super(c0446j, callback);
        }

        public ActionMode onWindowStartingActionMode(ActionMode.Callback callback) {
            return null;
        }

        public ActionMode onWindowStartingActionMode(ActionMode.Callback callback, int i) {
            if (this.f1257d.mo316o()) {
                switch (i) {
                    case 0:
                        return m1975a(callback);
                }
            }
            return super.onWindowStartingActionMode(callback, i);
        }
    }

    C0446j(Context context, Window window, C0430d c0430d) {
        super(context, window, c0430d);
        this.f1289t = (UiModeManager) context.getSystemService("uimode");
    }

    Callback mo314a(Callback callback) {
        return new C0440a(this, callback);
    }

    int mo315d(int i) {
        return (i == 0 && this.f1289t.getNightMode() == 0) ? -1 : super.mo315d(i);
    }
}
