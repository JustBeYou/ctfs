package android.support.v7.widget;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.v4.p017h.C0287d;
import android.support.v4.p017h.C0315p;
import android.support.v7.p020a.C0411a.C0406f;
import android.support.v7.p020a.C0411a.C0410j;
import android.support.v7.widget.ai.C0548a;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;

public class AlertDialogLayout extends ai {
    public AlertDialogLayout(Context context) {
        super(context);
    }

    public AlertDialogLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    private void m2682a(View view, int i, int i2, int i3, int i4) {
        view.layout(i, i2, i + i3, i2 + i4);
    }

    private static int m2683c(View view) {
        int c = C0315p.m1388c(view);
        if (c > 0) {
            return c;
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            if (viewGroup.getChildCount() == 1) {
                return m2683c(viewGroup.getChildAt(0));
            }
        }
        return 0;
    }

    private boolean m2684c(int i, int i2) {
        int id;
        int measuredHeight;
        int i3;
        int i4;
        int combineMeasuredStates;
        int i5;
        View view = null;
        View view2 = null;
        int childCount = getChildCount();
        int i6 = 0;
        View view3 = null;
        while (i6 < childCount) {
            View childAt = getChildAt(i6);
            if (childAt.getVisibility() == 8) {
                childAt = view2;
                view2 = view;
            } else {
                id = childAt.getId();
                if (id == C0406f.topPanel) {
                    View view4 = view2;
                    view2 = childAt;
                    childAt = view4;
                } else if (id == C0406f.buttonPanel) {
                    view2 = view;
                } else if (id != C0406f.contentPanel && id != C0406f.customPanel) {
                    return false;
                } else {
                    if (view3 != null) {
                        return false;
                    }
                    view3 = childAt;
                    childAt = view2;
                    view2 = view;
                }
            }
            i6++;
            view = view2;
            view2 = childAt;
        }
        int mode = MeasureSpec.getMode(i2);
        int size = MeasureSpec.getSize(i2);
        int mode2 = MeasureSpec.getMode(i);
        id = 0;
        i6 = getPaddingBottom() + getPaddingTop();
        if (view != null) {
            view.measure(i, 0);
            i6 += view.getMeasuredHeight();
            id = View.combineMeasuredStates(0, view.getMeasuredState());
        }
        int i7 = 0;
        if (view2 != null) {
            view2.measure(i, 0);
            i7 = m2683c(view2);
            measuredHeight = view2.getMeasuredHeight() - i7;
            i6 += i7;
            id = View.combineMeasuredStates(id, view2.getMeasuredState());
            i3 = measuredHeight;
        } else {
            i3 = 0;
        }
        if (view3 != null) {
            view3.measure(i, mode == 0 ? 0 : MeasureSpec.makeMeasureSpec(Math.max(0, size - i6), mode));
            measuredHeight = view3.getMeasuredHeight();
            i6 += measuredHeight;
            id = View.combineMeasuredStates(id, view3.getMeasuredState());
            i4 = measuredHeight;
        } else {
            i4 = 0;
        }
        measuredHeight = size - i6;
        if (view2 != null) {
            i6 -= i7;
            i3 = Math.min(measuredHeight, i3);
            if (i3 > 0) {
                measuredHeight -= i3;
                i7 += i3;
            }
            view2.measure(i, MeasureSpec.makeMeasureSpec(i7, 1073741824));
            i7 = view2.getMeasuredHeight() + i6;
            combineMeasuredStates = View.combineMeasuredStates(id, view2.getMeasuredState());
            int i8 = measuredHeight;
            measuredHeight = i7;
            i7 = i8;
        } else {
            i7 = measuredHeight;
            combineMeasuredStates = id;
            measuredHeight = i6;
        }
        if (view3 == null || i7 <= 0) {
            i5 = measuredHeight;
            measuredHeight = combineMeasuredStates;
        } else {
            measuredHeight -= i4;
            i6 = i7 - i7;
            view3.measure(i, MeasureSpec.makeMeasureSpec(i7 + i4, mode));
            i8 = measuredHeight + view3.getMeasuredHeight();
            measuredHeight = View.combineMeasuredStates(combineMeasuredStates, view3.getMeasuredState());
            i5 = i8;
        }
        combineMeasuredStates = 0;
        for (i7 = 0; i7 < childCount; i7++) {
            View childAt2 = getChildAt(i7);
            if (childAt2.getVisibility() != 8) {
                combineMeasuredStates = Math.max(combineMeasuredStates, childAt2.getMeasuredWidth());
            }
        }
        setMeasuredDimension(View.resolveSizeAndState(combineMeasuredStates + (getPaddingLeft() + getPaddingRight()), i, measuredHeight), View.resolveSizeAndState(i5, i2, 0));
        if (mode2 != 1073741824) {
            m2685d(childCount, i2);
        }
        return true;
    }

    private void m2685d(int i, int i2) {
        int makeMeasureSpec = MeasureSpec.makeMeasureSpec(getMeasuredWidth(), 1073741824);
        for (int i3 = 0; i3 < i; i3++) {
            View childAt = getChildAt(i3);
            if (childAt.getVisibility() != 8) {
                C0548a c0548a = (C0548a) childAt.getLayoutParams();
                if (c0548a.width == -1) {
                    int i4 = c0548a.height;
                    c0548a.height = childAt.getMeasuredHeight();
                    measureChildWithMargins(childAt, makeMeasureSpec, 0, i2, 0);
                    c0548a.height = i4;
                }
            }
        }
    }

    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int paddingLeft = getPaddingLeft();
        int i5 = i3 - i;
        int paddingRight = i5 - getPaddingRight();
        int paddingRight2 = (i5 - paddingLeft) - getPaddingRight();
        i5 = getMeasuredHeight();
        int childCount = getChildCount();
        int gravity = getGravity();
        int i6 = gravity & 8388615;
        switch (gravity & C0410j.AppCompatTheme_windowFixedHeightMajor) {
            case 16:
                i5 = (((i4 - i2) - i5) / 2) + getPaddingTop();
                break;
            case C0410j.AppCompatTheme_panelMenuListTheme /*80*/:
                i5 = ((getPaddingTop() + i4) - i2) - i5;
                break;
            default:
                i5 = getPaddingTop();
                break;
        }
        Drawable dividerDrawable = getDividerDrawable();
        int intrinsicHeight = dividerDrawable == null ? 0 : dividerDrawable.getIntrinsicHeight();
        int i7 = i5;
        for (int i8 = 0; i8 < childCount; i8++) {
            View childAt = getChildAt(i8);
            if (!(childAt == null || childAt.getVisibility() == 8)) {
                int i9;
                int measuredWidth = childAt.getMeasuredWidth();
                int measuredHeight = childAt.getMeasuredHeight();
                C0548a c0548a = (C0548a) childAt.getLayoutParams();
                i5 = c0548a.f1802h;
                if (i5 < 0) {
                    i5 = i6;
                }
                switch (C0287d.m1269a(i5, C0315p.m1387b(this)) & 7) {
                    case 1:
                        i9 = ((((paddingRight2 - measuredWidth) / 2) + paddingLeft) + c0548a.leftMargin) - c0548a.rightMargin;
                        break;
                    case 5:
                        i9 = (paddingRight - measuredWidth) - c0548a.rightMargin;
                        break;
                    default:
                        i9 = paddingLeft + c0548a.leftMargin;
                        break;
                }
                i7 = c0548a.topMargin + (m2645c(i8) ? i7 + intrinsicHeight : i7);
                m2682a(childAt, i9, i7, measuredWidth, measuredHeight);
                i7 += c0548a.bottomMargin + measuredHeight;
            }
        }
    }

    protected void onMeasure(int i, int i2) {
        if (!m2684c(i, i2)) {
            super.onMeasure(i, i2);
        }
    }
}
