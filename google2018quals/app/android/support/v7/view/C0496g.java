package android.support.v7.view;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.graphics.PorterDuff.Mode;
import android.support.v4.p012d.p013a.C0202a;
import android.support.v4.p017h.C0286c;
import android.support.v4.p017h.C0295g;
import android.support.v7.p020a.C0411a.C0410j;
import android.support.v7.view.menu.C0524j;
import android.support.v7.view.menu.C0529k;
import android.support.v7.widget.ae;
import android.util.AttributeSet;
import android.util.Log;
import android.util.Xml;
import android.view.InflateException;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.MenuItem.OnMenuItemClickListener;
import android.view.SubMenu;
import android.view.View;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

public class C0496g extends MenuInflater {
    static final Class<?>[] f1481a = new Class[]{Context.class};
    static final Class<?>[] f1482b = f1481a;
    final Object[] f1483c;
    final Object[] f1484d = this.f1483c;
    Context f1485e;
    private Object f1486f;

    private static class C0494a implements OnMenuItemClickListener {
        private static final Class<?>[] f1446a = new Class[]{MenuItem.class};
        private Object f1447b;
        private Method f1448c;

        public C0494a(Object obj, String str) {
            this.f1447b = obj;
            Class cls = obj.getClass();
            try {
                this.f1448c = cls.getMethod(str, f1446a);
            } catch (Throwable e) {
                InflateException inflateException = new InflateException("Couldn't resolve menu item onClick handler " + str + " in class " + cls.getName());
                inflateException.initCause(e);
                throw inflateException;
            }
        }

        public boolean onMenuItemClick(MenuItem menuItem) {
            try {
                if (this.f1448c.getReturnType() == Boolean.TYPE) {
                    return ((Boolean) this.f1448c.invoke(this.f1447b, new Object[]{menuItem})).booleanValue();
                }
                this.f1448c.invoke(this.f1447b, new Object[]{menuItem});
                return true;
            } catch (Throwable e) {
                throw new RuntimeException(e);
            }
        }
    }

    private class C0495b {
        private String f1449A;
        private String f1450B;
        private CharSequence f1451C;
        private CharSequence f1452D;
        private ColorStateList f1453E = null;
        private Mode f1454F = null;
        C0286c f1455a;
        final /* synthetic */ C0496g f1456b;
        private Menu f1457c;
        private int f1458d;
        private int f1459e;
        private int f1460f;
        private int f1461g;
        private boolean f1462h;
        private boolean f1463i;
        private boolean f1464j;
        private int f1465k;
        private int f1466l;
        private CharSequence f1467m;
        private CharSequence f1468n;
        private int f1469o;
        private char f1470p;
        private int f1471q;
        private char f1472r;
        private int f1473s;
        private int f1474t;
        private boolean f1475u;
        private boolean f1476v;
        private boolean f1477w;
        private int f1478x;
        private int f1479y;
        private String f1480z;

        public C0495b(C0496g c0496g, Menu menu) {
            this.f1456b = c0496g;
            this.f1457c = menu;
            m2262a();
        }

        private char m2259a(String str) {
            return str == null ? '\u0000' : str.charAt(0);
        }

        private <T> T m2260a(String str, Class<?>[] clsArr, Object[] objArr) {
            try {
                Constructor constructor = this.f1456b.f1485e.getClassLoader().loadClass(str).getConstructor(clsArr);
                constructor.setAccessible(true);
                return constructor.newInstance(objArr);
            } catch (Throwable e) {
                Log.w("SupportMenuInflater", "Cannot instantiate class: " + str, e);
                return null;
            }
        }

        private void m2261a(MenuItem menuItem) {
            boolean z = true;
            menuItem.setChecked(this.f1475u).setVisible(this.f1476v).setEnabled(this.f1477w).setCheckable(this.f1474t >= 1).setTitleCondensed(this.f1468n).setIcon(this.f1469o);
            if (this.f1478x >= 0) {
                menuItem.setShowAsAction(this.f1478x);
            }
            if (this.f1450B != null) {
                if (this.f1456b.f1485e.isRestricted()) {
                    throw new IllegalStateException("The android:onClick attribute cannot be used within a restricted context");
                }
                menuItem.setOnMenuItemClickListener(new C0494a(this.f1456b.m2270a(), this.f1450B));
            }
            if (menuItem instanceof C0524j) {
                C0524j c0524j = (C0524j) menuItem;
            }
            if (this.f1474t >= 2) {
                if (menuItem instanceof C0524j) {
                    ((C0524j) menuItem).m2493a(true);
                } else if (menuItem instanceof C0529k) {
                    ((C0529k) menuItem).m2521a(true);
                }
            }
            if (this.f1480z != null) {
                menuItem.setActionView((View) m2260a(this.f1480z, C0496g.f1481a, this.f1456b.f1483c));
            } else {
                z = false;
            }
            if (this.f1479y > 0) {
                if (z) {
                    Log.w("SupportMenuInflater", "Ignoring attribute 'itemActionViewLayout'. Action view already specified.");
                } else {
                    menuItem.setActionView(this.f1479y);
                }
            }
            if (this.f1455a != null) {
                C0295g.m1294a(menuItem, this.f1455a);
            }
            C0295g.m1298a(menuItem, this.f1451C);
            C0295g.m1300b(menuItem, this.f1452D);
            C0295g.m1299b(menuItem, this.f1470p, this.f1471q);
            C0295g.m1295a(menuItem, this.f1472r, this.f1473s);
            if (this.f1454F != null) {
                C0295g.m1297a(menuItem, this.f1454F);
            }
            if (this.f1453E != null) {
                C0295g.m1296a(menuItem, this.f1453E);
            }
        }

        public void m2262a() {
            this.f1458d = 0;
            this.f1459e = 0;
            this.f1460f = 0;
            this.f1461g = 0;
            this.f1462h = true;
            this.f1463i = true;
        }

        public void m2263a(AttributeSet attributeSet) {
            TypedArray obtainStyledAttributes = this.f1456b.f1485e.obtainStyledAttributes(attributeSet, C0410j.MenuGroup);
            this.f1458d = obtainStyledAttributes.getResourceId(C0410j.MenuGroup_android_id, 0);
            this.f1459e = obtainStyledAttributes.getInt(C0410j.MenuGroup_android_menuCategory, 0);
            this.f1460f = obtainStyledAttributes.getInt(C0410j.MenuGroup_android_orderInCategory, 0);
            this.f1461g = obtainStyledAttributes.getInt(C0410j.MenuGroup_android_checkableBehavior, 0);
            this.f1462h = obtainStyledAttributes.getBoolean(C0410j.MenuGroup_android_visible, true);
            this.f1463i = obtainStyledAttributes.getBoolean(C0410j.MenuGroup_android_enabled, true);
            obtainStyledAttributes.recycle();
        }

        public void m2264b() {
            this.f1464j = true;
            m2261a(this.f1457c.add(this.f1458d, this.f1465k, this.f1466l, this.f1467m));
        }

        public void m2265b(AttributeSet attributeSet) {
            boolean z = true;
            TypedArray obtainStyledAttributes = this.f1456b.f1485e.obtainStyledAttributes(attributeSet, C0410j.MenuItem);
            this.f1465k = obtainStyledAttributes.getResourceId(C0410j.MenuItem_android_id, 0);
            this.f1466l = (obtainStyledAttributes.getInt(C0410j.MenuItem_android_menuCategory, this.f1459e) & -65536) | (obtainStyledAttributes.getInt(C0410j.MenuItem_android_orderInCategory, this.f1460f) & 65535);
            this.f1467m = obtainStyledAttributes.getText(C0410j.MenuItem_android_title);
            this.f1468n = obtainStyledAttributes.getText(C0410j.MenuItem_android_titleCondensed);
            this.f1469o = obtainStyledAttributes.getResourceId(C0410j.MenuItem_android_icon, 0);
            this.f1470p = m2259a(obtainStyledAttributes.getString(C0410j.MenuItem_android_alphabeticShortcut));
            this.f1471q = obtainStyledAttributes.getInt(C0410j.MenuItem_alphabeticModifiers, 4096);
            this.f1472r = m2259a(obtainStyledAttributes.getString(C0410j.MenuItem_android_numericShortcut));
            this.f1473s = obtainStyledAttributes.getInt(C0410j.MenuItem_numericModifiers, 4096);
            if (obtainStyledAttributes.hasValue(C0410j.MenuItem_android_checkable)) {
                this.f1474t = obtainStyledAttributes.getBoolean(C0410j.MenuItem_android_checkable, false) ? 1 : 0;
            } else {
                this.f1474t = this.f1461g;
            }
            this.f1475u = obtainStyledAttributes.getBoolean(C0410j.MenuItem_android_checked, false);
            this.f1476v = obtainStyledAttributes.getBoolean(C0410j.MenuItem_android_visible, this.f1462h);
            this.f1477w = obtainStyledAttributes.getBoolean(C0410j.MenuItem_android_enabled, this.f1463i);
            this.f1478x = obtainStyledAttributes.getInt(C0410j.MenuItem_showAsAction, -1);
            this.f1450B = obtainStyledAttributes.getString(C0410j.MenuItem_android_onClick);
            this.f1479y = obtainStyledAttributes.getResourceId(C0410j.MenuItem_actionLayout, 0);
            this.f1480z = obtainStyledAttributes.getString(C0410j.MenuItem_actionViewClass);
            this.f1449A = obtainStyledAttributes.getString(C0410j.MenuItem_actionProviderClass);
            if (this.f1449A == null) {
                z = false;
            }
            if (z && this.f1479y == 0 && this.f1480z == null) {
                this.f1455a = (C0286c) m2260a(this.f1449A, C0496g.f1482b, this.f1456b.f1484d);
            } else {
                if (z) {
                    Log.w("SupportMenuInflater", "Ignoring attribute 'actionProviderClass'. Action view already specified.");
                }
                this.f1455a = null;
            }
            this.f1451C = obtainStyledAttributes.getText(C0410j.MenuItem_contentDescription);
            this.f1452D = obtainStyledAttributes.getText(C0410j.MenuItem_tooltipText);
            if (obtainStyledAttributes.hasValue(C0410j.MenuItem_iconTintMode)) {
                this.f1454F = ae.m2842a(obtainStyledAttributes.getInt(C0410j.MenuItem_iconTintMode, -1), this.f1454F);
            } else {
                this.f1454F = null;
            }
            if (obtainStyledAttributes.hasValue(C0410j.MenuItem_iconTint)) {
                this.f1453E = obtainStyledAttributes.getColorStateList(C0410j.MenuItem_iconTint);
            } else {
                this.f1453E = null;
            }
            obtainStyledAttributes.recycle();
            this.f1464j = false;
        }

        public SubMenu m2266c() {
            this.f1464j = true;
            SubMenu addSubMenu = this.f1457c.addSubMenu(this.f1458d, this.f1465k, this.f1466l, this.f1467m);
            m2261a(addSubMenu.getItem());
            return addSubMenu;
        }

        public boolean m2267d() {
            return this.f1464j;
        }
    }

    public C0496g(Context context) {
        super(context);
        this.f1485e = context;
        this.f1483c = new Object[]{context};
    }

    private Object m2268a(Object obj) {
        return (!(obj instanceof Activity) && (obj instanceof ContextWrapper)) ? m2268a(((ContextWrapper) obj).getBaseContext()) : obj;
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void m2269a(org.xmlpull.v1.XmlPullParser r11, android.util.AttributeSet r12, android.view.Menu r13) {
        /*
        r10 = this;
        r4 = 0;
        r1 = 1;
        r6 = 0;
        r7 = new android.support.v7.view.g$b;
        r7.<init>(r10, r13);
        r0 = r11.getEventType();
    L_0x000c:
        r2 = 2;
        if (r0 != r2) goto L_0x004a;
    L_0x000f:
        r0 = r11.getName();
        r2 = "menu";
        r2 = r0.equals(r2);
        if (r2 == 0) goto L_0x0031;
    L_0x001b:
        r0 = r11.next();
    L_0x001f:
        r2 = r4;
        r5 = r6;
        r3 = r0;
        r0 = r6;
    L_0x0023:
        if (r0 != 0) goto L_0x00dd;
    L_0x0025:
        switch(r3) {
            case 1: goto L_0x00d5;
            case 2: goto L_0x0051;
            case 3: goto L_0x0087;
            default: goto L_0x0028;
        };
    L_0x0028:
        r3 = r5;
    L_0x0029:
        r5 = r11.next();
        r9 = r3;
        r3 = r5;
        r5 = r9;
        goto L_0x0023;
    L_0x0031:
        r1 = new java.lang.RuntimeException;
        r2 = new java.lang.StringBuilder;
        r2.<init>();
        r3 = "Expecting menu, got ";
        r2 = r2.append(r3);
        r0 = r2.append(r0);
        r0 = r0.toString();
        r1.<init>(r0);
        throw r1;
    L_0x004a:
        r0 = r11.next();
        if (r0 != r1) goto L_0x000c;
    L_0x0050:
        goto L_0x001f;
    L_0x0051:
        if (r5 == 0) goto L_0x0055;
    L_0x0053:
        r3 = r5;
        goto L_0x0029;
    L_0x0055:
        r3 = r11.getName();
        r8 = "group";
        r8 = r3.equals(r8);
        if (r8 == 0) goto L_0x0066;
    L_0x0061:
        r7.m2263a(r12);
        r3 = r5;
        goto L_0x0029;
    L_0x0066:
        r8 = "item";
        r8 = r3.equals(r8);
        if (r8 == 0) goto L_0x0073;
    L_0x006e:
        r7.m2265b(r12);
        r3 = r5;
        goto L_0x0029;
    L_0x0073:
        r8 = "menu";
        r8 = r3.equals(r8);
        if (r8 == 0) goto L_0x0084;
    L_0x007b:
        r3 = r7.m2266c();
        r10.m2269a(r11, r12, r3);
        r3 = r5;
        goto L_0x0029;
    L_0x0084:
        r2 = r3;
        r3 = r1;
        goto L_0x0029;
    L_0x0087:
        r3 = r11.getName();
        if (r5 == 0) goto L_0x0096;
    L_0x008d:
        r8 = r3.equals(r2);
        if (r8 == 0) goto L_0x0096;
    L_0x0093:
        r2 = r4;
        r3 = r6;
        goto L_0x0029;
    L_0x0096:
        r8 = "group";
        r8 = r3.equals(r8);
        if (r8 == 0) goto L_0x00a3;
    L_0x009e:
        r7.m2262a();
        r3 = r5;
        goto L_0x0029;
    L_0x00a3:
        r8 = "item";
        r8 = r3.equals(r8);
        if (r8 == 0) goto L_0x00c9;
    L_0x00ab:
        r3 = r7.m2267d();
        if (r3 != 0) goto L_0x0028;
    L_0x00b1:
        r3 = r7.f1455a;
        if (r3 == 0) goto L_0x00c3;
    L_0x00b5:
        r3 = r7.f1455a;
        r3 = r3.mo429e();
        if (r3 == 0) goto L_0x00c3;
    L_0x00bd:
        r7.m2266c();
        r3 = r5;
        goto L_0x0029;
    L_0x00c3:
        r7.m2264b();
        r3 = r5;
        goto L_0x0029;
    L_0x00c9:
        r8 = "menu";
        r3 = r3.equals(r8);
        if (r3 == 0) goto L_0x0028;
    L_0x00d1:
        r0 = r1;
        r3 = r5;
        goto L_0x0029;
    L_0x00d5:
        r0 = new java.lang.RuntimeException;
        r1 = "Unexpected end of document";
        r0.<init>(r1);
        throw r0;
    L_0x00dd:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v7.view.g.a(org.xmlpull.v1.XmlPullParser, android.util.AttributeSet, android.view.Menu):void");
    }

    Object m2270a() {
        if (this.f1486f == null) {
            this.f1486f = m2268a(this.f1485e);
        }
        return this.f1486f;
    }

    public void inflate(int i, Menu menu) {
        if (menu instanceof C0202a) {
            XmlResourceParser xmlResourceParser = null;
            try {
                xmlResourceParser = this.f1485e.getResources().getLayout(i);
                m2269a(xmlResourceParser, Xml.asAttributeSet(xmlResourceParser), menu);
                if (xmlResourceParser != null) {
                    xmlResourceParser.close();
                }
            } catch (Throwable e) {
                throw new InflateException("Error inflating menu XML", e);
            } catch (Throwable e2) {
                throw new InflateException("Error inflating menu XML", e2);
            } catch (Throwable th) {
                if (xmlResourceParser != null) {
                    xmlResourceParser.close();
                }
            }
        } else {
            super.inflate(i, menu);
        }
    }
}
