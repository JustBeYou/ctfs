package android.support.v4.media;

import android.media.MediaDescription;
import android.media.MediaDescription.Builder;
import android.net.Uri;
import android.support.v4.media.C0337a.C0336a;

class C0339b extends C0337a {

    static class C0338a extends C0336a {
        public static void m1497b(Object obj, Uri uri) {
            ((Builder) obj).setMediaUri(uri);
        }
    }

    public static Uri m1498h(Object obj) {
        return ((MediaDescription) obj).getMediaUri();
    }
}
