package android.support.v4.p010a;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

final class C0138p implements Parcelable {
    public static final Creator<C0138p> CREATOR = new C01371();
    C0140q[] f624a;
    int[] f625b;
    C0103d[] f626c;
    int f627d = -1;
    int f628e;

    static class C01371 implements Creator<C0138p> {
        C01371() {
        }

        public C0138p m755a(Parcel parcel) {
            return new C0138p(parcel);
        }

        public C0138p[] m756a(int i) {
            return new C0138p[i];
        }

        public /* synthetic */ Object createFromParcel(Parcel parcel) {
            return m755a(parcel);
        }

        public /* synthetic */ Object[] newArray(int i) {
            return m756a(i);
        }
    }

    public C0138p(Parcel parcel) {
        this.f624a = (C0140q[]) parcel.createTypedArray(C0140q.CREATOR);
        this.f625b = parcel.createIntArray();
        this.f626c = (C0103d[]) parcel.createTypedArray(C0103d.CREATOR);
        this.f627d = parcel.readInt();
        this.f628e = parcel.readInt();
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeTypedArray(this.f624a, i);
        parcel.writeIntArray(this.f625b);
        parcel.writeTypedArray(this.f626c, i);
        parcel.writeInt(this.f627d);
        parcel.writeInt(this.f628e);
    }
}
