package android.arch.lifecycle;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.arch.lifecycle.C0013b.C0011a;
import android.os.Bundle;

public class C0021g extends Fragment {
    private C0020a f38a;

    interface C0020a {
        void m37a();

        void m38b();

        void m39c();
    }

    public static void m40a(Activity activity) {
        FragmentManager fragmentManager = activity.getFragmentManager();
        if (fragmentManager.findFragmentByTag("android.arch.lifecycle.LifecycleDispatcher.report_fragment_tag") == null) {
            fragmentManager.beginTransaction().add(new C0021g(), "android.arch.lifecycle.LifecycleDispatcher.report_fragment_tag").commit();
            fragmentManager.executePendingTransactions();
        }
    }

    private void m41a(C0011a c0011a) {
        Activity activity = getActivity();
        if (activity instanceof C0018e) {
            ((C0018e) activity).m35b().m33a(c0011a);
        } else if (activity instanceof C0014c) {
            C0013b a = ((C0014c) activity).mo39a();
            if (a instanceof C0017d) {
                ((C0017d) a).m33a(c0011a);
            }
        }
    }

    private void m42a(C0020a c0020a) {
        if (c0020a != null) {
            c0020a.m37a();
        }
    }

    private void m43b(C0020a c0020a) {
        if (c0020a != null) {
            c0020a.m38b();
        }
    }

    private void m44c(C0020a c0020a) {
        if (c0020a != null) {
            c0020a.m39c();
        }
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        m42a(this.f38a);
        m41a(C0011a.ON_CREATE);
    }

    public void onDestroy() {
        super.onDestroy();
        m41a(C0011a.ON_DESTROY);
        this.f38a = null;
    }

    public void onPause() {
        super.onPause();
        m41a(C0011a.ON_PAUSE);
    }

    public void onResume() {
        super.onResume();
        m44c(this.f38a);
        m41a(C0011a.ON_RESUME);
    }

    public void onStart() {
        super.onStart();
        m43b(this.f38a);
        m41a(C0011a.ON_START);
    }

    public void onStop() {
        super.onStop();
        m41a(C0011a.ON_STOP);
    }
}
