package android.support.v4.p017h.p018a;

import android.os.Build.VERSION;
import android.view.accessibility.AccessibilityRecord;

public class C0274e {
    private static final C0271c f900a;
    private final AccessibilityRecord f901b;

    static class C0271c {
        C0271c() {
        }

        public void mo113a(AccessibilityRecord accessibilityRecord, int i) {
        }

        public void mo114b(AccessibilityRecord accessibilityRecord, int i) {
        }
    }

    static class C0272a extends C0271c {
        C0272a() {
        }

        public void mo113a(AccessibilityRecord accessibilityRecord, int i) {
            accessibilityRecord.setMaxScrollX(i);
        }

        public void mo114b(AccessibilityRecord accessibilityRecord, int i) {
            accessibilityRecord.setMaxScrollY(i);
        }
    }

    static class C0273b extends C0272a {
        C0273b() {
        }
    }

    static {
        if (VERSION.SDK_INT >= 16) {
            f900a = new C0273b();
        } else if (VERSION.SDK_INT >= 15) {
            f900a = new C0272a();
        } else {
            f900a = new C0271c();
        }
    }

    public static void m1238a(AccessibilityRecord accessibilityRecord, int i) {
        f900a.mo113a(accessibilityRecord, i);
    }

    public static void m1239b(AccessibilityRecord accessibilityRecord, int i) {
        f900a.mo114b(accessibilityRecord, i);
    }

    @Deprecated
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
        C0274e c0274e = (C0274e) obj;
        return this.f901b == null ? c0274e.f901b == null : this.f901b.equals(c0274e.f901b);
    }

    @Deprecated
    public int hashCode() {
        return this.f901b == null ? 0 : this.f901b.hashCode();
    }
}
