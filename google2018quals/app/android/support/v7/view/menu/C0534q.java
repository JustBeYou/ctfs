package android.support.v7.view.menu;

import android.content.Context;
import android.os.Build.VERSION;
import android.support.v4.p012d.p013a.C0202a;
import android.support.v4.p012d.p013a.C0203b;
import android.support.v4.p012d.p013a.C0204c;
import android.view.Menu;
import android.view.MenuItem;
import android.view.SubMenu;

public final class C0534q {
    public static Menu m2541a(Context context, C0202a c0202a) {
        return new C0535r(context, c0202a);
    }

    public static MenuItem m2542a(Context context, C0203b c0203b) {
        return VERSION.SDK_INT >= 16 ? new C0531l(context, c0203b) : new C0529k(context, c0203b);
    }

    public static SubMenu m2543a(Context context, C0204c c0204c) {
        return new C0540v(context, c0204c);
    }
}
