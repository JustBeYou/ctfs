package android.support.v7.widget;

import android.content.Context;
import android.os.Build.VERSION;
import android.support.v4.p017h.C0324r;
import android.support.v4.widget.C0391g;
import android.support.v7.p020a.C0411a.C0401a;
import android.view.MotionEvent;
import android.view.View;

class af extends ak {
    private boolean f2007g;
    private boolean f2008h;
    private boolean f2009i;
    private C0324r f2010j;
    private C0391g f2011k;

    public af(Context context, boolean z) {
        super(context, null, C0401a.dropDownListViewStyle);
        this.f2008h = z;
        setCacheColorHint(0);
    }

    private void m2854a(View view, int i) {
        performItemClick(view, i, getItemIdAtPosition(i));
    }

    private void m2855a(View view, int i, float f, float f2) {
        this.f2009i = true;
        if (VERSION.SDK_INT >= 21) {
            drawableHotspotChanged(f, f2);
        }
        if (!isPressed()) {
            setPressed(true);
        }
        layoutChildren();
        if (this.f != -1) {
            View childAt = getChildAt(this.f - getFirstVisiblePosition());
            if (!(childAt == null || childAt == view || !childAt.isPressed())) {
                childAt.setPressed(false);
            }
        }
        this.f = i;
        float left = f - ((float) view.getLeft());
        float top = f2 - ((float) view.getTop());
        if (VERSION.SDK_INT >= 21) {
            view.drawableHotspotChanged(left, top);
        }
        if (!view.isPressed()) {
            view.setPressed(true);
        }
        m2848a(i, view, f, f2);
        setSelectorEnabled(false);
        refreshDrawableState();
    }

    private void m2856d() {
        this.f2009i = false;
        setPressed(false);
        drawableStateChanged();
        View childAt = getChildAt(this.f - getFirstVisiblePosition());
        if (childAt != null) {
            childAt.setPressed(false);
        }
        if (this.f2010j != null) {
            this.f2010j.m1436b();
            this.f2010j = null;
        }
    }

    protected boolean mo477a() {
        return this.f2009i || super.mo477a();
    }

    public boolean mo483a(MotionEvent motionEvent, int i) {
        boolean z;
        boolean z2;
        int actionMasked = motionEvent.getActionMasked();
        switch (actionMasked) {
            case 1:
                z = false;
                break;
            case 2:
                z = true;
                break;
            case 3:
                z = false;
                z2 = false;
                break;
            default:
                z = false;
                z2 = true;
                break;
        }
        int findPointerIndex = motionEvent.findPointerIndex(i);
        if (findPointerIndex < 0) {
            z = false;
            z2 = false;
        } else {
            int x = (int) motionEvent.getX(findPointerIndex);
            findPointerIndex = (int) motionEvent.getY(findPointerIndex);
            int pointToPosition = pointToPosition(x, findPointerIndex);
            if (pointToPosition == -1) {
                z2 = z;
                z = true;
            } else {
                View childAt = getChildAt(pointToPosition - getFirstVisiblePosition());
                m2855a(childAt, pointToPosition, (float) x, (float) findPointerIndex);
                if (actionMasked == 1) {
                    m2854a(childAt, pointToPosition);
                }
                z = false;
                z2 = true;
            }
        }
        if (!z2 || r0) {
            m2856d();
        }
        if (z2) {
            if (this.f2011k == null) {
                this.f2011k = new C0391g(this);
            }
            this.f2011k.m1772a(true);
            this.f2011k.onTouch(this, motionEvent);
        } else if (this.f2011k != null) {
            this.f2011k.m1772a(false);
        }
        return z2;
    }

    public boolean hasFocus() {
        return this.f2008h || super.hasFocus();
    }

    public boolean hasWindowFocus() {
        return this.f2008h || super.hasWindowFocus();
    }

    public boolean isFocused() {
        return this.f2008h || super.isFocused();
    }

    public boolean isInTouchMode() {
        return (this.f2008h && this.f2007g) || super.isInTouchMode();
    }

    void setListSelectionHidden(boolean z) {
        this.f2007g = z;
    }
}
