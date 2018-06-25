package android.support.p003b.p004a;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Cap;
import android.graphics.Paint.Join;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Path.FillType;
import android.graphics.PathMeasure;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.graphics.drawable.VectorDrawable;
import android.os.Build.VERSION;
import android.support.v4.p005c.C0191b;
import android.support.v4.p005c.C0191b.C0190b;
import android.support.v4.p005c.p006a.C0179a;
import android.support.v4.p009b.p011a.C0170b;
import android.support.v4.p009b.p011a.C0171c;
import android.support.v4.p016g.C0229a;
import android.util.AttributeSet;
import android.util.Log;
import android.util.Xml;
import java.util.ArrayList;
import java.util.Stack;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

public class C0045i extends C0030h {
    static final Mode f127a = Mode.SRC_IN;
    private C0043f f128c;
    private PorterDuffColorFilter f129d;
    private ColorFilter f130e;
    private boolean f131f;
    private boolean f132g;
    private ConstantState f133h;
    private final float[] f134i;
    private final Matrix f135j;
    private final Rect f136k;

    private static class C0038d {
        protected C0190b[] f69m = null;
        String f70n;
        int f71o;

        public C0038d(C0038d c0038d) {
            this.f70n = c0038d.f70n;
            this.f71o = c0038d.f71o;
            this.f69m = C0191b.m974a(c0038d.f69m);
        }

        public void m78a(Path path) {
            path.reset();
            if (this.f69m != null) {
                C0190b.m966a(this.f69m, path);
            }
        }

        public boolean mo24a() {
            return false;
        }

        public C0190b[] getPathData() {
            return this.f69m;
        }

        public String getPathName() {
            return this.f70n;
        }

        public void setPathData(C0190b[] c0190bArr) {
            if (C0191b.m972a(this.f69m, c0190bArr)) {
                C0191b.m975b(this.f69m, c0190bArr);
            } else {
                this.f69m = C0191b.m974a(c0190bArr);
            }
        }
    }

    private static class C0039a extends C0038d {
        public C0039a(C0039a c0039a) {
            super(c0039a);
        }

        private void m80a(TypedArray typedArray) {
            String string = typedArray.getString(0);
            if (string != null) {
                this.n = string;
            }
            string = typedArray.getString(1);
            if (string != null) {
                this.m = C0191b.m976b(string);
            }
        }

        public void m81a(Resources resources, AttributeSet attributeSet, Theme theme, XmlPullParser xmlPullParser) {
            if (C0171c.m876a(xmlPullParser, "pathData")) {
                TypedArray a = C0171c.m873a(resources, theme, attributeSet, C0024a.f42d);
                m80a(a);
                a.recycle();
            }
        }

        public boolean mo24a() {
            return true;
        }
    }

    private static class C0040b extends C0038d {
        int f72a = 0;
        float f73b = 0.0f;
        int f74c = 0;
        float f75d = 1.0f;
        int f76e = 0;
        float f77f = 1.0f;
        float f78g = 0.0f;
        float f79h = 1.0f;
        float f80i = 0.0f;
        Cap f81j = Cap.BUTT;
        Join f82k = Join.MITER;
        float f83l = 4.0f;
        private int[] f84p;

        public C0040b(C0040b c0040b) {
            super(c0040b);
            this.f84p = c0040b.f84p;
            this.f72a = c0040b.f72a;
            this.f73b = c0040b.f73b;
            this.f75d = c0040b.f75d;
            this.f74c = c0040b.f74c;
            this.f76e = c0040b.f76e;
            this.f77f = c0040b.f77f;
            this.f78g = c0040b.f78g;
            this.f79h = c0040b.f79h;
            this.f80i = c0040b.f80i;
            this.f81j = c0040b.f81j;
            this.f82k = c0040b.f82k;
            this.f83l = c0040b.f83l;
        }

        private Cap m83a(int i, Cap cap) {
            switch (i) {
                case 0:
                    return Cap.BUTT;
                case 1:
                    return Cap.ROUND;
                case 2:
                    return Cap.SQUARE;
                default:
                    return cap;
            }
        }

        private Join m84a(int i, Join join) {
            switch (i) {
                case 0:
                    return Join.MITER;
                case 1:
                    return Join.ROUND;
                case 2:
                    return Join.BEVEL;
                default:
                    return join;
            }
        }

        private void m85a(TypedArray typedArray, XmlPullParser xmlPullParser) {
            this.f84p = null;
            if (C0171c.m876a(xmlPullParser, "pathData")) {
                String string = typedArray.getString(0);
                if (string != null) {
                    this.n = string;
                }
                string = typedArray.getString(2);
                if (string != null) {
                    this.m = C0191b.m976b(string);
                }
                this.f74c = C0171c.m877b(typedArray, xmlPullParser, "fillColor", 1, this.f74c);
                this.f77f = C0171c.m871a(typedArray, xmlPullParser, "fillAlpha", 12, this.f77f);
                this.f81j = m83a(C0171c.m872a(typedArray, xmlPullParser, "strokeLineCap", 8, -1), this.f81j);
                this.f82k = m84a(C0171c.m872a(typedArray, xmlPullParser, "strokeLineJoin", 9, -1), this.f82k);
                this.f83l = C0171c.m871a(typedArray, xmlPullParser, "strokeMiterLimit", 10, this.f83l);
                this.f72a = C0171c.m877b(typedArray, xmlPullParser, "strokeColor", 3, this.f72a);
                this.f75d = C0171c.m871a(typedArray, xmlPullParser, "strokeAlpha", 11, this.f75d);
                this.f73b = C0171c.m871a(typedArray, xmlPullParser, "strokeWidth", 4, this.f73b);
                this.f79h = C0171c.m871a(typedArray, xmlPullParser, "trimPathEnd", 6, this.f79h);
                this.f80i = C0171c.m871a(typedArray, xmlPullParser, "trimPathOffset", 7, this.f80i);
                this.f78g = C0171c.m871a(typedArray, xmlPullParser, "trimPathStart", 5, this.f78g);
                this.f76e = C0171c.m872a(typedArray, xmlPullParser, "fillType", 13, this.f76e);
            }
        }

        public void m86a(Resources resources, AttributeSet attributeSet, Theme theme, XmlPullParser xmlPullParser) {
            TypedArray a = C0171c.m873a(resources, theme, attributeSet, C0024a.f41c);
            m85a(a, xmlPullParser);
            a.recycle();
        }

        float getFillAlpha() {
            return this.f77f;
        }

        int getFillColor() {
            return this.f74c;
        }

        float getStrokeAlpha() {
            return this.f75d;
        }

        int getStrokeColor() {
            return this.f72a;
        }

        float getStrokeWidth() {
            return this.f73b;
        }

        float getTrimPathEnd() {
            return this.f79h;
        }

        float getTrimPathOffset() {
            return this.f80i;
        }

        float getTrimPathStart() {
            return this.f78g;
        }

        void setFillAlpha(float f) {
            this.f77f = f;
        }

        void setFillColor(int i) {
            this.f74c = i;
        }

        void setStrokeAlpha(float f) {
            this.f75d = f;
        }

        void setStrokeColor(int i) {
            this.f72a = i;
        }

        void setStrokeWidth(float f) {
            this.f73b = f;
        }

        void setTrimPathEnd(float f) {
            this.f79h = f;
        }

        void setTrimPathOffset(float f) {
            this.f80i = f;
        }

        void setTrimPathStart(float f) {
            this.f78g = f;
        }
    }

    private static class C0041c {
        final ArrayList<Object> f85a = new ArrayList();
        float f86b = 0.0f;
        int f87c;
        private final Matrix f88d = new Matrix();
        private float f89e = 0.0f;
        private float f90f = 0.0f;
        private float f91g = 1.0f;
        private float f92h = 1.0f;
        private float f93i = 0.0f;
        private float f94j = 0.0f;
        private final Matrix f95k = new Matrix();
        private int[] f96l;
        private String f97m = null;

        public C0041c(C0041c c0041c, C0229a<String, Object> c0229a) {
            this.f86b = c0041c.f86b;
            this.f89e = c0041c.f89e;
            this.f90f = c0041c.f90f;
            this.f91g = c0041c.f91g;
            this.f92h = c0041c.f92h;
            this.f93i = c0041c.f93i;
            this.f94j = c0041c.f94j;
            this.f96l = c0041c.f96l;
            this.f97m = c0041c.f97m;
            this.f87c = c0041c.f87c;
            if (this.f97m != null) {
                c0229a.put(this.f97m, this);
            }
            this.f95k.set(c0041c.f95k);
            ArrayList arrayList = c0041c.f85a;
            for (int i = 0; i < arrayList.size(); i++) {
                Object obj = arrayList.get(i);
                if (obj instanceof C0041c) {
                    this.f85a.add(new C0041c((C0041c) obj, c0229a));
                } else {
                    C0038d c0040b;
                    if (obj instanceof C0040b) {
                        c0040b = new C0040b((C0040b) obj);
                    } else if (obj instanceof C0039a) {
                        c0040b = new C0039a((C0039a) obj);
                    } else {
                        throw new IllegalStateException("Unknown object in the tree!");
                    }
                    this.f85a.add(c0040b);
                    if (c0040b.f70n != null) {
                        c0229a.put(c0040b.f70n, c0040b);
                    }
                }
            }
        }

        private void m88a() {
            this.f95k.reset();
            this.f95k.postTranslate(-this.f89e, -this.f90f);
            this.f95k.postScale(this.f91g, this.f92h);
            this.f95k.postRotate(this.f86b, 0.0f, 0.0f);
            this.f95k.postTranslate(this.f93i + this.f89e, this.f94j + this.f90f);
        }

        private void m89a(TypedArray typedArray, XmlPullParser xmlPullParser) {
            this.f96l = null;
            this.f86b = C0171c.m871a(typedArray, xmlPullParser, "rotation", 5, this.f86b);
            this.f89e = typedArray.getFloat(1, this.f89e);
            this.f90f = typedArray.getFloat(2, this.f90f);
            this.f91g = C0171c.m871a(typedArray, xmlPullParser, "scaleX", 3, this.f91g);
            this.f92h = C0171c.m871a(typedArray, xmlPullParser, "scaleY", 4, this.f92h);
            this.f93i = C0171c.m871a(typedArray, xmlPullParser, "translateX", 6, this.f93i);
            this.f94j = C0171c.m871a(typedArray, xmlPullParser, "translateY", 7, this.f94j);
            String string = typedArray.getString(0);
            if (string != null) {
                this.f97m = string;
            }
            m88a();
        }

        public void m91a(Resources resources, AttributeSet attributeSet, Theme theme, XmlPullParser xmlPullParser) {
            TypedArray a = C0171c.m873a(resources, theme, attributeSet, C0024a.f40b);
            m89a(a, xmlPullParser);
            a.recycle();
        }

        public String getGroupName() {
            return this.f97m;
        }

        public Matrix getLocalMatrix() {
            return this.f95k;
        }

        public float getPivotX() {
            return this.f89e;
        }

        public float getPivotY() {
            return this.f90f;
        }

        public float getRotation() {
            return this.f86b;
        }

        public float getScaleX() {
            return this.f91g;
        }

        public float getScaleY() {
            return this.f92h;
        }

        public float getTranslateX() {
            return this.f93i;
        }

        public float getTranslateY() {
            return this.f94j;
        }

        public void setPivotX(float f) {
            if (f != this.f89e) {
                this.f89e = f;
                m88a();
            }
        }

        public void setPivotY(float f) {
            if (f != this.f90f) {
                this.f90f = f;
                m88a();
            }
        }

        public void setRotation(float f) {
            if (f != this.f86b) {
                this.f86b = f;
                m88a();
            }
        }

        public void setScaleX(float f) {
            if (f != this.f91g) {
                this.f91g = f;
                m88a();
            }
        }

        public void setScaleY(float f) {
            if (f != this.f92h) {
                this.f92h = f;
                m88a();
            }
        }

        public void setTranslateX(float f) {
            if (f != this.f93i) {
                this.f93i = f;
                m88a();
            }
        }

        public void setTranslateY(float f) {
            if (f != this.f94j) {
                this.f94j = f;
                m88a();
            }
        }
    }

    private static class C0042e {
        private static final Matrix f98k = new Matrix();
        final C0041c f99a;
        float f100b;
        float f101c;
        float f102d;
        float f103e;
        int f104f;
        String f105g;
        final C0229a<String, Object> f106h;
        private final Path f107i;
        private final Path f108j;
        private final Matrix f109l;
        private Paint f110m;
        private Paint f111n;
        private PathMeasure f112o;
        private int f113p;

        public C0042e() {
            this.f109l = new Matrix();
            this.f100b = 0.0f;
            this.f101c = 0.0f;
            this.f102d = 0.0f;
            this.f103e = 0.0f;
            this.f104f = 255;
            this.f105g = null;
            this.f106h = new C0229a();
            this.f99a = new C0041c();
            this.f107i = new Path();
            this.f108j = new Path();
        }

        public C0042e(C0042e c0042e) {
            this.f109l = new Matrix();
            this.f100b = 0.0f;
            this.f101c = 0.0f;
            this.f102d = 0.0f;
            this.f103e = 0.0f;
            this.f104f = 255;
            this.f105g = null;
            this.f106h = new C0229a();
            this.f99a = new C0041c(c0042e.f99a, this.f106h);
            this.f107i = new Path(c0042e.f107i);
            this.f108j = new Path(c0042e.f108j);
            this.f100b = c0042e.f100b;
            this.f101c = c0042e.f101c;
            this.f102d = c0042e.f102d;
            this.f103e = c0042e.f103e;
            this.f113p = c0042e.f113p;
            this.f104f = c0042e.f104f;
            this.f105g = c0042e.f105g;
            if (c0042e.f105g != null) {
                this.f106h.put(c0042e.f105g, this);
            }
        }

        private static float m92a(float f, float f2, float f3, float f4) {
            return (f * f4) - (f2 * f3);
        }

        private float m93a(Matrix matrix) {
            float[] fArr = new float[]{0.0f, 1.0f, 1.0f, 0.0f};
            matrix.mapVectors(fArr);
            float hypot = (float) Math.hypot((double) fArr[0], (double) fArr[1]);
            float hypot2 = (float) Math.hypot((double) fArr[2], (double) fArr[3]);
            float a = C0042e.m92a(fArr[0], fArr[1], fArr[2], fArr[3]);
            hypot = Math.max(hypot, hypot2);
            return hypot > 0.0f ? Math.abs(a) / hypot : 0.0f;
        }

        private void m96a(C0041c c0041c, Matrix matrix, Canvas canvas, int i, int i2, ColorFilter colorFilter) {
            c0041c.f88d.set(matrix);
            c0041c.f88d.preConcat(c0041c.f95k);
            canvas.save();
            for (int i3 = 0; i3 < c0041c.f85a.size(); i3++) {
                Object obj = c0041c.f85a.get(i3);
                if (obj instanceof C0041c) {
                    m96a((C0041c) obj, c0041c.f88d, canvas, i, i2, colorFilter);
                } else if (obj instanceof C0038d) {
                    m97a(c0041c, (C0038d) obj, canvas, i, i2, colorFilter);
                }
            }
            canvas.restore();
        }

        private void m97a(C0041c c0041c, C0038d c0038d, Canvas canvas, int i, int i2, ColorFilter colorFilter) {
            float f = ((float) i) / this.f102d;
            float f2 = ((float) i2) / this.f103e;
            float min = Math.min(f, f2);
            Matrix a = c0041c.f88d;
            this.f109l.set(a);
            this.f109l.postScale(f, f2);
            f2 = m93a(a);
            if (f2 != 0.0f) {
                c0038d.m78a(this.f107i);
                Path path = this.f107i;
                this.f108j.reset();
                if (c0038d.mo24a()) {
                    this.f108j.addPath(path, this.f109l);
                    canvas.clipPath(this.f108j);
                    return;
                }
                C0040b c0040b = (C0040b) c0038d;
                if (!(c0040b.f78g == 0.0f && c0040b.f79h == 1.0f)) {
                    float f3 = (c0040b.f78g + c0040b.f80i) % 1.0f;
                    float f4 = (c0040b.f79h + c0040b.f80i) % 1.0f;
                    if (this.f112o == null) {
                        this.f112o = new PathMeasure();
                    }
                    this.f112o.setPath(this.f107i, false);
                    float length = this.f112o.getLength();
                    f3 *= length;
                    f4 *= length;
                    path.reset();
                    if (f3 > f4) {
                        this.f112o.getSegment(f3, length, path, true);
                        this.f112o.getSegment(0.0f, f4, path, true);
                    } else {
                        this.f112o.getSegment(f3, f4, path, true);
                    }
                    path.rLineTo(0.0f, 0.0f);
                }
                this.f108j.addPath(path, this.f109l);
                if (c0040b.f74c != 0) {
                    if (this.f111n == null) {
                        this.f111n = new Paint();
                        this.f111n.setStyle(Style.FILL);
                        this.f111n.setAntiAlias(true);
                    }
                    Paint paint = this.f111n;
                    paint.setColor(C0045i.m109a(c0040b.f74c, c0040b.f77f));
                    paint.setColorFilter(colorFilter);
                    this.f108j.setFillType(c0040b.f76e == 0 ? FillType.WINDING : FillType.EVEN_ODD);
                    canvas.drawPath(this.f108j, paint);
                }
                if (c0040b.f72a != 0) {
                    if (this.f110m == null) {
                        this.f110m = new Paint();
                        this.f110m.setStyle(Style.STROKE);
                        this.f110m.setAntiAlias(true);
                    }
                    Paint paint2 = this.f110m;
                    if (c0040b.f82k != null) {
                        paint2.setStrokeJoin(c0040b.f82k);
                    }
                    if (c0040b.f81j != null) {
                        paint2.setStrokeCap(c0040b.f81j);
                    }
                    paint2.setStrokeMiter(c0040b.f83l);
                    paint2.setColor(C0045i.m109a(c0040b.f72a, c0040b.f75d));
                    paint2.setColorFilter(colorFilter);
                    paint2.setStrokeWidth((f2 * min) * c0040b.f73b);
                    canvas.drawPath(this.f108j, paint2);
                }
            }
        }

        public void m100a(Canvas canvas, int i, int i2, ColorFilter colorFilter) {
            m96a(this.f99a, f98k, canvas, i, i2, colorFilter);
        }

        public float getAlpha() {
            return ((float) getRootAlpha()) / 255.0f;
        }

        public int getRootAlpha() {
            return this.f104f;
        }

        public void setAlpha(float f) {
            setRootAlpha((int) (255.0f * f));
        }

        public void setRootAlpha(int i) {
            this.f104f = i;
        }
    }

    private static class C0043f extends ConstantState {
        int f114a;
        C0042e f115b;
        ColorStateList f116c;
        Mode f117d;
        boolean f118e;
        Bitmap f119f;
        ColorStateList f120g;
        Mode f121h;
        int f122i;
        boolean f123j;
        boolean f124k;
        Paint f125l;

        public C0043f() {
            this.f116c = null;
            this.f117d = C0045i.f127a;
            this.f115b = new C0042e();
        }

        public C0043f(C0043f c0043f) {
            this.f116c = null;
            this.f117d = C0045i.f127a;
            if (c0043f != null) {
                this.f114a = c0043f.f114a;
                this.f115b = new C0042e(c0043f.f115b);
                if (c0043f.f115b.f111n != null) {
                    this.f115b.f111n = new Paint(c0043f.f115b.f111n);
                }
                if (c0043f.f115b.f110m != null) {
                    this.f115b.f110m = new Paint(c0043f.f115b.f110m);
                }
                this.f116c = c0043f.f116c;
                this.f117d = c0043f.f117d;
                this.f118e = c0043f.f118e;
            }
        }

        public Paint m101a(ColorFilter colorFilter) {
            if (!m104a() && colorFilter == null) {
                return null;
            }
            if (this.f125l == null) {
                this.f125l = new Paint();
                this.f125l.setFilterBitmap(true);
            }
            this.f125l.setAlpha(this.f115b.getRootAlpha());
            this.f125l.setColorFilter(colorFilter);
            return this.f125l;
        }

        public void m102a(int i, int i2) {
            this.f119f.eraseColor(0);
            this.f115b.m100a(new Canvas(this.f119f), i, i2, null);
        }

        public void m103a(Canvas canvas, ColorFilter colorFilter, Rect rect) {
            canvas.drawBitmap(this.f119f, null, rect, m101a(colorFilter));
        }

        public boolean m104a() {
            return this.f115b.getRootAlpha() < 255;
        }

        public void m105b(int i, int i2) {
            if (this.f119f == null || !m108c(i, i2)) {
                this.f119f = Bitmap.createBitmap(i, i2, Config.ARGB_8888);
                this.f124k = true;
            }
        }

        public boolean m106b() {
            return !this.f124k && this.f120g == this.f116c && this.f121h == this.f117d && this.f123j == this.f118e && this.f122i == this.f115b.getRootAlpha();
        }

        public void m107c() {
            this.f120g = this.f116c;
            this.f121h = this.f117d;
            this.f122i = this.f115b.getRootAlpha();
            this.f123j = this.f118e;
            this.f124k = false;
        }

        public boolean m108c(int i, int i2) {
            return i == this.f119f.getWidth() && i2 == this.f119f.getHeight();
        }

        public int getChangingConfigurations() {
            return this.f114a;
        }

        public Drawable newDrawable() {
            return new C0045i(this);
        }

        public Drawable newDrawable(Resources resources) {
            return new C0045i(this);
        }
    }

    private static class C0044g extends ConstantState {
        private final ConstantState f126a;

        public C0044g(ConstantState constantState) {
            this.f126a = constantState;
        }

        public boolean canApplyTheme() {
            return this.f126a.canApplyTheme();
        }

        public int getChangingConfigurations() {
            return this.f126a.getChangingConfigurations();
        }

        public Drawable newDrawable() {
            Drawable c0045i = new C0045i();
            c0045i.b = (VectorDrawable) this.f126a.newDrawable();
            return c0045i;
        }

        public Drawable newDrawable(Resources resources) {
            Drawable c0045i = new C0045i();
            c0045i.b = (VectorDrawable) this.f126a.newDrawable(resources);
            return c0045i;
        }

        public Drawable newDrawable(Resources resources, Theme theme) {
            Drawable c0045i = new C0045i();
            c0045i.b = (VectorDrawable) this.f126a.newDrawable(resources, theme);
            return c0045i;
        }
    }

    C0045i() {
        this.f132g = true;
        this.f134i = new float[9];
        this.f135j = new Matrix();
        this.f136k = new Rect();
        this.f128c = new C0043f();
    }

    C0045i(C0043f c0043f) {
        this.f132g = true;
        this.f134i = new float[9];
        this.f135j = new Matrix();
        this.f136k = new Rect();
        this.f128c = c0043f;
        this.f129d = m116a(this.f129d, c0043f.f116c, c0043f.f117d);
    }

    static int m109a(int i, float f) {
        return (((int) (((float) Color.alpha(i)) * f)) << 24) | (16777215 & i);
    }

    private static Mode m110a(int i, Mode mode) {
        switch (i) {
            case 3:
                return Mode.SRC_OVER;
            case 5:
                return Mode.SRC_IN;
            case 9:
                return Mode.SRC_ATOP;
            case 14:
                return Mode.MULTIPLY;
            case 15:
                return Mode.SCREEN;
            case 16:
                return VERSION.SDK_INT >= 11 ? Mode.ADD : mode;
            default:
                return mode;
        }
    }

    public static C0045i m111a(Resources resources, int i, Theme theme) {
        if (VERSION.SDK_INT >= 24) {
            C0045i c0045i = new C0045i();
            c0045i.b = C0170b.m869a(resources, i, theme);
            c0045i.f133h = new C0044g(c0045i.b.getConstantState());
            return c0045i;
        }
        try {
            int next;
            XmlPullParser xml = resources.getXml(i);
            AttributeSet asAttributeSet = Xml.asAttributeSet(xml);
            do {
                next = xml.next();
                if (next == 2) {
                    break;
                }
            } while (next != 1);
            if (next == 2) {
                return C0045i.m112a(resources, xml, asAttributeSet, theme);
            }
            throw new XmlPullParserException("No start tag found");
        } catch (Throwable e) {
            Log.e("VectorDrawableCompat", "parser error", e);
            return null;
        } catch (Throwable e2) {
            Log.e("VectorDrawableCompat", "parser error", e2);
            return null;
        }
    }

    public static C0045i m112a(Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet, Theme theme) {
        C0045i c0045i = new C0045i();
        c0045i.inflate(resources, xmlPullParser, attributeSet, theme);
        return c0045i;
    }

    private void m113a(TypedArray typedArray, XmlPullParser xmlPullParser) {
        C0043f c0043f = this.f128c;
        C0042e c0042e = c0043f.f115b;
        c0043f.f117d = C0045i.m110a(C0171c.m872a(typedArray, xmlPullParser, "tintMode", 6, -1), Mode.SRC_IN);
        ColorStateList colorStateList = typedArray.getColorStateList(1);
        if (colorStateList != null) {
            c0043f.f116c = colorStateList;
        }
        c0043f.f118e = C0171c.m875a(typedArray, xmlPullParser, "autoMirrored", 5, c0043f.f118e);
        c0042e.f102d = C0171c.m871a(typedArray, xmlPullParser, "viewportWidth", 7, c0042e.f102d);
        c0042e.f103e = C0171c.m871a(typedArray, xmlPullParser, "viewportHeight", 8, c0042e.f103e);
        if (c0042e.f102d <= 0.0f) {
            throw new XmlPullParserException(typedArray.getPositionDescription() + "<vector> tag requires viewportWidth > 0");
        } else if (c0042e.f103e <= 0.0f) {
            throw new XmlPullParserException(typedArray.getPositionDescription() + "<vector> tag requires viewportHeight > 0");
        } else {
            c0042e.f100b = typedArray.getDimension(3, c0042e.f100b);
            c0042e.f101c = typedArray.getDimension(2, c0042e.f101c);
            if (c0042e.f100b <= 0.0f) {
                throw new XmlPullParserException(typedArray.getPositionDescription() + "<vector> tag requires width > 0");
            } else if (c0042e.f101c <= 0.0f) {
                throw new XmlPullParserException(typedArray.getPositionDescription() + "<vector> tag requires height > 0");
            } else {
                c0042e.setAlpha(C0171c.m871a(typedArray, xmlPullParser, "alpha", 4, c0042e.getAlpha()));
                String string = typedArray.getString(0);
                if (string != null) {
                    c0042e.f105g = string;
                    c0042e.f106h.put(string, c0042e);
                }
            }
        }
    }

    private boolean m114a() {
        return VERSION.SDK_INT >= 17 ? isAutoMirrored() && C0179a.m944g(this) == 1 : false;
    }

    private void m115b(Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet, Theme theme) {
        C0043f c0043f = this.f128c;
        C0042e c0042e = c0043f.f115b;
        Stack stack = new Stack();
        stack.push(c0042e.f99a);
        int eventType = xmlPullParser.getEventType();
        int depth = xmlPullParser.getDepth() + 1;
        Object obj = 1;
        while (eventType != 1 && (xmlPullParser.getDepth() >= depth || eventType != 3)) {
            if (eventType == 2) {
                Object obj2;
                String name = xmlPullParser.getName();
                C0041c c0041c = (C0041c) stack.peek();
                if ("path".equals(name)) {
                    C0040b c0040b = new C0040b();
                    c0040b.m86a(resources, attributeSet, theme, xmlPullParser);
                    c0041c.f85a.add(c0040b);
                    if (c0040b.getPathName() != null) {
                        c0042e.f106h.put(c0040b.getPathName(), c0040b);
                    }
                    obj2 = null;
                    c0043f.f114a = c0040b.o | c0043f.f114a;
                } else if ("clip-path".equals(name)) {
                    C0039a c0039a = new C0039a();
                    c0039a.m81a(resources, attributeSet, theme, xmlPullParser);
                    c0041c.f85a.add(c0039a);
                    if (c0039a.getPathName() != null) {
                        c0042e.f106h.put(c0039a.getPathName(), c0039a);
                    }
                    c0043f.f114a |= c0039a.o;
                    obj2 = obj;
                } else {
                    if ("group".equals(name)) {
                        C0041c c0041c2 = new C0041c();
                        c0041c2.m91a(resources, attributeSet, theme, xmlPullParser);
                        c0041c.f85a.add(c0041c2);
                        stack.push(c0041c2);
                        if (c0041c2.getGroupName() != null) {
                            c0042e.f106h.put(c0041c2.getGroupName(), c0041c2);
                        }
                        c0043f.f114a |= c0041c2.f87c;
                    }
                    obj2 = obj;
                }
                obj = obj2;
            } else if (eventType == 3) {
                if ("group".equals(xmlPullParser.getName())) {
                    stack.pop();
                }
            }
            eventType = xmlPullParser.next();
        }
        if (obj != null) {
            StringBuffer stringBuffer = new StringBuffer();
            if (stringBuffer.length() > 0) {
                stringBuffer.append(" or ");
            }
            stringBuffer.append("path");
            throw new XmlPullParserException("no " + stringBuffer + " defined");
        }
    }

    PorterDuffColorFilter m116a(PorterDuffColorFilter porterDuffColorFilter, ColorStateList colorStateList, Mode mode) {
        return (colorStateList == null || mode == null) ? null : new PorterDuffColorFilter(colorStateList.getColorForState(getState(), 0), mode);
    }

    Object m117a(String str) {
        return this.f128c.f115b.f106h.get(str);
    }

    void m118a(boolean z) {
        this.f132g = z;
    }

    public /* bridge */ /* synthetic */ void applyTheme(Theme theme) {
        super.applyTheme(theme);
    }

    public boolean canApplyTheme() {
        if (this.b != null) {
            C0179a.m941d(this.b);
        }
        return false;
    }

    public /* bridge */ /* synthetic */ void clearColorFilter() {
        super.clearColorFilter();
    }

    public void draw(Canvas canvas) {
        if (this.b != null) {
            this.b.draw(canvas);
            return;
        }
        copyBounds(this.f136k);
        if (this.f136k.width() > 0 && this.f136k.height() > 0) {
            ColorFilter colorFilter = this.f130e == null ? this.f129d : this.f130e;
            canvas.getMatrix(this.f135j);
            this.f135j.getValues(this.f134i);
            float abs = Math.abs(this.f134i[0]);
            float abs2 = Math.abs(this.f134i[4]);
            float abs3 = Math.abs(this.f134i[1]);
            float abs4 = Math.abs(this.f134i[3]);
            if (!(abs3 == 0.0f && abs4 == 0.0f)) {
                abs2 = 1.0f;
                abs = 1.0f;
            }
            int height = (int) (abs2 * ((float) this.f136k.height()));
            int min = Math.min(2048, (int) (abs * ((float) this.f136k.width())));
            height = Math.min(2048, height);
            if (min > 0 && height > 0) {
                int save = canvas.save();
                canvas.translate((float) this.f136k.left, (float) this.f136k.top);
                if (m114a()) {
                    canvas.translate((float) this.f136k.width(), 0.0f);
                    canvas.scale(-1.0f, 1.0f);
                }
                this.f136k.offsetTo(0, 0);
                this.f128c.m105b(min, height);
                if (!this.f132g) {
                    this.f128c.m102a(min, height);
                } else if (!this.f128c.m106b()) {
                    this.f128c.m102a(min, height);
                    this.f128c.m107c();
                }
                this.f128c.m103a(canvas, colorFilter, this.f136k);
                canvas.restoreToCount(save);
            }
        }
    }

    public int getAlpha() {
        return this.b != null ? C0179a.m940c(this.b) : this.f128c.f115b.getRootAlpha();
    }

    public int getChangingConfigurations() {
        return this.b != null ? this.b.getChangingConfigurations() : super.getChangingConfigurations() | this.f128c.getChangingConfigurations();
    }

    public /* bridge */ /* synthetic */ ColorFilter getColorFilter() {
        return super.getColorFilter();
    }

    public ConstantState getConstantState() {
        if (this.b != null && VERSION.SDK_INT >= 24) {
            return new C0044g(this.b.getConstantState());
        }
        this.f128c.f114a = getChangingConfigurations();
        return this.f128c;
    }

    public /* bridge */ /* synthetic */ Drawable getCurrent() {
        return super.getCurrent();
    }

    public int getIntrinsicHeight() {
        return this.b != null ? this.b.getIntrinsicHeight() : (int) this.f128c.f115b.f101c;
    }

    public int getIntrinsicWidth() {
        return this.b != null ? this.b.getIntrinsicWidth() : (int) this.f128c.f115b.f100b;
    }

    public /* bridge */ /* synthetic */ int getMinimumHeight() {
        return super.getMinimumHeight();
    }

    public /* bridge */ /* synthetic */ int getMinimumWidth() {
        return super.getMinimumWidth();
    }

    public int getOpacity() {
        return this.b != null ? this.b.getOpacity() : -3;
    }

    public /* bridge */ /* synthetic */ boolean getPadding(Rect rect) {
        return super.getPadding(rect);
    }

    public /* bridge */ /* synthetic */ int[] getState() {
        return super.getState();
    }

    public /* bridge */ /* synthetic */ Region getTransparentRegion() {
        return super.getTransparentRegion();
    }

    public void inflate(Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet) {
        if (this.b != null) {
            this.b.inflate(resources, xmlPullParser, attributeSet);
        } else {
            inflate(resources, xmlPullParser, attributeSet, null);
        }
    }

    public void inflate(Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet, Theme theme) {
        if (this.b != null) {
            C0179a.m935a(this.b, resources, xmlPullParser, attributeSet, theme);
            return;
        }
        C0043f c0043f = this.f128c;
        c0043f.f115b = new C0042e();
        TypedArray a = C0171c.m873a(resources, theme, attributeSet, C0024a.f39a);
        m113a(a, xmlPullParser);
        a.recycle();
        c0043f.f114a = getChangingConfigurations();
        c0043f.f124k = true;
        m115b(resources, xmlPullParser, attributeSet, theme);
        this.f129d = m116a(this.f129d, c0043f.f116c, c0043f.f117d);
    }

    public void invalidateSelf() {
        if (this.b != null) {
            this.b.invalidateSelf();
        } else {
            super.invalidateSelf();
        }
    }

    public boolean isAutoMirrored() {
        return this.b != null ? C0179a.m938b(this.b) : this.f128c.f118e;
    }

    public boolean isStateful() {
        return this.b != null ? this.b.isStateful() : super.isStateful() || !(this.f128c == null || this.f128c.f116c == null || !this.f128c.f116c.isStateful());
    }

    public /* bridge */ /* synthetic */ void jumpToCurrentState() {
        super.jumpToCurrentState();
    }

    public Drawable mutate() {
        if (this.b != null) {
            this.b.mutate();
        } else if (!this.f131f && super.mutate() == this) {
            this.f128c = new C0043f(this.f128c);
            this.f131f = true;
        }
        return this;
    }

    protected void onBoundsChange(Rect rect) {
        if (this.b != null) {
            this.b.setBounds(rect);
        }
    }

    protected boolean onStateChange(int[] iArr) {
        if (this.b != null) {
            return this.b.setState(iArr);
        }
        C0043f c0043f = this.f128c;
        if (c0043f.f116c == null || c0043f.f117d == null) {
            return false;
        }
        this.f129d = m116a(this.f129d, c0043f.f116c, c0043f.f117d);
        invalidateSelf();
        return true;
    }

    public void scheduleSelf(Runnable runnable, long j) {
        if (this.b != null) {
            this.b.scheduleSelf(runnable, j);
        } else {
            super.scheduleSelf(runnable, j);
        }
    }

    public void setAlpha(int i) {
        if (this.b != null) {
            this.b.setAlpha(i);
        } else if (this.f128c.f115b.getRootAlpha() != i) {
            this.f128c.f115b.setRootAlpha(i);
            invalidateSelf();
        }
    }

    public void setAutoMirrored(boolean z) {
        if (this.b != null) {
            C0179a.m937a(this.b, z);
        } else {
            this.f128c.f118e = z;
        }
    }

    public /* bridge */ /* synthetic */ void setChangingConfigurations(int i) {
        super.setChangingConfigurations(i);
    }

    public /* bridge */ /* synthetic */ void setColorFilter(int i, Mode mode) {
        super.setColorFilter(i, mode);
    }

    public void setColorFilter(ColorFilter colorFilter) {
        if (this.b != null) {
            this.b.setColorFilter(colorFilter);
            return;
        }
        this.f130e = colorFilter;
        invalidateSelf();
    }

    public /* bridge */ /* synthetic */ void setFilterBitmap(boolean z) {
        super.setFilterBitmap(z);
    }

    public /* bridge */ /* synthetic */ void setHotspot(float f, float f2) {
        super.setHotspot(f, f2);
    }

    public /* bridge */ /* synthetic */ void setHotspotBounds(int i, int i2, int i3, int i4) {
        super.setHotspotBounds(i, i2, i3, i4);
    }

    public /* bridge */ /* synthetic */ boolean setState(int[] iArr) {
        return super.setState(iArr);
    }

    public void setTint(int i) {
        if (this.b != null) {
            C0179a.m931a(this.b, i);
        } else {
            setTintList(ColorStateList.valueOf(i));
        }
    }

    public void setTintList(ColorStateList colorStateList) {
        if (this.b != null) {
            C0179a.m933a(this.b, colorStateList);
            return;
        }
        C0043f c0043f = this.f128c;
        if (c0043f.f116c != colorStateList) {
            c0043f.f116c = colorStateList;
            this.f129d = m116a(this.f129d, colorStateList, c0043f.f117d);
            invalidateSelf();
        }
    }

    public void setTintMode(Mode mode) {
        if (this.b != null) {
            C0179a.m936a(this.b, mode);
            return;
        }
        C0043f c0043f = this.f128c;
        if (c0043f.f117d != mode) {
            c0043f.f117d = mode;
            this.f129d = m116a(this.f129d, c0043f.f116c, mode);
            invalidateSelf();
        }
    }

    public boolean setVisible(boolean z, boolean z2) {
        return this.b != null ? this.b.setVisible(z, z2) : super.setVisible(z, z2);
    }

    public void unscheduleSelf(Runnable runnable) {
        if (this.b != null) {
            this.b.unscheduleSelf(runnable);
        } else {
            super.unscheduleSelf(runnable);
        }
    }
}
