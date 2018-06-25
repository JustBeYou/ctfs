package android.support.v4.widget;

import android.content.res.Resources;
import android.os.SystemClock;
import android.support.v4.p017h.C0315p;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewConfiguration;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;

public abstract class C0374a implements OnTouchListener {
    private static final int f1074r = ViewConfiguration.getTapTimeout();
    final C0372a f1075a = new C0372a();
    final View f1076b;
    boolean f1077c;
    boolean f1078d;
    boolean f1079e;
    private final Interpolator f1080f = new AccelerateInterpolator();
    private Runnable f1081g;
    private float[] f1082h = new float[]{0.0f, 0.0f};
    private float[] f1083i = new float[]{Float.MAX_VALUE, Float.MAX_VALUE};
    private int f1084j;
    private int f1085k;
    private float[] f1086l = new float[]{0.0f, 0.0f};
    private float[] f1087m = new float[]{0.0f, 0.0f};
    private float[] f1088n = new float[]{Float.MAX_VALUE, Float.MAX_VALUE};
    private boolean f1089o;
    private boolean f1090p;
    private boolean f1091q;

    private static class C0372a {
        private int f1062a;
        private int f1063b;
        private float f1064c;
        private float f1065d;
        private long f1066e = Long.MIN_VALUE;
        private long f1067f = 0;
        private int f1068g = 0;
        private int f1069h = 0;
        private long f1070i = -1;
        private float f1071j;
        private int f1072k;

        C0372a() {
        }

        private float m1750a(float f) {
            return ((-4.0f * f) * f) + (4.0f * f);
        }

        private float m1751a(long j) {
            if (j < this.f1066e) {
                return 0.0f;
            }
            if (this.f1070i < 0 || j < this.f1070i) {
                return C0374a.m1763a(((float) (j - this.f1066e)) / ((float) this.f1062a), 0.0f, 1.0f) * 0.5f;
            }
            long j2 = j - this.f1070i;
            return (C0374a.m1763a(((float) j2) / ((float) this.f1072k), 0.0f, 1.0f) * this.f1071j) + (1.0f - this.f1071j);
        }

        public void m1752a() {
            this.f1066e = AnimationUtils.currentAnimationTimeMillis();
            this.f1070i = -1;
            this.f1067f = this.f1066e;
            this.f1071j = 0.5f;
            this.f1068g = 0;
            this.f1069h = 0;
        }

        public void m1753a(float f, float f2) {
            this.f1064c = f;
            this.f1065d = f2;
        }

        public void m1754a(int i) {
            this.f1062a = i;
        }

        public void m1755b() {
            long currentAnimationTimeMillis = AnimationUtils.currentAnimationTimeMillis();
            this.f1072k = C0374a.m1766a((int) (currentAnimationTimeMillis - this.f1066e), 0, this.f1063b);
            this.f1071j = m1751a(currentAnimationTimeMillis);
            this.f1070i = currentAnimationTimeMillis;
        }

        public void m1756b(int i) {
            this.f1063b = i;
        }

        public boolean m1757c() {
            return this.f1070i > 0 && AnimationUtils.currentAnimationTimeMillis() > this.f1070i + ((long) this.f1072k);
        }

        public void m1758d() {
            if (this.f1067f == 0) {
                throw new RuntimeException("Cannot compute scroll delta before calling start()");
            }
            long currentAnimationTimeMillis = AnimationUtils.currentAnimationTimeMillis();
            float a = m1750a(m1751a(currentAnimationTimeMillis));
            long j = currentAnimationTimeMillis - this.f1067f;
            this.f1067f = currentAnimationTimeMillis;
            this.f1068g = (int) ((((float) j) * a) * this.f1064c);
            this.f1069h = (int) ((((float) j) * a) * this.f1065d);
        }

        public int m1759e() {
            return (int) (this.f1064c / Math.abs(this.f1064c));
        }

        public int m1760f() {
            return (int) (this.f1065d / Math.abs(this.f1065d));
        }

        public int m1761g() {
            return this.f1068g;
        }

        public int m1762h() {
            return this.f1069h;
        }
    }

    private class C0373b implements Runnable {
        final /* synthetic */ C0374a f1073a;

        C0373b(C0374a c0374a) {
            this.f1073a = c0374a;
        }

        public void run() {
            if (this.f1073a.f1079e) {
                if (this.f1073a.f1077c) {
                    this.f1073a.f1077c = false;
                    this.f1073a.f1075a.m1752a();
                }
                C0372a c0372a = this.f1073a.f1075a;
                if (c0372a.m1757c() || !this.f1073a.m1774a()) {
                    this.f1073a.f1079e = false;
                    return;
                }
                if (this.f1073a.f1078d) {
                    this.f1073a.f1078d = false;
                    this.f1073a.m1777b();
                }
                c0372a.m1758d();
                this.f1073a.mo251a(c0372a.m1761g(), c0372a.m1762h());
                C0315p.m1385a(this.f1073a.f1076b, (Runnable) this);
            }
        }
    }

    public C0374a(View view) {
        this.f1076b = view;
        DisplayMetrics displayMetrics = Resources.getSystem().getDisplayMetrics();
        int i = (int) ((1575.0f * displayMetrics.density) + 0.5f);
        int i2 = (int) ((displayMetrics.density * 315.0f) + 0.5f);
        m1770a((float) i, (float) i);
        m1775b((float) i2, (float) i2);
        m1771a(1);
        m1782e(Float.MAX_VALUE, Float.MAX_VALUE);
        m1780d(0.2f, 0.2f);
        m1778c(1.0f, 1.0f);
        m1776b(f1074r);
        m1779c(500);
        m1781d(500);
    }

    static float m1763a(float f, float f2, float f3) {
        return f > f3 ? f3 : f < f2 ? f2 : f;
    }

    private float m1764a(float f, float f2, float f3, float f4) {
        float f5;
        float a = C0374a.m1763a(f * f2, 0.0f, f3);
        a = m1769f(f2 - f4, a) - m1769f(f4, a);
        if (a < 0.0f) {
            f5 = -this.f1080f.getInterpolation(-a);
        } else if (a <= 0.0f) {
            return 0.0f;
        } else {
            f5 = this.f1080f.getInterpolation(a);
        }
        return C0374a.m1763a(f5, -1.0f, 1.0f);
    }

    private float m1765a(int i, float f, float f2, float f3) {
        float a = m1764a(this.f1082h[i], f2, this.f1083i[i], f);
        if (a == 0.0f) {
            return 0.0f;
        }
        float f4 = this.f1086l[i];
        float f5 = this.f1087m[i];
        float f6 = this.f1088n[i];
        f4 *= f3;
        return a > 0.0f ? C0374a.m1763a(a * f4, f5, f6) : -C0374a.m1763a((-a) * f4, f5, f6);
    }

    static int m1766a(int i, int i2, int i3) {
        return i > i3 ? i3 : i < i2 ? i2 : i;
    }

    private void m1767c() {
        if (this.f1081g == null) {
            this.f1081g = new C0373b(this);
        }
        this.f1079e = true;
        this.f1077c = true;
        if (this.f1089o || this.f1085k <= 0) {
            this.f1081g.run();
        } else {
            C0315p.m1386a(this.f1076b, this.f1081g, (long) this.f1085k);
        }
        this.f1089o = true;
    }

    private void m1768d() {
        if (this.f1077c) {
            this.f1079e = false;
        } else {
            this.f1075a.m1755b();
        }
    }

    private float m1769f(float f, float f2) {
        if (f2 == 0.0f) {
            return 0.0f;
        }
        switch (this.f1084j) {
            case 0:
            case 1:
                return f < f2 ? f >= 0.0f ? 1.0f - (f / f2) : (this.f1079e && this.f1084j == 1) ? 1.0f : 0.0f : 0.0f;
            case 2:
                return f < 0.0f ? f / (-f2) : 0.0f;
            default:
                return 0.0f;
        }
    }

    public C0374a m1770a(float f, float f2) {
        this.f1088n[0] = f / 1000.0f;
        this.f1088n[1] = f2 / 1000.0f;
        return this;
    }

    public C0374a m1771a(int i) {
        this.f1084j = i;
        return this;
    }

    public C0374a m1772a(boolean z) {
        if (this.f1090p && !z) {
            m1768d();
        }
        this.f1090p = z;
        return this;
    }

    public abstract void mo251a(int i, int i2);

    boolean m1774a() {
        C0372a c0372a = this.f1075a;
        int f = c0372a.m1760f();
        int e = c0372a.m1759e();
        return (f != 0 && mo253f(f)) || (e != 0 && mo252e(e));
    }

    public C0374a m1775b(float f, float f2) {
        this.f1087m[0] = f / 1000.0f;
        this.f1087m[1] = f2 / 1000.0f;
        return this;
    }

    public C0374a m1776b(int i) {
        this.f1085k = i;
        return this;
    }

    void m1777b() {
        long uptimeMillis = SystemClock.uptimeMillis();
        MotionEvent obtain = MotionEvent.obtain(uptimeMillis, uptimeMillis, 3, 0.0f, 0.0f, 0);
        this.f1076b.onTouchEvent(obtain);
        obtain.recycle();
    }

    public C0374a m1778c(float f, float f2) {
        this.f1086l[0] = f / 1000.0f;
        this.f1086l[1] = f2 / 1000.0f;
        return this;
    }

    public C0374a m1779c(int i) {
        this.f1075a.m1754a(i);
        return this;
    }

    public C0374a m1780d(float f, float f2) {
        this.f1082h[0] = f;
        this.f1082h[1] = f2;
        return this;
    }

    public C0374a m1781d(int i) {
        this.f1075a.m1756b(i);
        return this;
    }

    public C0374a m1782e(float f, float f2) {
        this.f1083i[0] = f;
        this.f1083i[1] = f2;
        return this;
    }

    public abstract boolean mo252e(int i);

    public abstract boolean mo253f(int i);

    public boolean onTouch(View view, MotionEvent motionEvent) {
        boolean z = true;
        if (!this.f1090p) {
            return false;
        }
        switch (motionEvent.getActionMasked()) {
            case 0:
                this.f1078d = true;
                this.f1089o = false;
                break;
            case 1:
            case 3:
                m1768d();
                break;
            case 2:
                break;
        }
        this.f1075a.m1753a(m1765a(0, motionEvent.getX(), (float) view.getWidth(), (float) this.f1076b.getWidth()), m1765a(1, motionEvent.getY(), (float) view.getHeight(), (float) this.f1076b.getHeight()));
        if (!this.f1079e && m1774a()) {
            m1767c();
        }
        if (!(this.f1091q && this.f1079e)) {
            z = false;
        }
        return z;
    }
}
