package android.support.v4.media.session;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class ParcelableVolumeInfo implements Parcelable {
    public static final Creator<ParcelableVolumeInfo> CREATOR = new C03531();
    public int f1008a;
    public int f1009b;
    public int f1010c;
    public int f1011d;
    public int f1012e;

    static class C03531 implements Creator<ParcelableVolumeInfo> {
        C03531() {
        }

        public ParcelableVolumeInfo m1571a(Parcel parcel) {
            return new ParcelableVolumeInfo(parcel);
        }

        public ParcelableVolumeInfo[] m1572a(int i) {
            return new ParcelableVolumeInfo[i];
        }

        public /* synthetic */ Object createFromParcel(Parcel parcel) {
            return m1571a(parcel);
        }

        public /* synthetic */ Object[] newArray(int i) {
            return m1572a(i);
        }
    }

    public ParcelableVolumeInfo(Parcel parcel) {
        this.f1008a = parcel.readInt();
        this.f1010c = parcel.readInt();
        this.f1011d = parcel.readInt();
        this.f1012e = parcel.readInt();
        this.f1009b = parcel.readInt();
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.f1008a);
        parcel.writeInt(this.f1010c);
        parcel.writeInt(this.f1011d);
        parcel.writeInt(this.f1012e);
        parcel.writeInt(this.f1009b);
    }
}
