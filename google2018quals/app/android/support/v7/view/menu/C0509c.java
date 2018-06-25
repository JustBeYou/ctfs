package android.support.v7.view.menu;

import android.content.Context;
import android.support.v4.p012d.p013a.C0203b;
import android.support.v4.p012d.p013a.C0204c;
import android.support.v4.p016g.C0229a;
import android.view.MenuItem;
import android.view.SubMenu;
import java.util.Iterator;
import java.util.Map;

abstract class C0509c<T> extends C0508d<T> {
    final Context f1570a;
    private Map<C0203b, MenuItem> f1571c;
    private Map<C0204c, SubMenu> f1572d;

    C0509c(Context context, T t) {
        super(t);
        this.f1570a = context;
    }

    final MenuItem m2349a(MenuItem menuItem) {
        if (!(menuItem instanceof C0203b)) {
            return menuItem;
        }
        C0203b c0203b = (C0203b) menuItem;
        if (this.f1571c == null) {
            this.f1571c = new C0229a();
        }
        MenuItem menuItem2 = (MenuItem) this.f1571c.get(menuItem);
        if (menuItem2 != null) {
            return menuItem2;
        }
        menuItem2 = C0534q.m2542a(this.f1570a, c0203b);
        this.f1571c.put(c0203b, menuItem2);
        return menuItem2;
    }

    final SubMenu m2350a(SubMenu subMenu) {
        if (!(subMenu instanceof C0204c)) {
            return subMenu;
        }
        C0204c c0204c = (C0204c) subMenu;
        if (this.f1572d == null) {
            this.f1572d = new C0229a();
        }
        SubMenu subMenu2 = (SubMenu) this.f1572d.get(c0204c);
        if (subMenu2 != null) {
            return subMenu2;
        }
        subMenu2 = C0534q.m2543a(this.f1570a, c0204c);
        this.f1572d.put(c0204c, subMenu2);
        return subMenu2;
    }

    final void m2351a() {
        if (this.f1571c != null) {
            this.f1571c.clear();
        }
        if (this.f1572d != null) {
            this.f1572d.clear();
        }
    }

    final void m2352a(int i) {
        if (this.f1571c != null) {
            Iterator it = this.f1571c.keySet().iterator();
            while (it.hasNext()) {
                if (i == ((MenuItem) it.next()).getGroupId()) {
                    it.remove();
                }
            }
        }
    }

    final void m2353b(int i) {
        if (this.f1571c != null) {
            Iterator it = this.f1571c.keySet().iterator();
            while (it.hasNext()) {
                if (i == ((MenuItem) it.next()).getItemId()) {
                    it.remove();
                    return;
                }
            }
        }
    }
}
