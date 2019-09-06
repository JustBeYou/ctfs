package android.support.constraint;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Align;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.support.constraint.ConstraintLayout.LayoutParams;
import android.util.AttributeSet;
import android.view.View;

public class Placeholder extends View {
    private View mContent = null;
    private int mContentId = -1;
    private int mEmptyVisibility = 4;

    public Placeholder(Context context) {
        super(context);
        init(null);
    }

    public Placeholder(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init(attributeSet);
    }

    public Placeholder(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init(attributeSet);
    }

    public Placeholder(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i);
        init(attributeSet);
    }

    private void init(AttributeSet attributeSet) {
        super.setVisibility(this.mEmptyVisibility);
        this.mContentId = -1;
        if (attributeSet != null) {
            attributeSet = getContext().obtainStyledAttributes(attributeSet, C0001R.styleable.ConstraintLayout_placeholder);
            int indexCount = attributeSet.getIndexCount();
            for (int i = 0; i < indexCount; i++) {
                int index = attributeSet.getIndex(i);
                if (index == C0001R.styleable.ConstraintLayout_placeholder_content) {
                    this.mContentId = attributeSet.getResourceId(index, this.mContentId);
                } else if (index == C0001R.styleable.ConstraintLayout_placeholder_emptyVisibility) {
                    this.mEmptyVisibility = attributeSet.getInt(index, this.mEmptyVisibility);
                }
            }
        }
    }

    public void setEmptyVisibility(int i) {
        this.mEmptyVisibility = i;
    }

    public int getEmptyVisibility() {
        return this.mEmptyVisibility;
    }

    public View getContent() {
        return this.mContent;
    }

    public void onDraw(Canvas canvas) {
        if (isInEditMode()) {
            canvas.drawRGB(223, 223, 223);
            Paint paint = new Paint();
            paint.setARGB(255, 210, 210, 210);
            paint.setTextAlign(Align.CENTER);
            paint.setTypeface(Typeface.create(Typeface.DEFAULT, 0));
            Rect rect = new Rect();
            canvas.getClipBounds(rect);
            paint.setTextSize((float) rect.height());
            int height = rect.height();
            int width = rect.width();
            paint.setTextAlign(Align.LEFT);
            String str = "?";
            paint.getTextBounds(str, 0, 1, rect);
            canvas.drawText(str, ((((float) width) / 2.0f) - (((float) rect.width()) / 2.0f)) - ((float) rect.left), ((((float) height) / 2.0f) + (((float) rect.height()) / 2.0f)) - ((float) rect.bottom), paint);
        }
    }

    public void updatePreLayout(ConstraintLayout constraintLayout) {
        if (this.mContentId == -1 && !isInEditMode()) {
            setVisibility(this.mEmptyVisibility);
        }
        this.mContent = constraintLayout.findViewById(this.mContentId);
        constraintLayout = this.mContent;
        if (constraintLayout != null) {
            ((LayoutParams) constraintLayout.getLayoutParams()).isInPlaceholder = true;
            this.mContent.setVisibility(0);
            setVisibility(0);
        }
    }

    public void setContentId(int i) {
        if (this.mContentId != i) {
            View view = this.mContent;
            if (view != null) {
                view.setVisibility(0);
                ((LayoutParams) this.mContent.getLayoutParams()).isInPlaceholder = false;
                this.mContent = null;
            }
            this.mContentId = i;
            if (i != -1) {
                i = ((View) getParent()).findViewById(i);
                if (i != 0) {
                    i.setVisibility(8);
                }
            }
        }
    }

    public void updatePostMeasure(ConstraintLayout constraintLayout) {
        if (this.mContent != null) {
            LayoutParams layoutParams = (LayoutParams) getLayoutParams();
            LayoutParams layoutParams2 = (LayoutParams) this.mContent.getLayoutParams();
            layoutParams2.widget.setVisibility(0);
            layoutParams.widget.setWidth(layoutParams2.widget.getWidth());
            layoutParams.widget.setHeight(layoutParams2.widget.getHeight());
            layoutParams2.widget.setVisibility(8);
        }
    }
}
