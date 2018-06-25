package android.support.v7.view.menu;

import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.support.v4.p005c.p006a.C0179a;
import android.support.v4.p012d.p013a.C0203b;
import android.support.v4.p017h.C0286c;
import android.support.v4.p017h.C0286c.C0285b;
import android.support.v7.p021b.p022a.C0485b;
import android.support.v7.view.menu.C0504p.C0501a;
import android.util.Log;
import android.view.ActionProvider;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.MenuItem.OnActionExpandListener;
import android.view.MenuItem.OnMenuItemClickListener;
import android.view.SubMenu;
import android.view.View;
import android.view.ViewDebug.CapturedViewProperty;
import android.widget.LinearLayout;

public final class C0524j implements C0203b {
    private static String f1658F;
    private static String f1659G;
    private static String f1660H;
    private static String f1661I;
    private View f1662A;
    private C0286c f1663B;
    private OnActionExpandListener f1664C;
    private boolean f1665D = false;
    private ContextMenuInfo f1666E;
    C0521h f1667a;
    private final int f1668b;
    private final int f1669c;
    private final int f1670d;
    private final int f1671e;
    private CharSequence f1672f;
    private CharSequence f1673g;
    private Intent f1674h;
    private char f1675i;
    private int f1676j = 4096;
    private char f1677k;
    private int f1678l = 4096;
    private Drawable f1679m;
    private int f1680n = 0;
    private C0539u f1681o;
    private Runnable f1682p;
    private OnMenuItemClickListener f1683q;
    private CharSequence f1684r;
    private CharSequence f1685s;
    private ColorStateList f1686t = null;
    private Mode f1687u = null;
    private boolean f1688v = false;
    private boolean f1689w = false;
    private boolean f1690x = false;
    private int f1691y = 16;
    private int f1692z = 0;

    class C05231 implements C0285b {
        final /* synthetic */ C0524j f1657a;

        C05231(C0524j c0524j) {
            this.f1657a = c0524j;
        }

        public void mo425a(boolean z) {
            this.f1657a.f1667a.m2442a(this.f1657a);
        }
    }

    C0524j(C0521h c0521h, int i, int i2, int i3, int i4, CharSequence charSequence, int i5) {
        this.f1667a = c0521h;
        this.f1668b = i2;
        this.f1669c = i;
        this.f1670d = i3;
        this.f1671e = i4;
        this.f1672f = charSequence;
        this.f1692z = i5;
    }

    private Drawable m2484a(Drawable drawable) {
        if (drawable != null && this.f1690x && (this.f1688v || this.f1689w)) {
            drawable = C0179a.m943f(drawable).mutate();
            if (this.f1688v) {
                C0179a.m933a(drawable, this.f1686t);
            }
            if (this.f1689w) {
                C0179a.m936a(drawable, this.f1687u);
            }
            this.f1690x = false;
        }
        return drawable;
    }

    public C0203b m2485a(int i) {
        Context e = this.f1667a.m2464e();
        m2487a(LayoutInflater.from(e).inflate(i, new LinearLayout(e), false));
        return this;
    }

    public C0203b mo379a(C0286c c0286c) {
        if (this.f1663B != null) {
            this.f1663B.m1268f();
        }
        this.f1662A = null;
        this.f1663B = c0286c;
        this.f1667a.m2455b(true);
        if (this.f1663B != null) {
            this.f1663B.mo433a(new C05231(this));
        }
        return this;
    }

    public C0203b m2487a(View view) {
        this.f1662A = view;
        this.f1663B = null;
        if (view != null && view.getId() == -1 && this.f1668b > 0) {
            view.setId(this.f1668b);
        }
        this.f1667a.m2453b(this);
        return this;
    }

    public C0203b mo380a(CharSequence charSequence) {
        this.f1684r = charSequence;
        this.f1667a.m2455b(false);
        return this;
    }

    public C0286c mo381a() {
        return this.f1663B;
    }

    CharSequence m2490a(C0501a c0501a) {
        return (c0501a == null || !c0501a.mo373a()) ? getTitle() : getTitleCondensed();
    }

    public void m2491a(C0539u c0539u) {
        this.f1681o = c0539u;
        c0539u.setHeaderTitle(getTitle());
    }

    void m2492a(ContextMenuInfo contextMenuInfo) {
        this.f1666E = contextMenuInfo;
    }

    public void m2493a(boolean z) {
        this.f1691y = (z ? 4 : 0) | (this.f1691y & -5);
    }

    public C0203b m2494b(int i) {
        setShowAsAction(i);
        return this;
    }

    public C0203b mo382b(CharSequence charSequence) {
        this.f1685s = charSequence;
        this.f1667a.m2455b(false);
        return this;
    }

    void m2496b(boolean z) {
        int i = this.f1691y;
        this.f1691y = (z ? 2 : 0) | (this.f1691y & -3);
        if (i != this.f1691y) {
            this.f1667a.m2455b(false);
        }
    }

    public boolean m2497b() {
        if ((this.f1683q != null && this.f1683q.onMenuItemClick(this)) || this.f1667a.mo439a(this.f1667a, (MenuItem) this)) {
            return true;
        }
        if (this.f1682p != null) {
            this.f1682p.run();
            return true;
        }
        if (this.f1674h != null) {
            try {
                this.f1667a.m2464e().startActivity(this.f1674h);
                return true;
            } catch (Throwable e) {
                Log.e("MenuItemImpl", "Can't find activity to handle intent; ignoring", e);
            }
        }
        return this.f1663B != null && this.f1663B.mo428d();
    }

    public int m2498c() {
        return this.f1671e;
    }

    boolean m2499c(boolean z) {
        int i = this.f1691y;
        this.f1691y = (z ? 0 : 8) | (this.f1691y & -9);
        return i != this.f1691y;
    }

    public boolean collapseActionView() {
        return (this.f1692z & 8) == 0 ? false : this.f1662A == null ? true : (this.f1664C == null || this.f1664C.onMenuItemActionCollapse(this)) ? this.f1667a.mo443d(this) : false;
    }

    char m2500d() {
        return this.f1667a.mo440b() ? this.f1677k : this.f1675i;
    }

    public void m2501d(boolean z) {
        if (z) {
            this.f1691y |= 32;
        } else {
            this.f1691y &= -33;
        }
    }

    String m2502e() {
        char d = m2500d();
        if (d == '\u0000') {
            return "";
        }
        StringBuilder stringBuilder = new StringBuilder(f1658F);
        switch (d) {
            case '\b':
                stringBuilder.append(f1660H);
                break;
            case '\n':
                stringBuilder.append(f1659G);
                break;
            case ' ':
                stringBuilder.append(f1661I);
                break;
            default:
                stringBuilder.append(d);
                break;
        }
        return stringBuilder.toString();
    }

    public void m2503e(boolean z) {
        this.f1665D = z;
        this.f1667a.m2455b(false);
    }

    public boolean expandActionView() {
        return !m2512n() ? false : (this.f1664C == null || this.f1664C.onMenuItemActionExpand(this)) ? this.f1667a.mo442c(this) : false;
    }

    boolean m2504f() {
        return this.f1667a.mo441c() && m2500d() != '\u0000';
    }

    public boolean m2505g() {
        return (this.f1691y & 4) != 0;
    }

    public ActionProvider getActionProvider() {
        throw new UnsupportedOperationException("This is not supported, use MenuItemCompat.getActionProvider()");
    }

    public View getActionView() {
        if (this.f1662A != null) {
            return this.f1662A;
        }
        if (this.f1663B == null) {
            return null;
        }
        this.f1662A = this.f1663B.mo432a((MenuItem) this);
        return this.f1662A;
    }

    public int getAlphabeticModifiers() {
        return this.f1678l;
    }

    public char getAlphabeticShortcut() {
        return this.f1677k;
    }

    public CharSequence getContentDescription() {
        return this.f1684r;
    }

    public int getGroupId() {
        return this.f1669c;
    }

    public Drawable getIcon() {
        if (this.f1679m != null) {
            return m2484a(this.f1679m);
        }
        if (this.f1680n == 0) {
            return null;
        }
        Drawable b = C0485b.m2214b(this.f1667a.m2464e(), this.f1680n);
        this.f1680n = 0;
        this.f1679m = b;
        return m2484a(b);
    }

    public ColorStateList getIconTintList() {
        return this.f1686t;
    }

    public Mode getIconTintMode() {
        return this.f1687u;
    }

    public Intent getIntent() {
        return this.f1674h;
    }

    @CapturedViewProperty
    public int getItemId() {
        return this.f1668b;
    }

    public ContextMenuInfo getMenuInfo() {
        return this.f1666E;
    }

    public int getNumericModifiers() {
        return this.f1676j;
    }

    public char getNumericShortcut() {
        return this.f1675i;
    }

    public int getOrder() {
        return this.f1670d;
    }

    public SubMenu getSubMenu() {
        return this.f1681o;
    }

    @CapturedViewProperty
    public CharSequence getTitle() {
        return this.f1672f;
    }

    public CharSequence getTitleCondensed() {
        CharSequence charSequence = this.f1673g != null ? this.f1673g : this.f1672f;
        return (VERSION.SDK_INT >= 18 || charSequence == null || (charSequence instanceof String)) ? charSequence : charSequence.toString();
    }

    public CharSequence getTooltipText() {
        return this.f1685s;
    }

    public void m2506h() {
        this.f1667a.m2453b(this);
    }

    public boolean hasSubMenu() {
        return this.f1681o != null;
    }

    public boolean m2507i() {
        return this.f1667a.m2477q();
    }

    public boolean isActionViewExpanded() {
        return this.f1665D;
    }

    public boolean isCheckable() {
        return (this.f1691y & 1) == 1;
    }

    public boolean isChecked() {
        return (this.f1691y & 2) == 2;
    }

    public boolean isEnabled() {
        return (this.f1691y & 16) != 0;
    }

    public boolean isVisible() {
        return (this.f1663B == null || !this.f1663B.mo434b()) ? (this.f1691y & 8) == 0 : (this.f1691y & 8) == 0 && this.f1663B.mo435c();
    }

    public boolean m2508j() {
        return (this.f1691y & 32) == 32;
    }

    public boolean m2509k() {
        return (this.f1692z & 1) == 1;
    }

    public boolean m2510l() {
        return (this.f1692z & 2) == 2;
    }

    public boolean m2511m() {
        return (this.f1692z & 4) == 4;
    }

    public boolean m2512n() {
        if ((this.f1692z & 8) == 0) {
            return false;
        }
        if (this.f1662A == null && this.f1663B != null) {
            this.f1662A = this.f1663B.mo432a((MenuItem) this);
        }
        return this.f1662A != null;
    }

    public MenuItem setActionProvider(ActionProvider actionProvider) {
        throw new UnsupportedOperationException("This is not supported, use MenuItemCompat.setActionProvider()");
    }

    public /* synthetic */ MenuItem setActionView(int i) {
        return m2485a(i);
    }

    public /* synthetic */ MenuItem setActionView(View view) {
        return m2487a(view);
    }

    public MenuItem setAlphabeticShortcut(char c) {
        if (this.f1677k != c) {
            this.f1677k = Character.toLowerCase(c);
            this.f1667a.m2455b(false);
        }
        return this;
    }

    public MenuItem setAlphabeticShortcut(char c, int i) {
        if (!(this.f1677k == c && this.f1678l == i)) {
            this.f1677k = Character.toLowerCase(c);
            this.f1678l = KeyEvent.normalizeMetaState(i);
            this.f1667a.m2455b(false);
        }
        return this;
    }

    public MenuItem setCheckable(boolean z) {
        int i = this.f1691y;
        this.f1691y = (z ? 1 : 0) | (this.f1691y & -2);
        if (i != this.f1691y) {
            this.f1667a.m2455b(false);
        }
        return this;
    }

    public MenuItem setChecked(boolean z) {
        if ((this.f1691y & 4) != 0) {
            this.f1667a.m2445a((MenuItem) this);
        } else {
            m2496b(z);
        }
        return this;
    }

    public /* synthetic */ MenuItem setContentDescription(CharSequence charSequence) {
        return mo380a(charSequence);
    }

    public MenuItem setEnabled(boolean z) {
        if (z) {
            this.f1691y |= 16;
        } else {
            this.f1691y &= -17;
        }
        this.f1667a.m2455b(false);
        return this;
    }

    public MenuItem setIcon(int i) {
        this.f1679m = null;
        this.f1680n = i;
        this.f1690x = true;
        this.f1667a.m2455b(false);
        return this;
    }

    public MenuItem setIcon(Drawable drawable) {
        this.f1680n = 0;
        this.f1679m = drawable;
        this.f1690x = true;
        this.f1667a.m2455b(false);
        return this;
    }

    public MenuItem setIconTintList(ColorStateList colorStateList) {
        this.f1686t = colorStateList;
        this.f1688v = true;
        this.f1690x = true;
        this.f1667a.m2455b(false);
        return this;
    }

    public MenuItem setIconTintMode(Mode mode) {
        this.f1687u = mode;
        this.f1689w = true;
        this.f1690x = true;
        this.f1667a.m2455b(false);
        return this;
    }

    public MenuItem setIntent(Intent intent) {
        this.f1674h = intent;
        return this;
    }

    public MenuItem setNumericShortcut(char c) {
        if (this.f1675i != c) {
            this.f1675i = c;
            this.f1667a.m2455b(false);
        }
        return this;
    }

    public MenuItem setNumericShortcut(char c, int i) {
        if (!(this.f1675i == c && this.f1676j == i)) {
            this.f1675i = c;
            this.f1676j = KeyEvent.normalizeMetaState(i);
            this.f1667a.m2455b(false);
        }
        return this;
    }

    public MenuItem setOnActionExpandListener(OnActionExpandListener onActionExpandListener) {
        this.f1664C = onActionExpandListener;
        return this;
    }

    public MenuItem setOnMenuItemClickListener(OnMenuItemClickListener onMenuItemClickListener) {
        this.f1683q = onMenuItemClickListener;
        return this;
    }

    public MenuItem setShortcut(char c, char c2) {
        this.f1675i = c;
        this.f1677k = Character.toLowerCase(c2);
        this.f1667a.m2455b(false);
        return this;
    }

    public MenuItem setShortcut(char c, char c2, int i, int i2) {
        this.f1675i = c;
        this.f1676j = KeyEvent.normalizeMetaState(i);
        this.f1677k = Character.toLowerCase(c2);
        this.f1678l = KeyEvent.normalizeMetaState(i2);
        this.f1667a.m2455b(false);
        return this;
    }

    public void setShowAsAction(int i) {
        switch (i & 3) {
            case 0:
            case 1:
            case 2:
                this.f1692z = i;
                this.f1667a.m2453b(this);
                return;
            default:
                throw new IllegalArgumentException("SHOW_AS_ACTION_ALWAYS, SHOW_AS_ACTION_IF_ROOM, and SHOW_AS_ACTION_NEVER are mutually exclusive.");
        }
    }

    public /* synthetic */ MenuItem setShowAsActionFlags(int i) {
        return m2494b(i);
    }

    public MenuItem setTitle(int i) {
        return setTitle(this.f1667a.m2464e().getString(i));
    }

    public MenuItem setTitle(CharSequence charSequence) {
        this.f1672f = charSequence;
        this.f1667a.m2455b(false);
        if (this.f1681o != null) {
            this.f1681o.setHeaderTitle(charSequence);
        }
        return this;
    }

    public MenuItem setTitleCondensed(CharSequence charSequence) {
        this.f1673g = charSequence;
        if (charSequence == null) {
            CharSequence charSequence2 = this.f1672f;
        }
        this.f1667a.m2455b(false);
        return this;
    }

    public /* synthetic */ MenuItem setTooltipText(CharSequence charSequence) {
        return mo382b(charSequence);
    }

    public MenuItem setVisible(boolean z) {
        if (m2499c(z)) {
            this.f1667a.m2442a(this);
        }
        return this;
    }

    public String toString() {
        return this.f1672f != null ? this.f1672f.toString() : null;
    }
}
