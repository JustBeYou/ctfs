package android.support.v7.widget;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.os.Build.VERSION;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

public class at extends ContextWrapper {
    private static final Object f2123a = new Object();
    private static ArrayList<WeakReference<at>> f2124b;
    private final Resources f2125c;
    private final Theme f2126d;

    private at(Context context) {
        super(context);
        if (bb.m3032a()) {
            this.f2125c = new bb(this, context.getResources());
            this.f2126d = this.f2125c.newTheme();
            this.f2126d.setTo(context.getTheme());
            return;
        }
        this.f2125c = new av(this, context.getResources());
        this.f2126d = null;
    }

    public static Context m2948a(Context context) {
        if (!m2949b(context)) {
            return context;
        }
        synchronized (f2123a) {
            Context context2;
            if (f2124b == null) {
                f2124b = new ArrayList();
            } else {
                int size;
                WeakReference weakReference;
                for (size = f2124b.size() - 1; size >= 0; size--) {
                    weakReference = (WeakReference) f2124b.get(size);
                    if (weakReference == null || weakReference.get() == null) {
                        f2124b.remove(size);
                    }
                }
                size = f2124b.size() - 1;
                while (size >= 0) {
                    weakReference = (WeakReference) f2124b.get(size);
                    context2 = weakReference != null ? (at) weakReference.get() : null;
                    if (context2 == null || context2.getBaseContext() != context) {
                        size--;
                    } else {
                        return context2;
                    }
                }
            }
            context2 = new at(context);
            f2124b.add(new WeakReference(context2));
            return context2;
        }
    }

    private static boolean m2949b(Context context) {
        return ((context instanceof at) || (context.getResources() instanceof av) || (context.getResources() instanceof bb)) ? false : VERSION.SDK_INT < 21 || bb.m3032a();
    }

    public AssetManager getAssets() {
        return this.f2125c.getAssets();
    }

    public Resources getResources() {
        return this.f2125c;
    }

    public Theme getTheme() {
        return this.f2126d == null ? super.getTheme() : this.f2126d;
    }

    public void setTheme(int i) {
        if (this.f2126d == null) {
            super.setTheme(i);
        } else {
            this.f2126d.applyStyle(i, true);
        }
    }
}
