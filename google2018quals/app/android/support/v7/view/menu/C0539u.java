package android.support.v7.view.menu;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.v7.view.menu.C0521h.C0442a;
import android.view.Menu;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;

public class C0539u extends C0521h implements SubMenu {
    private C0521h f1736d;
    private C0524j f1737e;

    public C0539u(Context context, C0521h c0521h, C0524j c0524j) {
        super(context);
        this.f1736d = c0521h;
        this.f1737e = c0524j;
    }

    public String mo437a() {
        int itemId = this.f1737e != null ? this.f1737e.getItemId() : 0;
        return itemId == 0 ? null : super.mo437a() + ":" + itemId;
    }

    public void mo438a(C0442a c0442a) {
        this.f1736d.mo438a(c0442a);
    }

    boolean mo439a(C0521h c0521h, MenuItem menuItem) {
        return super.mo439a(c0521h, menuItem) || this.f1736d.mo439a(c0521h, menuItem);
    }

    public boolean mo440b() {
        return this.f1736d.mo440b();
    }

    public boolean mo441c() {
        return this.f1736d.mo441c();
    }

    public boolean mo442c(C0524j c0524j) {
        return this.f1736d.mo442c(c0524j);
    }

    public boolean mo443d(C0524j c0524j) {
        return this.f1736d.mo443d(c0524j);
    }

    public MenuItem getItem() {
        return this.f1737e;
    }

    public C0521h mo444p() {
        return this.f1736d.mo444p();
    }

    public Menu m2573s() {
        return this.f1736d;
    }

    public SubMenu setHeaderIcon(int i) {
        return (SubMenu) super.m2465e(i);
    }

    public SubMenu setHeaderIcon(Drawable drawable) {
        return (SubMenu) super.m2434a(drawable);
    }

    public SubMenu setHeaderTitle(int i) {
        return (SubMenu) super.m2462d(i);
    }

    public SubMenu setHeaderTitle(CharSequence charSequence) {
        return (SubMenu) super.m2436a(charSequence);
    }

    public SubMenu setHeaderView(View view) {
        return (SubMenu) super.m2435a(view);
    }

    public SubMenu setIcon(int i) {
        this.f1737e.setIcon(i);
        return this;
    }

    public SubMenu setIcon(Drawable drawable) {
        this.f1737e.setIcon(drawable);
        return this;
    }

    public void setQwertyMode(boolean z) {
        this.f1736d.setQwertyMode(z);
    }
}
