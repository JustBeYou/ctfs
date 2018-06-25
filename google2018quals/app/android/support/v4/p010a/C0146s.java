package android.support.v4.p010a;

import android.graphics.Rect;
import android.os.Build.VERSION;
import android.support.v4.p010a.C0101c.C0098a;
import android.support.v4.p016g.C0229a;
import android.support.v4.p017h.C0315p;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

class C0146s {
    private static final int[] f672a = new int[]{0, 3, 0, 1, 5, 4, 7, 6, 9, 8};

    static class C0145a {
        public C0114h f666a;
        public boolean f667b;
        public C0101c f668c;
        public C0114h f669d;
        public boolean f670e;
        public C0101c f671f;

        C0145a() {
        }
    }

    private static C0145a m760a(C0145a c0145a, SparseArray<C0145a> sparseArray, int i) {
        if (c0145a != null) {
            return c0145a;
        }
        c0145a = new C0145a();
        sparseArray.put(i, c0145a);
        return c0145a;
    }

    private static C0229a<String, String> m761a(int i, ArrayList<C0101c> arrayList, ArrayList<Boolean> arrayList2, int i2, int i3) {
        C0229a<String, String> c0229a = new C0229a();
        for (int i4 = i3 - 1; i4 >= i2; i4--) {
            C0101c c0101c = (C0101c) arrayList.get(i4);
            if (c0101c.m410b(i)) {
                boolean booleanValue = ((Boolean) arrayList2.get(i4)).booleanValue();
                if (c0101c.f452s != null) {
                    ArrayList arrayList3;
                    ArrayList arrayList4;
                    int size = c0101c.f452s.size();
                    if (booleanValue) {
                        arrayList3 = c0101c.f452s;
                        arrayList4 = c0101c.f453t;
                    } else {
                        ArrayList arrayList5 = c0101c.f452s;
                        arrayList3 = c0101c.f453t;
                        arrayList4 = arrayList5;
                    }
                    for (int i5 = 0; i5 < size; i5++) {
                        String str = (String) arrayList4.get(i5);
                        String str2 = (String) arrayList3.get(i5);
                        String str3 = (String) c0229a.remove(str2);
                        if (str3 != null) {
                            c0229a.put(str, str3);
                        } else {
                            c0229a.put(str, str2);
                        }
                    }
                }
            }
        }
        return c0229a;
    }

    private static Object m764a(C0114h c0114h, C0114h c0114h2, boolean z) {
        if (c0114h == null || c0114h2 == null) {
            return null;
        }
        return C0154t.m812b(C0154t.m791a(z ? c0114h2.m537x() : c0114h.m536w()));
    }

    private static Object m765a(C0114h c0114h, boolean z) {
        if (c0114h == null) {
            return null;
        }
        return C0154t.m791a(z ? c0114h.m535v() : c0114h.m532s());
    }

    private static Object m766a(ViewGroup viewGroup, View view, C0229a<String, String> c0229a, C0145a c0145a, ArrayList<View> arrayList, ArrayList<View> arrayList2, Object obj, Object obj2) {
        View view2 = null;
        final C0114h c0114h = c0145a.f666a;
        final C0114h c0114h2 = c0145a.f669d;
        if (c0114h != null) {
            c0114h.m517i().setVisibility(0);
        }
        if (c0114h == null || c0114h2 == null) {
            return null;
        }
        Object obj3;
        final boolean z = c0145a.f667b;
        Object a = c0229a.isEmpty() ? null : C0146s.m764a(c0114h, c0114h2, z);
        C0229a b = C0146s.m781b((C0229a) c0229a, a, c0145a);
        final C0229a c = C0146s.m790c(c0229a, a, c0145a);
        if (c0229a.isEmpty()) {
            if (b != null) {
                b.clear();
            }
            if (c != null) {
                c.clear();
                obj3 = null;
            } else {
                obj3 = null;
            }
        } else {
            C0146s.m780a((ArrayList) arrayList, b, c0229a.keySet());
            C0146s.m780a((ArrayList) arrayList2, c, c0229a.values());
            obj3 = a;
        }
        if (obj == null && obj2 == null && obj3 == null) {
            return null;
        }
        Rect rect;
        C0146s.m787b(c0114h, c0114h2, z, b, true);
        if (obj3 != null) {
            arrayList2.add(view);
            C0154t.m802a(obj3, view, (ArrayList) arrayList);
            C0146s.m778a(obj3, obj2, b, c0145a.f670e, c0145a.f671f);
            rect = new Rect();
            view2 = C0146s.m782b(c, c0145a, obj, z);
            if (view2 != null) {
                C0154t.m800a(obj, rect);
            }
        } else {
            rect = null;
        }
        C0162x.m847a(viewGroup, new Runnable() {
            public void run() {
                C0146s.m787b(c0114h, c0114h2, z, c, false);
                if (view2 != null) {
                    C0154t.m795a(view2, rect);
                }
            }
        });
        return obj3;
    }

    private static Object m767a(Object obj, Object obj2, Object obj3, C0114h c0114h, boolean z) {
        boolean z2 = true;
        if (!(obj == null || obj2 == null || c0114h == null)) {
            z2 = z ? c0114h.m539z() : c0114h.m538y();
        }
        return z2 ? C0154t.m792a(obj2, obj, obj3) : C0154t.m813b(obj2, obj, obj3);
    }

    private static String m768a(C0229a<String, String> c0229a, String str) {
        int size = c0229a.size();
        for (int i = 0; i < size; i++) {
            if (str.equals(c0229a.m1116c(i))) {
                return (String) c0229a.m1115b(i);
            }
        }
        return null;
    }

    private static void m770a(C0101c c0101c, C0098a c0098a, SparseArray<C0145a> sparseArray, boolean z, boolean z2) {
        C0114h c0114h = c0098a.f429b;
        if (c0114h != null) {
            int i = c0114h.f538x;
            if (i != 0) {
                int i2;
                int i3;
                C0145a a;
                boolean z3;
                int i4;
                int i5;
                boolean z4;
                int i6;
                switch (z ? f672a[c0098a.f428a] : c0098a.f428a) {
                    case 1:
                    case 7:
                        z3 = z2 ? c0114h.f510P : (c0114h.f525k || c0114h.f540z) ? false : true;
                        i4 = 1;
                        i2 = 0;
                        i5 = 0;
                        z4 = z3;
                        break;
                    case 3:
                    case 6:
                        i6 = z2 ? (c0114h.f525k || c0114h.f502H == null || c0114h.f502H.getVisibility() != 0 || c0114h.f512R < 0.0f) ? 0 : 1 : (!c0114h.f525k || c0114h.f540z) ? 0 : 1;
                        i4 = 0;
                        i2 = i6;
                        i5 = 1;
                        i3 = 0;
                        break;
                    case 4:
                        i6 = z2 ? (c0114h.f511Q && c0114h.f525k && c0114h.f540z) ? 1 : 0 : (!c0114h.f525k || c0114h.f540z) ? 0 : 1;
                        i4 = 0;
                        i2 = i6;
                        i5 = 1;
                        i3 = 0;
                        break;
                    case 5:
                        z3 = z2 ? c0114h.f511Q && !c0114h.f540z && c0114h.f525k : c0114h.f540z;
                        i4 = 1;
                        i2 = 0;
                        i5 = 0;
                        z4 = z3;
                        break;
                    default:
                        i4 = 0;
                        i2 = 0;
                        i5 = 0;
                        i3 = 0;
                        break;
                }
                C0145a c0145a = (C0145a) sparseArray.get(i);
                if (i3 != 0) {
                    a = C0146s.m760a(c0145a, (SparseArray) sparseArray, i);
                    a.f666a = c0114h;
                    a.f667b = z;
                    a.f668c = c0101c;
                } else {
                    a = c0145a;
                }
                if (!(z2 || r4 == 0)) {
                    if (a != null && a.f669d == c0114h) {
                        a.f669d = null;
                    }
                    C0135n c0135n = c0101c.f435b;
                    if (c0114h.f516b < 1 && c0135n.f608l >= 1 && !c0101c.f454u) {
                        c0135n.m723f(c0114h);
                        c0135n.m686a(c0114h, 1, 0, 0, false);
                    }
                }
                if (i2 == 0 || !(a == null || a.f669d == null)) {
                    c0145a = a;
                } else {
                    c0145a = C0146s.m760a(a, (SparseArray) sparseArray, i);
                    c0145a.f669d = c0114h;
                    c0145a.f670e = z;
                    c0145a.f671f = c0101c;
                }
                if (!z2 && r7 != 0 && c0145a != null && c0145a.f666a == c0114h) {
                    c0145a.f666a = null;
                }
            }
        }
    }

    public static void m771a(C0101c c0101c, SparseArray<C0145a> sparseArray, boolean z) {
        int size = c0101c.f436c.size();
        for (int i = 0; i < size; i++) {
            C0146s.m770a(c0101c, (C0098a) c0101c.f436c.get(i), (SparseArray) sparseArray, false, z);
        }
    }

    private static void m773a(C0135n c0135n, int i, C0145a c0145a, View view, C0229a<String, String> c0229a) {
        ViewGroup viewGroup = null;
        if (c0135n.f610n.mo43a()) {
            viewGroup = (ViewGroup) c0135n.f610n.mo42a(i);
        }
        if (viewGroup != null) {
            C0114h c0114h = c0145a.f666a;
            C0114h c0114h2 = c0145a.f669d;
            boolean z = c0145a.f667b;
            boolean z2 = c0145a.f670e;
            ArrayList arrayList = new ArrayList();
            ArrayList arrayList2 = new ArrayList();
            Object a = C0146s.m765a(c0114h, z);
            Object b = C0146s.m783b(c0114h2, z2);
            Object a2 = C0146s.m766a(viewGroup, view, (C0229a) c0229a, c0145a, arrayList2, arrayList, a, b);
            if (a != null || a2 != null || b != null) {
                ArrayList b2 = C0146s.m785b(b, c0114h2, arrayList2, view);
                ArrayList b3 = C0146s.m785b(a, c0114h, arrayList, view);
                C0146s.m789b(b3, 4);
                Object a3 = C0146s.m767a(a, b, a2, c0114h, z);
                if (a3 != null) {
                    C0146s.m777a(b, c0114h2, b2);
                    ArrayList a4 = C0154t.m794a(arrayList);
                    C0154t.m803a(a3, a, b3, b, b2, a2, arrayList);
                    C0154t.m798a(viewGroup, a3);
                    C0154t.m796a(viewGroup, arrayList2, arrayList, a4, c0229a);
                    C0146s.m789b(b3, 0);
                    C0154t.m805a(a2, arrayList2, arrayList);
                }
            }
        }
    }

    static void m774a(C0135n c0135n, ArrayList<C0101c> arrayList, ArrayList<Boolean> arrayList2, int i, int i2, boolean z) {
        if (c0135n.f608l >= 1 && VERSION.SDK_INT >= 21) {
            SparseArray sparseArray = new SparseArray();
            for (int i3 = i; i3 < i2; i3++) {
                C0101c c0101c = (C0101c) arrayList.get(i3);
                if (((Boolean) arrayList2.get(i3)).booleanValue()) {
                    C0146s.m786b(c0101c, sparseArray, z);
                } else {
                    C0146s.m771a(c0101c, sparseArray, z);
                }
            }
            if (sparseArray.size() != 0) {
                View view = new View(c0135n.f609m.m555g());
                int size = sparseArray.size();
                for (int i4 = 0; i4 < size; i4++) {
                    int keyAt = sparseArray.keyAt(i4);
                    C0229a a = C0146s.m761a(keyAt, (ArrayList) arrayList, (ArrayList) arrayList2, i, i2);
                    C0145a c0145a = (C0145a) sparseArray.valueAt(i4);
                    if (z) {
                        C0146s.m773a(c0135n, keyAt, c0145a, view, a);
                    } else {
                        C0146s.m788b(c0135n, keyAt, c0145a, view, a);
                    }
                }
            }
        }
    }

    private static void m775a(C0229a<String, String> c0229a, C0229a<String, View> c0229a2) {
        for (int size = c0229a.size() - 1; size >= 0; size--) {
            if (!c0229a2.containsKey((String) c0229a.m1116c(size))) {
                c0229a.m1117d(size);
            }
        }
    }

    private static void m776a(ViewGroup viewGroup, C0114h c0114h, View view, ArrayList<View> arrayList, Object obj, ArrayList<View> arrayList2, Object obj2, ArrayList<View> arrayList3) {
        final Object obj3 = obj;
        final View view2 = view;
        final C0114h c0114h2 = c0114h;
        final ArrayList<View> arrayList4 = arrayList;
        final ArrayList<View> arrayList5 = arrayList2;
        final ArrayList<View> arrayList6 = arrayList3;
        final Object obj4 = obj2;
        C0162x.m847a(viewGroup, new Runnable() {
            public void run() {
                if (obj3 != null) {
                    C0154t.m818c(obj3, view2);
                    arrayList5.addAll(C0146s.m785b(obj3, c0114h2, arrayList4, view2));
                }
                if (arrayList6 != null) {
                    if (obj4 != null) {
                        ArrayList arrayList = new ArrayList();
                        arrayList.add(view2);
                        C0154t.m817b(obj4, arrayList6, arrayList);
                    }
                    arrayList6.clear();
                    arrayList6.add(view2);
                }
            }
        });
    }

    private static void m777a(Object obj, C0114h c0114h, final ArrayList<View> arrayList) {
        if (c0114h != null && obj != null && c0114h.f525k && c0114h.f540z && c0114h.f511Q) {
            c0114h.m512f(true);
            C0154t.m816b(obj, c0114h.m517i(), (ArrayList) arrayList);
            C0162x.m847a(c0114h.f501G, new Runnable() {
                public void run() {
                    C0146s.m789b(arrayList, 4);
                }
            });
        }
    }

    private static void m778a(Object obj, Object obj2, C0229a<String, View> c0229a, boolean z, C0101c c0101c) {
        if (c0101c.f452s != null && !c0101c.f452s.isEmpty()) {
            Object obj3;
            if (z) {
                obj3 = (String) c0101c.f453t.get(0);
            } else {
                String str = (String) c0101c.f452s.get(0);
            }
            View view = (View) c0229a.get(obj3);
            C0154t.m801a(obj, view);
            if (obj2 != null) {
                C0154t.m801a(obj2, view);
            }
        }
    }

    private static void m780a(ArrayList<View> arrayList, C0229a<String, View> c0229a, Collection<String> collection) {
        for (int size = c0229a.size() - 1; size >= 0; size--) {
            View view = (View) c0229a.m1116c(size);
            if (collection.contains(C0315p.m1390e(view))) {
                arrayList.add(view);
            }
        }
    }

    private static C0229a<String, View> m781b(C0229a<String, String> c0229a, Object obj, C0145a c0145a) {
        if (c0229a.isEmpty() || obj == null) {
            c0229a.clear();
            return null;
        }
        ArrayList arrayList;
        C0163y c0163y;
        C0114h c0114h = c0145a.f669d;
        Map c0229a2 = new C0229a();
        C0154t.m808a(c0229a2, c0114h.m517i());
        C0101c c0101c = c0145a.f671f;
        C0163y P;
        if (c0145a.f670e) {
            P = c0114h.m456P();
            arrayList = c0101c.f453t;
            c0163y = P;
        } else {
            P = c0114h.m457Q();
            arrayList = c0101c.f452s;
            c0163y = P;
        }
        c0229a2.m1119a(arrayList);
        if (c0163y != null) {
            c0163y.m850a(arrayList, c0229a2);
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                String str = (String) arrayList.get(size);
                View view = (View) c0229a2.get(str);
                if (view == null) {
                    c0229a.remove(str);
                } else if (!str.equals(C0315p.m1390e(view))) {
                    c0229a.put(C0315p.m1390e(view), (String) c0229a.remove(str));
                }
            }
        } else {
            c0229a.m1119a(c0229a2.keySet());
        }
        return c0229a2;
    }

    private static View m782b(C0229a<String, View> c0229a, C0145a c0145a, Object obj, boolean z) {
        C0101c c0101c = c0145a.f668c;
        if (obj == null || c0229a == null || c0101c.f452s == null || c0101c.f452s.isEmpty()) {
            return null;
        }
        Object obj2;
        if (z) {
            obj2 = (String) c0101c.f452s.get(0);
        } else {
            String str = (String) c0101c.f453t.get(0);
        }
        return (View) c0229a.get(obj2);
    }

    private static Object m783b(C0114h c0114h, boolean z) {
        if (c0114h == null) {
            return null;
        }
        return C0154t.m791a(z ? c0114h.m533t() : c0114h.m534u());
    }

    private static Object m784b(ViewGroup viewGroup, View view, C0229a<String, String> c0229a, C0145a c0145a, ArrayList<View> arrayList, ArrayList<View> arrayList2, Object obj, Object obj2) {
        final C0114h c0114h = c0145a.f666a;
        final C0114h c0114h2 = c0145a.f669d;
        if (c0114h == null || c0114h2 == null) {
            return null;
        }
        Object obj3;
        final boolean z = c0145a.f667b;
        Object a = c0229a.isEmpty() ? null : C0146s.m764a(c0114h, c0114h2, z);
        C0229a b = C0146s.m781b((C0229a) c0229a, a, c0145a);
        if (c0229a.isEmpty()) {
            obj3 = null;
        } else {
            arrayList.addAll(b.values());
            obj3 = a;
        }
        if (obj == null && obj2 == null && obj3 == null) {
            return null;
        }
        Rect rect;
        C0146s.m787b(c0114h, c0114h2, z, b, true);
        if (obj3 != null) {
            rect = new Rect();
            C0154t.m802a(obj3, view, (ArrayList) arrayList);
            C0146s.m778a(obj3, obj2, b, c0145a.f670e, c0145a.f671f);
            if (obj != null) {
                C0154t.m800a(obj, rect);
            }
        } else {
            rect = null;
        }
        final C0229a<String, String> c0229a2 = c0229a;
        final C0145a c0145a2 = c0145a;
        final ArrayList<View> arrayList3 = arrayList2;
        final View view2 = view;
        final ArrayList<View> arrayList4 = arrayList;
        final Object obj4 = obj;
        C0162x.m847a(viewGroup, new Runnable() {
            public void run() {
                C0229a a = C0146s.m790c(c0229a2, obj3, c0145a2);
                if (a != null) {
                    arrayList3.addAll(a.values());
                    arrayList3.add(view2);
                }
                C0146s.m787b(c0114h, c0114h2, z, a, false);
                if (obj3 != null) {
                    C0154t.m805a(obj3, arrayList4, arrayList3);
                    View a2 = C0146s.m782b(a, c0145a2, obj4, z);
                    if (a2 != null) {
                        C0154t.m795a(a2, rect);
                    }
                }
            }
        });
        return obj3;
    }

    private static ArrayList<View> m785b(Object obj, C0114h c0114h, ArrayList<View> arrayList, View view) {
        ArrayList<View> arrayList2 = null;
        if (obj != null) {
            arrayList2 = new ArrayList();
            View i = c0114h.m517i();
            if (i != null) {
                C0154t.m806a((ArrayList) arrayList2, i);
            }
            if (arrayList != null) {
                arrayList2.removeAll(arrayList);
            }
            if (!arrayList2.isEmpty()) {
                arrayList2.add(view);
                C0154t.m804a(obj, (ArrayList) arrayList2);
            }
        }
        return arrayList2;
    }

    public static void m786b(C0101c c0101c, SparseArray<C0145a> sparseArray, boolean z) {
        if (c0101c.f435b.f610n.mo43a()) {
            for (int size = c0101c.f436c.size() - 1; size >= 0; size--) {
                C0146s.m770a(c0101c, (C0098a) c0101c.f436c.get(size), (SparseArray) sparseArray, true, z);
            }
        }
    }

    private static void m787b(C0114h c0114h, C0114h c0114h2, boolean z, C0229a<String, View> c0229a, boolean z2) {
        int i = 0;
        C0163y P = z ? c0114h2.m456P() : c0114h.m456P();
        if (P != null) {
            List arrayList = new ArrayList();
            List arrayList2 = new ArrayList();
            int size = c0229a == null ? 0 : c0229a.size();
            while (i < size) {
                arrayList2.add(c0229a.m1115b(i));
                arrayList.add(c0229a.m1116c(i));
                i++;
            }
            if (z2) {
                P.m849a(arrayList2, arrayList, null);
            } else {
                P.m851b(arrayList2, arrayList, null);
            }
        }
    }

    private static void m788b(C0135n c0135n, int i, C0145a c0145a, View view, C0229a<String, String> c0229a) {
        ViewGroup viewGroup = null;
        if (c0135n.f610n.mo43a()) {
            viewGroup = (ViewGroup) c0135n.f610n.mo42a(i);
        }
        if (viewGroup != null) {
            C0114h c0114h = c0145a.f666a;
            C0114h c0114h2 = c0145a.f669d;
            boolean z = c0145a.f667b;
            boolean z2 = c0145a.f670e;
            Object a = C0146s.m765a(c0114h, z);
            Object b = C0146s.m783b(c0114h2, z2);
            ArrayList arrayList = new ArrayList();
            ArrayList arrayList2 = new ArrayList();
            Object b2 = C0146s.m784b(viewGroup, view, c0229a, c0145a, arrayList, arrayList2, a, b);
            if (a != null || b2 != null || b != null) {
                ArrayList b3 = C0146s.m785b(b, c0114h2, arrayList, view);
                Object obj = (b3 == null || b3.isEmpty()) ? null : b;
                C0154t.m815b(a, view);
                b = C0146s.m767a(a, obj, b2, c0114h, c0145a.f667b);
                if (b != null) {
                    ArrayList arrayList3 = new ArrayList();
                    C0154t.m803a(b, a, arrayList3, obj, b3, b2, arrayList2);
                    C0146s.m776a(viewGroup, c0114h, view, arrayList2, a, arrayList3, obj, b3);
                    C0154t.m797a((View) viewGroup, arrayList2, (Map) c0229a);
                    C0154t.m798a(viewGroup, b);
                    C0154t.m799a(viewGroup, arrayList2, (Map) c0229a);
                }
            }
        }
    }

    private static void m789b(ArrayList<View> arrayList, int i) {
        if (arrayList != null) {
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                ((View) arrayList.get(size)).setVisibility(i);
            }
        }
    }

    private static C0229a<String, View> m790c(C0229a<String, String> c0229a, Object obj, C0145a c0145a) {
        C0114h c0114h = c0145a.f666a;
        View i = c0114h.m517i();
        if (c0229a.isEmpty() || obj == null || i == null) {
            c0229a.clear();
            return null;
        }
        ArrayList arrayList;
        C0163y c0163y;
        C0229a<String, View> c0229a2 = new C0229a();
        C0154t.m808a((Map) c0229a2, i);
        C0101c c0101c = c0145a.f668c;
        C0163y Q;
        if (c0145a.f667b) {
            Q = c0114h.m457Q();
            arrayList = c0101c.f452s;
            c0163y = Q;
        } else {
            Q = c0114h.m456P();
            arrayList = c0101c.f453t;
            c0163y = Q;
        }
        if (arrayList != null) {
            c0229a2.m1119a(arrayList);
        }
        if (c0163y != null) {
            c0163y.m850a(arrayList, c0229a2);
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                String str = (String) arrayList.get(size);
                i = (View) c0229a2.get(str);
                if (i == null) {
                    str = C0146s.m768a((C0229a) c0229a, str);
                    if (str != null) {
                        c0229a.remove(str);
                    }
                } else if (!str.equals(C0315p.m1390e(i))) {
                    str = C0146s.m768a((C0229a) c0229a, str);
                    if (str != null) {
                        c0229a.put(str, C0315p.m1390e(i));
                    }
                }
            }
        } else {
            C0146s.m775a((C0229a) c0229a, (C0229a) c0229a2);
        }
        return c0229a2;
    }
}
