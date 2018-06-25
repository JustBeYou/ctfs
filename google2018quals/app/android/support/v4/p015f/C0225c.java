package android.support.v4.p015f;

import android.os.Handler;
import android.os.Handler.Callback;
import android.os.HandlerThread;
import android.os.Message;
import java.util.concurrent.Callable;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class C0225c {
    private final Object f818a = new Object();
    private HandlerThread f819b;
    private Handler f820c;
    private int f821d;
    private Callback f822e = new C02211(this);
    private final int f823f;
    private final int f824g;
    private final String f825h;

    public interface C0214a<T> {
        void mo94a(T t);
    }

    class C02211 implements Callback {
        final /* synthetic */ C0225c f805a;

        C02211(C0225c c0225c) {
            this.f805a = c0225c;
        }

        public boolean handleMessage(Message message) {
            switch (message.what) {
                case 0:
                    this.f805a.m1072a();
                    break;
                case 1:
                    this.f805a.m1076b((Runnable) message.obj);
                    break;
            }
            return true;
        }
    }

    public C0225c(String str, int i, int i2) {
        this.f825h = str;
        this.f824g = i;
        this.f823f = i2;
        this.f821d = 0;
    }

    private void m1072a() {
        synchronized (this.f818a) {
            if (this.f820c.hasMessages(1)) {
                return;
            }
            this.f819b.quit();
            this.f819b = null;
            this.f820c = null;
        }
    }

    private void m1075a(Runnable runnable) {
        synchronized (this.f818a) {
            if (this.f819b == null) {
                this.f819b = new HandlerThread(this.f825h, this.f824g);
                this.f819b.start();
                this.f820c = new Handler(this.f819b.getLooper(), this.f822e);
                this.f821d++;
            }
            this.f820c.removeMessages(0);
            this.f820c.sendMessage(this.f820c.obtainMessage(1, runnable));
        }
    }

    private void m1076b(Runnable runnable) {
        runnable.run();
        synchronized (this.f818a) {
            this.f820c.removeMessages(0);
            this.f820c.sendMessageDelayed(this.f820c.obtainMessage(0), (long) this.f823f);
        }
    }

    public <T> T m1077a(Callable<T> callable, int i) {
        final ReentrantLock reentrantLock = new ReentrantLock();
        final Condition newCondition = reentrantLock.newCondition();
        final AtomicReference atomicReference = new AtomicReference();
        final AtomicBoolean atomicBoolean = new AtomicBoolean(true);
        final Callable<T> callable2 = callable;
        m1075a(new Runnable(this) {
            final /* synthetic */ C0225c f817f;

            public void run() {
                try {
                    atomicReference.set(callable2.call());
                } catch (Exception e) {
                }
                reentrantLock.lock();
                try {
                    atomicBoolean.set(false);
                    newCondition.signal();
                } finally {
                    reentrantLock.unlock();
                }
            }
        });
        reentrantLock.lock();
        try {
            T t;
            if (atomicBoolean.get()) {
                long toNanos = TimeUnit.MILLISECONDS.toNanos((long) i);
                while (true) {
                    try {
                        toNanos = newCondition.awaitNanos(toNanos);
                    } catch (InterruptedException e) {
                    }
                    if (!atomicBoolean.get()) {
                        break;
                    } else if (toNanos <= 0) {
                        throw new InterruptedException("timeout");
                    }
                }
                t = atomicReference.get();
                reentrantLock.unlock();
            } else {
                t = atomicReference.get();
            }
            return t;
        } finally {
            reentrantLock.unlock();
        }
    }

    public <T> void m1078a(final Callable<T> callable, final C0214a<T> c0214a) {
        final Handler handler = new Handler();
        m1075a(new Runnable(this) {
            final /* synthetic */ C0225c f811d;

            public void run() {
                Object call;
                try {
                    call = callable.call();
                } catch (Exception e) {
                    call = null;
                }
                handler.post(new Runnable(this) {
                    final /* synthetic */ C02232 f807b;

                    public void run() {
                        c0214a.mo94a(call);
                    }
                });
            }
        });
    }
}
