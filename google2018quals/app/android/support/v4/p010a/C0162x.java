package android.support.v4.p010a;

import android.view.View;
import android.view.View.OnAttachStateChangeListener;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnPreDrawListener;

class C0162x implements OnAttachStateChangeListener, OnPreDrawListener {
    private final View f714a;
    private ViewTreeObserver f715b;
    private final Runnable f716c;

    private C0162x(View view, Runnable runnable) {
        this.f714a = view;
        this.f715b = view.getViewTreeObserver();
        this.f716c = runnable;
    }

    public static C0162x m847a(View view, Runnable runnable) {
        C0162x c0162x = new C0162x(view, runnable);
        view.getViewTreeObserver().addOnPreDrawListener(c0162x);
        view.addOnAttachStateChangeListener(c0162x);
        return c0162x;
    }

    public void m848a() {
        if (this.f715b.isAlive()) {
            this.f715b.removeOnPreDrawListener(this);
        } else {
            this.f714a.getViewTreeObserver().removeOnPreDrawListener(this);
        }
        this.f714a.removeOnAttachStateChangeListener(this);
    }

    public boolean onPreDraw() {
        m848a();
        this.f716c.run();
        return true;
    }

    public void onViewAttachedToWindow(View view) {
        this.f715b = view.getViewTreeObserver();
    }

    public void onViewDetachedFromWindow(View view) {
        m848a();
    }
}
