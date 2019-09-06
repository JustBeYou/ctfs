package android.support.constraint;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Log;
import android.view.ViewGroup;

public class Constraints extends ViewGroup {
    public static final String TAG = "Constraints";
    ConstraintSet myConstraintSet;

    public static class LayoutParams extends android.support.constraint.ConstraintLayout.LayoutParams {
        public float alpha;
        public boolean applyElevation;
        public float elevation;
        public float rotation;
        public float rotationX;
        public float rotationY;
        public float scaleX;
        public float scaleY;
        public float transformPivotX;
        public float transformPivotY;
        public float translationX;
        public float translationY;
        public float translationZ;

        public LayoutParams(int i, int i2) {
            super(i, i2);
            this.alpha = 1.0f;
            this.applyElevation = false;
            this.elevation = 0.0f;
            this.rotation = 0.0f;
            this.rotationX = 0.0f;
            this.rotationY = 0.0f;
            this.scaleX = 1.0f;
            this.scaleY = 1.0f;
            this.transformPivotX = 0.0f;
            this.transformPivotY = 0.0f;
            this.translationX = 0.0f;
            this.translationY = 0.0f;
            this.translationZ = 0.0f;
        }

        public LayoutParams(LayoutParams layoutParams) {
            super((android.support.constraint.ConstraintLayout.LayoutParams) layoutParams);
            this.alpha = 1.0f;
            this.applyElevation = false;
            this.elevation = 0.0f;
            this.rotation = 0.0f;
            this.rotationX = 0.0f;
            this.rotationY = 0.0f;
            this.scaleX = 1.0f;
            this.scaleY = 1.0f;
            this.transformPivotX = 0.0f;
            this.transformPivotY = 0.0f;
            this.translationX = 0.0f;
            this.translationY = 0.0f;
            this.translationZ = 0.0f;
        }

        public LayoutParams(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            this.alpha = 1.0f;
            int i = 0;
            this.applyElevation = false;
            this.elevation = 0.0f;
            this.rotation = 0.0f;
            this.rotationX = 0.0f;
            this.rotationY = 0.0f;
            this.scaleX = 1.0f;
            this.scaleY = 1.0f;
            this.transformPivotX = 0.0f;
            this.transformPivotY = 0.0f;
            this.translationX = 0.0f;
            this.translationY = 0.0f;
            this.translationZ = 0.0f;
            context = context.obtainStyledAttributes(attributeSet, C0001R.styleable.ConstraintSet);
            attributeSet = context.getIndexCount();
            while (i < attributeSet) {
                int index = context.getIndex(i);
                if (index == C0001R.styleable.ConstraintSet_android_alpha) {
                    this.alpha = context.getFloat(index, this.alpha);
                } else if (index == C0001R.styleable.ConstraintSet_android_elevation) {
                    this.elevation = context.getFloat(index, this.elevation);
                    this.applyElevation = true;
                } else if (index == C0001R.styleable.ConstraintSet_android_rotationX) {
                    this.rotationX = context.getFloat(index, this.rotationX);
                } else if (index == C0001R.styleable.ConstraintSet_android_rotationY) {
                    this.rotationY = context.getFloat(index, this.rotationY);
                } else if (index == C0001R.styleable.ConstraintSet_android_rotation) {
                    this.rotation = context.getFloat(index, this.rotation);
                } else if (index == C0001R.styleable.ConstraintSet_android_scaleX) {
                    this.scaleX = context.getFloat(index, this.scaleX);
                } else if (index == C0001R.styleable.ConstraintSet_android_scaleY) {
                    this.scaleY = context.getFloat(index, this.scaleY);
                } else if (index == C0001R.styleable.ConstraintSet_android_transformPivotX) {
                    this.transformPivotX = context.getFloat(index, this.transformPivotX);
                } else if (index == C0001R.styleable.ConstraintSet_android_transformPivotY) {
                    this.transformPivotY = context.getFloat(index, this.transformPivotY);
                } else if (index == C0001R.styleable.ConstraintSet_android_translationX) {
                    this.translationX = context.getFloat(index, this.translationX);
                } else if (index == C0001R.styleable.ConstraintSet_android_translationY) {
                    this.translationY = context.getFloat(index, this.translationY);
                } else if (index == C0001R.styleable.ConstraintSet_android_translationZ) {
                    this.translationX = context.getFloat(index, this.translationZ);
                }
                i++;
            }
        }
    }

    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
    }

    public Constraints(Context context) {
        super(context);
        super.setVisibility(8);
    }

    public Constraints(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init(attributeSet);
        super.setVisibility(8);
    }

    public Constraints(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init(attributeSet);
        super.setVisibility(8);
    }

    public LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new LayoutParams(getContext(), attributeSet);
    }

    protected LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams(-2, -2);
    }

    private void init(AttributeSet attributeSet) {
        Log.v(TAG, " ################# init");
    }

    protected android.view.ViewGroup.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutParams) {
        return new android.support.constraint.ConstraintLayout.LayoutParams(layoutParams);
    }

    public ConstraintSet getConstraintSet() {
        if (this.myConstraintSet == null) {
            this.myConstraintSet = new ConstraintSet();
        }
        this.myConstraintSet.clone(this);
        return this.myConstraintSet;
    }
}
