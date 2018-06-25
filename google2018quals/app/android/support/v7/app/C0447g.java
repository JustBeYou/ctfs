package android.support.v7.app;

import android.content.Context;
import android.support.v7.app.C0443k.C0465d;
import android.support.v7.app.C0446j.C0440a;
import android.view.KeyboardShortcutGroup;
import android.view.Menu;
import android.view.Window;
import android.view.Window.Callback;
import java.util.List;

class C0447g extends C0446j {

    class C0441a extends C0440a {
        final /* synthetic */ C0447g f1258b;

        C0441a(C0447g c0447g, Callback callback) {
            this.f1258b = c0447g;
            super(c0447g, callback);
        }

        public void onProvideKeyboardShortcuts(List<KeyboardShortcutGroup> list, Menu menu, int i) {
            C0465d a = this.f1258b.m1994a(0, true);
            if (a == null || a.f1325j == null) {
                super.onProvideKeyboardShortcuts(list, menu, i);
            } else {
                super.onProvideKeyboardShortcuts(list, a.f1325j, i);
            }
        }
    }

    C0447g(Context context, Window window, C0430d c0430d) {
        super(context, window, c0430d);
    }

    Callback mo314a(Callback callback) {
        return new C0441a(this, callback);
    }
}
