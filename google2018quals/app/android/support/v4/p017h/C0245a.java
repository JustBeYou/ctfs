package android.support.v4.p017h;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.ClassLoaderCreator;
import android.os.Parcelable.Creator;

public abstract class C0245a implements Parcelable {
    public static final Creator<C0245a> CREATOR = new C02472();
    public static final C0245a f887a = new C02461();
    private final Parcelable f888b;

    static class C02461 extends C0245a {
        C02461() {
            super();
        }
    }

    static class C02472 implements ClassLoaderCreator<C0245a> {
        C02472() {
        }

        public C0245a m1180a(Parcel parcel) {
            return m1181a(parcel, null);
        }

        public C0245a m1181a(Parcel parcel, ClassLoader classLoader) {
            if (parcel.readParcelable(classLoader) == null) {
                return C0245a.f887a;
            }
            throw new IllegalStateException("superState must be null");
        }

        public C0245a[] m1182a(int i) {
            return new C0245a[i];
        }

        public /* synthetic */ Object createFromParcel(Parcel parcel) {
            return m1180a(parcel);
        }

        public /* synthetic */ Object createFromParcel(Parcel parcel, ClassLoader classLoader) {
            return m1181a(parcel, classLoader);
        }

        public /* synthetic */ Object[] newArray(int i) {
            return m1182a(i);
        }
    }

    private C0245a() {
        this.f888b = null;
    }

    protected C0245a(Parcel parcel, ClassLoader classLoader) {
        Parcelable readParcelable = parcel.readParcelable(classLoader);
        if (readParcelable == null) {
            readParcelable = f887a;
        }
        this.f888b = readParcelable;
    }

    protected C0245a(Parcelable parcelable) {
        if (parcelable == null) {
            throw new IllegalArgumentException("superState must not be null");
        }
        if (parcelable == f887a) {
            parcelable = null;
        }
        this.f888b = parcelable;
    }

    public final Parcelable m1179a() {
        return this.f888b;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeParcelable(this.f888b, i);
    }
}
