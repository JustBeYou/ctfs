package android.support.constraint.p007a.p008a;

import android.support.constraint.p007a.C0067c;
import android.support.constraint.p007a.C0074g;
import android.support.constraint.p007a.C0074g.C0073a;
import java.util.HashSet;

public class C0053a {
    final C0056b f269a;
    final C0052c f270b;
    C0053a f271c;
    public int f272d = 0;
    int f273e = -1;
    C0074g f274f;
    int f275g = Integer.MAX_VALUE;
    private C0051b f276h = C0051b.NONE;
    private C0050a f277i = C0050a.RELAXED;
    private int f278j = 0;

    public enum C0050a {
        RELAXED,
        STRICT
    }

    public enum C0051b {
        NONE,
        STRONG,
        WEAK
    }

    public enum C0052c {
        NONE,
        LEFT,
        TOP,
        RIGHT,
        BOTTOM,
        BASELINE,
        CENTER,
        CENTER_X,
        CENTER_Y
    }

    public C0053a(C0056b c0056b, C0052c c0052c) {
        this.f269a = c0056b;
        this.f270b = c0052c;
    }

    private String m132a(HashSet<C0053a> hashSet) {
        if (!hashSet.add(this)) {
            return "<-";
        }
        return this.f269a.m182e() + ":" + this.f270b.toString() + (this.f271c != null ? " connected to " + this.f271c.m132a((HashSet) hashSet) : "");
    }

    public C0074g m133a() {
        return this.f274f;
    }

    public void m134a(C0050a c0050a) {
        this.f277i = c0050a;
    }

    public void m135a(C0067c c0067c) {
        if (this.f274f == null) {
            this.f274f = new C0074g(C0073a.UNRESTRICTED);
        } else {
            this.f274f.m339c();
        }
    }

    public boolean m136a(C0053a c0053a) {
        boolean z = true;
        if (c0053a == null) {
            return false;
        }
        C0052c c = c0053a.m140c();
        if (c == this.f270b) {
            return this.f270b != C0052c.CENTER ? this.f270b != C0052c.BASELINE || (c0053a.m139b().m207v() && m139b().m207v()) : false;
        } else {
            boolean z2;
            switch (this.f270b) {
                case CENTER:
                    if (c == C0052c.BASELINE || c == C0052c.CENTER_X || c == C0052c.CENTER_Y) {
                        z = false;
                    }
                    return z;
                case LEFT:
                case RIGHT:
                    z2 = c == C0052c.LEFT || c == C0052c.RIGHT;
                    if (c0053a.m139b() instanceof C0060d) {
                        return z2 || c == C0052c.CENTER_X;
                    }
                    break;
                case TOP:
                case BOTTOM:
                    z2 = c == C0052c.TOP || c == C0052c.BOTTOM;
                    if (c0053a.m139b() instanceof C0060d) {
                        return z2 || c == C0052c.CENTER_Y;
                    }
                    break;
                default:
                    return false;
            }
            return z2;
        }
    }

    public boolean m137a(C0053a c0053a, int i, int i2, C0051b c0051b, int i3, boolean z) {
        if (c0053a == null) {
            this.f271c = null;
            this.f272d = 0;
            this.f273e = -1;
            this.f276h = C0051b.NONE;
            this.f278j = 2;
            return true;
        } else if (!z && !m136a(c0053a)) {
            return false;
        } else {
            this.f271c = c0053a;
            if (i > 0) {
                this.f272d = i;
            } else {
                this.f272d = 0;
            }
            this.f273e = i2;
            this.f276h = c0051b;
            this.f278j = i3;
            return true;
        }
    }

    public boolean m138a(C0053a c0053a, int i, C0051b c0051b, int i2) {
        return m137a(c0053a, i, -1, c0051b, i2, false);
    }

    public C0056b m139b() {
        return this.f269a;
    }

    public C0052c m140c() {
        return this.f270b;
    }

    public int m141d() {
        return this.f269a.m178d() == 8 ? 0 : (this.f273e <= -1 || this.f271c == null || this.f271c.f269a.m178d() != 8) ? this.f272d : this.f273e;
    }

    public C0051b m142e() {
        return this.f276h;
    }

    public C0053a m143f() {
        return this.f271c;
    }

    public C0050a m144g() {
        return this.f277i;
    }

    public int m145h() {
        return this.f278j;
    }

    public void m146i() {
        this.f271c = null;
        this.f272d = 0;
        this.f273e = -1;
        this.f276h = C0051b.STRONG;
        this.f278j = 0;
        this.f277i = C0050a.RELAXED;
    }

    public boolean m147j() {
        return this.f271c != null;
    }

    public String toString() {
        return this.f269a.m182e() + ":" + this.f270b.toString() + (this.f271c != null ? " connected to " + this.f271c.m132a(new HashSet()) : "");
    }
}
