package android.support.v4.media.session;

import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder.DeathRecipient;
import android.os.Message;
import android.os.ResultReceiver;
import android.support.v4.media.MediaMetadataCompat;
import android.support.v4.media.session.C0341a.C0342a;
import android.support.v4.media.session.C0357b.C0359a;
import android.support.v4.media.session.C0362c.C0346a;
import android.support.v4.media.session.MediaSessionCompat.QueueItem;
import android.support.v4.p010a.C0107g;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.List;

public final class MediaControllerCompat {

    static class MediaControllerImplApi21 {
        private final List<C0348a> f988a;
        private C0357b f989b;
        private HashMap<C0348a, C0344a> f990c;

        private static class ExtraBinderRequestResultReceiver extends ResultReceiver {
            private WeakReference<MediaControllerImplApi21> f986a;

            protected void onReceiveResult(int i, Bundle bundle) {
                MediaControllerImplApi21 mediaControllerImplApi21 = (MediaControllerImplApi21) this.f986a.get();
                if (mediaControllerImplApi21 != null && bundle != null) {
                    mediaControllerImplApi21.f989b = C0359a.m1689a(C0107g.m419a(bundle, "android.support.v4.media.session.EXTRA_BINDER"));
                    mediaControllerImplApi21.m1532a();
                }
            }
        }

        private static class C0344a extends C0343c {
            C0344a(C0348a c0348a) {
                super(c0348a);
            }

            public void mo159a() {
                throw new AssertionError();
            }

            public void mo161a(Bundle bundle) {
                throw new AssertionError();
            }

            public void mo162a(MediaMetadataCompat mediaMetadataCompat) {
                throw new AssertionError();
            }

            public void mo163a(ParcelableVolumeInfo parcelableVolumeInfo) {
                throw new AssertionError();
            }

            public void mo165a(CharSequence charSequence) {
                throw new AssertionError();
            }

            public void mo167a(List<QueueItem> list) {
                throw new AssertionError();
            }
        }

        private void m1532a() {
            if (this.f989b != null) {
                synchronized (this.f988a) {
                    for (C0348a c0348a : this.f988a) {
                        C0341a c0344a = new C0344a(c0348a);
                        this.f990c.put(c0348a, c0344a);
                        c0348a.f995b = true;
                        try {
                            this.f989b.mo187a(c0344a);
                        } catch (Throwable e) {
                            Log.e("MediaControllerCompat", "Dead object in registerCallback.", e);
                        }
                    }
                    this.f988a.clear();
                }
            }
        }
    }

    public static abstract class C0348a implements DeathRecipient {
        C0345a f994a;
        boolean f995b;
        private final Object f996c;

        private static class C0343c extends C0342a {
            private final WeakReference<C0348a> f987a;

            C0343c(C0348a c0348a) {
                this.f987a = new WeakReference(c0348a);
            }

            public void mo159a() {
                C0348a c0348a = (C0348a) this.f987a.get();
                if (c0348a != null) {
                    c0348a.m1552a(8, null, null);
                }
            }

            public void mo160a(int i) {
                C0348a c0348a = (C0348a) this.f987a.get();
                if (c0348a != null) {
                    c0348a.m1552a(9, Integer.valueOf(i), null);
                }
            }

            public void mo161a(Bundle bundle) {
                C0348a c0348a = (C0348a) this.f987a.get();
                if (c0348a != null) {
                    c0348a.m1552a(7, bundle, null);
                }
            }

            public void mo162a(MediaMetadataCompat mediaMetadataCompat) {
                C0348a c0348a = (C0348a) this.f987a.get();
                if (c0348a != null) {
                    c0348a.m1552a(3, mediaMetadataCompat, null);
                }
            }

            public void mo163a(ParcelableVolumeInfo parcelableVolumeInfo) {
                C0348a c0348a = (C0348a) this.f987a.get();
                if (c0348a != null) {
                    c0348a.m1552a(4, parcelableVolumeInfo != null ? new C0349b(parcelableVolumeInfo.f1008a, parcelableVolumeInfo.f1009b, parcelableVolumeInfo.f1010c, parcelableVolumeInfo.f1011d, parcelableVolumeInfo.f1012e) : null, null);
                }
            }

            public void mo164a(PlaybackStateCompat playbackStateCompat) {
                C0348a c0348a = (C0348a) this.f987a.get();
                if (c0348a != null) {
                    c0348a.m1552a(2, playbackStateCompat, null);
                }
            }

            public void mo165a(CharSequence charSequence) {
                C0348a c0348a = (C0348a) this.f987a.get();
                if (c0348a != null) {
                    c0348a.m1552a(6, charSequence, null);
                }
            }

            public void mo166a(String str, Bundle bundle) {
                C0348a c0348a = (C0348a) this.f987a.get();
                if (c0348a != null) {
                    c0348a.m1552a(1, str, bundle);
                }
            }

            public void mo167a(List<QueueItem> list) {
                C0348a c0348a = (C0348a) this.f987a.get();
                if (c0348a != null) {
                    c0348a.m1552a(5, list, null);
                }
            }

            public void mo168a(boolean z) {
                C0348a c0348a = (C0348a) this.f987a.get();
                if (c0348a != null) {
                    c0348a.m1552a(10, Boolean.valueOf(z), null);
                }
            }

            public void mo169b(int i) {
                C0348a c0348a = (C0348a) this.f987a.get();
                if (c0348a != null) {
                    c0348a.m1552a(12, Integer.valueOf(i), null);
                }
            }

            public void mo170b(boolean z) {
                C0348a c0348a = (C0348a) this.f987a.get();
                if (c0348a != null) {
                    c0348a.m1552a(11, Boolean.valueOf(z), null);
                }
            }
        }

        private class C0345a extends Handler {
            boolean f991a;
            final /* synthetic */ C0348a f992b;

            public void handleMessage(Message message) {
                if (this.f991a) {
                    switch (message.what) {
                        case 1:
                            this.f992b.m1558a((String) message.obj, message.getData());
                            return;
                        case 2:
                            this.f992b.m1556a((PlaybackStateCompat) message.obj);
                            return;
                        case 3:
                            this.f992b.m1554a((MediaMetadataCompat) message.obj);
                            return;
                        case 4:
                            this.f992b.m1555a((C0349b) message.obj);
                            return;
                        case 5:
                            this.f992b.m1559a((List) message.obj);
                            return;
                        case 6:
                            this.f992b.m1557a((CharSequence) message.obj);
                            return;
                        case 7:
                            this.f992b.m1553a((Bundle) message.obj);
                            return;
                        case 8:
                            this.f992b.m1550a();
                            return;
                        case 9:
                            this.f992b.m1551a(((Integer) message.obj).intValue());
                            return;
                        case 10:
                            this.f992b.m1562b(((Boolean) message.obj).booleanValue());
                            return;
                        case 11:
                            this.f992b.m1560a(((Boolean) message.obj).booleanValue());
                            return;
                        case 12:
                            this.f992b.m1561b(((Integer) message.obj).intValue());
                            return;
                        default:
                            return;
                    }
                }
            }
        }

        private static class C0347b implements C0346a {
            private final WeakReference<C0348a> f993a;

            C0347b(C0348a c0348a) {
                this.f993a = new WeakReference(c0348a);
            }

            public void mo171a() {
                C0348a c0348a = (C0348a) this.f993a.get();
                if (c0348a != null) {
                    c0348a.m1550a();
                }
            }

            public void mo172a(int i, int i2, int i3, int i4, int i5) {
                C0348a c0348a = (C0348a) this.f993a.get();
                if (c0348a != null) {
                    c0348a.m1555a(new C0349b(i, i2, i3, i4, i5));
                }
            }

            public void mo173a(Bundle bundle) {
                C0348a c0348a = (C0348a) this.f993a.get();
                if (c0348a != null) {
                    c0348a.m1553a(bundle);
                }
            }

            public void mo174a(CharSequence charSequence) {
                C0348a c0348a = (C0348a) this.f993a.get();
                if (c0348a != null) {
                    c0348a.m1557a(charSequence);
                }
            }

            public void mo175a(Object obj) {
                C0348a c0348a = (C0348a) this.f993a.get();
                if (c0348a != null && !c0348a.f995b) {
                    c0348a.m1556a(PlaybackStateCompat.m1578a(obj));
                }
            }

            public void mo176a(String str, Bundle bundle) {
                C0348a c0348a = (C0348a) this.f993a.get();
                if (c0348a == null) {
                    return;
                }
                if (!c0348a.f995b || VERSION.SDK_INT >= 23) {
                    c0348a.m1558a(str, bundle);
                }
            }

            public void mo177a(List<?> list) {
                C0348a c0348a = (C0348a) this.f993a.get();
                if (c0348a != null) {
                    c0348a.m1559a(QueueItem.m1566a((List) list));
                }
            }

            public void mo178b(Object obj) {
                C0348a c0348a = (C0348a) this.f993a.get();
                if (c0348a != null) {
                    c0348a.m1554a(MediaMetadataCompat.m1476a(obj));
                }
            }
        }

        public C0348a() {
            if (VERSION.SDK_INT >= 21) {
                this.f996c = C0362c.m1693a(new C0347b(this));
            } else {
                this.f996c = new C0343c(this);
            }
        }

        public void m1550a() {
        }

        public void m1551a(int i) {
        }

        void m1552a(int i, Object obj, Bundle bundle) {
            if (this.f994a != null) {
                Message obtainMessage = this.f994a.obtainMessage(i, obj);
                obtainMessage.setData(bundle);
                obtainMessage.sendToTarget();
            }
        }

        public void m1553a(Bundle bundle) {
        }

        public void m1554a(MediaMetadataCompat mediaMetadataCompat) {
        }

        public void m1555a(C0349b c0349b) {
        }

        public void m1556a(PlaybackStateCompat playbackStateCompat) {
        }

        public void m1557a(CharSequence charSequence) {
        }

        public void m1558a(String str, Bundle bundle) {
        }

        public void m1559a(List<QueueItem> list) {
        }

        public void m1560a(boolean z) {
        }

        public void m1561b(int i) {
        }

        @Deprecated
        public void m1562b(boolean z) {
        }
    }

    public static final class C0349b {
        private final int f997a;
        private final int f998b;
        private final int f999c;
        private final int f1000d;
        private final int f1001e;

        C0349b(int i, int i2, int i3, int i4, int i5) {
            this.f997a = i;
            this.f998b = i2;
            this.f999c = i3;
            this.f1000d = i4;
            this.f1001e = i5;
        }
    }
}
