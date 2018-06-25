package android.support.v4.p010a;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.v4.p009b.C0092a;
import android.util.Log;
import java.util.ArrayList;
import java.util.Iterator;

public final class ab implements Iterable<Intent> {
    private static final C0095c f425a;
    private final ArrayList<Intent> f426b = new ArrayList();
    private final Context f427c;

    public interface C0094a {
        Intent a_();
    }

    static class C0095c {
        C0095c() {
        }
    }

    static class C0096b extends C0095c {
        C0096b() {
        }
    }

    static {
        if (VERSION.SDK_INT >= 16) {
            f425a = new C0096b();
        } else {
            f425a = new C0095c();
        }
    }

    private ab(Context context) {
        this.f427c = context;
    }

    public static ab m388a(Context context) {
        return new ab(context);
    }

    public ab m389a(Activity activity) {
        Intent intent = null;
        if (activity instanceof C0094a) {
            intent = ((C0094a) activity).a_();
        }
        Intent a = intent == null ? C0161w.m841a(activity) : intent;
        if (a != null) {
            ComponentName component = a.getComponent();
            if (component == null) {
                component = a.resolveActivity(this.f427c.getPackageManager());
            }
            m390a(component);
            m391a(a);
        }
        return this;
    }

    public ab m390a(ComponentName componentName) {
        int size = this.f426b.size();
        try {
            Intent a = C0161w.m842a(this.f427c, componentName);
            while (a != null) {
                this.f426b.add(size, a);
                a = C0161w.m842a(this.f427c, a.getComponent());
            }
            return this;
        } catch (Throwable e) {
            Log.e("TaskStackBuilder", "Bad ComponentName while traversing activity parent metadata");
            throw new IllegalArgumentException(e);
        }
    }

    public ab m391a(Intent intent) {
        this.f426b.add(intent);
        return this;
    }

    public void m392a() {
        m393a(null);
    }

    public void m393a(Bundle bundle) {
        if (this.f426b.isEmpty()) {
            throw new IllegalStateException("No intents added to TaskStackBuilder; cannot startActivities");
        }
        Intent[] intentArr = (Intent[]) this.f426b.toArray(new Intent[this.f426b.size()]);
        intentArr[0] = new Intent(intentArr[0]).addFlags(268484608);
        if (!C0092a.m384a(this.f427c, intentArr, bundle)) {
            Intent intent = new Intent(intentArr[intentArr.length - 1]);
            intent.addFlags(268435456);
            this.f427c.startActivity(intent);
        }
    }

    @Deprecated
    public Iterator<Intent> iterator() {
        return this.f426b.iterator();
    }
}
