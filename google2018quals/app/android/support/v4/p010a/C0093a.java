package android.support.v4.p010a;

import android.app.Activity;
import android.os.Build.VERSION;
import android.support.v4.p009b.C0092a;

public class C0093a extends C0092a {
    public static void m386a(Activity activity) {
        if (VERSION.SDK_INT >= 16) {
            activity.finishAffinity();
        } else {
            activity.finish();
        }
    }
}
