package android.support.v4.media.session;

import android.media.AudioAttributes;
import android.media.MediaMetadata;
import android.media.session.MediaController.Callback;
import android.media.session.MediaController.PlaybackInfo;
import android.media.session.MediaSession.QueueItem;
import android.media.session.PlaybackState;
import android.os.Bundle;
import java.util.List;

class C0362c {

    public interface C0346a {
        void mo171a();

        void mo172a(int i, int i2, int i3, int i4, int i5);

        void mo173a(Bundle bundle);

        void mo174a(CharSequence charSequence);

        void mo175a(Object obj);

        void mo176a(String str, Bundle bundle);

        void mo177a(List<?> list);

        void mo178b(Object obj);
    }

    static class C0360b<T extends C0346a> extends Callback {
        protected final T f1032a;

        public C0360b(T t) {
            this.f1032a = t;
        }

        public void onAudioInfoChanged(PlaybackInfo playbackInfo) {
            this.f1032a.mo172a(playbackInfo.getPlaybackType(), C0361c.m1692b(playbackInfo), playbackInfo.getVolumeControl(), playbackInfo.getMaxVolume(), playbackInfo.getCurrentVolume());
        }

        public void onExtrasChanged(Bundle bundle) {
            this.f1032a.mo173a(bundle);
        }

        public void onMetadataChanged(MediaMetadata mediaMetadata) {
            this.f1032a.mo178b(mediaMetadata);
        }

        public void onPlaybackStateChanged(PlaybackState playbackState) {
            this.f1032a.mo175a((Object) playbackState);
        }

        public void onQueueChanged(List<QueueItem> list) {
            this.f1032a.mo177a((List) list);
        }

        public void onQueueTitleChanged(CharSequence charSequence) {
            this.f1032a.mo174a(charSequence);
        }

        public void onSessionDestroyed() {
            this.f1032a.mo171a();
        }

        public void onSessionEvent(String str, Bundle bundle) {
            this.f1032a.mo176a(str, bundle);
        }
    }

    public static class C0361c {
        private static int m1690a(AudioAttributes audioAttributes) {
            if ((audioAttributes.getFlags() & 1) == 1) {
                return 7;
            }
            if ((audioAttributes.getFlags() & 4) == 4) {
                return 6;
            }
            switch (audioAttributes.getUsage()) {
                case 1:
                case 11:
                case 12:
                case 14:
                    return 3;
                case 2:
                    return 0;
                case 3:
                    return 8;
                case 4:
                    return 4;
                case 5:
                case 7:
                case 8:
                case 9:
                case 10:
                    return 5;
                case 6:
                    return 2;
                case 13:
                    return 1;
                default:
                    return 3;
            }
        }

        public static AudioAttributes m1691a(Object obj) {
            return ((PlaybackInfo) obj).getAudioAttributes();
        }

        public static int m1692b(Object obj) {
            return C0361c.m1690a(C0361c.m1691a(obj));
        }
    }

    public static Object m1693a(C0346a c0346a) {
        return new C0360b(c0346a);
    }
}
