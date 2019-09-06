package android.support.constraint.solver.widgets;

import android.support.constraint.solver.LinearSystem;
import android.support.constraint.solver.Metrics;
import android.support.constraint.solver.widgets.ConstraintWidget.DimensionBehaviour;

public class Optimizer {
    static final int FLAG_CHAIN_DANGLING = 1;
    static final int FLAG_RECOMPUTE_BOUNDS = 2;
    static final int FLAG_USE_OPTIMIZE = 0;
    public static final int OPTIMIZATION_BARRIER = 2;
    public static final int OPTIMIZATION_CHAIN = 4;
    public static final int OPTIMIZATION_DIMENSIONS = 8;
    public static final int OPTIMIZATION_DIRECT = 1;
    public static final int OPTIMIZATION_GROUPS = 32;
    public static final int OPTIMIZATION_NONE = 0;
    public static final int OPTIMIZATION_RATIO = 16;
    public static final int OPTIMIZATION_STANDARD = 7;
    static boolean[] flags = new boolean[3];

    static void checkMatchParent(ConstraintWidgetContainer constraintWidgetContainer, LinearSystem linearSystem, ConstraintWidget constraintWidget) {
        if (constraintWidgetContainer.mListDimensionBehaviors[0] != DimensionBehaviour.WRAP_CONTENT && constraintWidget.mListDimensionBehaviors[0] == DimensionBehaviour.MATCH_PARENT) {
            int i = constraintWidget.mLeft.mMargin;
            int width = constraintWidgetContainer.getWidth() - constraintWidget.mRight.mMargin;
            constraintWidget.mLeft.mSolverVariable = linearSystem.createObjectVariable(constraintWidget.mLeft);
            constraintWidget.mRight.mSolverVariable = linearSystem.createObjectVariable(constraintWidget.mRight);
            linearSystem.addEquality(constraintWidget.mLeft.mSolverVariable, i);
            linearSystem.addEquality(constraintWidget.mRight.mSolverVariable, width);
            constraintWidget.mHorizontalResolution = 2;
            constraintWidget.setHorizontalDimension(i, width);
        }
        if (constraintWidgetContainer.mListDimensionBehaviors[1] != DimensionBehaviour.WRAP_CONTENT && constraintWidget.mListDimensionBehaviors[1] == DimensionBehaviour.MATCH_PARENT) {
            i = constraintWidget.mTop.mMargin;
            constraintWidgetContainer = constraintWidgetContainer.getHeight() - constraintWidget.mBottom.mMargin;
            constraintWidget.mTop.mSolverVariable = linearSystem.createObjectVariable(constraintWidget.mTop);
            constraintWidget.mBottom.mSolverVariable = linearSystem.createObjectVariable(constraintWidget.mBottom);
            linearSystem.addEquality(constraintWidget.mTop.mSolverVariable, i);
            linearSystem.addEquality(constraintWidget.mBottom.mSolverVariable, constraintWidgetContainer);
            if (constraintWidget.mBaselineDistance > 0 || constraintWidget.getVisibility() == 8) {
                constraintWidget.mBaseline.mSolverVariable = linearSystem.createObjectVariable(constraintWidget.mBaseline);
                linearSystem.addEquality(constraintWidget.mBaseline.mSolverVariable, constraintWidget.mBaselineDistance + i);
            }
            constraintWidget.mVerticalResolution = 2;
            constraintWidget.setVerticalDimension(i, constraintWidgetContainer);
        }
    }

    private static boolean optimizableMatchConstraint(ConstraintWidget constraintWidget, int i) {
        if (constraintWidget.mListDimensionBehaviors[i] != DimensionBehaviour.MATCH_CONSTRAINT) {
            return false;
        }
        int i2 = 1;
        if (constraintWidget.mDimensionRatio != 0.0f) {
            constraintWidget = constraintWidget.mListDimensionBehaviors;
            if (i != 0) {
                i2 = 0;
            }
            return constraintWidget[i2] == DimensionBehaviour.MATCH_CONSTRAINT ? false : false;
        } else {
            if (i != 0) {
                if (constraintWidget.mMatchConstraintDefaultHeight == 0 && constraintWidget.mMatchConstraintMinHeight == 0) {
                    if (constraintWidget.mMatchConstraintMaxHeight != null) {
                    }
                }
                return false;
            } else if (constraintWidget.mMatchConstraintDefaultWidth == 0 && constraintWidget.mMatchConstraintMinWidth == 0 && constraintWidget.mMatchConstraintMaxWidth == null) {
                return true;
            } else {
                return false;
            }
            return true;
        }
    }

    static void analyze(int i, ConstraintWidget constraintWidget) {
        ConstraintWidget constraintWidget2 = constraintWidget;
        constraintWidget.updateResolutionNodes();
        ResolutionAnchor resolutionNode = constraintWidget2.mLeft.getResolutionNode();
        ResolutionAnchor resolutionNode2 = constraintWidget2.mTop.getResolutionNode();
        ResolutionAnchor resolutionNode3 = constraintWidget2.mRight.getResolutionNode();
        ResolutionAnchor resolutionNode4 = constraintWidget2.mBottom.getResolutionNode();
        Object obj = (i & 8) == 8 ? 1 : null;
        Object obj2 = (constraintWidget2.mListDimensionBehaviors[0] == DimensionBehaviour.MATCH_CONSTRAINT && optimizableMatchConstraint(constraintWidget2, 0)) ? 1 : null;
        if (!(resolutionNode.type == 4 || resolutionNode3.type == 4)) {
            if (constraintWidget2.mListDimensionBehaviors[0] != DimensionBehaviour.FIXED) {
                if (obj2 == null || constraintWidget.getVisibility() != 8) {
                    if (obj2 != null) {
                        int width = constraintWidget.getWidth();
                        resolutionNode.setType(1);
                        resolutionNode3.setType(1);
                        if (constraintWidget2.mLeft.mTarget == null && constraintWidget2.mRight.mTarget == null) {
                            if (obj != null) {
                                resolutionNode3.dependsOn(resolutionNode, 1, constraintWidget.getResolutionWidth());
                            } else {
                                resolutionNode3.dependsOn(resolutionNode, width);
                            }
                        } else if (constraintWidget2.mLeft.mTarget == null || constraintWidget2.mRight.mTarget != null) {
                            if (constraintWidget2.mLeft.mTarget != null || constraintWidget2.mRight.mTarget == null) {
                                if (!(constraintWidget2.mLeft.mTarget == null || constraintWidget2.mRight.mTarget == null)) {
                                    if (obj != null) {
                                        constraintWidget.getResolutionWidth().addDependent(resolutionNode);
                                        constraintWidget.getResolutionWidth().addDependent(resolutionNode3);
                                    }
                                    if (constraintWidget2.mDimensionRatio == 0.0f) {
                                        resolutionNode.setType(3);
                                        resolutionNode3.setType(3);
                                        resolutionNode.setOpposite(resolutionNode3, 0.0f);
                                        resolutionNode3.setOpposite(resolutionNode, 0.0f);
                                    } else {
                                        resolutionNode.setType(2);
                                        resolutionNode3.setType(2);
                                        resolutionNode.setOpposite(resolutionNode3, (float) (-width));
                                        resolutionNode3.setOpposite(resolutionNode, (float) width);
                                        constraintWidget2.setWidth(width);
                                    }
                                }
                            } else if (obj != null) {
                                resolutionNode.dependsOn(resolutionNode3, -1, constraintWidget.getResolutionWidth());
                            } else {
                                resolutionNode.dependsOn(resolutionNode3, -width);
                            }
                        } else if (obj != null) {
                            resolutionNode3.dependsOn(resolutionNode, 1, constraintWidget.getResolutionWidth());
                        } else {
                            resolutionNode3.dependsOn(resolutionNode, width);
                        }
                    }
                }
            }
            if (constraintWidget2.mLeft.mTarget == null && constraintWidget2.mRight.mTarget == null) {
                resolutionNode.setType(1);
                resolutionNode3.setType(1);
                if (obj != null) {
                    resolutionNode3.dependsOn(resolutionNode, 1, constraintWidget.getResolutionWidth());
                } else {
                    resolutionNode3.dependsOn(resolutionNode, constraintWidget.getWidth());
                }
            } else if (constraintWidget2.mLeft.mTarget != null && constraintWidget2.mRight.mTarget == null) {
                resolutionNode.setType(1);
                resolutionNode3.setType(1);
                if (obj != null) {
                    resolutionNode3.dependsOn(resolutionNode, 1, constraintWidget.getResolutionWidth());
                } else {
                    resolutionNode3.dependsOn(resolutionNode, constraintWidget.getWidth());
                }
            } else if (constraintWidget2.mLeft.mTarget == null && constraintWidget2.mRight.mTarget != null) {
                resolutionNode.setType(1);
                resolutionNode3.setType(1);
                resolutionNode.dependsOn(resolutionNode3, -constraintWidget.getWidth());
                if (obj != null) {
                    resolutionNode.dependsOn(resolutionNode3, -1, constraintWidget.getResolutionWidth());
                } else {
                    resolutionNode.dependsOn(resolutionNode3, -constraintWidget.getWidth());
                }
            } else if (!(constraintWidget2.mLeft.mTarget == null || constraintWidget2.mRight.mTarget == null)) {
                resolutionNode.setType(2);
                resolutionNode3.setType(2);
                if (obj != null) {
                    constraintWidget.getResolutionWidth().addDependent(resolutionNode);
                    constraintWidget.getResolutionWidth().addDependent(resolutionNode3);
                    resolutionNode.setOpposite(resolutionNode3, -1, constraintWidget.getResolutionWidth());
                    resolutionNode3.setOpposite(resolutionNode, 1, constraintWidget.getResolutionWidth());
                } else {
                    resolutionNode.setOpposite(resolutionNode3, (float) (-constraintWidget.getWidth()));
                    resolutionNode3.setOpposite(resolutionNode, (float) constraintWidget.getWidth());
                }
            }
        }
        Object obj3 = (constraintWidget2.mListDimensionBehaviors[1] == DimensionBehaviour.MATCH_CONSTRAINT && optimizableMatchConstraint(constraintWidget2, 1)) ? 1 : null;
        if (resolutionNode2.type != 4 && resolutionNode4.type != 4) {
            if (constraintWidget2.mListDimensionBehaviors[1] != DimensionBehaviour.FIXED) {
                if (obj3 == null || constraintWidget.getVisibility() != 8) {
                    if (obj3 != null) {
                        int height = constraintWidget.getHeight();
                        resolutionNode2.setType(1);
                        resolutionNode4.setType(1);
                        if (constraintWidget2.mTop.mTarget == null && constraintWidget2.mBottom.mTarget == null) {
                            if (obj != null) {
                                resolutionNode4.dependsOn(resolutionNode2, 1, constraintWidget.getResolutionHeight());
                                return;
                            } else {
                                resolutionNode4.dependsOn(resolutionNode2, height);
                                return;
                            }
                        } else if (constraintWidget2.mTop.mTarget == null || constraintWidget2.mBottom.mTarget != null) {
                            if (constraintWidget2.mTop.mTarget != null || constraintWidget2.mBottom.mTarget == null) {
                                if (constraintWidget2.mTop.mTarget != null && constraintWidget2.mBottom.mTarget != null) {
                                    if (obj != null) {
                                        constraintWidget.getResolutionHeight().addDependent(resolutionNode2);
                                        constraintWidget.getResolutionWidth().addDependent(resolutionNode4);
                                    }
                                    if (constraintWidget2.mDimensionRatio == 0.0f) {
                                        resolutionNode2.setType(3);
                                        resolutionNode4.setType(3);
                                        resolutionNode2.setOpposite(resolutionNode4, 0.0f);
                                        resolutionNode4.setOpposite(resolutionNode2, 0.0f);
                                        return;
                                    }
                                    resolutionNode2.setType(2);
                                    resolutionNode4.setType(2);
                                    resolutionNode2.setOpposite(resolutionNode4, (float) (-height));
                                    resolutionNode4.setOpposite(resolutionNode2, (float) height);
                                    constraintWidget2.setHeight(height);
                                    if (constraintWidget2.mBaselineDistance > 0) {
                                        constraintWidget2.mBaseline.getResolutionNode().dependsOn(1, resolutionNode2, constraintWidget2.mBaselineDistance);
                                        return;
                                    }
                                    return;
                                }
                                return;
                            } else if (obj != null) {
                                resolutionNode2.dependsOn(resolutionNode4, -1, constraintWidget.getResolutionHeight());
                                return;
                            } else {
                                resolutionNode2.dependsOn(resolutionNode4, -height);
                                return;
                            }
                        } else if (obj != null) {
                            resolutionNode4.dependsOn(resolutionNode2, 1, constraintWidget.getResolutionHeight());
                            return;
                        } else {
                            resolutionNode4.dependsOn(resolutionNode2, height);
                            return;
                        }
                    }
                    return;
                }
            }
            if (constraintWidget2.mTop.mTarget == null && constraintWidget2.mBottom.mTarget == null) {
                resolutionNode2.setType(1);
                resolutionNode4.setType(1);
                if (obj != null) {
                    resolutionNode4.dependsOn(resolutionNode2, 1, constraintWidget.getResolutionHeight());
                } else {
                    resolutionNode4.dependsOn(resolutionNode2, constraintWidget.getHeight());
                }
                if (constraintWidget2.mBaseline.mTarget != null) {
                    constraintWidget2.mBaseline.getResolutionNode().setType(1);
                    resolutionNode2.dependsOn(1, constraintWidget2.mBaseline.getResolutionNode(), -constraintWidget2.mBaselineDistance);
                }
            } else if (constraintWidget2.mTop.mTarget != null && constraintWidget2.mBottom.mTarget == null) {
                resolutionNode2.setType(1);
                resolutionNode4.setType(1);
                if (obj != null) {
                    resolutionNode4.dependsOn(resolutionNode2, 1, constraintWidget.getResolutionHeight());
                } else {
                    resolutionNode4.dependsOn(resolutionNode2, constraintWidget.getHeight());
                }
                if (constraintWidget2.mBaselineDistance > 0) {
                    constraintWidget2.mBaseline.getResolutionNode().dependsOn(1, resolutionNode2, constraintWidget2.mBaselineDistance);
                }
            } else if (constraintWidget2.mTop.mTarget == null && constraintWidget2.mBottom.mTarget != null) {
                resolutionNode2.setType(1);
                resolutionNode4.setType(1);
                if (obj != null) {
                    resolutionNode2.dependsOn(resolutionNode4, -1, constraintWidget.getResolutionHeight());
                } else {
                    resolutionNode2.dependsOn(resolutionNode4, -constraintWidget.getHeight());
                }
                if (constraintWidget2.mBaselineDistance > 0) {
                    constraintWidget2.mBaseline.getResolutionNode().dependsOn(1, resolutionNode2, constraintWidget2.mBaselineDistance);
                }
            } else if (constraintWidget2.mTop.mTarget != null && constraintWidget2.mBottom.mTarget != null) {
                resolutionNode2.setType(2);
                resolutionNode4.setType(2);
                if (obj != null) {
                    resolutionNode2.setOpposite(resolutionNode4, -1, constraintWidget.getResolutionHeight());
                    resolutionNode4.setOpposite(resolutionNode2, 1, constraintWidget.getResolutionHeight());
                    constraintWidget.getResolutionHeight().addDependent(resolutionNode2);
                    constraintWidget.getResolutionWidth().addDependent(resolutionNode4);
                } else {
                    resolutionNode2.setOpposite(resolutionNode4, (float) (-constraintWidget.getHeight()));
                    resolutionNode4.setOpposite(resolutionNode2, (float) constraintWidget.getHeight());
                }
                if (constraintWidget2.mBaselineDistance > 0) {
                    constraintWidget2.mBaseline.getResolutionNode().dependsOn(1, resolutionNode2, constraintWidget2.mBaselineDistance);
                }
            }
        }
    }

    static boolean applyChainOptimized(ConstraintWidgetContainer constraintWidgetContainer, LinearSystem linearSystem, int i, int i2, ChainHead chainHead) {
        Object obj;
        Object obj2;
        Object obj3;
        LinearSystem linearSystem2 = linearSystem;
        int i3 = i;
        ChainHead chainHead2 = chainHead;
        ConstraintWidget constraintWidget = chainHead2.mFirst;
        ConstraintWidget constraintWidget2 = chainHead2.mLast;
        ConstraintWidget constraintWidget3 = chainHead2.mFirstVisibleWidget;
        ConstraintWidget constraintWidget4 = chainHead2.mLastVisibleWidget;
        ConstraintWidget constraintWidget5 = chainHead2.mHead;
        float f = chainHead2.mTotalWeight;
        ConstraintWidget constraintWidget6 = chainHead2.mFirstMatchConstraintWidget;
        ConstraintWidget constraintWidget7 = chainHead2.mLastMatchConstraintWidget;
        DimensionBehaviour dimensionBehaviour = constraintWidgetContainer.mListDimensionBehaviors[i3];
        DimensionBehaviour dimensionBehaviour2 = DimensionBehaviour.WRAP_CONTENT;
        if (i3 == 0) {
            obj = constraintWidget5.mHorizontalChainStyle == 0 ? 1 : null;
            obj2 = constraintWidget5.mHorizontalChainStyle == 1 ? 1 : null;
            obj3 = constraintWidget5.mHorizontalChainStyle == 2 ? 1 : null;
        } else {
            obj = constraintWidget5.mVerticalChainStyle == 0 ? 1 : null;
            obj2 = constraintWidget5.mVerticalChainStyle == 1 ? 1 : null;
            obj3 = constraintWidget5.mVerticalChainStyle == 2 ? 1 : null;
        }
        ConstraintWidget constraintWidget8 = constraintWidget;
        int i4 = 0;
        Object obj4 = null;
        int i5 = 0;
        float f2 = 0.0f;
        float f3 = 0.0f;
        while (obj4 == null) {
            ConstraintWidget constraintWidget9;
            if (constraintWidget8.getVisibility() != 8) {
                i5++;
                if (i3 == 0) {
                    f2 += (float) constraintWidget8.getWidth();
                } else {
                    f2 += (float) constraintWidget8.getHeight();
                }
                if (constraintWidget8 != constraintWidget3) {
                    f2 += (float) constraintWidget8.mListAnchors[i2].getMargin();
                }
                if (constraintWidget8 != constraintWidget4) {
                    f2 += (float) constraintWidget8.mListAnchors[i2 + 1].getMargin();
                }
                f3 = (f3 + ((float) constraintWidget8.mListAnchors[i2].getMargin())) + ((float) constraintWidget8.mListAnchors[i2 + 1].getMargin());
            }
            ConstraintAnchor constraintAnchor = constraintWidget8.mListAnchors[i2];
            if (constraintWidget8.getVisibility() != 8 && constraintWidget8.mListDimensionBehaviors[i3] == DimensionBehaviour.MATCH_CONSTRAINT) {
                boolean z;
                i4++;
                if (i3 != 0) {
                    z = false;
                    if (constraintWidget8.mMatchConstraintDefaultHeight == 0 && constraintWidget8.mMatchConstraintMinHeight == 0) {
                        if (constraintWidget8.mMatchConstraintMaxHeight != 0) {
                        }
                    }
                    return false;
                } else if (constraintWidget8.mMatchConstraintDefaultWidth != 0) {
                    return false;
                } else {
                    z = false;
                    if (!(constraintWidget8.mMatchConstraintMinWidth == 0 && constraintWidget8.mMatchConstraintMaxWidth == 0)) {
                        return false;
                    }
                }
                if (constraintWidget8.mDimensionRatio != 0.0f) {
                    return z;
                }
            }
            ConstraintAnchor constraintAnchor2 = constraintWidget8.mListAnchors[i2 + 1].mTarget;
            if (constraintAnchor2 != null) {
                constraintWidget5 = constraintAnchor2.mOwner;
                if (constraintWidget5.mListAnchors[i2].mTarget != null) {
                    if (constraintWidget5.mListAnchors[i2].mTarget.mOwner == constraintWidget8) {
                        constraintWidget9 = constraintWidget5;
                    }
                }
                constraintWidget9 = null;
            } else {
                constraintWidget9 = null;
            }
            if (constraintWidget9 != null) {
                constraintWidget8 = constraintWidget9;
            } else {
                obj4 = 1;
            }
        }
        ResolutionAnchor resolutionNode = constraintWidget.mListAnchors[i2].getResolutionNode();
        int i6 = i2 + 1;
        ResolutionAnchor resolutionNode2 = constraintWidget2.mListAnchors[i6].getResolutionNode();
        if (resolutionNode.target != null) {
            if (resolutionNode2.target != null) {
                ConstraintWidget constraintWidget10 = constraintWidget;
                if (resolutionNode.target.state == 1) {
                    if (resolutionNode2.target.state == 1) {
                        if (i4 > 0 && i4 != i5) {
                            return false;
                        }
                        float f4;
                        float f5;
                        float f6;
                        Metrics metrics;
                        boolean z2;
                        Metrics metrics2;
                        if (obj3 == null && r11 == null) {
                            if (obj2 == null) {
                                f4 = 0.0f;
                                f5 = resolutionNode.target.resolvedOffset;
                                f6 = resolutionNode2.target.resolvedOffset;
                                f6 = f5 >= f6 ? (f6 - f5) - f2 : (f5 - f6) - f2;
                                if (i4 > 0 || i4 != i5) {
                                    if (f6 < 0.0f) {
                                        obj3 = 1;
                                        obj = null;
                                        obj2 = null;
                                    }
                                    if (obj3 == null) {
                                        constraintWidget7 = constraintWidget10;
                                        f5 += (f6 - f4) * constraintWidget7.getBiasPercent(i3);
                                        while (constraintWidget7 != null) {
                                            if (LinearSystem.sMetrics != null) {
                                                metrics = LinearSystem.sMetrics;
                                                metrics.nonresolvedWidgets--;
                                                metrics = LinearSystem.sMetrics;
                                                metrics.resolvedWidgets++;
                                                metrics = LinearSystem.sMetrics;
                                                metrics.chainConnectionResolved++;
                                            }
                                            constraintWidget3 = constraintWidget7.mNextChainWidget[i3];
                                            if (constraintWidget3 == null || constraintWidget7 == constraintWidget2) {
                                                if (i3 != 0) {
                                                    f6 = (float) constraintWidget7.getWidth();
                                                } else {
                                                    f6 = (float) constraintWidget7.getHeight();
                                                }
                                                f5 += (float) constraintWidget7.mListAnchors[i2].getMargin();
                                                constraintWidget7.mListAnchors[i2].getResolutionNode().resolve(resolutionNode.resolvedTarget, f5);
                                                f5 += f6;
                                                constraintWidget7.mListAnchors[i6].getResolutionNode().resolve(resolutionNode.resolvedTarget, f5);
                                                constraintWidget7.mListAnchors[i2].getResolutionNode().addResolvedValue(linearSystem2);
                                                constraintWidget7.mListAnchors[i6].getResolutionNode().addResolvedValue(linearSystem2);
                                                f5 += (float) constraintWidget7.mListAnchors[i6].getMargin();
                                            }
                                            constraintWidget7 = constraintWidget3;
                                        }
                                        z2 = true;
                                    } else {
                                        constraintWidget7 = constraintWidget10;
                                        if (obj == null) {
                                            if (obj2 != null) {
                                                z2 = true;
                                            }
                                        }
                                        if (obj != null) {
                                            f6 -= f4;
                                        } else if (obj2 != null) {
                                            f6 -= f4;
                                        }
                                        f4 = f6 / ((float) (i5 + 1));
                                        if (obj2 != null) {
                                            f4 = i5 <= 1 ? f6 / ((float) (i5 - 1)) : f6 / 2.0f;
                                        }
                                        f6 = constraintWidget7.getVisibility() == 8 ? f5 + f4 : f5;
                                        if (obj2 != null && i5 > 1) {
                                            f6 = ((float) constraintWidget3.mListAnchors[i2].getMargin()) + f5;
                                        }
                                        if (!(obj == null || constraintWidget3 == null)) {
                                            f6 += (float) constraintWidget3.mListAnchors[i2].getMargin();
                                        }
                                        while (constraintWidget7 != null) {
                                            if (LinearSystem.sMetrics != null) {
                                                metrics2 = LinearSystem.sMetrics;
                                                metrics2.nonresolvedWidgets--;
                                                metrics2 = LinearSystem.sMetrics;
                                                metrics2.resolvedWidgets++;
                                                metrics2 = LinearSystem.sMetrics;
                                                metrics2.chainConnectionResolved++;
                                            }
                                            constraintWidget = constraintWidget7.mNextChainWidget[i3];
                                            if (constraintWidget == null) {
                                                if (constraintWidget7 == constraintWidget2) {
                                                    constraintWidget7 = constraintWidget;
                                                }
                                            }
                                            if (i3 != 0) {
                                                f = (float) constraintWidget7.getWidth();
                                            } else {
                                                f = (float) constraintWidget7.getHeight();
                                            }
                                            if (constraintWidget7 != constraintWidget3) {
                                                f6 += (float) constraintWidget7.mListAnchors[i2].getMargin();
                                            }
                                            constraintWidget7.mListAnchors[i2].getResolutionNode().resolve(resolutionNode.resolvedTarget, f6);
                                            constraintWidget7.mListAnchors[i6].getResolutionNode().resolve(resolutionNode.resolvedTarget, f6 + f);
                                            constraintWidget7.mListAnchors[i2].getResolutionNode().addResolvedValue(linearSystem2);
                                            constraintWidget7.mListAnchors[i6].getResolutionNode().addResolvedValue(linearSystem2);
                                            f6 += f + ((float) constraintWidget7.mListAnchors[i6].getMargin());
                                            if (constraintWidget != null) {
                                                if (constraintWidget.getVisibility() != 8) {
                                                    f6 += f4;
                                                }
                                            }
                                            constraintWidget7 = constraintWidget;
                                        }
                                        z2 = true;
                                    }
                                    return z2;
                                } else if (constraintWidget8.getParent() != null && constraintWidget8.getParent().mListDimensionBehaviors[i3] == DimensionBehaviour.WRAP_CONTENT) {
                                    return false;
                                } else {
                                    f6 = (f6 + f2) - f3;
                                    constraintWidget7 = constraintWidget10;
                                    while (constraintWidget7 != null) {
                                        if (LinearSystem.sMetrics != null) {
                                            metrics = LinearSystem.sMetrics;
                                            metrics.nonresolvedWidgets--;
                                            metrics = LinearSystem.sMetrics;
                                            metrics.resolvedWidgets++;
                                            metrics = LinearSystem.sMetrics;
                                            metrics.chainConnectionResolved++;
                                        }
                                        constraintWidget3 = constraintWidget7.mNextChainWidget[i3];
                                        if (constraintWidget3 != null || constraintWidget7 == constraintWidget2) {
                                            f4 = f6 / ((float) i4);
                                            if (f > 0.0f) {
                                                if (constraintWidget7.mWeight[i3] == -1.0f) {
                                                    f4 = 0.0f;
                                                } else {
                                                    f4 = (constraintWidget7.mWeight[i3] * f6) / f;
                                                }
                                            }
                                            if (constraintWidget7.getVisibility() == 8) {
                                                f4 = 0.0f;
                                            }
                                            f5 += (float) constraintWidget7.mListAnchors[i2].getMargin();
                                            constraintWidget7.mListAnchors[i2].getResolutionNode().resolve(resolutionNode.resolvedTarget, f5);
                                            f5 += f4;
                                            constraintWidget7.mListAnchors[i6].getResolutionNode().resolve(resolutionNode.resolvedTarget, f5);
                                            constraintWidget7.mListAnchors[i2].getResolutionNode().addResolvedValue(linearSystem2);
                                            constraintWidget7.mListAnchors[i6].getResolutionNode().addResolvedValue(linearSystem2);
                                            f5 += (float) constraintWidget7.mListAnchors[i6].getMargin();
                                        }
                                        constraintWidget7 = constraintWidget3;
                                    }
                                    return true;
                                }
                            }
                        }
                        f4 = constraintWidget3 != null ? (float) constraintWidget3.mListAnchors[i2].getMargin() : 0.0f;
                        if (constraintWidget4 != null) {
                            f4 += (float) constraintWidget4.mListAnchors[i6].getMargin();
                        }
                        f5 = resolutionNode.target.resolvedOffset;
                        f6 = resolutionNode2.target.resolvedOffset;
                        if (f5 >= f6) {
                        }
                        if (i4 > 0) {
                        }
                        if (f6 < 0.0f) {
                            obj3 = 1;
                            obj = null;
                            obj2 = null;
                        }
                        if (obj3 == null) {
                            constraintWidget7 = constraintWidget10;
                            if (obj == null) {
                                if (obj2 != null) {
                                    z2 = true;
                                }
                            }
                            if (obj != null) {
                                f6 -= f4;
                            } else if (obj2 != null) {
                                f6 -= f4;
                            }
                            f4 = f6 / ((float) (i5 + 1));
                            if (obj2 != null) {
                                if (i5 <= 1) {
                                }
                            }
                            if (constraintWidget7.getVisibility() == 8) {
                            }
                            f6 = ((float) constraintWidget3.mListAnchors[i2].getMargin()) + f5;
                            f6 += (float) constraintWidget3.mListAnchors[i2].getMargin();
                            while (constraintWidget7 != null) {
                                if (LinearSystem.sMetrics != null) {
                                    metrics2 = LinearSystem.sMetrics;
                                    metrics2.nonresolvedWidgets--;
                                    metrics2 = LinearSystem.sMetrics;
                                    metrics2.resolvedWidgets++;
                                    metrics2 = LinearSystem.sMetrics;
                                    metrics2.chainConnectionResolved++;
                                }
                                constraintWidget = constraintWidget7.mNextChainWidget[i3];
                                if (constraintWidget == null) {
                                    if (constraintWidget7 == constraintWidget2) {
                                        constraintWidget7 = constraintWidget;
                                    }
                                }
                                if (i3 != 0) {
                                    f = (float) constraintWidget7.getHeight();
                                } else {
                                    f = (float) constraintWidget7.getWidth();
                                }
                                if (constraintWidget7 != constraintWidget3) {
                                    f6 += (float) constraintWidget7.mListAnchors[i2].getMargin();
                                }
                                constraintWidget7.mListAnchors[i2].getResolutionNode().resolve(resolutionNode.resolvedTarget, f6);
                                constraintWidget7.mListAnchors[i6].getResolutionNode().resolve(resolutionNode.resolvedTarget, f6 + f);
                                constraintWidget7.mListAnchors[i2].getResolutionNode().addResolvedValue(linearSystem2);
                                constraintWidget7.mListAnchors[i6].getResolutionNode().addResolvedValue(linearSystem2);
                                f6 += f + ((float) constraintWidget7.mListAnchors[i6].getMargin());
                                if (constraintWidget != null) {
                                    if (constraintWidget.getVisibility() != 8) {
                                        f6 += f4;
                                    }
                                }
                                constraintWidget7 = constraintWidget;
                            }
                            z2 = true;
                        } else {
                            constraintWidget7 = constraintWidget10;
                            f5 += (f6 - f4) * constraintWidget7.getBiasPercent(i3);
                            while (constraintWidget7 != null) {
                                if (LinearSystem.sMetrics != null) {
                                    metrics = LinearSystem.sMetrics;
                                    metrics.nonresolvedWidgets--;
                                    metrics = LinearSystem.sMetrics;
                                    metrics.resolvedWidgets++;
                                    metrics = LinearSystem.sMetrics;
                                    metrics.chainConnectionResolved++;
                                }
                                constraintWidget3 = constraintWidget7.mNextChainWidget[i3];
                                if (constraintWidget3 == null) {
                                }
                                if (i3 != 0) {
                                    f6 = (float) constraintWidget7.getHeight();
                                } else {
                                    f6 = (float) constraintWidget7.getWidth();
                                }
                                f5 += (float) constraintWidget7.mListAnchors[i2].getMargin();
                                constraintWidget7.mListAnchors[i2].getResolutionNode().resolve(resolutionNode.resolvedTarget, f5);
                                f5 += f6;
                                constraintWidget7.mListAnchors[i6].getResolutionNode().resolve(resolutionNode.resolvedTarget, f5);
                                constraintWidget7.mListAnchors[i2].getResolutionNode().addResolvedValue(linearSystem2);
                                constraintWidget7.mListAnchors[i6].getResolutionNode().addResolvedValue(linearSystem2);
                                f5 += (float) constraintWidget7.mListAnchors[i6].getMargin();
                                constraintWidget7 = constraintWidget3;
                            }
                            z2 = true;
                        }
                        return z2;
                    }
                }
                return false;
            }
        }
        return false;
    }

    static void setOptimizedWidget(ConstraintWidget constraintWidget, int i, int i2) {
        int i3 = i * 2;
        int i4 = i3 + 1;
        constraintWidget.mListAnchors[i3].getResolutionNode().resolvedTarget = constraintWidget.getParent().mLeft.getResolutionNode();
        constraintWidget.mListAnchors[i3].getResolutionNode().resolvedOffset = (float) i2;
        constraintWidget.mListAnchors[i3].getResolutionNode().state = 1;
        constraintWidget.mListAnchors[i4].getResolutionNode().resolvedTarget = constraintWidget.mListAnchors[i3].getResolutionNode();
        constraintWidget.mListAnchors[i4].getResolutionNode().resolvedOffset = (float) constraintWidget.getLength(i);
        constraintWidget.mListAnchors[i4].getResolutionNode().state = 1;
    }
}
