package android.support.v4.media.session;

import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.media.session.C0366e.C0365a;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.List;

public final class PlaybackStateCompat implements Parcelable {
    public static final Creator<PlaybackStateCompat> CREATOR = new C03541();
    final int f1018a;
    final long f1019b;
    final long f1020c;
    final float f1021d;
    final long f1022e;
    final int f1023f;
    final CharSequence f1024g;
    final long f1025h;
    List<CustomAction> f1026i;
    final long f1027j;
    final Bundle f1028k;
    private Object f1029l;

    static class C03541 implements Creator<PlaybackStateCompat> {
        C03541() {
        }

        public PlaybackStateCompat m1573a(Parcel parcel) {
            return new PlaybackStateCompat(parcel);
        }

        public PlaybackStateCompat[] m1574a(int i) {
            return new PlaybackStateCompat[i];
        }

        public /* synthetic */ Object createFromParcel(Parcel parcel) {
            return m1573a(parcel);
        }

        public /* synthetic */ Object[] newArray(int i) {
            return m1574a(i);
        }
    }

    public static final class CustomAction implements Parcelable {
        public static final Creator<CustomAction> CREATOR = new C03551();
        private final String f1013a;
        private final CharSequence f1014b;
        private final int f1015c;
        private final Bundle f1016d;
        private Object f1017e;

        static class C03551 implements Creator<CustomAction> {
            C03551() {
            }

            public CustomAction m1575a(Parcel parcel) {
                return new CustomAction(parcel);
            }

            public CustomAction[] m1576a(int i) {
                return new CustomAction[i];
            }

            public /* synthetic */ Object createFromParcel(Parcel parcel) {
                return m1575a(parcel);
            }

            public /* synthetic */ Object[] newArray(int i) {
                return m1576a(i);
            }
        }

        CustomAction(Parcel parcel) {
            this.f1013a = parcel.readString();
            this.f1014b = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
            this.f1015c = parcel.readInt();
            this.f1016d = parcel.readBundle();
        }

        CustomAction(String str, CharSequence charSequence, int i, Bundle bundle) {
            this.f1013a = str;
            this.f1014b = charSequence;
            this.f1015c = i;
            this.f1016d = bundle;
        }

        public static CustomAction m1577a(Object obj) {
            if (obj == null || VERSION.SDK_INT < 21) {
                return null;
            }
            CustomAction customAction = new CustomAction(C0365a.m1696a(obj), C0365a.m1697b(obj), C0365a.m1698c(obj), C0365a.m1699d(obj));
            customAction.f1017e = obj;
            return customAction;
        }

        public int describeContents() {
            return 0;
        }

        public String toString() {
            return "Action:mName='" + this.f1014b + ", mIcon=" + this.f1015c + ", mExtras=" + this.f1016d;
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeString(this.f1013a);
            TextUtils.writeToParcel(this.f1014b, parcel, i);
            parcel.writeInt(this.f1015c);
            parcel.writeBundle(this.f1016d);
        }
    }

    PlaybackStateCompat(int i, long j, long j2, float f, long j3, int i2, CharSequence charSequence, long j4, List<CustomAction> list, long j5, Bundle bundle) {
        this.f1018a = i;
        this.f1019b = j;
        this.f1020c = j2;
        this.f1021d = f;
        this.f1022e = j3;
        this.f1023f = i2;
        this.f1024g = charSequence;
        this.f1025h = j4;
        this.f1026i = new ArrayList(list);
        this.f1027j = j5;
        this.f1028k = bundle;
    }

    PlaybackStateCompat(Parcel parcel) {
        this.f1018a = parcel.readInt();
        this.f1019b = parcel.readLong();
        this.f1021d = parcel.readFloat();
        this.f1025h = parcel.readLong();
        this.f1020c = parcel.readLong();
        this.f1022e = parcel.readLong();
        this.f1024g = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        this.f1026i = parcel.createTypedArrayList(CustomAction.CREATOR);
        this.f1027j = parcel.readLong();
        this.f1028k = parcel.readBundle();
        this.f1023f = parcel.readInt();
    }

    public static PlaybackStateCompat m1578a(Object obj) {
        if (obj == null || VERSION.SDK_INT < 21) {
            return null;
        }
        List<Object> h = C0366e.m1707h(obj);
        List list = null;
        if (h != null) {
            list = new ArrayList(h.size());
            for (Object a : h) {
                list.add(CustomAction.m1577a(a));
            }
        }
        PlaybackStateCompat playbackStateCompat = new PlaybackStateCompat(C0366e.m1700a(obj), C0366e.m1701b(obj), C0366e.m1702c(obj), C0366e.m1703d(obj), C0366e.m1704e(obj), 0, C0366e.m1705f(obj), C0366e.m1706g(obj), list, C0366e.m1708i(obj), VERSION.SDK_INT >= 22 ? C0367f.m1709a(obj) : null);
        playbackStateCompat.f1029l = obj;
        return playbackStateCompat;
    }

    public int describeContents() {
        return 0;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("PlaybackState {");
        stringBuilder.append("state=").append(this.f1018a);
        stringBuilder.append(", position=").append(this.f1019b);
        stringBuilder.append(", buffered position=").append(this.f1020c);
        stringBuilder.append(", speed=").append(this.f1021d);
        stringBuilder.append(", updated=").append(this.f1025h);
        stringBuilder.append(", actions=").append(this.f1022e);
        stringBuilder.append(", error code=").append(this.f1023f);
        stringBuilder.append(", error message=").append(this.f1024g);
        stringBuilder.append(", custom actions=").append(this.f1026i);
        stringBuilder.append(", active item id=").append(this.f1027j);
        stringBuilder.append("}");
        return stringBuilder.toString();
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.f1018a);
        parcel.writeLong(this.f1019b);
        parcel.writeFloat(this.f1021d);
        parcel.writeLong(this.f1025h);
        parcel.writeLong(this.f1020c);
        parcel.writeLong(this.f1022e);
        TextUtils.writeToParcel(this.f1024g, parcel, i);
        parcel.writeTypedList(this.f1026i);
        parcel.writeLong(this.f1027j);
        parcel.writeBundle(this.f1028k);
        parcel.writeInt(this.f1023f);
    }
}
