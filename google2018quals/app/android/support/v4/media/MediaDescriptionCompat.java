package android.support.v4.media;

import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.media.C0337a.C0336a;
import android.support.v4.media.C0339b.C0338a;
import android.text.TextUtils;

public final class MediaDescriptionCompat implements Parcelable {
    public static final Creator<MediaDescriptionCompat> CREATOR = new C03321();
    private final String f969a;
    private final CharSequence f970b;
    private final CharSequence f971c;
    private final CharSequence f972d;
    private final Bitmap f973e;
    private final Uri f974f;
    private final Bundle f975g;
    private final Uri f976h;
    private Object f977i;

    static class C03321 implements Creator<MediaDescriptionCompat> {
        C03321() {
        }

        public MediaDescriptionCompat m1461a(Parcel parcel) {
            return VERSION.SDK_INT < 21 ? new MediaDescriptionCompat(parcel) : MediaDescriptionCompat.m1472a(C0337a.m1488a(parcel));
        }

        public MediaDescriptionCompat[] m1462a(int i) {
            return new MediaDescriptionCompat[i];
        }

        public /* synthetic */ Object createFromParcel(Parcel parcel) {
            return m1461a(parcel);
        }

        public /* synthetic */ Object[] newArray(int i) {
            return m1462a(i);
        }
    }

    public static final class C0333a {
        private String f961a;
        private CharSequence f962b;
        private CharSequence f963c;
        private CharSequence f964d;
        private Bitmap f965e;
        private Uri f966f;
        private Bundle f967g;
        private Uri f968h;

        public C0333a m1463a(Bitmap bitmap) {
            this.f965e = bitmap;
            return this;
        }

        public C0333a m1464a(Uri uri) {
            this.f966f = uri;
            return this;
        }

        public C0333a m1465a(Bundle bundle) {
            this.f967g = bundle;
            return this;
        }

        public C0333a m1466a(CharSequence charSequence) {
            this.f962b = charSequence;
            return this;
        }

        public C0333a m1467a(String str) {
            this.f961a = str;
            return this;
        }

        public MediaDescriptionCompat m1468a() {
            return new MediaDescriptionCompat(this.f961a, this.f962b, this.f963c, this.f964d, this.f965e, this.f966f, this.f967g, this.f968h);
        }

        public C0333a m1469b(Uri uri) {
            this.f968h = uri;
            return this;
        }

        public C0333a m1470b(CharSequence charSequence) {
            this.f963c = charSequence;
            return this;
        }

        public C0333a m1471c(CharSequence charSequence) {
            this.f964d = charSequence;
            return this;
        }
    }

    MediaDescriptionCompat(Parcel parcel) {
        this.f969a = parcel.readString();
        this.f970b = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        this.f971c = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        this.f972d = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        this.f973e = (Bitmap) parcel.readParcelable(null);
        this.f974f = (Uri) parcel.readParcelable(null);
        this.f975g = parcel.readBundle();
        this.f976h = (Uri) parcel.readParcelable(null);
    }

    MediaDescriptionCompat(String str, CharSequence charSequence, CharSequence charSequence2, CharSequence charSequence3, Bitmap bitmap, Uri uri, Bundle bundle, Uri uri2) {
        this.f969a = str;
        this.f970b = charSequence;
        this.f971c = charSequence2;
        this.f972d = charSequence3;
        this.f973e = bitmap;
        this.f974f = uri;
        this.f975g = bundle;
        this.f976h = uri2;
    }

    public static MediaDescriptionCompat m1472a(Object obj) {
        if (obj == null || VERSION.SDK_INT < 21) {
            return null;
        }
        Bundle bundle;
        MediaDescriptionCompat a;
        C0333a c0333a = new C0333a();
        c0333a.m1467a(C0337a.m1489a(obj));
        c0333a.m1466a(C0337a.m1491b(obj));
        c0333a.m1470b(C0337a.m1492c(obj));
        c0333a.m1471c(C0337a.m1493d(obj));
        c0333a.m1463a(C0337a.m1494e(obj));
        c0333a.m1464a(C0337a.m1495f(obj));
        Bundle g = C0337a.m1496g(obj);
        Uri uri = g == null ? null : (Uri) g.getParcelable("android.support.v4.media.description.MEDIA_URI");
        if (uri != null) {
            if (g.containsKey("android.support.v4.media.description.NULL_BUNDLE_FLAG") && g.size() == 2) {
                bundle = null;
                c0333a.m1465a(bundle);
                if (uri != null) {
                    c0333a.m1469b(uri);
                } else if (VERSION.SDK_INT >= 23) {
                    c0333a.m1469b(C0339b.m1498h(obj));
                }
                a = c0333a.m1468a();
                a.f977i = obj;
                return a;
            }
            g.remove("android.support.v4.media.description.MEDIA_URI");
            g.remove("android.support.v4.media.description.NULL_BUNDLE_FLAG");
        }
        bundle = g;
        c0333a.m1465a(bundle);
        if (uri != null) {
            c0333a.m1469b(uri);
        } else if (VERSION.SDK_INT >= 23) {
            c0333a.m1469b(C0339b.m1498h(obj));
        }
        a = c0333a.m1468a();
        a.f977i = obj;
        return a;
    }

    public Object m1473a() {
        if (this.f977i != null || VERSION.SDK_INT < 21) {
            return this.f977i;
        }
        Object a = C0336a.m1479a();
        C0336a.m1485a(a, this.f969a);
        C0336a.m1484a(a, this.f970b);
        C0336a.m1486b(a, this.f971c);
        C0336a.m1487c(a, this.f972d);
        C0336a.m1481a(a, this.f973e);
        C0336a.m1482a(a, this.f974f);
        Bundle bundle = this.f975g;
        if (VERSION.SDK_INT < 23 && this.f976h != null) {
            if (bundle == null) {
                bundle = new Bundle();
                bundle.putBoolean("android.support.v4.media.description.NULL_BUNDLE_FLAG", true);
            }
            bundle.putParcelable("android.support.v4.media.description.MEDIA_URI", this.f976h);
        }
        C0336a.m1483a(a, bundle);
        if (VERSION.SDK_INT >= 23) {
            C0338a.m1497b(a, this.f976h);
        }
        this.f977i = C0336a.m1480a(a);
        return this.f977i;
    }

    public int describeContents() {
        return 0;
    }

    public String toString() {
        return this.f970b + ", " + this.f971c + ", " + this.f972d;
    }

    public void writeToParcel(Parcel parcel, int i) {
        if (VERSION.SDK_INT < 21) {
            parcel.writeString(this.f969a);
            TextUtils.writeToParcel(this.f970b, parcel, i);
            TextUtils.writeToParcel(this.f971c, parcel, i);
            TextUtils.writeToParcel(this.f972d, parcel, i);
            parcel.writeParcelable(this.f973e, i);
            parcel.writeParcelable(this.f974f, i);
            parcel.writeBundle(this.f975g);
            parcel.writeParcelable(this.f976h, i);
            return;
        }
        C0337a.m1490a(m1473a(), parcel, i);
    }
}
