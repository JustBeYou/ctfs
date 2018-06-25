package android.support.v7.view.menu;

import android.content.Context;
import android.support.v4.p012d.p013a.C0203b;
import android.support.v4.p017h.C0286c.C0285b;
import android.support.v7.view.menu.C0529k.C0525a;
import android.view.ActionProvider;
import android.view.ActionProvider.VisibilityListener;
import android.view.MenuItem;
import android.view.View;

class C0531l extends C0529k {

    class C0530a extends C0525a implements VisibilityListener {
        C0285b f1699c;
        final /* synthetic */ C0531l f1700d;

        public C0530a(C0531l c0531l, Context context, ActionProvider actionProvider) {
            this.f1700d = c0531l;
            super(c0531l, context, actionProvider);
        }

        public View mo432a(MenuItem menuItem) {
            return this.a.onCreateActionView(menuItem);
        }

        public void mo433a(C0285b c0285b) {
            VisibilityListener visibilityListener;
            this.f1699c = c0285b;
            ActionProvider actionProvider = this.a;
            if (c0285b == null) {
                visibilityListener = null;
            }
            actionProvider.setVisibilityListener(visibilityListener);
        }

        public boolean mo434b() {
            return this.a.overridesItemVisibility();
        }

        public boolean mo435c() {
            return this.a.isVisible();
        }

        public void onActionProviderVisibilityChanged(boolean z) {
            if (this.f1699c != null) {
                this.f1699c.mo425a(z);
            }
        }
    }

    C0531l(Context context, C0203b c0203b) {
        super(context, c0203b);
    }

    C0525a mo436a(ActionProvider actionProvider) {
        return new C0530a(this, this.a, actionProvider);
    }
}
