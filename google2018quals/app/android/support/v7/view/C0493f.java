package android.support.v7.view;

import android.content.Context;
import android.support.v4.p012d.p013a.C0202a;
import android.support.v4.p012d.p013a.C0203b;
import android.support.v4.p016g.C0228k;
import android.support.v7.view.C0479b.C0462a;
import android.support.v7.view.menu.C0534q;
import android.view.ActionMode;
import android.view.ActionMode.Callback;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import java.util.ArrayList;

public class C0493f extends ActionMode {
    final Context f1444a;
    final C0479b f1445b;

    public static class C0492a implements C0462a {
        final Callback f1440a;
        final Context f1441b;
        final ArrayList<C0493f> f1442c = new ArrayList();
        final C0228k<Menu, Menu> f1443d = new C0228k();

        public C0492a(Context context, Callback callback) {
            this.f1441b = context;
            this.f1440a = callback;
        }

        private Menu m2253a(Menu menu) {
            Menu menu2 = (Menu) this.f1443d.get(menu);
            if (menu2 != null) {
                return menu2;
            }
            menu2 = C0534q.m2541a(this.f1441b, (C0202a) menu);
            this.f1443d.put(menu, menu2);
            return menu2;
        }

        public void mo323a(C0479b c0479b) {
            this.f1440a.onDestroyActionMode(m2257b(c0479b));
        }

        public boolean mo324a(C0479b c0479b, Menu menu) {
            return this.f1440a.onCreateActionMode(m2257b(c0479b), m2253a(menu));
        }

        public boolean mo325a(C0479b c0479b, MenuItem menuItem) {
            return this.f1440a.onActionItemClicked(m2257b(c0479b), C0534q.m2542a(this.f1441b, (C0203b) menuItem));
        }

        public ActionMode m2257b(C0479b c0479b) {
            int size = this.f1442c.size();
            for (int i = 0; i < size; i++) {
                C0493f c0493f = (C0493f) this.f1442c.get(i);
                if (c0493f != null && c0493f.f1445b == c0479b) {
                    return c0493f;
                }
            }
            ActionMode c0493f2 = new C0493f(this.f1441b, c0479b);
            this.f1442c.add(c0493f2);
            return c0493f2;
        }

        public boolean mo326b(C0479b c0479b, Menu menu) {
            return this.f1440a.onPrepareActionMode(m2257b(c0479b), m2253a(menu));
        }
    }

    public C0493f(Context context, C0479b c0479b) {
        this.f1444a = context;
        this.f1445b = c0479b;
    }

    public void finish() {
        this.f1445b.mo352c();
    }

    public View getCustomView() {
        return this.f1445b.mo357i();
    }

    public Menu getMenu() {
        return C0534q.m2541a(this.f1444a, (C0202a) this.f1445b.mo349b());
    }

    public MenuInflater getMenuInflater() {
        return this.f1445b.mo344a();
    }

    public CharSequence getSubtitle() {
        return this.f1445b.mo355g();
    }

    public Object getTag() {
        return this.f1445b.m2147j();
    }

    public CharSequence getTitle() {
        return this.f1445b.mo354f();
    }

    public boolean getTitleOptionalHint() {
        return this.f1445b.m2148k();
    }

    public void invalidate() {
        this.f1445b.mo353d();
    }

    public boolean isTitleOptional() {
        return this.f1445b.mo356h();
    }

    public void setCustomView(View view) {
        this.f1445b.mo346a(view);
    }

    public void setSubtitle(int i) {
        this.f1445b.mo350b(i);
    }

    public void setSubtitle(CharSequence charSequence) {
        this.f1445b.mo347a(charSequence);
    }

    public void setTag(Object obj) {
        this.f1445b.m2136a(obj);
    }

    public void setTitle(int i) {
        this.f1445b.mo345a(i);
    }

    public void setTitle(CharSequence charSequence) {
        this.f1445b.mo351b(charSequence);
    }

    public void setTitleOptionalHint(boolean z) {
        this.f1445b.mo348a(z);
    }
}
