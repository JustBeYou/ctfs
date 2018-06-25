package android.support.v7.view.menu;

import android.support.v7.p020a.C0411a.C0407g;
import android.support.v7.view.menu.C0504p.C0501a;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import java.util.ArrayList;

public class C0520g extends BaseAdapter {
    static final int f1621a = C0407g.abc_popup_menu_item_layout;
    C0521h f1622b;
    private int f1623c = -1;
    private boolean f1624d;
    private final boolean f1625e;
    private final LayoutInflater f1626f;

    public C0520g(C0521h c0521h, LayoutInflater layoutInflater, boolean z) {
        this.f1625e = z;
        this.f1626f = layoutInflater;
        this.f1622b = c0521h;
        m2423b();
    }

    public C0521h m2420a() {
        return this.f1622b;
    }

    public C0524j m2421a(int i) {
        ArrayList l = this.f1625e ? this.f1622b.m2472l() : this.f1622b.m2469i();
        if (this.f1623c >= 0 && i >= this.f1623c) {
            i++;
        }
        return (C0524j) l.get(i);
    }

    public void m2422a(boolean z) {
        this.f1624d = z;
    }

    void m2423b() {
        C0524j r = this.f1622b.m2478r();
        if (r != null) {
            ArrayList l = this.f1622b.m2472l();
            int size = l.size();
            for (int i = 0; i < size; i++) {
                if (((C0524j) l.get(i)) == r) {
                    this.f1623c = i;
                    return;
                }
            }
        }
        this.f1623c = -1;
    }

    public int getCount() {
        ArrayList l = this.f1625e ? this.f1622b.m2472l() : this.f1622b.m2469i();
        return this.f1623c < 0 ? l.size() : l.size() - 1;
    }

    public /* synthetic */ Object getItem(int i) {
        return m2421a(i);
    }

    public long getItemId(int i) {
        return (long) i;
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        View inflate = view == null ? this.f1626f.inflate(f1621a, viewGroup, false) : view;
        C0501a c0501a = (C0501a) inflate;
        if (this.f1624d) {
            ((ListMenuItemView) inflate).setForceShowIcon(true);
        }
        c0501a.mo372a(m2421a(i), 0);
        return inflate;
    }

    public void notifyDataSetChanged() {
        m2423b();
        super.notifyDataSetChanged();
    }
}
