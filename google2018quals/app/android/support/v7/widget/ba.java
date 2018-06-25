package android.support.v7.widget;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.graphics.Rect;
import android.support.v7.p020a.C0411a.C0404d;
import android.support.v7.p020a.C0411a.C0406f;
import android.support.v7.p020a.C0411a.C0407g;
import android.support.v7.p020a.C0411a.C0409i;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import android.widget.TextView;

class ba {
    private final Context f2170a;
    private final View f2171b;
    private final TextView f2172c;
    private final LayoutParams f2173d = new LayoutParams();
    private final Rect f2174e = new Rect();
    private final int[] f2175f = new int[2];
    private final int[] f2176g = new int[2];

    ba(Context context) {
        this.f2170a = context;
        this.f2171b = LayoutInflater.from(this.f2170a).inflate(C0407g.tooltip, null);
        this.f2172c = (TextView) this.f2171b.findViewById(C0406f.message);
        this.f2173d.setTitle(getClass().getSimpleName());
        this.f2173d.packageName = this.f2170a.getPackageName();
        this.f2173d.type = 1002;
        this.f2173d.width = -2;
        this.f2173d.height = -2;
        this.f2173d.format = -3;
        this.f2173d.windowAnimations = C0409i.Animation_AppCompat_Tooltip;
        this.f2173d.flags = 24;
    }

    private static View m3027a(View view) {
        for (Context context = view.getContext(); context instanceof ContextWrapper; context = ((ContextWrapper) context).getBaseContext()) {
            if (context instanceof Activity) {
                return ((Activity) context).getWindow().getDecorView();
            }
        }
        return view.getRootView();
    }

    private void m3028a(View view, int i, int i2, boolean z, LayoutParams layoutParams) {
        int i3;
        int dimensionPixelOffset = this.f2170a.getResources().getDimensionPixelOffset(C0404d.tooltip_precise_anchor_threshold);
        if (view.getWidth() < dimensionPixelOffset) {
            i = view.getWidth() / 2;
        }
        if (view.getHeight() >= dimensionPixelOffset) {
            dimensionPixelOffset = this.f2170a.getResources().getDimensionPixelOffset(C0404d.tooltip_precise_anchor_extra_offset);
            i3 = i2 + dimensionPixelOffset;
            dimensionPixelOffset = i2 - dimensionPixelOffset;
        } else {
            i3 = view.getHeight();
            dimensionPixelOffset = 0;
        }
        layoutParams.gravity = 49;
        int dimensionPixelOffset2 = this.f2170a.getResources().getDimensionPixelOffset(z ? C0404d.tooltip_y_offset_touch : C0404d.tooltip_y_offset_non_touch);
        View a = m3027a(view);
        if (a == null) {
            Log.e("TooltipPopup", "Cannot find app view");
            return;
        }
        a.getWindowVisibleDisplayFrame(this.f2174e);
        if (this.f2174e.left < 0 && this.f2174e.top < 0) {
            Resources resources = this.f2170a.getResources();
            int identifier = resources.getIdentifier("status_bar_height", "dimen", "android");
            identifier = identifier != 0 ? resources.getDimensionPixelSize(identifier) : 0;
            DisplayMetrics displayMetrics = resources.getDisplayMetrics();
            this.f2174e.set(0, identifier, displayMetrics.widthPixels, displayMetrics.heightPixels);
        }
        a.getLocationOnScreen(this.f2176g);
        view.getLocationOnScreen(this.f2175f);
        int[] iArr = this.f2175f;
        iArr[0] = iArr[0] - this.f2176g[0];
        iArr = this.f2175f;
        iArr[1] = iArr[1] - this.f2176g[1];
        layoutParams.x = (this.f2175f[0] + i) - (this.f2174e.width() / 2);
        int makeMeasureSpec = MeasureSpec.makeMeasureSpec(0, 0);
        this.f2171b.measure(makeMeasureSpec, makeMeasureSpec);
        makeMeasureSpec = this.f2171b.getMeasuredHeight();
        dimensionPixelOffset = ((dimensionPixelOffset + this.f2175f[1]) - dimensionPixelOffset2) - makeMeasureSpec;
        i3 = (i3 + this.f2175f[1]) + dimensionPixelOffset2;
        if (z) {
            if (dimensionPixelOffset >= 0) {
                layoutParams.y = dimensionPixelOffset;
            } else {
                layoutParams.y = i3;
            }
        } else if (makeMeasureSpec + i3 <= this.f2174e.height()) {
            layoutParams.y = i3;
        } else {
            layoutParams.y = dimensionPixelOffset;
        }
    }

    void m3029a() {
        if (m3031b()) {
            ((WindowManager) this.f2170a.getSystemService("window")).removeView(this.f2171b);
        }
    }

    void m3030a(View view, int i, int i2, boolean z, CharSequence charSequence) {
        if (m3031b()) {
            m3029a();
        }
        this.f2172c.setText(charSequence);
        m3028a(view, i, i2, z, this.f2173d);
        ((WindowManager) this.f2170a.getSystemService("window")).addView(this.f2171b, this.f2173d);
    }

    boolean m3031b() {
        return this.f2171b.getParent() != null;
    }
}
