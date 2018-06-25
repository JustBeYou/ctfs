package android.support.v7.widget;

import android.content.Context;
import android.support.v4.p017h.C0315p;
import android.support.v4.p017h.C0324r;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.p020a.C0411a.C0406f;
import android.support.v7.p020a.C0411a.C0407g;
import android.support.v7.p020a.C0411a.C0410j;
import android.support.v7.view.C0479b;
import android.support.v7.view.menu.C0521h;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.accessibility.AccessibilityEvent;
import android.widget.LinearLayout;
import android.widget.TextView;

public class ActionBarContextView extends C0542a {
    private CharSequence f1758g;
    private CharSequence f1759h;
    private View f1760i;
    private View f1761j;
    private LinearLayout f1762k;
    private TextView f1763l;
    private TextView f1764m;
    private int f1765n;
    private int f1766o;
    private boolean f1767p;
    private int f1768q;

    public ActionBarContextView(Context context) {
        this(context, null);
    }

    public ActionBarContextView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, C0401a.actionModeStyle);
    }

    public ActionBarContextView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        aw a = aw.m2953a(context, attributeSet, C0410j.ActionMode, i, 0);
        C0315p.m1382a((View) this, a.m2957a(C0410j.ActionMode_background));
        this.f1765n = a.m2970g(C0410j.ActionMode_titleTextStyle, 0);
        this.f1766o = a.m2970g(C0410j.ActionMode_subtitleTextStyle, 0);
        this.e = a.m2968f(C0410j.ActionMode_height, 0);
        this.f1768q = a.m2970g(C0410j.ActionMode_closeItemLayout, C0407g.abc_action_mode_close_item_material);
        a.m2958a();
    }

    private void m2584e() {
        int i = 8;
        Object obj = 1;
        if (this.f1762k == null) {
            LayoutInflater.from(getContext()).inflate(C0407g.abc_action_bar_title_item, this);
            this.f1762k = (LinearLayout) getChildAt(getChildCount() - 1);
            this.f1763l = (TextView) this.f1762k.findViewById(C0406f.action_bar_title);
            this.f1764m = (TextView) this.f1762k.findViewById(C0406f.action_bar_subtitle);
            if (this.f1765n != 0) {
                this.f1763l.setTextAppearance(getContext(), this.f1765n);
            }
            if (this.f1766o != 0) {
                this.f1764m.setTextAppearance(getContext(), this.f1766o);
            }
        }
        this.f1763l.setText(this.f1758g);
        this.f1764m.setText(this.f1759h);
        Object obj2 = !TextUtils.isEmpty(this.f1758g) ? 1 : null;
        if (TextUtils.isEmpty(this.f1759h)) {
            obj = null;
        }
        this.f1764m.setVisibility(obj != null ? 0 : 8);
        LinearLayout linearLayout = this.f1762k;
        if (!(obj2 == null && obj == null)) {
            i = 0;
        }
        linearLayout.setVisibility(i);
        if (this.f1762k.getParent() == null) {
            addView(this.f1762k);
        }
    }

    public /* bridge */ /* synthetic */ C0324r mo446a(int i, long j) {
        return super.mo446a(i, j);
    }

    public void m2586a(final C0479b c0479b) {
        if (this.f1760i == null) {
            this.f1760i = LayoutInflater.from(getContext()).inflate(this.f1768q, this, false);
            addView(this.f1760i);
        } else if (this.f1760i.getParent() == null) {
            addView(this.f1760i);
        }
        this.f1760i.findViewById(C0406f.action_mode_close_button).setOnClickListener(new OnClickListener(this) {
            final /* synthetic */ ActionBarContextView f1749b;

            public void onClick(View view) {
                c0479b.mo352c();
            }
        });
        C0521h c0521h = (C0521h) c0479b.mo349b();
        if (this.d != null) {
            this.d.m3073f();
        }
        this.d = new C0607d(getContext());
        this.d.m3069c(true);
        LayoutParams layoutParams = new LayoutParams(-2, -1);
        c0521h.m2444a(this.d, this.b);
        this.c = (ActionMenuView) this.d.mo535a((ViewGroup) this);
        C0315p.m1382a(this.c, null);
        addView(this.c, layoutParams);
    }

    public boolean mo447a() {
        return this.d != null ? this.d.m3071d() : false;
    }

    public void m2588b() {
        if (this.f1760i == null) {
            m2589c();
        }
    }

    public void m2589c() {
        removeAllViews();
        this.f1761j = null;
        this.c = null;
    }

    public boolean m2590d() {
        return this.f1767p;
    }

    protected LayoutParams generateDefaultLayoutParams() {
        return new MarginLayoutParams(-1, -2);
    }

    public LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new MarginLayoutParams(getContext(), attributeSet);
    }

    public /* bridge */ /* synthetic */ int getAnimatedVisibility() {
        return super.getAnimatedVisibility();
    }

    public /* bridge */ /* synthetic */ int getContentHeight() {
        return super.getContentHeight();
    }

    public CharSequence getSubtitle() {
        return this.f1759h;
    }

    public CharSequence getTitle() {
        return this.f1758g;
    }

    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.d != null) {
            this.d.m3072e();
            this.d.m3074g();
        }
    }

    public /* bridge */ /* synthetic */ boolean onHoverEvent(MotionEvent motionEvent) {
        return super.onHoverEvent(motionEvent);
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        if (accessibilityEvent.getEventType() == 32) {
            accessibilityEvent.setSource(this);
            accessibilityEvent.setClassName(getClass().getName());
            accessibilityEvent.setPackageName(getContext().getPackageName());
            accessibilityEvent.setContentDescription(this.f1758g);
            return;
        }
        super.onInitializeAccessibilityEvent(accessibilityEvent);
    }

    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int i5;
        boolean a = bc.m3035a(this);
        int paddingRight = a ? (i3 - i) - getPaddingRight() : getPaddingLeft();
        int paddingTop = getPaddingTop();
        int paddingTop2 = ((i4 - i2) - getPaddingTop()) - getPaddingBottom();
        if (this.f1760i == null || this.f1760i.getVisibility() == 8) {
            i5 = paddingRight;
        } else {
            MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.f1760i.getLayoutParams();
            i5 = a ? marginLayoutParams.rightMargin : marginLayoutParams.leftMargin;
            int i6 = a ? marginLayoutParams.leftMargin : marginLayoutParams.rightMargin;
            i5 = C0542a.m2577a(paddingRight, i5, a);
            i5 = C0542a.m2577a(m2581a(this.f1760i, i5, paddingTop, paddingTop2, a) + i5, i6, a);
        }
        if (!(this.f1762k == null || this.f1761j != null || this.f1762k.getVisibility() == 8)) {
            i5 += m2581a(this.f1762k, i5, paddingTop, paddingTop2, a);
        }
        if (this.f1761j != null) {
            int a2 = m2581a(this.f1761j, i5, paddingTop, paddingTop2, a) + i5;
        }
        i5 = a ? getPaddingLeft() : (i3 - i) - getPaddingRight();
        if (this.c != null) {
            a2 = m2581a(this.c, i5, paddingTop, paddingTop2, !a) + i5;
        }
    }

    protected void onMeasure(int i, int i2) {
        int i3 = 1073741824;
        int i4 = 0;
        if (MeasureSpec.getMode(i) != 1073741824) {
            throw new IllegalStateException(getClass().getSimpleName() + " can only be used " + "with android:layout_width=\"match_parent\" (or fill_parent)");
        } else if (MeasureSpec.getMode(i2) == 0) {
            throw new IllegalStateException(getClass().getSimpleName() + " can only be used " + "with android:layout_height=\"wrap_content\"");
        } else {
            int a;
            int size = MeasureSpec.getSize(i);
            int size2 = this.e > 0 ? this.e : MeasureSpec.getSize(i2);
            int paddingTop = getPaddingTop() + getPaddingBottom();
            int paddingLeft = (size - getPaddingLeft()) - getPaddingRight();
            int i5 = size2 - paddingTop;
            int makeMeasureSpec = MeasureSpec.makeMeasureSpec(i5, Integer.MIN_VALUE);
            if (this.f1760i != null) {
                a = m2580a(this.f1760i, paddingLeft, makeMeasureSpec, 0);
                MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.f1760i.getLayoutParams();
                paddingLeft = a - (marginLayoutParams.rightMargin + marginLayoutParams.leftMargin);
            }
            if (this.c != null && this.c.getParent() == this) {
                paddingLeft = m2580a(this.c, paddingLeft, makeMeasureSpec, 0);
            }
            if (this.f1762k != null && this.f1761j == null) {
                if (this.f1767p) {
                    this.f1762k.measure(MeasureSpec.makeMeasureSpec(0, 0), makeMeasureSpec);
                    a = this.f1762k.getMeasuredWidth();
                    makeMeasureSpec = a <= paddingLeft ? 1 : 0;
                    if (makeMeasureSpec != 0) {
                        paddingLeft -= a;
                    }
                    this.f1762k.setVisibility(makeMeasureSpec != 0 ? 0 : 8);
                } else {
                    paddingLeft = m2580a(this.f1762k, paddingLeft, makeMeasureSpec, 0);
                }
            }
            if (this.f1761j != null) {
                LayoutParams layoutParams = this.f1761j.getLayoutParams();
                makeMeasureSpec = layoutParams.width != -2 ? 1073741824 : Integer.MIN_VALUE;
                if (layoutParams.width >= 0) {
                    paddingLeft = Math.min(layoutParams.width, paddingLeft);
                }
                if (layoutParams.height == -2) {
                    i3 = Integer.MIN_VALUE;
                }
                this.f1761j.measure(MeasureSpec.makeMeasureSpec(paddingLeft, makeMeasureSpec), MeasureSpec.makeMeasureSpec(layoutParams.height >= 0 ? Math.min(layoutParams.height, i5) : i5, i3));
            }
            if (this.e <= 0) {
                makeMeasureSpec = getChildCount();
                size2 = 0;
                while (i4 < makeMeasureSpec) {
                    paddingLeft = getChildAt(i4).getMeasuredHeight() + paddingTop;
                    if (paddingLeft <= size2) {
                        paddingLeft = size2;
                    }
                    i4++;
                    size2 = paddingLeft;
                }
                setMeasuredDimension(size, size2);
                return;
            }
            setMeasuredDimension(size, size2);
        }
    }

    public /* bridge */ /* synthetic */ boolean onTouchEvent(MotionEvent motionEvent) {
        return super.onTouchEvent(motionEvent);
    }

    public void setContentHeight(int i) {
        this.e = i;
    }

    public void setCustomView(View view) {
        if (this.f1761j != null) {
            removeView(this.f1761j);
        }
        this.f1761j = view;
        if (!(view == null || this.f1762k == null)) {
            removeView(this.f1762k);
            this.f1762k = null;
        }
        if (view != null) {
            addView(view);
        }
        requestLayout();
    }

    public void setSubtitle(CharSequence charSequence) {
        this.f1759h = charSequence;
        m2584e();
    }

    public void setTitle(CharSequence charSequence) {
        this.f1758g = charSequence;
        m2584e();
    }

    public void setTitleOptional(boolean z) {
        if (z != this.f1767p) {
            requestLayout();
        }
        this.f1767p = z;
    }

    public /* bridge */ /* synthetic */ void setVisibility(int i) {
        super.setVisibility(i);
    }

    public boolean shouldDelayChildPressedState() {
        return false;
    }
}
