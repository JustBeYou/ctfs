package android.support.v7.view.menu;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.v4.p012d.p013a.C0204c;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;

class C0540v extends C0535r implements SubMenu {
    C0540v(Context context, C0204c c0204c) {
        super(context, c0204c);
    }

    public C0204c m2574b() {
        return (C0204c) this.b;
    }

    public void clearHeader() {
        m2574b().clearHeader();
    }

    public MenuItem getItem() {
        return m2349a(m2574b().getItem());
    }

    public SubMenu setHeaderIcon(int i) {
        m2574b().setHeaderIcon(i);
        return this;
    }

    public SubMenu setHeaderIcon(Drawable drawable) {
        m2574b().setHeaderIcon(drawable);
        return this;
    }

    public SubMenu setHeaderTitle(int i) {
        m2574b().setHeaderTitle(i);
        return this;
    }

    public SubMenu setHeaderTitle(CharSequence charSequence) {
        m2574b().setHeaderTitle(charSequence);
        return this;
    }

    public SubMenu setHeaderView(View view) {
        m2574b().setHeaderView(view);
        return this;
    }

    public SubMenu setIcon(int i) {
        m2574b().setIcon(i);
        return this;
    }

    public SubMenu setIcon(Drawable drawable) {
        m2574b().setIcon(drawable);
        return this;
    }
}
