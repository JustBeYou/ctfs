package android.support.v4.p010a;

import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.IBinder;
import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public final class C0107g {

    static class C0106a {
        private static Method f470a;
        private static boolean f471b;

        public static IBinder m418a(Bundle bundle, String str) {
            Throwable e;
            if (!f471b) {
                try {
                    f470a = Bundle.class.getMethod("getIBinder", new Class[]{String.class});
                    f470a.setAccessible(true);
                } catch (Throwable e2) {
                    Log.i("BundleCompatBaseImpl", "Failed to retrieve getIBinder method", e2);
                }
                f471b = true;
            }
            if (f470a != null) {
                try {
                    return (IBinder) f470a.invoke(bundle, new Object[]{str});
                } catch (InvocationTargetException e3) {
                    e2 = e3;
                } catch (IllegalAccessException e4) {
                    e2 = e4;
                } catch (IllegalArgumentException e5) {
                    e2 = e5;
                }
            }
            return null;
            Log.i("BundleCompatBaseImpl", "Failed to invoke getIBinder via reflection", e2);
            f470a = null;
            return null;
        }
    }

    public static IBinder m419a(Bundle bundle, String str) {
        return VERSION.SDK_INT >= 18 ? bundle.getBinder(str) : C0106a.m418a(bundle, str);
    }
}
