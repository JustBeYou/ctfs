package android.support.v4.media;

import android.graphics.Bitmap;
import android.media.MediaDescription;
import android.media.MediaDescription.Builder;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;

class C0337a {

    static class C0336a {
        public static Object m1479a() {
            return new Builder();
        }

        public static Object m1480a(Object obj) {
            return ((Builder) obj).build();
        }

        public static void m1481a(Object obj, Bitmap bitmap) {
            ((Builder) obj).setIconBitmap(bitmap);
        }

        public static void m1482a(Object obj, Uri uri) {
            ((Builder) obj).setIconUri(uri);
        }

        public static void m1483a(Object obj, Bundle bundle) {
            ((Builder) obj).setExtras(bundle);
        }

        public static void m1484a(Object obj, CharSequence charSequence) {
            ((Builder) obj).setTitle(charSequence);
        }

        public static void m1485a(Object obj, String str) {
            ((Builder) obj).setMediaId(str);
        }

        public static void m1486b(Object obj, CharSequence charSequence) {
            ((Builder) obj).setSubtitle(charSequence);
        }

        public static void m1487c(Object obj, CharSequence charSequence) {
            ((Builder) obj).setDescription(charSequence);
        }
    }

    public static Object m1488a(Parcel parcel) {
        return MediaDescription.CREATOR.createFromParcel(parcel);
    }

    public static String m1489a(Object obj) {
        return ((MediaDescription) obj).getMediaId();
    }

    public static void m1490a(Object obj, Parcel parcel, int i) {
        ((MediaDescription) obj).writeToParcel(parcel, i);
    }

    public static CharSequence m1491b(Object obj) {
        return ((MediaDescription) obj).getTitle();
    }

    public static CharSequence m1492c(Object obj) {
        return ((MediaDescription) obj).getSubtitle();
    }

    public static CharSequence m1493d(Object obj) {
        return ((MediaDescription) obj).getDescription();
    }

    public static Bitmap m1494e(Object obj) {
        return ((MediaDescription) obj).getIconBitmap();
    }

    public static Uri m1495f(Object obj) {
        return ((MediaDescription) obj).getIconUri();
    }

    public static Bundle m1496g(Object obj) {
        return ((MediaDescription) obj).getExtras();
    }
}
