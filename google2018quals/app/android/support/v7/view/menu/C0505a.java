package android.support.v7.view.menu;

import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.support.v4.p005c.p006a.C0179a;
import android.support.v4.p009b.C0092a;
import android.support.v4.p012d.p013a.C0203b;
import android.support.v4.p017h.C0286c;
import android.view.ActionProvider;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.KeyEvent;
import android.view.MenuItem;
import android.view.MenuItem.OnActionExpandListener;
import android.view.MenuItem.OnMenuItemClickListener;
import android.view.SubMenu;
import android.view.View;

public class C0505a implements C0203b {
    private final int f1537a;
    private final int f1538b;
    private final int f1539c;
    private final int f1540d;
    private CharSequence f1541e;
    private CharSequence f1542f;
    private Intent f1543g;
    private char f1544h;
    private int f1545i = 4096;
    private char f1546j;
    private int f1547k = 4096;
    private Drawable f1548l;
    private int f1549m = 0;
    private Context f1550n;
    private OnMenuItemClickListener f1551o;
    private CharSequence f1552p;
    private CharSequence f1553q;
    private ColorStateList f1554r = null;
    private Mode f1555s = null;
    private boolean f1556t = false;
    private boolean f1557u = false;
    private int f1558v = 16;

    public C0505a(Context context, int i, int i2, int i3, int i4, CharSequence charSequence) {
        this.f1550n = context;
        this.f1537a = i2;
        this.f1538b = i;
        this.f1539c = i3;
        this.f1540d = i4;
        this.f1541e = charSequence;
    }

    private void m2316b() {
        if (this.f1548l == null) {
            return;
        }
        if (this.f1556t || this.f1557u) {
            this.f1548l = C0179a.m943f(this.f1548l);
            this.f1548l = this.f1548l.mutate();
            if (this.f1556t) {
                C0179a.m933a(this.f1548l, this.f1554r);
            }
            if (this.f1557u) {
                C0179a.m936a(this.f1548l, this.f1555s);
            }
        }
    }

    public C0203b m2317a(int i) {
        throw new UnsupportedOperationException();
    }

    public C0203b mo379a(C0286c c0286c) {
        throw new UnsupportedOperationException();
    }

    public C0203b m2319a(View view) {
        throw new UnsupportedOperationException();
    }

    public C0203b mo380a(CharSequence charSequence) {
        this.f1552p = charSequence;
        return this;
    }

    public C0286c mo381a() {
        return null;
    }

    public C0203b m2322b(int i) {
        setShowAsAction(i);
        return this;
    }

    public C0203b mo382b(CharSequence charSequence) {
        this.f1553q = charSequence;
        return this;
    }

    public boolean collapseActionView() {
        return false;
    }

    public boolean expandActionView() {
        return false;
    }

    public ActionProvider getActionProvider() {
        throw new UnsupportedOperationException();
    }

    public View getActionView() {
        return null;
    }

    public int getAlphabeticModifiers() {
        return this.f1547k;
    }

    public char getAlphabeticShortcut() {
        return this.f1546j;
    }

    public CharSequence getContentDescription() {
        return this.f1552p;
    }

    public int getGroupId() {
        return this.f1538b;
    }

    public Drawable getIcon() {
        return this.f1548l;
    }

    public ColorStateList getIconTintList() {
        return this.f1554r;
    }

    public Mode getIconTintMode() {
        return this.f1555s;
    }

    public Intent getIntent() {
        return this.f1543g;
    }

    public int getItemId() {
        return this.f1537a;
    }

    public ContextMenuInfo getMenuInfo() {
        return null;
    }

    public int getNumericModifiers() {
        return this.f1545i;
    }

    public char getNumericShortcut() {
        return this.f1544h;
    }

    public int getOrder() {
        return this.f1540d;
    }

    public SubMenu getSubMenu() {
        return null;
    }

    public CharSequence getTitle() {
        return this.f1541e;
    }

    public CharSequence getTitleCondensed() {
        return this.f1542f != null ? this.f1542f : this.f1541e;
    }

    public CharSequence getTooltipText() {
        return this.f1553q;
    }

    public boolean hasSubMenu() {
        return false;
    }

    public boolean isActionViewExpanded() {
        return false;
    }

    public boolean isCheckable() {
        return (this.f1558v & 1) != 0;
    }

    public boolean isChecked() {
        return (this.f1558v & 2) != 0;
    }

    public boolean isEnabled() {
        return (this.f1558v & 16) != 0;
    }

    public boolean isVisible() {
        return (this.f1558v & 8) == 0;
    }

    public MenuItem setActionProvider(ActionProvider actionProvider) {
        throw new UnsupportedOperationException();
    }

    public /* synthetic */ MenuItem setActionView(int i) {
        return m2317a(i);
    }

    public /* synthetic */ MenuItem setActionView(View view) {
        return m2319a(view);
    }

    public MenuItem setAlphabeticShortcut(char c) {
        this.f1546j = Character.toLowerCase(c);
        return this;
    }

    public MenuItem setAlphabeticShortcut(char c, int i) {
        this.f1546j = Character.toLowerCase(c);
        this.f1547k = KeyEvent.normalizeMetaState(i);
        return this;
    }

    public MenuItem setCheckable(boolean z) {
        this.f1558v = (z ? 1 : 0) | (this.f1558v & -2);
        return this;
    }

    public MenuItem setChecked(boolean z) {
        this.f1558v = (z ? 2 : 0) | (this.f1558v & -3);
        return this;
    }

    public /* synthetic */ MenuItem setContentDescription(CharSequence charSequence) {
        return mo380a(charSequence);
    }

    public MenuItem setEnabled(boolean z) {
        this.f1558v = (z ? 16 : 0) | (this.f1558v & -17);
        return this;
    }

    public MenuItem setIcon(int i) {
        this.f1549m = i;
        this.f1548l = C0092a.m383a(this.f1550n, i);
        m2316b();
        return this;
    }

    public MenuItem setIcon(Drawable drawable) {
        this.f1548l = drawable;
        this.f1549m = 0;
        m2316b();
        return this;
    }

    public MenuItem setIconTintList(ColorStateList colorStateList) {
        this.f1554r = colorStateList;
        this.f1556t = true;
        m2316b();
        return this;
    }

    public MenuItem setIconTintMode(Mode mode) {
        this.f1555s = mode;
        this.f1557u = true;
        m2316b();
        return this;
    }

    public MenuItem setIntent(Intent intent) {
        this.f1543g = intent;
        return this;
    }

    public MenuItem setNumericShortcut(char c) {
        this.f1544h = c;
        return this;
    }

    public MenuItem setNumericShortcut(char c, int i) {
        this.f1544h = c;
        this.f1545i = KeyEvent.normalizeMetaState(i);
        return this;
    }

    public MenuItem setOnActionExpandListener(OnActionExpandListener onActionExpandListener) {
        throw new UnsupportedOperationException();
    }

    public MenuItem setOnMenuItemClickListener(OnMenuItemClickListener onMenuItemClickListener) {
        this.f1551o = onMenuItemClickListener;
        return this;
    }

    public MenuItem setShortcut(char c, char c2) {
        this.f1544h = c;
        this.f1546j = Character.toLowerCase(c2);
        return this;
    }

    public MenuItem setShortcut(char c, char c2, int i, int i2) {
        this.f1544h = c;
        this.f1545i = KeyEvent.normalizeMetaState(i);
        this.f1546j = Character.toLowerCase(c2);
        this.f1547k = KeyEvent.normalizeMetaState(i2);
        return this;
    }

    public void setShowAsAction(int i) {
    }

    public /* synthetic */ MenuItem setShowAsActionFlags(int i) {
        return m2322b(i);
    }

    public MenuItem setTitle(int i) {
        this.f1541e = this.f1550n.getResources().getString(i);
        return this;
    }

    public MenuItem setTitle(CharSequence charSequence) {
        this.f1541e = charSequence;
        return this;
    }

    public MenuItem setTitleCondensed(CharSequence charSequence) {
        this.f1542f = charSequence;
        return this;
    }

    public /* synthetic */ MenuItem setTooltipText(CharSequence charSequence) {
        return mo382b(charSequence);
    }

    public MenuItem setVisible(boolean z) {
        this.f1558v = (z ? 0 : 8) | (this.f1558v & 8);
        return this;
    }
}
