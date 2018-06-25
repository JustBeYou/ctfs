package android.support.v4.p017h.p018a;

import android.os.Bundle;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import java.util.List;

class C0268c {

    interface C0259a {
        Object mo105a(int i);

        List<Object> mo106a(String str, int i);

        boolean mo107a(int i, int i2, Bundle bundle);
    }

    public static Object m1232a(final C0259a c0259a) {
        return new AccessibilityNodeProvider() {
            public AccessibilityNodeInfo createAccessibilityNodeInfo(int i) {
                return (AccessibilityNodeInfo) c0259a.mo105a(i);
            }

            public List<AccessibilityNodeInfo> findAccessibilityNodeInfosByText(String str, int i) {
                return c0259a.mo106a(str, i);
            }

            public boolean performAction(int i, int i2, Bundle bundle) {
                return c0259a.mo107a(i, i2, bundle);
            }
        };
    }
}
