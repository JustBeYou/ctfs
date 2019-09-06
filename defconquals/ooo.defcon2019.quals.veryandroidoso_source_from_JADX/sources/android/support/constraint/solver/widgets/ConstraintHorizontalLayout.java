package android.support.constraint.solver.widgets;

import android.support.constraint.solver.LinearSystem;
import android.support.constraint.solver.widgets.ConstraintAnchor.Strength;
import android.support.constraint.solver.widgets.ConstraintAnchor.Type;

public class ConstraintHorizontalLayout extends ConstraintWidgetContainer {
    private ContentAlignment mAlignment = ContentAlignment.MIDDLE;

    public enum ContentAlignment {
        BEGIN,
        MIDDLE,
        END,
        TOP,
        VERTICAL_MIDDLE,
        BOTTOM,
        LEFT,
        RIGHT
    }

    public ConstraintHorizontalLayout(int i, int i2, int i3, int i4) {
        super(i, i2, i3, i4);
    }

    public ConstraintHorizontalLayout(int i, int i2) {
        super(i, i2);
    }

    public void addToSolver(LinearSystem linearSystem) {
        if (this.mChildren.size() != 0) {
            int i = 0;
            int size = this.mChildren.size();
            ConstraintWidget constraintWidget = this;
            while (i < size) {
                ConstraintWidget constraintWidget2 = (ConstraintWidget) this.mChildren.get(i);
                if (constraintWidget != this) {
                    constraintWidget2.connect(Type.LEFT, constraintWidget, Type.RIGHT);
                    constraintWidget.connect(Type.RIGHT, constraintWidget2, Type.LEFT);
                } else {
                    constraintWidget2.connect(Type.LEFT, constraintWidget, Type.LEFT, 0, this.mAlignment == ContentAlignment.END ? Strength.WEAK : Strength.STRONG);
                }
                constraintWidget2.connect(Type.TOP, (ConstraintWidget) this, Type.TOP);
                constraintWidget2.connect(Type.BOTTOM, (ConstraintWidget) this, Type.BOTTOM);
                i++;
                constraintWidget = constraintWidget2;
            }
            if (constraintWidget != this) {
                constraintWidget.connect(Type.RIGHT, (ConstraintWidget) this, Type.RIGHT, 0, this.mAlignment == ContentAlignment.BEGIN ? Strength.WEAK : Strength.STRONG);
            }
        }
        super.addToSolver(linearSystem);
    }
}
