package android.support.v7.view.menu;

import android.content.Context;
import android.graphics.Rect;
import android.view.MenuItem;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.FrameLayout;
import android.widget.HeaderViewListAdapter;
import android.widget.ListAdapter;
import android.widget.PopupWindow.OnDismissListener;

abstract class C0516m implements C0506o, C0515s, OnItemClickListener {
    private Rect f1583a;

    C0516m() {
    }

    protected static int m2363a(ListAdapter listAdapter, ViewGroup viewGroup, Context context, int i) {
        int makeMeasureSpec = MeasureSpec.makeMeasureSpec(0, 0);
        int makeMeasureSpec2 = MeasureSpec.makeMeasureSpec(0, 0);
        int count = listAdapter.getCount();
        int i2 = 0;
        int i3 = 0;
        View view = null;
        int i4 = 0;
        ViewGroup viewGroup2 = viewGroup;
        while (i2 < count) {
            int itemViewType = listAdapter.getItemViewType(i2);
            if (itemViewType != i3) {
                i3 = itemViewType;
                view = null;
            }
            ViewGroup frameLayout = viewGroup2 == null ? new FrameLayout(context) : viewGroup2;
            view = listAdapter.getView(i2, view, frameLayout);
            view.measure(makeMeasureSpec, makeMeasureSpec2);
            int measuredWidth = view.getMeasuredWidth();
            if (measuredWidth >= i) {
                return i;
            }
            if (measuredWidth <= i4) {
                measuredWidth = i4;
            }
            i2++;
            i4 = measuredWidth;
            viewGroup2 = frameLayout;
        }
        return i4;
    }

    protected static C0520g m2364a(ListAdapter listAdapter) {
        return listAdapter instanceof HeaderViewListAdapter ? (C0520g) ((HeaderViewListAdapter) listAdapter).getWrappedAdapter() : (C0520g) listAdapter;
    }

    protected static boolean m2365b(C0521h c0521h) {
        int size = c0521h.size();
        for (int i = 0; i < size; i++) {
            MenuItem item = c0521h.getItem(i);
            if (item.isVisible() && item.getIcon() != null) {
                return true;
            }
        }
        return false;
    }

    public abstract void mo413a(int i);

    public void mo402a(Context context, C0521h c0521h) {
    }

    public void m2368a(Rect rect) {
        this.f1583a = rect;
    }

    public abstract void mo414a(C0521h c0521h);

    public abstract void mo415a(View view);

    public abstract void mo416a(OnDismissListener onDismissListener);

    public abstract void mo417a(boolean z);

    public boolean mo405a(C0521h c0521h, C0524j c0524j) {
        return false;
    }

    public abstract void mo418b(int i);

    public boolean mo409b(C0521h c0521h, C0524j c0524j) {
        return false;
    }

    public abstract void mo420c(int i);

    public abstract void mo421c(boolean z);

    protected boolean mo424f() {
        return true;
    }

    public Rect m2379g() {
        return this.f1583a;
    }

    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        ListAdapter listAdapter = (ListAdapter) adapterView.getAdapter();
        C0516m.m2364a(listAdapter).f1622b.m2450a((MenuItem) listAdapter.getItem(i), (C0506o) this, mo424f() ? 0 : 4);
    }
}
