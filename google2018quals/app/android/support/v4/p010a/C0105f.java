package android.support.v4.p010a;

import android.content.Intent;
import android.content.IntentSender;
import android.os.Bundle;

abstract class C0105f extends C0104e {
    boolean f469b;

    C0105f() {
    }

    public void startActivityForResult(Intent intent, int i, Bundle bundle) {
        if (!(this.f469b || i == -1)) {
            C0104e.m416a(i);
        }
        super.startActivityForResult(intent, i, bundle);
    }

    public void startIntentSenderForResult(IntentSender intentSender, int i, Intent intent, int i2, int i3, int i4, Bundle bundle) {
        if (!(this.a || i == -1)) {
            C0104e.m416a(i);
        }
        super.startIntentSenderForResult(intentSender, i, intent, i2, i3, i4, bundle);
    }
}
