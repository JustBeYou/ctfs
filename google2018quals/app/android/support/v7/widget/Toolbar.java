package android.support.v7.widget;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.ClassLoaderCreator;
import android.os.Parcelable.Creator;
import android.support.v4.p017h.C0245a;
import android.support.v4.p017h.C0287d;
import android.support.v4.p017h.C0291f;
import android.support.v4.p017h.C0315p;
import android.support.v7.app.C0428a.C0425a;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.p020a.C0411a.C0410j;
import android.support.v7.p021b.p022a.C0485b;
import android.support.v7.view.C0489c;
import android.support.v7.view.C0496g;
import android.support.v7.view.menu.C0506o;
import android.support.v7.view.menu.C0506o.C0459a;
import android.support.v7.view.menu.C0521h;
import android.support.v7.view.menu.C0521h.C0442a;
import android.support.v7.view.menu.C0524j;
import android.support.v7.view.menu.C0539u;
import android.support.v7.widget.ActionMenuView.C0551e;
import android.text.TextUtils;
import android.text.TextUtils.TruncateAt;
import android.util.AttributeSet;
import android.view.ContextThemeWrapper;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;

public class Toolbar extends ViewGroup {
    private int f1935A;
    private int f1936B;
    private boolean f1937C;
    private boolean f1938D;
    private final ArrayList<View> f1939E;
    private final ArrayList<View> f1940F;
    private final int[] f1941G;
    private final C0551e f1942H;
    private ax f1943I;
    private C0607d f1944J;
    private C0566a f1945K;
    private C0459a f1946L;
    private C0442a f1947M;
    private boolean f1948N;
    private final Runnable f1949O;
    ImageButton f1950a;
    View f1951b;
    int f1952c;
    C0568c f1953d;
    private ActionMenuView f1954e;
    private TextView f1955f;
    private TextView f1956g;
    private ImageButton f1957h;
    private ImageView f1958i;
    private Drawable f1959j;
    private CharSequence f1960k;
    private Context f1961l;
    private int f1962m;
    private int f1963n;
    private int f1964o;
    private int f1965p;
    private int f1966q;
    private int f1967r;
    private int f1968s;
    private int f1969t;
    private ao f1970u;
    private int f1971v;
    private int f1972w;
    private int f1973x;
    private CharSequence f1974y;
    private CharSequence f1975z;

    class C05631 implements C0551e {
        final /* synthetic */ Toolbar f1926a;

        C05631(Toolbar toolbar) {
            this.f1926a = toolbar;
        }

        public boolean mo476a(MenuItem menuItem) {
            return this.f1926a.f1953d != null ? this.f1926a.f1953d.m2736a(menuItem) : false;
        }
    }

    class C05642 implements Runnable {
        final /* synthetic */ Toolbar f1927a;

        C05642(Toolbar toolbar) {
            this.f1927a = toolbar;
        }

        public void run() {
            this.f1927a.m2771d();
        }
    }

    class C05653 implements OnClickListener {
        final /* synthetic */ Toolbar f1928a;

        C05653(Toolbar toolbar) {
            this.f1928a = toolbar;
        }

        public void onClick(View view) {
            this.f1928a.m2775h();
        }
    }

    private class C0566a implements C0506o {
        C0521h f1929a;
        C0524j f1930b;
        final /* synthetic */ Toolbar f1931c;

        C0566a(Toolbar toolbar) {
            this.f1931c = toolbar;
        }

        public void mo402a(Context context, C0521h c0521h) {
            if (!(this.f1929a == null || this.f1930b == null)) {
                this.f1929a.mo443d(this.f1930b);
            }
            this.f1929a = c0521h;
        }

        public void mo403a(C0521h c0521h, boolean z) {
        }

        public void mo404a(C0459a c0459a) {
        }

        public boolean mo405a(C0521h c0521h, C0524j c0524j) {
            this.f1931c.m2776i();
            if (this.f1931c.f1950a.getParent() != this.f1931c) {
                this.f1931c.addView(this.f1931c.f1950a);
            }
            this.f1931c.f1951b = c0524j.getActionView();
            this.f1930b = c0524j;
            if (this.f1931c.f1951b.getParent() != this.f1931c) {
                LayoutParams j = this.f1931c.m2777j();
                j.a = 8388611 | (this.f1931c.f1952c & C0410j.AppCompatTheme_windowFixedHeightMajor);
                j.f1932b = 2;
                this.f1931c.f1951b.setLayoutParams(j);
                this.f1931c.addView(this.f1931c.f1951b);
            }
            this.f1931c.m2778k();
            this.f1931c.requestLayout();
            c0524j.m2503e(true);
            if (this.f1931c.f1951b instanceof C0489c) {
                ((C0489c) this.f1931c.f1951b).mo430a();
            }
            return true;
        }

        public boolean mo406a(C0539u c0539u) {
            return false;
        }

        public void mo407b(boolean z) {
            Object obj = null;
            if (this.f1930b != null) {
                if (this.f1929a != null) {
                    int size = this.f1929a.size();
                    for (int i = 0; i < size; i++) {
                        if (this.f1929a.getItem(i) == this.f1930b) {
                            obj = 1;
                            break;
                        }
                    }
                }
                if (obj == null) {
                    mo409b(this.f1929a, this.f1930b);
                }
            }
        }

        public boolean mo408b() {
            return false;
        }

        public boolean mo409b(C0521h c0521h, C0524j c0524j) {
            if (this.f1931c.f1951b instanceof C0489c) {
                ((C0489c) this.f1931c.f1951b).mo431b();
            }
            this.f1931c.removeView(this.f1931c.f1951b);
            this.f1931c.removeView(this.f1931c.f1950a);
            this.f1931c.f1951b = null;
            this.f1931c.m2779l();
            this.f1930b = null;
            this.f1931c.requestLayout();
            c0524j.m2503e(false);
            return true;
        }
    }

    public static class C0567b extends C0425a {
        int f1932b;

        public C0567b(int i, int i2) {
            super(i, i2);
            this.f1932b = 0;
            this.a = 8388627;
        }

        public C0567b(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            this.f1932b = 0;
        }

        public C0567b(C0425a c0425a) {
            super(c0425a);
            this.f1932b = 0;
        }

        public C0567b(C0567b c0567b) {
            super((C0425a) c0567b);
            this.f1932b = 0;
            this.f1932b = c0567b.f1932b;
        }

        public C0567b(LayoutParams layoutParams) {
            super(layoutParams);
            this.f1932b = 0;
        }

        public C0567b(MarginLayoutParams marginLayoutParams) {
            super((LayoutParams) marginLayoutParams);
            this.f1932b = 0;
            m2735a(marginLayoutParams);
        }

        void m2735a(MarginLayoutParams marginLayoutParams) {
            this.leftMargin = marginLayoutParams.leftMargin;
            this.topMargin = marginLayoutParams.topMargin;
            this.rightMargin = marginLayoutParams.rightMargin;
            this.bottomMargin = marginLayoutParams.bottomMargin;
        }
    }

    public interface C0568c {
        boolean m2736a(MenuItem menuItem);
    }

    public static class C0570d extends C0245a {
        public static final Creator<C0570d> CREATOR = new C05691();
        int f1933b;
        boolean f1934c;

        static class C05691 implements ClassLoaderCreator<C0570d> {
            C05691() {
            }

            public C0570d m2737a(Parcel parcel) {
                return new C0570d(parcel, null);
            }

            public C0570d m2738a(Parcel parcel, ClassLoader classLoader) {
                return new C0570d(parcel, classLoader);
            }

            public C0570d[] m2739a(int i) {
                return new C0570d[i];
            }

            public /* synthetic */ Object createFromParcel(Parcel parcel) {
                return m2737a(parcel);
            }

            public /* synthetic */ Object createFromParcel(Parcel parcel, ClassLoader classLoader) {
                return m2738a(parcel, classLoader);
            }

            public /* synthetic */ Object[] newArray(int i) {
                return m2739a(i);
            }
        }

        public C0570d(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            this.f1933b = parcel.readInt();
            this.f1934c = parcel.readInt() != 0;
        }

        public C0570d(Parcelable parcelable) {
            super(parcelable);
        }

        public void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeInt(this.f1933b);
            parcel.writeInt(this.f1934c ? 1 : 0);
        }
    }

    public Toolbar(Context context) {
        this(context, null);
    }

    public Toolbar(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, C0401a.toolbarStyle);
    }

    public Toolbar(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.f1973x = 8388627;
        this.f1939E = new ArrayList();
        this.f1940F = new ArrayList();
        this.f1941G = new int[2];
        this.f1942H = new C05631(this);
        this.f1949O = new C05642(this);
        aw a = aw.m2953a(getContext(), attributeSet, C0410j.Toolbar, i, 0);
        this.f1963n = a.m2970g(C0410j.Toolbar_titleTextAppearance, 0);
        this.f1964o = a.m2970g(C0410j.Toolbar_subtitleTextAppearance, 0);
        this.f1973x = a.m2962c(C0410j.Toolbar_android_gravity, this.f1973x);
        this.f1952c = a.m2962c(C0410j.Toolbar_buttonGravity, 48);
        int d = a.m2964d(C0410j.Toolbar_titleMargin, 0);
        if (a.m2971g(C0410j.Toolbar_titleMargins)) {
            d = a.m2964d(C0410j.Toolbar_titleMargins, d);
        }
        this.f1969t = d;
        this.f1968s = d;
        this.f1967r = d;
        this.f1966q = d;
        d = a.m2964d(C0410j.Toolbar_titleMarginStart, -1);
        if (d >= 0) {
            this.f1966q = d;
        }
        d = a.m2964d(C0410j.Toolbar_titleMarginEnd, -1);
        if (d >= 0) {
            this.f1967r = d;
        }
        d = a.m2964d(C0410j.Toolbar_titleMarginTop, -1);
        if (d >= 0) {
            this.f1968s = d;
        }
        d = a.m2964d(C0410j.Toolbar_titleMarginBottom, -1);
        if (d >= 0) {
            this.f1969t = d;
        }
        this.f1965p = a.m2966e(C0410j.Toolbar_maxButtonHeight, -1);
        d = a.m2964d(C0410j.Toolbar_contentInsetStart, Integer.MIN_VALUE);
        int d2 = a.m2964d(C0410j.Toolbar_contentInsetEnd, Integer.MIN_VALUE);
        int e = a.m2966e(C0410j.Toolbar_contentInsetLeft, 0);
        int e2 = a.m2966e(C0410j.Toolbar_contentInsetRight, 0);
        m2760s();
        this.f1970u.m2906b(e, e2);
        if (!(d == Integer.MIN_VALUE && d2 == Integer.MIN_VALUE)) {
            this.f1970u.m2903a(d, d2);
        }
        this.f1971v = a.m2964d(C0410j.Toolbar_contentInsetStartWithNavigation, Integer.MIN_VALUE);
        this.f1972w = a.m2964d(C0410j.Toolbar_contentInsetEndWithActions, Integer.MIN_VALUE);
        this.f1959j = a.m2957a(C0410j.Toolbar_collapseIcon);
        this.f1960k = a.m2963c(C0410j.Toolbar_collapseContentDescription);
        CharSequence c = a.m2963c(C0410j.Toolbar_title);
        if (!TextUtils.isEmpty(c)) {
            setTitle(c);
        }
        c = a.m2963c(C0410j.Toolbar_subtitle);
        if (!TextUtils.isEmpty(c)) {
            setSubtitle(c);
        }
        this.f1961l = getContext();
        setPopupTheme(a.m2970g(C0410j.Toolbar_popupTheme, 0));
        Drawable a2 = a.m2957a(C0410j.Toolbar_navigationIcon);
        if (a2 != null) {
            setNavigationIcon(a2);
        }
        c = a.m2963c(C0410j.Toolbar_navigationContentDescription);
        if (!TextUtils.isEmpty(c)) {
            setNavigationContentDescription(c);
        }
        a2 = a.m2957a(C0410j.Toolbar_logo);
        if (a2 != null) {
            setLogo(a2);
        }
        c = a.m2963c(C0410j.Toolbar_logoDescription);
        if (!TextUtils.isEmpty(c)) {
            setLogoDescription(c);
        }
        if (a.m2971g(C0410j.Toolbar_titleTextColor)) {
            setTitleTextColor(a.m2960b(C0410j.Toolbar_titleTextColor, -1));
        }
        if (a.m2971g(C0410j.Toolbar_subtitleTextColor)) {
            setSubtitleTextColor(a.m2960b(C0410j.Toolbar_subtitleTextColor, -1));
        }
        a.m2958a();
    }

    private int m2740a(int i) {
        int i2 = i & C0410j.AppCompatTheme_windowFixedHeightMajor;
        switch (i2) {
            case 16:
            case 48:
            case C0410j.AppCompatTheme_panelMenuListTheme /*80*/:
                return i2;
            default:
                return this.f1973x & C0410j.AppCompatTheme_windowFixedHeightMajor;
        }
    }

    private int m2741a(View view, int i) {
        C0567b c0567b = (C0567b) view.getLayoutParams();
        int measuredHeight = view.getMeasuredHeight();
        int i2 = i > 0 ? (measuredHeight - i) / 2 : 0;
        switch (m2740a(c0567b.a)) {
            case 48:
                return getPaddingTop() - i2;
            case C0410j.AppCompatTheme_panelMenuListTheme /*80*/:
                return (((getHeight() - getPaddingBottom()) - measuredHeight) - c0567b.bottomMargin) - i2;
            default:
                int i3;
                int paddingTop = getPaddingTop();
                int paddingBottom = getPaddingBottom();
                int height = getHeight();
                i2 = (((height - paddingTop) - paddingBottom) - measuredHeight) / 2;
                if (i2 < c0567b.topMargin) {
                    i3 = c0567b.topMargin;
                } else {
                    measuredHeight = (((height - paddingBottom) - measuredHeight) - i2) - paddingTop;
                    i3 = measuredHeight < c0567b.bottomMargin ? Math.max(0, i2 - (c0567b.bottomMargin - measuredHeight)) : i2;
                }
                return i3 + paddingTop;
        }
    }

    private int m2742a(View view, int i, int i2, int i3, int i4, int[] iArr) {
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        int i5 = marginLayoutParams.leftMargin - iArr[0];
        int i6 = marginLayoutParams.rightMargin - iArr[1];
        int max = Math.max(0, i5) + Math.max(0, i6);
        iArr[0] = Math.max(0, -i5);
        iArr[1] = Math.max(0, -i6);
        view.measure(getChildMeasureSpec(i, ((getPaddingLeft() + getPaddingRight()) + max) + i2, marginLayoutParams.width), getChildMeasureSpec(i3, (((getPaddingTop() + getPaddingBottom()) + marginLayoutParams.topMargin) + marginLayoutParams.bottomMargin) + i4, marginLayoutParams.height));
        return view.getMeasuredWidth() + max;
    }

    private int m2743a(View view, int i, int[] iArr, int i2) {
        C0567b c0567b = (C0567b) view.getLayoutParams();
        int i3 = c0567b.leftMargin - iArr[0];
        int max = Math.max(0, i3) + i;
        iArr[0] = Math.max(0, -i3);
        i3 = m2741a(view, i2);
        int measuredWidth = view.getMeasuredWidth();
        view.layout(max, i3, max + measuredWidth, view.getMeasuredHeight() + i3);
        return (c0567b.rightMargin + measuredWidth) + max;
    }

    private int m2744a(List<View> list, int[] iArr) {
        int i = iArr[0];
        int i2 = iArr[1];
        int size = list.size();
        int i3 = 0;
        int i4 = 0;
        int i5 = i2;
        int i6 = i;
        while (i3 < size) {
            View view = (View) list.get(i3);
            C0567b c0567b = (C0567b) view.getLayoutParams();
            i6 = c0567b.leftMargin - i6;
            i = c0567b.rightMargin - i5;
            int max = Math.max(0, i6);
            int max2 = Math.max(0, i);
            i6 = Math.max(0, -i6);
            i5 = Math.max(0, -i);
            i3++;
            i4 += (view.getMeasuredWidth() + max) + max2;
        }
        return i4;
    }

    private void m2745a(View view, int i, int i2, int i3, int i4, int i5) {
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        int childMeasureSpec = getChildMeasureSpec(i, (((getPaddingLeft() + getPaddingRight()) + marginLayoutParams.leftMargin) + marginLayoutParams.rightMargin) + i2, marginLayoutParams.width);
        int childMeasureSpec2 = getChildMeasureSpec(i3, (((getPaddingTop() + getPaddingBottom()) + marginLayoutParams.topMargin) + marginLayoutParams.bottomMargin) + i4, marginLayoutParams.height);
        int mode = MeasureSpec.getMode(childMeasureSpec2);
        if (mode != 1073741824 && i5 >= 0) {
            if (mode != 0) {
                i5 = Math.min(MeasureSpec.getSize(childMeasureSpec2), i5);
            }
            childMeasureSpec2 = MeasureSpec.makeMeasureSpec(i5, 1073741824);
        }
        view.measure(childMeasureSpec, childMeasureSpec2);
    }

    private void m2746a(View view, boolean z) {
        LayoutParams layoutParams = view.getLayoutParams();
        if (layoutParams == null) {
            layoutParams = m2777j();
        } else if (checkLayoutParams(layoutParams)) {
            C0567b c0567b = (C0567b) layoutParams;
        } else {
            layoutParams = m2762a(layoutParams);
        }
        layoutParams.f1932b = 1;
        if (!z || this.f1951b == null) {
            addView(view, layoutParams);
            return;
        }
        view.setLayoutParams(layoutParams);
        this.f1940F.add(view);
    }

    private void m2747a(List<View> list, int i) {
        int i2 = 1;
        int i3 = 0;
        if (C0315p.m1387b(this) != 1) {
            i2 = 0;
        }
        int childCount = getChildCount();
        int a = C0287d.m1269a(i, C0315p.m1387b(this));
        list.clear();
        C0567b c0567b;
        if (i2 != 0) {
            for (i3 = childCount - 1; i3 >= 0; i3--) {
                View childAt = getChildAt(i3);
                c0567b = (C0567b) childAt.getLayoutParams();
                if (c0567b.f1932b == 0 && m2748a(childAt) && m2749b(c0567b.a) == a) {
                    list.add(childAt);
                }
            }
            return;
        }
        while (i3 < childCount) {
            View childAt2 = getChildAt(i3);
            c0567b = (C0567b) childAt2.getLayoutParams();
            if (c0567b.f1932b == 0 && m2748a(childAt2) && m2749b(c0567b.a) == a) {
                list.add(childAt2);
            }
            i3++;
        }
    }

    private boolean m2748a(View view) {
        return (view == null || view.getParent() != this || view.getVisibility() == 8) ? false : true;
    }

    private int m2749b(int i) {
        int b = C0315p.m1387b(this);
        int a = C0287d.m1269a(i, b) & 7;
        switch (a) {
            case 1:
            case 3:
            case 5:
                return a;
            default:
                return b == 1 ? 5 : 3;
        }
    }

    private int m2750b(View view) {
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        return C0291f.m1275b(marginLayoutParams) + C0291f.m1274a(marginLayoutParams);
    }

    private int m2751b(View view, int i, int[] iArr, int i2) {
        C0567b c0567b = (C0567b) view.getLayoutParams();
        int i3 = c0567b.rightMargin - iArr[1];
        int max = i - Math.max(0, i3);
        iArr[1] = Math.max(0, -i3);
        i3 = m2741a(view, i2);
        int measuredWidth = view.getMeasuredWidth();
        view.layout(max - measuredWidth, i3, max, view.getMeasuredHeight() + i3);
        return max - (c0567b.leftMargin + measuredWidth);
    }

    private int m2752c(View view) {
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        return marginLayoutParams.bottomMargin + marginLayoutParams.topMargin;
    }

    private boolean m2753d(View view) {
        return view.getParent() == this || this.f1940F.contains(view);
    }

    private MenuInflater getMenuInflater() {
        return new C0496g(getContext());
    }

    private void m2754m() {
        if (this.f1958i == null) {
            this.f1958i = new C0603p(getContext());
        }
    }

    private void m2755n() {
        m2756o();
        if (this.f1954e.m2661d() == null) {
            C0521h c0521h = (C0521h) this.f1954e.getMenu();
            if (this.f1945K == null) {
                this.f1945K = new C0566a(this);
            }
            this.f1954e.setExpandedActionViewsExclusive(true);
            c0521h.m2444a(this.f1945K, this.f1961l);
        }
    }

    private void m2756o() {
        if (this.f1954e == null) {
            this.f1954e = new ActionMenuView(getContext());
            this.f1954e.setPopupTheme(this.f1962m);
            this.f1954e.setOnMenuItemClickListener(this.f1942H);
            this.f1954e.m2653a(this.f1946L, this.f1947M);
            LayoutParams j = m2777j();
            j.a = 8388613 | (this.f1952c & C0410j.AppCompatTheme_windowFixedHeightMajor);
            this.f1954e.setLayoutParams(j);
            m2746a(this.f1954e, false);
        }
    }

    private void m2757p() {
        if (this.f1957h == null) {
            this.f1957h = new C0625n(getContext(), null, C0401a.toolbarNavigationButtonStyle);
            LayoutParams j = m2777j();
            j.a = 8388611 | (this.f1952c & C0410j.AppCompatTheme_windowFixedHeightMajor);
            this.f1957h.setLayoutParams(j);
        }
    }

    private void m2758q() {
        removeCallbacks(this.f1949O);
        post(this.f1949O);
    }

    private boolean m2759r() {
        if (!this.f1948N) {
            return false;
        }
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            if (m2748a(childAt) && childAt.getMeasuredWidth() > 0 && childAt.getMeasuredHeight() > 0) {
                return false;
            }
        }
        return true;
    }

    private void m2760s() {
        if (this.f1970u == null) {
            this.f1970u = new ao();
        }
    }

    public C0567b m2761a(AttributeSet attributeSet) {
        return new C0567b(getContext(), attributeSet);
    }

    protected C0567b m2762a(LayoutParams layoutParams) {
        return layoutParams instanceof C0567b ? new C0567b((C0567b) layoutParams) : layoutParams instanceof C0425a ? new C0567b((C0425a) layoutParams) : layoutParams instanceof MarginLayoutParams ? new C0567b((MarginLayoutParams) layoutParams) : new C0567b(layoutParams);
    }

    public void m2763a(int i, int i2) {
        m2760s();
        this.f1970u.m2903a(i, i2);
    }

    public void m2764a(Context context, int i) {
        this.f1963n = i;
        if (this.f1955f != null) {
            this.f1955f.setTextAppearance(context, i);
        }
    }

    public void m2765a(C0521h c0521h, C0607d c0607d) {
        if (c0521h != null || this.f1954e != null) {
            m2756o();
            C0521h d = this.f1954e.m2661d();
            if (d != c0521h) {
                if (d != null) {
                    d.m2454b(this.f1944J);
                    d.m2454b(this.f1945K);
                }
                if (this.f1945K == null) {
                    this.f1945K = new C0566a(this);
                }
                c0607d.m3070d(true);
                if (c0521h != null) {
                    c0521h.m2444a((C0506o) c0607d, this.f1961l);
                    c0521h.m2444a(this.f1945K, this.f1961l);
                } else {
                    c0607d.mo402a(this.f1961l, null);
                    this.f1945K.mo402a(this.f1961l, null);
                    c0607d.mo407b(true);
                    this.f1945K.mo407b(true);
                }
                this.f1954e.setPopupTheme(this.f1962m);
                this.f1954e.setPresenter(c0607d);
                this.f1944J = c0607d;
            }
        }
    }

    public void m2766a(C0459a c0459a, C0442a c0442a) {
        this.f1946L = c0459a;
        this.f1947M = c0442a;
        if (this.f1954e != null) {
            this.f1954e.m2653a(c0459a, c0442a);
        }
    }

    public boolean m2767a() {
        return getVisibility() == 0 && this.f1954e != null && this.f1954e.m2654a();
    }

    public void m2768b(Context context, int i) {
        this.f1964o = i;
        if (this.f1956g != null) {
            this.f1956g.setTextAppearance(context, i);
        }
    }

    public boolean m2769b() {
        return this.f1954e != null && this.f1954e.m2664g();
    }

    public boolean m2770c() {
        return this.f1954e != null && this.f1954e.m2665h();
    }

    protected boolean checkLayoutParams(LayoutParams layoutParams) {
        return super.checkLayoutParams(layoutParams) && (layoutParams instanceof C0567b);
    }

    public boolean m2771d() {
        return this.f1954e != null && this.f1954e.m2662e();
    }

    public boolean m2772e() {
        return this.f1954e != null && this.f1954e.m2663f();
    }

    public void m2773f() {
        if (this.f1954e != null) {
            this.f1954e.m2666i();
        }
    }

    public boolean m2774g() {
        return (this.f1945K == null || this.f1945K.f1930b == null) ? false : true;
    }

    protected /* synthetic */ LayoutParams generateDefaultLayoutParams() {
        return m2777j();
    }

    public /* synthetic */ LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return m2761a(attributeSet);
    }

    protected /* synthetic */ LayoutParams generateLayoutParams(LayoutParams layoutParams) {
        return m2762a(layoutParams);
    }

    public int getContentInsetEnd() {
        return this.f1970u != null ? this.f1970u.m2908d() : 0;
    }

    public int getContentInsetEndWithActions() {
        return this.f1972w != Integer.MIN_VALUE ? this.f1972w : getContentInsetEnd();
    }

    public int getContentInsetLeft() {
        return this.f1970u != null ? this.f1970u.m2902a() : 0;
    }

    public int getContentInsetRight() {
        return this.f1970u != null ? this.f1970u.m2905b() : 0;
    }

    public int getContentInsetStart() {
        return this.f1970u != null ? this.f1970u.m2907c() : 0;
    }

    public int getContentInsetStartWithNavigation() {
        return this.f1971v != Integer.MIN_VALUE ? this.f1971v : getContentInsetStart();
    }

    public int getCurrentContentInsetEnd() {
        int i;
        if (this.f1954e != null) {
            C0521h d = this.f1954e.m2661d();
            i = (d == null || !d.hasVisibleItems()) ? 0 : 1;
        } else {
            i = 0;
        }
        return i != 0 ? Math.max(getContentInsetEnd(), Math.max(this.f1972w, 0)) : getContentInsetEnd();
    }

    public int getCurrentContentInsetLeft() {
        return C0315p.m1387b(this) == 1 ? getCurrentContentInsetEnd() : getCurrentContentInsetStart();
    }

    public int getCurrentContentInsetRight() {
        return C0315p.m1387b(this) == 1 ? getCurrentContentInsetStart() : getCurrentContentInsetEnd();
    }

    public int getCurrentContentInsetStart() {
        return getNavigationIcon() != null ? Math.max(getContentInsetStart(), Math.max(this.f1971v, 0)) : getContentInsetStart();
    }

    public Drawable getLogo() {
        return this.f1958i != null ? this.f1958i.getDrawable() : null;
    }

    public CharSequence getLogoDescription() {
        return this.f1958i != null ? this.f1958i.getContentDescription() : null;
    }

    public Menu getMenu() {
        m2755n();
        return this.f1954e.getMenu();
    }

    public CharSequence getNavigationContentDescription() {
        return this.f1957h != null ? this.f1957h.getContentDescription() : null;
    }

    public Drawable getNavigationIcon() {
        return this.f1957h != null ? this.f1957h.getDrawable() : null;
    }

    C0607d getOuterActionMenuPresenter() {
        return this.f1944J;
    }

    public Drawable getOverflowIcon() {
        m2755n();
        return this.f1954e.getOverflowIcon();
    }

    Context getPopupContext() {
        return this.f1961l;
    }

    public int getPopupTheme() {
        return this.f1962m;
    }

    public CharSequence getSubtitle() {
        return this.f1975z;
    }

    public CharSequence getTitle() {
        return this.f1974y;
    }

    public int getTitleMarginBottom() {
        return this.f1969t;
    }

    public int getTitleMarginEnd() {
        return this.f1967r;
    }

    public int getTitleMarginStart() {
        return this.f1966q;
    }

    public int getTitleMarginTop() {
        return this.f1968s;
    }

    public ad getWrapper() {
        if (this.f1943I == null) {
            this.f1943I = new ax(this, true);
        }
        return this.f1943I;
    }

    public void m2775h() {
        C0524j c0524j = this.f1945K == null ? null : this.f1945K.f1930b;
        if (c0524j != null) {
            c0524j.collapseActionView();
        }
    }

    void m2776i() {
        if (this.f1950a == null) {
            this.f1950a = new C0625n(getContext(), null, C0401a.toolbarNavigationButtonStyle);
            this.f1950a.setImageDrawable(this.f1959j);
            this.f1950a.setContentDescription(this.f1960k);
            LayoutParams j = m2777j();
            j.a = 8388611 | (this.f1952c & C0410j.AppCompatTheme_windowFixedHeightMajor);
            j.f1932b = 2;
            this.f1950a.setLayoutParams(j);
            this.f1950a.setOnClickListener(new C05653(this));
        }
    }

    protected C0567b m2777j() {
        return new C0567b(-2, -2);
    }

    void m2778k() {
        for (int childCount = getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = getChildAt(childCount);
            if (!(((C0567b) childAt.getLayoutParams()).f1932b == 2 || childAt == this.f1954e)) {
                removeViewAt(childCount);
                this.f1940F.add(childAt);
            }
        }
    }

    void m2779l() {
        for (int size = this.f1940F.size() - 1; size >= 0; size--) {
            addView((View) this.f1940F.get(size));
        }
        this.f1940F.clear();
    }

    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        removeCallbacks(this.f1949O);
    }

    public boolean onHoverEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 9) {
            this.f1938D = false;
        }
        if (!this.f1938D) {
            boolean onHoverEvent = super.onHoverEvent(motionEvent);
            if (actionMasked == 9 && !onHoverEvent) {
                this.f1938D = true;
            }
        }
        if (actionMasked == 10 || actionMasked == 3) {
            this.f1938D = false;
        }
        return true;
    }

    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int measuredHeight;
        int measuredWidth;
        Object obj = C0315p.m1387b(this) == 1 ? 1 : null;
        int width = getWidth();
        int height = getHeight();
        int paddingLeft = getPaddingLeft();
        int paddingRight = getPaddingRight();
        int paddingTop = getPaddingTop();
        int paddingBottom = getPaddingBottom();
        int i5 = width - paddingRight;
        int[] iArr = this.f1941G;
        iArr[1] = 0;
        iArr[0] = 0;
        int c = C0315p.m1388c(this);
        int min = c >= 0 ? Math.min(c, i4 - i2) : 0;
        if (!m2748a(this.f1957h)) {
            c = i5;
            i5 = paddingLeft;
        } else if (obj != null) {
            c = m2751b(this.f1957h, i5, iArr, min);
            i5 = paddingLeft;
        } else {
            int i6 = i5;
            i5 = m2743a(this.f1957h, paddingLeft, iArr, min);
            c = i6;
        }
        if (m2748a(this.f1950a)) {
            if (obj != null) {
                c = m2751b(this.f1950a, c, iArr, min);
            } else {
                i5 = m2743a(this.f1950a, i5, iArr, min);
            }
        }
        if (m2748a(this.f1954e)) {
            if (obj != null) {
                i5 = m2743a(this.f1954e, i5, iArr, min);
            } else {
                c = m2751b(this.f1954e, c, iArr, min);
            }
        }
        int currentContentInsetLeft = getCurrentContentInsetLeft();
        int currentContentInsetRight = getCurrentContentInsetRight();
        iArr[0] = Math.max(0, currentContentInsetLeft - i5);
        iArr[1] = Math.max(0, currentContentInsetRight - ((width - paddingRight) - c));
        i5 = Math.max(i5, currentContentInsetLeft);
        c = Math.min(c, (width - paddingRight) - currentContentInsetRight);
        if (m2748a(this.f1951b)) {
            if (obj != null) {
                c = m2751b(this.f1951b, c, iArr, min);
            } else {
                i5 = m2743a(this.f1951b, i5, iArr, min);
            }
        }
        if (!m2748a(this.f1958i)) {
            currentContentInsetLeft = c;
            currentContentInsetRight = i5;
        } else if (obj != null) {
            currentContentInsetLeft = m2751b(this.f1958i, c, iArr, min);
            currentContentInsetRight = i5;
        } else {
            currentContentInsetLeft = c;
            currentContentInsetRight = m2743a(this.f1958i, i5, iArr, min);
        }
        boolean a = m2748a(this.f1955f);
        boolean a2 = m2748a(this.f1956g);
        i5 = 0;
        if (a) {
            C0567b c0567b = (C0567b) this.f1955f.getLayoutParams();
            i5 = 0 + (c0567b.bottomMargin + (c0567b.topMargin + this.f1955f.getMeasuredHeight()));
        }
        if (a2) {
            c0567b = (C0567b) this.f1956g.getLayoutParams();
            measuredHeight = (c0567b.bottomMargin + (c0567b.topMargin + this.f1956g.getMeasuredHeight())) + i5;
        } else {
            measuredHeight = i5;
        }
        if (a || a2) {
            int paddingTop2;
            c0567b = (C0567b) (a ? this.f1955f : this.f1956g).getLayoutParams();
            C0567b c0567b2 = (C0567b) (a2 ? this.f1956g : this.f1955f).getLayoutParams();
            Object obj2 = ((!a || this.f1955f.getMeasuredWidth() <= 0) && (!a2 || this.f1956g.getMeasuredWidth() <= 0)) ? null : 1;
            switch (this.f1973x & C0410j.AppCompatTheme_windowFixedHeightMajor) {
                case 48:
                    paddingTop2 = (c0567b.topMargin + getPaddingTop()) + this.f1968s;
                    break;
                case C0410j.AppCompatTheme_panelMenuListTheme /*80*/:
                    paddingTop2 = (((height - paddingBottom) - c0567b2.bottomMargin) - this.f1969t) - measuredHeight;
                    break;
                default:
                    paddingTop2 = (((height - paddingTop) - paddingBottom) - measuredHeight) / 2;
                    if (paddingTop2 < c0567b.topMargin + this.f1968s) {
                        c = c0567b.topMargin + this.f1968s;
                    } else {
                        measuredHeight = (((height - paddingBottom) - measuredHeight) - paddingTop2) - paddingTop;
                        c = measuredHeight < c0567b.bottomMargin + this.f1969t ? Math.max(0, paddingTop2 - ((c0567b2.bottomMargin + this.f1969t) - measuredHeight)) : paddingTop2;
                    }
                    paddingTop2 = paddingTop + c;
                    break;
            }
            if (obj != null) {
                c = (obj2 != null ? this.f1966q : 0) - iArr[1];
                i5 = currentContentInsetLeft - Math.max(0, c);
                iArr[1] = Math.max(0, -c);
                if (a) {
                    c0567b = (C0567b) this.f1955f.getLayoutParams();
                    measuredWidth = i5 - this.f1955f.getMeasuredWidth();
                    currentContentInsetLeft = this.f1955f.getMeasuredHeight() + paddingTop2;
                    this.f1955f.layout(measuredWidth, paddingTop2, i5, currentContentInsetLeft);
                    paddingTop2 = currentContentInsetLeft + c0567b.bottomMargin;
                    currentContentInsetLeft = measuredWidth - this.f1967r;
                } else {
                    currentContentInsetLeft = i5;
                }
                if (a2) {
                    c0567b = (C0567b) this.f1956g.getLayoutParams();
                    measuredWidth = c0567b.topMargin + paddingTop2;
                    measuredHeight = this.f1956g.getMeasuredHeight() + measuredWidth;
                    this.f1956g.layout(i5 - this.f1956g.getMeasuredWidth(), measuredWidth, i5, measuredHeight);
                    c = c0567b.bottomMargin + measuredHeight;
                    c = i5 - this.f1967r;
                } else {
                    c = i5;
                }
                currentContentInsetLeft = obj2 != null ? Math.min(currentContentInsetLeft, c) : i5;
            } else {
                c = (obj2 != null ? this.f1966q : 0) - iArr[0];
                currentContentInsetRight += Math.max(0, c);
                iArr[0] = Math.max(0, -c);
                if (a) {
                    c0567b = (C0567b) this.f1955f.getLayoutParams();
                    i5 = this.f1955f.getMeasuredWidth() + currentContentInsetRight;
                    measuredWidth = this.f1955f.getMeasuredHeight() + paddingTop2;
                    this.f1955f.layout(currentContentInsetRight, paddingTop2, i5, measuredWidth);
                    c = c0567b.bottomMargin + measuredWidth;
                    measuredWidth = i5 + this.f1967r;
                    i5 = c;
                } else {
                    measuredWidth = currentContentInsetRight;
                    i5 = paddingTop2;
                }
                if (a2) {
                    c0567b = (C0567b) this.f1956g.getLayoutParams();
                    i5 += c0567b.topMargin;
                    paddingTop2 = this.f1956g.getMeasuredWidth() + currentContentInsetRight;
                    measuredHeight = this.f1956g.getMeasuredHeight() + i5;
                    this.f1956g.layout(currentContentInsetRight, i5, paddingTop2, measuredHeight);
                    c = c0567b.bottomMargin + measuredHeight;
                    c = this.f1967r + paddingTop2;
                } else {
                    c = currentContentInsetRight;
                }
                if (obj2 != null) {
                    currentContentInsetRight = Math.max(measuredWidth, c);
                }
            }
        }
        m2747a(this.f1939E, 3);
        int size = this.f1939E.size();
        i5 = currentContentInsetRight;
        for (measuredWidth = 0; measuredWidth < size; measuredWidth++) {
            i5 = m2743a((View) this.f1939E.get(measuredWidth), i5, iArr, min);
        }
        m2747a(this.f1939E, 5);
        currentContentInsetRight = this.f1939E.size();
        for (measuredWidth = 0; measuredWidth < currentContentInsetRight; measuredWidth++) {
            currentContentInsetLeft = m2751b((View) this.f1939E.get(measuredWidth), currentContentInsetLeft, iArr, min);
        }
        m2747a(this.f1939E, 1);
        measuredWidth = m2744a(this.f1939E, iArr);
        c = ((((width - paddingLeft) - paddingRight) / 2) + paddingLeft) - (measuredWidth / 2);
        measuredWidth += c;
        if (c < i5) {
            c = i5;
        } else if (measuredWidth > currentContentInsetLeft) {
            c -= measuredWidth - currentContentInsetLeft;
        }
        paddingLeft = this.f1939E.size();
        measuredWidth = c;
        for (i5 = 0; i5 < paddingLeft; i5++) {
            measuredWidth = m2743a((View) this.f1939E.get(i5), measuredWidth, iArr, min);
        }
        this.f1939E.clear();
    }

    protected void onMeasure(int i, int i2) {
        int i3;
        int i4;
        int max;
        int i5 = 0;
        int i6 = 0;
        int[] iArr = this.f1941G;
        if (bc.m3035a(this)) {
            i3 = 0;
            i4 = 1;
        } else {
            i3 = 1;
            i4 = 0;
        }
        int i7 = 0;
        if (m2748a(this.f1957h)) {
            m2745a(this.f1957h, i, 0, i2, 0, this.f1965p);
            i7 = this.f1957h.getMeasuredWidth() + m2750b(this.f1957h);
            max = Math.max(0, this.f1957h.getMeasuredHeight() + m2752c(this.f1957h));
            i6 = View.combineMeasuredStates(0, this.f1957h.getMeasuredState());
            i5 = max;
        }
        if (m2748a(this.f1950a)) {
            m2745a(this.f1950a, i, 0, i2, 0, this.f1965p);
            i7 = this.f1950a.getMeasuredWidth() + m2750b(this.f1950a);
            i5 = Math.max(i5, this.f1950a.getMeasuredHeight() + m2752c(this.f1950a));
            i6 = View.combineMeasuredStates(i6, this.f1950a.getMeasuredState());
        }
        int currentContentInsetStart = getCurrentContentInsetStart();
        int max2 = 0 + Math.max(currentContentInsetStart, i7);
        iArr[i4] = Math.max(0, currentContentInsetStart - i7);
        i7 = 0;
        if (m2748a(this.f1954e)) {
            m2745a(this.f1954e, i, max2, i2, 0, this.f1965p);
            i7 = this.f1954e.getMeasuredWidth() + m2750b(this.f1954e);
            i5 = Math.max(i5, this.f1954e.getMeasuredHeight() + m2752c(this.f1954e));
            i6 = View.combineMeasuredStates(i6, this.f1954e.getMeasuredState());
        }
        currentContentInsetStart = getCurrentContentInsetEnd();
        max2 += Math.max(currentContentInsetStart, i7);
        iArr[i3] = Math.max(0, currentContentInsetStart - i7);
        if (m2748a(this.f1951b)) {
            max2 += m2742a(this.f1951b, i, max2, i2, 0, iArr);
            i5 = Math.max(i5, this.f1951b.getMeasuredHeight() + m2752c(this.f1951b));
            i6 = View.combineMeasuredStates(i6, this.f1951b.getMeasuredState());
        }
        if (m2748a(this.f1958i)) {
            max2 += m2742a(this.f1958i, i, max2, i2, 0, iArr);
            i5 = Math.max(i5, this.f1958i.getMeasuredHeight() + m2752c(this.f1958i));
            i6 = View.combineMeasuredStates(i6, this.f1958i.getMeasuredState());
        }
        i4 = getChildCount();
        i3 = 0;
        int i8 = i5;
        i5 = i6;
        while (i3 < i4) {
            View childAt = getChildAt(i3);
            if (((C0567b) childAt.getLayoutParams()).f1932b != 0) {
                i7 = i5;
                currentContentInsetStart = i8;
            } else if (m2748a(childAt)) {
                max2 += m2742a(childAt, i, max2, i2, 0, iArr);
                max = Math.max(i8, childAt.getMeasuredHeight() + m2752c(childAt));
                i7 = View.combineMeasuredStates(i5, childAt.getMeasuredState());
                currentContentInsetStart = max;
            } else {
                i7 = i5;
                currentContentInsetStart = i8;
            }
            i3++;
            i5 = i7;
            i8 = currentContentInsetStart;
        }
        currentContentInsetStart = 0;
        i7 = 0;
        i6 = this.f1968s + this.f1969t;
        max = this.f1966q + this.f1967r;
        if (m2748a(this.f1955f)) {
            m2742a(this.f1955f, i, max2 + max, i2, i6, iArr);
            currentContentInsetStart = m2750b(this.f1955f) + this.f1955f.getMeasuredWidth();
            i7 = this.f1955f.getMeasuredHeight() + m2752c(this.f1955f);
            i5 = View.combineMeasuredStates(i5, this.f1955f.getMeasuredState());
        }
        if (m2748a(this.f1956g)) {
            currentContentInsetStart = Math.max(currentContentInsetStart, m2742a(this.f1956g, i, max2 + max, i2, i6 + i7, iArr));
            i7 += this.f1956g.getMeasuredHeight() + m2752c(this.f1956g);
            i5 = View.combineMeasuredStates(i5, this.f1956g.getMeasuredState());
        }
        currentContentInsetStart += max2;
        i7 = Math.max(i8, i7) + (getPaddingTop() + getPaddingBottom());
        currentContentInsetStart = View.resolveSizeAndState(Math.max(currentContentInsetStart + (getPaddingLeft() + getPaddingRight()), getSuggestedMinimumWidth()), i, -16777216 & i5);
        i7 = View.resolveSizeAndState(Math.max(i7, getSuggestedMinimumHeight()), i2, i5 << 16);
        if (m2759r()) {
            i7 = 0;
        }
        setMeasuredDimension(currentContentInsetStart, i7);
    }

    protected void onRestoreInstanceState(Parcelable parcelable) {
        if (parcelable instanceof C0570d) {
            C0570d c0570d = (C0570d) parcelable;
            super.onRestoreInstanceState(c0570d.m1179a());
            Menu d = this.f1954e != null ? this.f1954e.m2661d() : null;
            if (!(c0570d.f1933b == 0 || this.f1945K == null || d == null)) {
                MenuItem findItem = d.findItem(c0570d.f1933b);
                if (findItem != null) {
                    findItem.expandActionView();
                }
            }
            if (c0570d.f1934c) {
                m2758q();
                return;
            }
            return;
        }
        super.onRestoreInstanceState(parcelable);
    }

    public void onRtlPropertiesChanged(int i) {
        boolean z = true;
        if (VERSION.SDK_INT >= 17) {
            super.onRtlPropertiesChanged(i);
        }
        m2760s();
        ao aoVar = this.f1970u;
        if (i != 1) {
            z = false;
        }
        aoVar.m2904a(z);
    }

    protected Parcelable onSaveInstanceState() {
        Parcelable c0570d = new C0570d(super.onSaveInstanceState());
        if (!(this.f1945K == null || this.f1945K.f1930b == null)) {
            c0570d.f1933b = this.f1945K.f1930b.getItemId();
        }
        c0570d.f1934c = m2769b();
        return c0570d;
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0) {
            this.f1937C = false;
        }
        if (!this.f1937C) {
            boolean onTouchEvent = super.onTouchEvent(motionEvent);
            if (actionMasked == 0 && !onTouchEvent) {
                this.f1937C = true;
            }
        }
        if (actionMasked == 1 || actionMasked == 3) {
            this.f1937C = false;
        }
        return true;
    }

    public void setCollapsible(boolean z) {
        this.f1948N = z;
        requestLayout();
    }

    public void setContentInsetEndWithActions(int i) {
        if (i < 0) {
            i = Integer.MIN_VALUE;
        }
        if (i != this.f1972w) {
            this.f1972w = i;
            if (getNavigationIcon() != null) {
                requestLayout();
            }
        }
    }

    public void setContentInsetStartWithNavigation(int i) {
        if (i < 0) {
            i = Integer.MIN_VALUE;
        }
        if (i != this.f1971v) {
            this.f1971v = i;
            if (getNavigationIcon() != null) {
                requestLayout();
            }
        }
    }

    public void setLogo(int i) {
        setLogo(C0485b.m2214b(getContext(), i));
    }

    public void setLogo(Drawable drawable) {
        if (drawable != null) {
            m2754m();
            if (!m2753d(this.f1958i)) {
                m2746a(this.f1958i, true);
            }
        } else if (this.f1958i != null && m2753d(this.f1958i)) {
            removeView(this.f1958i);
            this.f1940F.remove(this.f1958i);
        }
        if (this.f1958i != null) {
            this.f1958i.setImageDrawable(drawable);
        }
    }

    public void setLogoDescription(int i) {
        setLogoDescription(getContext().getText(i));
    }

    public void setLogoDescription(CharSequence charSequence) {
        if (!TextUtils.isEmpty(charSequence)) {
            m2754m();
        }
        if (this.f1958i != null) {
            this.f1958i.setContentDescription(charSequence);
        }
    }

    public void setNavigationContentDescription(int i) {
        setNavigationContentDescription(i != 0 ? getContext().getText(i) : null);
    }

    public void setNavigationContentDescription(CharSequence charSequence) {
        if (!TextUtils.isEmpty(charSequence)) {
            m2757p();
        }
        if (this.f1957h != null) {
            this.f1957h.setContentDescription(charSequence);
        }
    }

    public void setNavigationIcon(int i) {
        setNavigationIcon(C0485b.m2214b(getContext(), i));
    }

    public void setNavigationIcon(Drawable drawable) {
        if (drawable != null) {
            m2757p();
            if (!m2753d(this.f1957h)) {
                m2746a(this.f1957h, true);
            }
        } else if (this.f1957h != null && m2753d(this.f1957h)) {
            removeView(this.f1957h);
            this.f1940F.remove(this.f1957h);
        }
        if (this.f1957h != null) {
            this.f1957h.setImageDrawable(drawable);
        }
    }

    public void setNavigationOnClickListener(OnClickListener onClickListener) {
        m2757p();
        this.f1957h.setOnClickListener(onClickListener);
    }

    public void setOnMenuItemClickListener(C0568c c0568c) {
        this.f1953d = c0568c;
    }

    public void setOverflowIcon(Drawable drawable) {
        m2755n();
        this.f1954e.setOverflowIcon(drawable);
    }

    public void setPopupTheme(int i) {
        if (this.f1962m != i) {
            this.f1962m = i;
            if (i == 0) {
                this.f1961l = getContext();
            } else {
                this.f1961l = new ContextThemeWrapper(getContext(), i);
            }
        }
    }

    public void setSubtitle(int i) {
        setSubtitle(getContext().getText(i));
    }

    public void setSubtitle(CharSequence charSequence) {
        if (!TextUtils.isEmpty(charSequence)) {
            if (this.f1956g == null) {
                Context context = getContext();
                this.f1956g = new aa(context);
                this.f1956g.setSingleLine();
                this.f1956g.setEllipsize(TruncateAt.END);
                if (this.f1964o != 0) {
                    this.f1956g.setTextAppearance(context, this.f1964o);
                }
                if (this.f1936B != 0) {
                    this.f1956g.setTextColor(this.f1936B);
                }
            }
            if (!m2753d(this.f1956g)) {
                m2746a(this.f1956g, true);
            }
        } else if (this.f1956g != null && m2753d(this.f1956g)) {
            removeView(this.f1956g);
            this.f1940F.remove(this.f1956g);
        }
        if (this.f1956g != null) {
            this.f1956g.setText(charSequence);
        }
        this.f1975z = charSequence;
    }

    public void setSubtitleTextColor(int i) {
        this.f1936B = i;
        if (this.f1956g != null) {
            this.f1956g.setTextColor(i);
        }
    }

    public void setTitle(int i) {
        setTitle(getContext().getText(i));
    }

    public void setTitle(CharSequence charSequence) {
        if (!TextUtils.isEmpty(charSequence)) {
            if (this.f1955f == null) {
                Context context = getContext();
                this.f1955f = new aa(context);
                this.f1955f.setSingleLine();
                this.f1955f.setEllipsize(TruncateAt.END);
                if (this.f1963n != 0) {
                    this.f1955f.setTextAppearance(context, this.f1963n);
                }
                if (this.f1935A != 0) {
                    this.f1955f.setTextColor(this.f1935A);
                }
            }
            if (!m2753d(this.f1955f)) {
                m2746a(this.f1955f, true);
            }
        } else if (this.f1955f != null && m2753d(this.f1955f)) {
            removeView(this.f1955f);
            this.f1940F.remove(this.f1955f);
        }
        if (this.f1955f != null) {
            this.f1955f.setText(charSequence);
        }
        this.f1974y = charSequence;
    }

    public void setTitleMarginBottom(int i) {
        this.f1969t = i;
        requestLayout();
    }

    public void setTitleMarginEnd(int i) {
        this.f1967r = i;
        requestLayout();
    }

    public void setTitleMarginStart(int i) {
        this.f1966q = i;
        requestLayout();
    }

    public void setTitleMarginTop(int i) {
        this.f1968s = i;
        requestLayout();
    }

    public void setTitleTextColor(int i) {
        this.f1935A = i;
        if (this.f1955f != null) {
            this.f1955f.setTextColor(i);
        }
    }
}
