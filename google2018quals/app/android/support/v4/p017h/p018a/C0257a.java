package android.support.v4.p017h.p018a;

import android.graphics.Rect;
import android.os.Build.VERSION;
import android.support.v7.p020a.C0411a.C0410j;
import android.view.accessibility.AccessibilityNodeInfo;

public class C0257a {
    static final C0248i f889a;
    public int f890b = -1;
    private final AccessibilityNodeInfo f891c;

    static class C0248i {
        C0248i() {
        }

        public String mo104a(AccessibilityNodeInfo accessibilityNodeInfo) {
            return null;
        }
    }

    static class C0249a extends C0248i {
        C0249a() {
        }
    }

    static class C0250b extends C0249a {
        C0250b() {
        }
    }

    static class C0251c extends C0250b {
        C0251c() {
        }

        public String mo104a(AccessibilityNodeInfo accessibilityNodeInfo) {
            return accessibilityNodeInfo.getViewIdResourceName();
        }
    }

    static class C0252d extends C0251c {
        C0252d() {
        }
    }

    static class C0253e extends C0252d {
        C0253e() {
        }
    }

    static class C0254f extends C0253e {
        C0254f() {
        }
    }

    static class C0255g extends C0254f {
        C0255g() {
        }
    }

    static class C0256h extends C0255g {
        C0256h() {
        }
    }

    static {
        if (VERSION.SDK_INT >= 24) {
            f889a = new C0256h();
        } else if (VERSION.SDK_INT >= 23) {
            f889a = new C0255g();
        } else if (VERSION.SDK_INT >= 22) {
            f889a = new C0254f();
        } else if (VERSION.SDK_INT >= 21) {
            f889a = new C0253e();
        } else if (VERSION.SDK_INT >= 19) {
            f889a = new C0252d();
        } else if (VERSION.SDK_INT >= 18) {
            f889a = new C0251c();
        } else if (VERSION.SDK_INT >= 17) {
            f889a = new C0250b();
        } else if (VERSION.SDK_INT >= 16) {
            f889a = new C0249a();
        } else {
            f889a = new C0248i();
        }
    }

    private C0257a(AccessibilityNodeInfo accessibilityNodeInfo) {
        this.f891c = accessibilityNodeInfo;
    }

    public static C0257a m1185a(AccessibilityNodeInfo accessibilityNodeInfo) {
        return new C0257a(accessibilityNodeInfo);
    }

    private static String m1186b(int i) {
        switch (i) {
            case 1:
                return "ACTION_FOCUS";
            case 2:
                return "ACTION_CLEAR_FOCUS";
            case 4:
                return "ACTION_SELECT";
            case 8:
                return "ACTION_CLEAR_SELECTION";
            case 16:
                return "ACTION_CLICK";
            case 32:
                return "ACTION_LONG_CLICK";
            case C0410j.AppCompatTheme_dropdownListPreferredItemHeight /*64*/:
                return "ACTION_ACCESSIBILITY_FOCUS";
            case 128:
                return "ACTION_CLEAR_ACCESSIBILITY_FOCUS";
            case 256:
                return "ACTION_NEXT_AT_MOVEMENT_GRANULARITY";
            case 512:
                return "ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY";
            case 1024:
                return "ACTION_NEXT_HTML_ELEMENT";
            case 2048:
                return "ACTION_PREVIOUS_HTML_ELEMENT";
            case 4096:
                return "ACTION_SCROLL_FORWARD";
            case 8192:
                return "ACTION_SCROLL_BACKWARD";
            case 16384:
                return "ACTION_COPY";
            case 32768:
                return "ACTION_PASTE";
            case 65536:
                return "ACTION_CUT";
            case 131072:
                return "ACTION_SET_SELECTION";
            default:
                return "ACTION_UNKNOWN";
        }
    }

    public AccessibilityNodeInfo m1187a() {
        return this.f891c;
    }

    public void m1188a(int i) {
        this.f891c.addAction(i);
    }

    public void m1189a(Rect rect) {
        this.f891c.getBoundsInParent(rect);
    }

    public void m1190a(CharSequence charSequence) {
        this.f891c.setClassName(charSequence);
    }

    public void m1191a(boolean z) {
        this.f891c.setScrollable(z);
    }

    public int m1192b() {
        return this.f891c.getActions();
    }

    public void m1193b(Rect rect) {
        this.f891c.getBoundsInScreen(rect);
    }

    public boolean m1194c() {
        return this.f891c.isCheckable();
    }

    public boolean m1195d() {
        return this.f891c.isChecked();
    }

    public boolean m1196e() {
        return this.f891c.isFocusable();
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        C0257a c0257a = (C0257a) obj;
        return this.f891c == null ? c0257a.f891c == null : this.f891c.equals(c0257a.f891c);
    }

    public boolean m1197f() {
        return this.f891c.isFocused();
    }

    public boolean m1198g() {
        return this.f891c.isSelected();
    }

    public boolean m1199h() {
        return this.f891c.isClickable();
    }

    public int hashCode() {
        return this.f891c == null ? 0 : this.f891c.hashCode();
    }

    public boolean m1200i() {
        return this.f891c.isLongClickable();
    }

    public boolean m1201j() {
        return this.f891c.isEnabled();
    }

    public boolean m1202k() {
        return this.f891c.isPassword();
    }

    public boolean m1203l() {
        return this.f891c.isScrollable();
    }

    public CharSequence m1204m() {
        return this.f891c.getPackageName();
    }

    public CharSequence m1205n() {
        return this.f891c.getClassName();
    }

    public CharSequence m1206o() {
        return this.f891c.getText();
    }

    public CharSequence m1207p() {
        return this.f891c.getContentDescription();
    }

    public String m1208q() {
        return f889a.mo104a(this.f891c);
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(super.toString());
        Rect rect = new Rect();
        m1189a(rect);
        stringBuilder.append("; boundsInParent: " + rect);
        m1193b(rect);
        stringBuilder.append("; boundsInScreen: " + rect);
        stringBuilder.append("; packageName: ").append(m1204m());
        stringBuilder.append("; className: ").append(m1205n());
        stringBuilder.append("; text: ").append(m1206o());
        stringBuilder.append("; contentDescription: ").append(m1207p());
        stringBuilder.append("; viewId: ").append(m1208q());
        stringBuilder.append("; checkable: ").append(m1194c());
        stringBuilder.append("; checked: ").append(m1195d());
        stringBuilder.append("; focusable: ").append(m1196e());
        stringBuilder.append("; focused: ").append(m1197f());
        stringBuilder.append("; selected: ").append(m1198g());
        stringBuilder.append("; clickable: ").append(m1199h());
        stringBuilder.append("; longClickable: ").append(m1200i());
        stringBuilder.append("; enabled: ").append(m1201j());
        stringBuilder.append("; password: ").append(m1202k());
        stringBuilder.append("; scrollable: " + m1203l());
        stringBuilder.append("; [");
        int b = m1192b();
        while (b != 0) {
            int numberOfTrailingZeros = 1 << Integer.numberOfTrailingZeros(b);
            b &= numberOfTrailingZeros ^ -1;
            stringBuilder.append(C0257a.m1186b(numberOfTrailingZeros));
            if (b != 0) {
                stringBuilder.append(", ");
            }
        }
        stringBuilder.append("]");
        return stringBuilder.toString();
    }
}
