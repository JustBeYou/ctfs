package android.support.p003b.p004a;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.AnimatorSet;
import android.animation.ArgbEvaluator;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PorterDuff.Mode;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.drawable.AnimatedVectorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.Callback;
import android.graphics.drawable.Drawable.ConstantState;
import android.os.Build.VERSION;
import android.support.v4.p005c.p006a.C0179a;
import android.support.v4.p009b.p011a.C0171c;
import android.support.v4.p016g.C0229a;
import android.util.AttributeSet;
import java.util.ArrayList;
import java.util.List;
import org.xmlpull.v1.XmlPullParser;

public class C0031c extends C0030h implements C0025b {
    final Callback f59a;
    private C0027a f60c;
    private Context f61d;
    private ArgbEvaluator f62e;
    private AnimatorListener f63f;
    private ArrayList<Object> f64g;

    class C00261 implements Callback {
        final /* synthetic */ C0031c f51a;

        C00261(C0031c c0031c) {
            this.f51a = c0031c;
        }

        public void invalidateDrawable(Drawable drawable) {
            this.f51a.invalidateSelf();
        }

        public void scheduleDrawable(Drawable drawable, Runnable runnable, long j) {
            this.f51a.scheduleSelf(runnable, j);
        }

        public void unscheduleDrawable(Drawable drawable, Runnable runnable) {
            this.f51a.unscheduleSelf(runnable);
        }
    }

    private static class C0027a extends ConstantState {
        int f52a;
        C0045i f53b;
        AnimatorSet f54c;
        C0229a<Animator, String> f55d;
        private ArrayList<Animator> f56e;

        public C0027a(Context context, C0027a c0027a, Callback callback, Resources resources) {
            int i = 0;
            if (c0027a != null) {
                this.f52a = c0027a.f52a;
                if (c0027a.f53b != null) {
                    ConstantState constantState = c0027a.f53b.getConstantState();
                    if (resources != null) {
                        this.f53b = (C0045i) constantState.newDrawable(resources);
                    } else {
                        this.f53b = (C0045i) constantState.newDrawable();
                    }
                    this.f53b = (C0045i) this.f53b.mutate();
                    this.f53b.setCallback(callback);
                    this.f53b.setBounds(c0027a.f53b.getBounds());
                    this.f53b.m118a(false);
                }
                if (c0027a.f56e != null) {
                    int size = c0027a.f56e.size();
                    this.f56e = new ArrayList(size);
                    this.f55d = new C0229a(size);
                    while (i < size) {
                        Animator animator = (Animator) c0027a.f56e.get(i);
                        Animator clone = animator.clone();
                        String str = (String) c0027a.f55d.get(animator);
                        clone.setTarget(this.f53b.m117a(str));
                        this.f56e.add(clone);
                        this.f55d.put(clone, str);
                        i++;
                    }
                    m47a();
                }
            }
        }

        public void m47a() {
            if (this.f54c == null) {
                this.f54c = new AnimatorSet();
            }
            this.f54c.playTogether(this.f56e);
        }

        public int getChangingConfigurations() {
            return this.f52a;
        }

        public Drawable newDrawable() {
            throw new IllegalStateException("No constant state support for SDK < 24.");
        }

        public Drawable newDrawable(Resources resources) {
            throw new IllegalStateException("No constant state support for SDK < 24.");
        }
    }

    private static class C0028b extends ConstantState {
        private final ConstantState f57a;

        public C0028b(ConstantState constantState) {
            this.f57a = constantState;
        }

        public boolean canApplyTheme() {
            return this.f57a.canApplyTheme();
        }

        public int getChangingConfigurations() {
            return this.f57a.getChangingConfigurations();
        }

        public Drawable newDrawable() {
            Drawable c0031c = new C0031c();
            c0031c.b = this.f57a.newDrawable();
            c0031c.b.setCallback(c0031c.f59a);
            return c0031c;
        }

        public Drawable newDrawable(Resources resources) {
            Drawable c0031c = new C0031c();
            c0031c.b = this.f57a.newDrawable(resources);
            c0031c.b.setCallback(c0031c.f59a);
            return c0031c;
        }

        public Drawable newDrawable(Resources resources, Theme theme) {
            Drawable c0031c = new C0031c();
            c0031c.b = this.f57a.newDrawable(resources, theme);
            c0031c.b.setCallback(c0031c.f59a);
            return c0031c;
        }
    }

    C0031c() {
        this(null, null, null);
    }

    private C0031c(Context context) {
        this(context, null, null);
    }

    private C0031c(Context context, C0027a c0027a, Resources resources) {
        this.f62e = null;
        this.f63f = null;
        this.f64g = null;
        this.f59a = new C00261(this);
        this.f61d = context;
        if (c0027a != null) {
            this.f60c = c0027a;
        } else {
            this.f60c = new C0027a(context, c0027a, this.f59a, resources);
        }
    }

    public static C0031c m48a(Context context, Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet, Theme theme) {
        C0031c c0031c = new C0031c(context);
        c0031c.inflate(resources, xmlPullParser, attributeSet, theme);
        return c0031c;
    }

    private void m49a(Animator animator) {
        if (animator instanceof AnimatorSet) {
            List childAnimations = ((AnimatorSet) animator).getChildAnimations();
            if (childAnimations != null) {
                for (int i = 0; i < childAnimations.size(); i++) {
                    m49a((Animator) childAnimations.get(i));
                }
            }
        }
        if (animator instanceof ObjectAnimator) {
            ObjectAnimator objectAnimator = (ObjectAnimator) animator;
            String propertyName = objectAnimator.getPropertyName();
            if ("fillColor".equals(propertyName) || "strokeColor".equals(propertyName)) {
                if (this.f62e == null) {
                    this.f62e = new ArgbEvaluator();
                }
                objectAnimator.setEvaluator(this.f62e);
            }
        }
    }

    private void m50a(String str, Animator animator) {
        animator.setTarget(this.f60c.f53b.m117a(str));
        if (VERSION.SDK_INT < 21) {
            m49a(animator);
        }
        if (this.f60c.f56e == null) {
            this.f60c.f56e = new ArrayList();
            this.f60c.f55d = new C0229a();
        }
        this.f60c.f56e.add(animator);
        this.f60c.f55d.put(animator, str);
    }

    public void applyTheme(Theme theme) {
        if (this.b != null) {
            C0179a.m934a(this.b, theme);
        }
    }

    public boolean canApplyTheme() {
        return this.b != null ? C0179a.m941d(this.b) : false;
    }

    public /* bridge */ /* synthetic */ void clearColorFilter() {
        super.clearColorFilter();
    }

    public void draw(Canvas canvas) {
        if (this.b != null) {
            this.b.draw(canvas);
            return;
        }
        this.f60c.f53b.draw(canvas);
        if (this.f60c.f54c.isStarted()) {
            invalidateSelf();
        }
    }

    public int getAlpha() {
        return this.b != null ? C0179a.m940c(this.b) : this.f60c.f53b.getAlpha();
    }

    public int getChangingConfigurations() {
        return this.b != null ? this.b.getChangingConfigurations() : super.getChangingConfigurations() | this.f60c.f52a;
    }

    public /* bridge */ /* synthetic */ ColorFilter getColorFilter() {
        return super.getColorFilter();
    }

    public ConstantState getConstantState() {
        return (this.b == null || VERSION.SDK_INT < 24) ? null : new C0028b(this.b.getConstantState());
    }

    public /* bridge */ /* synthetic */ Drawable getCurrent() {
        return super.getCurrent();
    }

    public int getIntrinsicHeight() {
        return this.b != null ? this.b.getIntrinsicHeight() : this.f60c.f53b.getIntrinsicHeight();
    }

    public int getIntrinsicWidth() {
        return this.b != null ? this.b.getIntrinsicWidth() : this.f60c.f53b.getIntrinsicWidth();
    }

    public /* bridge */ /* synthetic */ int getMinimumHeight() {
        return super.getMinimumHeight();
    }

    public /* bridge */ /* synthetic */ int getMinimumWidth() {
        return super.getMinimumWidth();
    }

    public int getOpacity() {
        return this.b != null ? this.b.getOpacity() : this.f60c.f53b.getOpacity();
    }

    public /* bridge */ /* synthetic */ boolean getPadding(Rect rect) {
        return super.getPadding(rect);
    }

    public /* bridge */ /* synthetic */ int[] getState() {
        return super.getState();
    }

    public /* bridge */ /* synthetic */ Region getTransparentRegion() {
        return super.getTransparentRegion();
    }

    public void inflate(Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet) {
        inflate(resources, xmlPullParser, attributeSet, null);
    }

    public void inflate(Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet, Theme theme) {
        if (this.b != null) {
            C0179a.m935a(this.b, resources, xmlPullParser, attributeSet, theme);
            return;
        }
        int eventType = xmlPullParser.getEventType();
        int depth = xmlPullParser.getDepth() + 1;
        while (eventType != 1 && (xmlPullParser.getDepth() >= depth || eventType != 3)) {
            if (eventType == 2) {
                String name = xmlPullParser.getName();
                TypedArray a;
                if ("animated-vector".equals(name)) {
                    a = C0171c.m873a(resources, theme, attributeSet, C0024a.f43e);
                    int resourceId = a.getResourceId(0, 0);
                    if (resourceId != 0) {
                        C0045i a2 = C0045i.m111a(resources, resourceId, theme);
                        a2.m118a(false);
                        a2.setCallback(this.f59a);
                        if (this.f60c.f53b != null) {
                            this.f60c.f53b.setCallback(null);
                        }
                        this.f60c.f53b = a2;
                    }
                    a.recycle();
                } else if ("target".equals(name)) {
                    a = resources.obtainAttributes(attributeSet, C0024a.f44f);
                    String string = a.getString(0);
                    int resourceId2 = a.getResourceId(1, 0);
                    if (resourceId2 != 0) {
                        if (this.f61d != null) {
                            m50a(string, C0035e.m56a(this.f61d, resourceId2));
                        } else {
                            a.recycle();
                            throw new IllegalStateException("Context can't be null when inflating animators");
                        }
                    }
                    a.recycle();
                } else {
                    continue;
                }
            }
            eventType = xmlPullParser.next();
        }
        this.f60c.m47a();
    }

    public boolean isAutoMirrored() {
        return this.b != null ? C0179a.m938b(this.b) : this.f60c.f53b.isAutoMirrored();
    }

    public boolean isRunning() {
        return this.b != null ? ((AnimatedVectorDrawable) this.b).isRunning() : this.f60c.f54c.isRunning();
    }

    public boolean isStateful() {
        return this.b != null ? this.b.isStateful() : this.f60c.f53b.isStateful();
    }

    public /* bridge */ /* synthetic */ void jumpToCurrentState() {
        super.jumpToCurrentState();
    }

    public Drawable mutate() {
        if (this.b != null) {
            this.b.mutate();
        }
        return this;
    }

    protected void onBoundsChange(Rect rect) {
        if (this.b != null) {
            this.b.setBounds(rect);
        } else {
            this.f60c.f53b.setBounds(rect);
        }
    }

    protected boolean onLevelChange(int i) {
        return this.b != null ? this.b.setLevel(i) : this.f60c.f53b.setLevel(i);
    }

    protected boolean onStateChange(int[] iArr) {
        return this.b != null ? this.b.setState(iArr) : this.f60c.f53b.setState(iArr);
    }

    public void setAlpha(int i) {
        if (this.b != null) {
            this.b.setAlpha(i);
        } else {
            this.f60c.f53b.setAlpha(i);
        }
    }

    public void setAutoMirrored(boolean z) {
        if (this.b != null) {
            C0179a.m937a(this.b, z);
        } else {
            this.f60c.f53b.setAutoMirrored(z);
        }
    }

    public /* bridge */ /* synthetic */ void setChangingConfigurations(int i) {
        super.setChangingConfigurations(i);
    }

    public /* bridge */ /* synthetic */ void setColorFilter(int i, Mode mode) {
        super.setColorFilter(i, mode);
    }

    public void setColorFilter(ColorFilter colorFilter) {
        if (this.b != null) {
            this.b.setColorFilter(colorFilter);
        } else {
            this.f60c.f53b.setColorFilter(colorFilter);
        }
    }

    public /* bridge */ /* synthetic */ void setFilterBitmap(boolean z) {
        super.setFilterBitmap(z);
    }

    public /* bridge */ /* synthetic */ void setHotspot(float f, float f2) {
        super.setHotspot(f, f2);
    }

    public /* bridge */ /* synthetic */ void setHotspotBounds(int i, int i2, int i3, int i4) {
        super.setHotspotBounds(i, i2, i3, i4);
    }

    public /* bridge */ /* synthetic */ boolean setState(int[] iArr) {
        return super.setState(iArr);
    }

    public void setTint(int i) {
        if (this.b != null) {
            C0179a.m931a(this.b, i);
        } else {
            this.f60c.f53b.setTint(i);
        }
    }

    public void setTintList(ColorStateList colorStateList) {
        if (this.b != null) {
            C0179a.m933a(this.b, colorStateList);
        } else {
            this.f60c.f53b.setTintList(colorStateList);
        }
    }

    public void setTintMode(Mode mode) {
        if (this.b != null) {
            C0179a.m936a(this.b, mode);
        } else {
            this.f60c.f53b.setTintMode(mode);
        }
    }

    public boolean setVisible(boolean z, boolean z2) {
        if (this.b != null) {
            return this.b.setVisible(z, z2);
        }
        this.f60c.f53b.setVisible(z, z2);
        return super.setVisible(z, z2);
    }

    public void start() {
        if (this.b != null) {
            ((AnimatedVectorDrawable) this.b).start();
        } else if (!this.f60c.f54c.isStarted()) {
            this.f60c.f54c.start();
            invalidateSelf();
        }
    }

    public void stop() {
        if (this.b != null) {
            ((AnimatedVectorDrawable) this.b).stop();
        } else {
            this.f60c.f54c.end();
        }
    }
}
