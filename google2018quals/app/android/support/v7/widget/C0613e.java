package android.support.v7.widget;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.database.DataSetObservable;
import android.os.AsyncTask;
import android.text.TextUtils;
import android.util.Log;
import android.util.Xml;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlSerializer;

class C0613e extends DataSetObservable {
    static final String f2218a = C0613e.class.getSimpleName();
    private static final Object f2219e = new Object();
    private static final Map<String, C0613e> f2220f = new HashMap();
    final Context f2221b;
    final String f2222c;
    boolean f2223d;
    private final Object f2224g;
    private final List<C0608a> f2225h;
    private final List<C0610c> f2226i;
    private Intent f2227j;
    private C0609b f2228k;
    private int f2229l;
    private boolean f2230m;
    private boolean f2231n;
    private boolean f2232o;
    private C0611d f2233p;

    public static final class C0608a implements Comparable<C0608a> {
        public final ResolveInfo f2212a;
        public float f2213b;

        public C0608a(ResolveInfo resolveInfo) {
            this.f2212a = resolveInfo;
        }

        public int m3077a(C0608a c0608a) {
            return Float.floatToIntBits(c0608a.f2213b) - Float.floatToIntBits(this.f2213b);
        }

        public /* synthetic */ int compareTo(Object obj) {
            return m3077a((C0608a) obj);
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj == null) {
                return false;
            }
            if (getClass() != obj.getClass()) {
                return false;
            }
            return Float.floatToIntBits(this.f2213b) == Float.floatToIntBits(((C0608a) obj).f2213b);
        }

        public int hashCode() {
            return Float.floatToIntBits(this.f2213b) + 31;
        }

        public String toString() {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("[");
            stringBuilder.append("resolveInfo:").append(this.f2212a.toString());
            stringBuilder.append("; weight:").append(new BigDecimal((double) this.f2213b));
            stringBuilder.append("]");
            return stringBuilder.toString();
        }
    }

    public interface C0609b {
        void m3078a(Intent intent, List<C0608a> list, List<C0610c> list2);
    }

    public static final class C0610c {
        public final ComponentName f2214a;
        public final long f2215b;
        public final float f2216c;

        public C0610c(ComponentName componentName, long j, float f) {
            this.f2214a = componentName;
            this.f2215b = j;
            this.f2216c = f;
        }

        public C0610c(String str, long j, float f) {
            this(ComponentName.unflattenFromString(str), j, f);
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj == null) {
                return false;
            }
            if (getClass() != obj.getClass()) {
                return false;
            }
            C0610c c0610c = (C0610c) obj;
            if (this.f2214a == null) {
                if (c0610c.f2214a != null) {
                    return false;
                }
            } else if (!this.f2214a.equals(c0610c.f2214a)) {
                return false;
            }
            return this.f2215b != c0610c.f2215b ? false : Float.floatToIntBits(this.f2216c) == Float.floatToIntBits(c0610c.f2216c);
        }

        public int hashCode() {
            return (((((this.f2214a == null ? 0 : this.f2214a.hashCode()) + 31) * 31) + ((int) (this.f2215b ^ (this.f2215b >>> 32)))) * 31) + Float.floatToIntBits(this.f2216c);
        }

        public String toString() {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("[");
            stringBuilder.append("; activity:").append(this.f2214a);
            stringBuilder.append("; time:").append(this.f2215b);
            stringBuilder.append("; weight:").append(new BigDecimal((double) this.f2216c));
            stringBuilder.append("]");
            return stringBuilder.toString();
        }
    }

    public interface C0611d {
        boolean m3079a(C0613e c0613e, Intent intent);
    }

    private final class C0612e extends AsyncTask<Object, Void, Void> {
        final /* synthetic */ C0613e f2217a;

        C0612e(C0613e c0613e) {
            this.f2217a = c0613e;
        }

        public Void m3080a(Object... objArr) {
            int i = 0;
            List list = (List) objArr[0];
            String str = (String) objArr[1];
            try {
                OutputStream openFileOutput = this.f2217a.f2221b.openFileOutput(str, 0);
                XmlSerializer newSerializer = Xml.newSerializer();
                try {
                    newSerializer.setOutput(openFileOutput, null);
                    newSerializer.startDocument("UTF-8", Boolean.valueOf(true));
                    newSerializer.startTag(null, "historical-records");
                    int size = list.size();
                    while (i < size) {
                        C0610c c0610c = (C0610c) list.remove(0);
                        newSerializer.startTag(null, "historical-record");
                        newSerializer.attribute(null, "activity", c0610c.f2214a.flattenToString());
                        newSerializer.attribute(null, "time", String.valueOf(c0610c.f2215b));
                        newSerializer.attribute(null, "weight", String.valueOf(c0610c.f2216c));
                        newSerializer.endTag(null, "historical-record");
                        i++;
                    }
                    newSerializer.endTag(null, "historical-records");
                    newSerializer.endDocument();
                    this.f2217a.f2223d = true;
                    if (openFileOutput != null) {
                        try {
                            openFileOutput.close();
                        } catch (IOException e) {
                        }
                    }
                } catch (Throwable e2) {
                    Log.e(C0613e.f2218a, "Error writing historical record file: " + this.f2217a.f2222c, e2);
                    this.f2217a.f2223d = true;
                    if (openFileOutput != null) {
                        try {
                            openFileOutput.close();
                        } catch (IOException e3) {
                        }
                    }
                } catch (Throwable e22) {
                    Log.e(C0613e.f2218a, "Error writing historical record file: " + this.f2217a.f2222c, e22);
                    this.f2217a.f2223d = true;
                    if (openFileOutput != null) {
                        try {
                            openFileOutput.close();
                        } catch (IOException e4) {
                        }
                    }
                } catch (Throwable e222) {
                    Log.e(C0613e.f2218a, "Error writing historical record file: " + this.f2217a.f2222c, e222);
                    this.f2217a.f2223d = true;
                    if (openFileOutput != null) {
                        try {
                            openFileOutput.close();
                        } catch (IOException e5) {
                        }
                    }
                } catch (Throwable th) {
                    this.f2217a.f2223d = true;
                    if (openFileOutput != null) {
                        try {
                            openFileOutput.close();
                        } catch (IOException e6) {
                        }
                    }
                }
            } catch (Throwable e2222) {
                Log.e(C0613e.f2218a, "Error writing historical record file: " + str, e2222);
            }
            return null;
        }

        public /* synthetic */ Object doInBackground(Object[] objArr) {
            return m3080a(objArr);
        }
    }

    private boolean m3081a(C0610c c0610c) {
        boolean add = this.f2226i.add(c0610c);
        if (add) {
            this.f2231n = true;
            m3087h();
            m3082c();
            m3084e();
            notifyChanged();
        }
        return add;
    }

    private void m3082c() {
        if (!this.f2230m) {
            throw new IllegalStateException("No preceding call to #readHistoricalData");
        } else if (this.f2231n) {
            this.f2231n = false;
            if (!TextUtils.isEmpty(this.f2222c)) {
                new C0612e(this).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Object[]{new ArrayList(this.f2226i), this.f2222c});
            }
        }
    }

    private void m3083d() {
        int f = m3085f() | m3086g();
        m3087h();
        if (f != 0) {
            m3084e();
            notifyChanged();
        }
    }

    private boolean m3084e() {
        if (this.f2228k == null || this.f2227j == null || this.f2225h.isEmpty() || this.f2226i.isEmpty()) {
            return false;
        }
        this.f2228k.m3078a(this.f2227j, this.f2225h, Collections.unmodifiableList(this.f2226i));
        return true;
    }

    private boolean m3085f() {
        if (!this.f2232o || this.f2227j == null) {
            return false;
        }
        this.f2232o = false;
        this.f2225h.clear();
        List queryIntentActivities = this.f2221b.getPackageManager().queryIntentActivities(this.f2227j, 0);
        int size = queryIntentActivities.size();
        for (int i = 0; i < size; i++) {
            this.f2225h.add(new C0608a((ResolveInfo) queryIntentActivities.get(i)));
        }
        return true;
    }

    private boolean m3086g() {
        if (!this.f2223d || !this.f2231n || TextUtils.isEmpty(this.f2222c)) {
            return false;
        }
        this.f2223d = false;
        this.f2230m = true;
        m3088i();
        return true;
    }

    private void m3087h() {
        int size = this.f2226i.size() - this.f2229l;
        if (size > 0) {
            this.f2231n = true;
            for (int i = 0; i < size; i++) {
                C0610c c0610c = (C0610c) this.f2226i.remove(0);
            }
        }
    }

    private void m3088i() {
        try {
            InputStream openFileInput = this.f2221b.openFileInput(this.f2222c);
            try {
                XmlPullParser newPullParser = Xml.newPullParser();
                newPullParser.setInput(openFileInput, "UTF-8");
                int i = 0;
                while (i != 1 && i != 2) {
                    i = newPullParser.next();
                }
                if ("historical-records".equals(newPullParser.getName())) {
                    List list = this.f2226i;
                    list.clear();
                    while (true) {
                        int next = newPullParser.next();
                        if (next == 1) {
                            break;
                        } else if (!(next == 3 || next == 4)) {
                            if ("historical-record".equals(newPullParser.getName())) {
                                list.add(new C0610c(newPullParser.getAttributeValue(null, "activity"), Long.parseLong(newPullParser.getAttributeValue(null, "time")), Float.parseFloat(newPullParser.getAttributeValue(null, "weight"))));
                            } else {
                                throw new XmlPullParserException("Share records file not well-formed.");
                            }
                        }
                    }
                    if (openFileInput != null) {
                        try {
                            openFileInput.close();
                            return;
                        } catch (IOException e) {
                            return;
                        }
                    }
                    return;
                }
                throw new XmlPullParserException("Share records file does not start with historical-records tag.");
            } catch (Throwable e2) {
                Log.e(f2218a, "Error reading historical recrod file: " + this.f2222c, e2);
                if (openFileInput != null) {
                    try {
                        openFileInput.close();
                    } catch (IOException e3) {
                    }
                }
            } catch (Throwable e22) {
                Log.e(f2218a, "Error reading historical recrod file: " + this.f2222c, e22);
                if (openFileInput != null) {
                    try {
                        openFileInput.close();
                    } catch (IOException e4) {
                    }
                }
            } catch (Throwable th) {
                if (openFileInput != null) {
                    try {
                        openFileInput.close();
                    } catch (IOException e5) {
                    }
                }
            }
        } catch (FileNotFoundException e6) {
        }
    }

    public int m3089a() {
        int size;
        synchronized (this.f2224g) {
            m3083d();
            size = this.f2225h.size();
        }
        return size;
    }

    public int m3090a(ResolveInfo resolveInfo) {
        synchronized (this.f2224g) {
            m3083d();
            List list = this.f2225h;
            int size = list.size();
            for (int i = 0; i < size; i++) {
                if (((C0608a) list.get(i)).f2212a == resolveInfo) {
                    return i;
                }
            }
            return -1;
        }
    }

    public ResolveInfo m3091a(int i) {
        ResolveInfo resolveInfo;
        synchronized (this.f2224g) {
            m3083d();
            resolveInfo = ((C0608a) this.f2225h.get(i)).f2212a;
        }
        return resolveInfo;
    }

    public Intent m3092b(int i) {
        synchronized (this.f2224g) {
            if (this.f2227j == null) {
                return null;
            }
            m3083d();
            C0608a c0608a = (C0608a) this.f2225h.get(i);
            ComponentName componentName = new ComponentName(c0608a.f2212a.activityInfo.packageName, c0608a.f2212a.activityInfo.name);
            Intent intent = new Intent(this.f2227j);
            intent.setComponent(componentName);
            if (this.f2233p != null) {
                if (this.f2233p.m3079a(this, new Intent(intent))) {
                    return null;
                }
            }
            m3081a(new C0610c(componentName, System.currentTimeMillis(), 1.0f));
            return intent;
        }
    }

    public ResolveInfo m3093b() {
        synchronized (this.f2224g) {
            m3083d();
            if (this.f2225h.isEmpty()) {
                return null;
            }
            ResolveInfo resolveInfo = ((C0608a) this.f2225h.get(0)).f2212a;
            return resolveInfo;
        }
    }

    public void m3094c(int i) {
        synchronized (this.f2224g) {
            m3083d();
            C0608a c0608a = (C0608a) this.f2225h.get(i);
            C0608a c0608a2 = (C0608a) this.f2225h.get(0);
            m3081a(new C0610c(new ComponentName(c0608a.f2212a.activityInfo.packageName, c0608a.f2212a.activityInfo.name), System.currentTimeMillis(), c0608a2 != null ? (c0608a2.f2213b - c0608a.f2213b) + 5.0f : 1.0f));
        }
    }
}
