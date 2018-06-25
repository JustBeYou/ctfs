package android.support.v4.p010a;

import android.app.AppOpsManager;
import android.content.Context;
import android.os.Build.VERSION;

public final class C0097b {
    public static int m394a(Context context, String str, String str2) {
        return VERSION.SDK_INT >= 23 ? ((AppOpsManager) context.getSystemService(AppOpsManager.class)).noteProxyOp(str, str2) : 1;
    }

    public static String m395a(String str) {
        return VERSION.SDK_INT >= 23 ? AppOpsManager.permissionToOp(str) : null;
    }
}
