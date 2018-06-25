package android.support.v7.widget;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.drawable.Drawable;

class C0597b extends Drawable {
    final ActionBarContainer f2169a;

    public C0597b(ActionBarContainer actionBarContainer) {
        this.f2169a = actionBarContainer;
    }

    public void draw(Canvas canvas) {
        if (!this.f2169a.f1741d) {
            if (this.f2169a.f1738a != null) {
                this.f2169a.f1738a.draw(canvas);
            }
            if (this.f2169a.f1739b != null && this.f2169a.f1742e) {
                this.f2169a.f1739b.draw(canvas);
            }
        } else if (this.f2169a.f1740c != null) {
            this.f2169a.f1740c.draw(canvas);
        }
    }

    public int getOpacity() {
        return 0;
    }

    public void setAlpha(int i) {
    }

    public void setColorFilter(ColorFilter colorFilter) {
    }
}
