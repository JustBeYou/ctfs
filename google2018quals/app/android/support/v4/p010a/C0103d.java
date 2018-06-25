package android.support.v4.p010a;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.p010a.C0101c.C0098a;
import android.text.TextUtils;
import android.util.Log;
import java.util.ArrayList;

final class C0103d implements Parcelable {
    public static final Creator<C0103d> CREATOR = new C01021();
    final int[] f456a;
    final int f457b;
    final int f458c;
    final String f459d;
    final int f460e;
    final int f461f;
    final CharSequence f462g;
    final int f463h;
    final CharSequence f464i;
    final ArrayList<String> f465j;
    final ArrayList<String> f466k;
    final boolean f467l;

    static class C01021 implements Creator<C0103d> {
        C01021() {
        }

        public C0103d m413a(Parcel parcel) {
            return new C0103d(parcel);
        }

        public C0103d[] m414a(int i) {
            return new C0103d[i];
        }

        public /* synthetic */ Object createFromParcel(Parcel parcel) {
            return m413a(parcel);
        }

        public /* synthetic */ Object[] newArray(int i) {
            return m414a(i);
        }
    }

    public C0103d(Parcel parcel) {
        this.f456a = parcel.createIntArray();
        this.f457b = parcel.readInt();
        this.f458c = parcel.readInt();
        this.f459d = parcel.readString();
        this.f460e = parcel.readInt();
        this.f461f = parcel.readInt();
        this.f462g = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        this.f463h = parcel.readInt();
        this.f464i = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        this.f465j = parcel.createStringArrayList();
        this.f466k = parcel.createStringArrayList();
        this.f467l = parcel.readInt() != 0;
    }

    public C0103d(C0101c c0101c) {
        int size = c0101c.f436c.size();
        this.f456a = new int[(size * 6)];
        if (c0101c.f443j) {
            int i = 0;
            for (int i2 = 0; i2 < size; i2++) {
                C0098a c0098a = (C0098a) c0101c.f436c.get(i2);
                int i3 = i + 1;
                this.f456a[i] = c0098a.f428a;
                int i4 = i3 + 1;
                this.f456a[i3] = c0098a.f429b != null ? c0098a.f429b.f519e : -1;
                int i5 = i4 + 1;
                this.f456a[i4] = c0098a.f430c;
                i3 = i5 + 1;
                this.f456a[i5] = c0098a.f431d;
                i5 = i3 + 1;
                this.f456a[i3] = c0098a.f432e;
                i = i5 + 1;
                this.f456a[i5] = c0098a.f433f;
            }
            this.f457b = c0101c.f441h;
            this.f458c = c0101c.f442i;
            this.f459d = c0101c.f445l;
            this.f460e = c0101c.f447n;
            this.f461f = c0101c.f448o;
            this.f462g = c0101c.f449p;
            this.f463h = c0101c.f450q;
            this.f464i = c0101c.f451r;
            this.f465j = c0101c.f452s;
            this.f466k = c0101c.f453t;
            this.f467l = c0101c.f454u;
            return;
        }
        throw new IllegalStateException("Not on back stack");
    }

    public C0101c m415a(C0135n c0135n) {
        int i = 0;
        C0101c c0101c = new C0101c(c0135n);
        int i2 = 0;
        while (i < this.f456a.length) {
            C0098a c0098a = new C0098a();
            int i3 = i + 1;
            c0098a.f428a = this.f456a[i];
            if (C0135n.f591a) {
                Log.v("FragmentManager", "Instantiate " + c0101c + " op #" + i2 + " base fragment #" + this.f456a[i3]);
            }
            int i4 = i3 + 1;
            i = this.f456a[i3];
            if (i >= 0) {
                c0098a.f429b = (C0114h) c0135n.f602f.get(i);
            } else {
                c0098a.f429b = null;
            }
            i3 = i4 + 1;
            c0098a.f430c = this.f456a[i4];
            i4 = i3 + 1;
            c0098a.f431d = this.f456a[i3];
            i3 = i4 + 1;
            c0098a.f432e = this.f456a[i4];
            i4 = i3 + 1;
            c0098a.f433f = this.f456a[i3];
            c0101c.f437d = c0098a.f430c;
            c0101c.f438e = c0098a.f431d;
            c0101c.f439f = c0098a.f432e;
            c0101c.f440g = c0098a.f433f;
            c0101c.m401a(c0098a);
            i2++;
            i = i4;
        }
        c0101c.f441h = this.f457b;
        c0101c.f442i = this.f458c;
        c0101c.f445l = this.f459d;
        c0101c.f447n = this.f460e;
        c0101c.f443j = true;
        c0101c.f448o = this.f461f;
        c0101c.f449p = this.f462g;
        c0101c.f450q = this.f463h;
        c0101c.f451r = this.f464i;
        c0101c.f452s = this.f465j;
        c0101c.f453t = this.f466k;
        c0101c.f454u = this.f467l;
        c0101c.m400a(1);
        return c0101c;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        int i2 = 0;
        parcel.writeIntArray(this.f456a);
        parcel.writeInt(this.f457b);
        parcel.writeInt(this.f458c);
        parcel.writeString(this.f459d);
        parcel.writeInt(this.f460e);
        parcel.writeInt(this.f461f);
        TextUtils.writeToParcel(this.f462g, parcel, 0);
        parcel.writeInt(this.f463h);
        TextUtils.writeToParcel(this.f464i, parcel, 0);
        parcel.writeStringList(this.f465j);
        parcel.writeStringList(this.f466k);
        if (this.f467l) {
            i2 = 1;
        }
        parcel.writeInt(i2);
    }
}
