package android.support.v7.view.menu;

import android.content.Context;
import android.support.v7.p020a.C0411a.C0407g;
import android.support.v7.view.menu.C0504p.C0501a;
import android.support.v7.view.menu.C0506o.C0459a;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import java.util.ArrayList;

public class C0519f implements C0506o, OnItemClickListener {
    Context f1612a;
    LayoutInflater f1613b;
    C0521h f1614c;
    ExpandedMenuView f1615d;
    int f1616e;
    int f1617f;
    int f1618g;
    C0518a f1619h;
    private C0459a f1620i;

    private class C0518a extends BaseAdapter {
        final /* synthetic */ C0519f f1610a;
        private int f1611b = -1;

        public C0518a(C0519f c0519f) {
            this.f1610a = c0519f;
            m2409a();
        }

        public C0524j m2408a(int i) {
            ArrayList l = this.f1610a.f1614c.m2472l();
            int i2 = this.f1610a.f1616e + i;
            if (this.f1611b >= 0 && i2 >= this.f1611b) {
                i2++;
            }
            return (C0524j) l.get(i2);
        }

        void m2409a() {
            C0524j r = this.f1610a.f1614c.m2478r();
            if (r != null) {
                ArrayList l = this.f1610a.f1614c.m2472l();
                int size = l.size();
                for (int i = 0; i < size; i++) {
                    if (((C0524j) l.get(i)) == r) {
                        this.f1611b = i;
                        return;
                    }
                }
            }
            this.f1611b = -1;
        }

        public int getCount() {
            int size = this.f1610a.f1614c.m2472l().size() - this.f1610a.f1616e;
            return this.f1611b < 0 ? size : size - 1;
        }

        public /* synthetic */ Object getItem(int i) {
            return m2408a(i);
        }

        public long getItemId(int i) {
            return (long) i;
        }

        public View getView(int i, View view, ViewGroup viewGroup) {
            View inflate = view == null ? this.f1610a.f1613b.inflate(this.f1610a.f1618g, viewGroup, false) : view;
            ((C0501a) inflate).mo372a(m2408a(i), 0);
            return inflate;
        }

        public void notifyDataSetChanged() {
            m2409a();
            super.notifyDataSetChanged();
        }
    }

    public C0519f(int i, int i2) {
        this.f1618g = i;
        this.f1617f = i2;
    }

    public C0519f(Context context, int i) {
        this(i, 0);
        this.f1612a = context;
        this.f1613b = LayoutInflater.from(this.f1612a);
    }

    public C0504p m2410a(ViewGroup viewGroup) {
        if (this.f1615d == null) {
            this.f1615d = (ExpandedMenuView) this.f1613b.inflate(C0407g.abc_expanded_menu_layout, viewGroup, false);
            if (this.f1619h == null) {
                this.f1619h = new C0518a(this);
            }
            this.f1615d.setAdapter(this.f1619h);
            this.f1615d.setOnItemClickListener(this);
        }
        return this.f1615d;
    }

    public ListAdapter m2411a() {
        if (this.f1619h == null) {
            this.f1619h = new C0518a(this);
        }
        return this.f1619h;
    }

    public void mo402a(Context context, C0521h c0521h) {
        if (this.f1617f != 0) {
            this.f1612a = new ContextThemeWrapper(context, this.f1617f);
            this.f1613b = LayoutInflater.from(this.f1612a);
        } else if (this.f1612a != null) {
            this.f1612a = context;
            if (this.f1613b == null) {
                this.f1613b = LayoutInflater.from(this.f1612a);
            }
        }
        this.f1614c = c0521h;
        if (this.f1619h != null) {
            this.f1619h.notifyDataSetChanged();
        }
    }

    public void mo403a(C0521h c0521h, boolean z) {
        if (this.f1620i != null) {
            this.f1620i.mo321a(c0521h, z);
        }
    }

    public void mo404a(C0459a c0459a) {
        this.f1620i = c0459a;
    }

    public boolean mo405a(C0521h c0521h, C0524j c0524j) {
        return false;
    }

    public boolean mo406a(C0539u c0539u) {
        if (!c0539u.hasVisibleItems()) {
            return false;
        }
        new C0522i(c0539u).m2480a(null);
        if (this.f1620i != null) {
            this.f1620i.mo322a(c0539u);
        }
        return true;
    }

    public void mo407b(boolean z) {
        if (this.f1619h != null) {
            this.f1619h.notifyDataSetChanged();
        }
    }

    public boolean mo408b() {
        return false;
    }

    public boolean mo409b(C0521h c0521h, C0524j c0524j) {
        return false;
    }

    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        this.f1614c.m2450a(this.f1619h.m2408a(i), (C0506o) this, 0);
    }
}
