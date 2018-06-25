package android.support.v4.media.session;

import android.media.session.PlaybackState;
import android.media.session.PlaybackState.CustomAction;
import android.os.Bundle;
import java.util.List;

class C0366e {

    static final class C0365a {
        public static String m1696a(Object obj) {
            return ((CustomAction) obj).getAction();
        }

        public static CharSequence m1697b(Object obj) {
            return ((CustomAction) obj).getName();
        }

        public static int m1698c(Object obj) {
            return ((CustomAction) obj).getIcon();
        }

        public static Bundle m1699d(Object obj) {
            return ((CustomAction) obj).getExtras();
        }
    }

    public static int m1700a(Object obj) {
        return ((PlaybackState) obj).getState();
    }

    public static long m1701b(Object obj) {
        return ((PlaybackState) obj).getPosition();
    }

    public static long m1702c(Object obj) {
        return ((PlaybackState) obj).getBufferedPosition();
    }

    public static float m1703d(Object obj) {
        return ((PlaybackState) obj).getPlaybackSpeed();
    }

    public static long m1704e(Object obj) {
        return ((PlaybackState) obj).getActions();
    }

    public static CharSequence m1705f(Object obj) {
        return ((PlaybackState) obj).getErrorMessage();
    }

    public static long m1706g(Object obj) {
        return ((PlaybackState) obj).getLastPositionUpdateTime();
    }

    public static List<Object> m1707h(Object obj) {
        return ((PlaybackState) obj).getCustomActions();
    }

    public static long m1708i(Object obj) {
        return ((PlaybackState) obj).getActiveQueueItemId();
    }
}
