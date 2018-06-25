package android.support.v4.p017h;

import android.animation.ValueAnimator;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.view.View;
import android.view.View.OnApplyWindowInsetsListener;
import android.view.WindowInsets;
import java.lang.reflect.Field;
import java.util.WeakHashMap;

public class C0315p {
    static final C0304j f935a;

    static class C0304j {
        static boolean f928b = false;
        private static Field f929c;
        private static boolean f930d;
        private static WeakHashMap<View, String> f931e;
        WeakHashMap<View, C0324r> f932a = null;

        C0304j() {
        }

        long m1328a() {
            return ValueAnimator.getFrameDelay();
        }

        public C0327v mo138a(View view, C0327v c0327v) {
            return c0327v;
        }

        public void mo139a(View view, float f) {
        }

        public void mo147a(View view, int i, int i2) {
        }

        public void mo140a(View view, ColorStateList colorStateList) {
            if (view instanceof C0303o) {
                ((C0303o) view).setSupportBackgroundTintList(colorStateList);
            }
        }

        public void mo141a(View view, Mode mode) {
            if (view instanceof C0303o) {
                ((C0303o) view).setSupportBackgroundTintMode(mode);
            }
        }

        public void mo127a(View view, Drawable drawable) {
            view.setBackgroundDrawable(drawable);
        }

        public void m1335a(View view, C0283b c0283b) {
            view.setAccessibilityDelegate(c0283b == null ? null : c0283b.m1247a());
        }

        public void mo142a(View view, C0302n c0302n) {
        }

        public void mo128a(View view, Runnable runnable) {
            view.postDelayed(runnable, m1328a());
        }

        public void mo129a(View view, Runnable runnable, long j) {
            view.postDelayed(runnable, m1328a() + j);
        }

        public boolean mo126a(View view) {
            return false;
        }

        public void mo130b(View view) {
            view.postInvalidate();
        }

        public int mo131c(View view) {
            if (!f930d) {
                try {
                    f929c = View.class.getDeclaredField("mMinHeight");
                    f929c.setAccessible(true);
                } catch (NoSuchFieldException e) {
                }
                f930d = true;
            }
            if (f929c != null) {
                try {
                    return ((Integer) f929c.get(view)).intValue();
                } catch (Exception e2) {
                }
            }
            return 0;
        }

        public void mo132d(View view) {
        }

        public boolean mo133e(View view) {
            return true;
        }

        public int mo134f(View view) {
            return 0;
        }

        public int mo135g(View view) {
            return 0;
        }

        public boolean mo136h(View view) {
            return view.getWidth() > 0 && view.getHeight() > 0;
        }

        public boolean mo137i(View view) {
            return view.getWindowToken() != null;
        }

        public String mo143j(View view) {
            return f931e == null ? null : (String) f931e.get(view);
        }

        public void mo144k(View view) {
            if (view instanceof C0296h) {
                ((C0296h) view).stopNestedScroll();
            }
        }

        public ColorStateList mo145l(View view) {
            return view instanceof C0303o ? ((C0303o) view).getSupportBackgroundTintList() : null;
        }

        public Mode mo146m(View view) {
            return view instanceof C0303o ? ((C0303o) view).getSupportBackgroundTintMode() : null;
        }

        public C0324r m1352n(View view) {
            if (this.f932a == null) {
                this.f932a = new WeakHashMap();
            }
            C0324r c0324r = (C0324r) this.f932a.get(view);
            if (c0324r != null) {
                return c0324r;
            }
            c0324r = new C0324r(view);
            this.f932a.put(view, c0324r);
            return c0324r;
        }
    }

    static class C0305a extends C0304j {
        C0305a() {
        }

        public boolean mo126a(View view) {
            return view.hasOnClickListeners();
        }
    }

    static class C0306b extends C0305a {
        C0306b() {
        }

        public void mo127a(View view, Drawable drawable) {
            view.setBackground(drawable);
        }

        public void mo128a(View view, Runnable runnable) {
            view.postOnAnimation(runnable);
        }

        public void mo129a(View view, Runnable runnable, long j) {
            view.postOnAnimationDelayed(runnable, j);
        }

        public void mo130b(View view) {
            view.postInvalidateOnAnimation();
        }

        public int mo131c(View view) {
            return view.getMinimumHeight();
        }

        public void mo132d(View view) {
            view.requestFitSystemWindows();
        }

        public boolean mo133e(View view) {
            return view.hasOverlappingRendering();
        }
    }

    static class C0307c extends C0306b {
        C0307c() {
        }

        public int mo134f(View view) {
            return view.getLayoutDirection();
        }

        public int mo135g(View view) {
            return view.getWindowSystemUiVisibility();
        }
    }

    static class C0308d extends C0307c {
        C0308d() {
        }
    }

    static class C0309e extends C0308d {
        C0309e() {
        }

        public boolean mo136h(View view) {
            return view.isLaidOut();
        }

        public boolean mo137i(View view) {
            return view.isAttachedToWindow();
        }
    }

    static class C0311f extends C0309e {
        C0311f() {
        }

        public C0327v mo138a(View view, C0327v c0327v) {
            Object obj = (WindowInsets) C0327v.m1443a(c0327v);
            WindowInsets onApplyWindowInsets = view.onApplyWindowInsets(obj);
            if (onApplyWindowInsets != obj) {
                obj = new WindowInsets(onApplyWindowInsets);
            }
            return C0327v.m1442a(obj);
        }

        public void mo139a(View view, float f) {
            view.setElevation(f);
        }

        public void mo140a(View view, ColorStateList colorStateList) {
            view.setBackgroundTintList(colorStateList);
            if (VERSION.SDK_INT == 21) {
                Drawable background = view.getBackground();
                Object obj = (view.getBackgroundTintList() == null || view.getBackgroundTintMode() == null) ? null : 1;
                if (background != null && obj != null) {
                    if (background.isStateful()) {
                        background.setState(view.getDrawableState());
                    }
                    view.setBackground(background);
                }
            }
        }

        public void mo141a(View view, Mode mode) {
            view.setBackgroundTintMode(mode);
            if (VERSION.SDK_INT == 21) {
                Drawable background = view.getBackground();
                Object obj = (view.getBackgroundTintList() == null || view.getBackgroundTintMode() == null) ? null : 1;
                if (background != null && obj != null) {
                    if (background.isStateful()) {
                        background.setState(view.getDrawableState());
                    }
                    view.setBackground(background);
                }
            }
        }

        public void mo142a(View view, final C0302n c0302n) {
            if (c0302n == null) {
                view.setOnApplyWindowInsetsListener(null);
            } else {
                view.setOnApplyWindowInsetsListener(new OnApplyWindowInsetsListener(this) {
                    final /* synthetic */ C0311f f934b;

                    public WindowInsets onApplyWindowInsets(View view, WindowInsets windowInsets) {
                        return (WindowInsets) C0327v.m1443a(c0302n.mo317a(view, C0327v.m1442a((Object) windowInsets)));
                    }
                });
            }
        }

        public void mo132d(View view) {
            view.requestApplyInsets();
        }

        public String mo143j(View view) {
            return view.getTransitionName();
        }

        public void mo144k(View view) {
            view.stopNestedScroll();
        }

        public ColorStateList mo145l(View view) {
            return view.getBackgroundTintList();
        }

        public Mode mo146m(View view) {
            return view.getBackgroundTintMode();
        }
    }

    static class C0312g extends C0311f {
        C0312g() {
        }

        public void mo147a(View view, int i, int i2) {
            view.setScrollIndicators(i, i2);
        }
    }

    static class C0313h extends C0312g {
        C0313h() {
        }
    }

    static class C0314i extends C0313h {
        C0314i() {
        }
    }

    static {
        if (VERSION.SDK_INT >= 26) {
            f935a = new C0314i();
        } else if (VERSION.SDK_INT >= 24) {
            f935a = new C0313h();
        } else if (VERSION.SDK_INT >= 23) {
            f935a = new C0312g();
        } else if (VERSION.SDK_INT >= 21) {
            f935a = new C0311f();
        } else if (VERSION.SDK_INT >= 19) {
            f935a = new C0309e();
        } else if (VERSION.SDK_INT >= 18) {
            f935a = new C0308d();
        } else if (VERSION.SDK_INT >= 17) {
            f935a = new C0307c();
        } else if (VERSION.SDK_INT >= 16) {
            f935a = new C0306b();
        } else if (VERSION.SDK_INT >= 15) {
            f935a = new C0305a();
        } else {
            f935a = new C0304j();
        }
    }

    public static C0327v m1376a(View view, C0327v c0327v) {
        return f935a.mo138a(view, c0327v);
    }

    public static void m1377a(View view) {
        f935a.mo130b(view);
    }

    public static void m1378a(View view, float f) {
        f935a.mo139a(view, f);
    }

    public static void m1379a(View view, int i, int i2) {
        f935a.mo147a(view, i, i2);
    }

    public static void m1380a(View view, ColorStateList colorStateList) {
        f935a.mo140a(view, colorStateList);
    }

    public static void m1381a(View view, Mode mode) {
        f935a.mo141a(view, mode);
    }

    public static void m1382a(View view, Drawable drawable) {
        f935a.mo127a(view, drawable);
    }

    public static void m1383a(View view, C0283b c0283b) {
        f935a.m1335a(view, c0283b);
    }

    public static void m1384a(View view, C0302n c0302n) {
        f935a.mo142a(view, c0302n);
    }

    public static void m1385a(View view, Runnable runnable) {
        f935a.mo128a(view, runnable);
    }

    public static void m1386a(View view, Runnable runnable, long j) {
        f935a.mo129a(view, runnable, j);
    }

    public static int m1387b(View view) {
        return f935a.mo134f(view);
    }

    public static int m1388c(View view) {
        return f935a.mo131c(view);
    }

    public static C0324r m1389d(View view) {
        return f935a.m1352n(view);
    }

    public static String m1390e(View view) {
        return f935a.mo143j(view);
    }

    public static int m1391f(View view) {
        return f935a.mo135g(view);
    }

    public static void m1392g(View view) {
        f935a.mo132d(view);
    }

    public static boolean m1393h(View view) {
        return f935a.mo133e(view);
    }

    public static ColorStateList m1394i(View view) {
        return f935a.mo145l(view);
    }

    public static Mode m1395j(View view) {
        return f935a.mo146m(view);
    }

    public static void m1396k(View view) {
        f935a.mo144k(view);
    }

    public static boolean m1397l(View view) {
        return f935a.mo136h(view);
    }

    public static boolean m1398m(View view) {
        return f935a.mo137i(view);
    }

    public static boolean m1399n(View view) {
        return f935a.mo126a(view);
    }
}
