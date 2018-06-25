package android.support.v4.p017h;

import android.os.Build.VERSION;
import android.util.Log;
import android.view.View;
import android.view.ViewParent;

public final class C0319q {
    static final C0316c f936a;

    static class C0316c {
        C0316c() {
        }

        public void mo148a(ViewParent viewParent, View view) {
            if (viewParent instanceof C0299k) {
                ((C0299k) viewParent).onStopNestedScroll(view);
            }
        }

        public void mo149a(ViewParent viewParent, View view, int i, int i2, int i3, int i4) {
            if (viewParent instanceof C0299k) {
                ((C0299k) viewParent).onNestedScroll(view, i, i2, i3, i4);
            }
        }

        public void mo150a(ViewParent viewParent, View view, int i, int i2, int[] iArr) {
            if (viewParent instanceof C0299k) {
                ((C0299k) viewParent).onNestedPreScroll(view, i, i2, iArr);
            }
        }

        public boolean mo151a(ViewParent viewParent, View view, float f, float f2) {
            return viewParent instanceof C0299k ? ((C0299k) viewParent).onNestedPreFling(view, f, f2) : false;
        }

        public boolean mo152a(ViewParent viewParent, View view, float f, float f2, boolean z) {
            return viewParent instanceof C0299k ? ((C0299k) viewParent).onNestedFling(view, f, f2, z) : false;
        }

        public boolean mo153a(ViewParent viewParent, View view, View view2, int i) {
            return viewParent instanceof C0299k ? ((C0299k) viewParent).onStartNestedScroll(view, view2, i) : false;
        }

        public void mo154b(ViewParent viewParent, View view, View view2, int i) {
            if (viewParent instanceof C0299k) {
                ((C0299k) viewParent).onNestedScrollAccepted(view, view2, i);
            }
        }
    }

    static class C0317a extends C0316c {
        C0317a() {
        }
    }

    static class C0318b extends C0317a {
        C0318b() {
        }

        public void mo148a(ViewParent viewParent, View view) {
            try {
                viewParent.onStopNestedScroll(view);
            } catch (Throwable e) {
                Log.e("ViewParentCompat", "ViewParent " + viewParent + " does not implement interface " + "method onStopNestedScroll", e);
            }
        }

        public void mo149a(ViewParent viewParent, View view, int i, int i2, int i3, int i4) {
            try {
                viewParent.onNestedScroll(view, i, i2, i3, i4);
            } catch (Throwable e) {
                Log.e("ViewParentCompat", "ViewParent " + viewParent + " does not implement interface " + "method onNestedScroll", e);
            }
        }

        public void mo150a(ViewParent viewParent, View view, int i, int i2, int[] iArr) {
            try {
                viewParent.onNestedPreScroll(view, i, i2, iArr);
            } catch (Throwable e) {
                Log.e("ViewParentCompat", "ViewParent " + viewParent + " does not implement interface " + "method onNestedPreScroll", e);
            }
        }

        public boolean mo151a(ViewParent viewParent, View view, float f, float f2) {
            try {
                return viewParent.onNestedPreFling(view, f, f2);
            } catch (Throwable e) {
                Log.e("ViewParentCompat", "ViewParent " + viewParent + " does not implement interface " + "method onNestedPreFling", e);
                return false;
            }
        }

        public boolean mo152a(ViewParent viewParent, View view, float f, float f2, boolean z) {
            try {
                return viewParent.onNestedFling(view, f, f2, z);
            } catch (Throwable e) {
                Log.e("ViewParentCompat", "ViewParent " + viewParent + " does not implement interface " + "method onNestedFling", e);
                return false;
            }
        }

        public boolean mo153a(ViewParent viewParent, View view, View view2, int i) {
            try {
                return viewParent.onStartNestedScroll(view, view2, i);
            } catch (Throwable e) {
                Log.e("ViewParentCompat", "ViewParent " + viewParent + " does not implement interface " + "method onStartNestedScroll", e);
                return false;
            }
        }

        public void mo154b(ViewParent viewParent, View view, View view2, int i) {
            try {
                viewParent.onNestedScrollAccepted(view, view2, i);
            } catch (Throwable e) {
                Log.e("ViewParentCompat", "ViewParent " + viewParent + " does not implement interface " + "method onNestedScrollAccepted", e);
            }
        }
    }

    static {
        if (VERSION.SDK_INT >= 21) {
            f936a = new C0318b();
        } else if (VERSION.SDK_INT >= 19) {
            f936a = new C0317a();
        } else {
            f936a = new C0316c();
        }
    }

    public static void m1414a(ViewParent viewParent, View view, int i) {
        if (viewParent instanceof C0300l) {
            ((C0300l) viewParent).m1317a(view, i);
        } else if (i == 0) {
            f936a.mo148a(viewParent, view);
        }
    }

    public static void m1415a(ViewParent viewParent, View view, int i, int i2, int i3, int i4, int i5) {
        if (viewParent instanceof C0300l) {
            ((C0300l) viewParent).m1318a(view, i, i2, i3, i4, i5);
        } else if (i5 == 0) {
            f936a.mo149a(viewParent, view, i, i2, i3, i4);
        }
    }

    public static void m1416a(ViewParent viewParent, View view, int i, int i2, int[] iArr, int i3) {
        if (viewParent instanceof C0300l) {
            ((C0300l) viewParent).m1319a(view, i, i2, iArr, i3);
        } else if (i3 == 0) {
            f936a.mo150a(viewParent, view, i, i2, iArr);
        }
    }

    public static boolean m1417a(ViewParent viewParent, View view, float f, float f2) {
        return f936a.mo151a(viewParent, view, f, f2);
    }

    public static boolean m1418a(ViewParent viewParent, View view, float f, float f2, boolean z) {
        return f936a.mo152a(viewParent, view, f, f2, z);
    }

    public static boolean m1419a(ViewParent viewParent, View view, View view2, int i, int i2) {
        return viewParent instanceof C0300l ? ((C0300l) viewParent).m1320a(view, view2, i, i2) : i2 == 0 ? f936a.mo153a(viewParent, view, view2, i) : false;
    }

    public static void m1420b(ViewParent viewParent, View view, View view2, int i, int i2) {
        if (viewParent instanceof C0300l) {
            ((C0300l) viewParent).m1321b(view, view2, i, i2);
        } else if (i2 == 0) {
            f936a.mo154b(viewParent, view, view2, i);
        }
    }
}
