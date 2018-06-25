package android.support.v7.widget;

import android.content.Context;
import android.graphics.Rect;
import android.support.v4.p017h.C0315p;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.View.MeasureSpec;
import android.widget.FrameLayout;

public class ContentFrameLayout extends FrameLayout {
    private TypedValue f1307a;
    private TypedValue f1308b;
    private TypedValue f1309c;
    private TypedValue f1310d;
    private TypedValue f1311e;
    private TypedValue f1312f;
    private final Rect f1313g;
    private C0454a f1314h;

    public interface C0454a {
        void mo319a();

        void mo320b();
    }

    public ContentFrameLayout(Context context) {
        this(context, null);
    }

    public ContentFrameLayout(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public ContentFrameLayout(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.f1313g = new Rect();
    }

    public void m2080a(int i, int i2, int i3, int i4) {
        this.f1313g.set(i, i2, i3, i4);
        if (C0315p.m1397l(this)) {
            requestLayout();
        }
    }

    public void m2081a(Rect rect) {
        fitSystemWindows(rect);
    }

    public TypedValue getFixedHeightMajor() {
        if (this.f1311e == null) {
            this.f1311e = new TypedValue();
        }
        return this.f1311e;
    }

    public TypedValue getFixedHeightMinor() {
        if (this.f1312f == null) {
            this.f1312f = new TypedValue();
        }
        return this.f1312f;
    }

    public TypedValue getFixedWidthMajor() {
        if (this.f1309c == null) {
            this.f1309c = new TypedValue();
        }
        return this.f1309c;
    }

    public TypedValue getFixedWidthMinor() {
        if (this.f1310d == null) {
            this.f1310d = new TypedValue();
        }
        return this.f1310d;
    }

    public TypedValue getMinWidthMajor() {
        if (this.f1307a == null) {
            this.f1307a = new TypedValue();
        }
        return this.f1307a;
    }

    public TypedValue getMinWidthMinor() {
        if (this.f1308b == null) {
            this.f1308b = new TypedValue();
        }
        return this.f1308b;
    }

    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.f1314h != null) {
            this.f1314h.mo319a();
        }
    }

    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.f1314h != null) {
            this.f1314h.mo320b();
        }
    }

    protected void onMeasure(int i, int i2) {
        TypedValue typedValue;
        int dimension;
        Object obj;
        TypedValue typedValue2;
        int dimension2;
        Object obj2 = null;
        DisplayMetrics displayMetrics = getContext().getResources().getDisplayMetrics();
        Object obj3 = displayMetrics.widthPixels < displayMetrics.heightPixels ? 1 : null;
        int mode = MeasureSpec.getMode(i);
        int mode2 = MeasureSpec.getMode(i2);
        if (mode == Integer.MIN_VALUE) {
            typedValue = obj3 != null ? this.f1310d : this.f1309c;
            if (!(typedValue == null || typedValue.type == 0)) {
                dimension = typedValue.type == 5 ? (int) typedValue.getDimension(displayMetrics) : typedValue.type == 6 ? (int) typedValue.getFraction((float) displayMetrics.widthPixels, (float) displayMetrics.widthPixels) : 0;
                if (dimension > 0) {
                    i = MeasureSpec.makeMeasureSpec(Math.min(dimension - (this.f1313g.left + this.f1313g.right), MeasureSpec.getSize(i)), 1073741824);
                    obj = 1;
                    if (mode2 == Integer.MIN_VALUE) {
                        typedValue = obj3 == null ? this.f1311e : this.f1312f;
                        if (!(typedValue == null || typedValue.type == 0)) {
                            dimension = typedValue.type != 5 ? (int) typedValue.getDimension(displayMetrics) : typedValue.type != 6 ? (int) typedValue.getFraction((float) displayMetrics.heightPixels, (float) displayMetrics.heightPixels) : 0;
                            if (dimension > 0) {
                                i2 = MeasureSpec.makeMeasureSpec(Math.min(dimension - (this.f1313g.top + this.f1313g.bottom), MeasureSpec.getSize(i2)), 1073741824);
                            }
                        }
                    }
                    super.onMeasure(i, i2);
                    mode2 = getMeasuredWidth();
                    dimension = MeasureSpec.makeMeasureSpec(mode2, 1073741824);
                    if (obj == null && mode == Integer.MIN_VALUE) {
                        typedValue2 = obj3 == null ? this.f1308b : this.f1307a;
                        if (!(typedValue2 == null || typedValue2.type == 0)) {
                            dimension2 = typedValue2.type != 5 ? (int) typedValue2.getDimension(displayMetrics) : typedValue2.type != 6 ? (int) typedValue2.getFraction((float) displayMetrics.widthPixels, (float) displayMetrics.widthPixels) : 0;
                            if (dimension2 > 0) {
                                dimension2 -= this.f1313g.left + this.f1313g.right;
                            }
                            if (mode2 < dimension2) {
                                dimension2 = MeasureSpec.makeMeasureSpec(dimension2, 1073741824);
                                obj2 = 1;
                                if (obj2 == null) {
                                    super.onMeasure(dimension2, i2);
                                }
                            }
                        }
                    }
                    dimension2 = dimension;
                    if (obj2 == null) {
                        super.onMeasure(dimension2, i2);
                    }
                }
            }
        }
        obj = null;
        if (mode2 == Integer.MIN_VALUE) {
            if (obj3 == null) {
            }
            if (typedValue.type != 5) {
                if (typedValue.type != 6) {
                }
            }
            if (dimension > 0) {
                i2 = MeasureSpec.makeMeasureSpec(Math.min(dimension - (this.f1313g.top + this.f1313g.bottom), MeasureSpec.getSize(i2)), 1073741824);
            }
        }
        super.onMeasure(i, i2);
        mode2 = getMeasuredWidth();
        dimension = MeasureSpec.makeMeasureSpec(mode2, 1073741824);
        if (obj3 == null) {
        }
        if (typedValue2.type != 5) {
            if (typedValue2.type != 6) {
            }
        }
        if (dimension2 > 0) {
            dimension2 -= this.f1313g.left + this.f1313g.right;
        }
        if (mode2 < dimension2) {
            dimension2 = MeasureSpec.makeMeasureSpec(dimension2, 1073741824);
            obj2 = 1;
            if (obj2 == null) {
                super.onMeasure(dimension2, i2);
            }
        }
        dimension2 = dimension;
        if (obj2 == null) {
            super.onMeasure(dimension2, i2);
        }
    }

    public void setAttachListener(C0454a c0454a) {
        this.f1314h = c0454a;
    }
}
