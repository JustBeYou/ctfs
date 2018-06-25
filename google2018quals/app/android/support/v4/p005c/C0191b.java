package android.support.v4.p005c;

import android.graphics.Path;
import android.support.v7.p020a.C0411a.C0410j;
import android.util.Log;
import java.util.ArrayList;

public class C0191b {

    private static class C0189a {
        int f752a;
        boolean f753b;

        C0189a() {
        }
    }

    public static class C0190b {
        public char f754a;
        public float[] f755b;

        C0190b(char c, float[] fArr) {
            this.f754a = c;
            this.f755b = fArr;
        }

        C0190b(C0190b c0190b) {
            this.f754a = c0190b.f754a;
            this.f755b = C0191b.m973a(c0190b.f755b, 0, c0190b.f755b.length);
        }

        private static void m963a(Path path, double d, double d2, double d3, double d4, double d5, double d6, double d7, double d8, double d9) {
            int ceil = (int) Math.ceil(Math.abs((4.0d * d9) / 3.141592653589793d));
            double cos = Math.cos(d7);
            double sin = Math.sin(d7);
            double cos2 = Math.cos(d8);
            double sin2 = Math.sin(d8);
            double d10 = (((-d3) * cos) * sin2) - ((d4 * sin) * cos2);
            double d11 = d9 / ((double) ceil);
            int i = 0;
            cos2 = (sin2 * ((-d3) * sin)) + (cos2 * (d4 * cos));
            sin2 = d10;
            while (i < ceil) {
                double d12 = d8 + d11;
                d10 = Math.sin(d12);
                double cos3 = Math.cos(d12);
                double d13 = (((d3 * cos) * cos3) + d) - ((d4 * sin) * d10);
                double d14 = ((d4 * cos) * d10) + (((d3 * sin) * cos3) + d2);
                double d15 = (((-d3) * cos) * d10) - ((d4 * sin) * cos3);
                cos3 = (cos3 * (d4 * cos)) + (d10 * ((-d3) * sin));
                d10 = Math.tan((d12 - d8) / 2.0d);
                d10 = ((Math.sqrt((d10 * (3.0d * d10)) + 4.0d) - 1.0d) * Math.sin(d12 - d8)) / 3.0d;
                sin2 = (sin2 * d10) + d5;
                double d16 = d6 + (cos2 * d10);
                double d17 = d13 - (d10 * d15);
                d10 = d14 - (d10 * cos3);
                path.rLineTo(0.0f, 0.0f);
                path.cubicTo((float) sin2, (float) d16, (float) d17, (float) d10, (float) d13, (float) d14);
                i++;
                sin2 = d15;
                d8 = d12;
                d6 = d14;
                d5 = d13;
                cos2 = cos3;
            }
        }

        private static void m964a(Path path, float f, float f2, float f3, float f4, float f5, float f6, float f7, boolean z, boolean z2) {
            double toRadians = Math.toRadians((double) f7);
            double cos = Math.cos(toRadians);
            double sin = Math.sin(toRadians);
            double d = ((((double) f) * cos) + (((double) f2) * sin)) / ((double) f5);
            double d2 = ((((double) (-f)) * sin) + (((double) f2) * cos)) / ((double) f6);
            double d3 = ((((double) f3) * cos) + (((double) f4) * sin)) / ((double) f5);
            double d4 = ((((double) (-f3)) * sin) + (((double) f4) * cos)) / ((double) f6);
            double d5 = d - d3;
            double d6 = d2 - d4;
            double d7 = (d + d3) / 2.0d;
            double d8 = (d2 + d4) / 2.0d;
            double d9 = (d5 * d5) + (d6 * d6);
            if (d9 == 0.0d) {
                Log.w("PathParser", " Points are coincident");
                return;
            }
            double d10 = (1.0d / d9) - 0.25d;
            if (d10 < 0.0d) {
                Log.w("PathParser", "Points are too far apart " + d9);
                float sqrt = (float) (Math.sqrt(d9) / 1.99999d);
                C0190b.m964a(path, f, f2, f3, f4, f5 * sqrt, f6 * sqrt, f7, z, z2);
                return;
            }
            d9 = Math.sqrt(d10);
            d5 *= d9;
            d6 *= d9;
            if (z == z2) {
                d6 = d7 - d6;
                d5 += d8;
            } else {
                d6 += d7;
                d5 = d8 - d5;
            }
            d7 = Math.atan2(d2 - d5, d - d6);
            d4 = Math.atan2(d4 - d5, d3 - d6) - d7;
            if (z2 != (d4 >= 0.0d)) {
                d4 = d4 > 0.0d ? d4 - 6.283185307179586d : d4 + 6.283185307179586d;
            }
            d = ((double) f5) * d6;
            d5 *= (double) f6;
            C0190b.m963a(path, (d * cos) - (d5 * sin), (d * sin) + (d5 * cos), (double) f5, (double) f6, (double) f, (double) f2, toRadians, d7, d4);
        }

        private static void m965a(Path path, float[] fArr, char c, char c2, float[] fArr2) {
            int i;
            float f = fArr[0];
            float f2 = fArr[1];
            float f3 = fArr[2];
            float f4 = fArr[3];
            float f5 = fArr[4];
            float f6 = fArr[5];
            switch (c2) {
                case C0410j.AppCompatTheme_editTextBackground /*65*/:
                case C0410j.AppCompatTheme_textAppearanceListItemSecondary /*97*/:
                    i = 7;
                    break;
                case C0410j.AppCompatTheme_editTextStyle /*67*/:
                case C0410j.AppCompatTheme_textAppearancePopupMenuHeader /*99*/:
                    i = 6;
                    break;
                case C0410j.AppCompatTheme_listMenuViewStyle /*72*/:
                case C0410j.AppCompatTheme_ratingBarStyleIndicator /*86*/:
                case C0410j.AppCompatTheme_textColorSearchUrl /*104*/:
                case C0410j.AppCompatTheme_windowNoTitle /*118*/:
                    i = 1;
                    break;
                case C0410j.AppCompatTheme_listPreferredItemHeightSmall /*76*/:
                case C0410j.AppCompatTheme_listPreferredItemPaddingLeft /*77*/:
                case C0410j.AppCompatTheme_radioButtonStyle /*84*/:
                case C0410j.AppCompatTheme_tooltipFrameBackground /*108*/:
                case C0410j.AppCompatTheme_windowActionBar /*109*/:
                case C0410j.AppCompatTheme_windowMinWidthMajor /*116*/:
                    i = 2;
                    break;
                case C0410j.AppCompatTheme_panelMenuListWidth /*81*/:
                case C0410j.AppCompatTheme_popupWindowStyle /*83*/:
                case C0410j.AppCompatTheme_windowFixedHeightMinor /*113*/:
                case C0410j.AppCompatTheme_windowFixedWidthMinor /*115*/:
                    i = 4;
                    break;
                case C0410j.AppCompatTheme_selectableItemBackground /*90*/:
                case 'z':
                    path.close();
                    path.moveTo(f5, f6);
                    f4 = f6;
                    f3 = f5;
                    f2 = f6;
                    f = f5;
                    i = 2;
                    break;
                default:
                    i = 2;
                    break;
            }
            int i2 = 0;
            float f7 = f6;
            float f8 = f5;
            float f9 = f2;
            float f10 = f;
            while (i2 < fArr2.length) {
                float f11;
                switch (c2) {
                    case C0410j.AppCompatTheme_editTextBackground /*65*/:
                        C0190b.m964a(path, f10, f9, fArr2[i2 + 5], fArr2[i2 + 6], fArr2[i2 + 0], fArr2[i2 + 1], fArr2[i2 + 2], fArr2[i2 + 3] != 0.0f, fArr2[i2 + 4] != 0.0f);
                        f3 = fArr2[i2 + 5];
                        f4 = fArr2[i2 + 6];
                        f6 = f7;
                        f5 = f8;
                        f2 = f3;
                        f = f4;
                        f11 = f3;
                        f3 = f4;
                        break;
                    case C0410j.AppCompatTheme_editTextStyle /*67*/:
                        path.cubicTo(fArr2[i2 + 0], fArr2[i2 + 1], fArr2[i2 + 2], fArr2[i2 + 3], fArr2[i2 + 4], fArr2[i2 + 5]);
                        f5 = fArr2[i2 + 4];
                        f6 = fArr2[i2 + 5];
                        f2 = fArr2[i2 + 2];
                        f = f6;
                        f11 = f5;
                        f6 = f7;
                        f5 = f8;
                        f3 = fArr2[i2 + 3];
                        break;
                    case C0410j.AppCompatTheme_listMenuViewStyle /*72*/:
                        path.lineTo(fArr2[i2 + 0], f9);
                        f6 = f7;
                        f2 = f3;
                        f = f9;
                        f11 = fArr2[i2 + 0];
                        f3 = f4;
                        f5 = f8;
                        break;
                    case C0410j.AppCompatTheme_listPreferredItemHeightSmall /*76*/:
                        path.lineTo(fArr2[i2 + 0], fArr2[i2 + 1]);
                        f5 = fArr2[i2 + 0];
                        f2 = f3;
                        f = fArr2[i2 + 1];
                        f11 = f5;
                        f6 = f7;
                        f5 = f8;
                        f3 = f4;
                        break;
                    case C0410j.AppCompatTheme_listPreferredItemPaddingLeft /*77*/:
                        f5 = fArr2[i2 + 0];
                        f6 = fArr2[i2 + 1];
                        if (i2 <= 0) {
                            path.moveTo(fArr2[i2 + 0], fArr2[i2 + 1]);
                            f2 = f3;
                            f = f6;
                            f11 = f5;
                            f3 = f4;
                            break;
                        }
                        path.lineTo(fArr2[i2 + 0], fArr2[i2 + 1]);
                        f2 = f3;
                        f = f6;
                        f11 = f5;
                        f6 = f7;
                        f5 = f8;
                        f3 = f4;
                        break;
                    case C0410j.AppCompatTheme_panelMenuListWidth /*81*/:
                        path.quadTo(fArr2[i2 + 0], fArr2[i2 + 1], fArr2[i2 + 2], fArr2[i2 + 3]);
                        f3 = fArr2[i2 + 0];
                        f4 = fArr2[i2 + 1];
                        f5 = fArr2[i2 + 2];
                        f2 = f3;
                        f = fArr2[i2 + 3];
                        f11 = f5;
                        f6 = f7;
                        f5 = f8;
                        f3 = f4;
                        break;
                    case C0410j.AppCompatTheme_popupWindowStyle /*83*/:
                        if (c == 'c' || c == 's' || c == 'C' || c == 'S') {
                            f6 = (2.0f * f10) - f3;
                            f3 = (2.0f * f9) - f4;
                        } else {
                            f3 = f9;
                            f6 = f10;
                        }
                        path.cubicTo(f6, f3, fArr2[i2 + 0], fArr2[i2 + 1], fArr2[i2 + 2], fArr2[i2 + 3]);
                        f3 = fArr2[i2 + 0];
                        f4 = fArr2[i2 + 1];
                        f5 = fArr2[i2 + 2];
                        f2 = f3;
                        f = fArr2[i2 + 3];
                        f11 = f5;
                        f6 = f7;
                        f5 = f8;
                        f3 = f4;
                        break;
                    case C0410j.AppCompatTheme_radioButtonStyle /*84*/:
                        if (c == 'q' || c == 't' || c == 'Q' || c == 'T') {
                            f10 = (2.0f * f10) - f3;
                            f9 = (2.0f * f9) - f4;
                        }
                        path.quadTo(f10, f9, fArr2[i2 + 0], fArr2[i2 + 1]);
                        f5 = fArr2[i2 + 0];
                        f3 = f9;
                        f2 = f10;
                        f = fArr2[i2 + 1];
                        f11 = f5;
                        f6 = f7;
                        f5 = f8;
                        break;
                    case C0410j.AppCompatTheme_ratingBarStyleIndicator /*86*/:
                        path.lineTo(f10, fArr2[i2 + 0]);
                        f5 = f8;
                        f2 = f3;
                        f = fArr2[i2 + 0];
                        f11 = f10;
                        f3 = f4;
                        f6 = f7;
                        break;
                    case C0410j.AppCompatTheme_textAppearanceListItemSecondary /*97*/:
                        C0190b.m964a(path, f10, f9, fArr2[i2 + 5] + f10, fArr2[i2 + 6] + f9, fArr2[i2 + 0], fArr2[i2 + 1], fArr2[i2 + 2], fArr2[i2 + 3] != 0.0f, fArr2[i2 + 4] != 0.0f);
                        f3 = f10 + fArr2[i2 + 5];
                        f4 = fArr2[i2 + 6] + f9;
                        f6 = f7;
                        f5 = f8;
                        f2 = f3;
                        f = f4;
                        f11 = f3;
                        f3 = f4;
                        break;
                    case C0410j.AppCompatTheme_textAppearancePopupMenuHeader /*99*/:
                        path.rCubicTo(fArr2[i2 + 0], fArr2[i2 + 1], fArr2[i2 + 2], fArr2[i2 + 3], fArr2[i2 + 4], fArr2[i2 + 5]);
                        f2 = f10 + fArr2[i2 + 2];
                        f = fArr2[i2 + 5] + f9;
                        f11 = f10 + fArr2[i2 + 4];
                        f6 = f7;
                        f5 = f8;
                        f3 = fArr2[i2 + 3] + f9;
                        break;
                    case C0410j.AppCompatTheme_textColorSearchUrl /*104*/:
                        path.rLineTo(fArr2[i2 + 0], 0.0f);
                        f6 = f7;
                        f2 = f3;
                        f = f9;
                        f11 = f10 + fArr2[i2 + 0];
                        f3 = f4;
                        f5 = f8;
                        break;
                    case C0410j.AppCompatTheme_tooltipFrameBackground /*108*/:
                        path.rLineTo(fArr2[i2 + 0], fArr2[i2 + 1]);
                        f2 = f3;
                        f = fArr2[i2 + 1] + f9;
                        f11 = f10 + fArr2[i2 + 0];
                        f6 = f7;
                        f5 = f8;
                        f3 = f4;
                        break;
                    case C0410j.AppCompatTheme_windowActionBar /*109*/:
                        f5 = f10 + fArr2[i2 + 0];
                        f6 = fArr2[i2 + 1] + f9;
                        if (i2 <= 0) {
                            path.rMoveTo(fArr2[i2 + 0], fArr2[i2 + 1]);
                            f2 = f3;
                            f = f6;
                            f11 = f5;
                            f3 = f4;
                            break;
                        }
                        path.rLineTo(fArr2[i2 + 0], fArr2[i2 + 1]);
                        f2 = f3;
                        f = f6;
                        f11 = f5;
                        f6 = f7;
                        f5 = f8;
                        f3 = f4;
                        break;
                    case C0410j.AppCompatTheme_windowFixedHeightMinor /*113*/:
                        path.rQuadTo(fArr2[i2 + 0], fArr2[i2 + 1], fArr2[i2 + 2], fArr2[i2 + 3]);
                        f2 = f10 + fArr2[i2 + 0];
                        f = fArr2[i2 + 3] + f9;
                        f11 = f10 + fArr2[i2 + 2];
                        f6 = f7;
                        f5 = f8;
                        f3 = fArr2[i2 + 1] + f9;
                        break;
                    case C0410j.AppCompatTheme_windowFixedWidthMinor /*115*/:
                        if (c == 'c' || c == 's' || c == 'C' || c == 'S') {
                            f6 = f10 - f3;
                            f3 = f9 - f4;
                        } else {
                            f3 = 0.0f;
                            f6 = 0.0f;
                        }
                        path.rCubicTo(f6, f3, fArr2[i2 + 0], fArr2[i2 + 1], fArr2[i2 + 2], fArr2[i2 + 3]);
                        f2 = f10 + fArr2[i2 + 0];
                        f = fArr2[i2 + 3] + f9;
                        f11 = f10 + fArr2[i2 + 2];
                        f6 = f7;
                        f5 = f8;
                        f3 = fArr2[i2 + 1] + f9;
                        break;
                    case C0410j.AppCompatTheme_windowMinWidthMajor /*116*/:
                        if (c == 'q' || c == 't' || c == 'Q' || c == 'T') {
                            f6 = f10 - f3;
                            f4 = f9 - f4;
                        } else {
                            f4 = 0.0f;
                            f6 = 0.0f;
                        }
                        path.rQuadTo(f6, f4, fArr2[i2 + 0], fArr2[i2 + 1]);
                        f2 = f10 + f6;
                        f = fArr2[i2 + 1] + f9;
                        f11 = f10 + fArr2[i2 + 0];
                        f6 = f7;
                        f5 = f8;
                        f3 = f4 + f9;
                        break;
                    case C0410j.AppCompatTheme_windowNoTitle /*118*/:
                        path.rLineTo(0.0f, fArr2[i2 + 0]);
                        f5 = f8;
                        f2 = f3;
                        f = fArr2[i2 + 0] + f9;
                        f11 = f10;
                        f3 = f4;
                        f6 = f7;
                        break;
                    default:
                        f6 = f7;
                        f5 = f8;
                        f2 = f3;
                        f = f9;
                        f11 = f10;
                        f3 = f4;
                        break;
                }
                i2 += i;
                f7 = f6;
                f8 = f5;
                f9 = f;
                f10 = f11;
                c = c2;
                f4 = f3;
                f3 = f2;
            }
            fArr[0] = f10;
            fArr[1] = f9;
            fArr[2] = f3;
            fArr[3] = f4;
            fArr[4] = f8;
            fArr[5] = f7;
        }

        public static void m966a(C0190b[] c0190bArr, Path path) {
            float[] fArr = new float[6];
            char c = 'm';
            for (int i = 0; i < c0190bArr.length; i++) {
                C0190b.m965a(path, fArr, c, c0190bArr[i].f754a, c0190bArr[i].f755b);
                c = c0190bArr[i].f754a;
            }
        }

        public void m967a(C0190b c0190b, C0190b c0190b2, float f) {
            for (int i = 0; i < c0190b.f755b.length; i++) {
                this.f755b[i] = (c0190b.f755b[i] * (1.0f - f)) + (c0190b2.f755b[i] * f);
            }
        }
    }

    private static int m968a(String str, int i) {
        while (i < str.length()) {
            char charAt = str.charAt(i);
            if (((charAt - 65) * (charAt - 90) <= 0 || (charAt - 97) * (charAt - 122) <= 0) && charAt != 'e' && charAt != 'E') {
                break;
            }
            i++;
        }
        return i;
    }

    public static Path m969a(String str) {
        Path path = new Path();
        C0190b[] b = C0191b.m976b(str);
        if (b == null) {
            return null;
        }
        try {
            C0190b.m966a(b, path);
            return path;
        } catch (Throwable e) {
            throw new RuntimeException("Error in parsing " + str, e);
        }
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static void m970a(java.lang.String r7, int r8, android.support.v4.p005c.C0191b.C0189a r9) {
        /*
        r1 = 0;
        r5 = 1;
        r9.f753b = r1;
        r0 = r1;
        r2 = r1;
        r3 = r1;
        r4 = r8;
    L_0x0008:
        r6 = r7.length();
        if (r4 >= r6) goto L_0x0018;
    L_0x000e:
        r6 = r7.charAt(r4);
        switch(r6) {
            case 32: goto L_0x001b;
            case 44: goto L_0x001b;
            case 45: goto L_0x001e;
            case 46: goto L_0x0027;
            case 69: goto L_0x0031;
            case 101: goto L_0x0031;
            default: goto L_0x0015;
        };
    L_0x0015:
        r0 = r1;
    L_0x0016:
        if (r3 == 0) goto L_0x0033;
    L_0x0018:
        r9.f752a = r4;
        return;
    L_0x001b:
        r0 = r1;
        r3 = r5;
        goto L_0x0016;
    L_0x001e:
        if (r4 == r8) goto L_0x0015;
    L_0x0020:
        if (r0 != 0) goto L_0x0015;
    L_0x0022:
        r9.f753b = r5;
        r0 = r1;
        r3 = r5;
        goto L_0x0016;
    L_0x0027:
        if (r2 != 0) goto L_0x002c;
    L_0x0029:
        r0 = r1;
        r2 = r5;
        goto L_0x0016;
    L_0x002c:
        r9.f753b = r5;
        r0 = r1;
        r3 = r5;
        goto L_0x0016;
    L_0x0031:
        r0 = r5;
        goto L_0x0016;
    L_0x0033:
        r4 = r4 + 1;
        goto L_0x0008;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.c.b.a(java.lang.String, int, android.support.v4.c.b$a):void");
    }

    private static void m971a(ArrayList<C0190b> arrayList, char c, float[] fArr) {
        arrayList.add(new C0190b(c, fArr));
    }

    public static boolean m972a(C0190b[] c0190bArr, C0190b[] c0190bArr2) {
        if (c0190bArr == null || c0190bArr2 == null || c0190bArr.length != c0190bArr2.length) {
            return false;
        }
        int i = 0;
        while (i < c0190bArr.length) {
            if (c0190bArr[i].f754a != c0190bArr2[i].f754a || c0190bArr[i].f755b.length != c0190bArr2[i].f755b.length) {
                return false;
            }
            i++;
        }
        return true;
    }

    static float[] m973a(float[] fArr, int i, int i2) {
        if (i > i2) {
            throw new IllegalArgumentException();
        }
        int length = fArr.length;
        if (i < 0 || i > length) {
            throw new ArrayIndexOutOfBoundsException();
        }
        int i3 = i2 - i;
        length = Math.min(i3, length - i);
        Object obj = new float[i3];
        System.arraycopy(fArr, i, obj, 0, length);
        return obj;
    }

    public static C0190b[] m974a(C0190b[] c0190bArr) {
        if (c0190bArr == null) {
            return null;
        }
        C0190b[] c0190bArr2 = new C0190b[c0190bArr.length];
        for (int i = 0; i < c0190bArr.length; i++) {
            c0190bArr2[i] = new C0190b(c0190bArr[i]);
        }
        return c0190bArr2;
    }

    public static void m975b(C0190b[] c0190bArr, C0190b[] c0190bArr2) {
        for (int i = 0; i < c0190bArr2.length; i++) {
            c0190bArr[i].f754a = c0190bArr2[i].f754a;
            for (int i2 = 0; i2 < c0190bArr2[i].f755b.length; i2++) {
                c0190bArr[i].f755b[i2] = c0190bArr2[i].f755b[i2];
            }
        }
    }

    public static C0190b[] m976b(String str) {
        if (str == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        int i = 1;
        int i2 = 0;
        while (i < str.length()) {
            int a = C0191b.m968a(str, i);
            String trim = str.substring(i2, a).trim();
            if (trim.length() > 0) {
                C0191b.m971a(arrayList, trim.charAt(0), C0191b.m977c(trim));
            }
            i = a + 1;
            i2 = a;
        }
        if (i - i2 == 1 && i2 < str.length()) {
            C0191b.m971a(arrayList, str.charAt(i2), new float[0]);
        }
        return (C0190b[]) arrayList.toArray(new C0190b[arrayList.size()]);
    }

    private static float[] m977c(String str) {
        int i = 0;
        if (str.charAt(0) == 'z' || str.charAt(0) == 'Z') {
            return new float[0];
        }
        try {
            float[] fArr = new float[str.length()];
            C0189a c0189a = new C0189a();
            int length = str.length();
            int i2 = 1;
            while (i2 < length) {
                int i3;
                C0191b.m970a(str, i2, c0189a);
                int i4 = c0189a.f752a;
                if (i2 < i4) {
                    i3 = i + 1;
                    fArr[i] = Float.parseFloat(str.substring(i2, i4));
                } else {
                    i3 = i;
                }
                if (c0189a.f753b) {
                    i2 = i4;
                    i = i3;
                } else {
                    i2 = i4 + 1;
                    i = i3;
                }
            }
            return C0191b.m973a(fArr, 0, i);
        } catch (Throwable e) {
            throw new RuntimeException("error in parsing \"" + str + "\"", e);
        }
    }
}
