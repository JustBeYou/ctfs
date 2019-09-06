package android.support.constraint.solver.widgets;

import android.support.constraint.solver.LinearSystem;
import android.support.constraint.solver.Metrics;
import android.support.constraint.solver.widgets.ConstraintAnchor.Type;
import android.support.constraint.solver.widgets.ConstraintWidget.DimensionBehaviour;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ConstraintWidgetContainer extends WidgetContainer {
    private static final boolean DEBUG = false;
    static final boolean DEBUG_GRAPH = false;
    private static final boolean DEBUG_LAYOUT = false;
    private static final int MAX_ITERATIONS = 8;
    private static final boolean USE_SNAPSHOT = true;
    int mDebugSolverPassCount;
    public boolean mGroupsWrapOptimized;
    private boolean mHeightMeasuredTooSmall;
    ChainHead[] mHorizontalChainsArray;
    int mHorizontalChainsSize;
    public boolean mHorizontalWrapOptimized;
    private boolean mIsRtl;
    private int mOptimizationLevel;
    int mPaddingBottom;
    int mPaddingLeft;
    int mPaddingRight;
    int mPaddingTop;
    public boolean mSkipSolver;
    private Snapshot mSnapshot;
    protected LinearSystem mSystem;
    ChainHead[] mVerticalChainsArray;
    int mVerticalChainsSize;
    public boolean mVerticalWrapOptimized;
    public List<ConstraintWidgetGroup> mWidgetGroups;
    private boolean mWidthMeasuredTooSmall;
    public int mWrapFixedHeight;
    public int mWrapFixedWidth;

    public String getType() {
        return "ConstraintLayout";
    }

    public boolean handlesInternalConstraints() {
        return false;
    }

    public void fillMetrics(Metrics metrics) {
        this.mSystem.fillMetrics(metrics);
    }

    public ConstraintWidgetContainer() {
        this.mIsRtl = false;
        this.mSystem = new LinearSystem();
        this.mHorizontalChainsSize = 0;
        this.mVerticalChainsSize = 0;
        this.mVerticalChainsArray = new ChainHead[4];
        this.mHorizontalChainsArray = new ChainHead[4];
        this.mWidgetGroups = new ArrayList();
        this.mGroupsWrapOptimized = false;
        this.mHorizontalWrapOptimized = false;
        this.mVerticalWrapOptimized = false;
        this.mWrapFixedWidth = 0;
        this.mWrapFixedHeight = 0;
        this.mOptimizationLevel = 7;
        this.mSkipSolver = false;
        this.mWidthMeasuredTooSmall = false;
        this.mHeightMeasuredTooSmall = false;
        this.mDebugSolverPassCount = 0;
    }

    public ConstraintWidgetContainer(int i, int i2, int i3, int i4) {
        super(i, i2, i3, i4);
        this.mIsRtl = false;
        this.mSystem = new LinearSystem();
        this.mHorizontalChainsSize = 0;
        this.mVerticalChainsSize = 0;
        this.mVerticalChainsArray = new ChainHead[4];
        this.mHorizontalChainsArray = new ChainHead[4];
        this.mWidgetGroups = new ArrayList();
        this.mGroupsWrapOptimized = false;
        this.mHorizontalWrapOptimized = false;
        this.mVerticalWrapOptimized = false;
        this.mWrapFixedWidth = 0;
        this.mWrapFixedHeight = 0;
        this.mOptimizationLevel = 7;
        this.mSkipSolver = false;
        this.mWidthMeasuredTooSmall = false;
        this.mHeightMeasuredTooSmall = false;
        this.mDebugSolverPassCount = 0;
    }

    public ConstraintWidgetContainer(int i, int i2) {
        super(i, i2);
        this.mIsRtl = false;
        this.mSystem = new LinearSystem();
        this.mHorizontalChainsSize = 0;
        this.mVerticalChainsSize = 0;
        this.mVerticalChainsArray = new ChainHead[4];
        this.mHorizontalChainsArray = new ChainHead[4];
        this.mWidgetGroups = new ArrayList();
        this.mGroupsWrapOptimized = false;
        this.mHorizontalWrapOptimized = false;
        this.mVerticalWrapOptimized = false;
        this.mWrapFixedWidth = 0;
        this.mWrapFixedHeight = 0;
        this.mOptimizationLevel = 7;
        this.mSkipSolver = false;
        this.mWidthMeasuredTooSmall = false;
        this.mHeightMeasuredTooSmall = false;
        this.mDebugSolverPassCount = 0;
    }

    public void setOptimizationLevel(int i) {
        this.mOptimizationLevel = i;
    }

    public int getOptimizationLevel() {
        return this.mOptimizationLevel;
    }

    public boolean optimizeFor(int i) {
        return (this.mOptimizationLevel & i) == i ? USE_SNAPSHOT : false;
    }

    public void reset() {
        this.mSystem.reset();
        this.mPaddingLeft = 0;
        this.mPaddingRight = 0;
        this.mPaddingTop = 0;
        this.mPaddingBottom = 0;
        this.mWidgetGroups.clear();
        this.mSkipSolver = false;
        super.reset();
    }

    public boolean isWidthMeasuredTooSmall() {
        return this.mWidthMeasuredTooSmall;
    }

    public boolean isHeightMeasuredTooSmall() {
        return this.mHeightMeasuredTooSmall;
    }

    public boolean addChildrenToSolver(LinearSystem linearSystem) {
        addToSolver(linearSystem);
        int size = this.mChildren.size();
        for (int i = 0; i < size; i++) {
            ConstraintWidget constraintWidget = (ConstraintWidget) this.mChildren.get(i);
            if (constraintWidget instanceof ConstraintWidgetContainer) {
                DimensionBehaviour dimensionBehaviour = constraintWidget.mListDimensionBehaviors[0];
                DimensionBehaviour dimensionBehaviour2 = constraintWidget.mListDimensionBehaviors[1];
                if (dimensionBehaviour == DimensionBehaviour.WRAP_CONTENT) {
                    constraintWidget.setHorizontalDimensionBehaviour(DimensionBehaviour.FIXED);
                }
                if (dimensionBehaviour2 == DimensionBehaviour.WRAP_CONTENT) {
                    constraintWidget.setVerticalDimensionBehaviour(DimensionBehaviour.FIXED);
                }
                constraintWidget.addToSolver(linearSystem);
                if (dimensionBehaviour == DimensionBehaviour.WRAP_CONTENT) {
                    constraintWidget.setHorizontalDimensionBehaviour(dimensionBehaviour);
                }
                if (dimensionBehaviour2 == DimensionBehaviour.WRAP_CONTENT) {
                    constraintWidget.setVerticalDimensionBehaviour(dimensionBehaviour2);
                }
            } else {
                Optimizer.checkMatchParent(this, linearSystem, constraintWidget);
                constraintWidget.addToSolver(linearSystem);
            }
        }
        if (this.mHorizontalChainsSize > 0) {
            Chain.applyChainConstraints(this, linearSystem, 0);
        }
        if (this.mVerticalChainsSize > 0) {
            Chain.applyChainConstraints(this, linearSystem, 1);
        }
        return USE_SNAPSHOT;
    }

    public void updateChildrenFromSolver(LinearSystem linearSystem, boolean[] zArr) {
        zArr[2] = false;
        updateFromSolver(linearSystem);
        int size = this.mChildren.size();
        for (int i = 0; i < size; i++) {
            ConstraintWidget constraintWidget = (ConstraintWidget) this.mChildren.get(i);
            constraintWidget.updateFromSolver(linearSystem);
            if (constraintWidget.mListDimensionBehaviors[0] == DimensionBehaviour.MATCH_CONSTRAINT && constraintWidget.getWidth() < constraintWidget.getWrapWidth()) {
                zArr[2] = USE_SNAPSHOT;
            }
            if (constraintWidget.mListDimensionBehaviors[1] == DimensionBehaviour.MATCH_CONSTRAINT && constraintWidget.getHeight() < constraintWidget.getWrapHeight()) {
                zArr[2] = USE_SNAPSHOT;
            }
        }
    }

    public void setPadding(int i, int i2, int i3, int i4) {
        this.mPaddingLeft = i;
        this.mPaddingTop = i2;
        this.mPaddingRight = i3;
        this.mPaddingBottom = i4;
    }

    public void setRtl(boolean z) {
        this.mIsRtl = z;
    }

    public boolean isRtl() {
        return this.mIsRtl;
    }

    public void analyze(int i) {
        super.analyze(i);
        int size = this.mChildren.size();
        for (int i2 = 0; i2 < size; i2++) {
            ((ConstraintWidget) this.mChildren.get(i2)).analyze(i);
        }
    }

    public void layout() {
        Object obj;
        Object obj2;
        int i;
        int i2;
        ConstraintWidget constraintWidget;
        Object obj3;
        int i3;
        boolean z;
        boolean z2;
        int i4;
        Object obj4;
        Exception e;
        boolean addChildrenToSolver;
        PrintStream printStream;
        StringBuilder stringBuilder;
        int i5;
        ConstraintWidget constraintWidget2;
        int i6;
        int i7;
        boolean z3;
        DimensionBehaviour[] dimensionBehaviourArr;
        DimensionBehaviour dimensionBehaviour;
        int i8 = this.mX;
        int i9 = this.mY;
        int max = Math.max(0, getWidth());
        int max2 = Math.max(0, getHeight());
        this.mWidthMeasuredTooSmall = false;
        this.mHeightMeasuredTooSmall = false;
        if (this.mParent != null) {
            if (r1.mSnapshot == null) {
                r1.mSnapshot = new Snapshot(r1);
            }
            r1.mSnapshot.updateFrom(r1);
            setX(r1.mPaddingLeft);
            setY(r1.mPaddingTop);
            resetAnchors();
            resetSolverVariables(r1.mSystem.getCache());
        } else {
            r1.mX = 0;
            r1.mY = 0;
        }
        int i10 = 32;
        if (r1.mOptimizationLevel != 0) {
            if (!optimizeFor(8)) {
                optimizeReset();
            }
            if (!optimizeFor(32)) {
                optimize();
            }
            r1.mSystem.graphOptimizer = USE_SNAPSHOT;
        } else {
            r1.mSystem.graphOptimizer = false;
        }
        DimensionBehaviour dimensionBehaviour2 = r1.mListDimensionBehaviors[1];
        DimensionBehaviour dimensionBehaviour3 = r1.mListDimensionBehaviors[0];
        resetChains();
        if (r1.mWidgetGroups.size() == 0) {
            r1.mWidgetGroups.clear();
            r1.mWidgetGroups.add(0, new ConstraintWidgetGroup(r1.mChildren));
        }
        int size = r1.mWidgetGroups.size();
        ArrayList arrayList = r1.mChildren;
        if (getHorizontalDimensionBehaviour() != DimensionBehaviour.WRAP_CONTENT) {
            if (getVerticalDimensionBehaviour() != DimensionBehaviour.WRAP_CONTENT) {
                obj = null;
                obj2 = null;
                i = 0;
                while (i < size && !r1.mSkipSolver) {
                    if (((ConstraintWidgetGroup) r1.mWidgetGroups.get(i)).mSkipSolver) {
                        if (optimizeFor(i10)) {
                            if (getHorizontalDimensionBehaviour() == DimensionBehaviour.FIXED || getVerticalDimensionBehaviour() != DimensionBehaviour.FIXED) {
                                r1.mChildren = (ArrayList) ((ConstraintWidgetGroup) r1.mWidgetGroups.get(i)).mConstrainedGroup;
                            } else {
                                r1.mChildren = (ArrayList) ((ConstraintWidgetGroup) r1.mWidgetGroups.get(i)).getWidgetsToSolve();
                            }
                        }
                        resetChains();
                        i10 = r1.mChildren.size();
                        for (i2 = 0; i2 < i10; i2++) {
                            constraintWidget = (ConstraintWidget) r1.mChildren.get(i2);
                            if (constraintWidget instanceof WidgetContainer) {
                                ((WidgetContainer) constraintWidget).layout();
                            }
                        }
                        obj3 = obj2;
                        i3 = 0;
                        z = USE_SNAPSHOT;
                        while (z) {
                            z2 = z;
                            i4 = i3 + 1;
                            try {
                                r1.mSystem.reset();
                                resetChains();
                                createObjectVariables(r1.mSystem);
                                i3 = 0;
                                while (i3 < i10) {
                                    obj4 = obj3;
                                    try {
                                        ((ConstraintWidget) r1.mChildren.get(i3)).createObjectVariables(r1.mSystem);
                                        i3++;
                                        obj3 = obj4;
                                    } catch (Exception e2) {
                                        e = e2;
                                    }
                                }
                                obj4 = obj3;
                                addChildrenToSolver = addChildrenToSolver(r1.mSystem);
                                if (addChildrenToSolver) {
                                    try {
                                        r1.mSystem.minimize();
                                    } catch (Exception e3) {
                                        e = e3;
                                        e.printStackTrace();
                                        printStream = System.out;
                                        z2 = addChildrenToSolver;
                                        stringBuilder = new StringBuilder();
                                        i5 = size;
                                        stringBuilder.append("EXCEPTION : ");
                                        stringBuilder.append(e);
                                        printStream.println(stringBuilder.toString());
                                        if (z2) {
                                            updateFromSolver(r1.mSystem);
                                            for (i2 = 0; i2 < i10; i2++) {
                                                constraintWidget2 = (ConstraintWidget) r1.mChildren.get(i2);
                                                if (constraintWidget2.mListDimensionBehaviors[0] != DimensionBehaviour.MATCH_CONSTRAINT) {
                                                    size = 1;
                                                } else if (constraintWidget2.getWidth() >= constraintWidget2.getWrapWidth()) {
                                                    Optimizer.flags[2] = USE_SNAPSHOT;
                                                    i6 = 2;
                                                    break;
                                                } else {
                                                    size = 1;
                                                }
                                                if (constraintWidget2.mListDimensionBehaviors[size] != DimensionBehaviour.MATCH_CONSTRAINT) {
                                                    if (constraintWidget2.getHeight() >= constraintWidget2.getWrapHeight()) {
                                                        i6 = 2;
                                                        Optimizer.flags[2] = USE_SNAPSHOT;
                                                        break;
                                                    }
                                                }
                                            }
                                            i6 = 2;
                                        } else {
                                            updateChildrenFromSolver(r1.mSystem, Optimizer.flags);
                                            i6 = 2;
                                        }
                                        if (obj == null) {
                                        }
                                        i7 = i4;
                                        obj3 = obj4;
                                        z3 = false;
                                        i4 = Math.max(r1.mMinWidth, getWidth());
                                        if (i4 > getWidth()) {
                                            setWidth(i4);
                                            r1.mListDimensionBehaviors[0] = DimensionBehaviour.FIXED;
                                            z3 = USE_SNAPSHOT;
                                            obj3 = 1;
                                        }
                                        i4 = Math.max(r1.mMinHeight, getHeight());
                                        if (i4 <= getHeight()) {
                                            setHeight(i4);
                                            dimensionBehaviourArr = r1.mListDimensionBehaviors;
                                            dimensionBehaviour = DimensionBehaviour.FIXED;
                                            addChildrenToSolver = USE_SNAPSHOT;
                                            dimensionBehaviourArr[1] = dimensionBehaviour;
                                            z3 = USE_SNAPSHOT;
                                            obj3 = 1;
                                        } else {
                                            addChildrenToSolver = USE_SNAPSHOT;
                                        }
                                        if (obj3 != null) {
                                            r1.mWidthMeasuredTooSmall = addChildrenToSolver;
                                            r1.mListDimensionBehaviors[0] = DimensionBehaviour.FIXED;
                                            setWidth(max);
                                            z3 = USE_SNAPSHOT;
                                            obj3 = 1;
                                            if (r1.mListDimensionBehaviors[addChildrenToSolver] == DimensionBehaviour.WRAP_CONTENT) {
                                            }
                                            z = z3;
                                        } else {
                                            z = z3;
                                        }
                                        i3 = i7;
                                        size = i5;
                                    }
                                }
                                z2 = addChildrenToSolver;
                                i5 = size;
                            } catch (Exception e4) {
                                e = e4;
                                obj4 = obj3;
                                addChildrenToSolver = z2;
                                e.printStackTrace();
                                printStream = System.out;
                                z2 = addChildrenToSolver;
                                stringBuilder = new StringBuilder();
                                i5 = size;
                                stringBuilder.append("EXCEPTION : ");
                                stringBuilder.append(e);
                                printStream.println(stringBuilder.toString());
                                if (z2) {
                                    updateFromSolver(r1.mSystem);
                                    for (i2 = 0; i2 < i10; i2++) {
                                        constraintWidget2 = (ConstraintWidget) r1.mChildren.get(i2);
                                        if (constraintWidget2.mListDimensionBehaviors[0] != DimensionBehaviour.MATCH_CONSTRAINT) {
                                            if (constraintWidget2.getWidth() >= constraintWidget2.getWrapWidth()) {
                                                Optimizer.flags[2] = USE_SNAPSHOT;
                                                i6 = 2;
                                                break;
                                            }
                                            size = 1;
                                        } else {
                                            size = 1;
                                        }
                                        if (constraintWidget2.mListDimensionBehaviors[size] != DimensionBehaviour.MATCH_CONSTRAINT) {
                                            if (constraintWidget2.getHeight() >= constraintWidget2.getWrapHeight()) {
                                                i6 = 2;
                                                Optimizer.flags[2] = USE_SNAPSHOT;
                                                break;
                                            }
                                        }
                                    }
                                    i6 = 2;
                                } else {
                                    updateChildrenFromSolver(r1.mSystem, Optimizer.flags);
                                    i6 = 2;
                                }
                                if (obj == null) {
                                }
                                i7 = i4;
                                obj3 = obj4;
                                z3 = false;
                                i4 = Math.max(r1.mMinWidth, getWidth());
                                if (i4 > getWidth()) {
                                    setWidth(i4);
                                    r1.mListDimensionBehaviors[0] = DimensionBehaviour.FIXED;
                                    z3 = USE_SNAPSHOT;
                                    obj3 = 1;
                                }
                                i4 = Math.max(r1.mMinHeight, getHeight());
                                if (i4 <= getHeight()) {
                                    addChildrenToSolver = USE_SNAPSHOT;
                                } else {
                                    setHeight(i4);
                                    dimensionBehaviourArr = r1.mListDimensionBehaviors;
                                    dimensionBehaviour = DimensionBehaviour.FIXED;
                                    addChildrenToSolver = USE_SNAPSHOT;
                                    dimensionBehaviourArr[1] = dimensionBehaviour;
                                    z3 = USE_SNAPSHOT;
                                    obj3 = 1;
                                }
                                if (obj3 != null) {
                                    z = z3;
                                } else {
                                    r1.mWidthMeasuredTooSmall = addChildrenToSolver;
                                    r1.mListDimensionBehaviors[0] = DimensionBehaviour.FIXED;
                                    setWidth(max);
                                    z3 = USE_SNAPSHOT;
                                    obj3 = 1;
                                    if (r1.mListDimensionBehaviors[addChildrenToSolver] == DimensionBehaviour.WRAP_CONTENT) {
                                    }
                                    z = z3;
                                }
                                i3 = i7;
                                size = i5;
                            }
                            if (z2) {
                                updateChildrenFromSolver(r1.mSystem, Optimizer.flags);
                                i6 = 2;
                            } else {
                                updateFromSolver(r1.mSystem);
                                for (i2 = 0; i2 < i10; i2++) {
                                    constraintWidget2 = (ConstraintWidget) r1.mChildren.get(i2);
                                    if (constraintWidget2.mListDimensionBehaviors[0] != DimensionBehaviour.MATCH_CONSTRAINT) {
                                        size = 1;
                                    } else if (constraintWidget2.getWidth() >= constraintWidget2.getWrapWidth()) {
                                        Optimizer.flags[2] = USE_SNAPSHOT;
                                        i6 = 2;
                                        break;
                                    } else {
                                        size = 1;
                                    }
                                    if (constraintWidget2.mListDimensionBehaviors[size] != DimensionBehaviour.MATCH_CONSTRAINT) {
                                        if (constraintWidget2.getHeight() >= constraintWidget2.getWrapHeight()) {
                                            i6 = 2;
                                            Optimizer.flags[2] = USE_SNAPSHOT;
                                            break;
                                        }
                                    }
                                }
                                i6 = 2;
                            }
                            if (obj == null && i4 < 8 && Optimizer.flags[r9]) {
                                i3 = 0;
                                i6 = 0;
                                size = 0;
                                while (i3 < i10) {
                                    ConstraintWidget constraintWidget3 = (ConstraintWidget) r1.mChildren.get(i3);
                                    i7 = i4;
                                    i6 = Math.max(i6, constraintWidget3.mX + constraintWidget3.getWidth());
                                    size = Math.max(size, constraintWidget3.mY + constraintWidget3.getHeight());
                                    i3++;
                                    i4 = i7;
                                }
                                i7 = i4;
                                i3 = Math.max(r1.mMinWidth, i6);
                                i4 = Math.max(r1.mMinHeight, size);
                                if (dimensionBehaviour3 != DimensionBehaviour.WRAP_CONTENT || getWidth() >= i3) {
                                    z3 = false;
                                } else {
                                    setWidth(i3);
                                    r1.mListDimensionBehaviors[0] = DimensionBehaviour.WRAP_CONTENT;
                                    z3 = USE_SNAPSHOT;
                                    obj4 = 1;
                                }
                                if (dimensionBehaviour2 != DimensionBehaviour.WRAP_CONTENT || getHeight() >= i4) {
                                    obj3 = obj4;
                                } else {
                                    setHeight(i4);
                                    r1.mListDimensionBehaviors[1] = DimensionBehaviour.WRAP_CONTENT;
                                    z3 = USE_SNAPSHOT;
                                    obj3 = 1;
                                }
                            } else {
                                i7 = i4;
                                obj3 = obj4;
                                z3 = false;
                            }
                            i4 = Math.max(r1.mMinWidth, getWidth());
                            if (i4 > getWidth()) {
                                setWidth(i4);
                                r1.mListDimensionBehaviors[0] = DimensionBehaviour.FIXED;
                                z3 = USE_SNAPSHOT;
                                obj3 = 1;
                            }
                            i4 = Math.max(r1.mMinHeight, getHeight());
                            if (i4 <= getHeight()) {
                                setHeight(i4);
                                dimensionBehaviourArr = r1.mListDimensionBehaviors;
                                dimensionBehaviour = DimensionBehaviour.FIXED;
                                addChildrenToSolver = USE_SNAPSHOT;
                                dimensionBehaviourArr[1] = dimensionBehaviour;
                                z3 = USE_SNAPSHOT;
                                obj3 = 1;
                            } else {
                                addChildrenToSolver = USE_SNAPSHOT;
                            }
                            if (obj3 != null) {
                                if (r1.mListDimensionBehaviors[0] == DimensionBehaviour.WRAP_CONTENT && max > 0 && getWidth() > max) {
                                    r1.mWidthMeasuredTooSmall = addChildrenToSolver;
                                    r1.mListDimensionBehaviors[0] = DimensionBehaviour.FIXED;
                                    setWidth(max);
                                    z3 = USE_SNAPSHOT;
                                    obj3 = 1;
                                }
                                if (r1.mListDimensionBehaviors[addChildrenToSolver] == DimensionBehaviour.WRAP_CONTENT || max2 <= 0 || getHeight() <= max2) {
                                    z = z3;
                                } else {
                                    r1.mHeightMeasuredTooSmall = addChildrenToSolver;
                                    r1.mListDimensionBehaviors[addChildrenToSolver] = DimensionBehaviour.FIXED;
                                    setHeight(max2);
                                    z = USE_SNAPSHOT;
                                    obj3 = 1;
                                }
                            } else {
                                z = z3;
                            }
                            i3 = i7;
                            size = i5;
                        }
                        obj4 = obj3;
                        i5 = size;
                        ((ConstraintWidgetGroup) r1.mWidgetGroups.get(i)).updateUnresolvedWidgets();
                        obj2 = obj4;
                    } else {
                        i5 = size;
                    }
                    i++;
                    size = i5;
                    i10 = 32;
                }
                r1.mChildren = arrayList;
                if (r1.mParent == null) {
                    i8 = Math.max(r1.mMinWidth, getWidth());
                    i9 = Math.max(r1.mMinHeight, getHeight());
                    r1.mSnapshot.applyTo(r1);
                    setWidth((i8 + r1.mPaddingLeft) + r1.mPaddingRight);
                    setHeight((i9 + r1.mPaddingTop) + r1.mPaddingBottom);
                } else {
                    r1.mX = i8;
                    r1.mY = i9;
                }
                if (obj2 != null) {
                    r1.mListDimensionBehaviors[0] = dimensionBehaviour3;
                    r1.mListDimensionBehaviors[1] = dimensionBehaviour2;
                }
                resetSolverVariables(r1.mSystem.getCache());
                if (r1 == getRootConstraintContainer()) {
                    updateDrawPosition();
                }
            }
        }
        obj = 1;
        obj2 = null;
        i = 0;
        while (i < size) {
            if (((ConstraintWidgetGroup) r1.mWidgetGroups.get(i)).mSkipSolver) {
                if (optimizeFor(i10)) {
                    if (getHorizontalDimensionBehaviour() == DimensionBehaviour.FIXED) {
                    }
                    r1.mChildren = (ArrayList) ((ConstraintWidgetGroup) r1.mWidgetGroups.get(i)).mConstrainedGroup;
                }
                resetChains();
                i10 = r1.mChildren.size();
                for (i2 = 0; i2 < i10; i2++) {
                    constraintWidget = (ConstraintWidget) r1.mChildren.get(i2);
                    if (constraintWidget instanceof WidgetContainer) {
                        ((WidgetContainer) constraintWidget).layout();
                    }
                }
                obj3 = obj2;
                i3 = 0;
                z = USE_SNAPSHOT;
                while (z) {
                    z2 = z;
                    i4 = i3 + 1;
                    r1.mSystem.reset();
                    resetChains();
                    createObjectVariables(r1.mSystem);
                    i3 = 0;
                    while (i3 < i10) {
                        obj4 = obj3;
                        ((ConstraintWidget) r1.mChildren.get(i3)).createObjectVariables(r1.mSystem);
                        i3++;
                        obj3 = obj4;
                    }
                    obj4 = obj3;
                    addChildrenToSolver = addChildrenToSolver(r1.mSystem);
                    if (addChildrenToSolver) {
                        r1.mSystem.minimize();
                    }
                    z2 = addChildrenToSolver;
                    i5 = size;
                    if (z2) {
                        updateFromSolver(r1.mSystem);
                        for (i2 = 0; i2 < i10; i2++) {
                            constraintWidget2 = (ConstraintWidget) r1.mChildren.get(i2);
                            if (constraintWidget2.mListDimensionBehaviors[0] != DimensionBehaviour.MATCH_CONSTRAINT) {
                                if (constraintWidget2.getWidth() >= constraintWidget2.getWrapWidth()) {
                                    Optimizer.flags[2] = USE_SNAPSHOT;
                                    i6 = 2;
                                    break;
                                }
                                size = 1;
                            } else {
                                size = 1;
                            }
                            if (constraintWidget2.mListDimensionBehaviors[size] != DimensionBehaviour.MATCH_CONSTRAINT) {
                                if (constraintWidget2.getHeight() >= constraintWidget2.getWrapHeight()) {
                                    i6 = 2;
                                    Optimizer.flags[2] = USE_SNAPSHOT;
                                    break;
                                }
                            }
                        }
                        i6 = 2;
                    } else {
                        updateChildrenFromSolver(r1.mSystem, Optimizer.flags);
                        i6 = 2;
                    }
                    if (obj == null) {
                    }
                    i7 = i4;
                    obj3 = obj4;
                    z3 = false;
                    i4 = Math.max(r1.mMinWidth, getWidth());
                    if (i4 > getWidth()) {
                        setWidth(i4);
                        r1.mListDimensionBehaviors[0] = DimensionBehaviour.FIXED;
                        z3 = USE_SNAPSHOT;
                        obj3 = 1;
                    }
                    i4 = Math.max(r1.mMinHeight, getHeight());
                    if (i4 <= getHeight()) {
                        addChildrenToSolver = USE_SNAPSHOT;
                    } else {
                        setHeight(i4);
                        dimensionBehaviourArr = r1.mListDimensionBehaviors;
                        dimensionBehaviour = DimensionBehaviour.FIXED;
                        addChildrenToSolver = USE_SNAPSHOT;
                        dimensionBehaviourArr[1] = dimensionBehaviour;
                        z3 = USE_SNAPSHOT;
                        obj3 = 1;
                    }
                    if (obj3 != null) {
                        z = z3;
                    } else {
                        r1.mWidthMeasuredTooSmall = addChildrenToSolver;
                        r1.mListDimensionBehaviors[0] = DimensionBehaviour.FIXED;
                        setWidth(max);
                        z3 = USE_SNAPSHOT;
                        obj3 = 1;
                        if (r1.mListDimensionBehaviors[addChildrenToSolver] == DimensionBehaviour.WRAP_CONTENT) {
                        }
                        z = z3;
                    }
                    i3 = i7;
                    size = i5;
                }
                obj4 = obj3;
                i5 = size;
                ((ConstraintWidgetGroup) r1.mWidgetGroups.get(i)).updateUnresolvedWidgets();
                obj2 = obj4;
            } else {
                i5 = size;
            }
            i++;
            size = i5;
            i10 = 32;
        }
        r1.mChildren = arrayList;
        if (r1.mParent == null) {
            r1.mX = i8;
            r1.mY = i9;
        } else {
            i8 = Math.max(r1.mMinWidth, getWidth());
            i9 = Math.max(r1.mMinHeight, getHeight());
            r1.mSnapshot.applyTo(r1);
            setWidth((i8 + r1.mPaddingLeft) + r1.mPaddingRight);
            setHeight((i9 + r1.mPaddingTop) + r1.mPaddingBottom);
        }
        if (obj2 != null) {
            r1.mListDimensionBehaviors[0] = dimensionBehaviour3;
            r1.mListDimensionBehaviors[1] = dimensionBehaviour2;
        }
        resetSolverVariables(r1.mSystem.getCache());
        if (r1 == getRootConstraintContainer()) {
            updateDrawPosition();
        }
    }

    public void preOptimize() {
        optimizeReset();
        analyze(this.mOptimizationLevel);
    }

    public void solveGraph() {
        ResolutionAnchor resolutionNode = getAnchor(Type.LEFT).getResolutionNode();
        ResolutionAnchor resolutionNode2 = getAnchor(Type.TOP).getResolutionNode();
        resolutionNode.resolve(null, 0.0f);
        resolutionNode2.resolve(null, 0.0f);
    }

    public void resetGraph() {
        ResolutionAnchor resolutionNode = getAnchor(Type.LEFT).getResolutionNode();
        ResolutionAnchor resolutionNode2 = getAnchor(Type.TOP).getResolutionNode();
        resolutionNode.invalidateAnchors();
        resolutionNode2.invalidateAnchors();
        resolutionNode.resolve(null, 0.0f);
        resolutionNode2.resolve(null, 0.0f);
    }

    public void optimizeForDimensions(int i, int i2) {
        if (!(this.mListDimensionBehaviors[0] == DimensionBehaviour.WRAP_CONTENT || this.mResolutionWidth == null)) {
            this.mResolutionWidth.resolve(i);
        }
        if (this.mListDimensionBehaviors[1] != DimensionBehaviour.WRAP_CONTENT && this.mResolutionHeight != 0) {
            this.mResolutionHeight.resolve(i2);
        }
    }

    public void optimizeReset() {
        int size = this.mChildren.size();
        resetResolutionNodes();
        for (int i = 0; i < size; i++) {
            ((ConstraintWidget) this.mChildren.get(i)).resetResolutionNodes();
        }
    }

    public void optimize() {
        if (!optimizeFor(8)) {
            analyze(this.mOptimizationLevel);
        }
        solveGraph();
    }

    public ArrayList<Guideline> getVerticalGuidelines() {
        ArrayList<Guideline> arrayList = new ArrayList();
        int size = this.mChildren.size();
        for (int i = 0; i < size; i++) {
            ConstraintWidget constraintWidget = (ConstraintWidget) this.mChildren.get(i);
            if (constraintWidget instanceof Guideline) {
                Guideline guideline = (Guideline) constraintWidget;
                if (guideline.getOrientation() == 1) {
                    arrayList.add(guideline);
                }
            }
        }
        return arrayList;
    }

    public ArrayList<Guideline> getHorizontalGuidelines() {
        ArrayList<Guideline> arrayList = new ArrayList();
        int size = this.mChildren.size();
        for (int i = 0; i < size; i++) {
            ConstraintWidget constraintWidget = (ConstraintWidget) this.mChildren.get(i);
            if (constraintWidget instanceof Guideline) {
                Guideline guideline = (Guideline) constraintWidget;
                if (guideline.getOrientation() == 0) {
                    arrayList.add(guideline);
                }
            }
        }
        return arrayList;
    }

    public LinearSystem getSystem() {
        return this.mSystem;
    }

    private void resetChains() {
        this.mHorizontalChainsSize = 0;
        this.mVerticalChainsSize = 0;
    }

    void addChain(ConstraintWidget constraintWidget, int i) {
        if (i == 0) {
            addHorizontalChain(constraintWidget);
        } else if (i == 1) {
            addVerticalChain(constraintWidget);
        }
    }

    private void addHorizontalChain(ConstraintWidget constraintWidget) {
        int i = this.mHorizontalChainsSize + 1;
        ChainHead[] chainHeadArr = this.mHorizontalChainsArray;
        if (i >= chainHeadArr.length) {
            this.mHorizontalChainsArray = (ChainHead[]) Arrays.copyOf(chainHeadArr, chainHeadArr.length * 2);
        }
        this.mHorizontalChainsArray[this.mHorizontalChainsSize] = new ChainHead(constraintWidget, 0, isRtl());
        this.mHorizontalChainsSize++;
    }

    private void addVerticalChain(ConstraintWidget constraintWidget) {
        int i = this.mVerticalChainsSize + 1;
        ChainHead[] chainHeadArr = this.mVerticalChainsArray;
        if (i >= chainHeadArr.length) {
            this.mVerticalChainsArray = (ChainHead[]) Arrays.copyOf(chainHeadArr, chainHeadArr.length * 2);
        }
        this.mVerticalChainsArray[this.mVerticalChainsSize] = new ChainHead(constraintWidget, 1, isRtl());
        this.mVerticalChainsSize += 1;
    }

    public List<ConstraintWidgetGroup> getWidgetGroups() {
        return this.mWidgetGroups;
    }
}
