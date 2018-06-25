package android.support.v7.view;

import android.content.Context;
import android.support.v7.view.C0479b.C0462a;
import android.support.v7.view.menu.C0521h;
import android.support.v7.view.menu.C0521h.C0442a;
import android.support.v7.widget.ActionBarContextView;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import java.lang.ref.WeakReference;

public class C0491e extends C0479b implements C0442a {
    private Context f1433a;
    private ActionBarContextView f1434b;
    private C0462a f1435c;
    private WeakReference<View> f1436d;
    private boolean f1437e;
    private boolean f1438f;
    private C0521h f1439g;

    public C0491e(Context context, ActionBarContextView actionBarContextView, C0462a c0462a, boolean z) {
        this.f1433a = context;
        this.f1434b = actionBarContextView;
        this.f1435c = c0462a;
        this.f1439g = new C0521h(actionBarContextView.getContext()).m2433a(1);
        this.f1439g.mo438a((C0442a) this);
        this.f1438f = z;
    }

    public MenuInflater mo344a() {
        return new C0496g(this.f1434b.getContext());
    }

    public void mo345a(int i) {
        mo351b(this.f1433a.getString(i));
    }

    public void mo297a(C0521h c0521h) {
        mo353d();
        this.f1434b.mo447a();
    }

    public void mo346a(View view) {
        this.f1434b.setCustomView(view);
        this.f1436d = view != null ? new WeakReference(view) : null;
    }

    public void mo347a(CharSequence charSequence) {
        this.f1434b.setSubtitle(charSequence);
    }

    public void mo348a(boolean z) {
        super.mo348a(z);
        this.f1434b.setTitleOptional(z);
    }

    public boolean mo301a(C0521h c0521h, MenuItem menuItem) {
        return this.f1435c.mo325a((C0479b) this, menuItem);
    }

    public Menu mo349b() {
        return this.f1439g;
    }

    public void mo350b(int i) {
        mo347a(this.f1433a.getString(i));
    }

    public void mo351b(CharSequence charSequence) {
        this.f1434b.setTitle(charSequence);
    }

    public void mo352c() {
        if (!this.f1437e) {
            this.f1437e = true;
            this.f1434b.sendAccessibilityEvent(32);
            this.f1435c.mo323a(this);
        }
    }

    public void mo353d() {
        this.f1435c.mo326b(this, this.f1439g);
    }

    public CharSequence mo354f() {
        return this.f1434b.getTitle();
    }

    public CharSequence mo355g() {
        return this.f1434b.getSubtitle();
    }

    public boolean mo356h() {
        return this.f1434b.m2590d();
    }

    public View mo357i() {
        return this.f1436d != null ? (View) this.f1436d.get() : null;
    }
}
