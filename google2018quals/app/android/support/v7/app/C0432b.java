package android.support.v7.app;

import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnKeyListener;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.v7.app.AlertController.C0422a;
import android.support.v7.p020a.C0411a.C0401a;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.KeyEvent;
import android.view.View;
import android.widget.ListAdapter;

public class C0432b extends C0431l implements DialogInterface {
    final AlertController f1229a = new AlertController(getContext(), this, getWindow());

    public static class C0429a {
        private final C0422a f1226a;
        private final int f1227b;

        public C0429a(Context context) {
            this(context, C0432b.m1913a(context, 0));
        }

        public C0429a(Context context, int i) {
            this.f1226a = new C0422a(new ContextThemeWrapper(context, C0432b.m1913a(context, i)));
            this.f1227b = i;
        }

        public Context m1897a() {
            return this.f1226a.f1157a;
        }

        public C0429a m1898a(OnKeyListener onKeyListener) {
            this.f1226a.f1174r = onKeyListener;
            return this;
        }

        public C0429a m1899a(Drawable drawable) {
            this.f1226a.f1160d = drawable;
            return this;
        }

        public C0429a m1900a(View view) {
            this.f1226a.f1163g = view;
            return this;
        }

        public C0429a m1901a(ListAdapter listAdapter, OnClickListener onClickListener) {
            this.f1226a.f1176t = listAdapter;
            this.f1226a.f1177u = onClickListener;
            return this;
        }

        public C0429a m1902a(CharSequence charSequence) {
            this.f1226a.f1162f = charSequence;
            return this;
        }

        public C0432b m1903b() {
            C0432b c0432b = new C0432b(this.f1226a.f1157a, this.f1227b);
            this.f1226a.m1847a(c0432b.f1229a);
            c0432b.setCancelable(this.f1226a.f1171o);
            if (this.f1226a.f1171o) {
                c0432b.setCanceledOnTouchOutside(true);
            }
            c0432b.setOnCancelListener(this.f1226a.f1172p);
            c0432b.setOnDismissListener(this.f1226a.f1173q);
            if (this.f1226a.f1174r != null) {
                c0432b.setOnKeyListener(this.f1226a.f1174r);
            }
            return c0432b;
        }
    }

    protected C0432b(Context context, int i) {
        super(context, C0432b.m1913a(context, i));
    }

    static int m1913a(Context context, int i) {
        if (((i >>> 24) & 255) >= 1) {
            return i;
        }
        TypedValue typedValue = new TypedValue();
        context.getTheme().resolveAttribute(C0401a.alertDialogTheme, typedValue, true);
        return typedValue.resourceId;
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.f1229a.m1860a();
    }

    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        return this.f1229a.m1866a(i, keyEvent) ? true : super.onKeyDown(i, keyEvent);
    }

    public boolean onKeyUp(int i, KeyEvent keyEvent) {
        return this.f1229a.m1870b(i, keyEvent) ? true : super.onKeyUp(i, keyEvent);
    }

    public void setTitle(CharSequence charSequence) {
        super.setTitle(charSequence);
        this.f1229a.m1865a(charSequence);
    }
}
