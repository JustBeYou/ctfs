package android.support.v4.p017h;

import android.view.View;
import android.view.ViewParent;

public class C0298j {
    private ViewParent f921a;
    private ViewParent f922b;
    private final View f923c;
    private boolean f924d;
    private int[] f925e;

    public C0298j(View view) {
        this.f923c = view;
    }

    private void m1301a(int i, ViewParent viewParent) {
        switch (i) {
            case 0:
                this.f921a = viewParent;
                return;
            case 1:
                this.f922b = viewParent;
                return;
            default:
                return;
        }
    }

    private ViewParent m1302d(int i) {
        switch (i) {
            case 0:
                return this.f921a;
            case 1:
                return this.f922b;
            default:
                return null;
        }
    }

    public void m1303a(boolean z) {
        if (this.f924d) {
            C0315p.m1396k(this.f923c);
        }
        this.f924d = z;
    }

    public boolean m1304a() {
        return this.f924d;
    }

    public boolean m1305a(float f, float f2) {
        if (!m1304a()) {
            return false;
        }
        ViewParent d = m1302d(0);
        return d != null ? C0319q.m1417a(d, this.f923c, f, f2) : false;
    }

    public boolean m1306a(float f, float f2, boolean z) {
        if (!m1304a()) {
            return false;
        }
        ViewParent d = m1302d(0);
        return d != null ? C0319q.m1418a(d, this.f923c, f, f2, z) : false;
    }

    public boolean m1307a(int i) {
        return m1302d(i) != null;
    }

    public boolean m1308a(int i, int i2) {
        if (m1307a(i2)) {
            return true;
        }
        if (m1304a()) {
            View view = this.f923c;
            for (ViewParent parent = this.f923c.getParent(); parent != null; parent = parent.getParent()) {
                if (C0319q.m1419a(parent, view, this.f923c, i, i2)) {
                    m1301a(i2, parent);
                    C0319q.m1420b(parent, view, this.f923c, i, i2);
                    return true;
                }
                if (parent instanceof View) {
                    view = (View) parent;
                }
            }
        }
        return false;
    }

    public boolean m1309a(int i, int i2, int i3, int i4, int[] iArr) {
        return m1310a(i, i2, i3, i4, iArr, 0);
    }

    public boolean m1310a(int i, int i2, int i3, int i4, int[] iArr, int i5) {
        if (m1304a()) {
            ViewParent d = m1302d(i5);
            if (d == null) {
                return false;
            }
            if (i != 0 || i2 != 0 || i3 != 0 || i4 != 0) {
                int i6;
                int i7;
                if (iArr != null) {
                    this.f923c.getLocationInWindow(iArr);
                    int i8 = iArr[0];
                    i6 = iArr[1];
                    i7 = i8;
                } else {
                    i6 = 0;
                    i7 = 0;
                }
                C0319q.m1415a(d, this.f923c, i, i2, i3, i4, i5);
                if (iArr != null) {
                    this.f923c.getLocationInWindow(iArr);
                    iArr[0] = iArr[0] - i7;
                    iArr[1] = iArr[1] - i6;
                }
                return true;
            } else if (iArr != null) {
                iArr[0] = 0;
                iArr[1] = 0;
            }
        }
        return false;
    }

    public boolean m1311a(int i, int i2, int[] iArr, int[] iArr2) {
        return m1312a(i, i2, iArr, iArr2, 0);
    }

    public boolean m1312a(int i, int i2, int[] iArr, int[] iArr2, int i3) {
        if (!m1304a()) {
            return false;
        }
        ViewParent d = m1302d(i3);
        if (d == null) {
            return false;
        }
        if (i != 0 || i2 != 0) {
            int i4;
            int i5;
            int[] iArr3;
            if (iArr2 != null) {
                this.f923c.getLocationInWindow(iArr2);
                int i6 = iArr2[0];
                i4 = iArr2[1];
                i5 = i6;
            } else {
                i4 = 0;
                i5 = 0;
            }
            if (iArr == null) {
                if (this.f925e == null) {
                    this.f925e = new int[2];
                }
                iArr3 = this.f925e;
            } else {
                iArr3 = iArr;
            }
            iArr3[0] = 0;
            iArr3[1] = 0;
            C0319q.m1416a(d, this.f923c, i, i2, iArr3, i3);
            if (iArr2 != null) {
                this.f923c.getLocationInWindow(iArr2);
                iArr2[0] = iArr2[0] - i5;
                iArr2[1] = iArr2[1] - i4;
            }
            boolean z = (iArr3[0] == 0 && iArr3[1] == 0) ? false : true;
            return z;
        } else if (iArr2 == null) {
            return false;
        } else {
            iArr2[0] = 0;
            iArr2[1] = 0;
            return false;
        }
    }

    public boolean m1313b() {
        return m1307a(0);
    }

    public boolean m1314b(int i) {
        return m1308a(i, 0);
    }

    public void m1315c() {
        m1316c(0);
    }

    public void m1316c(int i) {
        ViewParent d = m1302d(i);
        if (d != null) {
            C0319q.m1414a(d, this.f923c, i);
            m1301a(i, null);
        }
    }
}
