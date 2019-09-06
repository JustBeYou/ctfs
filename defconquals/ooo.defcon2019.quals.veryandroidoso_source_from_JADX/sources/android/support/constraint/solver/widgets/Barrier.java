package android.support.constraint.solver.widgets;

import android.support.constraint.solver.LinearSystem;
import android.support.constraint.solver.Metrics;
import android.support.constraint.solver.SolverVariable;
import android.support.constraint.solver.widgets.ConstraintWidget.DimensionBehaviour;
import java.util.ArrayList;

public class Barrier extends Helper {
    public static final int BOTTOM = 3;
    public static final int LEFT = 0;
    public static final int RIGHT = 1;
    public static final int TOP = 2;
    private boolean mAllowsGoneWidget = true;
    private int mBarrierType = 0;
    private ArrayList<ResolutionAnchor> mNodes = new ArrayList(4);

    public boolean allowedInBarrier() {
        return true;
    }

    public void setBarrierType(int i) {
        this.mBarrierType = i;
    }

    public void setAllowsGoneWidget(boolean z) {
        this.mAllowsGoneWidget = z;
    }

    public boolean allowsGoneWidget() {
        return this.mAllowsGoneWidget;
    }

    public void resetResolutionNodes() {
        super.resetResolutionNodes();
        this.mNodes.clear();
    }

    public void analyze(int i) {
        if (this.mParent != 0 && ((ConstraintWidgetContainer) this.mParent).optimizeFor(2) != 0) {
            ConstraintWidget constraintWidget;
            ResolutionAnchor resolutionNode;
            switch (this.mBarrierType) {
                case 0:
                    i = this.mLeft.getResolutionNode();
                    break;
                case 1:
                    i = this.mRight.getResolutionNode();
                    break;
                case 2:
                    i = this.mTop.getResolutionNode();
                    break;
                case 3:
                    i = this.mBottom.getResolutionNode();
                    break;
                default:
                    return;
            }
            i.setType(5);
            int i2 = this.mBarrierType;
            if (i2 != 0) {
                if (i2 != 1) {
                    this.mLeft.getResolutionNode().resolve(null, 0.0f);
                    this.mRight.getResolutionNode().resolve(null, 0.0f);
                    this.mNodes.clear();
                    for (i2 = 0; i2 < this.mWidgetsCount; i2++) {
                        constraintWidget = this.mWidgets[i2];
                        if (!this.mAllowsGoneWidget || constraintWidget.allowedInBarrier()) {
                            switch (this.mBarrierType) {
                                case 0:
                                    resolutionNode = constraintWidget.mLeft.getResolutionNode();
                                    break;
                                case 1:
                                    resolutionNode = constraintWidget.mRight.getResolutionNode();
                                    break;
                                case 2:
                                    resolutionNode = constraintWidget.mTop.getResolutionNode();
                                    break;
                                case 3:
                                    resolutionNode = constraintWidget.mBottom.getResolutionNode();
                                    break;
                                default:
                                    resolutionNode = null;
                                    break;
                            }
                            if (resolutionNode != null) {
                                this.mNodes.add(resolutionNode);
                                resolutionNode.addDependent(i);
                            }
                        }
                    }
                }
            }
            this.mTop.getResolutionNode().resolve(null, 0.0f);
            this.mBottom.getResolutionNode().resolve(null, 0.0f);
            this.mNodes.clear();
            for (i2 = 0; i2 < this.mWidgetsCount; i2++) {
                constraintWidget = this.mWidgets[i2];
                if (this.mAllowsGoneWidget) {
                }
                switch (this.mBarrierType) {
                    case 0:
                        resolutionNode = constraintWidget.mLeft.getResolutionNode();
                        break;
                    case 1:
                        resolutionNode = constraintWidget.mRight.getResolutionNode();
                        break;
                    case 2:
                        resolutionNode = constraintWidget.mTop.getResolutionNode();
                        break;
                    case 3:
                        resolutionNode = constraintWidget.mBottom.getResolutionNode();
                        break;
                    default:
                        resolutionNode = null;
                        break;
                }
                if (resolutionNode != null) {
                    this.mNodes.add(resolutionNode);
                    resolutionNode.addDependent(i);
                }
            }
        }
    }

    public void resolve() {
        ResolutionAnchor resolutionNode;
        float f = Float.MAX_VALUE;
        switch (this.mBarrierType) {
            case 0:
                resolutionNode = this.mLeft.getResolutionNode();
                break;
            case 1:
                resolutionNode = this.mRight.getResolutionNode();
                f = 0.0f;
                break;
            case 2:
                resolutionNode = this.mTop.getResolutionNode();
                break;
            case 3:
                resolutionNode = this.mBottom.getResolutionNode();
                f = 0.0f;
                break;
            default:
                return;
        }
        int size = this.mNodes.size();
        ResolutionAnchor resolutionAnchor = null;
        int i = 0;
        while (i < size) {
            ResolutionAnchor resolutionAnchor2 = (ResolutionAnchor) this.mNodes.get(i);
            if (resolutionAnchor2.state == 1) {
                int i2 = this.mBarrierType;
                if (i2 != 0) {
                    if (i2 != 2) {
                        if (resolutionAnchor2.resolvedOffset > f) {
                            f = resolutionAnchor2.resolvedOffset;
                            resolutionAnchor = resolutionAnchor2.resolvedTarget;
                        }
                        i++;
                    }
                }
                if (resolutionAnchor2.resolvedOffset < f) {
                    f = resolutionAnchor2.resolvedOffset;
                    resolutionAnchor = resolutionAnchor2.resolvedTarget;
                }
                i++;
            } else {
                return;
            }
        }
        if (LinearSystem.getMetrics() != null) {
            Metrics metrics = LinearSystem.getMetrics();
            metrics.barrierConnectionResolved++;
        }
        resolutionNode.resolvedTarget = resolutionAnchor;
        resolutionNode.resolvedOffset = f;
        resolutionNode.didResolve();
        switch (this.mBarrierType) {
            case 0:
                this.mRight.getResolutionNode().resolve(resolutionAnchor, f);
                break;
            case 1:
                this.mLeft.getResolutionNode().resolve(resolutionAnchor, f);
                break;
            case 2:
                this.mBottom.getResolutionNode().resolve(resolutionAnchor, f);
                break;
            case 3:
                this.mTop.getResolutionNode().resolve(resolutionAnchor, f);
                break;
            default:
                return;
        }
    }

    public void addToSolver(LinearSystem linearSystem) {
        int i;
        this.mListAnchors[0] = this.mLeft;
        this.mListAnchors[2] = this.mTop;
        this.mListAnchors[1] = this.mRight;
        this.mListAnchors[3] = this.mBottom;
        for (i = 0; i < this.mListAnchors.length; i++) {
            this.mListAnchors[i].mSolverVariable = linearSystem.createObjectVariable(this.mListAnchors[i]);
        }
        i = this.mBarrierType;
        if (i >= 0 && i < 4) {
            boolean z;
            ConstraintWidget constraintWidget;
            SolverVariable createObjectVariable;
            ConstraintAnchor[] constraintAnchorArr;
            int i2;
            ConstraintAnchor constraintAnchor = this.mListAnchors[this.mBarrierType];
            for (int i3 = 0; i3 < this.mWidgetsCount; i3++) {
                ConstraintWidget constraintWidget2 = this.mWidgets[i3];
                if (this.mAllowsGoneWidget || constraintWidget2.allowedInBarrier()) {
                    int i4 = this.mBarrierType;
                    if ((i4 != 0 && i4 != 1) || constraintWidget2.getHorizontalDimensionBehaviour() != DimensionBehaviour.MATCH_CONSTRAINT) {
                        i4 = this.mBarrierType;
                        if ((i4 == 2 || i4 == 3) && constraintWidget2.getVerticalDimensionBehaviour() == DimensionBehaviour.MATCH_CONSTRAINT) {
                            z = true;
                            break;
                        }
                    }
                    z = true;
                    break;
                }
            }
            z = false;
            int i5 = this.mBarrierType;
            if (i5 != 0) {
                if (i5 != 1) {
                    if (getParent().getVerticalDimensionBehaviour() == DimensionBehaviour.WRAP_CONTENT) {
                        z = false;
                    }
                    for (i5 = 0; i5 < this.mWidgetsCount; i5++) {
                        constraintWidget = this.mWidgets[i5];
                        if (!this.mAllowsGoneWidget || constraintWidget.allowedInBarrier()) {
                            createObjectVariable = linearSystem.createObjectVariable(constraintWidget.mListAnchors[this.mBarrierType]);
                            constraintAnchorArr = constraintWidget.mListAnchors;
                            i2 = this.mBarrierType;
                            constraintAnchorArr[i2].mSolverVariable = createObjectVariable;
                            if (i2 != 0) {
                                if (i2 == 2) {
                                    linearSystem.addGreaterBarrier(constraintAnchor.mSolverVariable, createObjectVariable, z);
                                }
                            }
                            linearSystem.addLowerBarrier(constraintAnchor.mSolverVariable, createObjectVariable, z);
                        }
                    }
                    i = this.mBarrierType;
                    if (i == 0) {
                        linearSystem.addEquality(this.mRight.mSolverVariable, this.mLeft.mSolverVariable, 0, 6);
                        if (!z) {
                            linearSystem.addEquality(this.mLeft.mSolverVariable, this.mParent.mRight.mSolverVariable, 0, 5);
                        }
                    } else if (i == 1) {
                        linearSystem.addEquality(this.mLeft.mSolverVariable, this.mRight.mSolverVariable, 0, 6);
                        if (!z) {
                            linearSystem.addEquality(this.mLeft.mSolverVariable, this.mParent.mLeft.mSolverVariable, 0, 5);
                        }
                    } else if (i == 2) {
                        linearSystem.addEquality(this.mBottom.mSolverVariable, this.mTop.mSolverVariable, 0, 6);
                        if (!z) {
                            linearSystem.addEquality(this.mTop.mSolverVariable, this.mParent.mBottom.mSolverVariable, 0, 5);
                        }
                    } else if (i == 3) {
                        linearSystem.addEquality(this.mTop.mSolverVariable, this.mBottom.mSolverVariable, 0, 6);
                        if (!z) {
                            linearSystem.addEquality(this.mTop.mSolverVariable, this.mParent.mTop.mSolverVariable, 0, 5);
                        }
                    }
                }
            }
            if (getParent().getHorizontalDimensionBehaviour() == DimensionBehaviour.WRAP_CONTENT) {
                z = false;
            }
            for (i5 = 0; i5 < this.mWidgetsCount; i5++) {
                constraintWidget = this.mWidgets[i5];
                if (this.mAllowsGoneWidget) {
                }
                createObjectVariable = linearSystem.createObjectVariable(constraintWidget.mListAnchors[this.mBarrierType]);
                constraintAnchorArr = constraintWidget.mListAnchors;
                i2 = this.mBarrierType;
                constraintAnchorArr[i2].mSolverVariable = createObjectVariable;
                if (i2 != 0) {
                    if (i2 == 2) {
                        linearSystem.addGreaterBarrier(constraintAnchor.mSolverVariable, createObjectVariable, z);
                    }
                }
                linearSystem.addLowerBarrier(constraintAnchor.mSolverVariable, createObjectVariable, z);
            }
            i = this.mBarrierType;
            if (i == 0) {
                linearSystem.addEquality(this.mRight.mSolverVariable, this.mLeft.mSolverVariable, 0, 6);
                if (z) {
                    linearSystem.addEquality(this.mLeft.mSolverVariable, this.mParent.mRight.mSolverVariable, 0, 5);
                }
            } else if (i == 1) {
                linearSystem.addEquality(this.mLeft.mSolverVariable, this.mRight.mSolverVariable, 0, 6);
                if (z) {
                    linearSystem.addEquality(this.mLeft.mSolverVariable, this.mParent.mLeft.mSolverVariable, 0, 5);
                }
            } else if (i == 2) {
                linearSystem.addEquality(this.mBottom.mSolverVariable, this.mTop.mSolverVariable, 0, 6);
                if (z) {
                    linearSystem.addEquality(this.mTop.mSolverVariable, this.mParent.mBottom.mSolverVariable, 0, 5);
                }
            } else if (i == 3) {
                linearSystem.addEquality(this.mTop.mSolverVariable, this.mBottom.mSolverVariable, 0, 6);
                if (z) {
                    linearSystem.addEquality(this.mTop.mSolverVariable, this.mParent.mTop.mSolverVariable, 0, 5);
                }
            }
        }
    }
}
