package android.support.v7.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.support.v4.p017h.C0315p;
import android.support.v7.p020a.C0411a.C0406f;
import android.support.v7.p020a.C0411a.C0410j;
import android.util.AttributeSet;
import android.view.ActionMode;
import android.view.ActionMode.Callback;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;

public class ActionBarContainer extends FrameLayout {
    Drawable f1738a;
    Drawable f1739b;
    Drawable f1740c;
    boolean f1741d;
    boolean f1742e;
    private boolean f1743f;
    private View f1744g;
    private View f1745h;
    private View f1746i;
    private int f1747j;

    public ActionBarContainer(Context context) {
        this(context, null);
    }

    public ActionBarContainer(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        C0315p.m1382a((View) this, VERSION.SDK_INT >= 21 ? new C0598c(this) : new C0597b(this));
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, C0410j.ActionBar);
        this.f1738a = obtainStyledAttributes.getDrawable(C0410j.ActionBar_background);
        this.f1739b = obtainStyledAttributes.getDrawable(C0410j.ActionBar_backgroundStacked);
        this.f1747j = obtainStyledAttributes.getDimensionPixelSize(C0410j.ActionBar_height, -1);
        if (getId() == C0406f.split_action_bar) {
            this.f1741d = true;
            this.f1740c = obtainStyledAttributes.getDrawable(C0410j.ActionBar_backgroundSplit);
        }
        obtainStyledAttributes.recycle();
        boolean z = this.f1741d ? this.f1740c == null : this.f1738a == null && this.f1739b == null;
        setWillNotDraw(z);
    }

    private boolean m2575a(View view) {
        return view == null || view.getVisibility() == 8 || view.getMeasuredHeight() == 0;
    }

    private int m2576b(View view) {
        LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
        return layoutParams.bottomMargin + (view.getMeasuredHeight() + layoutParams.topMargin);
    }

    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.f1738a != null && this.f1738a.isStateful()) {
            this.f1738a.setState(getDrawableState());
        }
        if (this.f1739b != null && this.f1739b.isStateful()) {
            this.f1739b.setState(getDrawableState());
        }
        if (this.f1740c != null && this.f1740c.isStateful()) {
            this.f1740c.setState(getDrawableState());
        }
    }

    public View getTabContainer() {
        return this.f1744g;
    }

    public void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        if (this.f1738a != null) {
            this.f1738a.jumpToCurrentState();
        }
        if (this.f1739b != null) {
            this.f1739b.jumpToCurrentState();
        }
        if (this.f1740c != null) {
            this.f1740c.jumpToCurrentState();
        }
    }

    public void onFinishInflate() {
        super.onFinishInflate();
        this.f1745h = findViewById(C0406f.action_bar);
        this.f1746i = findViewById(C0406f.action_context_bar);
    }

    public boolean onHoverEvent(MotionEvent motionEvent) {
        super.onHoverEvent(motionEvent);
        return true;
    }

    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        return this.f1743f || super.onInterceptTouchEvent(motionEvent);
    }

    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int i5 = 1;
        super.onLayout(z, i, i2, i3, i4);
        View view = this.f1744g;
        boolean z2 = (view == null || view.getVisibility() == 8) ? false : true;
        if (!(view == null || view.getVisibility() == 8)) {
            int measuredHeight = getMeasuredHeight();
            LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
            view.layout(i, (measuredHeight - view.getMeasuredHeight()) - layoutParams.bottomMargin, i3, measuredHeight - layoutParams.bottomMargin);
        }
        if (!this.f1741d) {
            int i6;
            if (this.f1738a != null) {
                if (this.f1745h.getVisibility() == 0) {
                    this.f1738a.setBounds(this.f1745h.getLeft(), this.f1745h.getTop(), this.f1745h.getRight(), this.f1745h.getBottom());
                } else if (this.f1746i == null || this.f1746i.getVisibility() != 0) {
                    this.f1738a.setBounds(0, 0, 0, 0);
                } else {
                    this.f1738a.setBounds(this.f1746i.getLeft(), this.f1746i.getTop(), this.f1746i.getRight(), this.f1746i.getBottom());
                }
                i6 = 1;
            } else {
                i6 = 0;
            }
            this.f1742e = z2;
            if (!z2 || this.f1739b == null) {
                i5 = i6;
            } else {
                this.f1739b.setBounds(view.getLeft(), view.getTop(), view.getRight(), view.getBottom());
            }
        } else if (this.f1740c != null) {
            this.f1740c.setBounds(0, 0, getMeasuredWidth(), getMeasuredHeight());
        } else {
            i5 = 0;
        }
        if (i5 != 0) {
            invalidate();
        }
    }

    public void onMeasure(int i, int i2) {
        if (this.f1745h == null && MeasureSpec.getMode(i2) == Integer.MIN_VALUE && this.f1747j >= 0) {
            i2 = MeasureSpec.makeMeasureSpec(Math.min(this.f1747j, MeasureSpec.getSize(i2)), Integer.MIN_VALUE);
        }
        super.onMeasure(i, i2);
        if (this.f1745h != null) {
            int mode = MeasureSpec.getMode(i2);
            if (this.f1744g != null && this.f1744g.getVisibility() != 8 && mode != 1073741824) {
                int b = !m2575a(this.f1745h) ? m2576b(this.f1745h) : !m2575a(this.f1746i) ? m2576b(this.f1746i) : 0;
                setMeasuredDimension(getMeasuredWidth(), Math.min(b + m2576b(this.f1744g), mode == Integer.MIN_VALUE ? MeasureSpec.getSize(i2) : Integer.MAX_VALUE));
            }
        }
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        super.onTouchEvent(motionEvent);
        return true;
    }

    public void setPrimaryBackground(Drawable drawable) {
        boolean z = true;
        if (this.f1738a != null) {
            this.f1738a.setCallback(null);
            unscheduleDrawable(this.f1738a);
        }
        this.f1738a = drawable;
        if (drawable != null) {
            drawable.setCallback(this);
            if (this.f1745h != null) {
                this.f1738a.setBounds(this.f1745h.getLeft(), this.f1745h.getTop(), this.f1745h.getRight(), this.f1745h.getBottom());
            }
        }
        if (this.f1741d) {
            if (this.f1740c != null) {
                z = false;
            }
        } else if (!(this.f1738a == null && this.f1739b == null)) {
            z = false;
        }
        setWillNotDraw(z);
        invalidate();
    }

    public void setSplitBackground(Drawable drawable) {
        boolean z = true;
        if (this.f1740c != null) {
            this.f1740c.setCallback(null);
            unscheduleDrawable(this.f1740c);
        }
        this.f1740c = drawable;
        if (drawable != null) {
            drawable.setCallback(this);
            if (this.f1741d && this.f1740c != null) {
                this.f1740c.setBounds(0, 0, getMeasuredWidth(), getMeasuredHeight());
            }
        }
        if (this.f1741d) {
            if (this.f1740c != null) {
                z = false;
            }
        } else if (!(this.f1738a == null && this.f1739b == null)) {
            z = false;
        }
        setWillNotDraw(z);
        invalidate();
    }

    public void setStackedBackground(Drawable drawable) {
        boolean z = true;
        if (this.f1739b != null) {
            this.f1739b.setCallback(null);
            unscheduleDrawable(this.f1739b);
        }
        this.f1739b = drawable;
        if (drawable != null) {
            drawable.setCallback(this);
            if (this.f1742e && this.f1739b != null) {
                this.f1739b.setBounds(this.f1744g.getLeft(), this.f1744g.getTop(), this.f1744g.getRight(), this.f1744g.getBottom());
            }
        }
        if (this.f1741d) {
            if (this.f1740c != null) {
                z = false;
            }
        } else if (!(this.f1738a == null && this.f1739b == null)) {
            z = false;
        }
        setWillNotDraw(z);
        invalidate();
    }

    public void setTabContainer(ap apVar) {
        if (this.f1744g != null) {
            removeView(this.f1744g);
        }
        this.f1744g = apVar;
        if (apVar != null) {
            addView(apVar);
            ViewGroup.LayoutParams layoutParams = apVar.getLayoutParams();
            layoutParams.width = -1;
            layoutParams.height = -2;
            apVar.setAllowCollapse(false);
        }
    }

    public void setTransitioning(boolean z) {
        this.f1743f = z;
        setDescendantFocusability(z ? 393216 : 262144);
    }

    public void setVisibility(int i) {
        super.setVisibility(i);
        boolean z = i == 0;
        if (this.f1738a != null) {
            this.f1738a.setVisible(z, false);
        }
        if (this.f1739b != null) {
            this.f1739b.setVisible(z, false);
        }
        if (this.f1740c != null) {
            this.f1740c.setVisible(z, false);
        }
    }

    public ActionMode startActionModeForChild(View view, Callback callback) {
        return null;
    }

    public ActionMode startActionModeForChild(View view, Callback callback, int i) {
        return i != 0 ? super.startActionModeForChild(view, callback, i) : null;
    }

    protected boolean verifyDrawable(Drawable drawable) {
        return (drawable == this.f1738a && !this.f1741d) || ((drawable == this.f1739b && this.f1742e) || ((drawable == this.f1740c && this.f1741d) || super.verifyDrawable(drawable)));
    }
}
