package android.support.v4.media;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.p014e.C0211b;
import android.util.Log;
import java.util.ArrayList;
import java.util.List;

public final class MediaBrowserCompat {
    static final boolean f960a = Log.isLoggable("MediaBrowserCompat", 3);

    private static class CustomActionResultReceiver extends C0211b {
        private final String f950d;
        private final Bundle f951e;
        private final C0329a f952f;

        protected void mo158a(int i, Bundle bundle) {
            if (this.f952f != null) {
                switch (i) {
                    case -1:
                        this.f952f.m1456c(this.f950d, this.f951e, bundle);
                        return;
                    case 0:
                        this.f952f.m1455b(this.f950d, this.f951e, bundle);
                        return;
                    case 1:
                        this.f952f.m1454a(this.f950d, this.f951e, bundle);
                        return;
                    default:
                        Log.w("MediaBrowserCompat", "Unknown result code: " + i + " (extras=" + this.f951e + ", resultData=" + bundle + ")");
                        return;
                }
            }
        }
    }

    private static class ItemReceiver extends C0211b {
        private final String f953d;
        private final C0330b f954e;

        protected void mo158a(int i, Bundle bundle) {
            if (bundle != null) {
                bundle.setClassLoader(MediaBrowserCompat.class.getClassLoader());
            }
            if (i == 0 && bundle != null && bundle.containsKey("media_item")) {
                Parcelable parcelable = bundle.getParcelable("media_item");
                if (parcelable == null || (parcelable instanceof MediaItem)) {
                    this.f954e.m1457a((MediaItem) parcelable);
                    return;
                } else {
                    this.f954e.m1458a(this.f953d);
                    return;
                }
            }
            this.f954e.m1458a(this.f953d);
        }
    }

    public static class MediaItem implements Parcelable {
        public static final Creator<MediaItem> CREATOR = new C03281();
        private final int f955a;
        private final MediaDescriptionCompat f956b;

        static class C03281 implements Creator<MediaItem> {
            C03281() {
            }

            public MediaItem m1451a(Parcel parcel) {
                return new MediaItem(parcel);
            }

            public MediaItem[] m1452a(int i) {
                return new MediaItem[i];
            }

            public /* synthetic */ Object createFromParcel(Parcel parcel) {
                return m1451a(parcel);
            }

            public /* synthetic */ Object[] newArray(int i) {
                return m1452a(i);
            }
        }

        MediaItem(Parcel parcel) {
            this.f955a = parcel.readInt();
            this.f956b = (MediaDescriptionCompat) MediaDescriptionCompat.CREATOR.createFromParcel(parcel);
        }

        public int describeContents() {
            return 0;
        }

        public String toString() {
            StringBuilder stringBuilder = new StringBuilder("MediaItem{");
            stringBuilder.append("mFlags=").append(this.f955a);
            stringBuilder.append(", mDescription=").append(this.f956b);
            stringBuilder.append('}');
            return stringBuilder.toString();
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeInt(this.f955a);
            this.f956b.writeToParcel(parcel, i);
        }
    }

    private static class SearchResultReceiver extends C0211b {
        private final String f957d;
        private final Bundle f958e;
        private final C0331c f959f;

        protected void mo158a(int i, Bundle bundle) {
            if (bundle != null) {
                bundle.setClassLoader(MediaBrowserCompat.class.getClassLoader());
            }
            if (i == 0 && bundle != null && bundle.containsKey("search_results")) {
                Parcelable[] parcelableArray = bundle.getParcelableArray("search_results");
                List list = null;
                if (parcelableArray != null) {
                    List arrayList = new ArrayList();
                    for (Parcelable parcelable : parcelableArray) {
                        arrayList.add((MediaItem) parcelable);
                    }
                    list = arrayList;
                }
                this.f959f.m1460a(this.f957d, this.f958e, list);
                return;
            }
            this.f959f.m1459a(this.f957d, this.f958e);
        }
    }

    public static abstract class C0329a {
        public void m1454a(String str, Bundle bundle, Bundle bundle2) {
        }

        public void m1455b(String str, Bundle bundle, Bundle bundle2) {
        }

        public void m1456c(String str, Bundle bundle, Bundle bundle2) {
        }
    }

    public static abstract class C0330b {
        public void m1457a(MediaItem mediaItem) {
        }

        public void m1458a(String str) {
        }
    }

    public static abstract class C0331c {
        public void m1459a(String str, Bundle bundle) {
        }

        public void m1460a(String str, Bundle bundle, List<MediaItem> list) {
        }
    }
}
