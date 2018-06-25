package android.support.v4.media;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public final class RatingCompat implements Parcelable {
    public static final Creator<RatingCompat> CREATOR = new C03351();
    private final int f984a;
    private final float f985b;

    static class C03351 implements Creator<RatingCompat> {
        C03351() {
        }

        public RatingCompat m1477a(Parcel parcel) {
            return new RatingCompat(parcel.readInt(), parcel.readFloat());
        }

        public RatingCompat[] m1478a(int i) {
            return new RatingCompat[i];
        }

        public /* synthetic */ Object createFromParcel(Parcel parcel) {
            return m1477a(parcel);
        }

        public /* synthetic */ Object[] newArray(int i) {
            return m1478a(i);
        }
    }

    RatingCompat(int i, float f) {
        this.f984a = i;
        this.f985b = f;
    }

    public int describeContents() {
        return this.f984a;
    }

    public String toString() {
        return "Rating:style=" + this.f984a + " rating=" + (this.f985b < 0.0f ? "unrated" : String.valueOf(this.f985b));
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.f984a);
        parcel.writeFloat(this.f985b);
    }
}
