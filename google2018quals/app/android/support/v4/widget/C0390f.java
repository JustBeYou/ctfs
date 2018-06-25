package android.support.v4.widget;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.widget.ImageView;

public class C0390f {
    static final C0387b f1108a;

    interface C0387b {
        ColorStateList mo247a(ImageView imageView);

        void mo248a(ImageView imageView, ColorStateList colorStateList);

        void mo249a(ImageView imageView, Mode mode);

        Mode mo250b(ImageView imageView);
    }

    static class C0388a implements C0387b {
        C0388a() {
        }

        public ColorStateList mo247a(ImageView imageView) {
            return imageView instanceof C0400l ? ((C0400l) imageView).getSupportImageTintList() : null;
        }

        public void mo248a(ImageView imageView, ColorStateList colorStateList) {
            if (imageView instanceof C0400l) {
                ((C0400l) imageView).setSupportImageTintList(colorStateList);
            }
        }

        public void mo249a(ImageView imageView, Mode mode) {
            if (imageView instanceof C0400l) {
                ((C0400l) imageView).setSupportImageTintMode(mode);
            }
        }

        public Mode mo250b(ImageView imageView) {
            return imageView instanceof C0400l ? ((C0400l) imageView).getSupportImageTintMode() : null;
        }
    }

    static class C0389c extends C0388a {
        C0389c() {
        }

        public ColorStateList mo247a(ImageView imageView) {
            return imageView.getImageTintList();
        }

        public void mo248a(ImageView imageView, ColorStateList colorStateList) {
            imageView.setImageTintList(colorStateList);
            if (VERSION.SDK_INT == 21) {
                Drawable drawable = imageView.getDrawable();
                Object obj = (imageView.getImageTintList() == null || imageView.getImageTintMode() == null) ? null : 1;
                if (drawable != null && obj != null) {
                    if (drawable.isStateful()) {
                        drawable.setState(imageView.getDrawableState());
                    }
                    imageView.setImageDrawable(drawable);
                }
            }
        }

        public void mo249a(ImageView imageView, Mode mode) {
            imageView.setImageTintMode(mode);
            if (VERSION.SDK_INT == 21) {
                Drawable drawable = imageView.getDrawable();
                Object obj = (imageView.getImageTintList() == null || imageView.getImageTintMode() == null) ? null : 1;
                if (drawable != null && obj != null) {
                    if (drawable.isStateful()) {
                        drawable.setState(imageView.getDrawableState());
                    }
                    imageView.setImageDrawable(drawable);
                }
            }
        }

        public Mode mo250b(ImageView imageView) {
            return imageView.getImageTintMode();
        }
    }

    static {
        if (VERSION.SDK_INT >= 21) {
            f1108a = new C0389c();
        } else {
            f1108a = new C0388a();
        }
    }

    public static ColorStateList m1823a(ImageView imageView) {
        return f1108a.mo247a(imageView);
    }

    public static void m1824a(ImageView imageView, ColorStateList colorStateList) {
        f1108a.mo248a(imageView, colorStateList);
    }

    public static void m1825a(ImageView imageView, Mode mode) {
        f1108a.mo249a(imageView, mode);
    }

    public static Mode m1826b(ImageView imageView) {
        return f1108a.mo250b(imageView);
    }
}
