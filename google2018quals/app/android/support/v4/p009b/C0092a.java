package android.support.v4.p009b;

import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.util.TypedValue;

public class C0092a {
    private static final Object f421a = new Object();
    private static TypedValue f422b;

    public static final Drawable m383a(Context context, int i) {
        if (VERSION.SDK_INT >= 21) {
            return context.getDrawable(i);
        }
        if (VERSION.SDK_INT >= 16) {
            return context.getResources().getDrawable(i);
        }
        int i2;
        synchronized (f421a) {
            if (f422b == null) {
                f422b = new TypedValue();
            }
            context.getResources().getValue(i, f422b, true);
            i2 = f422b.resourceId;
        }
        return context.getResources().getDrawable(i2);
    }

    public static boolean m384a(Context context, Intent[] intentArr, Bundle bundle) {
        if (VERSION.SDK_INT >= 16) {
            context.startActivities(intentArr, bundle);
        } else {
            context.startActivities(intentArr);
        }
        return true;
    }

    public static final ColorStateList m385b(Context context, int i) {
        return VERSION.SDK_INT >= 23 ? context.getColorStateList(i) : context.getResources().getColorStateList(i);
    }
}
