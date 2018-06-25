package android.support.v7.widget;

import android.os.SystemClock;
import android.support.v7.view.menu.C0515s;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnAttachStateChangeListener;
import android.view.View.OnTouchListener;
import android.view.ViewConfiguration;
import android.view.ViewParent;

public abstract class ah implements OnAttachStateChangeListener, OnTouchListener {
    private final float f1496a;
    private final int f1497b;
    final View f1498c;
    private final int f1499d;
    private Runnable f1500e;
    private Runnable f1501f;
    private boolean f1502g;
    private int f1503h;
    private final int[] f1504i = new int[2];

    private class C0573a implements Runnable {
        final /* synthetic */ ah f2012a;

        C0573a(ah ahVar) {
            this.f2012a = ahVar;
        }

        public void run() {
            ViewParent parent = this.f2012a.f1498c.getParent();
            if (parent != null) {
                parent.requestDisallowInterceptTouchEvent(true);
            }
        }
    }

    private class C0574b implements Runnable {
        final /* synthetic */ ah f2013a;

        C0574b(ah ahVar) {
            this.f2013a = ahVar;
        }

        public void run() {
            this.f2013a.m2291d();
        }
    }

    public ah(View view) {
        this.f1498c = view;
        view.setLongClickable(true);
        view.addOnAttachStateChangeListener(this);
        this.f1496a = (float) ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
        this.f1497b = ViewConfiguration.getTapTimeout();
        this.f1499d = (this.f1497b + ViewConfiguration.getLongPressTimeout()) / 2;
    }

    private boolean m2282a(MotionEvent motionEvent) {
        View view = this.f1498c;
        if (!view.isEnabled()) {
            return false;
        }
        switch (motionEvent.getActionMasked()) {
            case 0:
                this.f1503h = motionEvent.getPointerId(0);
                if (this.f1500e == null) {
                    this.f1500e = new C0573a(this);
                }
                view.postDelayed(this.f1500e, (long) this.f1497b);
                if (this.f1501f == null) {
                    this.f1501f = new C0574b(this);
                }
                view.postDelayed(this.f1501f, (long) this.f1499d);
                return false;
            case 1:
            case 3:
                m2287e();
                return false;
            case 2:
                int findPointerIndex = motionEvent.findPointerIndex(this.f1503h);
                if (findPointerIndex < 0 || m2283a(view, motionEvent.getX(findPointerIndex), motionEvent.getY(findPointerIndex), this.f1496a)) {
                    return false;
                }
                m2287e();
                view.getParent().requestDisallowInterceptTouchEvent(true);
                return true;
            default:
                return false;
        }
    }

    private static boolean m2283a(View view, float f, float f2, float f3) {
        return f >= (-f3) && f2 >= (-f3) && f < ((float) (view.getRight() - view.getLeft())) + f3 && f2 < ((float) (view.getBottom() - view.getTop())) + f3;
    }

    private boolean m2284a(View view, MotionEvent motionEvent) {
        int[] iArr = this.f1504i;
        view.getLocationOnScreen(iArr);
        motionEvent.offsetLocation((float) (-iArr[0]), (float) (-iArr[1]));
        return true;
    }

    private boolean m2285b(MotionEvent motionEvent) {
        View view = this.f1498c;
        C0515s a = mo366a();
        if (a == null || !a.mo422d()) {
            return false;
        }
        af afVar = (af) a.mo423e();
        if (afVar == null || !afVar.isShown()) {
            return false;
        }
        MotionEvent obtainNoHistory = MotionEvent.obtainNoHistory(motionEvent);
        m2286b(view, obtainNoHistory);
        m2284a(afVar, obtainNoHistory);
        boolean a2 = afVar.mo483a(obtainNoHistory, this.f1503h);
        obtainNoHistory.recycle();
        int actionMasked = motionEvent.getActionMasked();
        boolean z = (actionMasked == 1 || actionMasked == 3) ? false : true;
        z = a2 && z;
        return z;
    }

    private boolean m2286b(View view, MotionEvent motionEvent) {
        int[] iArr = this.f1504i;
        view.getLocationOnScreen(iArr);
        motionEvent.offsetLocation((float) iArr[0], (float) iArr[1]);
        return true;
    }

    private void m2287e() {
        if (this.f1501f != null) {
            this.f1498c.removeCallbacks(this.f1501f);
        }
        if (this.f1500e != null) {
            this.f1498c.removeCallbacks(this.f1500e);
        }
    }

    public abstract C0515s mo366a();

    protected boolean mo367b() {
        C0515s a = mo366a();
        if (!(a == null || a.mo422d())) {
            a.mo412a();
        }
        return true;
    }

    protected boolean mo530c() {
        C0515s a = mo366a();
        if (a != null && a.mo422d()) {
            a.mo419c();
        }
        return true;
    }

    void m2291d() {
        m2287e();
        View view = this.f1498c;
        if (view.isEnabled() && !view.isLongClickable() && mo367b()) {
            view.getParent().requestDisallowInterceptTouchEvent(true);
            long uptimeMillis = SystemClock.uptimeMillis();
            MotionEvent obtain = MotionEvent.obtain(uptimeMillis, uptimeMillis, 3, 0.0f, 0.0f, 0);
            view.onTouchEvent(obtain);
            obtain.recycle();
            this.f1502g = true;
        }
    }

    public boolean onTouch(View view, MotionEvent motionEvent) {
        boolean z;
        boolean z2 = this.f1502g;
        if (z2) {
            z = m2285b(motionEvent) || !mo530c();
        } else {
            boolean z3 = m2282a(motionEvent) && mo367b();
            if (z3) {
                long uptimeMillis = SystemClock.uptimeMillis();
                MotionEvent obtain = MotionEvent.obtain(uptimeMillis, uptimeMillis, 3, 0.0f, 0.0f, 0);
                this.f1498c.onTouchEvent(obtain);
                obtain.recycle();
            }
            z = z3;
        }
        this.f1502g = z;
        return z || z2;
    }

    public void onViewAttachedToWindow(View view) {
    }

    public void onViewDetachedFromWindow(View view) {
        this.f1502g = false;
        this.f1503h = -1;
        if (this.f1500e != null) {
            this.f1498c.removeCallbacks(this.f1500e);
        }
    }
}
