package android.support.v7.view.menu;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.v4.p009b.C0092a;
import android.support.v4.p012d.p013a.C0202a;
import android.support.v4.p017h.C0286c;
import android.support.v7.p020a.C0411a.C0402b;
import android.util.SparseArray;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.KeyCharacterMap.KeyData;
import android.view.KeyEvent;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

public class C0521h implements C0202a {
    private static final int[] f1627d = new int[]{1, 4, 5, 3, 2, 0};
    CharSequence f1628a;
    Drawable f1629b;
    View f1630c;
    private final Context f1631e;
    private final Resources f1632f;
    private boolean f1633g;
    private boolean f1634h;
    private C0442a f1635i;
    private ArrayList<C0524j> f1636j;
    private ArrayList<C0524j> f1637k;
    private boolean f1638l;
    private ArrayList<C0524j> f1639m;
    private ArrayList<C0524j> f1640n;
    private boolean f1641o;
    private int f1642p = 0;
    private ContextMenuInfo f1643q;
    private boolean f1644r = false;
    private boolean f1645s = false;
    private boolean f1646t = false;
    private boolean f1647u = false;
    private boolean f1648v = false;
    private ArrayList<C0524j> f1649w = new ArrayList();
    private CopyOnWriteArrayList<WeakReference<C0506o>> f1650x = new CopyOnWriteArrayList();
    private C0524j f1651y;
    private boolean f1652z;

    public interface C0442a {
        void mo297a(C0521h c0521h);

        boolean mo301a(C0521h c0521h, MenuItem menuItem);
    }

    public interface C0503b {
        boolean mo378a(C0524j c0524j);
    }

    public C0521h(Context context) {
        this.f1631e = context;
        this.f1632f = context.getResources();
        this.f1636j = new ArrayList();
        this.f1637k = new ArrayList();
        this.f1638l = true;
        this.f1639m = new ArrayList();
        this.f1640n = new ArrayList();
        this.f1641o = true;
        m2430e(true);
    }

    private static int m2424a(ArrayList<C0524j> arrayList, int i) {
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            if (((C0524j) arrayList.get(size)).m2498c() <= i) {
                return size + 1;
            }
        }
        return 0;
    }

    private C0524j m2425a(int i, int i2, int i3, int i4, CharSequence charSequence, int i5) {
        return new C0524j(this, i, i2, i3, i4, charSequence, i5);
    }

    private void m2426a(int i, CharSequence charSequence, int i2, Drawable drawable, View view) {
        Resources d = m2461d();
        if (view != null) {
            this.f1630c = view;
            this.f1628a = null;
            this.f1629b = null;
        } else {
            if (i > 0) {
                this.f1628a = d.getText(i);
            } else if (charSequence != null) {
                this.f1628a = charSequence;
            }
            if (i2 > 0) {
                this.f1629b = C0092a.m383a(m2464e(), i2);
            } else if (drawable != null) {
                this.f1629b = drawable;
            }
            this.f1630c = null;
        }
        m2455b(false);
    }

    private void m2427a(int i, boolean z) {
        if (i >= 0 && i < this.f1636j.size()) {
            this.f1636j.remove(i);
            if (z) {
                m2455b(true);
            }
        }
    }

    private boolean m2428a(C0539u c0539u, C0506o c0506o) {
        boolean z = false;
        if (this.f1650x.isEmpty()) {
            return false;
        }
        if (c0506o != null) {
            z = c0506o.mo406a(c0539u);
        }
        Iterator it = this.f1650x.iterator();
        boolean z2 = z;
        while (it.hasNext()) {
            WeakReference weakReference = (WeakReference) it.next();
            C0506o c0506o2 = (C0506o) weakReference.get();
            if (c0506o2 == null) {
                this.f1650x.remove(weakReference);
                z = z2;
            } else {
                z = !z2 ? c0506o2.mo406a(c0539u) : z2;
            }
            z2 = z;
        }
        return z2;
    }

    private void m2429d(boolean z) {
        if (!this.f1650x.isEmpty()) {
            m2467g();
            Iterator it = this.f1650x.iterator();
            while (it.hasNext()) {
                WeakReference weakReference = (WeakReference) it.next();
                C0506o c0506o = (C0506o) weakReference.get();
                if (c0506o == null) {
                    this.f1650x.remove(weakReference);
                } else {
                    c0506o.mo407b(z);
                }
            }
            m2468h();
        }
    }

    private void m2430e(boolean z) {
        boolean z2 = true;
        if (!(z && this.f1632f.getConfiguration().keyboard != 1 && this.f1632f.getBoolean(C0402b.abc_config_showMenuShortcutsWhenKeyboardPresent))) {
            z2 = false;
        }
        this.f1634h = z2;
    }

    private static int m2431f(int i) {
        int i2 = (-65536 & i) >> 16;
        if (i2 >= 0 && i2 < f1627d.length) {
            return (f1627d[i2] << 16) | (65535 & i);
        }
        throw new IllegalArgumentException("order does not contain a valid category.");
    }

    public int m2432a(int i, int i2) {
        int size = size();
        if (i2 < 0) {
            i2 = 0;
        }
        for (int i3 = i2; i3 < size; i3++) {
            if (((C0524j) this.f1636j.get(i3)).getGroupId() == i) {
                return i3;
            }
        }
        return -1;
    }

    public C0521h m2433a(int i) {
        this.f1642p = i;
        return this;
    }

    protected C0521h m2434a(Drawable drawable) {
        m2426a(0, null, 0, drawable, null);
        return this;
    }

    protected C0521h m2435a(View view) {
        m2426a(0, null, 0, null, view);
        return this;
    }

    protected C0521h m2436a(CharSequence charSequence) {
        m2426a(0, charSequence, 0, null, null);
        return this;
    }

    C0524j m2437a(int i, KeyEvent keyEvent) {
        List list = this.f1649w;
        list.clear();
        m2446a(list, i, keyEvent);
        if (list.isEmpty()) {
            return null;
        }
        int metaState = keyEvent.getMetaState();
        KeyData keyData = new KeyData();
        keyEvent.getKeyData(keyData);
        int size = list.size();
        if (size == 1) {
            return (C0524j) list.get(0);
        }
        boolean b = mo440b();
        for (int i2 = 0; i2 < size; i2++) {
            C0524j c0524j = (C0524j) list.get(i2);
            char alphabeticShortcut = b ? c0524j.getAlphabeticShortcut() : c0524j.getNumericShortcut();
            if (alphabeticShortcut == keyData.meta[0] && (metaState & 2) == 0) {
                return c0524j;
            }
            if (alphabeticShortcut == keyData.meta[2] && (metaState & 2) != 0) {
                return c0524j;
            }
            if (b && alphabeticShortcut == '\b' && i == 67) {
                return c0524j;
            }
        }
        return null;
    }

    protected MenuItem m2438a(int i, int i2, int i3, CharSequence charSequence) {
        int f = C0521h.m2431f(i3);
        MenuItem a = m2425a(i, i2, i3, f, charSequence, this.f1642p);
        if (this.f1643q != null) {
            a.m2492a(this.f1643q);
        }
        this.f1636j.add(C0521h.m2424a(this.f1636j, f), a);
        m2455b(true);
        return a;
    }

    protected String mo437a() {
        return "android:menu:actionviewstates";
    }

    public void m2440a(Bundle bundle) {
        int size = size();
        int i = 0;
        SparseArray sparseArray = null;
        while (i < size) {
            MenuItem item = getItem(i);
            View actionView = item.getActionView();
            if (!(actionView == null || actionView.getId() == -1)) {
                if (sparseArray == null) {
                    sparseArray = new SparseArray();
                }
                actionView.saveHierarchyState(sparseArray);
                if (item.isActionViewExpanded()) {
                    bundle.putInt("android:menu:expandedactionview", item.getItemId());
                }
            }
            SparseArray sparseArray2 = sparseArray;
            if (item.hasSubMenu()) {
                ((C0539u) item.getSubMenu()).m2440a(bundle);
            }
            i++;
            sparseArray = sparseArray2;
        }
        if (sparseArray != null) {
            bundle.putSparseParcelableArray(mo437a(), sparseArray);
        }
    }

    public void mo438a(C0442a c0442a) {
        this.f1635i = c0442a;
    }

    void m2442a(C0524j c0524j) {
        this.f1638l = true;
        m2455b(true);
    }

    public void m2443a(C0506o c0506o) {
        m2444a(c0506o, this.f1631e);
    }

    public void m2444a(C0506o c0506o, Context context) {
        this.f1650x.add(new WeakReference(c0506o));
        c0506o.mo402a(context, this);
        this.f1641o = true;
    }

    void m2445a(MenuItem menuItem) {
        int groupId = menuItem.getGroupId();
        int size = this.f1636j.size();
        m2467g();
        for (int i = 0; i < size; i++) {
            MenuItem menuItem2 = (C0524j) this.f1636j.get(i);
            if (menuItem2.getGroupId() == groupId && menuItem2.m2505g() && menuItem2.isCheckable()) {
                menuItem2.m2496b(menuItem2 == menuItem);
            }
        }
        m2468h();
    }

    void m2446a(List<C0524j> list, int i, KeyEvent keyEvent) {
        boolean b = mo440b();
        int modifiers = keyEvent.getModifiers();
        KeyData keyData = new KeyData();
        if (keyEvent.getKeyData(keyData) || i == 67) {
            int size = this.f1636j.size();
            for (int i2 = 0; i2 < size; i2++) {
                C0524j c0524j = (C0524j) this.f1636j.get(i2);
                if (c0524j.hasSubMenu()) {
                    ((C0521h) c0524j.getSubMenu()).m2446a((List) list, i, keyEvent);
                }
                char alphabeticShortcut = b ? c0524j.getAlphabeticShortcut() : c0524j.getNumericShortcut();
                if (!(((modifiers & 69647) == ((b ? c0524j.getAlphabeticModifiers() : c0524j.getNumericModifiers()) & 69647) ? 1 : 0) == 0 || alphabeticShortcut == '\u0000' || ((alphabeticShortcut != keyData.meta[0] && alphabeticShortcut != keyData.meta[2] && (!b || alphabeticShortcut != '\b' || i != 67)) || !c0524j.isEnabled()))) {
                    list.add(c0524j);
                }
            }
        }
    }

    public final void m2447a(boolean z) {
        if (!this.f1648v) {
            this.f1648v = true;
            Iterator it = this.f1650x.iterator();
            while (it.hasNext()) {
                WeakReference weakReference = (WeakReference) it.next();
                C0506o c0506o = (C0506o) weakReference.get();
                if (c0506o == null) {
                    this.f1650x.remove(weakReference);
                } else {
                    c0506o.mo403a(this, z);
                }
            }
            this.f1648v = false;
        }
    }

    boolean mo439a(C0521h c0521h, MenuItem menuItem) {
        return this.f1635i != null && this.f1635i.mo301a(c0521h, menuItem);
    }

    public boolean m2449a(MenuItem menuItem, int i) {
        return m2450a(menuItem, null, i);
    }

    public boolean m2450a(MenuItem menuItem, C0506o c0506o, int i) {
        C0524j c0524j = (C0524j) menuItem;
        if (c0524j == null || !c0524j.isEnabled()) {
            return false;
        }
        boolean b = c0524j.m2497b();
        C0286c a = c0524j.mo381a();
        boolean z = a != null && a.mo429e();
        boolean expandActionView;
        if (c0524j.m2512n()) {
            expandActionView = c0524j.expandActionView() | b;
            if (!expandActionView) {
                return expandActionView;
            }
            m2447a(true);
            return expandActionView;
        } else if (c0524j.hasSubMenu() || z) {
            if ((i & 4) == 0) {
                m2447a(false);
            }
            if (!c0524j.hasSubMenu()) {
                c0524j.m2491a(new C0539u(m2464e(), this, c0524j));
            }
            C0539u c0539u = (C0539u) c0524j.getSubMenu();
            if (z) {
                a.mo427a((SubMenu) c0539u);
            }
            expandActionView = m2428a(c0539u, c0506o) | b;
            if (expandActionView) {
                return expandActionView;
            }
            m2447a(true);
            return expandActionView;
        } else {
            if ((i & 1) == 0) {
                m2447a(true);
            }
            return b;
        }
    }

    public MenuItem add(int i) {
        return m2438a(0, 0, 0, this.f1632f.getString(i));
    }

    public MenuItem add(int i, int i2, int i3, int i4) {
        return m2438a(i, i2, i3, this.f1632f.getString(i4));
    }

    public MenuItem add(int i, int i2, int i3, CharSequence charSequence) {
        return m2438a(i, i2, i3, charSequence);
    }

    public MenuItem add(CharSequence charSequence) {
        return m2438a(0, 0, 0, charSequence);
    }

    public int addIntentOptions(int i, int i2, int i3, ComponentName componentName, Intent[] intentArr, Intent intent, int i4, MenuItem[] menuItemArr) {
        PackageManager packageManager = this.f1631e.getPackageManager();
        List queryIntentActivityOptions = packageManager.queryIntentActivityOptions(componentName, intentArr, intent, 0);
        int size = queryIntentActivityOptions != null ? queryIntentActivityOptions.size() : 0;
        if ((i4 & 1) == 0) {
            removeGroup(i);
        }
        for (int i5 = 0; i5 < size; i5++) {
            ResolveInfo resolveInfo = (ResolveInfo) queryIntentActivityOptions.get(i5);
            Intent intent2 = new Intent(resolveInfo.specificIndex < 0 ? intent : intentArr[resolveInfo.specificIndex]);
            intent2.setComponent(new ComponentName(resolveInfo.activityInfo.applicationInfo.packageName, resolveInfo.activityInfo.name));
            MenuItem intent3 = add(i, i2, i3, resolveInfo.loadLabel(packageManager)).setIcon(resolveInfo.loadIcon(packageManager)).setIntent(intent2);
            if (menuItemArr != null && resolveInfo.specificIndex >= 0) {
                menuItemArr[resolveInfo.specificIndex] = intent3;
            }
        }
        return size;
    }

    public SubMenu addSubMenu(int i) {
        return addSubMenu(0, 0, 0, this.f1632f.getString(i));
    }

    public SubMenu addSubMenu(int i, int i2, int i3, int i4) {
        return addSubMenu(i, i2, i3, this.f1632f.getString(i4));
    }

    public SubMenu addSubMenu(int i, int i2, int i3, CharSequence charSequence) {
        C0524j c0524j = (C0524j) m2438a(i, i2, i3, charSequence);
        C0539u c0539u = new C0539u(this.f1631e, this, c0524j);
        c0524j.m2491a(c0539u);
        return c0539u;
    }

    public SubMenu addSubMenu(CharSequence charSequence) {
        return addSubMenu(0, 0, 0, charSequence);
    }

    public int m2451b(int i) {
        int size = size();
        for (int i2 = 0; i2 < size; i2++) {
            if (((C0524j) this.f1636j.get(i2)).getItemId() == i) {
                return i2;
            }
        }
        return -1;
    }

    public void m2452b(Bundle bundle) {
        if (bundle != null) {
            MenuItem item;
            SparseArray sparseParcelableArray = bundle.getSparseParcelableArray(mo437a());
            int size = size();
            for (int i = 0; i < size; i++) {
                item = getItem(i);
                View actionView = item.getActionView();
                if (!(actionView == null || actionView.getId() == -1)) {
                    actionView.restoreHierarchyState(sparseParcelableArray);
                }
                if (item.hasSubMenu()) {
                    ((C0539u) item.getSubMenu()).m2452b(bundle);
                }
            }
            int i2 = bundle.getInt("android:menu:expandedactionview");
            if (i2 > 0) {
                item = findItem(i2);
                if (item != null) {
                    item.expandActionView();
                }
            }
        }
    }

    void m2453b(C0524j c0524j) {
        this.f1641o = true;
        m2455b(true);
    }

    public void m2454b(C0506o c0506o) {
        Iterator it = this.f1650x.iterator();
        while (it.hasNext()) {
            WeakReference weakReference = (WeakReference) it.next();
            C0506o c0506o2 = (C0506o) weakReference.get();
            if (c0506o2 == null || c0506o2 == c0506o) {
                this.f1650x.remove(weakReference);
            }
        }
    }

    public void m2455b(boolean z) {
        if (this.f1644r) {
            this.f1645s = true;
            if (z) {
                this.f1646t = true;
                return;
            }
            return;
        }
        if (z) {
            this.f1638l = true;
            this.f1641o = true;
        }
        m2429d(z);
    }

    boolean mo440b() {
        return this.f1633g;
    }

    public int m2457c(int i) {
        return m2432a(i, 0);
    }

    public void m2458c(boolean z) {
        this.f1652z = z;
    }

    public boolean mo441c() {
        return this.f1634h;
    }

    public boolean mo442c(C0524j c0524j) {
        boolean z = false;
        if (!this.f1650x.isEmpty()) {
            m2467g();
            Iterator it = this.f1650x.iterator();
            boolean z2 = false;
            while (it.hasNext()) {
                WeakReference weakReference = (WeakReference) it.next();
                C0506o c0506o = (C0506o) weakReference.get();
                if (c0506o == null) {
                    this.f1650x.remove(weakReference);
                    z = z2;
                } else {
                    z = c0506o.mo405a(this, c0524j);
                    if (z) {
                        break;
                    }
                }
                z2 = z;
            }
            z = z2;
            m2468h();
            if (z) {
                this.f1651y = c0524j;
            }
        }
        return z;
    }

    public void clear() {
        if (this.f1651y != null) {
            mo443d(this.f1651y);
        }
        this.f1636j.clear();
        m2455b(true);
    }

    public void clearHeader() {
        this.f1629b = null;
        this.f1628a = null;
        this.f1630c = null;
        m2455b(false);
    }

    public void close() {
        m2447a(true);
    }

    Resources m2461d() {
        return this.f1632f;
    }

    protected C0521h m2462d(int i) {
        m2426a(i, null, 0, null, null);
        return this;
    }

    public boolean mo443d(C0524j c0524j) {
        boolean z = false;
        if (!this.f1650x.isEmpty() && this.f1651y == c0524j) {
            m2467g();
            Iterator it = this.f1650x.iterator();
            boolean z2 = false;
            while (it.hasNext()) {
                WeakReference weakReference = (WeakReference) it.next();
                C0506o c0506o = (C0506o) weakReference.get();
                if (c0506o == null) {
                    this.f1650x.remove(weakReference);
                    z = z2;
                } else {
                    z = c0506o.mo409b(this, c0524j);
                    if (z) {
                        break;
                    }
                }
                z2 = z;
            }
            z = z2;
            m2468h();
            if (z) {
                this.f1651y = null;
            }
        }
        return z;
    }

    public Context m2464e() {
        return this.f1631e;
    }

    protected C0521h m2465e(int i) {
        m2426a(0, null, i, null, null);
        return this;
    }

    public void m2466f() {
        if (this.f1635i != null) {
            this.f1635i.mo297a(this);
        }
    }

    public MenuItem findItem(int i) {
        int size = size();
        for (int i2 = 0; i2 < size; i2++) {
            C0524j c0524j = (C0524j) this.f1636j.get(i2);
            if (c0524j.getItemId() == i) {
                return c0524j;
            }
            if (c0524j.hasSubMenu()) {
                MenuItem findItem = c0524j.getSubMenu().findItem(i);
                if (findItem != null) {
                    return findItem;
                }
            }
        }
        return null;
    }

    public void m2467g() {
        if (!this.f1644r) {
            this.f1644r = true;
            this.f1645s = false;
            this.f1646t = false;
        }
    }

    public MenuItem getItem(int i) {
        return (MenuItem) this.f1636j.get(i);
    }

    public void m2468h() {
        this.f1644r = false;
        if (this.f1645s) {
            this.f1645s = false;
            m2455b(this.f1646t);
        }
    }

    public boolean hasVisibleItems() {
        if (this.f1652z) {
            return true;
        }
        int size = size();
        for (int i = 0; i < size; i++) {
            if (((C0524j) this.f1636j.get(i)).isVisible()) {
                return true;
            }
        }
        return false;
    }

    public ArrayList<C0524j> m2469i() {
        if (!this.f1638l) {
            return this.f1637k;
        }
        this.f1637k.clear();
        int size = this.f1636j.size();
        for (int i = 0; i < size; i++) {
            C0524j c0524j = (C0524j) this.f1636j.get(i);
            if (c0524j.isVisible()) {
                this.f1637k.add(c0524j);
            }
        }
        this.f1638l = false;
        this.f1641o = true;
        return this.f1637k;
    }

    public boolean isShortcutKey(int i, KeyEvent keyEvent) {
        return m2437a(i, keyEvent) != null;
    }

    public void m2470j() {
        ArrayList i = m2469i();
        if (this.f1641o) {
            Iterator it = this.f1650x.iterator();
            int i2 = 0;
            while (it.hasNext()) {
                int i3;
                WeakReference weakReference = (WeakReference) it.next();
                C0506o c0506o = (C0506o) weakReference.get();
                if (c0506o == null) {
                    this.f1650x.remove(weakReference);
                    i3 = i2;
                } else {
                    i3 = c0506o.mo408b() | i2;
                }
                i2 = i3;
            }
            if (i2 != 0) {
                this.f1639m.clear();
                this.f1640n.clear();
                i2 = i.size();
                for (int i4 = 0; i4 < i2; i4++) {
                    C0524j c0524j = (C0524j) i.get(i4);
                    if (c0524j.m2508j()) {
                        this.f1639m.add(c0524j);
                    } else {
                        this.f1640n.add(c0524j);
                    }
                }
            } else {
                this.f1639m.clear();
                this.f1640n.clear();
                this.f1640n.addAll(m2469i());
            }
            this.f1641o = false;
        }
    }

    public ArrayList<C0524j> m2471k() {
        m2470j();
        return this.f1639m;
    }

    public ArrayList<C0524j> m2472l() {
        m2470j();
        return this.f1640n;
    }

    public CharSequence m2473m() {
        return this.f1628a;
    }

    public Drawable m2474n() {
        return this.f1629b;
    }

    public View m2475o() {
        return this.f1630c;
    }

    public C0521h mo444p() {
        return this;
    }

    public boolean performIdentifierAction(int i, int i2) {
        return m2449a(findItem(i), i2);
    }

    public boolean performShortcut(int i, KeyEvent keyEvent, int i2) {
        MenuItem a = m2437a(i, keyEvent);
        boolean z = false;
        if (a != null) {
            z = m2449a(a, i2);
        }
        if ((i2 & 2) != 0) {
            m2447a(true);
        }
        return z;
    }

    boolean m2477q() {
        return this.f1647u;
    }

    public C0524j m2478r() {
        return this.f1651y;
    }

    public void removeGroup(int i) {
        int c = m2457c(i);
        if (c >= 0) {
            int size = this.f1636j.size() - c;
            int i2 = 0;
            while (true) {
                int i3 = i2 + 1;
                if (i2 >= size || ((C0524j) this.f1636j.get(c)).getGroupId() != i) {
                    m2455b(true);
                } else {
                    m2427a(c, false);
                    i2 = i3;
                }
            }
            m2455b(true);
        }
    }

    public void removeItem(int i) {
        m2427a(m2451b(i), true);
    }

    public void setGroupCheckable(int i, boolean z, boolean z2) {
        int size = this.f1636j.size();
        for (int i2 = 0; i2 < size; i2++) {
            C0524j c0524j = (C0524j) this.f1636j.get(i2);
            if (c0524j.getGroupId() == i) {
                c0524j.m2493a(z2);
                c0524j.setCheckable(z);
            }
        }
    }

    public void setGroupEnabled(int i, boolean z) {
        int size = this.f1636j.size();
        for (int i2 = 0; i2 < size; i2++) {
            C0524j c0524j = (C0524j) this.f1636j.get(i2);
            if (c0524j.getGroupId() == i) {
                c0524j.setEnabled(z);
            }
        }
    }

    public void setGroupVisible(int i, boolean z) {
        int size = this.f1636j.size();
        int i2 = 0;
        boolean z2 = false;
        while (i2 < size) {
            C0524j c0524j = (C0524j) this.f1636j.get(i2);
            boolean z3 = (c0524j.getGroupId() == i && c0524j.m2499c(z)) ? true : z2;
            i2++;
            z2 = z3;
        }
        if (z2) {
            m2455b(true);
        }
    }

    public void setQwertyMode(boolean z) {
        this.f1633g = z;
        m2455b(false);
    }

    public int size() {
        return this.f1636j.size();
    }
}
