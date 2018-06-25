package android.support.v7.app;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.v4.p010a.C0093a;
import android.support.v4.p010a.C0119i;
import android.support.v4.p010a.C0161w;
import android.support.v4.p010a.ab;
import android.support.v4.p010a.ab.C0094a;
import android.support.v7.view.C0479b;
import android.support.v7.view.C0479b.C0462a;
import android.support.v7.widget.bb;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;

public class C0433c extends C0119i implements C0094a, C0430d {
    private C0434e f1230l;
    private int f1231m = 0;
    private Resources f1232n;

    private boolean m1914a(int i, KeyEvent keyEvent) {
        if (!(VERSION.SDK_INT >= 26 || keyEvent.isCtrlPressed() || KeyEvent.metaStateHasNoModifiers(keyEvent.getMetaState()) || keyEvent.getRepeatCount() != 0 || KeyEvent.isModifierKey(keyEvent.getKeyCode()))) {
            Window window = getWindow();
            if (!(window == null || window.getDecorView() == null || !window.getDecorView().dispatchKeyShortcutEvent(keyEvent))) {
                return true;
            }
        }
        return false;
    }

    public C0479b mo260a(C0462a c0462a) {
        return null;
    }

    public void m1916a(ab abVar) {
        abVar.m389a((Activity) this);
    }

    public void mo261a(C0479b c0479b) {
    }

    public boolean m1918a(Intent intent) {
        return C0161w.m843a((Activity) this, intent);
    }

    public Intent a_() {
        return C0161w.m841a(this);
    }

    public void addContentView(View view, LayoutParams layoutParams) {
        m1926j().mo305b(view, layoutParams);
    }

    public void m1919b(Intent intent) {
        C0161w.m846b((Activity) this, intent);
    }

    public void m1920b(ab abVar) {
    }

    public void mo262b(C0479b c0479b) {
    }

    public void closeOptionsMenu() {
        C0428a g = m1923g();
        if (!getWindow().hasFeature(0)) {
            return;
        }
        if (g == null || !g.mo338d()) {
            super.closeOptionsMenu();
        }
    }

    public void mo266d() {
        m1926j().mo310f();
    }

    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        int keyCode = keyEvent.getKeyCode();
        C0428a g = m1923g();
        return (keyCode == 82 && g != null && g.mo333a(keyEvent)) ? true : super.dispatchKeyEvent(keyEvent);
    }

    public <T extends View> T findViewById(int i) {
        return m1926j().mo293a(i);
    }

    public C0428a m1923g() {
        return m1926j().mo281a();
    }

    public MenuInflater getMenuInflater() {
        return m1926j().mo283b();
    }

    public Resources getResources() {
        if (this.f1232n == null && bb.m3032a()) {
            this.f1232n = new bb(this, super.getResources());
        }
        return this.f1232n == null ? super.getResources() : this.f1232n;
    }

    public boolean m1924h() {
        Intent a_ = a_();
        if (a_ == null) {
            return false;
        }
        if (m1918a(a_)) {
            ab a = ab.m388a((Context) this);
            m1916a(a);
            m1920b(a);
            a.m392a();
            try {
                C0093a.m386a(this);
            } catch (IllegalStateException e) {
                finish();
            }
        } else {
            m1919b(a_);
        }
        return true;
    }

    @Deprecated
    public void m1925i() {
    }

    public void invalidateOptionsMenu() {
        m1926j().mo310f();
    }

    public C0434e m1926j() {
        if (this.f1230l == null) {
            this.f1230l = C0434e.m1927a((Activity) this, (C0430d) this);
        }
        return this.f1230l;
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        m1926j().mo295a(configuration);
        if (this.f1232n != null) {
            this.f1232n.updateConfiguration(configuration, super.getResources().getDisplayMetrics());
        }
    }

    public void onContentChanged() {
        m1925i();
    }

    protected void onCreate(Bundle bundle) {
        C0434e j = m1926j();
        j.mo311h();
        j.mo296a(bundle);
        if (j.mo288i() && this.f1231m != 0) {
            if (VERSION.SDK_INT >= 23) {
                onApplyThemeResource(getTheme(), this.f1231m, false);
            } else {
                setTheme(this.f1231m);
            }
        }
        super.onCreate(bundle);
    }

    protected void onDestroy() {
        super.onDestroy();
        m1926j().mo287g();
    }

    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        return m1914a(i, keyEvent) ? true : super.onKeyDown(i, keyEvent);
    }

    public final boolean onMenuItemSelected(int i, MenuItem menuItem) {
        if (super.onMenuItemSelected(i, menuItem)) {
            return true;
        }
        C0428a g = m1923g();
        return (menuItem.getItemId() != 16908332 || g == null || (g.mo327a() & 4) == 0) ? false : m1924h();
    }

    public boolean onMenuOpened(int i, Menu menu) {
        return super.onMenuOpened(i, menu);
    }

    public void onPanelClosed(int i, Menu menu) {
        super.onPanelClosed(i, menu);
    }

    protected void onPostCreate(Bundle bundle) {
        super.onPostCreate(bundle);
        m1926j().mo304b(bundle);
    }

    protected void onPostResume() {
        super.onPostResume();
        m1926j().mo309e();
    }

    protected void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        m1926j().mo285c(bundle);
    }

    protected void onStart() {
        super.onStart();
        m1926j().mo284c();
    }

    protected void onStop() {
        super.onStop();
        m1926j().mo286d();
    }

    protected void onTitleChanged(CharSequence charSequence, int i) {
        super.onTitleChanged(charSequence, i);
        m1926j().mo282a(charSequence);
    }

    public void openOptionsMenu() {
        C0428a g = m1923g();
        if (!getWindow().hasFeature(0)) {
            return;
        }
        if (g == null || !g.mo336c()) {
            super.openOptionsMenu();
        }
    }

    public void setContentView(int i) {
        m1926j().mo303b(i);
    }

    public void setContentView(View view) {
        m1926j().mo298a(view);
    }

    public void setContentView(View view, LayoutParams layoutParams) {
        m1926j().mo299a(view, layoutParams);
    }

    public void setTheme(int i) {
        super.setTheme(i);
        this.f1231m = i;
    }
}
