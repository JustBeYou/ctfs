package android.support.v4.p017h;

import android.os.Build.VERSION;
import android.view.ViewGroup.MarginLayoutParams;

public final class C0291f {
    public static int m1274a(MarginLayoutParams marginLayoutParams) {
        return VERSION.SDK_INT >= 17 ? marginLayoutParams.getMarginStart() : marginLayoutParams.leftMargin;
    }

    public static int m1275b(MarginLayoutParams marginLayoutParams) {
        return VERSION.SDK_INT >= 17 ? marginLayoutParams.getMarginEnd() : marginLayoutParams.rightMargin;
    }
}
