package android.support.v4.p017h.p018a;

import android.os.Bundle;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import java.util.List;

class C0270d {

    interface C0263a {
        Object mo109a(int i);

        List<Object> mo110a(String str, int i);

        boolean mo111a(int i, int i2, Bundle bundle);

        Object mo112b(int i);
    }

    public static Object m1233a(final C0263a c0263a) {
        return new AccessibilityNodeProvider() {
            public AccessibilityNodeInfo createAccessibilityNodeInfo(int i) {
                return (AccessibilityNodeInfo) c0263a.mo109a(i);
            }

            public List<AccessibilityNodeInfo> findAccessibilityNodeInfosByText(String str, int i) {
                return c0263a.mo110a(str, i);
            }

            public AccessibilityNodeInfo findFocus(int i) {
                return (AccessibilityNodeInfo) c0263a.mo112b(i);
            }

            public boolean performAction(int i, int i2, Bundle bundle) {
                return c0263a.mo111a(i, i2, bundle);
            }
        };
    }
}
