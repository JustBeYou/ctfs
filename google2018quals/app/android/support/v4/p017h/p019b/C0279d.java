package android.support.v4.p017h.p019b;

import android.view.animation.Interpolator;

abstract class C0279d implements Interpolator {
    private final float[] f906a;
    private final float f907b = (1.0f / ((float) (this.f906a.length - 1)));

    public C0279d(float[] fArr) {
        this.f906a = fArr;
    }

    public float getInterpolation(float f) {
        if (f >= 1.0f) {
            return 1.0f;
        }
        if (f <= 0.0f) {
            return 0.0f;
        }
        int min = Math.min((int) (((float) (this.f906a.length - 1)) * f), this.f906a.length - 2);
        float f2 = (f - (((float) min) * this.f907b)) / this.f907b;
        return ((this.f906a[min + 1] - this.f906a[min]) * f2) + this.f906a[min];
    }
}
