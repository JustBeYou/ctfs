package android.support.v7.widget;

import android.app.SearchableInfo;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.ClassLoaderCreator;
import android.os.Parcelable.Creator;
import android.support.v4.p017h.C0245a;
import android.support.v4.widget.C0382c;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.p020a.C0411a.C0404d;
import android.support.v7.view.C0489c;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.ImageSpan;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.KeyEvent.DispatcherState;
import android.view.TouchDelegate;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.View.OnFocusChangeListener;
import android.view.ViewConfiguration;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputMethodManager;
import android.widget.AutoCompleteTextView;
import android.widget.ImageView;
import java.lang.reflect.Method;
import java.util.WeakHashMap;

public class SearchView extends ai implements C0489c {
    static final C0556a f1884i = new C0556a();
    private OnClickListener f1885A;
    private boolean f1886B;
    private boolean f1887C;
    private boolean f1888D;
    private CharSequence f1889E;
    private boolean f1890F;
    private boolean f1891G;
    private int f1892H;
    private boolean f1893I;
    private CharSequence f1894J;
    private boolean f1895K;
    private int f1896L;
    private Bundle f1897M;
    private final Runnable f1898N;
    private Runnable f1899O;
    private final WeakHashMap<String, ConstantState> f1900P;
    final SearchAutoComplete f1901a;
    final ImageView f1902b;
    final ImageView f1903c;
    final ImageView f1904d;
    final ImageView f1905e;
    OnFocusChangeListener f1906f;
    C0382c f1907g;
    SearchableInfo f1908h;
    private final View f1909j;
    private final View f1910k;
    private C0562f f1911l;
    private Rect f1912m;
    private Rect f1913n;
    private int[] f1914o;
    private int[] f1915p;
    private final ImageView f1916q;
    private final Drawable f1917r;
    private final int f1918s;
    private final int f1919t;
    private final Intent f1920u;
    private final Intent f1921v;
    private final CharSequence f1922w;
    private C0558c f1923x;
    private C0557b f1924y;
    private C0559d f1925z;

    public static class SearchAutoComplete extends C0555f {
        final Runnable f1870a;
        private int f1871b;
        private SearchView f1872c;
        private boolean f1873d;

        class C05541 implements Runnable {
            final /* synthetic */ SearchAutoComplete f1866a;

            C05541(SearchAutoComplete searchAutoComplete) {
                this.f1866a = searchAutoComplete;
            }

            public void run() {
                this.f1866a.m2688a();
            }
        }

        public SearchAutoComplete(Context context) {
            this(context, null);
        }

        public SearchAutoComplete(Context context, AttributeSet attributeSet) {
            this(context, attributeSet, C0401a.autoCompleteTextViewStyle);
        }

        public SearchAutoComplete(Context context, AttributeSet attributeSet, int i) {
            super(context, attributeSet, i);
            this.f1870a = new C05541(this);
            this.f1871b = getThreshold();
        }

        private void m2688a() {
            if (this.f1873d) {
                ((InputMethodManager) getContext().getSystemService("input_method")).showSoftInput(this, 0);
                this.f1873d = false;
            }
        }

        private int getSearchViewTextMinWidthDp() {
            Configuration configuration = getResources().getConfiguration();
            int i = configuration.screenWidthDp;
            int i2 = configuration.screenHeightDp;
            return (i < 960 || i2 < 720 || configuration.orientation != 2) ? (i >= 600 || (i >= 640 && i2 >= 480)) ? 192 : 160 : 256;
        }

        private void setImeVisibility(boolean z) {
            InputMethodManager inputMethodManager = (InputMethodManager) getContext().getSystemService("input_method");
            if (!z) {
                this.f1873d = false;
                removeCallbacks(this.f1870a);
                inputMethodManager.hideSoftInputFromWindow(getWindowToken(), 0);
            } else if (inputMethodManager.isActive(this)) {
                this.f1873d = false;
                removeCallbacks(this.f1870a);
                inputMethodManager.showSoftInput(this, 0);
            } else {
                this.f1873d = true;
            }
        }

        public boolean enoughToFilter() {
            return this.f1871b <= 0 || super.enoughToFilter();
        }

        public InputConnection onCreateInputConnection(EditorInfo editorInfo) {
            InputConnection onCreateInputConnection = super.onCreateInputConnection(editorInfo);
            if (this.f1873d) {
                removeCallbacks(this.f1870a);
                post(this.f1870a);
            }
            return onCreateInputConnection;
        }

        protected void onFinishInflate() {
            super.onFinishInflate();
            setMinWidth((int) TypedValue.applyDimension(1, (float) getSearchViewTextMinWidthDp(), getResources().getDisplayMetrics()));
        }

        protected void onFocusChanged(boolean z, int i, Rect rect) {
            super.onFocusChanged(z, i, rect);
            this.f1872c.m2724g();
        }

        public boolean onKeyPreIme(int i, KeyEvent keyEvent) {
            if (i == 4) {
                DispatcherState keyDispatcherState;
                if (keyEvent.getAction() == 0 && keyEvent.getRepeatCount() == 0) {
                    keyDispatcherState = getKeyDispatcherState();
                    if (keyDispatcherState == null) {
                        return true;
                    }
                    keyDispatcherState.startTracking(keyEvent, this);
                    return true;
                } else if (keyEvent.getAction() == 1) {
                    keyDispatcherState = getKeyDispatcherState();
                    if (keyDispatcherState != null) {
                        keyDispatcherState.handleUpEvent(keyEvent);
                    }
                    if (keyEvent.isTracking() && !keyEvent.isCanceled()) {
                        this.f1872c.clearFocus();
                        setImeVisibility(false);
                        return true;
                    }
                }
            }
            return super.onKeyPreIme(i, keyEvent);
        }

        public void onWindowFocusChanged(boolean z) {
            super.onWindowFocusChanged(z);
            if (z && this.f1872c.hasFocus() && getVisibility() == 0) {
                this.f1873d = true;
                if (SearchView.m2703a(getContext())) {
                    SearchView.f1884i.m2692a(this, true);
                }
            }
        }

        public void performCompletion() {
        }

        protected void replaceText(CharSequence charSequence) {
        }

        void setSearchView(SearchView searchView) {
            this.f1872c = searchView;
        }

        public void setThreshold(int i) {
            super.setThreshold(i);
            this.f1871b = i;
        }
    }

    private static class C0556a {
        private Method f1874a;
        private Method f1875b;
        private Method f1876c;

        C0556a() {
            try {
                this.f1874a = AutoCompleteTextView.class.getDeclaredMethod("doBeforeTextChanged", new Class[0]);
                this.f1874a.setAccessible(true);
            } catch (NoSuchMethodException e) {
            }
            try {
                this.f1875b = AutoCompleteTextView.class.getDeclaredMethod("doAfterTextChanged", new Class[0]);
                this.f1875b.setAccessible(true);
            } catch (NoSuchMethodException e2) {
            }
            try {
                this.f1876c = AutoCompleteTextView.class.getMethod("ensureImeVisible", new Class[]{Boolean.TYPE});
                this.f1876c.setAccessible(true);
            } catch (NoSuchMethodException e3) {
            }
        }

        void m2691a(AutoCompleteTextView autoCompleteTextView) {
            if (this.f1874a != null) {
                try {
                    this.f1874a.invoke(autoCompleteTextView, new Object[0]);
                } catch (Exception e) {
                }
            }
        }

        void m2692a(AutoCompleteTextView autoCompleteTextView, boolean z) {
            if (this.f1876c != null) {
                try {
                    this.f1876c.invoke(autoCompleteTextView, new Object[]{Boolean.valueOf(z)});
                } catch (Exception e) {
                }
            }
        }

        void m2693b(AutoCompleteTextView autoCompleteTextView) {
            if (this.f1875b != null) {
                try {
                    this.f1875b.invoke(autoCompleteTextView, new Object[0]);
                } catch (Exception e) {
                }
            }
        }
    }

    public interface C0557b {
        boolean m2694a();
    }

    public interface C0558c {
        boolean m2695a(String str);
    }

    public interface C0559d {
    }

    static class C0561e extends C0245a {
        public static final Creator<C0561e> CREATOR = new C05601();
        boolean f1877b;

        static class C05601 implements ClassLoaderCreator<C0561e> {
            C05601() {
            }

            public C0561e m2696a(Parcel parcel) {
                return new C0561e(parcel, null);
            }

            public C0561e m2697a(Parcel parcel, ClassLoader classLoader) {
                return new C0561e(parcel, classLoader);
            }

            public C0561e[] m2698a(int i) {
                return new C0561e[i];
            }

            public /* synthetic */ Object createFromParcel(Parcel parcel) {
                return m2696a(parcel);
            }

            public /* synthetic */ Object createFromParcel(Parcel parcel, ClassLoader classLoader) {
                return m2697a(parcel, classLoader);
            }

            public /* synthetic */ Object[] newArray(int i) {
                return m2698a(i);
            }
        }

        public C0561e(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            this.f1877b = ((Boolean) parcel.readValue(null)).booleanValue();
        }

        C0561e(Parcelable parcelable) {
            super(parcelable);
        }

        public String toString() {
            return "SearchView.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " isIconified=" + this.f1877b + "}";
        }

        public void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeValue(Boolean.valueOf(this.f1877b));
        }
    }

    private static class C0562f extends TouchDelegate {
        private final View f1878a;
        private final Rect f1879b = new Rect();
        private final Rect f1880c = new Rect();
        private final Rect f1881d = new Rect();
        private final int f1882e;
        private boolean f1883f;

        public C0562f(Rect rect, Rect rect2, View view) {
            super(rect, view);
            this.f1882e = ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
            m2699a(rect, rect2);
            this.f1878a = view;
        }

        public void m2699a(Rect rect, Rect rect2) {
            this.f1879b.set(rect);
            this.f1881d.set(rect);
            this.f1881d.inset(-this.f1882e, -this.f1882e);
            this.f1880c.set(rect2);
        }

        /* JADX WARNING: inconsistent code. */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public boolean onTouchEvent(android.view.MotionEvent r7) {
            /*
            r6 = this;
            r1 = 1;
            r0 = 0;
            r2 = r7.getX();
            r3 = (int) r2;
            r2 = r7.getY();
            r4 = (int) r2;
            r2 = r7.getAction();
            switch(r2) {
                case 0: goto L_0x003c;
                case 1: goto L_0x0048;
                case 2: goto L_0x0048;
                case 3: goto L_0x0056;
                default: goto L_0x0013;
            };
        L_0x0013:
            r2 = r0;
        L_0x0014:
            if (r2 == 0) goto L_0x003b;
        L_0x0016:
            if (r1 == 0) goto L_0x005b;
        L_0x0018:
            r0 = r6.f1880c;
            r0 = r0.contains(r3, r4);
            if (r0 != 0) goto L_0x005b;
        L_0x0020:
            r0 = r6.f1878a;
            r0 = r0.getWidth();
            r0 = r0 / 2;
            r0 = (float) r0;
            r1 = r6.f1878a;
            r1 = r1.getHeight();
            r1 = r1 / 2;
            r1 = (float) r1;
            r7.setLocation(r0, r1);
        L_0x0035:
            r0 = r6.f1878a;
            r0 = r0.dispatchTouchEvent(r7);
        L_0x003b:
            return r0;
        L_0x003c:
            r2 = r6.f1879b;
            r2 = r2.contains(r3, r4);
            if (r2 == 0) goto L_0x0013;
        L_0x0044:
            r6.f1883f = r1;
            r2 = r1;
            goto L_0x0014;
        L_0x0048:
            r2 = r6.f1883f;
            if (r2 == 0) goto L_0x0014;
        L_0x004c:
            r5 = r6.f1881d;
            r5 = r5.contains(r3, r4);
            if (r5 != 0) goto L_0x0014;
        L_0x0054:
            r1 = r0;
            goto L_0x0014;
        L_0x0056:
            r2 = r6.f1883f;
            r6.f1883f = r0;
            goto L_0x0014;
        L_0x005b:
            r0 = r6.f1880c;
            r0 = r0.left;
            r0 = r3 - r0;
            r0 = (float) r0;
            r1 = r6.f1880c;
            r1 = r1.top;
            r1 = r4 - r1;
            r1 = (float) r1;
            r7.setLocation(r0, r1);
            goto L_0x0035;
            */
            throw new UnsupportedOperationException("Method not decompiled: android.support.v7.widget.SearchView.f.onTouchEvent(android.view.MotionEvent):boolean");
        }
    }

    private Intent m2700a(String str, Uri uri, String str2, String str3, int i, String str4) {
        Intent intent = new Intent(str);
        intent.addFlags(268435456);
        if (uri != null) {
            intent.setData(uri);
        }
        intent.putExtra("user_query", this.f1894J);
        if (str3 != null) {
            intent.putExtra("query", str3);
        }
        if (str2 != null) {
            intent.putExtra("intent_extra_data_key", str2);
        }
        if (this.f1897M != null) {
            intent.putExtra("app_data", this.f1897M);
        }
        if (i != 0) {
            intent.putExtra("action_key", i);
            intent.putExtra("action_msg", str4);
        }
        intent.setComponent(this.f1908h.getSearchActivity());
        return intent;
    }

    private void m2701a(View view, Rect rect) {
        view.getLocationInWindow(this.f1914o);
        getLocationInWindow(this.f1915p);
        int i = this.f1914o[1] - this.f1915p[1];
        int i2 = this.f1914o[0] - this.f1915p[0];
        rect.set(i2, i, view.getWidth() + i2, view.getHeight() + i);
    }

    private void m2702a(boolean z) {
        boolean z2 = true;
        int i = 8;
        this.f1887C = z;
        int i2 = z ? 0 : 8;
        boolean z3 = !TextUtils.isEmpty(this.f1901a.getText());
        this.f1902b.setVisibility(i2);
        m2705b(z3);
        this.f1909j.setVisibility(z ? 8 : 0);
        if (!(this.f1916q.getDrawable() == null || this.f1886B)) {
            i = 0;
        }
        this.f1916q.setVisibility(i);
        m2710m();
        if (z3) {
            z2 = false;
        }
        m2706c(z2);
        m2709l();
    }

    static boolean m2703a(Context context) {
        return context.getResources().getConfiguration().orientation == 2;
    }

    private CharSequence m2704b(CharSequence charSequence) {
        if (!this.f1886B || this.f1917r == null) {
            return charSequence;
        }
        int textSize = (int) (((double) this.f1901a.getTextSize()) * 1.25d);
        this.f1917r.setBounds(0, 0, textSize, textSize);
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder("   ");
        spannableStringBuilder.setSpan(new ImageSpan(this.f1917r), 1, 2, 33);
        spannableStringBuilder.append(charSequence);
        return spannableStringBuilder;
    }

    private void m2705b(boolean z) {
        int i = 8;
        if (this.f1888D && m2708k() && hasFocus() && (z || !this.f1893I)) {
            i = 0;
        }
        this.f1903c.setVisibility(i);
    }

    private void m2706c(boolean z) {
        int i;
        if (this.f1893I && !m2720c() && z) {
            i = 0;
            this.f1903c.setVisibility(8);
        } else {
            i = 8;
        }
        this.f1905e.setVisibility(i);
    }

    private int getPreferredHeight() {
        return getContext().getResources().getDimensionPixelSize(C0404d.abc_search_view_preferred_height);
    }

    private int getPreferredWidth() {
        return getContext().getResources().getDimensionPixelSize(C0404d.abc_search_view_preferred_width);
    }

    private boolean m2707i() {
        if (this.f1908h == null || !this.f1908h.getVoiceSearchEnabled()) {
            return false;
        }
        Intent intent = null;
        if (this.f1908h.getVoiceSearchLaunchWebSearch()) {
            intent = this.f1920u;
        } else if (this.f1908h.getVoiceSearchLaunchRecognizer()) {
            intent = this.f1921v;
        }
        return (intent == null || getContext().getPackageManager().resolveActivity(intent, 65536) == null) ? false : true;
    }

    private boolean m2708k() {
        return (this.f1888D || this.f1893I) && !m2720c();
    }

    private void m2709l() {
        int i = 8;
        if (m2708k() && (this.f1903c.getVisibility() == 0 || this.f1905e.getVisibility() == 0)) {
            i = 0;
        }
        this.f1910k.setVisibility(i);
    }

    private void m2710m() {
        int i = 1;
        int i2 = 0;
        int i3 = !TextUtils.isEmpty(this.f1901a.getText()) ? 1 : 0;
        if (i3 == 0 && (!this.f1886B || this.f1895K)) {
            i = 0;
        }
        ImageView imageView = this.f1904d;
        if (i == 0) {
            i2 = 8;
        }
        imageView.setVisibility(i2);
        Drawable drawable = this.f1904d.getDrawable();
        if (drawable != null) {
            drawable.setState(i3 != 0 ? ENABLED_STATE_SET : EMPTY_STATE_SET);
        }
    }

    private void m2711n() {
        post(this.f1898N);
    }

    private void m2712o() {
        CharSequence queryHint = getQueryHint();
        SearchAutoComplete searchAutoComplete = this.f1901a;
        if (queryHint == null) {
            queryHint = "";
        }
        searchAutoComplete.setHint(m2704b(queryHint));
    }

    private void m2713p() {
        int i = 1;
        this.f1901a.setThreshold(this.f1908h.getSuggestThreshold());
        this.f1901a.setImeOptions(this.f1908h.getImeOptions());
        int inputType = this.f1908h.getInputType();
        if ((inputType & 15) == 1) {
            inputType &= -65537;
            if (this.f1908h.getSuggestAuthority() != null) {
                inputType = (inputType | 65536) | 524288;
            }
        }
        this.f1901a.setInputType(inputType);
        if (this.f1907g != null) {
            this.f1907g.mo244a(null);
        }
        if (this.f1908h.getSuggestAuthority() != null) {
            this.f1907g = new aq(getContext(), this, this.f1908h, this.f1900P);
            this.f1901a.setAdapter(this.f1907g);
            aq aqVar = (aq) this.f1907g;
            if (this.f1890F) {
                i = 2;
            }
            aqVar.m2937a(i);
        }
    }

    private void m2714q() {
        this.f1901a.dismissDropDown();
    }

    private void setQuery(CharSequence charSequence) {
        this.f1901a.setText(charSequence);
        this.f1901a.setSelection(TextUtils.isEmpty(charSequence) ? 0 : charSequence.length());
    }

    public void mo430a() {
        if (!this.f1895K) {
            this.f1895K = true;
            this.f1896L = this.f1901a.getImeOptions();
            this.f1901a.setImeOptions(this.f1896L | 33554432);
            this.f1901a.setText("");
            setIconified(false);
        }
    }

    void m2716a(int i, String str, String str2) {
        getContext().startActivity(m2700a("android.intent.action.SEARCH", null, null, str2, i, str));
    }

    void m2717a(CharSequence charSequence) {
        setQuery(charSequence);
    }

    public void m2718a(CharSequence charSequence, boolean z) {
        this.f1901a.setText(charSequence);
        if (charSequence != null) {
            this.f1901a.setSelection(this.f1901a.length());
            this.f1894J = charSequence;
        }
        if (z && !TextUtils.isEmpty(charSequence)) {
            m2721d();
        }
    }

    public void mo431b() {
        m2718a((CharSequence) "", false);
        clearFocus();
        m2702a(true);
        this.f1901a.setImeOptions(this.f1896L);
        this.f1895K = false;
    }

    public boolean m2720c() {
        return this.f1887C;
    }

    public void clearFocus() {
        this.f1891G = true;
        super.clearFocus();
        this.f1901a.clearFocus();
        this.f1901a.setImeVisibility(false);
        this.f1891G = false;
    }

    void m2721d() {
        CharSequence text = this.f1901a.getText();
        if (text != null && TextUtils.getTrimmedLength(text) > 0) {
            if (this.f1923x == null || !this.f1923x.m2695a(text.toString())) {
                if (this.f1908h != null) {
                    m2716a(0, null, text.toString());
                }
                this.f1901a.setImeVisibility(false);
                m2714q();
            }
        }
    }

    void m2722e() {
        if (!TextUtils.isEmpty(this.f1901a.getText())) {
            this.f1901a.setText("");
            this.f1901a.requestFocus();
            this.f1901a.setImeVisibility(true);
        } else if (!this.f1886B) {
        } else {
            if (this.f1924y == null || !this.f1924y.m2694a()) {
                clearFocus();
                m2702a(true);
            }
        }
    }

    void m2723f() {
        m2702a(false);
        this.f1901a.requestFocus();
        this.f1901a.setImeVisibility(true);
        if (this.f1885A != null) {
            this.f1885A.onClick(this);
        }
    }

    void m2724g() {
        m2702a(m2720c());
        m2711n();
        if (this.f1901a.hasFocus()) {
            m2725h();
        }
    }

    public int getImeOptions() {
        return this.f1901a.getImeOptions();
    }

    public int getInputType() {
        return this.f1901a.getInputType();
    }

    public int getMaxWidth() {
        return this.f1892H;
    }

    public CharSequence getQuery() {
        return this.f1901a.getText();
    }

    public CharSequence getQueryHint() {
        return this.f1889E != null ? this.f1889E : (this.f1908h == null || this.f1908h.getHintId() == 0) ? this.f1922w : getContext().getText(this.f1908h.getHintId());
    }

    int getSuggestionCommitIconResId() {
        return this.f1919t;
    }

    int getSuggestionRowLayout() {
        return this.f1918s;
    }

    public C0382c getSuggestionsAdapter() {
        return this.f1907g;
    }

    void m2725h() {
        f1884i.m2691a(this.f1901a);
        f1884i.m2693b(this.f1901a);
    }

    protected void onDetachedFromWindow() {
        removeCallbacks(this.f1898N);
        post(this.f1899O);
        super.onDetachedFromWindow();
    }

    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        if (z) {
            m2701a(this.f1901a, this.f1912m);
            this.f1913n.set(this.f1912m.left, 0, this.f1912m.right, i4 - i2);
            if (this.f1911l == null) {
                this.f1911l = new C0562f(this.f1913n, this.f1912m, this.f1901a);
                setTouchDelegate(this.f1911l);
                return;
            }
            this.f1911l.m2699a(this.f1913n, this.f1912m);
        }
    }

    protected void onMeasure(int i, int i2) {
        if (m2720c()) {
            super.onMeasure(i, i2);
            return;
        }
        int mode = MeasureSpec.getMode(i);
        int size = MeasureSpec.getSize(i);
        switch (mode) {
            case Integer.MIN_VALUE:
                if (this.f1892H <= 0) {
                    size = Math.min(getPreferredWidth(), size);
                    break;
                } else {
                    size = Math.min(this.f1892H, size);
                    break;
                }
            case 0:
                if (this.f1892H <= 0) {
                    size = getPreferredWidth();
                    break;
                } else {
                    size = this.f1892H;
                    break;
                }
            case 1073741824:
                if (this.f1892H > 0) {
                    size = Math.min(this.f1892H, size);
                    break;
                }
                break;
        }
        int mode2 = MeasureSpec.getMode(i2);
        mode = MeasureSpec.getSize(i2);
        switch (mode2) {
            case Integer.MIN_VALUE:
                mode = Math.min(getPreferredHeight(), mode);
                break;
            case 0:
                mode = getPreferredHeight();
                break;
        }
        super.onMeasure(MeasureSpec.makeMeasureSpec(size, 1073741824), MeasureSpec.makeMeasureSpec(mode, 1073741824));
    }

    protected void onRestoreInstanceState(Parcelable parcelable) {
        if (parcelable instanceof C0561e) {
            C0561e c0561e = (C0561e) parcelable;
            super.onRestoreInstanceState(c0561e.m1179a());
            m2702a(c0561e.f1877b);
            requestLayout();
            return;
        }
        super.onRestoreInstanceState(parcelable);
    }

    protected Parcelable onSaveInstanceState() {
        Parcelable c0561e = new C0561e(super.onSaveInstanceState());
        c0561e.f1877b = m2720c();
        return c0561e;
    }

    public void onWindowFocusChanged(boolean z) {
        super.onWindowFocusChanged(z);
        m2711n();
    }

    public boolean requestFocus(int i, Rect rect) {
        if (this.f1891G || !isFocusable()) {
            return false;
        }
        if (m2720c()) {
            return super.requestFocus(i, rect);
        }
        boolean requestFocus = this.f1901a.requestFocus(i, rect);
        if (requestFocus) {
            m2702a(false);
        }
        return requestFocus;
    }

    public void setAppSearchData(Bundle bundle) {
        this.f1897M = bundle;
    }

    public void setIconified(boolean z) {
        if (z) {
            m2722e();
        } else {
            m2723f();
        }
    }

    public void setIconifiedByDefault(boolean z) {
        if (this.f1886B != z) {
            this.f1886B = z;
            m2702a(z);
            m2712o();
        }
    }

    public void setImeOptions(int i) {
        this.f1901a.setImeOptions(i);
    }

    public void setInputType(int i) {
        this.f1901a.setInputType(i);
    }

    public void setMaxWidth(int i) {
        this.f1892H = i;
        requestLayout();
    }

    public void setOnCloseListener(C0557b c0557b) {
        this.f1924y = c0557b;
    }

    public void setOnQueryTextFocusChangeListener(OnFocusChangeListener onFocusChangeListener) {
        this.f1906f = onFocusChangeListener;
    }

    public void setOnQueryTextListener(C0558c c0558c) {
        this.f1923x = c0558c;
    }

    public void setOnSearchClickListener(OnClickListener onClickListener) {
        this.f1885A = onClickListener;
    }

    public void setOnSuggestionListener(C0559d c0559d) {
        this.f1925z = c0559d;
    }

    public void setQueryHint(CharSequence charSequence) {
        this.f1889E = charSequence;
        m2712o();
    }

    public void setQueryRefinementEnabled(boolean z) {
        this.f1890F = z;
        if (this.f1907g instanceof aq) {
            ((aq) this.f1907g).m2937a(z ? 2 : 1);
        }
    }

    public void setSearchableInfo(SearchableInfo searchableInfo) {
        this.f1908h = searchableInfo;
        if (this.f1908h != null) {
            m2713p();
            m2712o();
        }
        this.f1893I = m2707i();
        if (this.f1893I) {
            this.f1901a.setPrivateImeOptions("nm");
        }
        m2702a(m2720c());
    }

    public void setSubmitButtonEnabled(boolean z) {
        this.f1888D = z;
        m2702a(m2720c());
    }

    public void setSuggestionsAdapter(C0382c c0382c) {
        this.f1907g = c0382c;
        this.f1901a.setAdapter(this.f1907g);
    }
}
