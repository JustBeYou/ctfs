package android.support.v7.view.menu;

import android.content.Context;
import android.support.v7.view.menu.C0521h.C0503b;
import android.support.v7.widget.aw;
import android.util.AttributeSet;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListView;

public final class ExpandedMenuView extends ListView implements C0503b, C0504p, OnItemClickListener {
    private static final int[] f1519a = new int[]{16842964, 16843049};
    private C0521h f1520b;
    private int f1521c;

    public ExpandedMenuView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 16842868);
    }

    public ExpandedMenuView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet);
        setOnItemClickListener(this);
        aw a = aw.m2953a(context, attributeSet, f1519a, i, 0);
        if (a.m2971g(0)) {
            setBackgroundDrawable(a.m2957a(0));
        }
        if (a.m2971g(1)) {
            setDivider(a.m2957a(1));
        }
        a.m2958a();
    }

    public void mo377a(C0521h c0521h) {
        this.f1520b = c0521h;
    }

    public boolean mo378a(C0524j c0524j) {
        return this.f1520b.m2449a((MenuItem) c0524j, 0);
    }

    public int getWindowAnimations() {
        return this.f1521c;
    }

    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        setChildrenDrawingCacheEnabled(false);
    }

    public void onItemClick(AdapterView adapterView, View view, int i, long j) {
        mo378a((C0524j) getAdapter().getItem(i));
    }
}
