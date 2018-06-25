package android.support.v4.p010a;

import android.app.Activity;
import android.arch.lifecycle.C0013b;
import android.arch.lifecycle.C0013b.C0012b;
import android.arch.lifecycle.C0014c;
import android.arch.lifecycle.C0017d;
import android.arch.lifecycle.C0021g;
import android.os.Bundle;
import android.support.v4.p016g.C0228k;

public class aa extends Activity implements C0014c {
    private C0228k<Class<? extends Object>, Object> f423a = new C0228k();
    private C0017d f424b = new C0017d(this);

    public C0013b mo39a() {
        return this.f424b;
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        C0021g.m40a((Activity) this);
    }

    protected void onSaveInstanceState(Bundle bundle) {
        this.f424b.m34a(C0012b.CREATED);
        super.onSaveInstanceState(bundle);
    }
}
