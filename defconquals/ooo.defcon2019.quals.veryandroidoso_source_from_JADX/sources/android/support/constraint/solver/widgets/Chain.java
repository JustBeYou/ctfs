package android.support.constraint.solver.widgets;

import android.support.constraint.solver.ArrayRow;
import android.support.constraint.solver.LinearSystem;
import android.support.constraint.solver.SolverVariable;
import android.support.constraint.solver.widgets.ConstraintWidget.DimensionBehaviour;
import java.util.ArrayList;

class Chain {
    private static final boolean DEBUG = false;

    Chain() {
    }

    static void applyChainConstraints(ConstraintWidgetContainer constraintWidgetContainer, LinearSystem linearSystem, int i) {
        int i2;
        ChainHead[] chainHeadArr;
        int i3;
        int i4 = 0;
        if (i == 0) {
            i2 = constraintWidgetContainer.mHorizontalChainsSize;
            chainHeadArr = constraintWidgetContainer.mHorizontalChainsArray;
            i3 = i2;
            i2 = 0;
        } else {
            i2 = 2;
            int i5 = constraintWidgetContainer.mVerticalChainsSize;
            i3 = i5;
            chainHeadArr = constraintWidgetContainer.mVerticalChainsArray;
        }
        while (i4 < i3) {
            ChainHead chainHead = chainHeadArr[i4];
            chainHead.define();
            if (!constraintWidgetContainer.optimizeFor(4)) {
                applyChainConstraints(constraintWidgetContainer, linearSystem, i, i2, chainHead);
            } else if (!Optimizer.applyChainOptimized(constraintWidgetContainer, linearSystem, i, i2, chainHead)) {
                applyChainConstraints(constraintWidgetContainer, linearSystem, i, i2, chainHead);
            }
            i4++;
        }
    }

    static void applyChainConstraints(ConstraintWidgetContainer constraintWidgetContainer, LinearSystem linearSystem, int i, int i2, ChainHead chainHead) {
        Object obj;
        ConstraintWidget constraintWidget;
        Object obj2;
        Object obj3;
        Object obj4;
        float f;
        int i3;
        Object obj5;
        ConstraintWidget constraintWidget2;
        ConstraintAnchor constraintAnchor;
        int i4;
        ArrayList arrayList;
        float f2;
        float f3;
        int i5;
        float f4;
        ConstraintWidget constraintWidget3;
        float f5;
        ArrayList arrayList2;
        int i6;
        SolverVariable solverVariable;
        SolverVariable solverVariable2;
        SolverVariable solverVariable3;
        ConstraintAnchor constraintAnchor2;
        ConstraintAnchor constraintAnchor3;
        SolverVariable solverVariable4;
        int i7;
        Object obj6;
        ConstraintWidget constraintWidget4;
        ConstraintWidget constraintWidget5;
        ConstraintWidget constraintWidget6;
        int i8;
        ConstraintAnchor constraintAnchor4;
        ConstraintAnchor constraintAnchor5;
        SolverVariable solverVariable5;
        ConstraintWidgetContainer constraintWidgetContainer2 = constraintWidgetContainer;
        LinearSystem linearSystem2 = linearSystem;
        ChainHead chainHead2 = chainHead;
        ConstraintWidget constraintWidget7 = chainHead2.mFirst;
        ConstraintWidget constraintWidget8 = chainHead2.mLast;
        ConstraintWidget constraintWidget9 = chainHead2.mFirstVisibleWidget;
        ConstraintWidget constraintWidget10 = chainHead2.mLastVisibleWidget;
        ConstraintWidget constraintWidget11 = chainHead2.mHead;
        float f6 = chainHead2.mTotalWeight;
        ConstraintWidget constraintWidget12 = chainHead2.mFirstMatchConstraintWidget;
        constraintWidget12 = chainHead2.mLastMatchConstraintWidget;
        Object obj7 = constraintWidgetContainer2.mListDimensionBehaviors[i] == DimensionBehaviour.WRAP_CONTENT ? 1 : null;
        if (i == 0) {
            obj = constraintWidget11.mHorizontalChainStyle == 0 ? 1 : null;
            constraintWidget = constraintWidget7;
            obj2 = constraintWidget11.mHorizontalChainStyle == 1 ? 1 : null;
            obj3 = constraintWidget11.mHorizontalChainStyle == 2 ? 1 : null;
            obj4 = null;
        } else {
            obj = constraintWidget11.mVerticalChainStyle == 0 ? 1 : null;
            constraintWidget = constraintWidget7;
            obj2 = constraintWidget11.mVerticalChainStyle == 1 ? 1 : null;
            obj3 = constraintWidget11.mVerticalChainStyle == 2 ? 1 : null;
            obj4 = null;
        }
        while (true) {
            ConstraintWidget constraintWidget13 = null;
            if (obj4 != null) {
                break;
            }
            int i9;
            int margin;
            int margin2;
            Object obj8;
            int i10;
            ConstraintAnchor constraintAnchor6 = constraintWidget.mListAnchors[i2];
            if (obj7 == null) {
                if (obj3 == null) {
                    i9 = 4;
                    margin = constraintAnchor6.getMargin();
                    margin2 = (constraintAnchor6.mTarget != null || constraintWidget == constraintWidget7) ? margin : margin + constraintAnchor6.mTarget.getMargin();
                    if (obj3 == null && constraintWidget != constraintWidget7 && constraintWidget != constraintWidget9) {
                        f = f6;
                        obj8 = obj4;
                        i3 = 6;
                    } else if (obj != null || obj7 == null) {
                        f = f6;
                        i3 = i9;
                        obj8 = obj4;
                    } else {
                        f = f6;
                        obj8 = obj4;
                        i3 = 4;
                    }
                    if (constraintAnchor6.mTarget == null) {
                        if (constraintWidget != constraintWidget9) {
                            obj5 = obj;
                            constraintWidget2 = constraintWidget11;
                            linearSystem2.addGreaterThan(constraintAnchor6.mSolverVariable, constraintAnchor6.mTarget.mSolverVariable, margin2, 5);
                        } else {
                            constraintWidget2 = constraintWidget11;
                            obj5 = obj;
                            linearSystem2.addGreaterThan(constraintAnchor6.mSolverVariable, constraintAnchor6.mTarget.mSolverVariable, margin2, 6);
                        }
                        linearSystem2.addEquality(constraintAnchor6.mSolverVariable, constraintAnchor6.mTarget.mSolverVariable, margin2, i3);
                    } else {
                        constraintWidget2 = constraintWidget11;
                        obj5 = obj;
                    }
                    if (obj7 != null) {
                        if (constraintWidget.getVisibility() == 8 && constraintWidget.mListDimensionBehaviors[i] == DimensionBehaviour.MATCH_CONSTRAINT) {
                            i10 = 0;
                            linearSystem2.addGreaterThan(constraintWidget.mListAnchors[i2 + 1].mSolverVariable, constraintWidget.mListAnchors[i2].mSolverVariable, 0, 5);
                        } else {
                            i10 = 0;
                        }
                        linearSystem2.addGreaterThan(constraintWidget.mListAnchors[i2].mSolverVariable, constraintWidgetContainer2.mListAnchors[i2].mSolverVariable, i10, 6);
                    }
                    constraintAnchor = constraintWidget.mListAnchors[i2 + 1].mTarget;
                    if (constraintAnchor != null) {
                        constraintWidget11 = constraintAnchor.mOwner;
                        if (constraintWidget11.mListAnchors[i2].mTarget != null) {
                            if (constraintWidget11.mListAnchors[i2].mTarget.mOwner != constraintWidget) {
                                constraintWidget13 = constraintWidget11;
                            }
                        }
                    }
                    if (constraintWidget13 == null) {
                        constraintWidget = constraintWidget13;
                        obj4 = obj8;
                    } else {
                        obj4 = 1;
                    }
                    f6 = f;
                    obj = obj5;
                    constraintWidget11 = constraintWidget2;
                }
            }
            i9 = 1;
            margin = constraintAnchor6.getMargin();
            if (constraintAnchor6.mTarget != null) {
            }
            if (obj3 == null) {
            }
            if (obj != null) {
            }
            f = f6;
            i3 = i9;
            obj8 = obj4;
            if (constraintAnchor6.mTarget == null) {
                constraintWidget2 = constraintWidget11;
                obj5 = obj;
            } else {
                if (constraintWidget != constraintWidget9) {
                    constraintWidget2 = constraintWidget11;
                    obj5 = obj;
                    linearSystem2.addGreaterThan(constraintAnchor6.mSolverVariable, constraintAnchor6.mTarget.mSolverVariable, margin2, 6);
                } else {
                    obj5 = obj;
                    constraintWidget2 = constraintWidget11;
                    linearSystem2.addGreaterThan(constraintAnchor6.mSolverVariable, constraintAnchor6.mTarget.mSolverVariable, margin2, 5);
                }
                linearSystem2.addEquality(constraintAnchor6.mSolverVariable, constraintAnchor6.mTarget.mSolverVariable, margin2, i3);
            }
            if (obj7 != null) {
                if (constraintWidget.getVisibility() == 8) {
                }
                i10 = 0;
                linearSystem2.addGreaterThan(constraintWidget.mListAnchors[i2].mSolverVariable, constraintWidgetContainer2.mListAnchors[i2].mSolverVariable, i10, 6);
            }
            constraintAnchor = constraintWidget.mListAnchors[i2 + 1].mTarget;
            if (constraintAnchor != null) {
                constraintWidget11 = constraintAnchor.mOwner;
                if (constraintWidget11.mListAnchors[i2].mTarget != null) {
                    if (constraintWidget11.mListAnchors[i2].mTarget.mOwner != constraintWidget) {
                        constraintWidget13 = constraintWidget11;
                    }
                }
            }
            if (constraintWidget13 == null) {
                obj4 = 1;
            } else {
                constraintWidget = constraintWidget13;
                obj4 = obj8;
            }
            f6 = f;
            obj = obj5;
            constraintWidget11 = constraintWidget2;
        }
        constraintWidget2 = constraintWidget11;
        f = f6;
        obj5 = obj;
        if (constraintWidget10 != null) {
            i3 = i2 + 1;
            if (constraintWidget8.mListAnchors[i3].mTarget != null) {
                constraintAnchor = constraintWidget10.mListAnchors[i3];
                linearSystem2.addLowerThan(constraintAnchor.mSolverVariable, constraintWidget8.mListAnchors[i3].mTarget.mSolverVariable, -constraintAnchor.getMargin(), 5);
                if (obj7 != null) {
                    i4 = i2 + 1;
                    linearSystem2.addGreaterThan(constraintWidgetContainer2.mListAnchors[i4].mSolverVariable, constraintWidget8.mListAnchors[i4].mSolverVariable, constraintWidget8.mListAnchors[i4].getMargin(), 6);
                }
                arrayList = chainHead2.mWeightedMatchConstraintsWidgets;
                if (arrayList != null) {
                    i4 = arrayList.size();
                    if (i4 > 1) {
                        f2 = (chainHead2.mHasUndefinedWeights || chainHead2.mHasComplexMatchWeights) ? f : (float) chainHead2.mWidgetsMatchCount;
                        f3 = 0.0f;
                        constraintWidget = null;
                        i5 = 0;
                        f4 = 0.0f;
                        while (i5 < i4) {
                            constraintWidget3 = (ConstraintWidget) arrayList.get(i5);
                            f6 = constraintWidget3.mWeight[i];
                            if (f6 < f3) {
                                f5 = 0.0f;
                            } else if (chainHead2.mHasComplexMatchWeights) {
                                f6 = 1.0f;
                                f5 = 0.0f;
                            } else {
                                linearSystem2.addEquality(constraintWidget3.mListAnchors[i2 + 1].mSolverVariable, constraintWidget3.mListAnchors[i2].mSolverVariable, 0, 4);
                                arrayList2 = arrayList;
                                i6 = i4;
                                i5++;
                                i4 = i6;
                                arrayList = arrayList2;
                                f3 = 0.0f;
                            }
                            if (f6 != f5) {
                                linearSystem2.addEquality(constraintWidget3.mListAnchors[i2 + 1].mSolverVariable, constraintWidget3.mListAnchors[i2].mSolverVariable, 0, 6);
                                arrayList2 = arrayList;
                                i6 = i4;
                                i5++;
                                i4 = i6;
                                arrayList = arrayList2;
                                f3 = 0.0f;
                            } else {
                                if (constraintWidget == null) {
                                    solverVariable = constraintWidget.mListAnchors[i2].mSolverVariable;
                                    i6 = i2 + 1;
                                    solverVariable2 = constraintWidget.mListAnchors[i6].mSolverVariable;
                                    solverVariable3 = constraintWidget3.mListAnchors[i2].mSolverVariable;
                                    arrayList2 = arrayList;
                                    SolverVariable solverVariable6 = constraintWidget3.mListAnchors[i6].mSolverVariable;
                                    i6 = i4;
                                    ArrayRow createRow = linearSystem.createRow();
                                    createRow.createRowEqualMatchDimensions(f4, f2, f6, solverVariable, solverVariable2, solverVariable3, solverVariable6);
                                    linearSystem2.addConstraint(createRow);
                                } else {
                                    arrayList2 = arrayList;
                                    i6 = i4;
                                }
                                f4 = f6;
                                constraintWidget = constraintWidget3;
                                i5++;
                                i4 = i6;
                                arrayList = arrayList2;
                                f3 = 0.0f;
                            }
                        }
                    }
                }
                if (constraintWidget9 == null && (constraintWidget9 == constraintWidget10 || obj3 != null)) {
                    constraintAnchor2 = constraintWidget7.mListAnchors[i2];
                    i4 = i2 + 1;
                    constraintAnchor3 = constraintWidget8.mListAnchors[i4];
                    solverVariable4 = constraintWidget7.mListAnchors[i2].mTarget != null ? constraintWidget7.mListAnchors[i2].mTarget.mSolverVariable : null;
                    solverVariable = constraintWidget8.mListAnchors[i4].mTarget != null ? constraintWidget8.mListAnchors[i4].mTarget.mSolverVariable : null;
                    if (constraintWidget9 == constraintWidget10) {
                        constraintAnchor2 = constraintWidget9.mListAnchors[i2];
                        constraintAnchor3 = constraintWidget9.mListAnchors[i4];
                    }
                    if (!(solverVariable4 == null || solverVariable == null)) {
                        if (i == 0) {
                            f2 = constraintWidget2.mHorizontalBiasPercent;
                        } else {
                            f2 = constraintWidget2.mVerticalBiasPercent;
                        }
                        linearSystem.addCentering(constraintAnchor2.mSolverVariable, solverVariable4, constraintAnchor2.getMargin(), f2, solverVariable, constraintAnchor3.mSolverVariable, constraintAnchor3.getMargin(), 5);
                    }
                } else if (obj5 != null || constraintWidget9 == null) {
                    i7 = 8;
                    if (!(obj2 == null || constraintWidget9 == null)) {
                        obj6 = (chainHead2.mWidgetsMatchCount > 0 || chainHead2.mWidgetsCount != chainHead2.mWidgetsMatchCount) ? null : 1;
                        constraintWidget4 = constraintWidget9;
                        constraintWidget3 = constraintWidget4;
                        while (constraintWidget4 != null) {
                            constraintWidget5 = constraintWidget4.mNextChainWidget[i];
                            while (constraintWidget5 != null && constraintWidget5.getVisibility() == r8) {
                                constraintWidget5 = constraintWidget5.mNextChainWidget[i];
                            }
                            if (constraintWidget4 != constraintWidget9 || constraintWidget4 == constraintWidget10 || constraintWidget5 == null) {
                                constraintWidget6 = constraintWidget3;
                                i8 = 8;
                            } else {
                                ConstraintWidget constraintWidget14;
                                ConstraintWidget constraintWidget15 = constraintWidget5 == constraintWidget10 ? null : constraintWidget5;
                                constraintAnchor2 = constraintWidget4.mListAnchors[i2];
                                r1 = constraintAnchor2.mSolverVariable;
                                if (constraintAnchor2.mTarget != null) {
                                    r2 = constraintAnchor2.mTarget.mSolverVariable;
                                }
                                i3 = i2 + 1;
                                r2 = constraintWidget3.mListAnchors[i3].mSolverVariable;
                                r0 = constraintAnchor2.getMargin();
                                r4 = constraintWidget4.mListAnchors[i3].getMargin();
                                if (constraintWidget15 != null) {
                                    r5 = constraintWidget15.mListAnchors[i2];
                                    solverVariable3 = r5.mSolverVariable;
                                    solverVariable2 = r5.mTarget != null ? r5.mTarget.mSolverVariable : null;
                                } else {
                                    r5 = constraintWidget4.mListAnchors[i3].mTarget;
                                    solverVariable3 = r5 != null ? r5.mSolverVariable : null;
                                    solverVariable2 = constraintWidget4.mListAnchors[i3].mSolverVariable;
                                }
                                r18 = r5 != null ? r4 + r5.getMargin() : r4;
                                i3 = constraintWidget3 != null ? r0 + constraintWidget3.mListAnchors[i3].getMargin() : r0;
                                i6 = obj6 != null ? 6 : 4;
                                if (r1 == null || r2 == null || solverVariable3 == null || solverVariable2 == null) {
                                    constraintWidget14 = constraintWidget15;
                                    constraintWidget6 = constraintWidget3;
                                    i8 = 8;
                                } else {
                                    constraintWidget14 = constraintWidget15;
                                    i5 = r18;
                                    constraintWidget6 = constraintWidget3;
                                    i8 = 8;
                                    linearSystem.addCentering(r1, r2, i3, 0.5f, solverVariable3, solverVariable2, i5, i6);
                                }
                                constraintWidget5 = constraintWidget14;
                            }
                            if (constraintWidget4.getVisibility() != i8) {
                                constraintWidget4 = constraintWidget6;
                            }
                            constraintWidget3 = constraintWidget4;
                            i7 = 8;
                            constraintWidget4 = constraintWidget5;
                        }
                        constraintAnchor2 = constraintWidget9.mListAnchors[i2];
                        constraintAnchor3 = constraintWidget7.mListAnchors[i2].mTarget;
                        i3 = i2 + 1;
                        constraintAnchor4 = constraintWidget10.mListAnchors[i3];
                        constraintAnchor5 = constraintWidget8.mListAnchors[i3].mTarget;
                        if (constraintAnchor3 != null) {
                            i8 = 5;
                        } else if (constraintWidget9 == constraintWidget10) {
                            i8 = 5;
                            linearSystem2.addEquality(constraintAnchor2.mSolverVariable, constraintAnchor3.mSolverVariable, constraintAnchor2.getMargin(), 5);
                        } else {
                            i8 = 5;
                            if (constraintAnchor5 != null) {
                                linearSystem.addCentering(constraintAnchor2.mSolverVariable, constraintAnchor3.mSolverVariable, constraintAnchor2.getMargin(), 0.5f, constraintAnchor4.mSolverVariable, constraintAnchor5.mSolverVariable, constraintAnchor4.getMargin(), 5);
                            }
                        }
                        if (!(constraintAnchor5 == null || constraintWidget9 == constraintWidget10)) {
                            linearSystem2.addEquality(constraintAnchor4.mSolverVariable, constraintAnchor5.mSolverVariable, -constraintAnchor4.getMargin(), i8);
                        }
                    }
                } else {
                    obj6 = (chainHead2.mWidgetsMatchCount <= 0 || chainHead2.mWidgetsCount != chainHead2.mWidgetsMatchCount) ? null : 1;
                    constraintWidget4 = constraintWidget9;
                    constraintWidget3 = constraintWidget4;
                    while (constraintWidget4 != null) {
                        SolverVariable solverVariable7;
                        constraintWidget = constraintWidget4.mNextChainWidget[i];
                        while (constraintWidget != null) {
                            if (constraintWidget.getVisibility() != 8) {
                                break;
                            }
                            constraintWidget = constraintWidget.mNextChainWidget[i];
                        }
                        if (constraintWidget == null) {
                            if (constraintWidget4 != constraintWidget10) {
                                constraintWidget6 = constraintWidget;
                                if (constraintWidget4.getVisibility() == 8) {
                                    constraintWidget3 = constraintWidget4;
                                }
                                constraintWidget4 = constraintWidget6;
                            }
                        }
                        constraintAnchor2 = constraintWidget4.mListAnchors[i2];
                        r1 = constraintAnchor2.mSolverVariable;
                        r2 = constraintAnchor2.mTarget != null ? constraintAnchor2.mTarget.mSolverVariable : null;
                        if (constraintWidget3 != constraintWidget4) {
                            r2 = constraintWidget3.mListAnchors[i2 + 1].mSolverVariable;
                        } else if (constraintWidget4 == constraintWidget9 && constraintWidget3 == constraintWidget4) {
                            r2 = constraintWidget7.mListAnchors[i2].mTarget != null ? constraintWidget7.mListAnchors[i2].mTarget.mSolverVariable : null;
                        }
                        r0 = constraintAnchor2.getMargin();
                        r4 = i2 + 1;
                        i3 = constraintWidget4.mListAnchors[r4].getMargin();
                        if (constraintWidget != null) {
                            r5 = constraintWidget.mListAnchors[i2];
                            solverVariable3 = r5.mSolverVariable;
                            solverVariable7 = constraintWidget4.mListAnchors[r4].mSolverVariable;
                        } else {
                            r5 = constraintWidget8.mListAnchors[r4].mTarget;
                            solverVariable3 = r5 != null ? r5.mSolverVariable : null;
                            solverVariable7 = constraintWidget4.mListAnchors[r4].mSolverVariable;
                        }
                        if (r5 != null) {
                            i3 += r5.getMargin();
                        }
                        if (constraintWidget3 != null) {
                            r0 += constraintWidget3.mListAnchors[r4].getMargin();
                        }
                        if (r1 == null || r2 == null || solverVariable3 == null || solverVariable7 == null) {
                            constraintWidget6 = constraintWidget;
                            if (constraintWidget4.getVisibility() == 8) {
                                constraintWidget3 = constraintWidget4;
                            }
                            constraintWidget4 = constraintWidget6;
                        } else {
                            i10 = constraintWidget4 == constraintWidget9 ? constraintWidget9.mListAnchors[i2].getMargin() : r0;
                            r18 = constraintWidget4 == constraintWidget10 ? constraintWidget10.mListAnchors[r4].getMargin() : i3;
                            i3 = i10;
                            solverVariable = solverVariable3;
                            solverVariable3 = solverVariable7;
                            i5 = r18;
                            constraintWidget6 = constraintWidget;
                            linearSystem.addCentering(r1, r2, i3, 0.5f, solverVariable, solverVariable3, i5, obj6 != null ? 6 : 4);
                            if (constraintWidget4.getVisibility() == 8) {
                                constraintWidget3 = constraintWidget4;
                            }
                            constraintWidget4 = constraintWidget6;
                        }
                    }
                }
                if ((obj5 == null || obj2 != null) && constraintWidget9 != null) {
                    constraintAnchor2 = constraintWidget9.mListAnchors[i2];
                    i4 = i2 + 1;
                    constraintAnchor3 = constraintWidget10.mListAnchors[i4];
                    solverVariable4 = constraintAnchor2.mTarget == null ? constraintAnchor2.mTarget.mSolverVariable : null;
                    solverVariable5 = constraintAnchor3.mTarget == null ? constraintAnchor3.mTarget.mSolverVariable : null;
                    if (constraintWidget8 == constraintWidget10) {
                        ConstraintAnchor constraintAnchor7 = constraintWidget8.mListAnchors[i4];
                        solverVariable = constraintAnchor7.mTarget == null ? constraintAnchor7.mTarget.mSolverVariable : null;
                    } else {
                        solverVariable = solverVariable5;
                    }
                    if (constraintWidget9 == constraintWidget10) {
                        constraintAnchor2 = constraintWidget9.mListAnchors[i2];
                        constraintAnchor3 = constraintWidget9.mListAnchors[i4];
                    }
                    if (solverVariable4 != null && solverVariable != null) {
                        margin2 = constraintAnchor2.getMargin();
                        if (constraintWidget10 != null) {
                            constraintWidget8 = constraintWidget10;
                        }
                        linearSystem.addCentering(constraintAnchor2.mSolverVariable, solverVariable4, margin2, 0.5f, solverVariable, constraintAnchor3.mSolverVariable, constraintWidget8.mListAnchors[i4].getMargin(), 5);
                        return;
                    }
                }
                return;
            }
        }
        if (obj7 != null) {
            i4 = i2 + 1;
            linearSystem2.addGreaterThan(constraintWidgetContainer2.mListAnchors[i4].mSolverVariable, constraintWidget8.mListAnchors[i4].mSolverVariable, constraintWidget8.mListAnchors[i4].getMargin(), 6);
        }
        arrayList = chainHead2.mWeightedMatchConstraintsWidgets;
        if (arrayList != null) {
            i4 = arrayList.size();
            if (i4 > 1) {
                if (chainHead2.mHasUndefinedWeights) {
                }
                f3 = 0.0f;
                constraintWidget = null;
                i5 = 0;
                f4 = 0.0f;
                while (i5 < i4) {
                    constraintWidget3 = (ConstraintWidget) arrayList.get(i5);
                    f6 = constraintWidget3.mWeight[i];
                    if (f6 < f3) {
                        f5 = 0.0f;
                    } else if (chainHead2.mHasComplexMatchWeights) {
                        f6 = 1.0f;
                        f5 = 0.0f;
                    } else {
                        linearSystem2.addEquality(constraintWidget3.mListAnchors[i2 + 1].mSolverVariable, constraintWidget3.mListAnchors[i2].mSolverVariable, 0, 4);
                        arrayList2 = arrayList;
                        i6 = i4;
                        i5++;
                        i4 = i6;
                        arrayList = arrayList2;
                        f3 = 0.0f;
                    }
                    if (f6 != f5) {
                        if (constraintWidget == null) {
                            arrayList2 = arrayList;
                            i6 = i4;
                        } else {
                            solverVariable = constraintWidget.mListAnchors[i2].mSolverVariable;
                            i6 = i2 + 1;
                            solverVariable2 = constraintWidget.mListAnchors[i6].mSolverVariable;
                            solverVariable3 = constraintWidget3.mListAnchors[i2].mSolverVariable;
                            arrayList2 = arrayList;
                            SolverVariable solverVariable62 = constraintWidget3.mListAnchors[i6].mSolverVariable;
                            i6 = i4;
                            ArrayRow createRow2 = linearSystem.createRow();
                            createRow2.createRowEqualMatchDimensions(f4, f2, f6, solverVariable, solverVariable2, solverVariable3, solverVariable62);
                            linearSystem2.addConstraint(createRow2);
                        }
                        f4 = f6;
                        constraintWidget = constraintWidget3;
                        i5++;
                        i4 = i6;
                        arrayList = arrayList2;
                        f3 = 0.0f;
                    } else {
                        linearSystem2.addEquality(constraintWidget3.mListAnchors[i2 + 1].mSolverVariable, constraintWidget3.mListAnchors[i2].mSolverVariable, 0, 6);
                        arrayList2 = arrayList;
                        i6 = i4;
                        i5++;
                        i4 = i6;
                        arrayList = arrayList2;
                        f3 = 0.0f;
                    }
                }
            }
        }
        if (constraintWidget9 == null) {
        }
        if (obj5 != null) {
        }
        i7 = 8;
        if (chainHead2.mWidgetsMatchCount > 0) {
        }
        constraintWidget4 = constraintWidget9;
        constraintWidget3 = constraintWidget4;
        while (constraintWidget4 != null) {
            constraintWidget5 = constraintWidget4.mNextChainWidget[i];
            while (constraintWidget5 != null) {
                constraintWidget5 = constraintWidget5.mNextChainWidget[i];
            }
            if (constraintWidget4 != constraintWidget9) {
            }
            constraintWidget6 = constraintWidget3;
            i8 = 8;
            if (constraintWidget4.getVisibility() != i8) {
                constraintWidget4 = constraintWidget6;
            }
            constraintWidget3 = constraintWidget4;
            i7 = 8;
            constraintWidget4 = constraintWidget5;
        }
        constraintAnchor2 = constraintWidget9.mListAnchors[i2];
        constraintAnchor3 = constraintWidget7.mListAnchors[i2].mTarget;
        i3 = i2 + 1;
        constraintAnchor4 = constraintWidget10.mListAnchors[i3];
        constraintAnchor5 = constraintWidget8.mListAnchors[i3].mTarget;
        if (constraintAnchor3 != null) {
            i8 = 5;
        } else if (constraintWidget9 == constraintWidget10) {
            i8 = 5;
            if (constraintAnchor5 != null) {
                linearSystem.addCentering(constraintAnchor2.mSolverVariable, constraintAnchor3.mSolverVariable, constraintAnchor2.getMargin(), 0.5f, constraintAnchor4.mSolverVariable, constraintAnchor5.mSolverVariable, constraintAnchor4.getMargin(), 5);
            }
        } else {
            i8 = 5;
            linearSystem2.addEquality(constraintAnchor2.mSolverVariable, constraintAnchor3.mSolverVariable, constraintAnchor2.getMargin(), 5);
        }
        linearSystem2.addEquality(constraintAnchor4.mSolverVariable, constraintAnchor5.mSolverVariable, -constraintAnchor4.getMargin(), i8);
        if (obj5 == null) {
        }
        constraintAnchor2 = constraintWidget9.mListAnchors[i2];
        i4 = i2 + 1;
        constraintAnchor3 = constraintWidget10.mListAnchors[i4];
        if (constraintAnchor2.mTarget == null) {
        }
        if (constraintAnchor3.mTarget == null) {
        }
        if (constraintWidget8 == constraintWidget10) {
            solverVariable = solverVariable5;
        } else {
            ConstraintAnchor constraintAnchor72 = constraintWidget8.mListAnchors[i4];
            if (constraintAnchor72.mTarget == null) {
            }
            solverVariable = constraintAnchor72.mTarget == null ? constraintAnchor72.mTarget.mSolverVariable : null;
        }
        if (constraintWidget9 == constraintWidget10) {
            constraintAnchor2 = constraintWidget9.mListAnchors[i2];
            constraintAnchor3 = constraintWidget9.mListAnchors[i4];
        }
        if (solverVariable4 != null) {
        }
    }
}
