package android.support.v7.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.RectF;
import android.os.Build.VERSION;
import android.support.v7.p020a.C0411a.C0410j;
import android.text.Layout.Alignment;
import android.text.StaticLayout;
import android.text.StaticLayout.Builder;
import android.text.TextDirectionHeuristic;
import android.text.TextDirectionHeuristics;
import android.text.TextPaint;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.util.TypedValue;
import android.widget.TextView;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Hashtable;
import java.util.List;

class ab {
    private static final RectF f1984a = new RectF();
    private static Hashtable<String, Method> f1985b = new Hashtable();
    private int f1986c = 0;
    private boolean f1987d = false;
    private float f1988e = -1.0f;
    private float f1989f = -1.0f;
    private float f1990g = -1.0f;
    private int[] f1991h = new int[0];
    private boolean f1992i = false;
    private TextPaint f1993j;
    private final TextView f1994k;
    private final Context f1995l;

    ab(TextView textView) {
        this.f1994k = textView;
        this.f1995l = this.f1994k.getContext();
    }

    private int m2786a(RectF rectF) {
        int length = this.f1991h.length;
        if (length == 0) {
            throw new IllegalStateException("No available text sizes to choose from.");
        }
        int i = 0;
        int i2 = 1;
        length--;
        while (i2 <= length) {
            i = (i2 + length) / 2;
            if (m2794a(this.f1991h[i], rectF)) {
                int i3 = i + 1;
                i = i2;
                i2 = i3;
            } else {
                length = i - 1;
                i = length;
            }
        }
        return this.f1991h[i];
    }

    @TargetApi(14)
    private StaticLayout m2787a(CharSequence charSequence, Alignment alignment, int i) {
        float lineSpacingMultiplier;
        float lineSpacingExtra;
        boolean includeFontPadding;
        if (VERSION.SDK_INT >= 16) {
            lineSpacingMultiplier = this.f1994k.getLineSpacingMultiplier();
            lineSpacingExtra = this.f1994k.getLineSpacingExtra();
            includeFontPadding = this.f1994k.getIncludeFontPadding();
        } else {
            lineSpacingMultiplier = ((Float) m2789a(this.f1994k, "getLineSpacingMultiplier", Float.valueOf(1.0f))).floatValue();
            lineSpacingExtra = ((Float) m2789a(this.f1994k, "getLineSpacingExtra", Float.valueOf(0.0f))).floatValue();
            includeFontPadding = ((Boolean) m2789a(this.f1994k, "getIncludeFontPadding", Boolean.valueOf(true))).booleanValue();
        }
        return new StaticLayout(charSequence, this.f1993j, i, alignment, lineSpacingMultiplier, lineSpacingExtra, includeFontPadding);
    }

    @TargetApi(23)
    private StaticLayout m2788a(CharSequence charSequence, Alignment alignment, int i, int i2) {
        TextDirectionHeuristic textDirectionHeuristic = (TextDirectionHeuristic) m2789a(this.f1994k, "getTextDirectionHeuristic", TextDirectionHeuristics.FIRSTSTRONG_LTR);
        Builder hyphenationFrequency = Builder.obtain(charSequence, 0, charSequence.length(), this.f1993j, i).setAlignment(alignment).setLineSpacing(this.f1994k.getLineSpacingExtra(), this.f1994k.getLineSpacingMultiplier()).setIncludePad(this.f1994k.getIncludeFontPadding()).setBreakStrategy(this.f1994k.getBreakStrategy()).setHyphenationFrequency(this.f1994k.getHyphenationFrequency());
        if (i2 == -1) {
            i2 = Integer.MAX_VALUE;
        }
        return hyphenationFrequency.setMaxLines(i2).setTextDirection(textDirectionHeuristic).build();
    }

    private <T> T m2789a(Object obj, String str, T t) {
        try {
            t = m2790a(str).invoke(obj, new Object[0]);
            return t == null ? t : t;
        } catch (Throwable e) {
            Log.w("ACTVAutoSizeHelper", "Failed to invoke TextView#" + str + "() method", e);
            return null != null ? null : t;
        } catch (Throwable th) {
            if (null == null && 1 == 0) {
            }
        }
    }

    private Method m2790a(String str) {
        try {
            Method method = (Method) f1985b.get(str);
            if (method != null) {
                return method;
            }
            method = TextView.class.getDeclaredMethod(str, new Class[0]);
            if (method == null) {
                return method;
            }
            method.setAccessible(true);
            f1985b.put(str, method);
            return method;
        } catch (Throwable e) {
            Log.w("ACTVAutoSizeHelper", "Failed to retrieve TextView#" + str + "() method", e);
            return null;
        }
    }

    private void m2791a(float f) {
        if (f != this.f1994k.getPaint().getTextSize()) {
            this.f1994k.getPaint().setTextSize(f);
            boolean isInLayout = VERSION.SDK_INT >= 18 ? this.f1994k.isInLayout() : false;
            if (this.f1994k.getLayout() != null) {
                this.f1987d = false;
                String str = "nullLayouts";
                try {
                    Method a = m2790a("nullLayouts");
                    if (a != null) {
                        a.invoke(this.f1994k, new Object[0]);
                    }
                } catch (Throwable e) {
                    Log.w("ACTVAutoSizeHelper", "Failed to invoke TextView#nullLayouts() method", e);
                }
                if (isInLayout) {
                    this.f1994k.forceLayout();
                } else {
                    this.f1994k.requestLayout();
                }
                this.f1994k.invalidate();
            }
        }
    }

    private void m2792a(float f, float f2, float f3) {
        if (f <= 0.0f) {
            throw new IllegalArgumentException("Minimum auto-size text size (" + f + "px) is less or equal to (0px)");
        } else if (f2 <= f) {
            throw new IllegalArgumentException("Maximum auto-size text size (" + f2 + "px) is less or equal to minimum auto-size " + "text size (" + f + "px)");
        } else if (f3 <= 0.0f) {
            throw new IllegalArgumentException("The auto-size step granularity (" + f3 + "px) is less or equal to (0px)");
        } else {
            this.f1986c = 1;
            this.f1989f = f;
            this.f1990g = f2;
            this.f1988e = f3;
            this.f1992i = false;
        }
    }

    private void m2793a(TypedArray typedArray) {
        int length = typedArray.length();
        int[] iArr = new int[length];
        if (length > 0) {
            for (int i = 0; i < length; i++) {
                iArr[i] = typedArray.getDimensionPixelSize(i, -1);
            }
            this.f1991h = m2795a(iArr);
            m2796h();
        }
    }

    private boolean m2794a(int i, RectF rectF) {
        CharSequence text = this.f1994k.getText();
        int maxLines = VERSION.SDK_INT >= 16 ? this.f1994k.getMaxLines() : -1;
        if (this.f1993j == null) {
            this.f1993j = new TextPaint();
        } else {
            this.f1993j.reset();
        }
        this.f1993j.set(this.f1994k.getPaint());
        this.f1993j.setTextSize((float) i);
        Alignment alignment = (Alignment) m2789a(this.f1994k, "getLayoutAlignment", Alignment.ALIGN_NORMAL);
        StaticLayout a = VERSION.SDK_INT >= 23 ? m2788a(text, alignment, Math.round(rectF.right), maxLines) : m2787a(text, alignment, Math.round(rectF.right));
        return (maxLines == -1 || (a.getLineCount() <= maxLines && a.getLineEnd(a.getLineCount() - 1) == text.length())) ? ((float) a.getHeight()) <= rectF.bottom : false;
    }

    private int[] m2795a(int[] iArr) {
        int size;
        if (size != 0) {
            int i;
            Arrays.sort(iArr);
            List arrayList = new ArrayList();
            for (int i2 : iArr) {
                if (i2 > 0 && Collections.binarySearch(arrayList, Integer.valueOf(i2)) < 0) {
                    arrayList.add(Integer.valueOf(i2));
                }
            }
            if (size != arrayList.size()) {
                size = arrayList.size();
                iArr = new int[size];
                for (i = 0; i < size; i++) {
                    iArr[i] = ((Integer) arrayList.get(i)).intValue();
                }
            }
        }
        return iArr;
    }

    private boolean m2796h() {
        int length = this.f1991h.length;
        this.f1992i = length > 0;
        if (this.f1992i) {
            this.f1986c = 1;
            this.f1989f = (float) this.f1991h[0];
            this.f1990g = (float) this.f1991h[length - 1];
            this.f1988e = -1.0f;
        }
        return this.f1992i;
    }

    private boolean m2797i() {
        if (m2799k() && this.f1986c == 1) {
            if (!this.f1992i || this.f1991h.length == 0) {
                float round = (float) Math.round(this.f1989f);
                int i = 1;
                while (Math.round(this.f1988e + round) <= Math.round(this.f1990g)) {
                    i++;
                    round += this.f1988e;
                }
                int[] iArr = new int[i];
                float f = this.f1989f;
                for (int i2 = false; i2 < i; i2++) {
                    iArr[i2] = Math.round(f);
                    f += this.f1988e;
                }
                this.f1991h = m2795a(iArr);
            }
            this.f1987d = true;
        } else {
            this.f1987d = false;
        }
        return this.f1987d;
    }

    private void m2798j() {
        this.f1986c = 0;
        this.f1989f = -1.0f;
        this.f1990g = -1.0f;
        this.f1988e = -1.0f;
        this.f1991h = new int[0];
        this.f1987d = false;
    }

    private boolean m2799k() {
        return !(this.f1994k instanceof C0624m);
    }

    int m2800a() {
        return this.f1986c;
    }

    void m2801a(int i) {
        if (m2799k()) {
            switch (i) {
                case 0:
                    m2798j();
                    return;
                case 1:
                    DisplayMetrics displayMetrics = this.f1995l.getResources().getDisplayMetrics();
                    m2792a(TypedValue.applyDimension(2, 12.0f, displayMetrics), TypedValue.applyDimension(2, 112.0f, displayMetrics), 1.0f);
                    if (m2797i()) {
                        m2810f();
                        return;
                    }
                    return;
                default:
                    throw new IllegalArgumentException("Unknown auto-size text type: " + i);
            }
        }
    }

    void m2802a(int i, float f) {
        m2791a(TypedValue.applyDimension(i, f, (this.f1995l == null ? Resources.getSystem() : this.f1995l.getResources()).getDisplayMetrics()));
    }

    void m2803a(int i, int i2, int i3, int i4) {
        if (m2799k()) {
            DisplayMetrics displayMetrics = this.f1995l.getResources().getDisplayMetrics();
            m2792a(TypedValue.applyDimension(i4, (float) i, displayMetrics), TypedValue.applyDimension(i4, (float) i2, displayMetrics), TypedValue.applyDimension(i4, (float) i3, displayMetrics));
            if (m2797i()) {
                m2810f();
            }
        }
    }

    void m2804a(AttributeSet attributeSet, int i) {
        TypedArray obtainStyledAttributes = this.f1995l.obtainStyledAttributes(attributeSet, C0410j.AppCompatTextView, i, 0);
        if (obtainStyledAttributes.hasValue(C0410j.AppCompatTextView_autoSizeTextType)) {
            this.f1986c = obtainStyledAttributes.getInt(C0410j.AppCompatTextView_autoSizeTextType, 0);
        }
        float dimension = obtainStyledAttributes.hasValue(C0410j.AppCompatTextView_autoSizeStepGranularity) ? obtainStyledAttributes.getDimension(C0410j.AppCompatTextView_autoSizeStepGranularity, -1.0f) : -1.0f;
        float dimension2 = obtainStyledAttributes.hasValue(C0410j.AppCompatTextView_autoSizeMinTextSize) ? obtainStyledAttributes.getDimension(C0410j.AppCompatTextView_autoSizeMinTextSize, -1.0f) : -1.0f;
        float dimension3 = obtainStyledAttributes.hasValue(C0410j.AppCompatTextView_autoSizeMaxTextSize) ? obtainStyledAttributes.getDimension(C0410j.AppCompatTextView_autoSizeMaxTextSize, -1.0f) : -1.0f;
        if (obtainStyledAttributes.hasValue(C0410j.AppCompatTextView_autoSizePresetSizes)) {
            int resourceId = obtainStyledAttributes.getResourceId(C0410j.AppCompatTextView_autoSizePresetSizes, 0);
            if (resourceId > 0) {
                TypedArray obtainTypedArray = obtainStyledAttributes.getResources().obtainTypedArray(resourceId);
                m2793a(obtainTypedArray);
                obtainTypedArray.recycle();
            }
        }
        obtainStyledAttributes.recycle();
        if (!m2799k()) {
            this.f1986c = 0;
        } else if (this.f1986c == 1) {
            if (!this.f1992i) {
                DisplayMetrics displayMetrics = this.f1995l.getResources().getDisplayMetrics();
                if (dimension2 == -1.0f) {
                    dimension2 = TypedValue.applyDimension(2, 12.0f, displayMetrics);
                }
                if (dimension3 == -1.0f) {
                    dimension3 = TypedValue.applyDimension(2, 112.0f, displayMetrics);
                }
                if (dimension == -1.0f) {
                    dimension = 1.0f;
                }
                m2792a(dimension2, dimension3, dimension);
            }
            m2797i();
        }
    }

    void m2805a(int[] iArr, int i) {
        int i2 = 0;
        if (m2799k()) {
            int length = iArr.length;
            if (length > 0) {
                int[] iArr2 = new int[length];
                if (i == 0) {
                    iArr2 = Arrays.copyOf(iArr, length);
                } else {
                    DisplayMetrics displayMetrics = this.f1995l.getResources().getDisplayMetrics();
                    while (i2 < length) {
                        iArr2[i2] = Math.round(TypedValue.applyDimension(i, (float) iArr[i2], displayMetrics));
                        i2++;
                    }
                }
                this.f1991h = m2795a(iArr2);
                if (!m2796h()) {
                    throw new IllegalArgumentException("None of the preset sizes is valid: " + Arrays.toString(iArr));
                }
            }
            this.f1992i = false;
            if (m2797i()) {
                m2810f();
            }
        }
    }

    int m2806b() {
        return Math.round(this.f1988e);
    }

    int m2807c() {
        return Math.round(this.f1989f);
    }

    int m2808d() {
        return Math.round(this.f1990g);
    }

    int[] m2809e() {
        return this.f1991h;
    }

    void m2810f() {
        if (m2811g()) {
            if (this.f1987d) {
                if (this.f1994k.getMeasuredHeight() > 0 && this.f1994k.getMeasuredWidth() > 0) {
                    int measuredWidth = ((Boolean) m2789a(this.f1994k, "getHorizontallyScrolling", Boolean.valueOf(false))).booleanValue() ? 1048576 : (this.f1994k.getMeasuredWidth() - this.f1994k.getTotalPaddingLeft()) - this.f1994k.getTotalPaddingRight();
                    int height = (this.f1994k.getHeight() - this.f1994k.getCompoundPaddingBottom()) - this.f1994k.getCompoundPaddingTop();
                    if (measuredWidth > 0 && height > 0) {
                        synchronized (f1984a) {
                            f1984a.setEmpty();
                            f1984a.right = (float) measuredWidth;
                            f1984a.bottom = (float) height;
                            float a = (float) m2786a(f1984a);
                            if (a != this.f1994k.getTextSize()) {
                                m2802a(0, a);
                            }
                        }
                    } else {
                        return;
                    }
                }
                return;
            }
            this.f1987d = true;
        }
    }

    boolean m2811g() {
        return m2799k() && this.f1986c != 0;
    }
}
