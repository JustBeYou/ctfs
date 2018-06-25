package android.support.p003b.p004a;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.Path;
import android.graphics.PathMeasure;
import android.support.v4.p005c.C0191b;
import android.support.v4.p009b.p011a.C0171c;
import android.util.AttributeSet;
import android.view.InflateException;
import android.view.animation.Interpolator;
import org.xmlpull.v1.XmlPullParser;

public class C0037g implements Interpolator {
    private float[] f67a;
    private float[] f68b;

    public C0037g(Context context, AttributeSet attributeSet, XmlPullParser xmlPullParser) {
        this(context.getResources(), context.getTheme(), attributeSet, xmlPullParser);
    }

    public C0037g(Resources resources, Theme theme, AttributeSet attributeSet, XmlPullParser xmlPullParser) {
        TypedArray a = C0171c.m873a(resources, theme, attributeSet, C0024a.f50l);
        m76a(a, xmlPullParser);
        a.recycle();
    }

    private void m74a(float f, float f2) {
        Path path = new Path();
        path.moveTo(0.0f, 0.0f);
        path.quadTo(f, f2, 1.0f, 1.0f);
        m77a(path);
    }

    private void m75a(float f, float f2, float f3, float f4) {
        Path path = new Path();
        path.moveTo(0.0f, 0.0f);
        path.cubicTo(f, f2, f3, f4, 1.0f, 1.0f);
        m77a(path);
    }

    private void m76a(TypedArray typedArray, XmlPullParser xmlPullParser) {
        if (C0171c.m876a(xmlPullParser, "pathData")) {
            String a = C0171c.m874a(typedArray, xmlPullParser, "pathData", 4);
            Path a2 = C0191b.m969a(a);
            if (a2 == null) {
                throw new InflateException("The path is null, which is created from " + a);
            }
            m77a(a2);
        } else if (!C0171c.m876a(xmlPullParser, "controlX1")) {
            throw new InflateException("pathInterpolator requires the controlX1 attribute");
        } else if (C0171c.m876a(xmlPullParser, "controlY1")) {
            float a3 = C0171c.m871a(typedArray, xmlPullParser, "controlX1", 0, 0.0f);
            float a4 = C0171c.m871a(typedArray, xmlPullParser, "controlY1", 1, 0.0f);
            boolean a5 = C0171c.m876a(xmlPullParser, "controlX2");
            if (a5 != C0171c.m876a(xmlPullParser, "controlY2")) {
                throw new InflateException("pathInterpolator requires both controlX2 and controlY2 for cubic Beziers.");
            } else if (a5) {
                m75a(a3, a4, C0171c.m871a(typedArray, xmlPullParser, "controlX2", 2, 0.0f), C0171c.m871a(typedArray, xmlPullParser, "controlY2", 3, 0.0f));
            } else {
                m74a(a3, a4);
            }
        } else {
            throw new InflateException("pathInterpolator requires the controlY1 attribute");
        }
    }

    private void m77a(Path path) {
        int i = 0;
        PathMeasure pathMeasure = new PathMeasure(path, false);
        float length = pathMeasure.getLength();
        int min = Math.min(3000, ((int) (length / 0.002f)) + 1);
        if (min <= 0) {
            throw new IllegalArgumentException("The Path has a invalid length " + length);
        }
        int i2;
        this.f67a = new float[min];
        this.f68b = new float[min];
        float[] fArr = new float[2];
        for (i2 = 0; i2 < min; i2++) {
            pathMeasure.getPosTan((((float) i2) * length) / ((float) (min - 1)), fArr, null);
            this.f67a[i2] = fArr[0];
            this.f68b[i2] = fArr[1];
        }
        if (((double) Math.abs(this.f67a[0])) > 1.0E-5d || ((double) Math.abs(this.f68b[0])) > 1.0E-5d || ((double) Math.abs(this.f67a[min - 1] - 1.0f)) > 1.0E-5d || ((double) Math.abs(this.f68b[min - 1] - 1.0f)) > 1.0E-5d) {
            throw new IllegalArgumentException("The Path must start at (0,0) and end at (1,1) start: " + this.f67a[0] + "," + this.f68b[0] + " end:" + this.f67a[min - 1] + "," + this.f68b[min - 1]);
        }
        float f = 0.0f;
        i2 = 0;
        while (i < min) {
            int i3 = i2 + 1;
            float f2 = this.f67a[i2];
            if (f2 < f) {
                throw new IllegalArgumentException("The Path cannot loop back on itself, x :" + f2);
            }
            this.f67a[i] = f2;
            i++;
            f = f2;
            i2 = i3;
        }
        if (pathMeasure.nextContour()) {
            throw new IllegalArgumentException("The Path should be continuous, can't have 2+ contours");
        }
    }

    public float getInterpolation(float f) {
        if (f <= 0.0f) {
            return 0.0f;
        }
        if (f >= 1.0f) {
            return 1.0f;
        }
        int i = 0;
        int length = this.f67a.length - 1;
        while (length - i > 1) {
            int i2 = (i + length) / 2;
            if (f < this.f67a[i2]) {
                length = i;
            } else {
                int i3 = length;
                length = i2;
                i2 = i3;
            }
            i = length;
            length = i2;
        }
        float f2 = this.f67a[length] - this.f67a[i];
        if (f2 == 0.0f) {
            return this.f68b[i];
        }
        f2 = (f - this.f67a[i]) / f2;
        float f3 = this.f68b[i];
        return (f2 * (this.f68b[length] - f3)) + f3;
    }
}
