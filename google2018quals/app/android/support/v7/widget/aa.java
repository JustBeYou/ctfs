package android.support.v7.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.support.v4.p017h.C0303o;
import android.util.AttributeSet;
import android.widget.TextView;

public class aa extends TextView implements C0303o {
    private final C0614g f1506a;
    private final C0642y f1507b;

    public aa(Context context) {
        this(context, null);
    }

    public aa(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 16842884);
    }

    public aa(Context context, AttributeSet attributeSet, int i) {
        super(at.m2948a(context), attributeSet, i);
        this.f1506a = new C0614g(this);
        this.f1506a.m3102a(attributeSet, i);
        this.f1507b = C0642y.m3188a((TextView) this);
        this.f1507b.mo551a(attributeSet, i);
        this.f1507b.mo550a();
    }

    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.f1506a != null) {
            this.f1506a.m3105c();
        }
        if (this.f1507b != null) {
            this.f1507b.mo550a();
        }
    }

    public int getAutoSizeMaxTextSize() {
        return VERSION.SDK_INT >= 26 ? super.getAutoSizeMaxTextSize() : this.f1507b != null ? this.f1507b.m3206g() : -1;
    }

    public int getAutoSizeMinTextSize() {
        return VERSION.SDK_INT >= 26 ? super.getAutoSizeMinTextSize() : this.f1507b != null ? this.f1507b.m3205f() : -1;
    }

    public int getAutoSizeStepGranularity() {
        return VERSION.SDK_INT >= 26 ? super.getAutoSizeStepGranularity() : this.f1507b != null ? this.f1507b.m3204e() : -1;
    }

    public int[] getAutoSizeTextAvailableSizes() {
        return VERSION.SDK_INT >= 26 ? super.getAutoSizeTextAvailableSizes() : this.f1507b != null ? this.f1507b.m3207h() : new int[0];
    }

    public int getAutoSizeTextType() {
        return VERSION.SDK_INT >= 26 ? super.getAutoSizeTextType() == 1 ? 1 : 0 : this.f1507b != null ? this.f1507b.m3203d() : 0;
    }

    public ColorStateList getSupportBackgroundTintList() {
        return this.f1506a != null ? this.f1506a.m3097a() : null;
    }

    public Mode getSupportBackgroundTintMode() {
        return this.f1506a != null ? this.f1506a.m3103b() : null;
    }

    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        if (this.f1507b != null) {
            this.f1507b.m3199a(z, i, i2, i3, i4);
        }
    }

    protected void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        super.onTextChanged(charSequence, i, i2, i3);
        if (this.f1507b != null && VERSION.SDK_INT < 26 && this.f1507b.m3202c()) {
            this.f1507b.m3201b();
        }
    }

    public void setAutoSizeTextTypeUniformWithConfiguration(int i, int i2, int i3, int i4) {
        if (VERSION.SDK_INT >= 26) {
            super.setAutoSizeTextTypeUniformWithConfiguration(i, i2, i3, i4);
        } else if (this.f1507b != null) {
            this.f1507b.m3194a(i, i2, i3, i4);
        }
    }

    public void setAutoSizeTextTypeUniformWithPresetSizes(int[] iArr, int i) {
        if (VERSION.SDK_INT >= 26) {
            super.setAutoSizeTextTypeUniformWithPresetSizes(iArr, i);
        } else if (this.f1507b != null) {
            this.f1507b.m3200a(iArr, i);
        }
    }

    public void setAutoSizeTextTypeWithDefaults(int i) {
        if (VERSION.SDK_INT >= 26) {
            super.setAutoSizeTextTypeWithDefaults(i);
        } else if (this.f1507b != null) {
            this.f1507b.m3192a(i);
        }
    }

    public void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        if (this.f1506a != null) {
            this.f1506a.m3101a(drawable);
        }
    }

    public void setBackgroundResource(int i) {
        super.setBackgroundResource(i);
        if (this.f1506a != null) {
            this.f1506a.m3098a(i);
        }
    }

    public void setSupportBackgroundTintList(ColorStateList colorStateList) {
        if (this.f1506a != null) {
            this.f1506a.m3099a(colorStateList);
        }
    }

    public void setSupportBackgroundTintMode(Mode mode) {
        if (this.f1506a != null) {
            this.f1506a.m3100a(mode);
        }
    }

    public void setTextAppearance(Context context, int i) {
        super.setTextAppearance(context, i);
        if (this.f1507b != null) {
            this.f1507b.m3195a(context, i);
        }
    }

    public void setTextSize(int i, float f) {
        if (VERSION.SDK_INT >= 26) {
            super.setTextSize(i, f);
        } else if (this.f1507b != null) {
            this.f1507b.m3193a(i, f);
        }
    }
}
