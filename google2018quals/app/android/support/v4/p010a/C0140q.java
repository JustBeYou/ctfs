package android.support.v4.p010a;

import android.content.Context;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.Log;

final class C0140q implements Parcelable {
    public static final Creator<C0140q> CREATOR = new C01391();
    final String f629a;
    final int f630b;
    final boolean f631c;
    final int f632d;
    final int f633e;
    final String f634f;
    final boolean f635g;
    final boolean f636h;
    final Bundle f637i;
    final boolean f638j;
    Bundle f639k;
    C0114h f640l;

    static class C01391 implements Creator<C0140q> {
        C01391() {
        }

        public C0140q m757a(Parcel parcel) {
            return new C0140q(parcel);
        }

        public C0140q[] m758a(int i) {
            return new C0140q[i];
        }

        public /* synthetic */ Object createFromParcel(Parcel parcel) {
            return m757a(parcel);
        }

        public /* synthetic */ Object[] newArray(int i) {
            return m758a(i);
        }
    }

    public C0140q(Parcel parcel) {
        boolean z = true;
        this.f629a = parcel.readString();
        this.f630b = parcel.readInt();
        this.f631c = parcel.readInt() != 0;
        this.f632d = parcel.readInt();
        this.f633e = parcel.readInt();
        this.f634f = parcel.readString();
        this.f635g = parcel.readInt() != 0;
        this.f636h = parcel.readInt() != 0;
        this.f637i = parcel.readBundle();
        if (parcel.readInt() == 0) {
            z = false;
        }
        this.f638j = z;
        this.f639k = parcel.readBundle();
    }

    public C0140q(C0114h c0114h) {
        this.f629a = c0114h.getClass().getName();
        this.f630b = c0114h.f519e;
        this.f631c = c0114h.f527m;
        this.f632d = c0114h.f537w;
        this.f633e = c0114h.f538x;
        this.f634f = c0114h.f539y;
        this.f635g = c0114h.f496B;
        this.f636h = c0114h.f495A;
        this.f637i = c0114h.f521g;
        this.f638j = c0114h.f540z;
    }

    public C0114h m759a(C0116l c0116l, C0109j c0109j, C0114h c0114h, C0136o c0136o) {
        if (this.f640l == null) {
            Context g = c0116l.m555g();
            if (this.f637i != null) {
                this.f637i.setClassLoader(g.getClassLoader());
            }
            if (c0109j != null) {
                this.f640l = c0109j.mo41a(g, this.f629a, this.f637i);
            } else {
                this.f640l = C0114h.m438a(g, this.f629a, this.f637i);
            }
            if (this.f639k != null) {
                this.f639k.setClassLoader(g.getClassLoader());
                this.f640l.f517c = this.f639k;
            }
            this.f640l.m470a(this.f630b, c0114h);
            this.f640l.f527m = this.f631c;
            this.f640l.f529o = true;
            this.f640l.f537w = this.f632d;
            this.f640l.f538x = this.f633e;
            this.f640l.f539y = this.f634f;
            this.f640l.f496B = this.f635g;
            this.f640l.f495A = this.f636h;
            this.f640l.f540z = this.f638j;
            this.f640l.f532r = c0116l.f545d;
            if (C0135n.f591a) {
                Log.v("FragmentManager", "Instantiated fragment " + this.f640l);
            }
        }
        this.f640l.f535u = c0136o;
        return this.f640l;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        int i2 = 1;
        parcel.writeString(this.f629a);
        parcel.writeInt(this.f630b);
        parcel.writeInt(this.f631c ? 1 : 0);
        parcel.writeInt(this.f632d);
        parcel.writeInt(this.f633e);
        parcel.writeString(this.f634f);
        parcel.writeInt(this.f635g ? 1 : 0);
        parcel.writeInt(this.f636h ? 1 : 0);
        parcel.writeBundle(this.f637i);
        if (!this.f638j) {
            i2 = 0;
        }
        parcel.writeInt(i2);
        parcel.writeBundle(this.f639k);
    }
}
