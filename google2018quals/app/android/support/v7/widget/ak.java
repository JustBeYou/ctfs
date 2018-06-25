package android.support.v7.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.v4.p005c.p006a.C0179a;
import android.support.v7.p023c.p024a.C0487a;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup.LayoutParams;
import android.widget.AbsListView;
import android.widget.ListAdapter;
import android.widget.ListView;
import java.lang.reflect.Field;

public class ak extends ListView {
    private static final int[] f1998g = new int[]{0};
    final Rect f1999a = new Rect();
    int f2000b = 0;
    int f2001c = 0;
    int f2002d = 0;
    int f2003e = 0;
    protected int f2004f;
    private Field f2005h;
    private C0582a f2006i;

    private static class C0582a extends C0487a {
        private boolean f2057a = true;

        public C0582a(Drawable drawable) {
            super(drawable);
        }

        void m2893a(boolean z) {
            this.f2057a = z;
        }

        public void draw(Canvas canvas) {
            if (this.f2057a) {
                super.draw(canvas);
            }
        }

        public void setHotspot(float f, float f2) {
            if (this.f2057a) {
                super.setHotspot(f, f2);
            }
        }

        public void setHotspotBounds(int i, int i2, int i3, int i4) {
            if (this.f2057a) {
                super.setHotspotBounds(i, i2, i3, i4);
            }
        }

        public boolean setState(int[] iArr) {
            return this.f2057a ? super.setState(iArr) : false;
        }

        public boolean setVisible(boolean z, boolean z2) {
            return this.f2057a ? super.setVisible(z, z2) : false;
        }
    }

    public ak(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        try {
            this.f2005h = AbsListView.class.getDeclaredField("mIsChildViewEnabled");
            this.f2005h.setAccessible(true);
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        }
    }

    public int m2846a(int i, int i2, int i3, int i4, int i5) {
        int listPaddingTop = getListPaddingTop();
        int listPaddingBottom = getListPaddingBottom();
        getListPaddingLeft();
        getListPaddingRight();
        int dividerHeight = getDividerHeight();
        Drawable divider = getDivider();
        ListAdapter adapter = getAdapter();
        if (adapter == null) {
            return listPaddingTop + listPaddingBottom;
        }
        listPaddingBottom += listPaddingTop;
        if (dividerHeight <= 0 || divider == null) {
            dividerHeight = 0;
        }
        int i6 = 0;
        View view = null;
        int i7 = 0;
        int count = adapter.getCount();
        int i8 = 0;
        while (i8 < count) {
            View view2;
            listPaddingTop = adapter.getItemViewType(i8);
            if (listPaddingTop != i7) {
                int i9 = listPaddingTop;
                view2 = null;
                i7 = i9;
            } else {
                view2 = view;
            }
            view = adapter.getView(i8, view2, this);
            LayoutParams layoutParams = view.getLayoutParams();
            if (layoutParams == null) {
                layoutParams = generateDefaultLayoutParams();
                view.setLayoutParams(layoutParams);
            }
            view.measure(i, layoutParams.height > 0 ? MeasureSpec.makeMeasureSpec(layoutParams.height, 1073741824) : MeasureSpec.makeMeasureSpec(0, 0));
            view.forceLayout();
            listPaddingTop = (i8 > 0 ? listPaddingBottom + dividerHeight : listPaddingBottom) + view.getMeasuredHeight();
            if (listPaddingTop >= i4) {
                return (i5 < 0 || i8 <= i5 || i6 <= 0 || listPaddingTop == i4) ? i4 : i6;
            } else {
                if (i5 >= 0 && i8 >= i5) {
                    i6 = listPaddingTop;
                }
                i8++;
                listPaddingBottom = listPaddingTop;
            }
        }
        return listPaddingBottom;
    }

    protected void m2847a(int i, View view) {
        boolean z = true;
        Drawable selector = getSelector();
        boolean z2 = (selector == null || i == -1) ? false : true;
        if (z2) {
            selector.setVisible(false, false);
        }
        m2852b(i, view);
        if (z2) {
            Rect rect = this.f1999a;
            float exactCenterX = rect.exactCenterX();
            float exactCenterY = rect.exactCenterY();
            if (getVisibility() != 0) {
                z = false;
            }
            selector.setVisible(z, false);
            C0179a.m930a(selector, exactCenterX, exactCenterY);
        }
    }

    protected void m2848a(int i, View view, float f, float f2) {
        m2847a(i, view);
        Drawable selector = getSelector();
        if (selector != null && i != -1) {
            C0179a.m930a(selector, f, f2);
        }
    }

    protected void m2849a(Canvas canvas) {
        if (!this.f1999a.isEmpty()) {
            Drawable selector = getSelector();
            if (selector != null) {
                selector.setBounds(this.f1999a);
                selector.draw(canvas);
            }
        }
    }

    protected boolean mo477a() {
        return false;
    }

    protected void m2851b() {
        Drawable selector = getSelector();
        if (selector != null && m2853c()) {
            selector.setState(getDrawableState());
        }
    }

    protected void m2852b(int i, View view) {
        Rect rect = this.f1999a;
        rect.set(view.getLeft(), view.getTop(), view.getRight(), view.getBottom());
        rect.left -= this.f2000b;
        rect.top -= this.f2001c;
        rect.right += this.f2002d;
        rect.bottom += this.f2003e;
        try {
            boolean z = this.f2005h.getBoolean(this);
            if (view.isEnabled() != z) {
                this.f2005h.set(this, Boolean.valueOf(!z));
                if (i != -1) {
                    refreshDrawableState();
                }
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    protected boolean m2853c() {
        return mo477a() && isPressed();
    }

    protected void dispatchDraw(Canvas canvas) {
        m2849a(canvas);
        super.dispatchDraw(canvas);
    }

    protected void drawableStateChanged() {
        super.drawableStateChanged();
        setSelectorEnabled(true);
        m2851b();
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        switch (motionEvent.getAction()) {
            case 0:
                this.f2004f = pointToPosition((int) motionEvent.getX(), (int) motionEvent.getY());
                break;
        }
        return super.onTouchEvent(motionEvent);
    }

    public void setSelector(Drawable drawable) {
        this.f2006i = drawable != null ? new C0582a(drawable) : null;
        super.setSelector(this.f2006i);
        Rect rect = new Rect();
        if (drawable != null) {
            drawable.getPadding(rect);
        }
        this.f2000b = rect.left;
        this.f2001c = rect.top;
        this.f2002d = rect.right;
        this.f2003e = rect.bottom;
    }

    protected void setSelectorEnabled(boolean z) {
        if (this.f2006i != null) {
            this.f2006i.m2893a(z);
        }
    }
}
