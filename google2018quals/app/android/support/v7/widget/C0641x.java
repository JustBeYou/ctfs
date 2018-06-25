package android.support.v7.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.PorterDuff.Mode;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.support.v4.p017h.C0303o;
import android.support.v4.p017h.C0315p;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.p020a.C0411a.C0407g;
import android.support.v7.p020a.C0411a.C0410j;
import android.support.v7.p021b.p022a.C0485b;
import android.support.v7.view.C0490d;
import android.support.v7.view.menu.C0515s;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;
import android.widget.ListAdapter;
import android.widget.PopupWindow.OnDismissListener;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.ThemedSpinnerAdapter;

public class C0641x extends Spinner implements C0303o {
    private static final int[] f2308a = new int[]{16843505};
    private final C0614g f2309b;
    private final Context f2310c;
    private ah f2311d;
    private SpinnerAdapter f2312e;
    private final boolean f2313f;
    private C0640b f2314g;
    private int f2315h;
    private final Rect f2316i;

    private static class C0636a implements ListAdapter, SpinnerAdapter {
        private SpinnerAdapter f2297a;
        private ListAdapter f2298b;

        public C0636a(SpinnerAdapter spinnerAdapter, Theme theme) {
            this.f2297a = spinnerAdapter;
            if (spinnerAdapter instanceof ListAdapter) {
                this.f2298b = (ListAdapter) spinnerAdapter;
            }
            if (theme == null) {
                return;
            }
            if (VERSION.SDK_INT >= 23 && (spinnerAdapter instanceof ThemedSpinnerAdapter)) {
                ThemedSpinnerAdapter themedSpinnerAdapter = (ThemedSpinnerAdapter) spinnerAdapter;
                if (themedSpinnerAdapter.getDropDownViewTheme() != theme) {
                    themedSpinnerAdapter.setDropDownViewTheme(theme);
                }
            } else if (spinnerAdapter instanceof as) {
                as asVar = (as) spinnerAdapter;
                if (asVar.m2946a() == null) {
                    asVar.m2947a(theme);
                }
            }
        }

        public boolean areAllItemsEnabled() {
            ListAdapter listAdapter = this.f2298b;
            return listAdapter != null ? listAdapter.areAllItemsEnabled() : true;
        }

        public int getCount() {
            return this.f2297a == null ? 0 : this.f2297a.getCount();
        }

        public View getDropDownView(int i, View view, ViewGroup viewGroup) {
            return this.f2297a == null ? null : this.f2297a.getDropDownView(i, view, viewGroup);
        }

        public Object getItem(int i) {
            return this.f2297a == null ? null : this.f2297a.getItem(i);
        }

        public long getItemId(int i) {
            return this.f2297a == null ? -1 : this.f2297a.getItemId(i);
        }

        public int getItemViewType(int i) {
            return 0;
        }

        public View getView(int i, View view, ViewGroup viewGroup) {
            return getDropDownView(i, view, viewGroup);
        }

        public int getViewTypeCount() {
            return 1;
        }

        public boolean hasStableIds() {
            return this.f2297a != null && this.f2297a.hasStableIds();
        }

        public boolean isEmpty() {
            return getCount() == 0;
        }

        public boolean isEnabled(int i) {
            ListAdapter listAdapter = this.f2298b;
            return listAdapter != null ? listAdapter.isEnabled(i) : true;
        }

        public void registerDataSetObserver(DataSetObserver dataSetObserver) {
            if (this.f2297a != null) {
                this.f2297a.registerDataSetObserver(dataSetObserver);
            }
        }

        public void unregisterDataSetObserver(DataSetObserver dataSetObserver) {
            if (this.f2297a != null) {
                this.f2297a.unregisterDataSetObserver(dataSetObserver);
            }
        }
    }

    private class C0640b extends aj {
        ListAdapter f2304a;
        final /* synthetic */ C0641x f2305b;
        private CharSequence f2306h;
        private final Rect f2307i = new Rect();

        class C06382 implements OnGlobalLayoutListener {
            final /* synthetic */ C0640b f2301a;

            C06382(C0640b c0640b) {
                this.f2301a = c0640b;
            }

            public void onGlobalLayout() {
                if (this.f2301a.m3180a(this.f2301a.f2305b)) {
                    this.f2301a.mo549f();
                    super.mo412a();
                    return;
                }
                this.f2301a.mo419c();
            }
        }

        public C0640b(final C0641x c0641x, Context context, AttributeSet attributeSet, int i) {
            this.f2305b = c0641x;
            super(context, attributeSet, i);
            m2873b((View) c0641x);
            m2871a(true);
            m2865a(0);
            m2868a(new OnItemClickListener(this) {
                final /* synthetic */ C0640b f2300b;

                public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                    this.f2300b.f2305b.setSelection(i);
                    if (this.f2300b.f2305b.getOnItemClickListener() != null) {
                        this.f2300b.f2305b.performItemClick(view, i, this.f2300b.f2304a.getItemId(i));
                    }
                    this.f2300b.mo419c();
                }
            });
        }

        public void mo412a() {
            boolean d = mo422d();
            mo549f();
            m2885h(2);
            super.mo412a();
            mo423e().setChoiceMode(1);
            m2887i(this.f2305b.getSelectedItemPosition());
            if (!d) {
                ViewTreeObserver viewTreeObserver = this.f2305b.getViewTreeObserver();
                if (viewTreeObserver != null) {
                    final OnGlobalLayoutListener c06382 = new C06382(this);
                    viewTreeObserver.addOnGlobalLayoutListener(c06382);
                    m2870a(new OnDismissListener(this) {
                        final /* synthetic */ C0640b f2303b;

                        public void onDismiss() {
                            ViewTreeObserver viewTreeObserver = this.f2303b.f2305b.getViewTreeObserver();
                            if (viewTreeObserver != null) {
                                viewTreeObserver.removeGlobalOnLayoutListener(c06382);
                            }
                        }
                    });
                }
            }
        }

        public void mo547a(ListAdapter listAdapter) {
            super.mo547a(listAdapter);
            this.f2304a = listAdapter;
        }

        public void m3179a(CharSequence charSequence) {
            this.f2306h = charSequence;
        }

        boolean m3180a(View view) {
            return C0315p.m1398m(view) && view.getGlobalVisibleRect(this.f2307i);
        }

        public CharSequence mo548b() {
            return this.f2306h;
        }

        void mo549f() {
            int i;
            Drawable h = m2884h();
            if (h != null) {
                h.getPadding(this.f2305b.f2316i);
                i = bc.m3035a(this.f2305b) ? this.f2305b.f2316i.right : -this.f2305b.f2316i.left;
            } else {
                Rect b = this.f2305b.f2316i;
                this.f2305b.f2316i.right = 0;
                b.left = 0;
                i = 0;
            }
            int paddingLeft = this.f2305b.getPaddingLeft();
            int paddingRight = this.f2305b.getPaddingRight();
            int width = this.f2305b.getWidth();
            if (this.f2305b.f2315h == -2) {
                int a = this.f2305b.m3186a((SpinnerAdapter) this.f2304a, m2884h());
                int i2 = (this.f2305b.getContext().getResources().getDisplayMetrics().widthPixels - this.f2305b.f2316i.left) - this.f2305b.f2316i.right;
                if (a <= i2) {
                    i2 = a;
                }
                m2882g(Math.max(i2, (width - paddingLeft) - paddingRight));
            } else if (this.f2305b.f2315h == -1) {
                m2882g((width - paddingLeft) - paddingRight);
            } else {
                m2882g(this.f2305b.f2315h);
            }
            m2876c(bc.m3035a(this.f2305b) ? ((width - paddingRight) - m2890l()) + i : i + paddingLeft);
        }
    }

    public C0641x(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, C0401a.spinnerStyle);
    }

    public C0641x(Context context, AttributeSet attributeSet, int i) {
        this(context, attributeSet, i, -1);
    }

    public C0641x(Context context, AttributeSet attributeSet, int i, int i2) {
        this(context, attributeSet, i, i2, null);
    }

    public C0641x(Context context, AttributeSet attributeSet, int i, int i2, Theme theme) {
        TypedArray obtainStyledAttributes;
        Throwable e;
        final C0640b c0640b;
        aw a;
        CharSequence[] f;
        SpinnerAdapter arrayAdapter;
        super(context, attributeSet, i);
        this.f2316i = new Rect();
        aw a2 = aw.m2953a(context, attributeSet, C0410j.Spinner, i, 0);
        this.f2309b = new C0614g(this);
        if (theme != null) {
            this.f2310c = new C0490d(context, theme);
        } else {
            int g = a2.m2970g(C0410j.Spinner_popupTheme, 0);
            if (g != 0) {
                this.f2310c = new C0490d(context, g);
            } else {
                this.f2310c = VERSION.SDK_INT < 23 ? context : null;
            }
        }
        if (this.f2310c != null) {
            if (i2 == -1) {
                if (VERSION.SDK_INT >= 11) {
                    try {
                        obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, f2308a, i, 0);
                        try {
                            if (obtainStyledAttributes.hasValue(0)) {
                                i2 = obtainStyledAttributes.getInt(0, 0);
                            }
                            if (obtainStyledAttributes != null) {
                                obtainStyledAttributes.recycle();
                            }
                        } catch (Exception e2) {
                            e = e2;
                            try {
                                Log.i("AppCompatSpinner", "Could not read android:spinnerMode", e);
                                if (obtainStyledAttributes != null) {
                                    obtainStyledAttributes.recycle();
                                }
                                if (i2 == 1) {
                                    c0640b = new C0640b(this, this.f2310c, attributeSet, i);
                                    a = aw.m2953a(this.f2310c, attributeSet, C0410j.Spinner, i, 0);
                                    this.f2315h = a.m2968f(C0410j.Spinner_android_dropDownWidth, -2);
                                    c0640b.m2867a(a.m2957a(C0410j.Spinner_android_popupBackground));
                                    c0640b.m3179a(a2.m2965d(C0410j.Spinner_android_prompt));
                                    a.m2958a();
                                    this.f2314g = c0640b;
                                    this.f2311d = new ah(this, this) {
                                        final /* synthetic */ C0641x f2296b;

                                        public C0515s mo366a() {
                                            return c0640b;
                                        }

                                        public boolean mo367b() {
                                            if (!this.f2296b.f2314g.mo422d()) {
                                                this.f2296b.f2314g.mo412a();
                                            }
                                            return true;
                                        }
                                    };
                                }
                                f = a2.m2969f(C0410j.Spinner_android_entries);
                                if (f != null) {
                                    arrayAdapter = new ArrayAdapter(context, 17367048, f);
                                    arrayAdapter.setDropDownViewResource(C0407g.support_simple_spinner_dropdown_item);
                                    setAdapter(arrayAdapter);
                                }
                                a2.m2958a();
                                this.f2313f = true;
                                if (this.f2312e != null) {
                                    setAdapter(this.f2312e);
                                    this.f2312e = null;
                                }
                                this.f2309b.m3102a(attributeSet, i);
                            } catch (Throwable th) {
                                e = th;
                                if (obtainStyledAttributes != null) {
                                    obtainStyledAttributes.recycle();
                                }
                                throw e;
                            }
                        }
                    } catch (Exception e3) {
                        e = e3;
                        obtainStyledAttributes = null;
                        Log.i("AppCompatSpinner", "Could not read android:spinnerMode", e);
                        if (obtainStyledAttributes != null) {
                            obtainStyledAttributes.recycle();
                        }
                        if (i2 == 1) {
                            c0640b = new C0640b(this, this.f2310c, attributeSet, i);
                            a = aw.m2953a(this.f2310c, attributeSet, C0410j.Spinner, i, 0);
                            this.f2315h = a.m2968f(C0410j.Spinner_android_dropDownWidth, -2);
                            c0640b.m2867a(a.m2957a(C0410j.Spinner_android_popupBackground));
                            c0640b.m3179a(a2.m2965d(C0410j.Spinner_android_prompt));
                            a.m2958a();
                            this.f2314g = c0640b;
                            this.f2311d = /* anonymous class already generated */;
                        }
                        f = a2.m2969f(C0410j.Spinner_android_entries);
                        if (f != null) {
                            arrayAdapter = new ArrayAdapter(context, 17367048, f);
                            arrayAdapter.setDropDownViewResource(C0407g.support_simple_spinner_dropdown_item);
                            setAdapter(arrayAdapter);
                        }
                        a2.m2958a();
                        this.f2313f = true;
                        if (this.f2312e != null) {
                            setAdapter(this.f2312e);
                            this.f2312e = null;
                        }
                        this.f2309b.m3102a(attributeSet, i);
                    } catch (Throwable th2) {
                        e = th2;
                        obtainStyledAttributes = null;
                        if (obtainStyledAttributes != null) {
                            obtainStyledAttributes.recycle();
                        }
                        throw e;
                    }
                }
                i2 = 1;
            }
            if (i2 == 1) {
                c0640b = new C0640b(this, this.f2310c, attributeSet, i);
                a = aw.m2953a(this.f2310c, attributeSet, C0410j.Spinner, i, 0);
                this.f2315h = a.m2968f(C0410j.Spinner_android_dropDownWidth, -2);
                c0640b.m2867a(a.m2957a(C0410j.Spinner_android_popupBackground));
                c0640b.m3179a(a2.m2965d(C0410j.Spinner_android_prompt));
                a.m2958a();
                this.f2314g = c0640b;
                this.f2311d = /* anonymous class already generated */;
            }
        }
        f = a2.m2969f(C0410j.Spinner_android_entries);
        if (f != null) {
            arrayAdapter = new ArrayAdapter(context, 17367048, f);
            arrayAdapter.setDropDownViewResource(C0407g.support_simple_spinner_dropdown_item);
            setAdapter(arrayAdapter);
        }
        a2.m2958a();
        this.f2313f = true;
        if (this.f2312e != null) {
            setAdapter(this.f2312e);
            this.f2312e = null;
        }
        this.f2309b.m3102a(attributeSet, i);
    }

    int m3186a(SpinnerAdapter spinnerAdapter, Drawable drawable) {
        if (spinnerAdapter == null) {
            return 0;
        }
        int makeMeasureSpec = MeasureSpec.makeMeasureSpec(getMeasuredWidth(), 0);
        int makeMeasureSpec2 = MeasureSpec.makeMeasureSpec(getMeasuredHeight(), 0);
        int max = Math.max(0, getSelectedItemPosition());
        int min = Math.min(spinnerAdapter.getCount(), max + 15);
        int max2 = Math.max(0, max - (15 - (min - max)));
        View view = null;
        int i = 0;
        max = 0;
        while (max2 < min) {
            View view2;
            int itemViewType = spinnerAdapter.getItemViewType(max2);
            if (itemViewType != max) {
                view2 = null;
            } else {
                itemViewType = max;
                view2 = view;
            }
            view = spinnerAdapter.getView(max2, view2, this);
            if (view.getLayoutParams() == null) {
                view.setLayoutParams(new LayoutParams(-2, -2));
            }
            view.measure(makeMeasureSpec, makeMeasureSpec2);
            i = Math.max(i, view.getMeasuredWidth());
            max2++;
            max = itemViewType;
        }
        if (drawable == null) {
            return i;
        }
        drawable.getPadding(this.f2316i);
        return (this.f2316i.left + this.f2316i.right) + i;
    }

    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.f2309b != null) {
            this.f2309b.m3105c();
        }
    }

    public int getDropDownHorizontalOffset() {
        return this.f2314g != null ? this.f2314g.m2888j() : VERSION.SDK_INT >= 16 ? super.getDropDownHorizontalOffset() : 0;
    }

    public int getDropDownVerticalOffset() {
        return this.f2314g != null ? this.f2314g.m2889k() : VERSION.SDK_INT >= 16 ? super.getDropDownVerticalOffset() : 0;
    }

    public int getDropDownWidth() {
        return this.f2314g != null ? this.f2315h : VERSION.SDK_INT >= 16 ? super.getDropDownWidth() : 0;
    }

    public Drawable getPopupBackground() {
        return this.f2314g != null ? this.f2314g.m2884h() : VERSION.SDK_INT >= 16 ? super.getPopupBackground() : null;
    }

    public Context getPopupContext() {
        return this.f2314g != null ? this.f2310c : VERSION.SDK_INT >= 23 ? super.getPopupContext() : null;
    }

    public CharSequence getPrompt() {
        return this.f2314g != null ? this.f2314g.mo548b() : super.getPrompt();
    }

    public ColorStateList getSupportBackgroundTintList() {
        return this.f2309b != null ? this.f2309b.m3097a() : null;
    }

    public Mode getSupportBackgroundTintMode() {
        return this.f2309b != null ? this.f2309b.m3103b() : null;
    }

    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.f2314g != null && this.f2314g.mo422d()) {
            this.f2314g.mo419c();
        }
    }

    protected void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        if (this.f2314g != null && MeasureSpec.getMode(i) == Integer.MIN_VALUE) {
            setMeasuredDimension(Math.min(Math.max(getMeasuredWidth(), m3186a(getAdapter(), getBackground())), MeasureSpec.getSize(i)), getMeasuredHeight());
        }
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        return (this.f2311d == null || !this.f2311d.onTouch(this, motionEvent)) ? super.onTouchEvent(motionEvent) : true;
    }

    public boolean performClick() {
        if (this.f2314g == null) {
            return super.performClick();
        }
        if (!this.f2314g.mo422d()) {
            this.f2314g.mo412a();
        }
        return true;
    }

    public void setAdapter(SpinnerAdapter spinnerAdapter) {
        if (this.f2313f) {
            super.setAdapter(spinnerAdapter);
            if (this.f2314g != null) {
                this.f2314g.mo547a(new C0636a(spinnerAdapter, (this.f2310c == null ? getContext() : this.f2310c).getTheme()));
                return;
            }
            return;
        }
        this.f2312e = spinnerAdapter;
    }

    public void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        if (this.f2309b != null) {
            this.f2309b.m3101a(drawable);
        }
    }

    public void setBackgroundResource(int i) {
        super.setBackgroundResource(i);
        if (this.f2309b != null) {
            this.f2309b.m3098a(i);
        }
    }

    public void setDropDownHorizontalOffset(int i) {
        if (this.f2314g != null) {
            this.f2314g.m2876c(i);
        } else if (VERSION.SDK_INT >= 16) {
            super.setDropDownHorizontalOffset(i);
        }
    }

    public void setDropDownVerticalOffset(int i) {
        if (this.f2314g != null) {
            this.f2314g.m2877d(i);
        } else if (VERSION.SDK_INT >= 16) {
            super.setDropDownVerticalOffset(i);
        }
    }

    public void setDropDownWidth(int i) {
        if (this.f2314g != null) {
            this.f2315h = i;
        } else if (VERSION.SDK_INT >= 16) {
            super.setDropDownWidth(i);
        }
    }

    public void setPopupBackgroundDrawable(Drawable drawable) {
        if (this.f2314g != null) {
            this.f2314g.m2867a(drawable);
        } else if (VERSION.SDK_INT >= 16) {
            super.setPopupBackgroundDrawable(drawable);
        }
    }

    public void setPopupBackgroundResource(int i) {
        setPopupBackgroundDrawable(C0485b.m2214b(getPopupContext(), i));
    }

    public void setPrompt(CharSequence charSequence) {
        if (this.f2314g != null) {
            this.f2314g.m3179a(charSequence);
        } else {
            super.setPrompt(charSequence);
        }
    }

    public void setSupportBackgroundTintList(ColorStateList colorStateList) {
        if (this.f2309b != null) {
            this.f2309b.m3099a(colorStateList);
        }
    }

    public void setSupportBackgroundTintMode(Mode mode) {
        if (this.f2309b != null) {
            this.f2309b.m3100a(mode);
        }
    }
}
