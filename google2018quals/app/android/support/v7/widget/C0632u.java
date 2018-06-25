package android.support.v7.widget;

import android.content.Context;
import android.graphics.Bitmap;
import android.support.v7.p020a.C0411a.C0401a;
import android.util.AttributeSet;
import android.view.View;
import android.widget.RatingBar;

public class C0632u extends RatingBar {
    private final C0630s f2287a;

    public C0632u(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, C0401a.ratingBarStyle);
    }

    public C0632u(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.f2287a = new C0630s(this);
        this.f2287a.mo545a(attributeSet, i);
    }

    protected synchronized void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        Bitmap a = this.f2287a.m3166a();
        if (a != null) {
            setMeasuredDimension(View.resolveSizeAndState(a.getWidth() * getNumStars(), i, 0), getMeasuredHeight());
        }
    }
}
