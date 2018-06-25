package android.support.v7.app;

import android.content.res.Resources;
import android.os.Build.VERSION;
import android.util.Log;
import android.util.LongSparseArray;
import java.lang.reflect.Field;
import java.util.Map;

class C0469n {
    private static Field f1345a;
    private static boolean f1346b;
    private static Class f1347c;
    private static boolean f1348d;
    private static Field f1349e;
    private static boolean f1350f;
    private static Field f1351g;
    private static boolean f1352h;

    static boolean m2095a(Resources resources) {
        return VERSION.SDK_INT >= 24 ? C0469n.m2099d(resources) : VERSION.SDK_INT >= 23 ? C0469n.m2098c(resources) : VERSION.SDK_INT >= 21 ? C0469n.m2097b(resources) : false;
    }

    private static boolean m2096a(Object obj) {
        if (!f1348d) {
            try {
                f1347c = Class.forName("android.content.res.ThemedResourceCache");
            } catch (Throwable e) {
                Log.e("ResourcesFlusher", "Could not find ThemedResourceCache class", e);
            }
            f1348d = true;
        }
        if (f1347c == null) {
            return false;
        }
        if (!f1350f) {
            try {
                f1349e = f1347c.getDeclaredField("mUnthemedEntries");
                f1349e.setAccessible(true);
            } catch (Throwable e2) {
                Log.e("ResourcesFlusher", "Could not retrieve ThemedResourceCache#mUnthemedEntries field", e2);
            }
            f1350f = true;
        }
        if (f1349e == null) {
            return false;
        }
        LongSparseArray longSparseArray;
        try {
            longSparseArray = (LongSparseArray) f1349e.get(obj);
        } catch (Throwable e22) {
            Log.e("ResourcesFlusher", "Could not retrieve value from ThemedResourceCache#mUnthemedEntries", e22);
            longSparseArray = null;
        }
        if (longSparseArray == null) {
            return false;
        }
        longSparseArray.clear();
        return true;
    }

    private static boolean m2097b(Resources resources) {
        if (!f1346b) {
            try {
                f1345a = Resources.class.getDeclaredField("mDrawableCache");
                f1345a.setAccessible(true);
            } catch (Throwable e) {
                Log.e("ResourcesFlusher", "Could not retrieve Resources#mDrawableCache field", e);
            }
            f1346b = true;
        }
        if (f1345a != null) {
            Map map;
            try {
                map = (Map) f1345a.get(resources);
            } catch (Throwable e2) {
                Log.e("ResourcesFlusher", "Could not retrieve value from Resources#mDrawableCache", e2);
                map = null;
            }
            if (map != null) {
                map.clear();
                return true;
            }
        }
        return false;
    }

    private static boolean m2098c(Resources resources) {
        Object obj;
        boolean z = true;
        if (!f1346b) {
            try {
                f1345a = Resources.class.getDeclaredField("mDrawableCache");
                f1345a.setAccessible(true);
            } catch (Throwable e) {
                Log.e("ResourcesFlusher", "Could not retrieve Resources#mDrawableCache field", e);
            }
            f1346b = true;
        }
        if (f1345a != null) {
            try {
                obj = f1345a.get(resources);
            } catch (Throwable e2) {
                Log.e("ResourcesFlusher", "Could not retrieve value from Resources#mDrawableCache", e2);
            }
            if (obj == null) {
                return false;
            }
            if (obj == null || !C0469n.m2096a(obj)) {
                z = false;
            }
            return z;
        }
        obj = null;
        if (obj == null) {
            return false;
        }
        z = false;
        return z;
    }

    private static boolean m2099d(Resources resources) {
        boolean z = true;
        if (!f1352h) {
            try {
                f1351g = Resources.class.getDeclaredField("mResourcesImpl");
                f1351g.setAccessible(true);
            } catch (Throwable e) {
                Log.e("ResourcesFlusher", "Could not retrieve Resources#mResourcesImpl field", e);
            }
            f1352h = true;
        }
        if (f1351g == null) {
            return false;
        }
        Object obj;
        try {
            obj = f1351g.get(resources);
        } catch (Throwable e2) {
            Log.e("ResourcesFlusher", "Could not retrieve value from Resources#mResourcesImpl", e2);
            obj = null;
        }
        if (obj == null) {
            return false;
        }
        Object obj2;
        if (!f1346b) {
            try {
                f1345a = obj.getClass().getDeclaredField("mDrawableCache");
                f1345a.setAccessible(true);
            } catch (Throwable e22) {
                Log.e("ResourcesFlusher", "Could not retrieve ResourcesImpl#mDrawableCache field", e22);
            }
            f1346b = true;
        }
        if (f1345a != null) {
            try {
                obj2 = f1345a.get(obj);
            } catch (Throwable e222) {
                Log.e("ResourcesFlusher", "Could not retrieve value from ResourcesImpl#mDrawableCache", e222);
            }
            if (obj2 == null || !C0469n.m2096a(obj2)) {
                z = false;
            }
            return z;
        }
        obj2 = null;
        z = false;
        return z;
    }
}
