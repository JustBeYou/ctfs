package android.support.v4.p017h;

import android.os.Build.VERSION;
import android.view.Gravity;

public final class C0287d {
    public static int m1269a(int i, int i2) {
        return VERSION.SDK_INT >= 17 ? Gravity.getAbsoluteGravity(i, i2) : -8388609 & i;
    }
}
