package android.support.v4.p009b.p011a;

import android.content.res.Resources;
import android.content.res.TypedArray;
import android.support.p002a.C0023a.C0022a;
import android.support.v4.p015f.C0212a;
import android.util.Base64;
import android.util.Xml;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

public class C0169a {

    public interface C0165a {
    }

    public static final class C0166b implements C0165a {
        private final C0167c[] f718a;

        public C0166b(C0167c[] c0167cArr) {
            this.f718a = c0167cArr;
        }

        public C0167c[] m852a() {
            return this.f718a;
        }
    }

    public static final class C0167c {
        private final String f719a;
        private int f720b;
        private boolean f721c;
        private int f722d;

        public C0167c(String str, int i, boolean z, int i2) {
            this.f719a = str;
            this.f720b = i;
            this.f721c = z;
            this.f722d = i2;
        }

        public String m853a() {
            return this.f719a;
        }

        public int m854b() {
            return this.f720b;
        }

        public boolean m855c() {
            return this.f721c;
        }

        public int m856d() {
            return this.f722d;
        }
    }

    public static final class C0168d implements C0165a {
        private final C0212a f723a;
        private final int f724b;
        private final int f725c;

        public C0168d(C0212a c0212a, int i, int i2) {
            this.f723a = c0212a;
            this.f725c = i;
            this.f724b = i2;
        }

        public C0212a m857a() {
            return this.f723a;
        }

        public int m858b() {
            return this.f725c;
        }

        public int m859c() {
            return this.f724b;
        }
    }

    public static C0165a m860a(XmlPullParser xmlPullParser, Resources resources) {
        int next;
        do {
            next = xmlPullParser.next();
            if (next == 2) {
                break;
            }
        } while (next != 1);
        if (next == 2) {
            return C0169a.m864b(xmlPullParser, resources);
        }
        throw new XmlPullParserException("No start tag found");
    }

    public static List<List<byte[]>> m861a(Resources resources, int i) {
        List<List<byte[]>> list = null;
        if (i != 0) {
            TypedArray obtainTypedArray = resources.obtainTypedArray(i);
            if (obtainTypedArray.length() > 0) {
                List<List<byte[]>> arrayList = new ArrayList();
                if ((obtainTypedArray.getResourceId(0, 0) != 0 ? 1 : 0) != 0) {
                    for (int i2 = 0; i2 < obtainTypedArray.length(); i2++) {
                        arrayList.add(C0169a.m862a(resources.getStringArray(obtainTypedArray.getResourceId(i2, 0))));
                    }
                    list = arrayList;
                } else {
                    arrayList.add(C0169a.m862a(resources.getStringArray(i)));
                    list = arrayList;
                }
            }
            obtainTypedArray.recycle();
        }
        return list != null ? list : Collections.emptyList();
    }

    private static List<byte[]> m862a(String[] strArr) {
        List<byte[]> arrayList = new ArrayList();
        for (String decode : strArr) {
            arrayList.add(Base64.decode(decode, 0));
        }
        return arrayList;
    }

    private static void m863a(XmlPullParser xmlPullParser) {
        int i = 1;
        while (i > 0) {
            switch (xmlPullParser.next()) {
                case 2:
                    i++;
                    break;
                case 3:
                    i--;
                    break;
                default:
                    break;
            }
        }
    }

    private static C0165a m864b(XmlPullParser xmlPullParser, Resources resources) {
        xmlPullParser.require(2, null, "font-family");
        if (xmlPullParser.getName().equals("font-family")) {
            return C0169a.m865c(xmlPullParser, resources);
        }
        C0169a.m863a(xmlPullParser);
        return null;
    }

    private static C0165a m865c(XmlPullParser xmlPullParser, Resources resources) {
        TypedArray obtainAttributes = resources.obtainAttributes(Xml.asAttributeSet(xmlPullParser), C0022a.FontFamily);
        String string = obtainAttributes.getString(C0022a.FontFamily_fontProviderAuthority);
        String string2 = obtainAttributes.getString(C0022a.FontFamily_fontProviderPackage);
        String string3 = obtainAttributes.getString(C0022a.FontFamily_fontProviderQuery);
        int resourceId = obtainAttributes.getResourceId(C0022a.FontFamily_fontProviderCerts, 0);
        int integer = obtainAttributes.getInteger(C0022a.FontFamily_fontProviderFetchStrategy, 1);
        int integer2 = obtainAttributes.getInteger(C0022a.FontFamily_fontProviderFetchTimeout, 500);
        obtainAttributes.recycle();
        if (string == null || string2 == null || string3 == null) {
            List arrayList = new ArrayList();
            while (xmlPullParser.next() != 3) {
                if (xmlPullParser.getEventType() == 2) {
                    if (xmlPullParser.getName().equals("font")) {
                        arrayList.add(C0169a.m866d(xmlPullParser, resources));
                    } else {
                        C0169a.m863a(xmlPullParser);
                    }
                }
            }
            return arrayList.isEmpty() ? null : new C0166b((C0167c[]) arrayList.toArray(new C0167c[arrayList.size()]));
        } else {
            while (xmlPullParser.next() != 3) {
                C0169a.m863a(xmlPullParser);
            }
            return new C0168d(new C0212a(string, string2, string3, C0169a.m861a(resources, resourceId)), integer, integer2);
        }
    }

    private static C0167c m866d(XmlPullParser xmlPullParser, Resources resources) {
        boolean z = true;
        TypedArray obtainAttributes = resources.obtainAttributes(Xml.asAttributeSet(xmlPullParser), C0022a.FontFamilyFont);
        int i = obtainAttributes.getInt(C0022a.FontFamilyFont_fontWeight, 400);
        if (1 != obtainAttributes.getInt(C0022a.FontFamilyFont_fontStyle, 0)) {
            z = false;
        }
        int resourceId = obtainAttributes.getResourceId(C0022a.FontFamilyFont_font, 0);
        String string = obtainAttributes.getString(C0022a.FontFamilyFont_font);
        obtainAttributes.recycle();
        while (xmlPullParser.next() != 3) {
            C0169a.m863a(xmlPullParser);
        }
        return new C0167c(string, i, z, resourceId);
    }
}
