package android.support.v7.widget;

import android.content.Context;
import android.support.v7.p021b.p022a.C0485b;
import android.util.AttributeSet;
import android.widget.CheckedTextView;
import android.widget.TextView;

public class C0617j extends CheckedTextView {
    private static final int[] f2243a = new int[]{16843016};
    private final C0642y f2244b;

    public C0617j(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 16843720);
    }

    public C0617j(Context context, AttributeSet attributeSet, int i) {
        super(at.m2948a(context), attributeSet, i);
        this.f2244b = C0642y.m3188a((TextView) this);
        this.f2244b.mo551a(attributeSet, i);
        this.f2244b.mo550a();
        aw a = aw.m2953a(getContext(), attributeSet, f2243a, i, 0);
        setCheckMarkDrawable(a.m2957a(0));
        a.m2958a();
    }

    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.f2244b != null) {
            this.f2244b.mo550a();
        }
    }

    public void setCheckMarkDrawable(int i) {
        setCheckMarkDrawable(C0485b.m2214b(getContext(), i));
    }

    public void setTextAppearance(Context context, int i) {
        super.setTextAppearance(context, i);
        if (this.f2244b != null) {
            this.f2244b.m3195a(context, i);
        }
    }
}
