package android.support.v7.view.menu;

import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.support.v4.p012d.p013a.C0203b;
import android.support.v4.p017h.C0286c;
import android.support.v7.view.C0489c;
import android.util.Log;
import android.view.ActionProvider;
import android.view.CollapsibleActionView;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.MenuItem;
import android.view.MenuItem.OnActionExpandListener;
import android.view.MenuItem.OnMenuItemClickListener;
import android.view.SubMenu;
import android.view.View;
import android.widget.FrameLayout;
import java.lang.reflect.Method;

public class C0529k extends C0509c<C0203b> implements MenuItem {
    private Method f1698c;

    class C0525a extends C0286c {
        final ActionProvider f1693a;
        final /* synthetic */ C0529k f1694b;

        public C0525a(C0529k c0529k, Context context, ActionProvider actionProvider) {
            this.f1694b = c0529k;
            super(context);
            this.f1693a = actionProvider;
        }

        public View mo426a() {
            return this.f1693a.onCreateActionView();
        }

        public void mo427a(SubMenu subMenu) {
            this.f1693a.onPrepareSubMenu(this.f1694b.m2350a(subMenu));
        }

        public boolean mo428d() {
            return this.f1693a.onPerformDefaultAction();
        }

        public boolean mo429e() {
            return this.f1693a.hasSubMenu();
        }
    }

    static class C0526b extends FrameLayout implements C0489c {
        final CollapsibleActionView f1695a;

        C0526b(View view) {
            super(view.getContext());
            this.f1695a = (CollapsibleActionView) view;
            addView(view);
        }

        public void mo430a() {
            this.f1695a.onActionViewExpanded();
        }

        public void mo431b() {
            this.f1695a.onActionViewCollapsed();
        }

        View m2519c() {
            return (View) this.f1695a;
        }
    }

    private class C0527c extends C0508d<OnActionExpandListener> implements OnActionExpandListener {
        final /* synthetic */ C0529k f1696a;

        C0527c(C0529k c0529k, OnActionExpandListener onActionExpandListener) {
            this.f1696a = c0529k;
            super(onActionExpandListener);
        }

        public boolean onMenuItemActionCollapse(MenuItem menuItem) {
            return ((OnActionExpandListener) this.b).onMenuItemActionCollapse(this.f1696a.m2349a(menuItem));
        }

        public boolean onMenuItemActionExpand(MenuItem menuItem) {
            return ((OnActionExpandListener) this.b).onMenuItemActionExpand(this.f1696a.m2349a(menuItem));
        }
    }

    private class C0528d extends C0508d<OnMenuItemClickListener> implements OnMenuItemClickListener {
        final /* synthetic */ C0529k f1697a;

        C0528d(C0529k c0529k, OnMenuItemClickListener onMenuItemClickListener) {
            this.f1697a = c0529k;
            super(onMenuItemClickListener);
        }

        public boolean onMenuItemClick(MenuItem menuItem) {
            return ((OnMenuItemClickListener) this.b).onMenuItemClick(this.f1697a.m2349a(menuItem));
        }
    }

    C0529k(Context context, C0203b c0203b) {
        super(context, c0203b);
    }

    C0525a mo436a(ActionProvider actionProvider) {
        return new C0525a(this, this.a, actionProvider);
    }

    public void m2521a(boolean z) {
        try {
            if (this.f1698c == null) {
                this.f1698c = ((C0203b) this.b).getClass().getDeclaredMethod("setExclusiveCheckable", new Class[]{Boolean.TYPE});
            }
            this.f1698c.invoke(this.b, new Object[]{Boolean.valueOf(z)});
        } catch (Throwable e) {
            Log.w("MenuItemWrapper", "Error while calling setExclusiveCheckable", e);
        }
    }

    public boolean collapseActionView() {
        return ((C0203b) this.b).collapseActionView();
    }

    public boolean expandActionView() {
        return ((C0203b) this.b).expandActionView();
    }

    public ActionProvider getActionProvider() {
        C0286c a = ((C0203b) this.b).mo381a();
        return a instanceof C0525a ? ((C0525a) a).f1693a : null;
    }

    public View getActionView() {
        View actionView = ((C0203b) this.b).getActionView();
        return actionView instanceof C0526b ? ((C0526b) actionView).m2519c() : actionView;
    }

    public int getAlphabeticModifiers() {
        return ((C0203b) this.b).getAlphabeticModifiers();
    }

    public char getAlphabeticShortcut() {
        return ((C0203b) this.b).getAlphabeticShortcut();
    }

    public CharSequence getContentDescription() {
        return ((C0203b) this.b).getContentDescription();
    }

    public int getGroupId() {
        return ((C0203b) this.b).getGroupId();
    }

    public Drawable getIcon() {
        return ((C0203b) this.b).getIcon();
    }

    public ColorStateList getIconTintList() {
        return ((C0203b) this.b).getIconTintList();
    }

    public Mode getIconTintMode() {
        return ((C0203b) this.b).getIconTintMode();
    }

    public Intent getIntent() {
        return ((C0203b) this.b).getIntent();
    }

    public int getItemId() {
        return ((C0203b) this.b).getItemId();
    }

    public ContextMenuInfo getMenuInfo() {
        return ((C0203b) this.b).getMenuInfo();
    }

    public int getNumericModifiers() {
        return ((C0203b) this.b).getNumericModifiers();
    }

    public char getNumericShortcut() {
        return ((C0203b) this.b).getNumericShortcut();
    }

    public int getOrder() {
        return ((C0203b) this.b).getOrder();
    }

    public SubMenu getSubMenu() {
        return m2350a(((C0203b) this.b).getSubMenu());
    }

    public CharSequence getTitle() {
        return ((C0203b) this.b).getTitle();
    }

    public CharSequence getTitleCondensed() {
        return ((C0203b) this.b).getTitleCondensed();
    }

    public CharSequence getTooltipText() {
        return ((C0203b) this.b).getTooltipText();
    }

    public boolean hasSubMenu() {
        return ((C0203b) this.b).hasSubMenu();
    }

    public boolean isActionViewExpanded() {
        return ((C0203b) this.b).isActionViewExpanded();
    }

    public boolean isCheckable() {
        return ((C0203b) this.b).isCheckable();
    }

    public boolean isChecked() {
        return ((C0203b) this.b).isChecked();
    }

    public boolean isEnabled() {
        return ((C0203b) this.b).isEnabled();
    }

    public boolean isVisible() {
        return ((C0203b) this.b).isVisible();
    }

    public MenuItem setActionProvider(ActionProvider actionProvider) {
        ((C0203b) this.b).mo379a(actionProvider != null ? mo436a(actionProvider) : null);
        return this;
    }

    public MenuItem setActionView(int i) {
        ((C0203b) this.b).setActionView(i);
        View actionView = ((C0203b) this.b).getActionView();
        if (actionView instanceof CollapsibleActionView) {
            ((C0203b) this.b).setActionView(new C0526b(actionView));
        }
        return this;
    }

    public MenuItem setActionView(View view) {
        if (view instanceof CollapsibleActionView) {
            view = new C0526b(view);
        }
        ((C0203b) this.b).setActionView(view);
        return this;
    }

    public MenuItem setAlphabeticShortcut(char c) {
        ((C0203b) this.b).setAlphabeticShortcut(c);
        return this;
    }

    public MenuItem setAlphabeticShortcut(char c, int i) {
        ((C0203b) this.b).setAlphabeticShortcut(c, i);
        return this;
    }

    public MenuItem setCheckable(boolean z) {
        ((C0203b) this.b).setCheckable(z);
        return this;
    }

    public MenuItem setChecked(boolean z) {
        ((C0203b) this.b).setChecked(z);
        return this;
    }

    public MenuItem setContentDescription(CharSequence charSequence) {
        ((C0203b) this.b).mo380a(charSequence);
        return this;
    }

    public MenuItem setEnabled(boolean z) {
        ((C0203b) this.b).setEnabled(z);
        return this;
    }

    public MenuItem setIcon(int i) {
        ((C0203b) this.b).setIcon(i);
        return this;
    }

    public MenuItem setIcon(Drawable drawable) {
        ((C0203b) this.b).setIcon(drawable);
        return this;
    }

    public MenuItem setIconTintList(ColorStateList colorStateList) {
        ((C0203b) this.b).setIconTintList(colorStateList);
        return this;
    }

    public MenuItem setIconTintMode(Mode mode) {
        ((C0203b) this.b).setIconTintMode(mode);
        return this;
    }

    public MenuItem setIntent(Intent intent) {
        ((C0203b) this.b).setIntent(intent);
        return this;
    }

    public MenuItem setNumericShortcut(char c) {
        ((C0203b) this.b).setNumericShortcut(c);
        return this;
    }

    public MenuItem setNumericShortcut(char c, int i) {
        ((C0203b) this.b).setNumericShortcut(c, i);
        return this;
    }

    public MenuItem setOnActionExpandListener(OnActionExpandListener onActionExpandListener) {
        ((C0203b) this.b).setOnActionExpandListener(onActionExpandListener != null ? new C0527c(this, onActionExpandListener) : null);
        return this;
    }

    public MenuItem setOnMenuItemClickListener(OnMenuItemClickListener onMenuItemClickListener) {
        ((C0203b) this.b).setOnMenuItemClickListener(onMenuItemClickListener != null ? new C0528d(this, onMenuItemClickListener) : null);
        return this;
    }

    public MenuItem setShortcut(char c, char c2) {
        ((C0203b) this.b).setShortcut(c, c2);
        return this;
    }

    public MenuItem setShortcut(char c, char c2, int i, int i2) {
        ((C0203b) this.b).setShortcut(c, c2, i, i2);
        return this;
    }

    public void setShowAsAction(int i) {
        ((C0203b) this.b).setShowAsAction(i);
    }

    public MenuItem setShowAsActionFlags(int i) {
        ((C0203b) this.b).setShowAsActionFlags(i);
        return this;
    }

    public MenuItem setTitle(int i) {
        ((C0203b) this.b).setTitle(i);
        return this;
    }

    public MenuItem setTitle(CharSequence charSequence) {
        ((C0203b) this.b).setTitle(charSequence);
        return this;
    }

    public MenuItem setTitleCondensed(CharSequence charSequence) {
        ((C0203b) this.b).setTitleCondensed(charSequence);
        return this;
    }

    public MenuItem setTooltipText(CharSequence charSequence) {
        ((C0203b) this.b).mo382b(charSequence);
        return this;
    }

    public MenuItem setVisible(boolean z) {
        return ((C0203b) this.b).setVisible(z);
    }
}
