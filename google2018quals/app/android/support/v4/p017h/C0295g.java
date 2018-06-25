package android.support.v4.p017h;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff.Mode;
import android.os.Build.VERSION;
import android.support.v4.p012d.p013a.C0203b;
import android.util.Log;
import android.view.MenuItem;

public final class C0295g {
    static final C0292c f920a;

    interface C0292c {
        void mo120a(MenuItem menuItem, char c, int i);

        void mo121a(MenuItem menuItem, ColorStateList colorStateList);

        void mo122a(MenuItem menuItem, Mode mode);

        void mo123a(MenuItem menuItem, CharSequence charSequence);

        void mo124b(MenuItem menuItem, char c, int i);

        void mo125b(MenuItem menuItem, CharSequence charSequence);
    }

    static class C0293b implements C0292c {
        C0293b() {
        }

        public void mo120a(MenuItem menuItem, char c, int i) {
        }

        public void mo121a(MenuItem menuItem, ColorStateList colorStateList) {
        }

        public void mo122a(MenuItem menuItem, Mode mode) {
        }

        public void mo123a(MenuItem menuItem, CharSequence charSequence) {
        }

        public void mo124b(MenuItem menuItem, char c, int i) {
        }

        public void mo125b(MenuItem menuItem, CharSequence charSequence) {
        }
    }

    static class C0294a extends C0293b {
        C0294a() {
        }

        public void mo120a(MenuItem menuItem, char c, int i) {
            menuItem.setAlphabeticShortcut(c, i);
        }

        public void mo121a(MenuItem menuItem, ColorStateList colorStateList) {
            menuItem.setIconTintList(colorStateList);
        }

        public void mo122a(MenuItem menuItem, Mode mode) {
            menuItem.setIconTintMode(mode);
        }

        public void mo123a(MenuItem menuItem, CharSequence charSequence) {
            menuItem.setContentDescription(charSequence);
        }

        public void mo124b(MenuItem menuItem, char c, int i) {
            menuItem.setNumericShortcut(c, i);
        }

        public void mo125b(MenuItem menuItem, CharSequence charSequence) {
            menuItem.setTooltipText(charSequence);
        }
    }

    static {
        if (VERSION.SDK_INT >= 26) {
            f920a = new C0294a();
        } else {
            f920a = new C0293b();
        }
    }

    public static MenuItem m1294a(MenuItem menuItem, C0286c c0286c) {
        if (menuItem instanceof C0203b) {
            return ((C0203b) menuItem).mo379a(c0286c);
        }
        Log.w("MenuItemCompat", "setActionProvider: item does not implement SupportMenuItem; ignoring");
        return menuItem;
    }

    public static void m1295a(MenuItem menuItem, char c, int i) {
        if (menuItem instanceof C0203b) {
            ((C0203b) menuItem).setNumericShortcut(c, i);
        } else {
            f920a.mo124b(menuItem, c, i);
        }
    }

    public static void m1296a(MenuItem menuItem, ColorStateList colorStateList) {
        if (menuItem instanceof C0203b) {
            ((C0203b) menuItem).setIconTintList(colorStateList);
        } else {
            f920a.mo121a(menuItem, colorStateList);
        }
    }

    public static void m1297a(MenuItem menuItem, Mode mode) {
        if (menuItem instanceof C0203b) {
            ((C0203b) menuItem).setIconTintMode(mode);
        } else {
            f920a.mo122a(menuItem, mode);
        }
    }

    public static void m1298a(MenuItem menuItem, CharSequence charSequence) {
        if (menuItem instanceof C0203b) {
            ((C0203b) menuItem).mo380a(charSequence);
        } else {
            f920a.mo123a(menuItem, charSequence);
        }
    }

    public static void m1299b(MenuItem menuItem, char c, int i) {
        if (menuItem instanceof C0203b) {
            ((C0203b) menuItem).setAlphabeticShortcut(c, i);
        } else {
            f920a.mo120a(menuItem, c, i);
        }
    }

    public static void m1300b(MenuItem menuItem, CharSequence charSequence) {
        if (menuItem instanceof C0203b) {
            ((C0203b) menuItem).mo382b(charSequence);
        } else {
            f920a.mo125b(menuItem, charSequence);
        }
    }
}
