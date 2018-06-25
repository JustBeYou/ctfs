package android.support.v4.p014e;

import android.os.Bundle;
import android.os.Handler;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.p014e.C0205a.C0207a;

public class C0211b implements Parcelable {
    public static final Creator<C0211b> CREATOR = new C02081();
    final boolean f776a = false;
    final Handler f777b = null;
    C0205a f778c;

    static class C02081 implements Creator<C0211b> {
        C02081() {
        }

        public C0211b m1035a(Parcel parcel) {
            return new C0211b(parcel);
        }

        public C0211b[] m1036a(int i) {
            return new C0211b[i];
        }

        public /* synthetic */ Object createFromParcel(Parcel parcel) {
            return m1035a(parcel);
        }

        public /* synthetic */ Object[] newArray(int i) {
            return m1036a(i);
        }
    }

    class C0209a extends C0207a {
        final /* synthetic */ C0211b f772a;

        C0209a(C0211b c0211b) {
            this.f772a = c0211b;
        }

        public void mo93a(int i, Bundle bundle) {
            if (this.f772a.f777b != null) {
                this.f772a.f777b.post(new C0210b(this.f772a, i, bundle));
            } else {
                this.f772a.mo158a(i, bundle);
            }
        }
    }

    class C0210b implements Runnable {
        final int f773a;
        final Bundle f774b;
        final /* synthetic */ C0211b f775c;

        C0210b(C0211b c0211b, int i, Bundle bundle) {
            this.f775c = c0211b;
            this.f773a = i;
            this.f774b = bundle;
        }

        public void run() {
            this.f775c.mo158a(this.f773a, this.f774b);
        }
    }

    C0211b(Parcel parcel) {
        this.f778c = C0207a.m1034a(parcel.readStrongBinder());
    }

    protected void mo158a(int i, Bundle bundle) {
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        synchronized (this) {
            if (this.f778c == null) {
                this.f778c = new C0209a(this);
            }
            parcel.writeStrongBinder(this.f778c.asBinder());
        }
    }
}
