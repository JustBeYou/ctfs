package android.support.v4.media.session;

import android.os.Build.VERSION;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.os.ResultReceiver;
import android.support.v4.media.MediaDescriptionCompat;
import android.support.v4.media.session.C0364d.C0363a;
import java.util.ArrayList;
import java.util.List;

public class MediaSessionCompat {

    public static final class QueueItem implements Parcelable {
        public static final Creator<QueueItem> CREATOR = new C03501();
        private final MediaDescriptionCompat f1002a;
        private final long f1003b;
        private Object f1004c;

        static class C03501 implements Creator<QueueItem> {
            C03501() {
            }

            public QueueItem m1563a(Parcel parcel) {
                return new QueueItem(parcel);
            }

            public QueueItem[] m1564a(int i) {
                return new QueueItem[i];
            }

            public /* synthetic */ Object createFromParcel(Parcel parcel) {
                return m1563a(parcel);
            }

            public /* synthetic */ Object[] newArray(int i) {
                return m1564a(i);
            }
        }

        QueueItem(Parcel parcel) {
            this.f1002a = (MediaDescriptionCompat) MediaDescriptionCompat.CREATOR.createFromParcel(parcel);
            this.f1003b = parcel.readLong();
        }

        private QueueItem(Object obj, MediaDescriptionCompat mediaDescriptionCompat, long j) {
            if (mediaDescriptionCompat == null) {
                throw new IllegalArgumentException("Description cannot be null.");
            } else if (j == -1) {
                throw new IllegalArgumentException("Id cannot be QueueItem.UNKNOWN_ID");
            } else {
                this.f1002a = mediaDescriptionCompat;
                this.f1003b = j;
                this.f1004c = obj;
            }
        }

        public static QueueItem m1565a(Object obj) {
            return (obj == null || VERSION.SDK_INT < 21) ? null : new QueueItem(obj, MediaDescriptionCompat.m1472a(C0363a.m1694a(obj)), C0363a.m1695b(obj));
        }

        public static List<QueueItem> m1566a(List<?> list) {
            if (list == null || VERSION.SDK_INT < 21) {
                return null;
            }
            List<QueueItem> arrayList = new ArrayList();
            for (Object a : list) {
                arrayList.add(m1565a(a));
            }
            return arrayList;
        }

        public int describeContents() {
            return 0;
        }

        public String toString() {
            return "MediaSession.QueueItem {Description=" + this.f1002a + ", Id=" + this.f1003b + " }";
        }

        public void writeToParcel(Parcel parcel, int i) {
            this.f1002a.writeToParcel(parcel, i);
            parcel.writeLong(this.f1003b);
        }
    }

    static final class ResultReceiverWrapper implements Parcelable {
        public static final Creator<ResultReceiverWrapper> CREATOR = new C03511();
        private ResultReceiver f1005a;

        static class C03511 implements Creator<ResultReceiverWrapper> {
            C03511() {
            }

            public ResultReceiverWrapper m1567a(Parcel parcel) {
                return new ResultReceiverWrapper(parcel);
            }

            public ResultReceiverWrapper[] m1568a(int i) {
                return new ResultReceiverWrapper[i];
            }

            public /* synthetic */ Object createFromParcel(Parcel parcel) {
                return m1567a(parcel);
            }

            public /* synthetic */ Object[] newArray(int i) {
                return m1568a(i);
            }
        }

        ResultReceiverWrapper(Parcel parcel) {
            this.f1005a = (ResultReceiver) ResultReceiver.CREATOR.createFromParcel(parcel);
        }

        public int describeContents() {
            return 0;
        }

        public void writeToParcel(Parcel parcel, int i) {
            this.f1005a.writeToParcel(parcel, i);
        }
    }

    public static final class Token implements Parcelable {
        public static final Creator<Token> CREATOR = new C03521();
        private final Object f1006a;
        private final C0357b f1007b;

        static class C03521 implements Creator<Token> {
            C03521() {
            }

            public Token m1569a(Parcel parcel) {
                return new Token(VERSION.SDK_INT >= 21 ? parcel.readParcelable(null) : parcel.readStrongBinder());
            }

            public Token[] m1570a(int i) {
                return new Token[i];
            }

            public /* synthetic */ Object createFromParcel(Parcel parcel) {
                return m1569a(parcel);
            }

            public /* synthetic */ Object[] newArray(int i) {
                return m1570a(i);
            }
        }

        Token(Object obj) {
            this(obj, null);
        }

        Token(Object obj, C0357b c0357b) {
            this.f1006a = obj;
            this.f1007b = c0357b;
        }

        public int describeContents() {
            return 0;
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Token)) {
                return false;
            }
            Token token = (Token) obj;
            return this.f1006a == null ? token.f1006a == null : token.f1006a == null ? false : this.f1006a.equals(token.f1006a);
        }

        public int hashCode() {
            return this.f1006a == null ? 0 : this.f1006a.hashCode();
        }

        public void writeToParcel(Parcel parcel, int i) {
            if (VERSION.SDK_INT >= 21) {
                parcel.writeParcelable((Parcelable) this.f1006a, i);
            } else {
                parcel.writeStrongBinder((IBinder) this.f1006a);
            }
        }
    }
}
