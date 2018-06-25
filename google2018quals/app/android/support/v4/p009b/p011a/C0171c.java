package android.support.v4.p009b.p011a;

import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.TypedValue;
import org.xmlpull.v1.XmlPullParser;

public class C0171c {
    public static float m871a(TypedArray typedArray, XmlPullParser xmlPullParser, String str, int i, float f) {
        return !C0171c.m876a(xmlPullParser, str) ? f : typedArray.getFloat(i, f);
    }

    public static int m872a(TypedArray typedArray, XmlPullParser xmlPullParser, String str, int i, int i2) {
        return !C0171c.m876a(xmlPullParser, str) ? i2 : typedArray.getInt(i, i2);
    }

    public static TypedArray m873a(Resources resources, Theme theme, AttributeSet attributeSet, int[] iArr) {
        return theme == null ? resources.obtainAttributes(attributeSet, iArr) : theme.obtainStyledAttributes(attributeSet, iArr, 0, 0);
    }

    public static String m874a(TypedArray typedArray, XmlPullParser xmlPullParser, String str, int i) {
        return !C0171c.m876a(xmlPullParser, str) ? null : typedArray.getString(i);
    }

    public static boolean m875a(TypedArray typedArray, XmlPullParser xmlPullParser, String str, int i, boolean z) {
        return !C0171c.m876a(xmlPullParser, str) ? z : typedArray.getBoolean(i, z);
    }

    public static boolean m876a(XmlPullParser xmlPullParser, String str) {
        return xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", str) != null;
    }

    public static int m877b(TypedArray typedArray, XmlPullParser xmlPullParser, String str, int i, int i2) {
        return !C0171c.m876a(xmlPullParser, str) ? i2 : typedArray.getColor(i, i2);
    }

    public static TypedValue m878b(TypedArray typedArray, XmlPullParser xmlPullParser, String str, int i) {
        return !C0171c.m876a(xmlPullParser, str) ? null : typedArray.peekValue(i);
    }

    public static int m879c(TypedArray typedArray, XmlPullParser xmlPullParser, String str, int i, int i2) {
        return !C0171c.m876a(xmlPullParser, str) ? i2 : typedArray.getResourceId(i, i2);
    }
}
