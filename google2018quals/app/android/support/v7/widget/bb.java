package android.support.v7.widget;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.support.v7.app.C0434e;
import java.lang.ref.WeakReference;

public class bb extends Resources {
    private final WeakReference<Context> f2177a;

    public bb(Context context, Resources resources) {
        super(resources.getAssets(), resources.getDisplayMetrics(), resources.getConfiguration());
        this.f2177a = new WeakReference(context);
    }

    public static boolean m3032a() {
        return C0434e.m1931k() && VERSION.SDK_INT <= 20;
    }

    final Drawable m3033a(int i) {
        return super.getDrawable(i);
    }

    public Drawable getDrawable(int i) {
        Context context = (Context) this.f2177a.get();
        return context != null ? C0623l.m3126a().m3147a(context, this, i) : super.getDrawable(i);
    }
}
