package android.support.v4.p010a;

import android.arch.lifecycle.C0013b;
import android.arch.lifecycle.C0013b.C0012b;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender;
import android.content.res.Configuration;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.Parcelable;
import android.support.v4.p016g.C0228k;
import android.support.v4.p016g.C0244l;
import android.util.AttributeSet;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.Window;
import java.io.FileDescriptor;
import java.io.PrintWriter;

public class C0119i extends C0105f {
    final Handler f556c = new C01151(this);
    final C0120k f557d = C0120k.m583a(new C0117a(this));
    boolean f558e;
    boolean f559f;
    boolean f560g = true;
    boolean f561h = true;
    boolean f562i;
    int f563j;
    C0244l<String> f564k;

    class C01151 extends Handler {
        final /* synthetic */ C0119i f541a;

        C01151(C0119i c0119i) {
            this.f541a = c0119i;
        }

        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    if (this.f541a.f560g) {
                        this.f541a.m576a(false);
                        return;
                    }
                    return;
                case 2:
                    this.f541a.m578b();
                    this.f541a.f557d.m612n();
                    return;
                default:
                    super.handleMessage(message);
                    return;
            }
        }
    }

    class C0117a extends C0116l<C0119i> {
        final /* synthetic */ C0119i f552a;

        public C0117a(C0119i c0119i) {
            this.f552a = c0119i;
            super(c0119i);
        }

        public View mo42a(int i) {
            return this.f552a.findViewById(i);
        }

        public void mo44a(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
            this.f552a.dump(str, fileDescriptor, printWriter, strArr);
        }

        public boolean mo43a() {
            Window window = this.f552a.getWindow();
            return (window == null || window.peekDecorView() == null) ? false : true;
        }

        public boolean mo45a(C0114h c0114h) {
            return !this.f552a.isFinishing();
        }

        public LayoutInflater mo46b() {
            return this.f552a.getLayoutInflater().cloneInContext(this.f552a);
        }

        public void mo47b(C0114h c0114h) {
            this.f552a.m575a(c0114h);
        }

        public void mo48c() {
            this.f552a.mo266d();
        }

        public boolean mo49d() {
            return this.f552a.getWindow() != null;
        }

        public int mo50e() {
            Window window = this.f552a.getWindow();
            return window == null ? 0 : window.getAttributes().windowAnimations;
        }
    }

    static final class C0118b {
        Object f553a;
        C0136o f554b;
        C0228k<String, C0156u> f555c;

        C0118b() {
        }
    }

    private static void m572a(C0123m c0123m, C0012b c0012b) {
        for (C0114h c0114h : c0123m.mo64b()) {
            if (c0114h != null) {
                c0114h.f515U.m34a(c0012b);
                C0119i.m572a(c0114h.m513g(), c0012b);
            }
        }
    }

    public C0013b mo39a() {
        return super.mo39a();
    }

    final View mo51a(View view, String str, Context context, AttributeSet attributeSet) {
        return this.f557d.m586a(view, str, context, attributeSet);
    }

    public void m575a(C0114h c0114h) {
    }

    void m576a(boolean z) {
        if (!this.f561h) {
            this.f561h = true;
            this.f562i = z;
            this.f556c.removeMessages(1);
            m581e();
        } else if (z) {
            this.f557d.m613o();
            this.f557d.m601c(true);
        }
    }

    protected boolean m577a(View view, Menu menu) {
        return super.onPreparePanel(0, view, menu);
    }

    protected void m578b() {
        this.f557d.m606h();
    }

    public Object m579c() {
        return null;
    }

    @Deprecated
    public void mo266d() {
        invalidateOptionsMenu();
    }

    public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        super.dump(str, fileDescriptor, printWriter, strArr);
        printWriter.print(str);
        printWriter.print("Local FragmentActivity ");
        printWriter.print(Integer.toHexString(System.identityHashCode(this)));
        printWriter.println(" State:");
        String str2 = str + "  ";
        printWriter.print(str2);
        printWriter.print("mCreated=");
        printWriter.print(this.f558e);
        printWriter.print("mResumed=");
        printWriter.print(this.f559f);
        printWriter.print(" mStopped=");
        printWriter.print(this.f560g);
        printWriter.print(" mReallyStopped=");
        printWriter.println(this.f561h);
        this.f557d.m591a(str2, fileDescriptor, printWriter, strArr);
        this.f557d.m585a().mo62a(str, fileDescriptor, printWriter, strArr);
    }

    void m581e() {
        this.f557d.m601c(this.f562i);
        this.f557d.m609k();
    }

    public C0123m m582f() {
        return this.f557d.m585a();
    }

    protected void onActivityResult(int i, int i2, Intent intent) {
        this.f557d.m596b();
        int i3 = i >> 16;
        if (i3 != 0) {
            int i4 = i3 - 1;
            String str = (String) this.f564k.m1169a(i4);
            this.f564k.m1175c(i4);
            if (str == null) {
                Log.w("FragmentActivity", "Activity result delivered for unknown Fragment.");
                return;
            }
            C0114h a = this.f557d.m584a(str);
            if (a == null) {
                Log.w("FragmentActivity", "Activity result no fragment exists for who: " + str);
                return;
            } else {
                a.m469a(65535 & i, i2, intent);
                return;
            }
        }
        super.onActivityResult(i, i2, intent);
    }

    public void onBackPressed() {
        C0123m a = this.f557d.m585a();
        boolean c = a.mo65c();
        if (c && VERSION.SDK_INT <= 25) {
            return;
        }
        if (c || !a.mo63a()) {
            super.onBackPressed();
        }
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.f557d.m587a(configuration);
    }

    protected void onCreate(Bundle bundle) {
        this.f557d.m589a(null);
        super.onCreate(bundle);
        C0118b c0118b = (C0118b) getLastNonConfigurationInstance();
        if (c0118b != null) {
            this.f557d.m590a(c0118b.f555c);
        }
        if (bundle != null) {
            this.f557d.m588a(bundle.getParcelable("android:support:fragments"), c0118b != null ? c0118b.f554b : null);
            if (bundle.containsKey("android:support:next_request_index")) {
                this.f563j = bundle.getInt("android:support:next_request_index");
                int[] intArray = bundle.getIntArray("android:support:request_indicies");
                String[] stringArray = bundle.getStringArray("android:support:request_fragment_who");
                if (intArray == null || stringArray == null || intArray.length != stringArray.length) {
                    Log.w("FragmentActivity", "Invalid requestCode mapping in savedInstanceState.");
                } else {
                    this.f564k = new C0244l(intArray.length);
                    for (int i = 0; i < intArray.length; i++) {
                        this.f564k.m1173b(intArray[i], stringArray[i]);
                    }
                }
            }
        }
        if (this.f564k == null) {
            this.f564k = new C0244l();
            this.f563j = 0;
        }
        this.f557d.m603e();
    }

    public boolean onCreatePanelMenu(int i, Menu menu) {
        return i == 0 ? super.onCreatePanelMenu(i, menu) | this.f557d.m594a(menu, getMenuInflater()) : super.onCreatePanelMenu(i, menu);
    }

    public /* bridge */ /* synthetic */ View onCreateView(View view, String str, Context context, AttributeSet attributeSet) {
        return super.onCreateView(view, str, context, attributeSet);
    }

    public /* bridge */ /* synthetic */ View onCreateView(String str, Context context, AttributeSet attributeSet) {
        return super.onCreateView(str, context, attributeSet);
    }

    protected void onDestroy() {
        super.onDestroy();
        m576a(false);
        this.f557d.m610l();
        this.f557d.m614p();
    }

    public void onLowMemory() {
        super.onLowMemory();
        this.f557d.m611m();
    }

    public boolean onMenuItemSelected(int i, MenuItem menuItem) {
        if (super.onMenuItemSelected(i, menuItem)) {
            return true;
        }
        switch (i) {
            case 0:
                return this.f557d.m595a(menuItem);
            case 6:
                return this.f557d.m599b(menuItem);
            default:
                return false;
        }
    }

    public void onMultiWindowModeChanged(boolean z) {
        this.f557d.m592a(z);
    }

    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        this.f557d.m596b();
    }

    public void onPanelClosed(int i, Menu menu) {
        switch (i) {
            case 0:
                this.f557d.m597b(menu);
                break;
        }
        super.onPanelClosed(i, menu);
    }

    protected void onPause() {
        super.onPause();
        this.f559f = false;
        if (this.f556c.hasMessages(2)) {
            this.f556c.removeMessages(2);
            m578b();
        }
        this.f557d.m607i();
    }

    public void onPictureInPictureModeChanged(boolean z) {
        this.f557d.m598b(z);
    }

    protected void onPostResume() {
        super.onPostResume();
        this.f556c.removeMessages(2);
        m578b();
        this.f557d.m612n();
    }

    public boolean onPreparePanel(int i, View view, Menu menu) {
        return (i != 0 || menu == null) ? super.onPreparePanel(i, view, menu) : m577a(view, menu) | this.f557d.m593a(menu);
    }

    public void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        int i2 = (i >> 16) & 65535;
        if (i2 != 0) {
            int i3 = i2 - 1;
            String str = (String) this.f564k.m1169a(i3);
            this.f564k.m1175c(i3);
            if (str == null) {
                Log.w("FragmentActivity", "Activity result delivered for unknown Fragment.");
                return;
            }
            C0114h a = this.f557d.m584a(str);
            if (a == null) {
                Log.w("FragmentActivity", "Activity result no fragment exists for who: " + str);
            } else {
                a.m471a(i & 65535, strArr, iArr);
            }
        }
    }

    protected void onResume() {
        super.onResume();
        this.f556c.sendEmptyMessage(2);
        this.f559f = true;
        this.f557d.m612n();
    }

    public final Object onRetainNonConfigurationInstance() {
        if (this.f560g) {
            m576a(true);
        }
        Object c = m579c();
        C0136o d = this.f557d.m602d();
        C0228k r = this.f557d.m616r();
        if (d == null && r == null && c == null) {
            return null;
        }
        C0118b c0118b = new C0118b();
        c0118b.f553a = c;
        c0118b.f554b = d;
        c0118b.f555c = r;
        return c0118b;
    }

    protected void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        C0119i.m572a(m582f(), C0012b.CREATED);
        Parcelable c = this.f557d.m600c();
        if (c != null) {
            bundle.putParcelable("android:support:fragments", c);
        }
        if (this.f564k.m1171b() > 0) {
            bundle.putInt("android:support:next_request_index", this.f563j);
            int[] iArr = new int[this.f564k.m1171b()];
            String[] strArr = new String[this.f564k.m1171b()];
            for (int i = 0; i < this.f564k.m1171b(); i++) {
                iArr[i] = this.f564k.m1177d(i);
                strArr[i] = (String) this.f564k.m1178e(i);
            }
            bundle.putIntArray("android:support:request_indicies", iArr);
            bundle.putStringArray("android:support:request_fragment_who", strArr);
        }
    }

    protected void onStart() {
        super.onStart();
        this.f560g = false;
        this.f561h = false;
        this.f556c.removeMessages(1);
        if (!this.f558e) {
            this.f558e = true;
            this.f557d.m604f();
        }
        this.f557d.m596b();
        this.f557d.m612n();
        this.f557d.m613o();
        this.f557d.m605g();
        this.f557d.m615q();
    }

    public void onStateNotSaved() {
        this.f557d.m596b();
    }

    protected void onStop() {
        super.onStop();
        this.f560g = true;
        C0119i.m572a(m582f(), C0012b.CREATED);
        this.f556c.sendEmptyMessage(1);
        this.f557d.m608j();
    }

    public void startActivityForResult(Intent intent, int i) {
        if (!(this.b || i == -1)) {
            C0104e.m416a(i);
        }
        super.startActivityForResult(intent, i);
    }

    public /* bridge */ /* synthetic */ void startActivityForResult(Intent intent, int i, Bundle bundle) {
        super.startActivityForResult(intent, i, bundle);
    }

    public /* bridge */ /* synthetic */ void startIntentSenderForResult(IntentSender intentSender, int i, Intent intent, int i2, int i3, int i4) {
        super.startIntentSenderForResult(intentSender, i, intent, i2, i3, i4);
    }

    public /* bridge */ /* synthetic */ void startIntentSenderForResult(IntentSender intentSender, int i, Intent intent, int i2, int i3, int i4, Bundle bundle) {
        super.startIntentSenderForResult(intentSender, i, intent, i2, i3, i4, bundle);
    }
}
