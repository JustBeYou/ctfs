package android.support.constraint.solver.widgets;

import android.support.constraint.solver.widgets.ConstraintAnchor.Type;
import android.support.constraint.solver.widgets.ConstraintWidget.DimensionBehaviour;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Analyzer {
    private Analyzer() {
    }

    public static void determineGroups(ConstraintWidgetContainer constraintWidgetContainer) {
        if ((constraintWidgetContainer.getOptimizationLevel() & 32) != 32) {
            singleGroup(constraintWidgetContainer);
            return;
        }
        boolean z;
        int i;
        int i2;
        constraintWidgetContainer.mSkipSolver = true;
        constraintWidgetContainer.mGroupsWrapOptimized = false;
        constraintWidgetContainer.mHorizontalWrapOptimized = false;
        constraintWidgetContainer.mVerticalWrapOptimized = false;
        List<ConstraintWidget> list = constraintWidgetContainer.mChildren;
        List<ConstraintWidgetGroup> list2 = constraintWidgetContainer.mWidgetGroups;
        Object obj = constraintWidgetContainer.getHorizontalDimensionBehaviour() == DimensionBehaviour.WRAP_CONTENT ? 1 : null;
        Object obj2 = constraintWidgetContainer.getVerticalDimensionBehaviour() == DimensionBehaviour.WRAP_CONTENT ? 1 : null;
        if (obj == null) {
            if (obj2 == null) {
                z = false;
                list2.clear();
                for (ConstraintWidget constraintWidget : list) {
                    constraintWidget.mBelongingGroup = null;
                    constraintWidget.mGroupsToSolver = false;
                    constraintWidget.resetResolutionNodes();
                }
                for (ConstraintWidget constraintWidget2 : list) {
                    if (constraintWidget2.mBelongingGroup != null && !determineGroups(constraintWidget2, list2, r6)) {
                        singleGroup(constraintWidgetContainer);
                        constraintWidgetContainer.mSkipSolver = false;
                        return;
                    }
                }
                i = 0;
                i2 = 0;
                for (ConstraintWidgetGroup constraintWidgetGroup : list2) {
                    i = Math.max(i, getMaxDimension(constraintWidgetGroup, 0));
                    i2 = Math.max(i2, getMaxDimension(constraintWidgetGroup, 1));
                }
                if (obj != null) {
                    constraintWidgetContainer.setHorizontalDimensionBehaviour(DimensionBehaviour.FIXED);
                    constraintWidgetContainer.setWidth(i);
                    constraintWidgetContainer.mGroupsWrapOptimized = true;
                    constraintWidgetContainer.mHorizontalWrapOptimized = true;
                    constraintWidgetContainer.mWrapFixedWidth = i;
                }
                if (obj2 != null) {
                    constraintWidgetContainer.setVerticalDimensionBehaviour(DimensionBehaviour.FIXED);
                    constraintWidgetContainer.setHeight(i2);
                    constraintWidgetContainer.mGroupsWrapOptimized = true;
                    constraintWidgetContainer.mVerticalWrapOptimized = true;
                    constraintWidgetContainer.mWrapFixedHeight = i2;
                }
                setPosition(list2, 0, constraintWidgetContainer.getWidth());
                setPosition(list2, 1, constraintWidgetContainer.getHeight());
            }
        }
        z = true;
        list2.clear();
        for (ConstraintWidget constraintWidget3 : list) {
            constraintWidget3.mBelongingGroup = null;
            constraintWidget3.mGroupsToSolver = false;
            constraintWidget3.resetResolutionNodes();
        }
        for (ConstraintWidget constraintWidget22 : list) {
            if (constraintWidget22.mBelongingGroup != null) {
            }
        }
        i = 0;
        i2 = 0;
        for (ConstraintWidgetGroup constraintWidgetGroup2 : list2) {
            i = Math.max(i, getMaxDimension(constraintWidgetGroup2, 0));
            i2 = Math.max(i2, getMaxDimension(constraintWidgetGroup2, 1));
        }
        if (obj != null) {
            constraintWidgetContainer.setHorizontalDimensionBehaviour(DimensionBehaviour.FIXED);
            constraintWidgetContainer.setWidth(i);
            constraintWidgetContainer.mGroupsWrapOptimized = true;
            constraintWidgetContainer.mHorizontalWrapOptimized = true;
            constraintWidgetContainer.mWrapFixedWidth = i;
        }
        if (obj2 != null) {
            constraintWidgetContainer.setVerticalDimensionBehaviour(DimensionBehaviour.FIXED);
            constraintWidgetContainer.setHeight(i2);
            constraintWidgetContainer.mGroupsWrapOptimized = true;
            constraintWidgetContainer.mVerticalWrapOptimized = true;
            constraintWidgetContainer.mWrapFixedHeight = i2;
        }
        setPosition(list2, 0, constraintWidgetContainer.getWidth());
        setPosition(list2, 1, constraintWidgetContainer.getHeight());
    }

    private static boolean determineGroups(ConstraintWidget constraintWidget, List<ConstraintWidgetGroup> list, boolean z) {
        ConstraintWidgetGroup constraintWidgetGroup = new ConstraintWidgetGroup(new ArrayList(), true);
        list.add(constraintWidgetGroup);
        return traverse(constraintWidget, constraintWidgetGroup, list, z);
    }

    private static boolean traverse(ConstraintWidget constraintWidget, ConstraintWidgetGroup constraintWidgetGroup, List<ConstraintWidgetGroup> list, boolean z) {
        if (constraintWidget == null) {
            return true;
        }
        constraintWidget.mOptimizerMeasured = false;
        ConstraintWidgetContainer constraintWidgetContainer = (ConstraintWidgetContainer) constraintWidget.getParent();
        if (constraintWidget.mBelongingGroup == null) {
            DimensionBehaviour verticalDimensionBehaviour;
            DimensionBehaviour dimensionBehaviour;
            int i;
            constraintWidget.mOptimizerMeasurable = true;
            constraintWidgetGroup.mConstrainedGroup.add(constraintWidget);
            constraintWidget.mBelongingGroup = constraintWidgetGroup;
            if (constraintWidget.mLeft.mTarget == null && constraintWidget.mRight.mTarget == null && constraintWidget.mTop.mTarget == null && constraintWidget.mBottom.mTarget == null && constraintWidget.mBaseline.mTarget == null && constraintWidget.mCenter.mTarget == null) {
                invalidate(constraintWidgetContainer, constraintWidget, constraintWidgetGroup);
                if (z) {
                    return false;
                }
            }
            if (!(constraintWidget.mTop.mTarget == null || constraintWidget.mBottom.mTarget == null)) {
                verticalDimensionBehaviour = constraintWidgetContainer.getVerticalDimensionBehaviour();
                dimensionBehaviour = DimensionBehaviour.WRAP_CONTENT;
                if (z) {
                    invalidate(constraintWidgetContainer, constraintWidget, constraintWidgetGroup);
                    return false;
                } else if (!(constraintWidget.mTop.mTarget.mOwner == constraintWidget.getParent() && constraintWidget.mBottom.mTarget.mOwner == constraintWidget.getParent())) {
                    invalidate(constraintWidgetContainer, constraintWidget, constraintWidgetGroup);
                }
            }
            if (!(constraintWidget.mLeft.mTarget == null || constraintWidget.mRight.mTarget == null)) {
                verticalDimensionBehaviour = constraintWidgetContainer.getHorizontalDimensionBehaviour();
                dimensionBehaviour = DimensionBehaviour.WRAP_CONTENT;
                if (z) {
                    invalidate(constraintWidgetContainer, constraintWidget, constraintWidgetGroup);
                    return false;
                } else if (!(constraintWidget.mLeft.mTarget.mOwner == constraintWidget.getParent() && constraintWidget.mRight.mTarget.mOwner == constraintWidget.getParent())) {
                    invalidate(constraintWidgetContainer, constraintWidget, constraintWidgetGroup);
                }
            }
            if (((constraintWidget.getHorizontalDimensionBehaviour() == DimensionBehaviour.MATCH_CONSTRAINT ? 1 : 0) ^ (constraintWidget.getVerticalDimensionBehaviour() == DimensionBehaviour.MATCH_CONSTRAINT ? 1 : 0)) != 0 && constraintWidget.mDimensionRatio != 0.0f) {
                resolveDimensionRatio(constraintWidget);
            } else if (constraintWidget.getHorizontalDimensionBehaviour() == DimensionBehaviour.MATCH_CONSTRAINT || constraintWidget.getVerticalDimensionBehaviour() == DimensionBehaviour.MATCH_CONSTRAINT) {
                invalidate(constraintWidgetContainer, constraintWidget, constraintWidgetGroup);
                if (z) {
                    return false;
                }
            }
            if (((constraintWidget.mLeft.mTarget == null && constraintWidget.mRight.mTarget == null) || ((constraintWidget.mLeft.mTarget != null && constraintWidget.mLeft.mTarget.mOwner == constraintWidget.mParent && constraintWidget.mRight.mTarget == null) || ((constraintWidget.mRight.mTarget != null && constraintWidget.mRight.mTarget.mOwner == constraintWidget.mParent && constraintWidget.mLeft.mTarget == null) || (constraintWidget.mLeft.mTarget != null && constraintWidget.mLeft.mTarget.mOwner == constraintWidget.mParent && constraintWidget.mRight.mTarget != null && constraintWidget.mRight.mTarget.mOwner == constraintWidget.mParent)))) && constraintWidget.mCenter.mTarget == null && !(constraintWidget instanceof Guideline) && !(constraintWidget instanceof Helper)) {
                constraintWidgetGroup.mStartHorizontalWidgets.add(constraintWidget);
            }
            if (((constraintWidget.mTop.mTarget == null && constraintWidget.mBottom.mTarget == null) || ((constraintWidget.mTop.mTarget != null && constraintWidget.mTop.mTarget.mOwner == constraintWidget.mParent && constraintWidget.mBottom.mTarget == null) || ((constraintWidget.mBottom.mTarget != null && constraintWidget.mBottom.mTarget.mOwner == constraintWidget.mParent && constraintWidget.mTop.mTarget == null) || (constraintWidget.mTop.mTarget != null && constraintWidget.mTop.mTarget.mOwner == constraintWidget.mParent && constraintWidget.mBottom.mTarget != null && constraintWidget.mBottom.mTarget.mOwner == constraintWidget.mParent)))) && constraintWidget.mCenter.mTarget == null && constraintWidget.mBaseline.mTarget == null && !(constraintWidget instanceof Guideline) && !(constraintWidget instanceof Helper)) {
                constraintWidgetGroup.mStartVerticalWidgets.add(constraintWidget);
            }
            if (constraintWidget instanceof Helper) {
                invalidate(constraintWidgetContainer, constraintWidget, constraintWidgetGroup);
                if (z) {
                    return false;
                }
                Helper helper = (Helper) constraintWidget;
                for (i = 0; i < helper.mWidgetsCount; i++) {
                    if (!traverse(helper.mWidgets[i], constraintWidgetGroup, list, z)) {
                        return false;
                    }
                }
            }
            for (ConstraintAnchor constraintAnchor : constraintWidget.mListAnchors) {
                if (!(constraintAnchor.mTarget == null || constraintAnchor.mTarget.mOwner == constraintWidget.getParent())) {
                    if (constraintAnchor.mType == Type.CENTER) {
                        invalidate(constraintWidgetContainer, constraintWidget, constraintWidgetGroup);
                        if (z) {
                            return false;
                        }
                    }
                    setConnection(constraintAnchor);
                    if (!traverse(constraintAnchor.mTarget.mOwner, constraintWidgetGroup, list, z)) {
                        return false;
                    }
                }
            }
            return true;
        }
        if (constraintWidget.mBelongingGroup != constraintWidgetGroup) {
            constraintWidgetGroup.mConstrainedGroup.addAll(constraintWidget.mBelongingGroup.mConstrainedGroup);
            constraintWidgetGroup.mStartHorizontalWidgets.addAll(constraintWidget.mBelongingGroup.mStartHorizontalWidgets);
            constraintWidgetGroup.mStartVerticalWidgets.addAll(constraintWidget.mBelongingGroup.mStartVerticalWidgets);
            if (!constraintWidget.mBelongingGroup.mSkipSolver) {
                constraintWidgetGroup.mSkipSolver = false;
            }
            list.remove(constraintWidget.mBelongingGroup);
            for (ConstraintWidget constraintWidget2 : constraintWidget.mBelongingGroup.mConstrainedGroup) {
                constraintWidget2.mBelongingGroup = constraintWidgetGroup;
            }
        }
        return true;
    }

    private static void invalidate(ConstraintWidgetContainer constraintWidgetContainer, ConstraintWidget constraintWidget, ConstraintWidgetGroup constraintWidgetGroup) {
        constraintWidgetGroup.mSkipSolver = false;
        constraintWidgetContainer.mSkipSolver = false;
        constraintWidget.mOptimizerMeasurable = false;
    }

    private static int getMaxDimension(ConstraintWidgetGroup constraintWidgetGroup, int i) {
        int i2 = i * 2;
        List startWidgets = constraintWidgetGroup.getStartWidgets(i);
        int size = startWidgets.size();
        int i3 = 0;
        for (int i4 = 0; i4 < size; i4++) {
            boolean z;
            ConstraintWidget constraintWidget = (ConstraintWidget) startWidgets.get(i4);
            int i5 = i2 + 1;
            if (constraintWidget.mListAnchors[i5].mTarget != null) {
                if (constraintWidget.mListAnchors[i2].mTarget == null || constraintWidget.mListAnchors[i5].mTarget == null) {
                    z = false;
                    i3 = Math.max(i3, getMaxDimensionTraversal(constraintWidget, i, z, 0));
                }
            }
            z = true;
            i3 = Math.max(i3, getMaxDimensionTraversal(constraintWidget, i, z, 0));
        }
        constraintWidgetGroup.mGroupDimensions[i] = i3;
        return i3;
    }

    private static int getMaxDimensionTraversal(ConstraintWidget constraintWidget, int i, boolean z, int i2) {
        ConstraintWidget constraintWidget2 = constraintWidget;
        int i3 = i;
        boolean z2 = z;
        int i4 = 0;
        if (!constraintWidget2.mOptimizerMeasurable) {
            return 0;
        }
        int baselineDistance;
        int height;
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        Object obj = (constraintWidget2.mBaseline.mTarget == null || i3 != 1) ? null : 1;
        if (z2) {
            baselineDistance = constraintWidget.getBaselineDistance();
            height = constraintWidget.getHeight() - constraintWidget.getBaselineDistance();
            i5 = i3 * 2;
            i6 = i5 + 1;
        } else {
            baselineDistance = constraintWidget.getHeight() - constraintWidget.getBaselineDistance();
            height = constraintWidget.getBaselineDistance();
            i6 = i3 * 2;
            i5 = i6 + 1;
        }
        if (constraintWidget2.mListAnchors[i6].mTarget == null || constraintWidget2.mListAnchors[i5].mTarget != null) {
            i7 = i6;
            i6 = 1;
        } else {
            i7 = i5;
            i5 = i6;
            i6 = -1;
        }
        int margin = (constraintWidget2.mListAnchors[i5].getMargin() * i6) + getParentBiasOffset(constraintWidget, i);
        int i10 = (obj != null ? i2 - baselineDistance : i2) + margin;
        int width = (i3 == 0 ? constraintWidget.getWidth() : constraintWidget.getHeight()) * i6;
        Iterator it = constraintWidget2.mListAnchors[i5].getResolutionNode().dependents.iterator();
        while (it.hasNext()) {
            i4 = Math.max(i4, getMaxDimensionTraversal(((ResolutionAnchor) ((ResolutionNode) it.next())).myAnchor.mOwner, i3, z2, i10));
        }
        Iterator it2 = constraintWidget2.mListAnchors[i7].getResolutionNode().dependents.iterator();
        int i11 = 0;
        while (it2.hasNext()) {
            i2 = it2;
            i11 = Math.max(i11, getMaxDimensionTraversal(((ResolutionAnchor) ((ResolutionNode) it2.next())).myAnchor.mOwner, i3, z2, width + i10));
            it2 = i2;
        }
        if (obj != null) {
            i4 -= baselineDistance;
            i11 += height;
            i8 = 1;
        } else {
            i11 += (i3 == 0 ? constraintWidget.getWidth() : constraintWidget.getHeight()) * i6;
            i8 = 1;
        }
        int i12;
        if (i3 == i8) {
            it2 = constraintWidget2.mBaseline.getResolutionNode().dependents.iterator();
            int i13 = 0;
            while (it2.hasNext()) {
                i2 = it2;
                ResolutionAnchor resolutionAnchor = (ResolutionAnchor) ((ResolutionNode) it2.next());
                if (i6 == i8) {
                    i13 = Math.max(i13, getMaxDimensionTraversal(resolutionAnchor.myAnchor.mOwner, i3, z2, baselineDistance + i10));
                    i12 = i7;
                } else {
                    i12 = i7;
                    i13 = Math.max(i13, getMaxDimensionTraversal(resolutionAnchor.myAnchor.mOwner, i3, z2, (height * i6) + i10));
                }
                it2 = i2;
                i7 = i12;
                i8 = 1;
            }
            i12 = i7;
            i8 = i13;
            i9 = (constraintWidget2.mBaseline.getResolutionNode().dependents.size() <= 0 || obj != null) ? i8 : i6 == 1 ? i8 + baselineDistance : i8 - height;
        } else {
            i12 = i7;
            i9 = 0;
        }
        margin += Math.max(i4, Math.max(i11, i9));
        i9 = i10 + width;
        if (i6 == -1) {
            int i14 = i10;
            i10 = i9;
            i9 = i14;
        }
        if (z2) {
            Optimizer.setOptimizedWidget(constraintWidget2, i3, i10);
            constraintWidget2.setFrame(i10, i9, i3);
        } else {
            constraintWidget2.mBelongingGroup.addWidgetsToSet(constraintWidget2, i3);
            constraintWidget2.setRelativePositioning(i10, i3);
        }
        if (constraintWidget.getDimensionBehaviour(i) == DimensionBehaviour.MATCH_CONSTRAINT && constraintWidget2.mDimensionRatio != 0.0f) {
            constraintWidget2.mBelongingGroup.addWidgetsToSet(constraintWidget2, i3);
        }
        if (!(constraintWidget2.mListAnchors[i5].mTarget == null || constraintWidget2.mListAnchors[r17].mTarget == null)) {
            ConstraintWidget parent = constraintWidget.getParent();
            if (constraintWidget2.mListAnchors[i5].mTarget.mOwner == parent && constraintWidget2.mListAnchors[r17].mTarget.mOwner == parent) {
                constraintWidget2.mBelongingGroup.addWidgetsToSet(constraintWidget2, i3);
            }
        }
        return margin;
    }

    private static void setConnection(ConstraintAnchor constraintAnchor) {
        ResolutionNode resolutionNode = constraintAnchor.getResolutionNode();
        if (constraintAnchor.mTarget != null && constraintAnchor.mTarget.mTarget != constraintAnchor) {
            constraintAnchor.mTarget.getResolutionNode().addDependent(resolutionNode);
        }
    }

    private static void singleGroup(ConstraintWidgetContainer constraintWidgetContainer) {
        constraintWidgetContainer.mWidgetGroups.clear();
        constraintWidgetContainer.mWidgetGroups.add(null, new ConstraintWidgetGroup(constraintWidgetContainer.mChildren));
    }

    public static void setPosition(List<ConstraintWidgetGroup> list, int i, int i2) {
        int size = list.size();
        for (int i3 = 0; i3 < size; i3++) {
            for (ConstraintWidget constraintWidget : ((ConstraintWidgetGroup) list.get(i3)).getWidgetsToSet(i)) {
                if (constraintWidget.mOptimizerMeasurable) {
                    updateSizeDependentWidgets(constraintWidget, i, i2);
                }
            }
        }
    }

    private static void updateSizeDependentWidgets(ConstraintWidget constraintWidget, int i, int i2) {
        int i3 = i * 2;
        ConstraintAnchor constraintAnchor = constraintWidget.mListAnchors[i3];
        ConstraintAnchor constraintAnchor2 = constraintWidget.mListAnchors[i3 + 1];
        Object obj = (constraintAnchor.mTarget == null || constraintAnchor2.mTarget == null) ? null : 1;
        if (obj != null) {
            Optimizer.setOptimizedWidget(constraintWidget, i, getParentBiasOffset(constraintWidget, i) + constraintAnchor.getMargin());
        } else if (constraintWidget.mDimensionRatio == 0.0f || constraintWidget.getDimensionBehaviour(i) != DimensionBehaviour.MATCH_CONSTRAINT) {
            i2 -= constraintWidget.getRelativePositioning(i);
            i3 = i2 - constraintWidget.getLength(i);
            constraintWidget.setFrame(i3, i2, i);
            Optimizer.setOptimizedWidget(constraintWidget, i, i3);
        } else {
            i2 = resolveDimensionRatio(constraintWidget);
            i3 = (int) constraintWidget.mListAnchors[i3].getResolutionNode().resolvedOffset;
            int i4 = i3 + i2;
            constraintAnchor2.getResolutionNode().resolvedTarget = constraintAnchor.getResolutionNode();
            constraintAnchor2.getResolutionNode().resolvedOffset = (float) i2;
            constraintAnchor2.getResolutionNode().state = 1;
            constraintWidget.setFrame(i3, i4, i);
        }
    }

    private static int getParentBiasOffset(ConstraintWidget constraintWidget, int i) {
        int i2 = i * 2;
        ConstraintAnchor constraintAnchor = constraintWidget.mListAnchors[i2];
        ConstraintAnchor constraintAnchor2 = constraintWidget.mListAnchors[i2 + 1];
        if (constraintAnchor.mTarget == null || constraintAnchor.mTarget.mOwner != constraintWidget.mParent || constraintAnchor2.mTarget == null || constraintAnchor2.mTarget.mOwner != constraintWidget.mParent) {
            return null;
        }
        return (int) (((float) (((constraintWidget.mParent.getLength(i) - constraintAnchor.getMargin()) - constraintAnchor2.getMargin()) - constraintWidget.getLength(i))) * (i == 0 ? constraintWidget.mHorizontalBiasPercent : constraintWidget.mVerticalBiasPercent));
    }

    private static int resolveDimensionRatio(ConstraintWidget constraintWidget) {
        int height;
        if (constraintWidget.getHorizontalDimensionBehaviour() == DimensionBehaviour.MATCH_CONSTRAINT) {
            if (constraintWidget.mDimensionRatioSide == 0) {
                height = (int) (((float) constraintWidget.getHeight()) * constraintWidget.mDimensionRatio);
            } else {
                height = (int) (((float) constraintWidget.getHeight()) / constraintWidget.mDimensionRatio);
            }
            constraintWidget.setWidth(height);
            return height;
        } else if (constraintWidget.getVerticalDimensionBehaviour() != DimensionBehaviour.MATCH_CONSTRAINT) {
            return -1;
        } else {
            if (constraintWidget.mDimensionRatioSide == 1) {
                height = (int) (((float) constraintWidget.getWidth()) * constraintWidget.mDimensionRatio);
            } else {
                height = (int) (((float) constraintWidget.getWidth()) / constraintWidget.mDimensionRatio);
            }
            constraintWidget.setHeight(height);
            return height;
        }
    }
}
