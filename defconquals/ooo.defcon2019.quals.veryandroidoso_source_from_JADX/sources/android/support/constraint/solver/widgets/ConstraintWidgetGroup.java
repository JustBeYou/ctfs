package android.support.constraint.solver.widgets;

import android.support.constraint.solver.widgets.ConstraintAnchor.Type;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ConstraintWidgetGroup {
    public List<ConstraintWidget> mConstrainedGroup;
    public final int[] mGroupDimensions = new int[]{this.mGroupWidth, this.mGroupHeight};
    int mGroupHeight = -1;
    int mGroupWidth = -1;
    public boolean mSkipSolver = false;
    List<ConstraintWidget> mStartHorizontalWidgets = new ArrayList();
    List<ConstraintWidget> mStartVerticalWidgets = new ArrayList();
    List<ConstraintWidget> mUnresolvedWidgets = new ArrayList();
    HashSet<ConstraintWidget> mWidgetsToSetHorizontal = new HashSet();
    HashSet<ConstraintWidget> mWidgetsToSetVertical = new HashSet();
    List<ConstraintWidget> mWidgetsToSolve = new ArrayList();

    ConstraintWidgetGroup(List<ConstraintWidget> list) {
        this.mConstrainedGroup = list;
    }

    ConstraintWidgetGroup(List<ConstraintWidget> list, boolean z) {
        this.mConstrainedGroup = list;
        this.mSkipSolver = z;
    }

    public List<ConstraintWidget> getStartWidgets(int i) {
        if (i == 0) {
            return this.mStartHorizontalWidgets;
        }
        return i == 1 ? this.mStartVerticalWidgets : 0;
    }

    Set<ConstraintWidget> getWidgetsToSet(int i) {
        if (i == 0) {
            return this.mWidgetsToSetHorizontal;
        }
        return i == 1 ? this.mWidgetsToSetVertical : 0;
    }

    void addWidgetsToSet(ConstraintWidget constraintWidget, int i) {
        if (i == 0) {
            this.mWidgetsToSetHorizontal.add(constraintWidget);
        } else if (i == 1) {
            this.mWidgetsToSetVertical.add(constraintWidget);
        }
    }

    List<ConstraintWidget> getWidgetsToSolve() {
        if (!this.mWidgetsToSolve.isEmpty()) {
            return this.mWidgetsToSolve;
        }
        int size = this.mConstrainedGroup.size();
        for (int i = 0; i < size; i++) {
            ConstraintWidget constraintWidget = (ConstraintWidget) this.mConstrainedGroup.get(i);
            if (!constraintWidget.mOptimizerMeasurable) {
                getWidgetsToSolveTraversal((ArrayList) this.mWidgetsToSolve, constraintWidget);
            }
        }
        this.mUnresolvedWidgets.clear();
        this.mUnresolvedWidgets.addAll(this.mConstrainedGroup);
        this.mUnresolvedWidgets.removeAll(this.mWidgetsToSolve);
        return this.mWidgetsToSolve;
    }

    private void getWidgetsToSolveTraversal(ArrayList<ConstraintWidget> arrayList, ConstraintWidget constraintWidget) {
        if (!constraintWidget.mGroupsToSolver) {
            arrayList.add(constraintWidget);
            constraintWidget.mGroupsToSolver = true;
            if (!constraintWidget.isFullyResolved()) {
                if (constraintWidget instanceof Helper) {
                    Helper helper = (Helper) constraintWidget;
                    int i = helper.mWidgetsCount;
                    for (int i2 = 0; i2 < i; i2++) {
                        getWidgetsToSolveTraversal(arrayList, helper.mWidgets[i2]);
                    }
                }
                for (ConstraintAnchor constraintAnchor : constraintWidget.mListAnchors) {
                    ConstraintAnchor constraintAnchor2 = constraintAnchor2.mTarget;
                    if (constraintAnchor2 != null) {
                        ConstraintWidget constraintWidget2 = constraintAnchor2.mOwner;
                        if (!(constraintAnchor2 == null || constraintWidget2 == constraintWidget.getParent())) {
                            getWidgetsToSolveTraversal(arrayList, constraintWidget2);
                        }
                    }
                }
            }
        }
    }

    void updateUnresolvedWidgets() {
        int size = this.mUnresolvedWidgets.size();
        for (int i = 0; i < size; i++) {
            updateResolvedDimension((ConstraintWidget) this.mUnresolvedWidgets.get(i));
        }
    }

    private void updateResolvedDimension(ConstraintWidget constraintWidget) {
        if (constraintWidget.mOptimizerMeasurable && !constraintWidget.isFullyResolved()) {
            ConstraintAnchor constraintAnchor;
            int width;
            ConstraintAnchor constraintAnchor2;
            int i;
            Object obj = null;
            Object obj2 = constraintWidget.mRight.mTarget != null ? 1 : null;
            if (obj2 != null) {
                constraintAnchor = constraintWidget.mRight.mTarget;
            } else {
                constraintAnchor = constraintWidget.mLeft.mTarget;
            }
            if (constraintAnchor != null) {
                if (!constraintAnchor.mOwner.mOptimizerMeasured) {
                    updateResolvedDimension(constraintAnchor.mOwner);
                }
                if (constraintAnchor.mType == Type.RIGHT) {
                    width = constraintAnchor.mOwner.getWidth() + constraintAnchor.mOwner.mX;
                } else if (constraintAnchor.mType == Type.LEFT) {
                    width = constraintAnchor.mOwner.mX;
                }
                if (obj2 == null) {
                    width -= constraintWidget.mRight.getMargin();
                } else {
                    width += constraintWidget.mLeft.getMargin() + constraintWidget.getWidth();
                }
                constraintWidget.setHorizontalDimension(width - constraintWidget.getWidth(), width);
                if (constraintWidget.mBaseline.mTarget == null) {
                    constraintAnchor2 = constraintWidget.mBaseline.mTarget;
                    if (!constraintAnchor2.mOwner.mOptimizerMeasured) {
                        updateResolvedDimension(constraintAnchor2.mOwner);
                    }
                    i = (constraintAnchor2.mOwner.mY + constraintAnchor2.mOwner.mBaselineDistance) - constraintWidget.mBaselineDistance;
                    constraintWidget.setVerticalDimension(i, constraintWidget.mHeight + i);
                    constraintWidget.mOptimizerMeasured = true;
                }
                if (constraintWidget.mBottom.mTarget != null) {
                    obj = 1;
                }
                if (obj == null) {
                    constraintAnchor2 = constraintWidget.mBottom.mTarget;
                } else {
                    constraintAnchor2 = constraintWidget.mTop.mTarget;
                }
                if (constraintAnchor2 != null) {
                    if (!constraintAnchor2.mOwner.mOptimizerMeasured) {
                        updateResolvedDimension(constraintAnchor2.mOwner);
                    }
                    if (constraintAnchor2.mType == Type.BOTTOM) {
                        width = constraintAnchor2.mOwner.mY + constraintAnchor2.mOwner.getHeight();
                    } else if (constraintAnchor2.mType == Type.TOP) {
                        width = constraintAnchor2.mOwner.mY;
                    }
                }
                if (obj == null) {
                    width -= constraintWidget.mBottom.getMargin();
                } else {
                    width += constraintWidget.mTop.getMargin() + constraintWidget.getHeight();
                }
                constraintWidget.setVerticalDimension(width - constraintWidget.getHeight(), width);
                constraintWidget.mOptimizerMeasured = true;
                return;
            }
            width = 0;
            if (obj2 == null) {
                width += constraintWidget.mLeft.getMargin() + constraintWidget.getWidth();
            } else {
                width -= constraintWidget.mRight.getMargin();
            }
            constraintWidget.setHorizontalDimension(width - constraintWidget.getWidth(), width);
            if (constraintWidget.mBaseline.mTarget == null) {
                if (constraintWidget.mBottom.mTarget != null) {
                    obj = 1;
                }
                if (obj == null) {
                    constraintAnchor2 = constraintWidget.mTop.mTarget;
                } else {
                    constraintAnchor2 = constraintWidget.mBottom.mTarget;
                }
                if (constraintAnchor2 != null) {
                    if (constraintAnchor2.mOwner.mOptimizerMeasured) {
                        updateResolvedDimension(constraintAnchor2.mOwner);
                    }
                    if (constraintAnchor2.mType == Type.BOTTOM) {
                        width = constraintAnchor2.mOwner.mY + constraintAnchor2.mOwner.getHeight();
                    } else if (constraintAnchor2.mType == Type.TOP) {
                        width = constraintAnchor2.mOwner.mY;
                    }
                }
                if (obj == null) {
                    width += constraintWidget.mTop.getMargin() + constraintWidget.getHeight();
                } else {
                    width -= constraintWidget.mBottom.getMargin();
                }
                constraintWidget.setVerticalDimension(width - constraintWidget.getHeight(), width);
                constraintWidget.mOptimizerMeasured = true;
                return;
            }
            constraintAnchor2 = constraintWidget.mBaseline.mTarget;
            if (constraintAnchor2.mOwner.mOptimizerMeasured) {
                updateResolvedDimension(constraintAnchor2.mOwner);
            }
            i = (constraintAnchor2.mOwner.mY + constraintAnchor2.mOwner.mBaselineDistance) - constraintWidget.mBaselineDistance;
            constraintWidget.setVerticalDimension(i, constraintWidget.mHeight + i);
            constraintWidget.mOptimizerMeasured = true;
        }
    }
}
