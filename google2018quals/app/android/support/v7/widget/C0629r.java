package android.support.v7.widget;

import android.content.Context;
import android.os.Build.VERSION;
import android.support.v4.widget.C0397i;
import android.support.v7.p020a.C0411a.C0410j;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewTreeObserver.OnScrollChangedListener;
import android.widget.PopupWindow;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;

class C0629r extends PopupWindow {
    private static final boolean f2281a = (VERSION.SDK_INT < 21);
    private boolean f2282b;

    public C0629r(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        m3160a(context, attributeSet, i, i2);
    }

    private void m3160a(Context context, AttributeSet attributeSet, int i, int i2) {
        aw a = aw.m2953a(context, attributeSet, C0410j.PopupWindow, i, i2);
        if (a.m2971g(C0410j.PopupWindow_overlapAnchor)) {
            m3162a(a.m2959a(C0410j.PopupWindow_overlapAnchor, false));
        }
        setBackgroundDrawable(a.m2957a(C0410j.PopupWindow_android_popupBackground));
        int i3 = VERSION.SDK_INT;
        if (i2 != 0 && i3 < 11 && a.m2971g(C0410j.PopupWindow_android_popupAnimationStyle)) {
            setAnimationStyle(a.m2970g(C0410j.PopupWindow_android_popupAnimationStyle, -1));
        }
        a.m2958a();
        if (VERSION.SDK_INT < 14) {
            C0629r.m3161a((PopupWindow) this);
        }
    }

    private static void m3161a(final PopupWindow popupWindow) {
        try {
            final Field declaredField = PopupWindow.class.getDeclaredField("mAnchor");
            declaredField.setAccessible(true);
            Field declaredField2 = PopupWindow.class.getDeclaredField("mOnScrollChangedListener");
            declaredField2.setAccessible(true);
            final OnScrollChangedListener onScrollChangedListener = (OnScrollChangedListener) declaredField2.get(popupWindow);
            declaredField2.set(popupWindow, new OnScrollChangedListener() {
                public void onScrollChanged() {
                    try {
                        WeakReference weakReference = (WeakReference) declaredField.get(popupWindow);
                        if (weakReference != null && weakReference.get() != null) {
                            onScrollChangedListener.onScrollChanged();
                        }
                    } catch (IllegalAccessException e) {
                    }
                }
            });
        } catch (Throwable e) {
            Log.d("AppCompatPopupWindow", "Exception while installing workaround OnScrollChangedListener", e);
        }
    }

    public void m3162a(boolean z) {
        if (f2281a) {
            this.f2282b = z;
        } else {
            C0397i.m1840a((PopupWindow) this, z);
        }
    }

    public void showAsDropDown(View view, int i, int i2) {
        if (f2281a && this.f2282b) {
            i2 -= view.getHeight();
        }
        super.showAsDropDown(view, i, i2);
    }

    public void showAsDropDown(View view, int i, int i2, int i3) {
        if (f2281a && this.f2282b) {
            i2 -= view.getHeight();
        }
        super.showAsDropDown(view, i, i2, i3);
    }

    public void update(View view, int i, int i2, int i3, int i4) {
        int height = (f2281a && this.f2282b) ? i2 - view.getHeight() : i2;
        super.update(view, i, height, i3, i4);
    }
}
