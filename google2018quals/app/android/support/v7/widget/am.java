package android.support.v7.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Build.VERSION;
import android.support.v7.view.menu.C0520g;
import android.support.v7.view.menu.C0521h;
import android.support.v7.view.menu.ListMenuItemView;
import android.transition.Transition;
import android.util.AttributeSet;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.widget.HeaderViewListAdapter;
import android.widget.ListAdapter;
import android.widget.PopupWindow;
import java.lang.reflect.Method;

public class am extends aj implements al {
    private static Method f2062a;
    private al f2063b;

    public static class C0583a extends af {
        final int f2058g;
        final int f2059h;
        private al f2060i;
        private MenuItem f2061j;

        public C0583a(Context context, boolean z) {
            super(context, z);
            Configuration configuration = context.getResources().getConfiguration();
            if (VERSION.SDK_INT < 17 || 1 != configuration.getLayoutDirection()) {
                this.f2058g = 22;
                this.f2059h = 21;
                return;
            }
            this.f2058g = 21;
            this.f2059h = 22;
        }

        public /* bridge */ /* synthetic */ boolean mo483a(MotionEvent motionEvent, int i) {
            return super.mo483a(motionEvent, i);
        }

        public /* bridge */ /* synthetic */ boolean hasFocus() {
            return super.hasFocus();
        }

        public /* bridge */ /* synthetic */ boolean hasWindowFocus() {
            return super.hasWindowFocus();
        }

        public /* bridge */ /* synthetic */ boolean isFocused() {
            return super.isFocused();
        }

        public /* bridge */ /* synthetic */ boolean isInTouchMode() {
            return super.isInTouchMode();
        }

        public boolean onHoverEvent(MotionEvent motionEvent) {
            if (this.f2060i != null) {
                int headersCount;
                C0520g c0520g;
                MenuItem a;
                MenuItem menuItem;
                C0521h a2;
                ListAdapter adapter = getAdapter();
                if (adapter instanceof HeaderViewListAdapter) {
                    HeaderViewListAdapter headerViewListAdapter = (HeaderViewListAdapter) adapter;
                    headersCount = headerViewListAdapter.getHeadersCount();
                    c0520g = (C0520g) headerViewListAdapter.getWrappedAdapter();
                } else {
                    headersCount = 0;
                    c0520g = (C0520g) adapter;
                }
                if (motionEvent.getAction() != 10) {
                    int pointToPosition = pointToPosition((int) motionEvent.getX(), (int) motionEvent.getY());
                    if (pointToPosition != -1) {
                        headersCount = pointToPosition - headersCount;
                        if (headersCount >= 0 && headersCount < c0520g.getCount()) {
                            a = c0520g.m2421a(headersCount);
                            menuItem = this.f2061j;
                            if (menuItem != a) {
                                a2 = c0520g.m2420a();
                                if (menuItem != null) {
                                    this.f2060i.mo410a(a2, menuItem);
                                }
                                this.f2061j = a;
                                if (a != null) {
                                    this.f2060i.mo411b(a2, a);
                                }
                            }
                        }
                    }
                }
                a = null;
                menuItem = this.f2061j;
                if (menuItem != a) {
                    a2 = c0520g.m2420a();
                    if (menuItem != null) {
                        this.f2060i.mo410a(a2, menuItem);
                    }
                    this.f2061j = a;
                    if (a != null) {
                        this.f2060i.mo411b(a2, a);
                    }
                }
            }
            return super.onHoverEvent(motionEvent);
        }

        public boolean onKeyDown(int i, KeyEvent keyEvent) {
            ListMenuItemView listMenuItemView = (ListMenuItemView) getSelectedView();
            if (listMenuItemView != null && i == this.f2058g) {
                if (listMenuItemView.isEnabled() && listMenuItemView.getItemData().hasSubMenu()) {
                    performItemClick(listMenuItemView, getSelectedItemPosition(), getSelectedItemId());
                }
                return true;
            } else if (listMenuItemView == null || i != this.f2059h) {
                return super.onKeyDown(i, keyEvent);
            } else {
                setSelection(-1);
                ((C0520g) getAdapter()).m2420a().m2447a(false);
                return true;
            }
        }

        public void setHoverListener(al alVar) {
            this.f2060i = alVar;
        }
    }

    static {
        try {
            f2062a = PopupWindow.class.getDeclaredMethod("setTouchModal", new Class[]{Boolean.TYPE});
        } catch (NoSuchMethodException e) {
            Log.i("MenuPopupWindow", "Could not find method setTouchModal() on PopupWindow. Oh well.");
        }
    }

    public am(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
    }

    af mo488a(Context context, boolean z) {
        af c0583a = new C0583a(context, z);
        c0583a.setHoverListener(this);
        return c0583a;
    }

    public void mo410a(C0521h c0521h, MenuItem menuItem) {
        if (this.f2063b != null) {
            this.f2063b.mo410a(c0521h, menuItem);
        }
    }

    public void m2897a(al alVar) {
        this.f2063b = alVar;
    }

    public void m2898a(Object obj) {
        if (VERSION.SDK_INT >= 23) {
            this.g.setEnterTransition((Transition) obj);
        }
    }

    public void mo411b(C0521h c0521h, MenuItem menuItem) {
        if (this.f2063b != null) {
            this.f2063b.mo411b(c0521h, menuItem);
        }
    }

    public void m2900b(Object obj) {
        if (VERSION.SDK_INT >= 23) {
            this.g.setExitTransition((Transition) obj);
        }
    }

    public void mo489c(boolean z) {
        if (f2062a != null) {
            try {
                f2062a.invoke(this.g, new Object[]{Boolean.valueOf(z)});
            } catch (Exception e) {
                Log.i("MenuPopupWindow", "Could not invoke setTouchModal() on PopupWindow. Oh well.");
            }
        }
    }
}
