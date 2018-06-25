package android.support.v7.view.menu;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.SystemClock;
import android.support.v4.p017h.C0287d;
import android.support.v4.p017h.C0315p;
import android.support.v7.p020a.C0411a.C0404d;
import android.support.v7.p020a.C0411a.C0407g;
import android.support.v7.view.menu.C0506o.C0459a;
import android.support.v7.widget.al;
import android.support.v7.widget.am;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnAttachStateChangeListener;
import android.view.View.OnKeyListener;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.FrameLayout;
import android.widget.HeaderViewListAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.PopupWindow.OnDismissListener;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

final class C0517e extends C0516m implements C0506o, OnKeyListener, OnDismissListener {
    final Handler f1584a;
    final List<C0514a> f1585b = new ArrayList();
    View f1586c;
    boolean f1587d;
    private final Context f1588e;
    private final int f1589f;
    private final int f1590g;
    private final int f1591h;
    private final boolean f1592i;
    private final List<C0521h> f1593j = new LinkedList();
    private final OnGlobalLayoutListener f1594k = new C05101(this);
    private final OnAttachStateChangeListener f1595l = new C05112(this);
    private final al f1596m = new C05133(this);
    private int f1597n = 0;
    private int f1598o = 0;
    private View f1599p;
    private int f1600q;
    private boolean f1601r;
    private boolean f1602s;
    private int f1603t;
    private int f1604u;
    private boolean f1605v;
    private boolean f1606w;
    private C0459a f1607x;
    private ViewTreeObserver f1608y;
    private OnDismissListener f1609z;

    class C05101 implements OnGlobalLayoutListener {
        final /* synthetic */ C0517e f1573a;

        C05101(C0517e c0517e) {
            this.f1573a = c0517e;
        }

        public void onGlobalLayout() {
            if (this.f1573a.mo422d() && this.f1573a.f1585b.size() > 0 && !((C0514a) this.f1573a.f1585b.get(0)).f1580a.m2883g()) {
                View view = this.f1573a.f1586c;
                if (view == null || !view.isShown()) {
                    this.f1573a.mo419c();
                    return;
                }
                for (C0514a c0514a : this.f1573a.f1585b) {
                    c0514a.f1580a.mo412a();
                }
            }
        }
    }

    class C05112 implements OnAttachStateChangeListener {
        final /* synthetic */ C0517e f1574a;

        C05112(C0517e c0517e) {
            this.f1574a = c0517e;
        }

        public void onViewAttachedToWindow(View view) {
        }

        public void onViewDetachedFromWindow(View view) {
            if (this.f1574a.f1608y != null) {
                if (!this.f1574a.f1608y.isAlive()) {
                    this.f1574a.f1608y = view.getViewTreeObserver();
                }
                this.f1574a.f1608y.removeGlobalOnLayoutListener(this.f1574a.f1594k);
            }
            view.removeOnAttachStateChangeListener(this);
        }
    }

    class C05133 implements al {
        final /* synthetic */ C0517e f1579a;

        C05133(C0517e c0517e) {
            this.f1579a = c0517e;
        }

        public void mo410a(C0521h c0521h, MenuItem menuItem) {
            this.f1579a.f1584a.removeCallbacksAndMessages(c0521h);
        }

        public void mo411b(final C0521h c0521h, final MenuItem menuItem) {
            int i;
            this.f1579a.f1584a.removeCallbacksAndMessages(null);
            int size = this.f1579a.f1585b.size();
            for (int i2 = 0; i2 < size; i2++) {
                if (c0521h == ((C0514a) this.f1579a.f1585b.get(i2)).f1581b) {
                    i = i2;
                    break;
                }
            }
            i = -1;
            if (i != -1) {
                i++;
                final C0514a c0514a = i < this.f1579a.f1585b.size() ? (C0514a) this.f1579a.f1585b.get(i) : null;
                this.f1579a.f1584a.postAtTime(new Runnable(this) {
                    final /* synthetic */ C05133 f1578d;

                    public void run() {
                        if (c0514a != null) {
                            this.f1578d.f1579a.f1587d = true;
                            c0514a.f1581b.m2447a(false);
                            this.f1578d.f1579a.f1587d = false;
                        }
                        if (menuItem.isEnabled() && menuItem.hasSubMenu()) {
                            c0521h.m2449a(menuItem, 4);
                        }
                    }
                }, c0521h, SystemClock.uptimeMillis() + 200);
            }
        }
    }

    private static class C0514a {
        public final am f1580a;
        public final C0521h f1581b;
        public final int f1582c;

        public C0514a(am amVar, C0521h c0521h, int i) {
            this.f1580a = amVar;
            this.f1581b = c0521h;
            this.f1582c = i;
        }

        public ListView m2358a() {
            return this.f1580a.mo423e();
        }
    }

    public C0517e(Context context, View view, int i, int i2, boolean z) {
        this.f1588e = context;
        this.f1599p = view;
        this.f1590g = i;
        this.f1591h = i2;
        this.f1592i = z;
        this.f1605v = false;
        this.f1600q = m2389i();
        Resources resources = context.getResources();
        this.f1589f = Math.max(resources.getDisplayMetrics().widthPixels / 2, resources.getDimensionPixelSize(C0404d.abc_config_prefDialogWidth));
        this.f1584a = new Handler();
    }

    private MenuItem m2380a(C0521h c0521h, C0521h c0521h2) {
        int size = c0521h.size();
        for (int i = 0; i < size; i++) {
            MenuItem item = c0521h.getItem(i);
            if (item.hasSubMenu() && c0521h2 == item.getSubMenu()) {
                return item;
            }
        }
        return null;
    }

    private View m2381a(C0514a c0514a, C0521h c0521h) {
        int i = 0;
        MenuItem a = m2380a(c0514a.f1581b, c0521h);
        if (a == null) {
            return null;
        }
        int headersCount;
        C0520g c0520g;
        int i2;
        ListView a2 = c0514a.m2358a();
        ListAdapter adapter = a2.getAdapter();
        if (adapter instanceof HeaderViewListAdapter) {
            HeaderViewListAdapter headerViewListAdapter = (HeaderViewListAdapter) adapter;
            headersCount = headerViewListAdapter.getHeadersCount();
            c0520g = (C0520g) headerViewListAdapter.getWrappedAdapter();
        } else {
            c0520g = (C0520g) adapter;
            headersCount = 0;
        }
        int count = c0520g.getCount();
        while (i < count) {
            if (a == c0520g.m2421a(i)) {
                i2 = i;
                break;
            }
            i++;
        }
        i2 = -1;
        if (i2 == -1) {
            return null;
        }
        i2 = (i2 + headersCount) - a2.getFirstVisiblePosition();
        return (i2 < 0 || i2 >= a2.getChildCount()) ? null : a2.getChildAt(i2);
    }

    private void m2385c(C0521h c0521h) {
        View a;
        LayoutInflater from = LayoutInflater.from(this.f1588e);
        Object c0520g = new C0520g(c0521h, from, this.f1592i);
        if (!mo422d() && this.f1605v) {
            c0520g.m2422a(true);
        } else if (mo422d()) {
            c0520g.m2422a(C0516m.m2365b(c0521h));
        }
        int a2 = C0516m.m2363a(c0520g, null, this.f1588e, this.f1589f);
        am h = m2388h();
        h.mo547a((ListAdapter) c0520g);
        h.m2882g(a2);
        h.m2880e(this.f1598o);
        if (this.f1585b.size() > 0) {
            C0514a c0514a = (C0514a) this.f1585b.get(this.f1585b.size() - 1);
            a = m2381a(c0514a, c0521h);
            C0514a c0514a2 = c0514a;
        } else {
            a = null;
            Object obj = null;
        }
        if (a != null) {
            int i;
            h.mo489c(false);
            h.m2898a(null);
            int d = m2386d(a2);
            boolean z = d == 1;
            this.f1600q = d;
            if (VERSION.SDK_INT >= 26) {
                h.m2873b(a);
                d = 0;
                i = 0;
            } else {
                int[] iArr = new int[2];
                this.f1599p.getLocationOnScreen(iArr);
                int[] iArr2 = new int[2];
                a.getLocationOnScreen(iArr2);
                i = iArr2[0] - iArr[0];
                d = iArr2[1] - iArr[1];
            }
            int width = (this.f1598o & 5) == 5 ? z ? i + a2 : i - a.getWidth() : z ? a.getWidth() + i : i - a2;
            h.m2876c(width);
            h.m2874b(true);
            h.m2877d(d);
        } else {
            if (this.f1601r) {
                h.m2876c(this.f1603t);
            }
            if (this.f1602s) {
                h.m2877d(this.f1604u);
            }
            h.m2866a(m2379g());
        }
        this.f1585b.add(new C0514a(h, c0521h, this.f1600q));
        h.mo412a();
        ViewGroup e = h.mo423e();
        e.setOnKeyListener(this);
        if (c0514a2 == null && this.f1606w && c0521h.m2473m() != null) {
            FrameLayout frameLayout = (FrameLayout) from.inflate(C0407g.abc_popup_menu_header_item_layout, e, false);
            TextView textView = (TextView) frameLayout.findViewById(16908310);
            frameLayout.setEnabled(false);
            textView.setText(c0521h.m2473m());
            e.addHeaderView(frameLayout, null, false);
            h.mo412a();
        }
    }

    private int m2386d(int i) {
        ListView a = ((C0514a) this.f1585b.get(this.f1585b.size() - 1)).m2358a();
        int[] iArr = new int[2];
        a.getLocationOnScreen(iArr);
        Rect rect = new Rect();
        this.f1586c.getWindowVisibleDisplayFrame(rect);
        if (this.f1600q != 1) {
            return iArr[0] - i < 0 ? 1 : 0;
        } else {
            return (a.getWidth() + iArr[0]) + i > rect.right ? 0 : 1;
        }
    }

    private int m2387d(C0521h c0521h) {
        int size = this.f1585b.size();
        for (int i = 0; i < size; i++) {
            if (c0521h == ((C0514a) this.f1585b.get(i)).f1581b) {
                return i;
            }
        }
        return -1;
    }

    private am m2388h() {
        am amVar = new am(this.f1588e, null, this.f1590g, this.f1591h);
        amVar.m2897a(this.f1596m);
        amVar.m2868a((OnItemClickListener) this);
        amVar.m2870a((OnDismissListener) this);
        amVar.m2873b(this.f1599p);
        amVar.m2880e(this.f1598o);
        amVar.m2871a(true);
        amVar.m2885h(2);
        return amVar;
    }

    private int m2389i() {
        return C0315p.m1387b(this.f1599p) == 1 ? 0 : 1;
    }

    public void mo412a() {
        if (!mo422d()) {
            for (C0521h c : this.f1593j) {
                m2385c(c);
            }
            this.f1593j.clear();
            this.f1586c = this.f1599p;
            if (this.f1586c != null) {
                Object obj = this.f1608y == null ? 1 : null;
                this.f1608y = this.f1586c.getViewTreeObserver();
                if (obj != null) {
                    this.f1608y.addOnGlobalLayoutListener(this.f1594k);
                }
                this.f1586c.addOnAttachStateChangeListener(this.f1595l);
            }
        }
    }

    public void mo413a(int i) {
        if (this.f1597n != i) {
            this.f1597n = i;
            this.f1598o = C0287d.m1269a(i, C0315p.m1387b(this.f1599p));
        }
    }

    public void mo414a(C0521h c0521h) {
        c0521h.m2444a((C0506o) this, this.f1588e);
        if (mo422d()) {
            m2385c(c0521h);
        } else {
            this.f1593j.add(c0521h);
        }
    }

    public void mo403a(C0521h c0521h, boolean z) {
        int d = m2387d(c0521h);
        if (d >= 0) {
            int i = d + 1;
            if (i < this.f1585b.size()) {
                ((C0514a) this.f1585b.get(i)).f1581b.m2447a(false);
            }
            C0514a c0514a = (C0514a) this.f1585b.remove(d);
            c0514a.f1581b.m2454b((C0506o) this);
            if (this.f1587d) {
                c0514a.f1580a.m2900b(null);
                c0514a.f1580a.m2872b(0);
            }
            c0514a.f1580a.mo419c();
            d = this.f1585b.size();
            if (d > 0) {
                this.f1600q = ((C0514a) this.f1585b.get(d - 1)).f1582c;
            } else {
                this.f1600q = m2389i();
            }
            if (d == 0) {
                mo419c();
                if (this.f1607x != null) {
                    this.f1607x.mo321a(c0521h, true);
                }
                if (this.f1608y != null) {
                    if (this.f1608y.isAlive()) {
                        this.f1608y.removeGlobalOnLayoutListener(this.f1594k);
                    }
                    this.f1608y = null;
                }
                this.f1586c.removeOnAttachStateChangeListener(this.f1595l);
                this.f1609z.onDismiss();
            } else if (z) {
                ((C0514a) this.f1585b.get(0)).f1581b.m2447a(false);
            }
        }
    }

    public void mo404a(C0459a c0459a) {
        this.f1607x = c0459a;
    }

    public void mo415a(View view) {
        if (this.f1599p != view) {
            this.f1599p = view;
            this.f1598o = C0287d.m1269a(this.f1597n, C0315p.m1387b(this.f1599p));
        }
    }

    public void mo416a(OnDismissListener onDismissListener) {
        this.f1609z = onDismissListener;
    }

    public void mo417a(boolean z) {
        this.f1605v = z;
    }

    public boolean mo406a(C0539u c0539u) {
        for (C0514a c0514a : this.f1585b) {
            if (c0539u == c0514a.f1581b) {
                c0514a.m2358a().requestFocus();
                return true;
            }
        }
        if (!c0539u.hasVisibleItems()) {
            return false;
        }
        mo414a((C0521h) c0539u);
        if (this.f1607x != null) {
            this.f1607x.mo322a(c0539u);
        }
        return true;
    }

    public void mo418b(int i) {
        this.f1601r = true;
        this.f1603t = i;
    }

    public void mo407b(boolean z) {
        for (C0514a a : this.f1585b) {
            C0516m.m2364a(a.m2358a().getAdapter()).notifyDataSetChanged();
        }
    }

    public boolean mo408b() {
        return false;
    }

    public void mo419c() {
        int size = this.f1585b.size();
        if (size > 0) {
            C0514a[] c0514aArr = (C0514a[]) this.f1585b.toArray(new C0514a[size]);
            for (size--; size >= 0; size--) {
                C0514a c0514a = c0514aArr[size];
                if (c0514a.f1580a.mo422d()) {
                    c0514a.f1580a.mo419c();
                }
            }
        }
    }

    public void mo420c(int i) {
        this.f1602s = true;
        this.f1604u = i;
    }

    public void mo421c(boolean z) {
        this.f1606w = z;
    }

    public boolean mo422d() {
        return this.f1585b.size() > 0 && ((C0514a) this.f1585b.get(0)).f1580a.mo422d();
    }

    public ListView mo423e() {
        return this.f1585b.isEmpty() ? null : ((C0514a) this.f1585b.get(this.f1585b.size() - 1)).m2358a();
    }

    protected boolean mo424f() {
        return false;
    }

    public void onDismiss() {
        C0514a c0514a;
        int size = this.f1585b.size();
        for (int i = 0; i < size; i++) {
            c0514a = (C0514a) this.f1585b.get(i);
            if (!c0514a.f1580a.mo422d()) {
                break;
            }
        }
        c0514a = null;
        if (c0514a != null) {
            c0514a.f1581b.m2447a(false);
        }
    }

    public boolean onKey(View view, int i, KeyEvent keyEvent) {
        if (keyEvent.getAction() != 1 || i != 82) {
            return false;
        }
        mo419c();
        return true;
    }
}
