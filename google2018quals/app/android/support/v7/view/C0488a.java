package android.support.v7.view;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Build.VERSION;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.p020a.C0411a.C0402b;
import android.support.v7.p020a.C0411a.C0404d;
import android.support.v7.p020a.C0411a.C0410j;
import android.view.ViewConfiguration;

public class C0488a {
    private Context f1427a;

    private C0488a(Context context) {
        this.f1427a = context;
    }

    public static C0488a m2223a(Context context) {
        return new C0488a(context);
    }

    public int m2224a() {
        Configuration configuration = this.f1427a.getResources().getConfiguration();
        int i = configuration.screenWidthDp;
        int i2 = configuration.screenHeightDp;
        return (configuration.smallestScreenWidthDp > 600 || i > 600 || ((i > 960 && i2 > 720) || (i > 720 && i2 > 960))) ? 5 : (i >= 500 || ((i > 640 && i2 > 480) || (i > 480 && i2 > 640))) ? 4 : i >= 360 ? 3 : 2;
    }

    public boolean m2225b() {
        return VERSION.SDK_INT >= 19 || !ViewConfiguration.get(this.f1427a).hasPermanentMenuKey();
    }

    public int m2226c() {
        return this.f1427a.getResources().getDisplayMetrics().widthPixels / 2;
    }

    public boolean m2227d() {
        return this.f1427a.getResources().getBoolean(C0402b.abc_action_bar_embed_tabs);
    }

    public int m2228e() {
        TypedArray obtainStyledAttributes = this.f1427a.obtainStyledAttributes(null, C0410j.ActionBar, C0401a.actionBarStyle, 0);
        int layoutDimension = obtainStyledAttributes.getLayoutDimension(C0410j.ActionBar_height, 0);
        Resources resources = this.f1427a.getResources();
        if (!m2227d()) {
            layoutDimension = Math.min(layoutDimension, resources.getDimensionPixelSize(C0404d.abc_action_bar_stacked_max_height));
        }
        obtainStyledAttributes.recycle();
        return layoutDimension;
    }

    public boolean m2229f() {
        return this.f1427a.getApplicationInfo().targetSdkVersion < 14;
    }

    public int m2230g() {
        return this.f1427a.getResources().getDimensionPixelSize(C0404d.abc_action_bar_stacked_tab_max_width);
    }
}
