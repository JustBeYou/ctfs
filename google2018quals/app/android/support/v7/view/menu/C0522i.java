package android.support.v7.view.menu;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.content.DialogInterface.OnKeyListener;
import android.os.IBinder;
import android.support.v7.app.C0432b;
import android.support.v7.app.C0432b.C0429a;
import android.support.v7.p020a.C0411a.C0407g;
import android.support.v7.view.menu.C0506o.C0459a;
import android.view.KeyEvent;
import android.view.KeyEvent.DispatcherState;
import android.view.View;
import android.view.Window;
import android.view.WindowManager.LayoutParams;

class C0522i implements OnClickListener, OnDismissListener, OnKeyListener, C0459a {
    C0519f f1653a;
    private C0521h f1654b;
    private C0432b f1655c;
    private C0459a f1656d;

    public C0522i(C0521h c0521h) {
        this.f1654b = c0521h;
    }

    public void m2479a() {
        if (this.f1655c != null) {
            this.f1655c.dismiss();
        }
    }

    public void m2480a(IBinder iBinder) {
        C0521h c0521h = this.f1654b;
        C0429a c0429a = new C0429a(c0521h.m2464e());
        this.f1653a = new C0519f(c0429a.m1897a(), C0407g.abc_list_menu_item_layout);
        this.f1653a.mo404a((C0459a) this);
        this.f1654b.m2443a(this.f1653a);
        c0429a.m1901a(this.f1653a.m2411a(), this);
        View o = c0521h.m2475o();
        if (o != null) {
            c0429a.m1900a(o);
        } else {
            c0429a.m1899a(c0521h.m2474n()).m1902a(c0521h.m2473m());
        }
        c0429a.m1898a((OnKeyListener) this);
        this.f1655c = c0429a.m1903b();
        this.f1655c.setOnDismissListener(this);
        LayoutParams attributes = this.f1655c.getWindow().getAttributes();
        attributes.type = 1003;
        if (iBinder != null) {
            attributes.token = iBinder;
        }
        attributes.flags |= 131072;
        this.f1655c.show();
    }

    public void mo321a(C0521h c0521h, boolean z) {
        if (z || c0521h == this.f1654b) {
            m2479a();
        }
        if (this.f1656d != null) {
            this.f1656d.mo321a(c0521h, z);
        }
    }

    public boolean mo322a(C0521h c0521h) {
        return this.f1656d != null ? this.f1656d.mo322a(c0521h) : false;
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        this.f1654b.m2449a((C0524j) this.f1653a.m2411a().getItem(i), 0);
    }

    public void onDismiss(DialogInterface dialogInterface) {
        this.f1653a.mo403a(this.f1654b, true);
    }

    public boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
        if (i == 82 || i == 4) {
            Window window;
            View decorView;
            DispatcherState keyDispatcherState;
            if (keyEvent.getAction() == 0 && keyEvent.getRepeatCount() == 0) {
                window = this.f1655c.getWindow();
                if (window != null) {
                    decorView = window.getDecorView();
                    if (decorView != null) {
                        keyDispatcherState = decorView.getKeyDispatcherState();
                        if (keyDispatcherState != null) {
                            keyDispatcherState.startTracking(keyEvent, this);
                            return true;
                        }
                    }
                }
            } else if (keyEvent.getAction() == 1 && !keyEvent.isCanceled()) {
                window = this.f1655c.getWindow();
                if (window != null) {
                    decorView = window.getDecorView();
                    if (decorView != null) {
                        keyDispatcherState = decorView.getKeyDispatcherState();
                        if (keyDispatcherState != null && keyDispatcherState.isTracking(keyEvent)) {
                            this.f1654b.m2447a(true);
                            dialogInterface.dismiss();
                            return true;
                        }
                    }
                }
            }
        }
        return this.f1654b.performShortcut(i, keyEvent, 0);
    }
}
