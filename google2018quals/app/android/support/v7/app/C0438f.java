package android.support.v7.app;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources.NotFoundException;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.v7.view.C0436i;
import android.support.v7.view.C0479b;
import android.support.v7.view.C0479b.C0462a;
import android.support.v7.view.C0496g;
import android.support.v7.view.menu.C0521h;
import android.support.v7.widget.aw;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.view.Window;
import android.view.Window.Callback;
import java.lang.Thread.UncaughtExceptionHandler;

abstract class C0438f extends C0434e {
    private static boolean f1238m = true;
    private static final boolean f1239n = (VERSION.SDK_INT < 21);
    private static final int[] f1240o = new int[]{16842836};
    final Context f1241a;
    final Window f1242b;
    final Callback f1243c = this.f1242b.getCallback();
    final Callback f1244d;
    final C0430d f1245e;
    C0428a f1246f;
    MenuInflater f1247g;
    boolean f1248h;
    boolean f1249i;
    boolean f1250j;
    boolean f1251k;
    boolean f1252l;
    private CharSequence f1253p;
    private boolean f1254q;
    private boolean f1255r;

    class C0437a extends C0436i {
        final /* synthetic */ C0438f f1237a;

        C0437a(C0438f c0438f, Callback callback) {
            this.f1237a = c0438f;
            super(callback);
        }

        public boolean dispatchKeyEvent(KeyEvent keyEvent) {
            return this.f1237a.mo302a(keyEvent) || super.dispatchKeyEvent(keyEvent);
        }

        public boolean dispatchKeyShortcutEvent(KeyEvent keyEvent) {
            return super.dispatchKeyShortcutEvent(keyEvent) || this.f1237a.mo300a(keyEvent.getKeyCode(), keyEvent);
        }

        public void onContentChanged() {
        }

        public boolean onCreatePanelMenu(int i, Menu menu) {
            return (i != 0 || (menu instanceof C0521h)) ? super.onCreatePanelMenu(i, menu) : false;
        }

        public boolean onMenuOpened(int i, Menu menu) {
            super.onMenuOpened(i, menu);
            this.f1237a.mo307b(i, menu);
            return true;
        }

        public void onPanelClosed(int i, Menu menu) {
            super.onPanelClosed(i, menu);
            this.f1237a.mo294a(i, menu);
        }

        public boolean onPreparePanel(int i, View view, Menu menu) {
            C0521h c0521h = menu instanceof C0521h ? (C0521h) menu : null;
            if (i == 0 && c0521h == null) {
                return false;
            }
            if (c0521h != null) {
                c0521h.m2458c(true);
            }
            boolean onPreparePanel = super.onPreparePanel(i, view, menu);
            if (c0521h == null) {
                return onPreparePanel;
            }
            c0521h.m2458c(false);
            return onPreparePanel;
        }
    }

    static {
        if (f1239n && !f1238m) {
            final UncaughtExceptionHandler defaultUncaughtExceptionHandler = Thread.getDefaultUncaughtExceptionHandler();
            Thread.setDefaultUncaughtExceptionHandler(new UncaughtExceptionHandler() {
                private boolean m1952a(Throwable th) {
                    if (!(th instanceof NotFoundException)) {
                        return false;
                    }
                    String message = th.getMessage();
                    return message != null ? message.contains("drawable") || message.contains("Drawable") : false;
                }

                public void uncaughtException(Thread thread, Throwable th) {
                    if (m1952a(th)) {
                        Throwable notFoundException = new NotFoundException(th.getMessage() + ". If the resource you are trying to use is a vector resource, you may be referencing it in an unsupported way. See AppCompatDelegate.setCompatVectorFromResourcesEnabled() for more info.");
                        notFoundException.initCause(th.getCause());
                        notFoundException.setStackTrace(th.getStackTrace());
                        defaultUncaughtExceptionHandler.uncaughtException(thread, notFoundException);
                        return;
                    }
                    defaultUncaughtExceptionHandler.uncaughtException(thread, th);
                }
            });
        }
    }

    C0438f(Context context, Window window, C0430d c0430d) {
        this.f1241a = context;
        this.f1242b = window;
        this.f1245e = c0430d;
        if (this.f1243c instanceof C0437a) {
            throw new IllegalStateException("AppCompat has already installed itself into the Window");
        }
        this.f1244d = mo314a(this.f1243c);
        this.f1242b.setCallback(this.f1244d);
        aw a = aw.m2952a(context, null, f1240o);
        Drawable b = a.m2961b(0);
        if (b != null) {
            this.f1242b.setBackgroundDrawable(b);
        }
        a.m2958a();
    }

    public C0428a mo281a() {
        mo312l();
        return this.f1246f;
    }

    abstract C0479b mo292a(C0462a c0462a);

    Callback mo314a(Callback callback) {
        return new C0437a(this, callback);
    }

    abstract void mo294a(int i, Menu menu);

    public final void mo282a(CharSequence charSequence) {
        this.f1253p = charSequence;
        mo306b(charSequence);
    }

    abstract boolean mo300a(int i, KeyEvent keyEvent);

    abstract boolean mo302a(KeyEvent keyEvent);

    public MenuInflater mo283b() {
        if (this.f1247g == null) {
            mo312l();
            this.f1247g = new C0496g(this.f1246f != null ? this.f1246f.mo334b() : this.f1241a);
        }
        return this.f1247g;
    }

    abstract void mo306b(CharSequence charSequence);

    abstract boolean mo307b(int i, Menu menu);

    public void mo284c() {
        this.f1254q = true;
    }

    public void mo285c(Bundle bundle) {
    }

    public void mo286d() {
        this.f1254q = false;
    }

    public void mo287g() {
        this.f1255r = true;
    }

    public boolean mo288i() {
        return false;
    }

    abstract void mo312l();

    final C0428a m1969m() {
        return this.f1246f;
    }

    final Context m1970n() {
        Context context = null;
        C0428a a = mo281a();
        if (a != null) {
            context = a.mo334b();
        }
        return context == null ? this.f1241a : context;
    }

    public boolean mo316o() {
        return false;
    }

    final boolean m1972p() {
        return this.f1255r;
    }

    final Callback m1973q() {
        return this.f1242b.getCallback();
    }

    final CharSequence m1974r() {
        return this.f1243c instanceof Activity ? ((Activity) this.f1243c).getTitle() : this.f1253p;
    }
}
