package android.support.v4.p005c.p006a;

import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.support.v4.p005c.p006a.C0183c.C0181a;

class C0185d extends C0183c {

    private static class C0184a extends C0181a {
        C0184a(C0181a c0181a, Resources resources) {
            super(c0181a, resources);
        }

        public Drawable newDrawable(Resources resources) {
            return new C0185d(this, resources);
        }
    }

    C0185d(Drawable drawable) {
        super(drawable);
    }

    C0185d(C0181a c0181a, Resources resources) {
        super(c0181a, resources);
    }

    C0181a mo85b() {
        return new C0184a(this.b, null);
    }

    public boolean isAutoMirrored() {
        return this.c.isAutoMirrored();
    }

    public void setAutoMirrored(boolean z) {
        this.c.setAutoMirrored(z);
    }
}
