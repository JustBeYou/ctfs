package android.support.v7.widget;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.database.DataSetObserver;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.support.v4.p017h.C0286c;
import android.support.v7.p020a.C0411a.C0406f;
import android.support.v7.p020a.C0411a.C0407g;
import android.support.v7.p020a.C0411a.C0408h;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.PopupWindow.OnDismissListener;
import android.widget.TextView;

public class ActivityChooserView extends ViewGroup {
    final C0552a f1845a;
    final FrameLayout f1846b;
    final FrameLayout f1847c;
    C0286c f1848d;
    final DataSetObserver f1849e;
    OnDismissListener f1850f;
    boolean f1851g;
    int f1852h;
    private final C0553b f1853i;
    private final ai f1854j;
    private final ImageView f1855k;
    private final int f1856l;
    private final OnGlobalLayoutListener f1857m;
    private aj f1858n;
    private boolean f1859o;
    private int f1860p;

    public static class InnerLayout extends ai {
        private static final int[] f1837a = new int[]{16842964};

        public InnerLayout(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            aw a = aw.m2952a(context, attributeSet, f1837a);
            setBackgroundDrawable(a.m2957a(0));
            a.m2958a();
        }
    }

    private class C0552a extends BaseAdapter {
        final /* synthetic */ ActivityChooserView f1838a;
        private C0613e f1839b;
        private int f1840c;
        private boolean f1841d;
        private boolean f1842e;
        private boolean f1843f;

        public int m2668a() {
            int i = 0;
            int i2 = this.f1840c;
            this.f1840c = Integer.MAX_VALUE;
            int makeMeasureSpec = MeasureSpec.makeMeasureSpec(0, 0);
            int makeMeasureSpec2 = MeasureSpec.makeMeasureSpec(0, 0);
            int count = getCount();
            View view = null;
            int i3 = 0;
            while (i < count) {
                view = getView(i, view, null);
                view.measure(makeMeasureSpec, makeMeasureSpec2);
                i3 = Math.max(i3, view.getMeasuredWidth());
                i++;
            }
            this.f1840c = i2;
            return i3;
        }

        public void m2669a(int i) {
            if (this.f1840c != i) {
                this.f1840c = i;
                notifyDataSetChanged();
            }
        }

        public void m2670a(C0613e c0613e) {
            C0613e d = this.f1838a.f1845a.m2675d();
            if (d != null && this.f1838a.isShown()) {
                d.unregisterObserver(this.f1838a.f1849e);
            }
            this.f1839b = c0613e;
            if (c0613e != null && this.f1838a.isShown()) {
                c0613e.registerObserver(this.f1838a.f1849e);
            }
            notifyDataSetChanged();
        }

        public void m2671a(boolean z) {
            if (this.f1843f != z) {
                this.f1843f = z;
                notifyDataSetChanged();
            }
        }

        public void m2672a(boolean z, boolean z2) {
            if (this.f1841d != z || this.f1842e != z2) {
                this.f1841d = z;
                this.f1842e = z2;
                notifyDataSetChanged();
            }
        }

        public ResolveInfo m2673b() {
            return this.f1839b.m3093b();
        }

        public int m2674c() {
            return this.f1839b.m3089a();
        }

        public C0613e m2675d() {
            return this.f1839b;
        }

        public boolean m2676e() {
            return this.f1841d;
        }

        public int getCount() {
            int a = this.f1839b.m3089a();
            if (!(this.f1841d || this.f1839b.m3093b() == null)) {
                a--;
            }
            a = Math.min(a, this.f1840c);
            return this.f1843f ? a + 1 : a;
        }

        public Object getItem(int i) {
            switch (getItemViewType(i)) {
                case 0:
                    if (!(this.f1841d || this.f1839b.m3093b() == null)) {
                        i++;
                    }
                    return this.f1839b.m3091a(i);
                case 1:
                    return null;
                default:
                    throw new IllegalArgumentException();
            }
        }

        public long getItemId(int i) {
            return (long) i;
        }

        public int getItemViewType(int i) {
            return (this.f1843f && i == getCount() - 1) ? 1 : 0;
        }

        public View getView(int i, View view, ViewGroup viewGroup) {
            switch (getItemViewType(i)) {
                case 0:
                    if (view == null || view.getId() != C0406f.list_item) {
                        view = LayoutInflater.from(this.f1838a.getContext()).inflate(C0407g.abc_activity_chooser_view_list_item, viewGroup, false);
                    }
                    PackageManager packageManager = this.f1838a.getContext().getPackageManager();
                    ResolveInfo resolveInfo = (ResolveInfo) getItem(i);
                    ((ImageView) view.findViewById(C0406f.icon)).setImageDrawable(resolveInfo.loadIcon(packageManager));
                    ((TextView) view.findViewById(C0406f.title)).setText(resolveInfo.loadLabel(packageManager));
                    if (this.f1841d && i == 0 && this.f1842e) {
                        view.setActivated(true);
                        return view;
                    }
                    view.setActivated(false);
                    return view;
                case 1:
                    if (view != null && view.getId() == 1) {
                        return view;
                    }
                    view = LayoutInflater.from(this.f1838a.getContext()).inflate(C0407g.abc_activity_chooser_view_list_item, viewGroup, false);
                    view.setId(1);
                    ((TextView) view.findViewById(C0406f.title)).setText(this.f1838a.getContext().getString(C0408h.abc_activity_chooser_view_see_all));
                    return view;
                default:
                    throw new IllegalArgumentException();
            }
        }

        public int getViewTypeCount() {
            return 3;
        }
    }

    private class C0553b implements OnClickListener, OnLongClickListener, OnItemClickListener, OnDismissListener {
        final /* synthetic */ ActivityChooserView f1844a;

        private void m2677a() {
            if (this.f1844a.f1850f != null) {
                this.f1844a.f1850f.onDismiss();
            }
        }

        public void onClick(View view) {
            if (view == this.f1844a.f1847c) {
                this.f1844a.m2680b();
                Intent b = this.f1844a.f1845a.m2675d().m3092b(this.f1844a.f1845a.m2675d().m3090a(this.f1844a.f1845a.m2673b()));
                if (b != null) {
                    b.addFlags(524288);
                    this.f1844a.getContext().startActivity(b);
                }
            } else if (view == this.f1844a.f1846b) {
                this.f1844a.f1851g = false;
                this.f1844a.m2678a(this.f1844a.f1852h);
            } else {
                throw new IllegalArgumentException();
            }
        }

        public void onDismiss() {
            m2677a();
            if (this.f1844a.f1848d != null) {
                this.f1844a.f1848d.m1263a(false);
            }
        }

        public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
            switch (((C0552a) adapterView.getAdapter()).getItemViewType(i)) {
                case 0:
                    this.f1844a.m2680b();
                    if (!this.f1844a.f1851g) {
                        if (!this.f1844a.f1845a.m2676e()) {
                            i++;
                        }
                        Intent b = this.f1844a.f1845a.m2675d().m3092b(i);
                        if (b != null) {
                            b.addFlags(524288);
                            this.f1844a.getContext().startActivity(b);
                            return;
                        }
                        return;
                    } else if (i > 0) {
                        this.f1844a.f1845a.m2675d().m3094c(i);
                        return;
                    } else {
                        return;
                    }
                case 1:
                    this.f1844a.m2678a(Integer.MAX_VALUE);
                    return;
                default:
                    throw new IllegalArgumentException();
            }
        }

        public boolean onLongClick(View view) {
            if (view == this.f1844a.f1847c) {
                if (this.f1844a.f1845a.getCount() > 0) {
                    this.f1844a.f1851g = true;
                    this.f1844a.m2678a(this.f1844a.f1852h);
                }
                return true;
            }
            throw new IllegalArgumentException();
        }
    }

    void m2678a(int i) {
        if (this.f1845a.m2675d() == null) {
            throw new IllegalStateException("No data model. Did you call #setDataModel?");
        }
        getViewTreeObserver().addOnGlobalLayoutListener(this.f1857m);
        boolean z = this.f1847c.getVisibility() == 0;
        int c = this.f1845a.m2674c();
        int i2 = z ? 1 : 0;
        if (i == Integer.MAX_VALUE || c <= i2 + i) {
            this.f1845a.m2671a(false);
            this.f1845a.m2669a(i);
        } else {
            this.f1845a.m2671a(true);
            this.f1845a.m2669a(i - 1);
        }
        aj listPopupWindow = getListPopupWindow();
        if (!listPopupWindow.mo422d()) {
            if (this.f1851g || !z) {
                this.f1845a.m2672a(true, z);
            } else {
                this.f1845a.m2672a(false, false);
            }
            listPopupWindow.m2882g(Math.min(this.f1845a.m2668a(), this.f1856l));
            listPopupWindow.mo412a();
            if (this.f1848d != null) {
                this.f1848d.m1263a(true);
            }
            listPopupWindow.mo423e().setContentDescription(getContext().getString(C0408h.abc_activitychooserview_choose_application));
            listPopupWindow.mo423e().setSelector(new ColorDrawable(0));
        }
    }

    public boolean m2679a() {
        if (m2681c() || !this.f1859o) {
            return false;
        }
        this.f1851g = false;
        m2678a(this.f1852h);
        return true;
    }

    public boolean m2680b() {
        if (m2681c()) {
            getListPopupWindow().mo419c();
            ViewTreeObserver viewTreeObserver = getViewTreeObserver();
            if (viewTreeObserver.isAlive()) {
                viewTreeObserver.removeGlobalOnLayoutListener(this.f1857m);
            }
        }
        return true;
    }

    public boolean m2681c() {
        return getListPopupWindow().mo422d();
    }

    public C0613e getDataModel() {
        return this.f1845a.m2675d();
    }

    aj getListPopupWindow() {
        if (this.f1858n == null) {
            this.f1858n = new aj(getContext());
            this.f1858n.mo547a(this.f1845a);
            this.f1858n.m2873b((View) this);
            this.f1858n.m2871a(true);
            this.f1858n.m2868a(this.f1853i);
            this.f1858n.m2870a(this.f1853i);
        }
        return this.f1858n;
    }

    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        C0613e d = this.f1845a.m2675d();
        if (d != null) {
            d.registerObserver(this.f1849e);
        }
        this.f1859o = true;
    }

    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        C0613e d = this.f1845a.m2675d();
        if (d != null) {
            d.unregisterObserver(this.f1849e);
        }
        ViewTreeObserver viewTreeObserver = getViewTreeObserver();
        if (viewTreeObserver.isAlive()) {
            viewTreeObserver.removeGlobalOnLayoutListener(this.f1857m);
        }
        if (m2681c()) {
            m2680b();
        }
        this.f1859o = false;
    }

    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        this.f1854j.layout(0, 0, i3 - i, i4 - i2);
        if (!m2681c()) {
            m2680b();
        }
    }

    protected void onMeasure(int i, int i2) {
        View view = this.f1854j;
        if (this.f1847c.getVisibility() != 0) {
            i2 = MeasureSpec.makeMeasureSpec(MeasureSpec.getSize(i2), 1073741824);
        }
        measureChild(view, i, i2);
        setMeasuredDimension(view.getMeasuredWidth(), view.getMeasuredHeight());
    }

    public void setActivityChooserModel(C0613e c0613e) {
        this.f1845a.m2670a(c0613e);
        if (m2681c()) {
            m2680b();
            m2679a();
        }
    }

    public void setDefaultActionButtonContentDescription(int i) {
        this.f1860p = i;
    }

    public void setExpandActivityOverflowButtonContentDescription(int i) {
        this.f1855k.setContentDescription(getContext().getString(i));
    }

    public void setExpandActivityOverflowButtonDrawable(Drawable drawable) {
        this.f1855k.setImageDrawable(drawable);
    }

    public void setInitialActivityCount(int i) {
        this.f1852h = i;
    }

    public void setOnDismissListener(OnDismissListener onDismissListener) {
        this.f1850f = onDismissListener;
    }

    public void setProvider(C0286c c0286c) {
        this.f1848d = c0286c;
    }
}
