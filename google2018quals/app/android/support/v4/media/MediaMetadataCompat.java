package android.support.v4.media;

import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.p016g.C0229a;

public final class MediaMetadataCompat implements Parcelable {
    public static final Creator<MediaMetadataCompat> CREATOR = new C03341();
    static final C0229a<String, Integer> f978a = new C0229a();
    private static final String[] f979c = new String[]{"android.media.metadata.TITLE", "android.media.metadata.ARTIST", "android.media.metadata.ALBUM", "android.media.metadata.ALBUM_ARTIST", "android.media.metadata.WRITER", "android.media.metadata.AUTHOR", "android.media.metadata.COMPOSER"};
    private static final String[] f980d = new String[]{"android.media.metadata.DISPLAY_ICON", "android.media.metadata.ART", "android.media.metadata.ALBUM_ART"};
    private static final String[] f981e = new String[]{"android.media.metadata.DISPLAY_ICON_URI", "android.media.metadata.ART_URI", "android.media.metadata.ALBUM_ART_URI"};
    final Bundle f982b;
    private Object f983f;

    static class C03341 implements Creator<MediaMetadataCompat> {
        C03341() {
        }

        public MediaMetadataCompat m1474a(Parcel parcel) {
            return new MediaMetadataCompat(parcel);
        }

        public MediaMetadataCompat[] m1475a(int i) {
            return new MediaMetadataCompat[i];
        }

        public /* synthetic */ Object createFromParcel(Parcel parcel) {
            return m1474a(parcel);
        }

        public /* synthetic */ Object[] newArray(int i) {
            return m1475a(i);
        }
    }

    static {
        f978a.put("android.media.metadata.TITLE", Integer.valueOf(1));
        f978a.put("android.media.metadata.ARTIST", Integer.valueOf(1));
        f978a.put("android.media.metadata.DURATION", Integer.valueOf(0));
        f978a.put("android.media.metadata.ALBUM", Integer.valueOf(1));
        f978a.put("android.media.metadata.AUTHOR", Integer.valueOf(1));
        f978a.put("android.media.metadata.WRITER", Integer.valueOf(1));
        f978a.put("android.media.metadata.COMPOSER", Integer.valueOf(1));
        f978a.put("android.media.metadata.COMPILATION", Integer.valueOf(1));
        f978a.put("android.media.metadata.DATE", Integer.valueOf(1));
        f978a.put("android.media.metadata.YEAR", Integer.valueOf(0));
        f978a.put("android.media.metadata.GENRE", Integer.valueOf(1));
        f978a.put("android.media.metadata.TRACK_NUMBER", Integer.valueOf(0));
        f978a.put("android.media.metadata.NUM_TRACKS", Integer.valueOf(0));
        f978a.put("android.media.metadata.DISC_NUMBER", Integer.valueOf(0));
        f978a.put("android.media.metadata.ALBUM_ARTIST", Integer.valueOf(1));
        f978a.put("android.media.metadata.ART", Integer.valueOf(2));
        f978a.put("android.media.metadata.ART_URI", Integer.valueOf(1));
        f978a.put("android.media.metadata.ALBUM_ART", Integer.valueOf(2));
        f978a.put("android.media.metadata.ALBUM_ART_URI", Integer.valueOf(1));
        f978a.put("android.media.metadata.USER_RATING", Integer.valueOf(3));
        f978a.put("android.media.metadata.RATING", Integer.valueOf(3));
        f978a.put("android.media.metadata.DISPLAY_TITLE", Integer.valueOf(1));
        f978a.put("android.media.metadata.DISPLAY_SUBTITLE", Integer.valueOf(1));
        f978a.put("android.media.metadata.DISPLAY_DESCRIPTION", Integer.valueOf(1));
        f978a.put("android.media.metadata.DISPLAY_ICON", Integer.valueOf(2));
        f978a.put("android.media.metadata.DISPLAY_ICON_URI", Integer.valueOf(1));
        f978a.put("android.media.metadata.MEDIA_ID", Integer.valueOf(1));
        f978a.put("android.media.metadata.BT_FOLDER_TYPE", Integer.valueOf(0));
        f978a.put("android.media.metadata.MEDIA_URI", Integer.valueOf(1));
        f978a.put("android.media.metadata.ADVERTISEMENT", Integer.valueOf(0));
        f978a.put("android.media.metadata.DOWNLOAD_STATUS", Integer.valueOf(0));
    }

    MediaMetadataCompat(Parcel parcel) {
        this.f982b = parcel.readBundle();
    }

    public static MediaMetadataCompat m1476a(Object obj) {
        if (obj == null || VERSION.SDK_INT < 21) {
            return null;
        }
        Parcel obtain = Parcel.obtain();
        C0340c.m1499a(obj, obtain, 0);
        obtain.setDataPosition(0);
        MediaMetadataCompat mediaMetadataCompat = (MediaMetadataCompat) CREATOR.createFromParcel(obtain);
        obtain.recycle();
        mediaMetadataCompat.f983f = obj;
        return mediaMetadataCompat;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeBundle(this.f982b);
    }
}
