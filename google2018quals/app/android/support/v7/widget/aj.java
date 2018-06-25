package android.support.v7.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.support.v4.p017h.C0315p;
import android.support.v4.widget.C0397i;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.p020a.C0411a.C0410j;
import android.support.v7.view.menu.C0515s;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.PopupWindow.OnDismissListener;
import java.lang.reflect.Method;

public class aj implements C0515s {
    private static Method f2021a;
    private static Method f2022b;
    private static Method f2023h;
    private Drawable f2024A;
    private OnItemClickListener f2025B;
    private OnItemSelectedListener f2026C;
    private final C0580d f2027D;
    private final C0579c f2028E;
    private final C0577a f2029F;
    private Runnable f2030G;
    private final Rect f2031H;
    private Rect f2032I;
    private boolean f2033J;
    af f2034c;
    int f2035d;
    final C0581e f2036e;
    final Handler f2037f;
    PopupWindow f2038g;
    private Context f2039i;
    private ListAdapter f2040j;
    private int f2041k;
    private int f2042l;
    private int f2043m;
    private int f2044n;
    private int f2045o;
    private boolean f2046p;
    private boolean f2047q;
    private boolean f2048r;
    private boolean f2049s;
    private int f2050t;
    private boolean f2051u;
    private boolean f2052v;
    private View f2053w;
    private int f2054x;
    private DataSetObserver f2055y;
    private View f2056z;

    class C05751 implements Runnable {
        final /* synthetic */ aj f2014a;

        C05751(aj ajVar) {
            this.f2014a = ajVar;
        }

        public void run() {
            View i = this.f2014a.m2886i();
            if (i != null && i.getWindowToken() != null) {
                this.f2014a.mo412a();
            }
        }
    }

    class C05762 implements OnItemSelectedListener {
        final /* synthetic */ aj f2015a;

        C05762(aj ajVar) {
            this.f2015a = ajVar;
        }

        public void onItemSelected(AdapterView<?> adapterView, View view, int i, long j) {
            if (i != -1) {
                af afVar = this.f2015a.f2034c;
                if (afVar != null) {
                    afVar.setListSelectionHidden(false);
                }
            }
        }

        public void onNothingSelected(AdapterView<?> adapterView) {
        }
    }

    private class C0577a implements Runnable {
        final /* synthetic */ aj f2016a;

        C0577a(aj ajVar) {
            this.f2016a = ajVar;
        }

        public void run() {
            this.f2016a.m2891m();
        }
    }

    private class C0578b extends DataSetObserver {
        final /* synthetic */ aj f2017a;

        C0578b(aj ajVar) {
            this.f2017a = ajVar;
        }

        public void onChanged() {
            if (this.f2017a.mo422d()) {
                this.f2017a.mo412a();
            }
        }

        public void onInvalidated() {
            this.f2017a.mo419c();
        }
    }

    private class C0579c implements OnScrollListener {
        final /* synthetic */ aj f2018a;

        C0579c(aj ajVar) {
            this.f2018a = ajVar;
        }

        public void onScroll(AbsListView absListView, int i, int i2, int i3) {
        }

        public void onScrollStateChanged(AbsListView absListView, int i) {
            if (i == 1 && !this.f2018a.m2892n() && this.f2018a.f2038g.getContentView() != null) {
                this.f2018a.f2037f.removeCallbacks(this.f2018a.f2036e);
                this.f2018a.f2036e.run();
            }
        }
    }

    private class C0580d implements OnTouchListener {
        final /* synthetic */ aj f2019a;

        C0580d(aj ajVar) {
            this.f2019a = ajVar;
        }

        public boolean onTouch(View view, MotionEvent motionEvent) {
            int action = motionEvent.getAction();
            int x = (int) motionEvent.getX();
            int y = (int) motionEvent.getY();
            if (action == 0 && this.f2019a.f2038g != null && this.f2019a.f2038g.isShowing() && x >= 0 && x < this.f2019a.f2038g.getWidth() && y >= 0 && y < this.f2019a.f2038g.getHeight()) {
                this.f2019a.f2037f.postDelayed(this.f2019a.f2036e, 250);
            } else if (action == 1) {
                this.f2019a.f2037f.removeCallbacks(this.f2019a.f2036e);
            }
            return false;
        }
    }

    private class C0581e implements Runnable {
        final /* synthetic */ aj f2020a;

        C0581e(aj ajVar) {
            this.f2020a = ajVar;
        }

        public void run() {
            if (this.f2020a.f2034c != null && C0315p.m1398m(this.f2020a.f2034c) && this.f2020a.f2034c.getCount() > this.f2020a.f2034c.getChildCount() && this.f2020a.f2034c.getChildCount() <= this.f2020a.f2035d) {
                this.f2020a.f2038g.setInputMethodMode(2);
                this.f2020a.mo412a();
            }
        }
    }

    static {
        try {
            f2021a = PopupWindow.class.getDeclaredMethod("setClipToScreenEnabled", new Class[]{Boolean.TYPE});
        } catch (NoSuchMethodException e) {
            Log.i("ListPopupWindow", "Could not find method setClipToScreenEnabled() on PopupWindow. Oh well.");
        }
        try {
            f2022b = PopupWindow.class.getDeclaredMethod("getMaxAvailableHeight", new Class[]{View.class, Integer.TYPE, Boolean.TYPE});
        } catch (NoSuchMethodException e2) {
            Log.i("ListPopupWindow", "Could not find method getMaxAvailableHeight(View, int, boolean) on PopupWindow. Oh well.");
        }
        try {
            f2023h = PopupWindow.class.getDeclaredMethod("setEpicenterBounds", new Class[]{Rect.class});
        } catch (NoSuchMethodException e3) {
            Log.i("ListPopupWindow", "Could not find method setEpicenterBounds(Rect) on PopupWindow. Oh well.");
        }
    }

    public aj(Context context) {
        this(context, null, C0401a.listPopupWindowStyle);
    }

    public aj(Context context, AttributeSet attributeSet, int i) {
        this(context, attributeSet, i, 0);
    }

    public aj(Context context, AttributeSet attributeSet, int i, int i2) {
        this.f2041k = -2;
        this.f2042l = -2;
        this.f2045o = 1002;
        this.f2047q = true;
        this.f2050t = 0;
        this.f2051u = false;
        this.f2052v = false;
        this.f2035d = Integer.MAX_VALUE;
        this.f2054x = 0;
        this.f2036e = new C0581e(this);
        this.f2027D = new C0580d(this);
        this.f2028E = new C0579c(this);
        this.f2029F = new C0577a(this);
        this.f2031H = new Rect();
        this.f2039i = context;
        this.f2037f = new Handler(context.getMainLooper());
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, C0410j.ListPopupWindow, i, i2);
        this.f2043m = obtainStyledAttributes.getDimensionPixelOffset(C0410j.ListPopupWindow_android_dropDownHorizontalOffset, 0);
        this.f2044n = obtainStyledAttributes.getDimensionPixelOffset(C0410j.ListPopupWindow_android_dropDownVerticalOffset, 0);
        if (this.f2044n != 0) {
            this.f2046p = true;
        }
        obtainStyledAttributes.recycle();
        this.f2038g = new C0629r(context, attributeSet, i, i2);
        this.f2038g.setInputMethodMode(1);
    }

    private int m2859a(View view, int i, boolean z) {
        if (f2022b != null) {
            try {
                return ((Integer) f2022b.invoke(this.f2038g, new Object[]{view, Integer.valueOf(i), Boolean.valueOf(z)})).intValue();
            } catch (Exception e) {
                Log.i("ListPopupWindow", "Could not call getMaxAvailableHeightMethod(View, int, boolean) on PopupWindow. Using the public version.");
            }
        }
        return this.f2038g.getMaxAvailableHeight(view, i);
    }

    private void mo548b() {
        if (this.f2053w != null) {
            ViewParent parent = this.f2053w.getParent();
            if (parent instanceof ViewGroup) {
                ((ViewGroup) parent).removeView(this.f2053w);
            }
        }
    }

    private void mo489c(boolean z) {
        if (f2021a != null) {
            try {
                f2021a.invoke(this.f2038g, new Object[]{Boolean.valueOf(z)});
            } catch (Exception e) {
                Log.i("ListPopupWindow", "Could not call setClipToScreenEnabled() on PopupWindow. Oh well.");
            }
        }
    }

    private int mo549f() {
        int i;
        int i2;
        int i3;
        int i4;
        boolean z = true;
        LayoutParams layoutParams;
        View view;
        if (this.f2034c == null) {
            Context context = this.f2039i;
            this.f2030G = new C05751(this);
            this.f2034c = mo488a(context, !this.f2033J);
            if (this.f2024A != null) {
                this.f2034c.setSelector(this.f2024A);
            }
            this.f2034c.setAdapter(this.f2040j);
            this.f2034c.setOnItemClickListener(this.f2025B);
            this.f2034c.setFocusable(true);
            this.f2034c.setFocusableInTouchMode(true);
            this.f2034c.setOnItemSelectedListener(new C05762(this));
            this.f2034c.setOnScrollListener(this.f2028E);
            if (this.f2026C != null) {
                this.f2034c.setOnItemSelectedListener(this.f2026C);
            }
            View view2 = this.f2034c;
            View view3 = this.f2053w;
            if (view3 != null) {
                View linearLayout = new LinearLayout(context);
                linearLayout.setOrientation(1);
                ViewGroup.LayoutParams layoutParams2 = new LayoutParams(-1, 0, 1.0f);
                switch (this.f2054x) {
                    case 0:
                        linearLayout.addView(view3);
                        linearLayout.addView(view2, layoutParams2);
                        break;
                    case 1:
                        linearLayout.addView(view2, layoutParams2);
                        linearLayout.addView(view3);
                        break;
                    default:
                        Log.e("ListPopupWindow", "Invalid hint position " + this.f2054x);
                        break;
                }
                if (this.f2042l >= 0) {
                    i = this.f2042l;
                    i2 = Integer.MIN_VALUE;
                } else {
                    i2 = 0;
                    i = 0;
                }
                view3.measure(MeasureSpec.makeMeasureSpec(i, i2), 0);
                layoutParams = (LayoutParams) view3.getLayoutParams();
                i2 = layoutParams.bottomMargin + (view3.getMeasuredHeight() + layoutParams.topMargin);
                view = linearLayout;
            } else {
                view = view2;
                i2 = 0;
            }
            this.f2038g.setContentView(view);
            i3 = i2;
        } else {
            ViewGroup viewGroup = (ViewGroup) this.f2038g.getContentView();
            view = this.f2053w;
            if (view != null) {
                layoutParams = (LayoutParams) view.getLayoutParams();
                i3 = layoutParams.bottomMargin + (view.getMeasuredHeight() + layoutParams.topMargin);
            } else {
                i3 = 0;
            }
        }
        Drawable background = this.f2038g.getBackground();
        if (background != null) {
            background.getPadding(this.f2031H);
            i2 = this.f2031H.top + this.f2031H.bottom;
            if (this.f2046p) {
                i4 = i2;
            } else {
                this.f2044n = -this.f2031H.top;
                i4 = i2;
            }
        } else {
            this.f2031H.setEmpty();
            i4 = 0;
        }
        if (this.f2038g.getInputMethodMode() != 2) {
            z = false;
        }
        i = m2859a(m2886i(), this.f2044n, z);
        if (this.f2051u || this.f2041k == -1) {
            return i + i4;
        }
        int makeMeasureSpec;
        switch (this.f2042l) {
            case -2:
                makeMeasureSpec = MeasureSpec.makeMeasureSpec(this.f2039i.getResources().getDisplayMetrics().widthPixels - (this.f2031H.left + this.f2031H.right), Integer.MIN_VALUE);
                break;
            case -1:
                makeMeasureSpec = MeasureSpec.makeMeasureSpec(this.f2039i.getResources().getDisplayMetrics().widthPixels - (this.f2031H.left + this.f2031H.right), 1073741824);
                break;
            default:
                makeMeasureSpec = MeasureSpec.makeMeasureSpec(this.f2042l, 1073741824);
                break;
        }
        i2 = this.f2034c.m2846a(makeMeasureSpec, 0, -1, i - i3, -1);
        if (i2 > 0) {
            i3 += (this.f2034c.getPaddingTop() + this.f2034c.getPaddingBottom()) + i4;
        }
        return i2 + i3;
    }

    af mo488a(Context context, boolean z) {
        return new af(context, z);
    }

    public void mo412a() {
        boolean z = true;
        boolean z2 = false;
        int i = -1;
        int f = mo549f();
        boolean n = m2892n();
        C0397i.m1838a(this.f2038g, this.f2045o);
        PopupWindow popupWindow;
        if (!this.f2038g.isShowing()) {
            int width = this.f2042l == -1 ? -1 : this.f2042l == -2 ? m2886i().getWidth() : this.f2042l;
            if (this.f2041k == -1) {
                f = -1;
            } else if (this.f2041k != -2) {
                f = this.f2041k;
            }
            this.f2038g.setWidth(width);
            this.f2038g.setHeight(f);
            mo489c(true);
            popupWindow = this.f2038g;
            if (this.f2052v || this.f2051u) {
                z = false;
            }
            popupWindow.setOutsideTouchable(z);
            this.f2038g.setTouchInterceptor(this.f2027D);
            if (this.f2049s) {
                C0397i.m1840a(this.f2038g, this.f2048r);
            }
            if (f2023h != null) {
                try {
                    f2023h.invoke(this.f2038g, new Object[]{this.f2032I});
                } catch (Throwable e) {
                    Log.e("ListPopupWindow", "Could not invoke setEpicenterBounds on PopupWindow", e);
                }
            }
            C0397i.m1839a(this.f2038g, m2886i(), this.f2043m, this.f2044n, this.f2050t);
            this.f2034c.setSelection(-1);
            if (!this.f2033J || this.f2034c.isInTouchMode()) {
                m2891m();
            }
            if (!this.f2033J) {
                this.f2037f.post(this.f2029F);
            }
        } else if (C0315p.m1398m(m2886i())) {
            int i2;
            int width2 = this.f2042l == -1 ? -1 : this.f2042l == -2 ? m2886i().getWidth() : this.f2042l;
            if (this.f2041k == -1) {
                if (!n) {
                    f = -1;
                }
                if (n) {
                    this.f2038g.setWidth(this.f2042l == -1 ? -1 : 0);
                    this.f2038g.setHeight(0);
                    i2 = f;
                } else {
                    this.f2038g.setWidth(this.f2042l == -1 ? -1 : 0);
                    this.f2038g.setHeight(-1);
                    i2 = f;
                }
            } else {
                i2 = this.f2041k == -2 ? f : this.f2041k;
            }
            popupWindow = this.f2038g;
            if (!(this.f2052v || this.f2051u)) {
                z2 = true;
            }
            popupWindow.setOutsideTouchable(z2);
            popupWindow = this.f2038g;
            View i3 = m2886i();
            f = this.f2043m;
            int i4 = this.f2044n;
            if (width2 < 0) {
                width2 = -1;
            }
            if (i2 >= 0) {
                i = i2;
            }
            popupWindow.update(i3, f, i4, width2, i);
        }
    }

    public void m2865a(int i) {
        this.f2054x = i;
    }

    public void m2866a(Rect rect) {
        this.f2032I = rect;
    }

    public void m2867a(Drawable drawable) {
        this.f2038g.setBackgroundDrawable(drawable);
    }

    public void m2868a(OnItemClickListener onItemClickListener) {
        this.f2025B = onItemClickListener;
    }

    public void mo547a(ListAdapter listAdapter) {
        if (this.f2055y == null) {
            this.f2055y = new C0578b(this);
        } else if (this.f2040j != null) {
            this.f2040j.unregisterDataSetObserver(this.f2055y);
        }
        this.f2040j = listAdapter;
        if (this.f2040j != null) {
            listAdapter.registerDataSetObserver(this.f2055y);
        }
        if (this.f2034c != null) {
            this.f2034c.setAdapter(this.f2040j);
        }
    }

    public void m2870a(OnDismissListener onDismissListener) {
        this.f2038g.setOnDismissListener(onDismissListener);
    }

    public void m2871a(boolean z) {
        this.f2033J = z;
        this.f2038g.setFocusable(z);
    }

    public void m2872b(int i) {
        this.f2038g.setAnimationStyle(i);
    }

    public void m2873b(View view) {
        this.f2056z = view;
    }

    public void m2874b(boolean z) {
        this.f2049s = true;
        this.f2048r = z;
    }

    public void mo419c() {
        this.f2038g.dismiss();
        mo548b();
        this.f2038g.setContentView(null);
        this.f2034c = null;
        this.f2037f.removeCallbacks(this.f2036e);
    }

    public void m2876c(int i) {
        this.f2043m = i;
    }

    public void m2877d(int i) {
        this.f2044n = i;
        this.f2046p = true;
    }

    public boolean mo422d() {
        return this.f2038g.isShowing();
    }

    public ListView mo423e() {
        return this.f2034c;
    }

    public void m2880e(int i) {
        this.f2050t = i;
    }

    public void m2881f(int i) {
        this.f2042l = i;
    }

    public void m2882g(int i) {
        Drawable background = this.f2038g.getBackground();
        if (background != null) {
            background.getPadding(this.f2031H);
            this.f2042l = (this.f2031H.left + this.f2031H.right) + i;
            return;
        }
        m2881f(i);
    }

    public boolean m2883g() {
        return this.f2033J;
    }

    public Drawable m2884h() {
        return this.f2038g.getBackground();
    }

    public void m2885h(int i) {
        this.f2038g.setInputMethodMode(i);
    }

    public View m2886i() {
        return this.f2056z;
    }

    public void m2887i(int i) {
        af afVar = this.f2034c;
        if (mo422d() && afVar != null) {
            afVar.setListSelectionHidden(false);
            afVar.setSelection(i);
            if (afVar.getChoiceMode() != 0) {
                afVar.setItemChecked(i, true);
            }
        }
    }

    public int m2888j() {
        return this.f2043m;
    }

    public int m2889k() {
        return !this.f2046p ? 0 : this.f2044n;
    }

    public int m2890l() {
        return this.f2042l;
    }

    public void m2891m() {
        af afVar = this.f2034c;
        if (afVar != null) {
            afVar.setListSelectionHidden(true);
            afVar.requestLayout();
        }
    }

    public boolean m2892n() {
        return this.f2038g.getInputMethodMode() == 2;
    }
}
