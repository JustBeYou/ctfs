package android.support.v4.p017h;

import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.v4.p017h.p018a.C0257a;
import android.support.v4.p017h.p018a.C0266b;
import android.view.View;
import android.view.View.AccessibilityDelegate;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;

public class C0283b {
    private static final C0276b f911b;
    private static final AccessibilityDelegate f912c = new AccessibilityDelegate();
    final AccessibilityDelegate f913a = f911b.mo116a(this);

    static class C0276b {
        C0276b() {
        }

        public C0266b mo115a(AccessibilityDelegate accessibilityDelegate, View view) {
            return null;
        }

        public AccessibilityDelegate mo116a(final C0283b c0283b) {
            return new AccessibilityDelegate(this) {
                final /* synthetic */ C0276b f905b;

                public boolean dispatchPopulateAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
                    return c0283b.m1253b(view, accessibilityEvent);
                }

                public void onInitializeAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
                    c0283b.mo230d(view, accessibilityEvent);
                }

                public void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfo accessibilityNodeInfo) {
                    c0283b.mo228a(view, C0257a.m1185a(accessibilityNodeInfo));
                }

                public void onPopulateAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
                    c0283b.m1254c(view, accessibilityEvent);
                }

                public boolean onRequestSendAccessibilityEvent(ViewGroup viewGroup, View view, AccessibilityEvent accessibilityEvent) {
                    return c0283b.m1252a(viewGroup, view, accessibilityEvent);
                }

                public void sendAccessibilityEvent(View view, int i) {
                    c0283b.m1248a(view, i);
                }

                public void sendAccessibilityEventUnchecked(View view, AccessibilityEvent accessibilityEvent) {
                    c0283b.m1250a(view, accessibilityEvent);
                }
            };
        }

        public boolean mo117a(AccessibilityDelegate accessibilityDelegate, View view, int i, Bundle bundle) {
            return false;
        }
    }

    static class C0277a extends C0276b {
        C0277a() {
        }

        public C0266b mo115a(AccessibilityDelegate accessibilityDelegate, View view) {
            AccessibilityNodeProvider accessibilityNodeProvider = accessibilityDelegate.getAccessibilityNodeProvider(view);
            return accessibilityNodeProvider != null ? new C0266b(accessibilityNodeProvider) : null;
        }

        public AccessibilityDelegate mo116a(final C0283b c0283b) {
            return new AccessibilityDelegate(this) {
                final /* synthetic */ C0277a f903b;

                public boolean dispatchPopulateAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
                    return c0283b.m1253b(view, accessibilityEvent);
                }

                public AccessibilityNodeProvider getAccessibilityNodeProvider(View view) {
                    C0266b a = c0283b.m1246a(view);
                    return a != null ? (AccessibilityNodeProvider) a.m1228a() : null;
                }

                public void onInitializeAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
                    c0283b.mo230d(view, accessibilityEvent);
                }

                public void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfo accessibilityNodeInfo) {
                    c0283b.mo228a(view, C0257a.m1185a(accessibilityNodeInfo));
                }

                public void onPopulateAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
                    c0283b.m1254c(view, accessibilityEvent);
                }

                public boolean onRequestSendAccessibilityEvent(ViewGroup viewGroup, View view, AccessibilityEvent accessibilityEvent) {
                    return c0283b.m1252a(viewGroup, view, accessibilityEvent);
                }

                public boolean performAccessibilityAction(View view, int i, Bundle bundle) {
                    return c0283b.mo229a(view, i, bundle);
                }

                public void sendAccessibilityEvent(View view, int i) {
                    c0283b.m1248a(view, i);
                }

                public void sendAccessibilityEventUnchecked(View view, AccessibilityEvent accessibilityEvent) {
                    c0283b.m1250a(view, accessibilityEvent);
                }
            };
        }

        public boolean mo117a(AccessibilityDelegate accessibilityDelegate, View view, int i, Bundle bundle) {
            return accessibilityDelegate.performAccessibilityAction(view, i, bundle);
        }
    }

    static {
        if (VERSION.SDK_INT >= 16) {
            f911b = new C0277a();
        } else {
            f911b = new C0276b();
        }
    }

    public C0266b m1246a(View view) {
        return f911b.mo115a(f912c, view);
    }

    AccessibilityDelegate m1247a() {
        return this.f913a;
    }

    public void m1248a(View view, int i) {
        f912c.sendAccessibilityEvent(view, i);
    }

    public void mo228a(View view, C0257a c0257a) {
        f912c.onInitializeAccessibilityNodeInfo(view, c0257a.m1187a());
    }

    public void m1250a(View view, AccessibilityEvent accessibilityEvent) {
        f912c.sendAccessibilityEventUnchecked(view, accessibilityEvent);
    }

    public boolean mo229a(View view, int i, Bundle bundle) {
        return f911b.mo117a(f912c, view, i, bundle);
    }

    public boolean m1252a(ViewGroup viewGroup, View view, AccessibilityEvent accessibilityEvent) {
        return f912c.onRequestSendAccessibilityEvent(viewGroup, view, accessibilityEvent);
    }

    public boolean m1253b(View view, AccessibilityEvent accessibilityEvent) {
        return f912c.dispatchPopulateAccessibilityEvent(view, accessibilityEvent);
    }

    public void m1254c(View view, AccessibilityEvent accessibilityEvent) {
        f912c.onPopulateAccessibilityEvent(view, accessibilityEvent);
    }

    public void mo230d(View view, AccessibilityEvent accessibilityEvent) {
        f912c.onInitializeAccessibilityEvent(view, accessibilityEvent);
    }
}
