package android.support.v7.widget;

import android.graphics.Outline;

class C0598c extends C0597b {
    public C0598c(ActionBarContainer actionBarContainer) {
        super(actionBarContainer);
    }

    public void getOutline(Outline outline) {
        if (this.a.f1741d) {
            if (this.a.f1740c != null) {
                this.a.f1740c.getOutline(outline);
            }
        } else if (this.a.f1738a != null) {
            this.a.f1738a.getOutline(outline);
        }
    }
}
