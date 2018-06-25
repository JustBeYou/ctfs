package android.support.v7.app;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.view.C0479b;
import android.support.v7.view.C0479b.C0462a;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup.LayoutParams;

public class C0431l extends Dialog implements C0430d {
    private C0434e f1228a;

    public C0431l(Context context, int i) {
        super(context, C0431l.m1907a(context, i));
        m1908a().mo296a(null);
        m1908a().mo288i();
    }

    private static int m1907a(Context context, int i) {
        if (i != 0) {
            return i;
        }
        TypedValue typedValue = new TypedValue();
        context.getTheme().resolveAttribute(C0401a.dialogTheme, typedValue, true);
        return typedValue.resourceId;
    }

    public C0434e m1908a() {
        if (this.f1228a == null) {
            this.f1228a = C0434e.m1928a((Dialog) this, (C0430d) this);
        }
        return this.f1228a;
    }

    public C0479b mo260a(C0462a c0462a) {
        return null;
    }

    public void mo261a(C0479b c0479b) {
    }

    public boolean m1911a(int i) {
        return m1908a().mo308c(i);
    }

    public void addContentView(View view, LayoutParams layoutParams) {
        m1908a().mo305b(view, layoutParams);
    }

    public void mo262b(C0479b c0479b) {
    }

    public <T extends View> T findViewById(int i) {
        return m1908a().mo293a(i);
    }

    public void invalidateOptionsMenu() {
        m1908a().mo310f();
    }

    protected void onCreate(Bundle bundle) {
        m1908a().mo311h();
        super.onCreate(bundle);
        m1908a().mo296a(bundle);
    }

    protected void onStop() {
        super.onStop();
        m1908a().mo286d();
    }

    public void setContentView(int i) {
        m1908a().mo303b(i);
    }

    public void setContentView(View view) {
        m1908a().mo298a(view);
    }

    public void setContentView(View view, LayoutParams layoutParams) {
        m1908a().mo299a(view, layoutParams);
    }

    public void setTitle(int i) {
        super.setTitle(i);
        m1908a().mo282a(getContext().getString(i));
    }

    public void setTitle(CharSequence charSequence) {
        super.setTitle(charSequence);
        m1908a().mo282a(charSequence);
    }
}
