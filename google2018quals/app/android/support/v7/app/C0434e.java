package android.support.v7.app;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.view.MenuInflater;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;

public abstract class C0434e {
    private static int f1233a = -1;
    private static boolean f1234b = false;

    C0434e() {
    }

    public static C0434e m1927a(Activity activity, C0430d c0430d) {
        return C0434e.m1929a(activity, activity.getWindow(), c0430d);
    }

    public static C0434e m1928a(Dialog dialog, C0430d c0430d) {
        return C0434e.m1929a(dialog.getContext(), dialog.getWindow(), c0430d);
    }

    private static C0434e m1929a(Context context, Window window, C0430d c0430d) {
        return VERSION.SDK_INT >= 24 ? new C0447g(context, window, c0430d) : VERSION.SDK_INT >= 23 ? new C0446j(context, window, c0430d) : VERSION.SDK_INT >= 14 ? new C0445i(context, window, c0430d) : VERSION.SDK_INT >= 11 ? new C0444h(context, window, c0430d) : new C0443k(context, window, c0430d);
    }

    public static int m1930j() {
        return f1233a;
    }

    public static boolean m1931k() {
        return f1234b;
    }

    public abstract C0428a mo281a();

    public abstract <T extends View> T mo293a(int i);

    public abstract void mo295a(Configuration configuration);

    public abstract void mo296a(Bundle bundle);

    public abstract void mo298a(View view);

    public abstract void mo299a(View view, LayoutParams layoutParams);

    public abstract void mo282a(CharSequence charSequence);

    public abstract MenuInflater mo283b();

    public abstract void mo303b(int i);

    public abstract void mo304b(Bundle bundle);

    public abstract void mo305b(View view, LayoutParams layoutParams);

    public abstract void mo284c();

    public abstract void mo285c(Bundle bundle);

    public abstract boolean mo308c(int i);

    public abstract void mo286d();

    public abstract void mo309e();

    public abstract void mo310f();

    public abstract void mo287g();

    public abstract void mo311h();

    public abstract boolean mo288i();
}
