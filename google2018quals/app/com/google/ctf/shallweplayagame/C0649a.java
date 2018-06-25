package com.google.ctf.shallweplayagame;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.graphics.Typeface;
import android.util.TypedValue;
import android.view.ViewGroup.LayoutParams;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.util.Queue;

public class C0649a extends RelativeLayout {
    static final String f2352a = new String(Character.toChars(9762));
    Context f2353b;
    Queue<AnimatorSet> f2354c;
    public C0648a f2355d = C0648a.EMPTY;
    TextView f2356e;

    class C06451 implements AnimatorUpdateListener {
        final /* synthetic */ C0649a f2343a;

        C06451(C0649a c0649a) {
            this.f2343a = c0649a;
        }

        public void onAnimationUpdate(ValueAnimator valueAnimator) {
            Float f = (Float) valueAnimator.getAnimatedValue();
            this.f2343a.f2356e.setScaleX(f.floatValue());
            this.f2343a.f2356e.setScaleY(f.floatValue());
        }
    }

    class C06473 extends AnimatorListenerAdapter {
        final /* synthetic */ C0649a f2346a;

        C06473(C0649a c0649a) {
            this.f2346a = c0649a;
        }

        public void onAnimationEnd(Animator animator) {
            super.onAnimationEnd(animator);
            AnimatorSet animatorSet = (AnimatorSet) this.f2346a.f2354c.poll();
            if (animatorSet != null) {
                animatorSet.start();
            }
        }
    }

    enum C0648a {
        EMPTY,
        X,
        O,
        DEATH
    }

    public C0649a(Context context, Queue<AnimatorSet> queue) {
        super(context);
        this.f2353b = context;
        this.f2354c = queue;
        m3220b();
        m3221c();
    }

    private int m3218a(int i) {
        return (int) TypedValue.applyDimension(1, (float) i, this.f2353b.getResources().getDisplayMetrics());
    }

    private AnimatorSet m3219a(final String str, int i) {
        AnimatorSet animatorSet = new AnimatorSet();
        AnimatorUpdateListener c06451 = new C06451(this);
        Animator ofFloat = ValueAnimator.ofFloat(new float[]{1.0f, 0.0f});
        ofFloat.setDuration((long) i);
        ofFloat.addUpdateListener(c06451);
        ofFloat.addListener(new AnimatorListenerAdapter(this) {
            final /* synthetic */ C0649a f2345b;

            public void onAnimationEnd(Animator animator) {
                super.onAnimationEnd(animator);
                this.f2345b.f2356e.setText(str);
                if (str.equals(C0649a.f2352a)) {
                    C0652b.m3225b();
                } else if (str.equals(" ")) {
                    C0652b.m3224a();
                }
            }
        });
        Animator ofFloat2 = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        ofFloat2.setDuration((long) i);
        ofFloat2.addUpdateListener(c06451);
        animatorSet.addListener(new C06473(this));
        animatorSet.play(ofFloat2).after(ofFloat);
        return animatorSet;
    }

    private void m3220b() {
        int a = m3218a(5);
        int a2 = m3218a(5);
        setPadding(a, a2, a, a2);
        a = m3218a(100);
        LayoutParams layoutParams = new RelativeLayout.LayoutParams(a, a);
        a = m3218a(5);
        layoutParams.setMargins(a, a, a, a);
        setLayoutParams(layoutParams);
        setBackground(this.f2353b.getResources().getDrawable(R.drawable.background));
    }

    private void m3221c() {
        this.f2356e = new TextView(this.f2353b);
        this.f2356e.setTypeface(Typeface.MONOSPACE);
        this.f2356e.setTextColor(-1);
        this.f2356e.setTextSize((float) m3218a(20));
        LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(13);
        this.f2356e.setLayoutParams(layoutParams);
        this.f2356e.setGravity(1);
        this.f2356e.setText(" ");
        addView(this.f2356e);
    }

    public void m3222a(C0648a c0648a, int i) {
        this.f2355d = c0648a;
        String str = c0648a == C0648a.EMPTY ? " " : c0648a == C0648a.X ? "X" : c0648a == C0648a.O ? "O" : f2352a;
        this.f2354c.add(m3219a(str, i));
    }

    public boolean m3223a() {
        return this.f2355d == C0648a.EMPTY;
    }

    public void setValue(C0648a c0648a) {
        m3222a(c0648a, 100);
    }
}
