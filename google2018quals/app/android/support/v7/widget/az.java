package android.support.v7.widget;

import android.support.v4.p017h.C0315p;
import android.text.TextUtils;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnAttachStateChangeListener;
import android.view.View.OnHoverListener;
import android.view.View.OnLongClickListener;
import android.view.ViewConfiguration;
import android.view.accessibility.AccessibilityManager;

class az implements OnAttachStateChangeListener, OnHoverListener, OnLongClickListener {
    private static az f2160i;
    private final View f2161a;
    private final CharSequence f2162b;
    private final Runnable f2163c = new C05951(this);
    private final Runnable f2164d = new C05962(this);
    private int f2165e;
    private int f2166f;
    private ba f2167g;
    private boolean f2168h;

    class C05951 implements Runnable {
        final /* synthetic */ az f2158a;

        C05951(az azVar) {
            this.f2158a = azVar;
        }

        public void run() {
            this.f2158a.m3026a(false);
        }
    }

    class C05962 implements Runnable {
        final /* synthetic */ az f2159a;

        C05962(az azVar) {
            this.f2159a = azVar;
        }

        public void run() {
            this.f2159a.m3022a();
        }
    }

    private az(View view, CharSequence charSequence) {
        this.f2161a = view;
        this.f2162b = charSequence;
        this.f2161a.setOnLongClickListener(this);
        this.f2161a.setOnHoverListener(this);
    }

    private void m3022a() {
        if (f2160i == this) {
            f2160i = null;
            if (this.f2167g != null) {
                this.f2167g.m3029a();
                this.f2167g = null;
                this.f2161a.removeOnAttachStateChangeListener(this);
            } else {
                Log.e("TooltipCompatHandler", "sActiveHandler.mPopup == null");
            }
        }
        this.f2161a.removeCallbacks(this.f2163c);
        this.f2161a.removeCallbacks(this.f2164d);
    }

    public static void m3025a(View view, CharSequence charSequence) {
        if (TextUtils.isEmpty(charSequence)) {
            if (f2160i != null && f2160i.f2161a == view) {
                f2160i.m3022a();
            }
            view.setOnLongClickListener(null);
            view.setLongClickable(false);
            view.setOnHoverListener(null);
            return;
        }
        az azVar = new az(view, charSequence);
    }

    private void m3026a(boolean z) {
        if (C0315p.m1398m(this.f2161a)) {
            if (f2160i != null) {
                f2160i.m3022a();
            }
            f2160i = this;
            this.f2168h = z;
            this.f2167g = new ba(this.f2161a.getContext());
            this.f2167g.m3030a(this.f2161a, this.f2165e, this.f2166f, this.f2168h, this.f2162b);
            this.f2161a.addOnAttachStateChangeListener(this);
            long longPressTimeout = this.f2168h ? 2500 : (C0315p.m1391f(this.f2161a) & 1) == 1 ? 3000 - ((long) ViewConfiguration.getLongPressTimeout()) : 15000 - ((long) ViewConfiguration.getLongPressTimeout());
            this.f2161a.removeCallbacks(this.f2164d);
            this.f2161a.postDelayed(this.f2164d, longPressTimeout);
        }
    }

    public boolean onHover(View view, MotionEvent motionEvent) {
        if (this.f2167g == null || !this.f2168h) {
            AccessibilityManager accessibilityManager = (AccessibilityManager) this.f2161a.getContext().getSystemService("accessibility");
            if (!(accessibilityManager.isEnabled() && accessibilityManager.isTouchExplorationEnabled())) {
                switch (motionEvent.getAction()) {
                    case 7:
                        if (this.f2161a.isEnabled() && this.f2167g == null) {
                            this.f2165e = (int) motionEvent.getX();
                            this.f2166f = (int) motionEvent.getY();
                            this.f2161a.removeCallbacks(this.f2163c);
                            this.f2161a.postDelayed(this.f2163c, (long) ViewConfiguration.getLongPressTimeout());
                            break;
                        }
                    case 10:
                        m3022a();
                        break;
                    default:
                        break;
                }
            }
        }
        return false;
    }

    public boolean onLongClick(View view) {
        this.f2165e = view.getWidth() / 2;
        this.f2166f = view.getHeight() / 2;
        m3026a(true);
        return true;
    }

    public void onViewAttachedToWindow(View view) {
    }

    public void onViewDetachedFromWindow(View view) {
        m3022a();
    }
}
