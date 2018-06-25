package android.support.v7.view.menu;

import android.content.Context;
import android.support.v7.view.menu.C0504p.C0501a;
import android.support.v7.view.menu.C0506o.C0459a;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;

public abstract class C0507b implements C0506o {
    protected Context f1559a;
    protected Context f1560b;
    protected C0521h f1561c;
    protected LayoutInflater f1562d;
    protected LayoutInflater f1563e;
    protected C0504p f1564f;
    private C0459a f1565g;
    private int f1566h;
    private int f1567i;
    private int f1568j;

    public C0507b(Context context, int i, int i2) {
        this.f1559a = context;
        this.f1562d = LayoutInflater.from(context);
        this.f1566h = i;
        this.f1567i = i2;
    }

    public C0459a m2332a() {
        return this.f1565g;
    }

    public C0504p mo535a(ViewGroup viewGroup) {
        if (this.f1564f == null) {
            this.f1564f = (C0504p) this.f1562d.inflate(this.f1566h, viewGroup, false);
            this.f1564f.mo377a(this.f1561c);
            mo407b(true);
        }
        return this.f1564f;
    }

    public View mo536a(C0524j c0524j, View view, ViewGroup viewGroup) {
        C0501a b = view instanceof C0501a ? (C0501a) view : m2345b(viewGroup);
        mo537a(c0524j, b);
        return (View) b;
    }

    public void m2335a(int i) {
        this.f1568j = i;
    }

    public void mo402a(Context context, C0521h c0521h) {
        this.f1560b = context;
        this.f1563e = LayoutInflater.from(this.f1560b);
        this.f1561c = c0521h;
    }

    public void mo403a(C0521h c0521h, boolean z) {
        if (this.f1565g != null) {
            this.f1565g.mo321a(c0521h, z);
        }
    }

    public abstract void mo537a(C0524j c0524j, C0501a c0501a);

    public void mo404a(C0459a c0459a) {
        this.f1565g = c0459a;
    }

    protected void m2340a(View view, int i) {
        ViewGroup viewGroup = (ViewGroup) view.getParent();
        if (viewGroup != null) {
            viewGroup.removeView(view);
        }
        ((ViewGroup) this.f1564f).addView(view, i);
    }

    public boolean mo539a(int i, C0524j c0524j) {
        return true;
    }

    public boolean mo405a(C0521h c0521h, C0524j c0524j) {
        return false;
    }

    public boolean mo406a(C0539u c0539u) {
        return this.f1565g != null ? this.f1565g.mo322a(c0539u) : false;
    }

    protected boolean mo540a(ViewGroup viewGroup, int i) {
        viewGroup.removeViewAt(i);
        return true;
    }

    public C0501a m2345b(ViewGroup viewGroup) {
        return (C0501a) this.f1562d.inflate(this.f1567i, viewGroup, false);
    }

    public void mo407b(boolean z) {
        ViewGroup viewGroup = (ViewGroup) this.f1564f;
        if (viewGroup != null) {
            int i;
            if (this.f1561c != null) {
                this.f1561c.m2470j();
                ArrayList i2 = this.f1561c.m2469i();
                int size = i2.size();
                int i3 = 0;
                i = 0;
                while (i3 < size) {
                    int i4;
                    C0524j c0524j = (C0524j) i2.get(i3);
                    if (mo539a(i, c0524j)) {
                        View childAt = viewGroup.getChildAt(i);
                        C0524j itemData = childAt instanceof C0501a ? ((C0501a) childAt).getItemData() : null;
                        View a = mo536a(c0524j, childAt, viewGroup);
                        if (c0524j != itemData) {
                            a.setPressed(false);
                            a.jumpDrawablesToCurrentState();
                        }
                        if (a != childAt) {
                            m2340a(a, i);
                        }
                        i4 = i + 1;
                    } else {
                        i4 = i;
                    }
                    i3++;
                    i = i4;
                }
            } else {
                i = 0;
            }
            while (i < viewGroup.getChildCount()) {
                if (!mo540a(viewGroup, i)) {
                    i++;
                }
            }
        }
    }

    public boolean mo408b() {
        return false;
    }

    public boolean mo409b(C0521h c0521h, C0524j c0524j) {
        return false;
    }
}
