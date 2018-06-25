package android.support.v7.app;

import android.content.Context;
import android.location.Location;
import android.location.LocationManager;
import android.support.v4.p009b.C0173c;
import android.util.Log;
import java.util.Calendar;

class C0475q {
    private static C0475q f1372a;
    private final Context f1373b;
    private final LocationManager f1374c;
    private final C0474a f1375d = new C0474a();

    private static class C0474a {
        boolean f1366a;
        long f1367b;
        long f1368c;
        long f1369d;
        long f1370e;
        long f1371f;

        C0474a() {
        }
    }

    C0475q(Context context, LocationManager locationManager) {
        this.f1373b = context;
        this.f1374c = locationManager;
    }

    private Location m2123a(String str) {
        if (this.f1374c != null) {
            try {
                if (this.f1374c.isProviderEnabled(str)) {
                    return this.f1374c.getLastKnownLocation(str);
                }
            } catch (Throwable e) {
                Log.d("TwilightManager", "Failed to get last known location", e);
            }
        }
        return null;
    }

    static C0475q m2124a(Context context) {
        if (f1372a == null) {
            Context applicationContext = context.getApplicationContext();
            f1372a = new C0475q(applicationContext, (LocationManager) applicationContext.getSystemService("location"));
        }
        return f1372a;
    }

    private void m2125a(Location location) {
        long j;
        C0474a c0474a = this.f1375d;
        long currentTimeMillis = System.currentTimeMillis();
        C0473p a = C0473p.m2121a();
        a.m2122a(currentTimeMillis - 86400000, location.getLatitude(), location.getLongitude());
        long j2 = a.f1363a;
        a.m2122a(currentTimeMillis, location.getLatitude(), location.getLongitude());
        boolean z = a.f1365c == 1;
        long j3 = a.f1364b;
        long j4 = a.f1363a;
        a.m2122a(86400000 + currentTimeMillis, location.getLatitude(), location.getLongitude());
        long j5 = a.f1364b;
        if (j3 == -1 || j4 == -1) {
            j = 43200000 + currentTimeMillis;
        } else {
            j = currentTimeMillis > j4 ? 0 + j5 : currentTimeMillis > j3 ? 0 + j4 : 0 + j3;
            j += 60000;
        }
        c0474a.f1366a = z;
        c0474a.f1367b = j2;
        c0474a.f1368c = j3;
        c0474a.f1369d = j4;
        c0474a.f1370e = j5;
        c0474a.f1371f = j;
    }

    private Location m2126b() {
        Location location = null;
        Location a = C0173c.m892a(this.f1373b, "android.permission.ACCESS_COARSE_LOCATION") == 0 ? m2123a("network") : null;
        if (C0173c.m892a(this.f1373b, "android.permission.ACCESS_FINE_LOCATION") == 0) {
            location = m2123a("gps");
        }
        if (location != null && a != null) {
            return location.getTime() > a.getTime() ? location : a;
        } else {
            if (location == null) {
                location = a;
            }
            return location;
        }
    }

    private boolean m2127c() {
        return this.f1375d != null && this.f1375d.f1371f > System.currentTimeMillis();
    }

    boolean m2128a() {
        C0474a c0474a = this.f1375d;
        if (m2127c()) {
            return c0474a.f1366a;
        }
        Location b = m2126b();
        if (b != null) {
            m2125a(b);
            return c0474a.f1366a;
        }
        Log.i("TwilightManager", "Could not get last known location. This is probably because the app does not have any location permissions. Falling back to hardcoded sunrise/sunset values.");
        int i = Calendar.getInstance().get(11);
        return i < 6 || i >= 22;
    }
}
