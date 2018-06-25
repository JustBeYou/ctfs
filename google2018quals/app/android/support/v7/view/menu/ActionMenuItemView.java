package android.support.v7.view.menu;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Parcelable;
import android.support.v7.p020a.C0411a.C0410j;
import android.support.v7.view.menu.C0504p.C0501a;
import android.support.v7.view.menu.C0521h.C0503b;
import android.support.v7.widget.ActionMenuView.C0502a;
import android.support.v7.widget.aa;
import android.support.v7.widget.ah;
import android.support.v7.widget.ay;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;

public class ActionMenuItemView extends aa implements C0501a, C0502a, OnClickListener {
    C0524j f1508a;
    C0503b f1509b;
    C0500b f1510c;
    private CharSequence f1511d;
    private Drawable f1512e;
    private ah f1513f;
    private boolean f1514g;
    private boolean f1515h;
    private int f1516i;
    private int f1517j;
    private int f1518k;

    private class C0499a extends ah {
        final /* synthetic */ ActionMenuItemView f1505a;

        public C0499a(ActionMenuItemView actionMenuItemView) {
            this.f1505a = actionMenuItemView;
            super(actionMenuItemView);
        }

        public C0515s mo366a() {
            return this.f1505a.f1510c != null ? this.f1505a.f1510c.mo529a() : null;
        }

        protected boolean mo367b() {
            if (this.f1505a.f1509b == null || !this.f1505a.f1509b.mo378a(this.f1505a.f1508a)) {
                return false;
            }
            C0515s a = mo366a();
            return a != null && a.mo422d();
        }
    }

    public static abstract class C0500b {
        public abstract C0515s mo529a();
    }

    public ActionMenuItemView(Context context) {
        this(context, null);
    }

    public ActionMenuItemView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public ActionMenuItemView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        Resources resources = context.getResources();
        this.f1514g = m2299e();
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, C0410j.ActionMenuItemView, i, 0);
        this.f1516i = obtainStyledAttributes.getDimensionPixelSize(C0410j.ActionMenuItemView_android_minWidth, 0);
        obtainStyledAttributes.recycle();
        this.f1518k = (int) ((resources.getDisplayMetrics().density * 32.0f) + 0.5f);
        setOnClickListener(this);
        this.f1517j = -1;
        setSaveEnabled(false);
    }

    private boolean m2299e() {
        Configuration configuration = getContext().getResources().getConfiguration();
        int i = configuration.screenWidthDp;
        return i >= 480 || ((i >= 640 && configuration.screenHeightDp >= 480) || configuration.orientation == 2);
    }

    private void m2300f() {
        int i = 0;
        CharSequence charSequence = null;
        int i2 = !TextUtils.isEmpty(this.f1511d) ? 1 : 0;
        if (this.f1512e == null || (this.f1508a.m2511m() && (this.f1514g || this.f1515h))) {
            i = 1;
        }
        int i3 = i2 & i;
        setText(i3 != 0 ? this.f1511d : null);
        CharSequence contentDescription = this.f1508a.getContentDescription();
        if (TextUtils.isEmpty(contentDescription)) {
            setContentDescription(i3 != 0 ? null : this.f1508a.getTitle());
        } else {
            setContentDescription(contentDescription);
        }
        contentDescription = this.f1508a.getTooltipText();
        if (TextUtils.isEmpty(contentDescription)) {
            if (i3 == 0) {
                charSequence = this.f1508a.getTitle();
            }
            ay.m3021a(this, charSequence);
            return;
        }
        ay.m3021a(this, contentDescription);
    }

    public void mo372a(C0524j c0524j, int i) {
        this.f1508a = c0524j;
        setIcon(c0524j.getIcon());
        setTitle(c0524j.m2490a((C0501a) this));
        setId(c0524j.getItemId());
        setVisibility(c0524j.isVisible() ? 0 : 8);
        setEnabled(c0524j.isEnabled());
        if (c0524j.hasSubMenu() && this.f1513f == null) {
            this.f1513f = new C0499a(this);
        }
    }

    public boolean mo373a() {
        return true;
    }

    public boolean m2303b() {
        return !TextUtils.isEmpty(getText());
    }

    public boolean mo374c() {
        return m2303b() && this.f1508a.getIcon() == null;
    }

    public boolean mo375d() {
        return m2303b();
    }

    public C0524j getItemData() {
        return this.f1508a;
    }

    public void onClick(View view) {
        if (this.f1509b != null) {
            this.f1509b.mo378a(this.f1508a);
        }
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.f1514g = m2299e();
        m2300f();
    }

    protected void onMeasure(int i, int i2) {
        boolean b = m2303b();
        if (b && this.f1517j >= 0) {
            super.setPadding(this.f1517j, getPaddingTop(), getPaddingRight(), getPaddingBottom());
        }
        super.onMeasure(i, i2);
        int mode = MeasureSpec.getMode(i);
        int size = MeasureSpec.getSize(i);
        int measuredWidth = getMeasuredWidth();
        size = mode == Integer.MIN_VALUE ? Math.min(size, this.f1516i) : this.f1516i;
        if (mode != 1073741824 && this.f1516i > 0 && measuredWidth < size) {
            super.onMeasure(MeasureSpec.makeMeasureSpec(size, 1073741824), i2);
        }
        if (!b && this.f1512e != null) {
            super.setPadding((getMeasuredWidth() - this.f1512e.getBounds().width()) / 2, getPaddingTop(), getPaddingRight(), getPaddingBottom());
        }
    }

    public void onRestoreInstanceState(Parcelable parcelable) {
        super.onRestoreInstanceState(null);
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        return (this.f1508a.hasSubMenu() && this.f1513f != null && this.f1513f.onTouch(this, motionEvent)) ? true : super.onTouchEvent(motionEvent);
    }

    public void setCheckable(boolean z) {
    }

    public void setChecked(boolean z) {
    }

    public void setExpandedFormat(boolean z) {
        if (this.f1515h != z) {
            this.f1515h = z;
            if (this.f1508a != null) {
                this.f1508a.m2506h();
            }
        }
    }

    public void setIcon(Drawable drawable) {
        this.f1512e = drawable;
        if (drawable != null) {
            float f;
            int intrinsicWidth = drawable.getIntrinsicWidth();
            int intrinsicHeight = drawable.getIntrinsicHeight();
            if (intrinsicWidth > this.f1518k) {
                f = ((float) this.f1518k) / ((float) intrinsicWidth);
                intrinsicWidth = this.f1518k;
                intrinsicHeight = (int) (((float) intrinsicHeight) * f);
            }
            if (intrinsicHeight > this.f1518k) {
                f = ((float) this.f1518k) / ((float) intrinsicHeight);
                intrinsicHeight = this.f1518k;
                intrinsicWidth = (int) (((float) intrinsicWidth) * f);
            }
            drawable.setBounds(0, 0, intrinsicWidth, intrinsicHeight);
        }
        setCompoundDrawables(drawable, null, null, null);
        m2300f();
    }

    public void setItemInvoker(C0503b c0503b) {
        this.f1509b = c0503b;
    }

    public void setPadding(int i, int i2, int i3, int i4) {
        this.f1517j = i;
        super.setPadding(i, i2, i3, i4);
    }

    public void setPopupCallback(C0500b c0500b) {
        this.f1510c = c0500b;
    }

    public void setTitle(CharSequence charSequence) {
        this.f1511d = charSequence;
        m2300f();
    }
}
