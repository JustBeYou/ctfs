package android.support.v7.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.support.v7.p020a.C0411a.C0401a;
import android.util.AttributeSet;
import android.widget.SeekBar;

public class C0633v extends SeekBar {
    private final C0634w f2288a;

    public C0633v(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, C0401a.seekBarStyle);
    }

    public C0633v(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.f2288a = new C0634w(this);
        this.f2288a.mo545a(attributeSet, i);
    }

    protected void drawableStateChanged() {
        super.drawableStateChanged();
        this.f2288a.m3173c();
    }

    public void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        this.f2288a.mo546b();
    }

    protected synchronized void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        this.f2288a.m3169a(canvas);
    }
}
