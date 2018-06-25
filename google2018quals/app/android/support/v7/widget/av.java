package android.support.v7.widget;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import java.lang.ref.WeakReference;

class av extends an {
    private final WeakReference<Context> f2131a;

    public av(Context context, Resources resources) {
        super(resources);
        this.f2131a = new WeakReference(context);
    }

    public Drawable getDrawable(int i) {
        Drawable drawable = super.getDrawable(i);
        Context context = (Context) this.f2131a.get();
        if (!(drawable == null || context == null)) {
            C0623l.m3126a();
            C0623l.m3132a(context, i, drawable);
        }
        return drawable;
    }
}
