package android.support.constraint.solver.widgets;

import android.support.constraint.solver.Cache;
import android.support.constraint.solver.LinearSystem;
import android.support.constraint.solver.Metrics;
import android.support.constraint.solver.SolverVariable;
import android.support.constraint.solver.widgets.ConstraintAnchor.Strength;
import android.support.constraint.solver.widgets.ConstraintAnchor.Type;
import java.util.ArrayList;
import ooo.defcon2019.quals.veryandroidoso.BuildConfig;

public class ConstraintWidget {
    protected static final int ANCHOR_BASELINE = 4;
    protected static final int ANCHOR_BOTTOM = 3;
    protected static final int ANCHOR_LEFT = 0;
    protected static final int ANCHOR_RIGHT = 1;
    protected static final int ANCHOR_TOP = 2;
    private static final boolean AUTOTAG_CENTER = false;
    public static final int CHAIN_PACKED = 2;
    public static final int CHAIN_SPREAD = 0;
    public static final int CHAIN_SPREAD_INSIDE = 1;
    public static float DEFAULT_BIAS = 0.5f;
    static final int DIMENSION_HORIZONTAL = 0;
    static final int DIMENSION_VERTICAL = 1;
    protected static final int DIRECT = 2;
    public static final int GONE = 8;
    public static final int HORIZONTAL = 0;
    public static final int INVISIBLE = 4;
    public static final int MATCH_CONSTRAINT_PERCENT = 2;
    public static final int MATCH_CONSTRAINT_RATIO = 3;
    public static final int MATCH_CONSTRAINT_RATIO_RESOLVED = 4;
    public static final int MATCH_CONSTRAINT_SPREAD = 0;
    public static final int MATCH_CONSTRAINT_WRAP = 1;
    protected static final int SOLVER = 1;
    public static final int UNKNOWN = -1;
    public static final int VERTICAL = 1;
    public static final int VISIBLE = 0;
    private static final int WRAP = -2;
    protected ArrayList<ConstraintAnchor> mAnchors;
    ConstraintAnchor mBaseline;
    int mBaselineDistance;
    ConstraintWidgetGroup mBelongingGroup;
    ConstraintAnchor mBottom;
    boolean mBottomHasCentered;
    ConstraintAnchor mCenter;
    ConstraintAnchor mCenterX;
    ConstraintAnchor mCenterY;
    private float mCircleConstraintAngle;
    private Object mCompanionWidget;
    private int mContainerItemSkip;
    private String mDebugName;
    protected float mDimensionRatio;
    protected int mDimensionRatioSide;
    int mDistToBottom;
    int mDistToLeft;
    int mDistToRight;
    int mDistToTop;
    private int mDrawHeight;
    private int mDrawWidth;
    private int mDrawX;
    private int mDrawY;
    boolean mGroupsToSolver;
    int mHeight;
    float mHorizontalBiasPercent;
    boolean mHorizontalChainFixedPosition;
    int mHorizontalChainStyle;
    ConstraintWidget mHorizontalNextWidget;
    public int mHorizontalResolution;
    boolean mHorizontalWrapVisited;
    boolean mIsHeightWrapContent;
    boolean mIsWidthWrapContent;
    ConstraintAnchor mLeft;
    boolean mLeftHasCentered;
    protected ConstraintAnchor[] mListAnchors;
    protected DimensionBehaviour[] mListDimensionBehaviors;
    protected ConstraintWidget[] mListNextMatchConstraintsWidget;
    int mMatchConstraintDefaultHeight;
    int mMatchConstraintDefaultWidth;
    int mMatchConstraintMaxHeight;
    int mMatchConstraintMaxWidth;
    int mMatchConstraintMinHeight;
    int mMatchConstraintMinWidth;
    float mMatchConstraintPercentHeight;
    float mMatchConstraintPercentWidth;
    private int[] mMaxDimension;
    protected int mMinHeight;
    protected int mMinWidth;
    protected ConstraintWidget[] mNextChainWidget;
    protected int mOffsetX;
    protected int mOffsetY;
    boolean mOptimizerMeasurable;
    boolean mOptimizerMeasured;
    ConstraintWidget mParent;
    int mRelX;
    int mRelY;
    ResolutionDimension mResolutionHeight;
    ResolutionDimension mResolutionWidth;
    float mResolvedDimensionRatio;
    int mResolvedDimensionRatioSide;
    int[] mResolvedMatchConstraintDefault;
    ConstraintAnchor mRight;
    boolean mRightHasCentered;
    ConstraintAnchor mTop;
    boolean mTopHasCentered;
    private String mType;
    float mVerticalBiasPercent;
    boolean mVerticalChainFixedPosition;
    int mVerticalChainStyle;
    ConstraintWidget mVerticalNextWidget;
    public int mVerticalResolution;
    boolean mVerticalWrapVisited;
    private int mVisibility;
    float[] mWeight;
    int mWidth;
    private int mWrapHeight;
    private int mWrapWidth;
    protected int mX;
    protected int mY;

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

    public enum DimensionBehaviour {
        FIXED,
        WRAP_CONTENT,
        MATCH_CONSTRAINT,
        MATCH_PARENT
    }

    public void connectedTo(ConstraintWidget constraintWidget) {
    }

    public void resolve() {
    }

    public int getMaxHeight() {
        return this.mMaxDimension[1];
    }

    public int getMaxWidth() {
        return this.mMaxDimension[0];
    }

    public void setMaxWidth(int i) {
        this.mMaxDimension[0] = i;
    }

    public void setMaxHeight(int i) {
        this.mMaxDimension[1] = i;
    }

    public boolean isSpreadWidth() {
        return this.mMatchConstraintDefaultWidth == 0 && this.mDimensionRatio == 0.0f && this.mMatchConstraintMinWidth == 0 && this.mMatchConstraintMaxWidth == 0 && this.mListDimensionBehaviors[0] == DimensionBehaviour.MATCH_CONSTRAINT;
    }

    public boolean isSpreadHeight() {
        return this.mMatchConstraintDefaultHeight == 0 && this.mDimensionRatio == 0.0f && this.mMatchConstraintMinHeight == 0 && this.mMatchConstraintMaxHeight == 0 && this.mListDimensionBehaviors[1] == DimensionBehaviour.MATCH_CONSTRAINT;
    }

    public void reset() {
        this.mLeft.reset();
        this.mTop.reset();
        this.mRight.reset();
        this.mBottom.reset();
        this.mBaseline.reset();
        this.mCenterX.reset();
        this.mCenterY.reset();
        this.mCenter.reset();
        this.mParent = null;
        this.mCircleConstraintAngle = 0.0f;
        this.mWidth = 0;
        this.mHeight = 0;
        this.mDimensionRatio = 0.0f;
        this.mDimensionRatioSide = -1;
        this.mX = 0;
        this.mY = 0;
        this.mDrawX = 0;
        this.mDrawY = 0;
        this.mDrawWidth = 0;
        this.mDrawHeight = 0;
        this.mOffsetX = 0;
        this.mOffsetY = 0;
        this.mBaselineDistance = 0;
        this.mMinWidth = 0;
        this.mMinHeight = 0;
        this.mWrapWidth = 0;
        this.mWrapHeight = 0;
        float f = DEFAULT_BIAS;
        this.mHorizontalBiasPercent = f;
        this.mVerticalBiasPercent = f;
        this.mListDimensionBehaviors[0] = DimensionBehaviour.FIXED;
        this.mListDimensionBehaviors[1] = DimensionBehaviour.FIXED;
        this.mCompanionWidget = null;
        this.mContainerItemSkip = 0;
        this.mVisibility = 0;
        this.mType = null;
        this.mHorizontalWrapVisited = false;
        this.mVerticalWrapVisited = false;
        this.mHorizontalChainStyle = 0;
        this.mVerticalChainStyle = 0;
        this.mHorizontalChainFixedPosition = false;
        this.mVerticalChainFixedPosition = false;
        float[] fArr = this.mWeight;
        fArr[0] = -1.0f;
        fArr[1] = -1.0f;
        this.mHorizontalResolution = -1;
        this.mVerticalResolution = -1;
        int[] iArr = this.mMaxDimension;
        iArr[0] = Integer.MAX_VALUE;
        iArr[1] = Integer.MAX_VALUE;
        this.mMatchConstraintDefaultWidth = 0;
        this.mMatchConstraintDefaultHeight = 0;
        this.mMatchConstraintPercentWidth = 1.0f;
        this.mMatchConstraintPercentHeight = 1.0f;
        this.mMatchConstraintMaxWidth = Integer.MAX_VALUE;
        this.mMatchConstraintMaxHeight = Integer.MAX_VALUE;
        this.mMatchConstraintMinWidth = 0;
        this.mMatchConstraintMinHeight = 0;
        this.mResolvedDimensionRatioSide = -1;
        this.mResolvedDimensionRatio = 1.0f;
        ResolutionDimension resolutionDimension = this.mResolutionWidth;
        if (resolutionDimension != null) {
            resolutionDimension.reset();
        }
        resolutionDimension = this.mResolutionHeight;
        if (resolutionDimension != null) {
            resolutionDimension.reset();
        }
        this.mBelongingGroup = null;
        this.mOptimizerMeasurable = false;
        this.mOptimizerMeasured = false;
        this.mGroupsToSolver = false;
    }

    public void resetResolutionNodes() {
        for (int i = 0; i < 6; i++) {
            this.mListAnchors[i].getResolutionNode().reset();
        }
    }

    public void updateResolutionNodes() {
        for (int i = 0; i < 6; i++) {
            this.mListAnchors[i].getResolutionNode().update();
        }
    }

    public void analyze(int i) {
        Optimizer.analyze(i, this);
    }

    public boolean isFullyResolved() {
        if (this.mLeft.getResolutionNode().state == 1 && this.mRight.getResolutionNode().state == 1 && this.mTop.getResolutionNode().state == 1 && this.mBottom.getResolutionNode().state == 1) {
            return true;
        }
        return false;
    }

    public ResolutionDimension getResolutionWidth() {
        if (this.mResolutionWidth == null) {
            this.mResolutionWidth = new ResolutionDimension();
        }
        return this.mResolutionWidth;
    }

    public ResolutionDimension getResolutionHeight() {
        if (this.mResolutionHeight == null) {
            this.mResolutionHeight = new ResolutionDimension();
        }
        return this.mResolutionHeight;
    }

    public ConstraintWidget() {
        this.mHorizontalResolution = -1;
        this.mVerticalResolution = -1;
        this.mMatchConstraintDefaultWidth = 0;
        this.mMatchConstraintDefaultHeight = 0;
        this.mResolvedMatchConstraintDefault = new int[2];
        this.mMatchConstraintMinWidth = 0;
        this.mMatchConstraintMaxWidth = 0;
        this.mMatchConstraintPercentWidth = 1.0f;
        this.mMatchConstraintMinHeight = 0;
        this.mMatchConstraintMaxHeight = 0;
        this.mMatchConstraintPercentHeight = 1.0f;
        this.mResolvedDimensionRatioSide = -1;
        this.mResolvedDimensionRatio = 1.0f;
        this.mBelongingGroup = null;
        this.mMaxDimension = new int[]{Integer.MAX_VALUE, Integer.MAX_VALUE};
        this.mCircleConstraintAngle = 0.0f;
        this.mLeft = new ConstraintAnchor(this, Type.LEFT);
        this.mTop = new ConstraintAnchor(this, Type.TOP);
        this.mRight = new ConstraintAnchor(this, Type.RIGHT);
        this.mBottom = new ConstraintAnchor(this, Type.BOTTOM);
        this.mBaseline = new ConstraintAnchor(this, Type.BASELINE);
        this.mCenterX = new ConstraintAnchor(this, Type.CENTER_X);
        this.mCenterY = new ConstraintAnchor(this, Type.CENTER_Y);
        this.mCenter = new ConstraintAnchor(this, Type.CENTER);
        this.mListAnchors = new ConstraintAnchor[]{this.mLeft, this.mRight, this.mTop, this.mBottom, this.mBaseline, this.mCenter};
        this.mAnchors = new ArrayList();
        this.mListDimensionBehaviors = new DimensionBehaviour[]{DimensionBehaviour.FIXED, DimensionBehaviour.FIXED};
        this.mParent = null;
        this.mWidth = 0;
        this.mHeight = 0;
        this.mDimensionRatio = 0.0f;
        this.mDimensionRatioSide = -1;
        this.mX = 0;
        this.mY = 0;
        this.mRelX = 0;
        this.mRelY = 0;
        this.mDrawX = 0;
        this.mDrawY = 0;
        this.mDrawWidth = 0;
        this.mDrawHeight = 0;
        this.mOffsetX = 0;
        this.mOffsetY = 0;
        this.mBaselineDistance = 0;
        float f = DEFAULT_BIAS;
        this.mHorizontalBiasPercent = f;
        this.mVerticalBiasPercent = f;
        this.mContainerItemSkip = 0;
        this.mVisibility = 0;
        this.mDebugName = null;
        this.mType = null;
        this.mOptimizerMeasurable = false;
        this.mOptimizerMeasured = false;
        this.mGroupsToSolver = false;
        this.mHorizontalChainStyle = 0;
        this.mVerticalChainStyle = 0;
        this.mWeight = new float[]{-1.0f, -1.0f};
        this.mListNextMatchConstraintsWidget = new ConstraintWidget[]{null, null};
        this.mNextChainWidget = new ConstraintWidget[]{null, null};
        this.mHorizontalNextWidget = null;
        this.mVerticalNextWidget = null;
        addAnchors();
    }

    public ConstraintWidget(int i, int i2, int i3, int i4) {
        this.mHorizontalResolution = -1;
        this.mVerticalResolution = -1;
        this.mMatchConstraintDefaultWidth = 0;
        this.mMatchConstraintDefaultHeight = 0;
        this.mResolvedMatchConstraintDefault = new int[2];
        this.mMatchConstraintMinWidth = 0;
        this.mMatchConstraintMaxWidth = 0;
        this.mMatchConstraintPercentWidth = 1.0f;
        this.mMatchConstraintMinHeight = 0;
        this.mMatchConstraintMaxHeight = 0;
        this.mMatchConstraintPercentHeight = 1.0f;
        this.mResolvedDimensionRatioSide = -1;
        this.mResolvedDimensionRatio = 1.0f;
        this.mBelongingGroup = null;
        this.mMaxDimension = new int[]{Integer.MAX_VALUE, Integer.MAX_VALUE};
        this.mCircleConstraintAngle = 0.0f;
        this.mLeft = new ConstraintAnchor(this, Type.LEFT);
        this.mTop = new ConstraintAnchor(this, Type.TOP);
        this.mRight = new ConstraintAnchor(this, Type.RIGHT);
        this.mBottom = new ConstraintAnchor(this, Type.BOTTOM);
        this.mBaseline = new ConstraintAnchor(this, Type.BASELINE);
        this.mCenterX = new ConstraintAnchor(this, Type.CENTER_X);
        this.mCenterY = new ConstraintAnchor(this, Type.CENTER_Y);
        this.mCenter = new ConstraintAnchor(this, Type.CENTER);
        this.mListAnchors = new ConstraintAnchor[]{this.mLeft, this.mRight, this.mTop, this.mBottom, this.mBaseline, this.mCenter};
        this.mAnchors = new ArrayList();
        this.mListDimensionBehaviors = new DimensionBehaviour[]{DimensionBehaviour.FIXED, DimensionBehaviour.FIXED};
        this.mParent = null;
        this.mWidth = 0;
        this.mHeight = 0;
        this.mDimensionRatio = 0.0f;
        this.mDimensionRatioSide = -1;
        this.mX = 0;
        this.mY = 0;
        this.mRelX = 0;
        this.mRelY = 0;
        this.mDrawX = 0;
        this.mDrawY = 0;
        this.mDrawWidth = 0;
        this.mDrawHeight = 0;
        this.mOffsetX = 0;
        this.mOffsetY = 0;
        this.mBaselineDistance = 0;
        float f = DEFAULT_BIAS;
        this.mHorizontalBiasPercent = f;
        this.mVerticalBiasPercent = f;
        this.mContainerItemSkip = 0;
        this.mVisibility = 0;
        this.mDebugName = null;
        this.mType = null;
        this.mOptimizerMeasurable = false;
        this.mOptimizerMeasured = false;
        this.mGroupsToSolver = false;
        this.mHorizontalChainStyle = 0;
        this.mVerticalChainStyle = 0;
        this.mWeight = new float[]{-1.0f, -1.0f};
        this.mListNextMatchConstraintsWidget = new ConstraintWidget[]{null, null};
        this.mNextChainWidget = new ConstraintWidget[]{null, null};
        this.mHorizontalNextWidget = null;
        this.mVerticalNextWidget = null;
        this.mX = i;
        this.mY = i2;
        this.mWidth = i3;
        this.mHeight = i4;
        addAnchors();
        forceUpdateDrawPosition();
    }

    public ConstraintWidget(int i, int i2) {
        this(0, 0, i, i2);
    }

    public void resetSolverVariables(Cache cache) {
        this.mLeft.resetSolverVariable(cache);
        this.mTop.resetSolverVariable(cache);
        this.mRight.resetSolverVariable(cache);
        this.mBottom.resetSolverVariable(cache);
        this.mBaseline.resetSolverVariable(cache);
        this.mCenter.resetSolverVariable(cache);
        this.mCenterX.resetSolverVariable(cache);
        this.mCenterY.resetSolverVariable(cache);
    }

    private void addAnchors() {
        this.mAnchors.add(this.mLeft);
        this.mAnchors.add(this.mTop);
        this.mAnchors.add(this.mRight);
        this.mAnchors.add(this.mBottom);
        this.mAnchors.add(this.mCenterX);
        this.mAnchors.add(this.mCenterY);
        this.mAnchors.add(this.mCenter);
        this.mAnchors.add(this.mBaseline);
    }

    public boolean isRoot() {
        return this.mParent == null;
    }

    public boolean isRootContainer() {
        if (this instanceof ConstraintWidgetContainer) {
            ConstraintWidget constraintWidget = this.mParent;
            if (constraintWidget == null || !(constraintWidget instanceof ConstraintWidgetContainer)) {
                return true;
            }
        }
        return false;
    }

    public boolean isInsideConstraintLayout() {
        ConstraintWidget parent = getParent();
        if (parent == null) {
            return false;
        }
        while (parent != null) {
            if (parent instanceof ConstraintWidgetContainer) {
                return true;
            }
            parent = parent.getParent();
        }
        return false;
    }

    public boolean hasAncestor(ConstraintWidget constraintWidget) {
        ConstraintWidget parent = getParent();
        if (parent == constraintWidget) {
            return true;
        }
        if (parent == constraintWidget.getParent()) {
            return false;
        }
        while (parent != null) {
            if (parent == constraintWidget || parent == constraintWidget.getParent()) {
                return true;
            }
            parent = parent.getParent();
        }
        return false;
    }

    public WidgetContainer getRootWidgetContainer() {
        ConstraintWidget constraintWidget = this;
        while (constraintWidget.getParent() != null) {
            constraintWidget = constraintWidget.getParent();
        }
        return constraintWidget instanceof WidgetContainer ? (WidgetContainer) constraintWidget : null;
    }

    public ConstraintWidget getParent() {
        return this.mParent;
    }

    public void setParent(ConstraintWidget constraintWidget) {
        this.mParent = constraintWidget;
    }

    public void setWidthWrapContent(boolean z) {
        this.mIsWidthWrapContent = z;
    }

    public boolean isWidthWrapContent() {
        return this.mIsWidthWrapContent;
    }

    public void setHeightWrapContent(boolean z) {
        this.mIsHeightWrapContent = z;
    }

    public boolean isHeightWrapContent() {
        return this.mIsHeightWrapContent;
    }

    public void connectCircularConstraint(ConstraintWidget constraintWidget, float f, int i) {
        immediateConnect(Type.CENTER, constraintWidget, Type.CENTER, i, 0);
        this.mCircleConstraintAngle = f;
    }

    public String getType() {
        return this.mType;
    }

    public void setType(String str) {
        this.mType = str;
    }

    public void setVisibility(int i) {
        this.mVisibility = i;
    }

    public int getVisibility() {
        return this.mVisibility;
    }

    public String getDebugName() {
        return this.mDebugName;
    }

    public void setDebugName(String str) {
        this.mDebugName = str;
    }

    public void setDebugSolverName(LinearSystem linearSystem, String str) {
        this.mDebugName = str;
        SolverVariable createObjectVariable = linearSystem.createObjectVariable(this.mLeft);
        SolverVariable createObjectVariable2 = linearSystem.createObjectVariable(this.mTop);
        SolverVariable createObjectVariable3 = linearSystem.createObjectVariable(this.mRight);
        SolverVariable createObjectVariable4 = linearSystem.createObjectVariable(this.mBottom);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(".left");
        createObjectVariable.setName(stringBuilder.toString());
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append(str);
        stringBuilder2.append(".top");
        createObjectVariable2.setName(stringBuilder2.toString());
        stringBuilder2 = new StringBuilder();
        stringBuilder2.append(str);
        stringBuilder2.append(".right");
        createObjectVariable3.setName(stringBuilder2.toString());
        stringBuilder2 = new StringBuilder();
        stringBuilder2.append(str);
        stringBuilder2.append(".bottom");
        createObjectVariable4.setName(stringBuilder2.toString());
        if (this.mBaselineDistance > 0) {
            linearSystem = linearSystem.createObjectVariable(this.mBaseline);
            stringBuilder2 = new StringBuilder();
            stringBuilder2.append(str);
            stringBuilder2.append(".baseline");
            linearSystem.setName(stringBuilder2.toString());
        }
    }

    public void createObjectVariables(LinearSystem linearSystem) {
        linearSystem.createObjectVariable(this.mLeft);
        linearSystem.createObjectVariable(this.mTop);
        linearSystem.createObjectVariable(this.mRight);
        linearSystem.createObjectVariable(this.mBottom);
        if (this.mBaselineDistance > 0) {
            linearSystem.createObjectVariable(this.mBaseline);
        }
    }

    public String toString() {
        String stringBuilder;
        StringBuilder stringBuilder2 = new StringBuilder();
        if (this.mType != null) {
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append("type: ");
            stringBuilder3.append(this.mType);
            stringBuilder3.append(" ");
            stringBuilder = stringBuilder3.toString();
        } else {
            stringBuilder = BuildConfig.FLAVOR;
        }
        stringBuilder2.append(stringBuilder);
        if (this.mDebugName != null) {
            stringBuilder3 = new StringBuilder();
            stringBuilder3.append("id: ");
            stringBuilder3.append(this.mDebugName);
            stringBuilder3.append(" ");
            stringBuilder = stringBuilder3.toString();
        } else {
            stringBuilder = BuildConfig.FLAVOR;
        }
        stringBuilder2.append(stringBuilder);
        stringBuilder2.append("(");
        stringBuilder2.append(this.mX);
        stringBuilder2.append(", ");
        stringBuilder2.append(this.mY);
        stringBuilder2.append(") - (");
        stringBuilder2.append(this.mWidth);
        stringBuilder2.append(" x ");
        stringBuilder2.append(this.mHeight);
        stringBuilder2.append(") wrap: (");
        stringBuilder2.append(this.mWrapWidth);
        stringBuilder2.append(" x ");
        stringBuilder2.append(this.mWrapHeight);
        stringBuilder2.append(")");
        return stringBuilder2.toString();
    }

    int getInternalDrawX() {
        return this.mDrawX;
    }

    int getInternalDrawY() {
        return this.mDrawY;
    }

    public int getInternalDrawRight() {
        return this.mDrawX + this.mDrawWidth;
    }

    public int getInternalDrawBottom() {
        return this.mDrawY + this.mDrawHeight;
    }

    public int getX() {
        return this.mX;
    }

    public int getY() {
        return this.mY;
    }

    public int getWidth() {
        if (this.mVisibility == 8) {
            return 0;
        }
        return this.mWidth;
    }

    public int getOptimizerWrapWidth() {
        int i = this.mWidth;
        if (this.mListDimensionBehaviors[0] != DimensionBehaviour.MATCH_CONSTRAINT) {
            return i;
        }
        if (this.mMatchConstraintDefaultWidth == 1) {
            i = Math.max(this.mMatchConstraintMinWidth, i);
        } else {
            i = this.mMatchConstraintMinWidth;
            if (i > 0) {
                this.mWidth = i;
            } else {
                i = 0;
            }
        }
        int i2 = this.mMatchConstraintMaxWidth;
        return (i2 <= 0 || i2 >= i) ? i : i2;
    }

    public int getOptimizerWrapHeight() {
        int i = this.mHeight;
        if (this.mListDimensionBehaviors[1] != DimensionBehaviour.MATCH_CONSTRAINT) {
            return i;
        }
        if (this.mMatchConstraintDefaultHeight == 1) {
            i = Math.max(this.mMatchConstraintMinHeight, i);
        } else {
            i = this.mMatchConstraintMinHeight;
            if (i > 0) {
                this.mHeight = i;
            } else {
                i = 0;
            }
        }
        int i2 = this.mMatchConstraintMaxHeight;
        return (i2 <= 0 || i2 >= i) ? i : i2;
    }

    public int getWrapWidth() {
        return this.mWrapWidth;
    }

    public int getHeight() {
        if (this.mVisibility == 8) {
            return 0;
        }
        return this.mHeight;
    }

    public int getWrapHeight() {
        return this.mWrapHeight;
    }

    public int getLength(int i) {
        if (i == 0) {
            return getWidth();
        }
        return i == 1 ? getHeight() : 0;
    }

    public int getDrawX() {
        return this.mDrawX + this.mOffsetX;
    }

    public int getDrawY() {
        return this.mDrawY + this.mOffsetY;
    }

    public int getDrawWidth() {
        return this.mDrawWidth;
    }

    public int getDrawHeight() {
        return this.mDrawHeight;
    }

    public int getDrawBottom() {
        return getDrawY() + this.mDrawHeight;
    }

    public int getDrawRight() {
        return getDrawX() + this.mDrawWidth;
    }

    protected int getRootX() {
        return this.mX + this.mOffsetX;
    }

    protected int getRootY() {
        return this.mY + this.mOffsetY;
    }

    public int getMinWidth() {
        return this.mMinWidth;
    }

    public int getMinHeight() {
        return this.mMinHeight;
    }

    public int getLeft() {
        return getX();
    }

    public int getTop() {
        return getY();
    }

    public int getRight() {
        return getX() + this.mWidth;
    }

    public int getBottom() {
        return getY() + this.mHeight;
    }

    public float getHorizontalBiasPercent() {
        return this.mHorizontalBiasPercent;
    }

    public float getVerticalBiasPercent() {
        return this.mVerticalBiasPercent;
    }

    public float getBiasPercent(int i) {
        if (i == 0) {
            return this.mHorizontalBiasPercent;
        }
        return i == 1 ? this.mVerticalBiasPercent : -1082130432;
    }

    public boolean hasBaseline() {
        return this.mBaselineDistance > 0;
    }

    public int getBaselineDistance() {
        return this.mBaselineDistance;
    }

    public Object getCompanionWidget() {
        return this.mCompanionWidget;
    }

    public ArrayList<ConstraintAnchor> getAnchors() {
        return this.mAnchors;
    }

    public void setX(int i) {
        this.mX = i;
    }

    public void setY(int i) {
        this.mY = i;
    }

    public void setOrigin(int i, int i2) {
        this.mX = i;
        this.mY = i2;
    }

    public void setOffset(int i, int i2) {
        this.mOffsetX = i;
        this.mOffsetY = i2;
    }

    public void setGoneMargin(Type type, int i) {
        switch (type) {
            case LEFT:
                this.mLeft.mGoneMargin = i;
                return;
            case TOP:
                this.mTop.mGoneMargin = i;
                return;
            case RIGHT:
                this.mRight.mGoneMargin = i;
                return;
            case BOTTOM:
                this.mBottom.mGoneMargin = i;
                return;
            default:
                return;
        }
    }

    public void updateDrawPosition() {
        int i = this.mX;
        int i2 = this.mY;
        int i3 = this.mWidth + i;
        int i4 = this.mHeight + i2;
        this.mDrawX = i;
        this.mDrawY = i2;
        this.mDrawWidth = i3 - i;
        this.mDrawHeight = i4 - i2;
    }

    public void forceUpdateDrawPosition() {
        int i = this.mX;
        int i2 = this.mY;
        int i3 = this.mWidth + i;
        int i4 = this.mHeight + i2;
        this.mDrawX = i;
        this.mDrawY = i2;
        this.mDrawWidth = i3 - i;
        this.mDrawHeight = i4 - i2;
    }

    public void setDrawOrigin(int i, int i2) {
        this.mDrawX = i - this.mOffsetX;
        this.mDrawY = i2 - this.mOffsetY;
        this.mX = this.mDrawX;
        this.mY = this.mDrawY;
    }

    public void setDrawX(int i) {
        this.mDrawX = i - this.mOffsetX;
        this.mX = this.mDrawX;
    }

    public void setDrawY(int i) {
        this.mDrawY = i - this.mOffsetY;
        this.mY = this.mDrawY;
    }

    public void setDrawWidth(int i) {
        this.mDrawWidth = i;
    }

    public void setDrawHeight(int i) {
        this.mDrawHeight = i;
    }

    public void setWidth(int i) {
        this.mWidth = i;
        i = this.mWidth;
        int i2 = this.mMinWidth;
        if (i < i2) {
            this.mWidth = i2;
        }
    }

    public void setHeight(int i) {
        this.mHeight = i;
        i = this.mHeight;
        int i2 = this.mMinHeight;
        if (i < i2) {
            this.mHeight = i2;
        }
    }

    public void setLength(int i, int i2) {
        if (i2 == 0) {
            setWidth(i);
        } else if (i2 == 1) {
            setHeight(i);
        }
    }

    public void setHorizontalMatchStyle(int i, int i2, int i3, float f) {
        this.mMatchConstraintDefaultWidth = i;
        this.mMatchConstraintMinWidth = i2;
        this.mMatchConstraintMaxWidth = i3;
        this.mMatchConstraintPercentWidth = f;
        if (f < 1065353216 && this.mMatchConstraintDefaultWidth == 0) {
            this.mMatchConstraintDefaultWidth = 2;
        }
    }

    public void setVerticalMatchStyle(int i, int i2, int i3, float f) {
        this.mMatchConstraintDefaultHeight = i;
        this.mMatchConstraintMinHeight = i2;
        this.mMatchConstraintMaxHeight = i3;
        this.mMatchConstraintPercentHeight = f;
        if (f < 1065353216 && this.mMatchConstraintDefaultHeight == 0) {
            this.mMatchConstraintDefaultHeight = 2;
        }
    }

    public void setDimensionRatio(java.lang.String r9) {
        /* JADX: method processing error */
/*
Error: java.lang.NullPointerException
	at jadx.core.dex.visitors.regions.ProcessTryCatchRegions.searchTryCatchDominators(ProcessTryCatchRegions.java:75)
	at jadx.core.dex.visitors.regions.ProcessTryCatchRegions.process(ProcessTryCatchRegions.java:45)
	at jadx.core.dex.visitors.regions.RegionMakerVisitor.postProcessRegions(RegionMakerVisitor.java:63)
	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:58)
	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:31)
	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:17)
	at jadx.core.ProcessClass.process(ProcessClass.java:34)
	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:56)
	at jadx.core.ProcessClass.process(ProcessClass.java:39)
	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:282)
	at jadx.api.JavaClass.decompile(JavaClass.java:62)
	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:200)
	at jadx.api.JadxDecompiler$$Lambda$8/1860513229.run(Unknown Source)
*/
        /*
        r8 = this;
        r0 = 0;
        if (r9 == 0) goto L_0x0092;
    L_0x0003:
        r1 = r9.length();
        if (r1 != 0) goto L_0x000b;
    L_0x0009:
        goto L_0x0092;
    L_0x000b:
        r1 = -1;
        r2 = r9.length();
        r3 = 44;
        r3 = r9.indexOf(r3);
        r4 = 0;
        r5 = 1;
        if (r3 <= 0) goto L_0x0037;
    L_0x001a:
        r6 = r2 + -1;
        if (r3 >= r6) goto L_0x0037;
    L_0x001e:
        r6 = r9.substring(r4, r3);
        r7 = "W";
        r7 = r6.equalsIgnoreCase(r7);
        if (r7 == 0) goto L_0x002c;
    L_0x002a:
        r1 = 0;
        goto L_0x0035;
    L_0x002c:
        r4 = "H";
        r4 = r6.equalsIgnoreCase(r4);
        if (r4 == 0) goto L_0x0035;
    L_0x0034:
        r1 = 1;
    L_0x0035:
        r4 = r3 + 1;
    L_0x0037:
        r3 = 58;
        r3 = r9.indexOf(r3);
        if (r3 < 0) goto L_0x0079;
    L_0x003f:
        r2 = r2 - r5;
        if (r3 >= r2) goto L_0x0079;
    L_0x0042:
        r2 = r9.substring(r4, r3);
        r3 = r3 + r5;
        r9 = r9.substring(r3);
        r3 = r2.length();
        if (r3 <= 0) goto L_0x0077;
    L_0x0051:
        r3 = r9.length();
        if (r3 <= 0) goto L_0x0077;
    L_0x0057:
        r2 = java.lang.Float.parseFloat(r2);	 Catch:{ NumberFormatException -> 0x0077 }
        r9 = java.lang.Float.parseFloat(r9);	 Catch:{ NumberFormatException -> 0x0077 }
        r3 = (r2 > r0 ? 1 : (r2 == r0 ? 0 : -1));	 Catch:{ NumberFormatException -> 0x0077 }
        if (r3 <= 0) goto L_0x0075;	 Catch:{ NumberFormatException -> 0x0077 }
    L_0x0063:
        r3 = (r9 > r0 ? 1 : (r9 == r0 ? 0 : -1));	 Catch:{ NumberFormatException -> 0x0077 }
        if (r3 <= 0) goto L_0x0075;	 Catch:{ NumberFormatException -> 0x0077 }
    L_0x0067:
        if (r1 != r5) goto L_0x006f;	 Catch:{ NumberFormatException -> 0x0077 }
    L_0x0069:
        r9 = r9 / r2;	 Catch:{ NumberFormatException -> 0x0077 }
        r9 = java.lang.Math.abs(r9);	 Catch:{ NumberFormatException -> 0x0077 }
        goto L_0x0089;	 Catch:{ NumberFormatException -> 0x0077 }
    L_0x006f:
        r2 = r2 / r9;	 Catch:{ NumberFormatException -> 0x0077 }
        r9 = java.lang.Math.abs(r2);	 Catch:{ NumberFormatException -> 0x0077 }
        goto L_0x0089;
    L_0x0075:
        r9 = 0;
        goto L_0x0089;
    L_0x0077:
        r9 = 0;
        goto L_0x0089;
    L_0x0079:
        r9 = r9.substring(r4);
        r2 = r9.length();
        if (r2 <= 0) goto L_0x0088;
    L_0x0083:
        r9 = java.lang.Float.parseFloat(r9);	 Catch:{ NumberFormatException -> 0x0088 }
        goto L_0x0089;
    L_0x0088:
        r9 = 0;
    L_0x0089:
        r0 = (r9 > r0 ? 1 : (r9 == r0 ? 0 : -1));
        if (r0 <= 0) goto L_0x0091;
    L_0x008d:
        r8.mDimensionRatio = r9;
        r8.mDimensionRatioSide = r1;
    L_0x0091:
        return;
    L_0x0092:
        r8.mDimensionRatio = r0;
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.constraint.solver.widgets.ConstraintWidget.setDimensionRatio(java.lang.String):void");
    }

    public void setDimensionRatio(float f, int i) {
        this.mDimensionRatio = f;
        this.mDimensionRatioSide = i;
    }

    public float getDimensionRatio() {
        return this.mDimensionRatio;
    }

    public int getDimensionRatioSide() {
        return this.mDimensionRatioSide;
    }

    public void setHorizontalBiasPercent(float f) {
        this.mHorizontalBiasPercent = f;
    }

    public void setVerticalBiasPercent(float f) {
        this.mVerticalBiasPercent = f;
    }

    public void setMinWidth(int i) {
        if (i < 0) {
            this.mMinWidth = 0;
        } else {
            this.mMinWidth = i;
        }
    }

    public void setMinHeight(int i) {
        if (i < 0) {
            this.mMinHeight = 0;
        } else {
            this.mMinHeight = i;
        }
    }

    public void setWrapWidth(int i) {
        this.mWrapWidth = i;
    }

    public void setWrapHeight(int i) {
        this.mWrapHeight = i;
    }

    public void setDimension(int i, int i2) {
        this.mWidth = i;
        i = this.mWidth;
        int i3 = this.mMinWidth;
        if (i < i3) {
            this.mWidth = i3;
        }
        this.mHeight = i2;
        i = this.mHeight;
        i2 = this.mMinHeight;
        if (i < i2) {
            this.mHeight = i2;
        }
    }

    public void setFrame(int i, int i2, int i3, int i4) {
        i3 -= i;
        i4 -= i2;
        this.mX = i;
        this.mY = i2;
        if (this.mVisibility == 8) {
            this.mWidth = 0;
            this.mHeight = 0;
            return;
        }
        if (this.mListDimensionBehaviors[0] == DimensionBehaviour.FIXED) {
            i = this.mWidth;
            if (i3 < i) {
                if (this.mListDimensionBehaviors[1] == DimensionBehaviour.FIXED) {
                    i2 = this.mHeight;
                    if (i4 < i2) {
                        this.mWidth = i;
                        this.mHeight = i2;
                        i = this.mHeight;
                        i2 = this.mMinHeight;
                        if (i < i2) {
                            this.mHeight = i2;
                        }
                        i = this.mWidth;
                        i2 = this.mMinWidth;
                        if (i < i2) {
                            this.mWidth = i2;
                        }
                        this.mOptimizerMeasured = true;
                    }
                }
                i2 = i4;
                this.mWidth = i;
                this.mHeight = i2;
                i = this.mHeight;
                i2 = this.mMinHeight;
                if (i < i2) {
                    this.mHeight = i2;
                }
                i = this.mWidth;
                i2 = this.mMinWidth;
                if (i < i2) {
                    this.mWidth = i2;
                }
                this.mOptimizerMeasured = true;
            }
        }
        i = i3;
        if (this.mListDimensionBehaviors[1] == DimensionBehaviour.FIXED) {
            i2 = this.mHeight;
            if (i4 < i2) {
                this.mWidth = i;
                this.mHeight = i2;
                i = this.mHeight;
                i2 = this.mMinHeight;
                if (i < i2) {
                    this.mHeight = i2;
                }
                i = this.mWidth;
                i2 = this.mMinWidth;
                if (i < i2) {
                    this.mWidth = i2;
                }
                this.mOptimizerMeasured = true;
            }
        }
        i2 = i4;
        this.mWidth = i;
        this.mHeight = i2;
        i = this.mHeight;
        i2 = this.mMinHeight;
        if (i < i2) {
            this.mHeight = i2;
        }
        i = this.mWidth;
        i2 = this.mMinWidth;
        if (i < i2) {
            this.mWidth = i2;
        }
        this.mOptimizerMeasured = true;
    }

    public void setFrame(int i, int i2, int i3) {
        if (i3 == 0) {
            setHorizontalDimension(i, i2);
        } else if (i3 == 1) {
            setVerticalDimension(i, i2);
        }
        this.mOptimizerMeasured = true;
    }

    public void setHorizontalDimension(int i, int i2) {
        this.mX = i;
        this.mWidth = i2 - i;
        i = this.mWidth;
        i2 = this.mMinWidth;
        if (i < i2) {
            this.mWidth = i2;
        }
    }

    public void setVerticalDimension(int i, int i2) {
        this.mY = i;
        this.mHeight = i2 - i;
        i = this.mHeight;
        i2 = this.mMinHeight;
        if (i < i2) {
            this.mHeight = i2;
        }
    }

    int getRelativePositioning(int i) {
        if (i == 0) {
            return this.mRelX;
        }
        return i == 1 ? this.mRelY : 0;
    }

    void setRelativePositioning(int i, int i2) {
        if (i2 == 0) {
            this.mRelX = i;
        } else if (i2 == 1) {
            this.mRelY = i;
        }
    }

    public void setBaselineDistance(int i) {
        this.mBaselineDistance = i;
    }

    public void setCompanionWidget(Object obj) {
        this.mCompanionWidget = obj;
    }

    public void setContainerItemSkip(int i) {
        if (i >= 0) {
            this.mContainerItemSkip = i;
        } else {
            this.mContainerItemSkip = 0;
        }
    }

    public int getContainerItemSkip() {
        return this.mContainerItemSkip;
    }

    public void setHorizontalWeight(float f) {
        this.mWeight[0] = f;
    }

    public void setVerticalWeight(float f) {
        this.mWeight[1] = f;
    }

    public void setHorizontalChainStyle(int i) {
        this.mHorizontalChainStyle = i;
    }

    public int getHorizontalChainStyle() {
        return this.mHorizontalChainStyle;
    }

    public void setVerticalChainStyle(int i) {
        this.mVerticalChainStyle = i;
    }

    public int getVerticalChainStyle() {
        return this.mVerticalChainStyle;
    }

    public boolean allowedInBarrier() {
        return this.mVisibility != 8;
    }

    public void immediateConnect(Type type, ConstraintWidget constraintWidget, Type type2, int i, int i2) {
        getAnchor(type).connect(constraintWidget.getAnchor(type2), i, i2, Strength.STRONG, 0, true);
    }

    public void connect(ConstraintAnchor constraintAnchor, ConstraintAnchor constraintAnchor2, int i, int i2) {
        connect(constraintAnchor, constraintAnchor2, i, Strength.STRONG, i2);
    }

    public void connect(ConstraintAnchor constraintAnchor, ConstraintAnchor constraintAnchor2, int i) {
        connect(constraintAnchor, constraintAnchor2, i, Strength.STRONG, 0);
    }

    public void connect(ConstraintAnchor constraintAnchor, ConstraintAnchor constraintAnchor2, int i, Strength strength, int i2) {
        if (constraintAnchor.getOwner() == this) {
            connect(constraintAnchor.getType(), constraintAnchor2.getOwner(), constraintAnchor2.getType(), i, strength, i2);
        }
    }

    public void connect(Type type, ConstraintWidget constraintWidget, Type type2, int i) {
        connect(type, constraintWidget, type2, i, Strength.STRONG);
    }

    public void connect(Type type, ConstraintWidget constraintWidget, Type type2) {
        connect(type, constraintWidget, type2, 0, Strength.STRONG);
    }

    public void connect(Type type, ConstraintWidget constraintWidget, Type type2, int i, Strength strength) {
        connect(type, constraintWidget, type2, i, strength, 0);
    }

    public void connect(Type type, ConstraintWidget constraintWidget, Type type2, int i, Strength strength, int i2) {
        ConstraintWidget constraintWidget2 = this;
        Type type3 = type;
        ConstraintWidget constraintWidget3 = constraintWidget;
        Type type4 = type2;
        int i3 = i2;
        int i4 = 0;
        ConstraintAnchor anchor;
        ConstraintAnchor anchor2;
        if (type3 == Type.CENTER) {
            ConstraintWidget constraintWidget4;
            Strength strength2;
            int i5;
            if (type4 == Type.CENTER) {
                Object obj;
                anchor = getAnchor(Type.LEFT);
                anchor2 = getAnchor(Type.RIGHT);
                ConstraintAnchor anchor3 = getAnchor(Type.TOP);
                ConstraintAnchor anchor4 = getAnchor(Type.BOTTOM);
                Object obj2 = 1;
                if ((anchor == null || !anchor.isConnected()) && (anchor2 == null || !anchor2.isConnected())) {
                    constraintWidget4 = constraintWidget;
                    strength2 = strength;
                    i5 = i2;
                    connect(Type.LEFT, constraintWidget4, Type.LEFT, 0, strength2, i5);
                    connect(Type.RIGHT, constraintWidget4, Type.RIGHT, 0, strength2, i5);
                    obj = 1;
                } else {
                    obj = null;
                }
                if ((anchor3 == null || !anchor3.isConnected()) && (anchor4 == null || !anchor4.isConnected())) {
                    constraintWidget4 = constraintWidget;
                    strength2 = strength;
                    i5 = i2;
                    connect(Type.TOP, constraintWidget4, Type.TOP, 0, strength2, i5);
                    connect(Type.BOTTOM, constraintWidget4, Type.BOTTOM, 0, strength2, i5);
                } else {
                    obj2 = null;
                }
                if (obj != null && obj2 != null) {
                    getAnchor(Type.CENTER).connect(constraintWidget3.getAnchor(Type.CENTER), 0, i3);
                    return;
                } else if (obj != null) {
                    getAnchor(Type.CENTER_X).connect(constraintWidget3.getAnchor(Type.CENTER_X), 0, i3);
                    return;
                } else if (obj2 != null) {
                    getAnchor(Type.CENTER_Y).connect(constraintWidget3.getAnchor(Type.CENTER_Y), 0, i3);
                    return;
                } else {
                    return;
                }
            }
            if (type4 != Type.LEFT) {
                if (type4 != Type.RIGHT) {
                    if (type4 == Type.TOP || type4 == Type.BOTTOM) {
                        constraintWidget4 = constraintWidget;
                        Type type5 = type2;
                        strength2 = strength;
                        i5 = i2;
                        connect(Type.TOP, constraintWidget4, type5, 0, strength2, i5);
                        connect(Type.BOTTOM, constraintWidget4, type5, 0, strength2, i5);
                        getAnchor(Type.CENTER).connect(constraintWidget.getAnchor(type2), 0, i3);
                        return;
                    }
                    return;
                }
            }
            connect(Type.LEFT, constraintWidget, type2, 0, strength, i2);
            try {
                connect(Type.RIGHT, constraintWidget, type2, 0, strength, i2);
                getAnchor(Type.CENTER).connect(constraintWidget.getAnchor(type2), 0, i3);
            } catch (Throwable th) {
                Throwable th2 = th;
            }
        } else if (type3 == Type.CENTER_X && (type4 == Type.LEFT || type4 == Type.RIGHT)) {
            anchor = getAnchor(Type.LEFT);
            anchor2 = constraintWidget.getAnchor(type2);
            r2 = getAnchor(Type.RIGHT);
            anchor.connect(anchor2, 0, i3);
            r2.connect(anchor2, 0, i3);
            getAnchor(Type.CENTER_X).connect(anchor2, 0, i3);
        } else if (type3 == Type.CENTER_Y && (type4 == Type.TOP || type4 == Type.BOTTOM)) {
            anchor = constraintWidget.getAnchor(type2);
            getAnchor(Type.TOP).connect(anchor, 0, i3);
            getAnchor(Type.BOTTOM).connect(anchor, 0, i3);
            getAnchor(Type.CENTER_Y).connect(anchor, 0, i3);
        } else if (type3 == Type.CENTER_X && type4 == Type.CENTER_X) {
            getAnchor(Type.LEFT).connect(constraintWidget3.getAnchor(Type.LEFT), 0, i3);
            getAnchor(Type.RIGHT).connect(constraintWidget3.getAnchor(Type.RIGHT), 0, i3);
            getAnchor(Type.CENTER_X).connect(constraintWidget.getAnchor(type2), 0, i3);
        } else if (type3 == Type.CENTER_Y && type4 == Type.CENTER_Y) {
            getAnchor(Type.TOP).connect(constraintWidget3.getAnchor(Type.TOP), 0, i3);
            getAnchor(Type.BOTTOM).connect(constraintWidget3.getAnchor(Type.BOTTOM), 0, i3);
            getAnchor(Type.CENTER_Y).connect(constraintWidget.getAnchor(type2), 0, i3);
        } else {
            anchor2 = getAnchor(type);
            r2 = constraintWidget.getAnchor(type2);
            if (anchor2.isValidConnection(r2)) {
                Strength strength3;
                ConstraintAnchor anchor5;
                if (type3 == Type.BASELINE) {
                    anchor = getAnchor(Type.TOP);
                    anchor5 = getAnchor(Type.BOTTOM);
                    if (anchor != null) {
                        anchor.reset();
                    }
                    if (anchor5 != null) {
                        anchor5.reset();
                    }
                    strength3 = strength;
                } else {
                    if (type3 != Type.TOP) {
                        if (type3 != Type.BOTTOM) {
                            if (type3 == Type.LEFT || type3 == Type.RIGHT) {
                                anchor5 = getAnchor(Type.CENTER);
                                if (anchor5.getTarget() != r2) {
                                    anchor5.reset();
                                }
                                anchor = getAnchor(type).getOpposite();
                                anchor5 = getAnchor(Type.CENTER_X);
                                if (anchor5.isConnected()) {
                                    anchor.reset();
                                    anchor5.reset();
                                }
                            }
                            i4 = i;
                            strength3 = strength;
                        }
                    }
                    anchor5 = getAnchor(Type.BASELINE);
                    if (anchor5 != null) {
                        anchor5.reset();
                    }
                    anchor5 = getAnchor(Type.CENTER);
                    if (anchor5.getTarget() != r2) {
                        anchor5.reset();
                    }
                    anchor = getAnchor(type).getOpposite();
                    anchor5 = getAnchor(Type.CENTER_Y);
                    if (anchor5.isConnected()) {
                        anchor.reset();
                        anchor5.reset();
                    }
                    i4 = i;
                    strength3 = strength;
                }
                anchor2.connect(r2, i4, strength3, i3);
                r2.getOwner().connectedTo(anchor2.getOwner());
            }
        }
    }

    public void resetAllConstraints() {
        resetAnchors();
        setVerticalBiasPercent(DEFAULT_BIAS);
        setHorizontalBiasPercent(DEFAULT_BIAS);
        if (!(this instanceof ConstraintWidgetContainer)) {
            if (getHorizontalDimensionBehaviour() == DimensionBehaviour.MATCH_CONSTRAINT) {
                if (getWidth() == getWrapWidth()) {
                    setHorizontalDimensionBehaviour(DimensionBehaviour.WRAP_CONTENT);
                } else if (getWidth() > getMinWidth()) {
                    setHorizontalDimensionBehaviour(DimensionBehaviour.FIXED);
                }
            }
            if (getVerticalDimensionBehaviour() == DimensionBehaviour.MATCH_CONSTRAINT) {
                if (getHeight() == getWrapHeight()) {
                    setVerticalDimensionBehaviour(DimensionBehaviour.WRAP_CONTENT);
                } else if (getHeight() > getMinHeight()) {
                    setVerticalDimensionBehaviour(DimensionBehaviour.FIXED);
                }
            }
        }
    }

    public void resetAnchor(ConstraintAnchor constraintAnchor) {
        if (getParent() == null || !(getParent() instanceof ConstraintWidgetContainer) || !((ConstraintWidgetContainer) getParent()).handlesInternalConstraints()) {
            ConstraintAnchor anchor = getAnchor(Type.LEFT);
            ConstraintAnchor anchor2 = getAnchor(Type.RIGHT);
            ConstraintAnchor anchor3 = getAnchor(Type.TOP);
            ConstraintAnchor anchor4 = getAnchor(Type.BOTTOM);
            ConstraintAnchor anchor5 = getAnchor(Type.CENTER);
            ConstraintAnchor anchor6 = getAnchor(Type.CENTER_X);
            ConstraintAnchor anchor7 = getAnchor(Type.CENTER_Y);
            if (constraintAnchor == anchor5) {
                if (anchor.isConnected() && anchor2.isConnected() && anchor.getTarget() == anchor2.getTarget()) {
                    anchor.reset();
                    anchor2.reset();
                }
                if (anchor3.isConnected() && anchor4.isConnected() && anchor3.getTarget() == anchor4.getTarget()) {
                    anchor3.reset();
                    anchor4.reset();
                }
                this.mHorizontalBiasPercent = 0.5f;
                this.mVerticalBiasPercent = 0.5f;
            } else if (constraintAnchor == anchor6) {
                if (anchor.isConnected() && anchor2.isConnected() && anchor.getTarget().getOwner() == anchor2.getTarget().getOwner()) {
                    anchor.reset();
                    anchor2.reset();
                }
                this.mHorizontalBiasPercent = 0.5f;
            } else if (constraintAnchor == anchor7) {
                if (anchor3.isConnected() && anchor4.isConnected() && anchor3.getTarget().getOwner() == anchor4.getTarget().getOwner()) {
                    anchor3.reset();
                    anchor4.reset();
                }
                this.mVerticalBiasPercent = 0.5f;
            } else {
                if (constraintAnchor != anchor) {
                    if (constraintAnchor != anchor2) {
                        if ((constraintAnchor == anchor3 || constraintAnchor == anchor4) && anchor3.isConnected() && anchor3.getTarget() == anchor4.getTarget()) {
                            anchor5.reset();
                        }
                    }
                }
                if (anchor.isConnected() && anchor.getTarget() == anchor2.getTarget()) {
                    anchor5.reset();
                }
            }
            constraintAnchor.reset();
        }
    }

    public void resetAnchors() {
        ConstraintWidget parent = getParent();
        if (parent == null || !(parent instanceof ConstraintWidgetContainer) || !((ConstraintWidgetContainer) getParent()).handlesInternalConstraints()) {
            int size = this.mAnchors.size();
            for (int i = 0; i < size; i++) {
                ((ConstraintAnchor) this.mAnchors.get(i)).reset();
            }
        }
    }

    public void resetAnchors(int i) {
        ConstraintWidget parent = getParent();
        if (parent == null || !(parent instanceof ConstraintWidgetContainer) || !((ConstraintWidgetContainer) getParent()).handlesInternalConstraints()) {
            int size = this.mAnchors.size();
            for (int i2 = 0; i2 < size; i2++) {
                ConstraintAnchor constraintAnchor = (ConstraintAnchor) this.mAnchors.get(i2);
                if (i == constraintAnchor.getConnectionCreator()) {
                    if (constraintAnchor.isVerticalAnchor()) {
                        setVerticalBiasPercent(DEFAULT_BIAS);
                    } else {
                        setHorizontalBiasPercent(DEFAULT_BIAS);
                    }
                    constraintAnchor.reset();
                }
            }
        }
    }

    public void disconnectWidget(ConstraintWidget constraintWidget) {
        ArrayList anchors = getAnchors();
        int size = anchors.size();
        for (int i = 0; i < size; i++) {
            ConstraintAnchor constraintAnchor = (ConstraintAnchor) anchors.get(i);
            if (constraintAnchor.isConnected() && constraintAnchor.getTarget().getOwner() == constraintWidget) {
                constraintAnchor.reset();
            }
        }
    }

    public void disconnectUnlockedWidget(ConstraintWidget constraintWidget) {
        ArrayList anchors = getAnchors();
        int size = anchors.size();
        for (int i = 0; i < size; i++) {
            ConstraintAnchor constraintAnchor = (ConstraintAnchor) anchors.get(i);
            if (constraintAnchor.isConnected() && constraintAnchor.getTarget().getOwner() == constraintWidget && constraintAnchor.getConnectionCreator() == 2) {
                constraintAnchor.reset();
            }
        }
    }

    public ConstraintAnchor getAnchor(Type type) {
        switch (type) {
            case LEFT:
                return this.mLeft;
            case TOP:
                return this.mTop;
            case RIGHT:
                return this.mRight;
            case BOTTOM:
                return this.mBottom;
            case BASELINE:
                return this.mBaseline;
            case CENTER:
                return this.mCenter;
            case CENTER_X:
                return this.mCenterX;
            case CENTER_Y:
                return this.mCenterY;
            case NONE:
                return null;
            default:
                throw new AssertionError(type.name());
        }
    }

    public DimensionBehaviour getHorizontalDimensionBehaviour() {
        return this.mListDimensionBehaviors[0];
    }

    public DimensionBehaviour getVerticalDimensionBehaviour() {
        return this.mListDimensionBehaviors[1];
    }

    public DimensionBehaviour getDimensionBehaviour(int i) {
        if (i == 0) {
            return getHorizontalDimensionBehaviour();
        }
        return i == 1 ? getVerticalDimensionBehaviour() : 0;
    }

    public void setHorizontalDimensionBehaviour(DimensionBehaviour dimensionBehaviour) {
        this.mListDimensionBehaviors[0] = dimensionBehaviour;
        if (dimensionBehaviour == DimensionBehaviour.WRAP_CONTENT) {
            setWidth(this.mWrapWidth);
        }
    }

    public void setVerticalDimensionBehaviour(DimensionBehaviour dimensionBehaviour) {
        this.mListDimensionBehaviors[1] = dimensionBehaviour;
        if (dimensionBehaviour == DimensionBehaviour.WRAP_CONTENT) {
            setHeight(this.mWrapHeight);
        }
    }

    public boolean isInHorizontalChain() {
        return (this.mLeft.mTarget != null && this.mLeft.mTarget.mTarget == this.mLeft) || (this.mRight.mTarget != null && this.mRight.mTarget.mTarget == this.mRight);
    }

    public ConstraintWidget getHorizontalChainControlWidget() {
        if (!isInHorizontalChain()) {
            return null;
        }
        ConstraintWidget constraintWidget = this;
        ConstraintWidget constraintWidget2 = null;
        while (constraintWidget2 == null && constraintWidget != null) {
            ConstraintWidget constraintWidget3;
            ConstraintAnchor anchor = constraintWidget.getAnchor(Type.LEFT);
            if (anchor == null) {
                anchor = null;
            } else {
                anchor = anchor.getTarget();
            }
            if (anchor == null) {
                constraintWidget3 = null;
            } else {
                constraintWidget3 = anchor.getOwner();
            }
            if (constraintWidget3 == getParent()) {
                return constraintWidget;
            }
            ConstraintAnchor constraintAnchor;
            if (constraintWidget3 == null) {
                constraintAnchor = null;
            } else {
                constraintAnchor = constraintWidget3.getAnchor(Type.RIGHT).getTarget();
            }
            if (constraintAnchor == null || constraintAnchor.getOwner() == constraintWidget) {
                constraintWidget = constraintWidget3;
            } else {
                constraintWidget2 = constraintWidget;
            }
        }
        return constraintWidget2;
    }

    public boolean isInVerticalChain() {
        return (this.mTop.mTarget != null && this.mTop.mTarget.mTarget == this.mTop) || (this.mBottom.mTarget != null && this.mBottom.mTarget.mTarget == this.mBottom);
    }

    public ConstraintWidget getVerticalChainControlWidget() {
        if (!isInVerticalChain()) {
            return null;
        }
        ConstraintWidget constraintWidget = this;
        ConstraintWidget constraintWidget2 = null;
        while (constraintWidget2 == null && constraintWidget != null) {
            ConstraintWidget constraintWidget3;
            ConstraintAnchor anchor = constraintWidget.getAnchor(Type.TOP);
            if (anchor == null) {
                anchor = null;
            } else {
                anchor = anchor.getTarget();
            }
            if (anchor == null) {
                constraintWidget3 = null;
            } else {
                constraintWidget3 = anchor.getOwner();
            }
            if (constraintWidget3 == getParent()) {
                return constraintWidget;
            }
            ConstraintAnchor constraintAnchor;
            if (constraintWidget3 == null) {
                constraintAnchor = null;
            } else {
                constraintAnchor = constraintWidget3.getAnchor(Type.BOTTOM).getTarget();
            }
            if (constraintAnchor == null || constraintAnchor.getOwner() == constraintWidget) {
                constraintWidget = constraintWidget3;
            } else {
                constraintWidget2 = constraintWidget;
            }
        }
        return constraintWidget2;
    }

    private boolean isChainHead(int i) {
        i *= 2;
        if (this.mListAnchors[i].mTarget != null) {
            ConstraintAnchor constraintAnchor = this.mListAnchors[i].mTarget.mTarget;
            ConstraintAnchor[] constraintAnchorArr = this.mListAnchors;
            if (constraintAnchor != constraintAnchorArr[i]) {
                i++;
                if (constraintAnchorArr[i].mTarget != null && this.mListAnchors[i].mTarget.mTarget == this.mListAnchors[i]) {
                    return true;
                }
            }
        }
        return false;
    }

    public void addToSolver(LinearSystem linearSystem) {
        boolean z;
        ConstraintWidget constraintWidget;
        boolean z2;
        boolean z3;
        boolean z4;
        boolean z5;
        SolverVariable solverVariable;
        int i;
        int i2;
        int i3;
        int i4;
        Object obj;
        int i5;
        boolean z6;
        boolean z7;
        boolean isConnected;
        LinearSystem linearSystem2 = linearSystem;
        SolverVariable createObjectVariable = linearSystem2.createObjectVariable(this.mLeft);
        SolverVariable createObjectVariable2 = linearSystem2.createObjectVariable(this.mRight);
        SolverVariable createObjectVariable3 = linearSystem2.createObjectVariable(this.mTop);
        SolverVariable createObjectVariable4 = linearSystem2.createObjectVariable(this.mBottom);
        SolverVariable createObjectVariable5 = linearSystem2.createObjectVariable(this.mBaseline);
        ConstraintWidget constraintWidget2 = this.mParent;
        if (constraintWidget2 != null) {
            boolean z8;
            z = constraintWidget2 != null && constraintWidget2.mListDimensionBehaviors[0] == DimensionBehaviour.WRAP_CONTENT;
            ConstraintWidget constraintWidget3 = constraintWidget.mParent;
            boolean z9 = constraintWidget3 != null && constraintWidget3.mListDimensionBehaviors[1] == DimensionBehaviour.WRAP_CONTENT;
            if (isChainHead(0)) {
                ((ConstraintWidgetContainer) constraintWidget.mParent).addChain(constraintWidget, 0);
                z8 = true;
            } else {
                z8 = isInHorizontalChain();
            }
            if (isChainHead(1)) {
                ((ConstraintWidgetContainer) constraintWidget.mParent).addChain(constraintWidget, 1);
                z2 = true;
            } else {
                z2 = isInVerticalChain();
            }
            if (z && constraintWidget.mVisibility != 8 && constraintWidget.mLeft.mTarget == null && constraintWidget.mRight.mTarget == null) {
                linearSystem2.addGreaterThan(linearSystem2.createObjectVariable(constraintWidget.mParent.mRight), createObjectVariable2, 0, 1);
            }
            if (z9 && constraintWidget.mVisibility != 8 && constraintWidget.mTop.mTarget == null && constraintWidget.mBottom.mTarget == null && constraintWidget.mBaseline == null) {
                linearSystem2.addGreaterThan(linearSystem2.createObjectVariable(constraintWidget.mParent.mBottom), createObjectVariable4, 0, 1);
            }
            z3 = z9;
            z4 = z8;
            z5 = z2;
        } else {
            z = false;
            z3 = false;
            z4 = false;
            z5 = false;
        }
        int i6 = constraintWidget.mWidth;
        int i7 = constraintWidget.mMinWidth;
        if (i6 < i7) {
            i6 = i7;
        }
        i7 = constraintWidget.mHeight;
        int i8 = constraintWidget.mMinHeight;
        if (i7 < i8) {
            i7 = i8;
        }
        z2 = constraintWidget.mListDimensionBehaviors[0] != DimensionBehaviour.MATCH_CONSTRAINT;
        boolean z10 = constraintWidget.mListDimensionBehaviors[1] != DimensionBehaviour.MATCH_CONSTRAINT;
        constraintWidget.mResolvedDimensionRatioSide = constraintWidget.mDimensionRatioSide;
        float f = constraintWidget.mDimensionRatio;
        constraintWidget.mResolvedDimensionRatio = f;
        int i9 = constraintWidget.mMatchConstraintDefaultWidth;
        int i10 = constraintWidget.mMatchConstraintDefaultHeight;
        if (f <= 0.0f || constraintWidget.mVisibility == 8) {
            solverVariable = createObjectVariable5;
            i = i9;
            i2 = i6;
            i3 = i7;
            i4 = i10;
            obj = null;
        } else {
            solverVariable = createObjectVariable5;
            if (constraintWidget.mListDimensionBehaviors[0] == DimensionBehaviour.MATCH_CONSTRAINT && i9 == 0) {
                i9 = 3;
            }
            if (constraintWidget.mListDimensionBehaviors[1] == DimensionBehaviour.MATCH_CONSTRAINT && i10 == 0) {
                i10 = 3;
            }
            if (constraintWidget.mListDimensionBehaviors[0] == DimensionBehaviour.MATCH_CONSTRAINT && constraintWidget.mListDimensionBehaviors[1] == DimensionBehaviour.MATCH_CONSTRAINT && i9 == 3 && i10 == 3) {
                setupDimensionRatio(z, z3, z2, z10);
            } else if (constraintWidget.mListDimensionBehaviors[0] == DimensionBehaviour.MATCH_CONSTRAINT && i9 == 3) {
                constraintWidget.mResolvedDimensionRatioSide = 0;
                i5 = (int) (constraintWidget.mResolvedDimensionRatio * ((float) constraintWidget.mHeight));
                if (constraintWidget.mListDimensionBehaviors[1] != DimensionBehaviour.MATCH_CONSTRAINT) {
                    i2 = i5;
                    i3 = i7;
                    i4 = i10;
                    i = 4;
                    obj = null;
                } else {
                    i2 = i5;
                    i = i9;
                    i3 = i7;
                    i4 = i10;
                    obj = 1;
                }
            } else if (constraintWidget.mListDimensionBehaviors[1] == DimensionBehaviour.MATCH_CONSTRAINT && i10 == 3) {
                constraintWidget.mResolvedDimensionRatioSide = 1;
                if (constraintWidget.mDimensionRatioSide == -1) {
                    constraintWidget.mResolvedDimensionRatio = 1.0f / constraintWidget.mResolvedDimensionRatio;
                }
                i5 = (int) (constraintWidget.mResolvedDimensionRatio * ((float) constraintWidget.mWidth));
                if (constraintWidget.mListDimensionBehaviors[0] != DimensionBehaviour.MATCH_CONSTRAINT) {
                    i3 = i5;
                    i = i9;
                    i2 = i6;
                    i4 = 4;
                    obj = null;
                } else {
                    i3 = i5;
                    i = i9;
                    i2 = i6;
                    i4 = i10;
                    obj = 1;
                }
            }
            i = i9;
            i2 = i6;
            i3 = i7;
            i4 = i10;
            obj = 1;
        }
        int[] iArr = constraintWidget.mResolvedMatchConstraintDefault;
        iArr[0] = i;
        iArr[1] = i4;
        boolean z11;
        SolverVariable solverVariable2;
        SolverVariable solverVariable3;
        boolean z12;
        SolverVariable solverVariable4;
        LinearSystem linearSystem3;
        SolverVariable solverVariable5;
        boolean z13;
        SolverVariable createObjectVariable6;
        SolverVariable solverVariable6;
        ConstraintWidget constraintWidget4;
        if (obj != null) {
            i5 = constraintWidget.mResolvedDimensionRatioSide;
            if (i5 != 0) {
                if (i5 == -1) {
                }
            }
            z6 = true;
            z7 = constraintWidget.mListDimensionBehaviors[0] != DimensionBehaviour.WRAP_CONTENT && (constraintWidget instanceof ConstraintWidgetContainer);
            isConnected = constraintWidget.mCenter.isConnected() ^ 1;
            if (constraintWidget.mHorizontalResolution == 2) {
                ConstraintWidget constraintWidget5 = constraintWidget.mParent;
                SolverVariable createObjectVariable7 = constraintWidget5 == null ? linearSystem2.createObjectVariable(constraintWidget5.mRight) : null;
                constraintWidget5 = constraintWidget.mParent;
                z11 = z3;
                solverVariable2 = solverVariable;
                solverVariable = createObjectVariable4;
                solverVariable3 = createObjectVariable3;
                z12 = z7;
                solverVariable4 = createObjectVariable2;
                applyConstraints(linearSystem, z, constraintWidget5 == null ? linearSystem2.createObjectVariable(constraintWidget5.mLeft) : null, createObjectVariable7, constraintWidget.mListDimensionBehaviors[0], z12, constraintWidget.mLeft, constraintWidget.mRight, constraintWidget.mX, i2, constraintWidget.mMinWidth, constraintWidget.mMaxDimension[0], constraintWidget.mHorizontalBiasPercent, z6, z4, i, constraintWidget.mMatchConstraintMinWidth, constraintWidget.mMatchConstraintMaxWidth, constraintWidget.mMatchConstraintPercentWidth, isConnected);
                constraintWidget = this;
            } else {
                solverVariable3 = createObjectVariable3;
                solverVariable4 = createObjectVariable2;
                z11 = z3;
                solverVariable2 = solverVariable;
                solverVariable = createObjectVariable4;
                constraintWidget = this;
            }
            if (constraintWidget.mVerticalResolution == 2) {
                z12 = constraintWidget.mListDimensionBehaviors[1] != DimensionBehaviour.WRAP_CONTENT && (constraintWidget instanceof ConstraintWidgetContainer);
                if (obj != null) {
                    int i11 = constraintWidget.mResolvedDimensionRatioSide;
                    if (i11 == 1 || i11 == -1) {
                        z4 = true;
                        if (constraintWidget.mBaselineDistance <= 0) {
                            createObjectVariable4 = solverVariable3;
                            linearSystem3 = linearSystem;
                        } else if (constraintWidget.mBaseline.getResolutionNode().state != 1) {
                            linearSystem3 = linearSystem;
                            constraintWidget.mBaseline.getResolutionNode().addResolvedValue(linearSystem3);
                            createObjectVariable4 = solverVariable3;
                        } else {
                            linearSystem3 = linearSystem;
                            solverVariable5 = solverVariable2;
                            createObjectVariable4 = solverVariable3;
                            linearSystem3.addEquality(solverVariable5, createObjectVariable4, getBaselineDistance(), 6);
                            if (constraintWidget.mBaseline.mTarget != null) {
                                linearSystem3.addEquality(solverVariable5, linearSystem3.createObjectVariable(constraintWidget.mBaseline.mTarget), 0, 6);
                                z13 = false;
                                constraintWidget2 = constraintWidget.mParent;
                                createObjectVariable6 = constraintWidget2 == null ? linearSystem3.createObjectVariable(constraintWidget2.mBottom) : null;
                                constraintWidget2 = constraintWidget.mParent;
                                solverVariable6 = createObjectVariable4;
                                applyConstraints(linearSystem, z11, constraintWidget2 == null ? linearSystem3.createObjectVariable(constraintWidget2.mTop) : null, createObjectVariable6, constraintWidget.mListDimensionBehaviors[1], z12, constraintWidget.mTop, constraintWidget.mBottom, constraintWidget.mY, i3, constraintWidget.mMinHeight, constraintWidget.mMaxDimension[1], constraintWidget.mVerticalBiasPercent, z4, z5, i4, constraintWidget.mMatchConstraintMinHeight, constraintWidget.mMatchConstraintMaxHeight, constraintWidget.mMatchConstraintPercentHeight, z13);
                                if (obj == null) {
                                    constraintWidget4 = this;
                                } else if (this.mResolvedDimensionRatioSide != 1) {
                                    linearSystem.addRatio(solverVariable, solverVariable6, solverVariable4, createObjectVariable, constraintWidget4.mResolvedDimensionRatio, 6);
                                } else {
                                    linearSystem.addRatio(solverVariable4, createObjectVariable, solverVariable, solverVariable6, constraintWidget4.mResolvedDimensionRatio, 6);
                                }
                                if (constraintWidget4.mCenter.isConnected()) {
                                    linearSystem.addCenterPoint(constraintWidget4, constraintWidget4.mCenter.getTarget().getOwner(), (float) Math.toRadians((double) (constraintWidget4.mCircleConstraintAngle + 90.0f)), constraintWidget4.mCenter.getMargin());
                                }
                            }
                        }
                        z13 = isConnected;
                        constraintWidget2 = constraintWidget.mParent;
                        if (constraintWidget2 == null) {
                        }
                        constraintWidget2 = constraintWidget.mParent;
                        if (constraintWidget2 == null) {
                        }
                        solverVariable6 = createObjectVariable4;
                        applyConstraints(linearSystem, z11, constraintWidget2 == null ? linearSystem3.createObjectVariable(constraintWidget2.mTop) : null, createObjectVariable6, constraintWidget.mListDimensionBehaviors[1], z12, constraintWidget.mTop, constraintWidget.mBottom, constraintWidget.mY, i3, constraintWidget.mMinHeight, constraintWidget.mMaxDimension[1], constraintWidget.mVerticalBiasPercent, z4, z5, i4, constraintWidget.mMatchConstraintMinHeight, constraintWidget.mMatchConstraintMaxHeight, constraintWidget.mMatchConstraintPercentHeight, z13);
                        if (obj == null) {
                            constraintWidget4 = this;
                        } else if (this.mResolvedDimensionRatioSide != 1) {
                            linearSystem.addRatio(solverVariable4, createObjectVariable, solverVariable, solverVariable6, constraintWidget4.mResolvedDimensionRatio, 6);
                        } else {
                            linearSystem.addRatio(solverVariable, solverVariable6, solverVariable4, createObjectVariable, constraintWidget4.mResolvedDimensionRatio, 6);
                        }
                        if (constraintWidget4.mCenter.isConnected()) {
                            linearSystem.addCenterPoint(constraintWidget4, constraintWidget4.mCenter.getTarget().getOwner(), (float) Math.toRadians((double) (constraintWidget4.mCircleConstraintAngle + 90.0f)), constraintWidget4.mCenter.getMargin());
                        }
                    }
                }
                z4 = false;
                if (constraintWidget.mBaselineDistance <= 0) {
                    createObjectVariable4 = solverVariable3;
                    linearSystem3 = linearSystem;
                } else if (constraintWidget.mBaseline.getResolutionNode().state != 1) {
                    linearSystem3 = linearSystem;
                    solverVariable5 = solverVariable2;
                    createObjectVariable4 = solverVariable3;
                    linearSystem3.addEquality(solverVariable5, createObjectVariable4, getBaselineDistance(), 6);
                    if (constraintWidget.mBaseline.mTarget != null) {
                        linearSystem3.addEquality(solverVariable5, linearSystem3.createObjectVariable(constraintWidget.mBaseline.mTarget), 0, 6);
                        z13 = false;
                        constraintWidget2 = constraintWidget.mParent;
                        if (constraintWidget2 == null) {
                        }
                        constraintWidget2 = constraintWidget.mParent;
                        if (constraintWidget2 == null) {
                        }
                        solverVariable6 = createObjectVariable4;
                        applyConstraints(linearSystem, z11, constraintWidget2 == null ? linearSystem3.createObjectVariable(constraintWidget2.mTop) : null, createObjectVariable6, constraintWidget.mListDimensionBehaviors[1], z12, constraintWidget.mTop, constraintWidget.mBottom, constraintWidget.mY, i3, constraintWidget.mMinHeight, constraintWidget.mMaxDimension[1], constraintWidget.mVerticalBiasPercent, z4, z5, i4, constraintWidget.mMatchConstraintMinHeight, constraintWidget.mMatchConstraintMaxHeight, constraintWidget.mMatchConstraintPercentHeight, z13);
                        if (obj == null) {
                            constraintWidget4 = this;
                        } else if (this.mResolvedDimensionRatioSide != 1) {
                            linearSystem.addRatio(solverVariable, solverVariable6, solverVariable4, createObjectVariable, constraintWidget4.mResolvedDimensionRatio, 6);
                        } else {
                            linearSystem.addRatio(solverVariable4, createObjectVariable, solverVariable, solverVariable6, constraintWidget4.mResolvedDimensionRatio, 6);
                        }
                        if (constraintWidget4.mCenter.isConnected()) {
                            linearSystem.addCenterPoint(constraintWidget4, constraintWidget4.mCenter.getTarget().getOwner(), (float) Math.toRadians((double) (constraintWidget4.mCircleConstraintAngle + 90.0f)), constraintWidget4.mCenter.getMargin());
                        }
                    }
                } else {
                    linearSystem3 = linearSystem;
                    constraintWidget.mBaseline.getResolutionNode().addResolvedValue(linearSystem3);
                    createObjectVariable4 = solverVariable3;
                }
                z13 = isConnected;
                constraintWidget2 = constraintWidget.mParent;
                if (constraintWidget2 == null) {
                }
                constraintWidget2 = constraintWidget.mParent;
                if (constraintWidget2 == null) {
                }
                solverVariable6 = createObjectVariable4;
                applyConstraints(linearSystem, z11, constraintWidget2 == null ? linearSystem3.createObjectVariable(constraintWidget2.mTop) : null, createObjectVariable6, constraintWidget.mListDimensionBehaviors[1], z12, constraintWidget.mTop, constraintWidget.mBottom, constraintWidget.mY, i3, constraintWidget.mMinHeight, constraintWidget.mMaxDimension[1], constraintWidget.mVerticalBiasPercent, z4, z5, i4, constraintWidget.mMatchConstraintMinHeight, constraintWidget.mMatchConstraintMaxHeight, constraintWidget.mMatchConstraintPercentHeight, z13);
                if (obj == null) {
                    constraintWidget4 = this;
                } else if (this.mResolvedDimensionRatioSide != 1) {
                    linearSystem.addRatio(solverVariable4, createObjectVariable, solverVariable, solverVariable6, constraintWidget4.mResolvedDimensionRatio, 6);
                } else {
                    linearSystem.addRatio(solverVariable, solverVariable6, solverVariable4, createObjectVariable, constraintWidget4.mResolvedDimensionRatio, 6);
                }
                if (constraintWidget4.mCenter.isConnected()) {
                    linearSystem.addCenterPoint(constraintWidget4, constraintWidget4.mCenter.getTarget().getOwner(), (float) Math.toRadians((double) (constraintWidget4.mCircleConstraintAngle + 90.0f)), constraintWidget4.mCenter.getMargin());
                }
            }
        }
        z6 = false;
        if (constraintWidget.mListDimensionBehaviors[0] != DimensionBehaviour.WRAP_CONTENT) {
        }
        isConnected = constraintWidget.mCenter.isConnected() ^ 1;
        if (constraintWidget.mHorizontalResolution == 2) {
            solverVariable3 = createObjectVariable3;
            solverVariable4 = createObjectVariable2;
            z11 = z3;
            solverVariable2 = solverVariable;
            solverVariable = createObjectVariable4;
            constraintWidget = this;
        } else {
            ConstraintWidget constraintWidget52 = constraintWidget.mParent;
            if (constraintWidget52 == null) {
            }
            constraintWidget52 = constraintWidget.mParent;
            if (constraintWidget52 == null) {
            }
            z11 = z3;
            solverVariable2 = solverVariable;
            solverVariable = createObjectVariable4;
            solverVariable3 = createObjectVariable3;
            z12 = z7;
            solverVariable4 = createObjectVariable2;
            applyConstraints(linearSystem, z, constraintWidget52 == null ? linearSystem2.createObjectVariable(constraintWidget52.mLeft) : null, createObjectVariable7, constraintWidget.mListDimensionBehaviors[0], z12, constraintWidget.mLeft, constraintWidget.mRight, constraintWidget.mX, i2, constraintWidget.mMinWidth, constraintWidget.mMaxDimension[0], constraintWidget.mHorizontalBiasPercent, z6, z4, i, constraintWidget.mMatchConstraintMinWidth, constraintWidget.mMatchConstraintMaxWidth, constraintWidget.mMatchConstraintPercentWidth, isConnected);
            constraintWidget = this;
        }
        if (constraintWidget.mVerticalResolution == 2) {
            if (constraintWidget.mListDimensionBehaviors[1] != DimensionBehaviour.WRAP_CONTENT) {
            }
            if (obj != null) {
                int i112 = constraintWidget.mResolvedDimensionRatioSide;
                z4 = true;
                if (constraintWidget.mBaselineDistance <= 0) {
                    createObjectVariable4 = solverVariable3;
                    linearSystem3 = linearSystem;
                } else if (constraintWidget.mBaseline.getResolutionNode().state != 1) {
                    linearSystem3 = linearSystem;
                    constraintWidget.mBaseline.getResolutionNode().addResolvedValue(linearSystem3);
                    createObjectVariable4 = solverVariable3;
                } else {
                    linearSystem3 = linearSystem;
                    solverVariable5 = solverVariable2;
                    createObjectVariable4 = solverVariable3;
                    linearSystem3.addEquality(solverVariable5, createObjectVariable4, getBaselineDistance(), 6);
                    if (constraintWidget.mBaseline.mTarget != null) {
                        linearSystem3.addEquality(solverVariable5, linearSystem3.createObjectVariable(constraintWidget.mBaseline.mTarget), 0, 6);
                        z13 = false;
                        constraintWidget2 = constraintWidget.mParent;
                        if (constraintWidget2 == null) {
                        }
                        constraintWidget2 = constraintWidget.mParent;
                        if (constraintWidget2 == null) {
                        }
                        solverVariable6 = createObjectVariable4;
                        applyConstraints(linearSystem, z11, constraintWidget2 == null ? linearSystem3.createObjectVariable(constraintWidget2.mTop) : null, createObjectVariable6, constraintWidget.mListDimensionBehaviors[1], z12, constraintWidget.mTop, constraintWidget.mBottom, constraintWidget.mY, i3, constraintWidget.mMinHeight, constraintWidget.mMaxDimension[1], constraintWidget.mVerticalBiasPercent, z4, z5, i4, constraintWidget.mMatchConstraintMinHeight, constraintWidget.mMatchConstraintMaxHeight, constraintWidget.mMatchConstraintPercentHeight, z13);
                        if (obj == null) {
                            constraintWidget4 = this;
                        } else if (this.mResolvedDimensionRatioSide != 1) {
                            linearSystem.addRatio(solverVariable, solverVariable6, solverVariable4, createObjectVariable, constraintWidget4.mResolvedDimensionRatio, 6);
                        } else {
                            linearSystem.addRatio(solverVariable4, createObjectVariable, solverVariable, solverVariable6, constraintWidget4.mResolvedDimensionRatio, 6);
                        }
                        if (constraintWidget4.mCenter.isConnected()) {
                            linearSystem.addCenterPoint(constraintWidget4, constraintWidget4.mCenter.getTarget().getOwner(), (float) Math.toRadians((double) (constraintWidget4.mCircleConstraintAngle + 90.0f)), constraintWidget4.mCenter.getMargin());
                        }
                    }
                }
                z13 = isConnected;
                constraintWidget2 = constraintWidget.mParent;
                if (constraintWidget2 == null) {
                }
                constraintWidget2 = constraintWidget.mParent;
                if (constraintWidget2 == null) {
                }
                solverVariable6 = createObjectVariable4;
                applyConstraints(linearSystem, z11, constraintWidget2 == null ? linearSystem3.createObjectVariable(constraintWidget2.mTop) : null, createObjectVariable6, constraintWidget.mListDimensionBehaviors[1], z12, constraintWidget.mTop, constraintWidget.mBottom, constraintWidget.mY, i3, constraintWidget.mMinHeight, constraintWidget.mMaxDimension[1], constraintWidget.mVerticalBiasPercent, z4, z5, i4, constraintWidget.mMatchConstraintMinHeight, constraintWidget.mMatchConstraintMaxHeight, constraintWidget.mMatchConstraintPercentHeight, z13);
                if (obj == null) {
                    constraintWidget4 = this;
                } else if (this.mResolvedDimensionRatioSide != 1) {
                    linearSystem.addRatio(solverVariable4, createObjectVariable, solverVariable, solverVariable6, constraintWidget4.mResolvedDimensionRatio, 6);
                } else {
                    linearSystem.addRatio(solverVariable, solverVariable6, solverVariable4, createObjectVariable, constraintWidget4.mResolvedDimensionRatio, 6);
                }
                if (constraintWidget4.mCenter.isConnected()) {
                    linearSystem.addCenterPoint(constraintWidget4, constraintWidget4.mCenter.getTarget().getOwner(), (float) Math.toRadians((double) (constraintWidget4.mCircleConstraintAngle + 90.0f)), constraintWidget4.mCenter.getMargin());
                }
            }
            z4 = false;
            if (constraintWidget.mBaselineDistance <= 0) {
                createObjectVariable4 = solverVariable3;
                linearSystem3 = linearSystem;
            } else if (constraintWidget.mBaseline.getResolutionNode().state != 1) {
                linearSystem3 = linearSystem;
                solverVariable5 = solverVariable2;
                createObjectVariable4 = solverVariable3;
                linearSystem3.addEquality(solverVariable5, createObjectVariable4, getBaselineDistance(), 6);
                if (constraintWidget.mBaseline.mTarget != null) {
                    linearSystem3.addEquality(solverVariable5, linearSystem3.createObjectVariable(constraintWidget.mBaseline.mTarget), 0, 6);
                    z13 = false;
                    constraintWidget2 = constraintWidget.mParent;
                    if (constraintWidget2 == null) {
                    }
                    constraintWidget2 = constraintWidget.mParent;
                    if (constraintWidget2 == null) {
                    }
                    solverVariable6 = createObjectVariable4;
                    applyConstraints(linearSystem, z11, constraintWidget2 == null ? linearSystem3.createObjectVariable(constraintWidget2.mTop) : null, createObjectVariable6, constraintWidget.mListDimensionBehaviors[1], z12, constraintWidget.mTop, constraintWidget.mBottom, constraintWidget.mY, i3, constraintWidget.mMinHeight, constraintWidget.mMaxDimension[1], constraintWidget.mVerticalBiasPercent, z4, z5, i4, constraintWidget.mMatchConstraintMinHeight, constraintWidget.mMatchConstraintMaxHeight, constraintWidget.mMatchConstraintPercentHeight, z13);
                    if (obj == null) {
                        constraintWidget4 = this;
                    } else if (this.mResolvedDimensionRatioSide != 1) {
                        linearSystem.addRatio(solverVariable, solverVariable6, solverVariable4, createObjectVariable, constraintWidget4.mResolvedDimensionRatio, 6);
                    } else {
                        linearSystem.addRatio(solverVariable4, createObjectVariable, solverVariable, solverVariable6, constraintWidget4.mResolvedDimensionRatio, 6);
                    }
                    if (constraintWidget4.mCenter.isConnected()) {
                        linearSystem.addCenterPoint(constraintWidget4, constraintWidget4.mCenter.getTarget().getOwner(), (float) Math.toRadians((double) (constraintWidget4.mCircleConstraintAngle + 90.0f)), constraintWidget4.mCenter.getMargin());
                    }
                }
            } else {
                linearSystem3 = linearSystem;
                constraintWidget.mBaseline.getResolutionNode().addResolvedValue(linearSystem3);
                createObjectVariable4 = solverVariable3;
            }
            z13 = isConnected;
            constraintWidget2 = constraintWidget.mParent;
            if (constraintWidget2 == null) {
            }
            constraintWidget2 = constraintWidget.mParent;
            if (constraintWidget2 == null) {
            }
            solverVariable6 = createObjectVariable4;
            applyConstraints(linearSystem, z11, constraintWidget2 == null ? linearSystem3.createObjectVariable(constraintWidget2.mTop) : null, createObjectVariable6, constraintWidget.mListDimensionBehaviors[1], z12, constraintWidget.mTop, constraintWidget.mBottom, constraintWidget.mY, i3, constraintWidget.mMinHeight, constraintWidget.mMaxDimension[1], constraintWidget.mVerticalBiasPercent, z4, z5, i4, constraintWidget.mMatchConstraintMinHeight, constraintWidget.mMatchConstraintMaxHeight, constraintWidget.mMatchConstraintPercentHeight, z13);
            if (obj == null) {
                constraintWidget4 = this;
            } else if (this.mResolvedDimensionRatioSide != 1) {
                linearSystem.addRatio(solverVariable4, createObjectVariable, solverVariable, solverVariable6, constraintWidget4.mResolvedDimensionRatio, 6);
            } else {
                linearSystem.addRatio(solverVariable, solverVariable6, solverVariable4, createObjectVariable, constraintWidget4.mResolvedDimensionRatio, 6);
            }
            if (constraintWidget4.mCenter.isConnected()) {
                linearSystem.addCenterPoint(constraintWidget4, constraintWidget4.mCenter.getTarget().getOwner(), (float) Math.toRadians((double) (constraintWidget4.mCircleConstraintAngle + 90.0f)), constraintWidget4.mCenter.getMargin());
            }
        }
    }

    public void setupDimensionRatio(boolean z, boolean z2, boolean z3, boolean z4) {
        if (this.mResolvedDimensionRatioSide == -1) {
            if (z3 && !z4) {
                this.mResolvedDimensionRatioSide = 0;
            } else if (!z3 && z4) {
                this.mResolvedDimensionRatioSide = 1;
                if (this.mDimensionRatioSide) {
                    this.mResolvedDimensionRatio = true / this.mResolvedDimensionRatio;
                }
            }
        }
        if (!this.mResolvedDimensionRatioSide && (!this.mTop.isConnected() || !this.mBottom.isConnected())) {
            this.mResolvedDimensionRatioSide = 1;
        } else if (this.mResolvedDimensionRatioSide && !(this.mLeft.isConnected() && this.mRight.isConnected())) {
            this.mResolvedDimensionRatioSide = 0;
        }
        if (this.mResolvedDimensionRatioSide && !(this.mTop.isConnected() && this.mBottom.isConnected() && this.mLeft.isConnected() && this.mRight.isConnected())) {
            if (this.mTop.isConnected() && this.mBottom.isConnected()) {
                this.mResolvedDimensionRatioSide = 0;
            } else if (this.mLeft.isConnected() && this.mRight.isConnected()) {
                this.mResolvedDimensionRatio = true / this.mResolvedDimensionRatio;
                this.mResolvedDimensionRatioSide = 1;
            }
        }
        if (this.mResolvedDimensionRatioSide) {
            if (z && !z2) {
                this.mResolvedDimensionRatioSide = 0;
            } else if (!z && z2) {
                this.mResolvedDimensionRatio = true / this.mResolvedDimensionRatio;
                this.mResolvedDimensionRatioSide = 1;
            }
        }
        if (this.mResolvedDimensionRatioSide) {
            if (this.mMatchConstraintMinWidth <= false && !this.mMatchConstraintMinHeight) {
                this.mResolvedDimensionRatioSide = 0;
            } else if (!this.mMatchConstraintMinWidth && this.mMatchConstraintMinHeight <= false) {
                this.mResolvedDimensionRatio = true / this.mResolvedDimensionRatio;
                this.mResolvedDimensionRatioSide = 1;
            }
        }
        if (this.mResolvedDimensionRatioSide && z && z2) {
            this.mResolvedDimensionRatio = 1.0f / this.mResolvedDimensionRatio;
            this.mResolvedDimensionRatioSide = 1;
        }
    }

    private void applyConstraints(LinearSystem linearSystem, boolean z, SolverVariable solverVariable, SolverVariable solverVariable2, DimensionBehaviour dimensionBehaviour, boolean z2, ConstraintAnchor constraintAnchor, ConstraintAnchor constraintAnchor2, int i, int i2, int i3, int i4, float f, boolean z3, boolean z4, int i5, int i6, int i7, float f2, boolean z5) {
        ConstraintWidget constraintWidget = this;
        LinearSystem linearSystem2 = linearSystem;
        SolverVariable solverVariable3 = solverVariable;
        SolverVariable solverVariable4 = solverVariable2;
        ConstraintAnchor constraintAnchor3 = constraintAnchor2;
        int i8 = i3;
        int i9 = i4;
        SolverVariable createObjectVariable = linearSystem2.createObjectVariable(constraintAnchor);
        SolverVariable createObjectVariable2 = linearSystem2.createObjectVariable(constraintAnchor3);
        SolverVariable createObjectVariable3 = linearSystem2.createObjectVariable(constraintAnchor.getTarget());
        SolverVariable createObjectVariable4 = linearSystem2.createObjectVariable(constraintAnchor2.getTarget());
        if (linearSystem2.graphOptimizer && constraintAnchor.getResolutionNode().state == 1 && constraintAnchor2.getResolutionNode().state == 1) {
            if (LinearSystem.getMetrics() != null) {
                Metrics metrics = LinearSystem.getMetrics();
                metrics.resolvedWidgets++;
            }
            constraintAnchor.getResolutionNode().addResolvedValue(linearSystem2);
            constraintAnchor2.getResolutionNode().addResolvedValue(linearSystem2);
            if (!z4 && z) {
                linearSystem2.addGreaterThan(solverVariable4, createObjectVariable2, 0, 6);
            }
            return;
        }
        SolverVariable solverVariable5;
        Object obj;
        int i10;
        int i11;
        int i12;
        SolverVariable solverVariable6;
        SolverVariable solverVariable7;
        int i13;
        boolean z6;
        int i14;
        boolean z7;
        SolverVariable solverVariable8;
        if (LinearSystem.getMetrics() != null) {
            Metrics metrics2 = LinearSystem.getMetrics();
            solverVariable5 = createObjectVariable4;
            metrics2.nonresolvedWidgets++;
        } else {
            solverVariable5 = createObjectVariable4;
        }
        boolean isConnected = constraintAnchor.isConnected();
        boolean isConnected2 = constraintAnchor2.isConnected();
        boolean isConnected3 = constraintWidget.mCenter.isConnected();
        int i15 = isConnected ? 1 : 0;
        if (isConnected2) {
            i15++;
        }
        if (isConnected3) {
            i15++;
        }
        int i16 = i15;
        boolean z8 = z3 ? true : i5;
        switch (dimensionBehaviour) {
            case FIXED:
                obj = null;
                break;
            case WRAP_CONTENT:
                obj = null;
                break;
            case MATCH_PARENT:
                obj = null;
                break;
            case MATCH_CONSTRAINT:
                if (!z8) {
                    obj = 1;
                    break;
                } else {
                    obj = null;
                    break;
                }
            default:
                obj = null;
                break;
        }
        if (constraintWidget.mVisibility == 8) {
            i10 = 0;
            obj = null;
        } else {
            i10 = i2;
        }
        if (z5) {
            if (!isConnected && !isConnected2 && !isConnected3) {
                linearSystem2.addEquality(createObjectVariable, i);
            } else if (isConnected && !isConnected2) {
                linearSystem2.addEquality(createObjectVariable, createObjectVariable3, constraintAnchor.getMargin(), 6);
            }
        }
        if (obj == null) {
            if (z2) {
                linearSystem2.addEquality(createObjectVariable2, createObjectVariable, 0, 3);
                if (i8 > 0) {
                    i10 = 6;
                    linearSystem2.addGreaterThan(createObjectVariable2, createObjectVariable, i8, 6);
                } else {
                    i10 = 6;
                }
                if (i9 < Integer.MAX_VALUE) {
                    linearSystem2.addLowerThan(createObjectVariable2, createObjectVariable, i9, i10);
                }
            } else {
                linearSystem2.addEquality(createObjectVariable2, createObjectVariable, i10, 6);
            }
            i11 = i6;
            z2 = z8;
            i12 = i16;
            solverVariable6 = createObjectVariable3;
            solverVariable7 = solverVariable5;
            i13 = i7;
        } else {
            Object obj2;
            int i17 = i6;
            if (i17 == -2) {
                z6 = i7;
                i14 = i10;
            } else {
                i14 = i17;
                z6 = i7;
            }
            if (z6) {
                z6 = i10;
            }
            if (i14 > 0) {
                i9 = 6;
                linearSystem2.addGreaterThan(createObjectVariable2, createObjectVariable, i14, 6);
                i10 = Math.max(i10, i14);
            } else {
                i9 = 6;
            }
            if (z6 <= false) {
                linearSystem2.addLowerThan(createObjectVariable2, createObjectVariable, z6, i9);
                i10 = Math.min(i10, z6);
                z7 = true;
            } else {
                z7 = true;
            }
            int i18;
            if (z8 != z7) {
                z2 = z6;
                if (z8) {
                    SolverVariable createObjectVariable5;
                    SolverVariable createObjectVariable6;
                    if (constraintAnchor.getType() != Type.TOP) {
                        if (constraintAnchor.getType() != Type.BOTTOM) {
                            createObjectVariable5 = linearSystem2.createObjectVariable(constraintWidget.mParent.getAnchor(Type.LEFT));
                            createObjectVariable6 = linearSystem2.createObjectVariable(constraintWidget.mParent.getAnchor(Type.RIGHT));
                            i11 = i14;
                            i18 = i10;
                            solverVariable6 = createObjectVariable3;
                            i13 = z2;
                            z2 = z8;
                            i12 = i16;
                            solverVariable7 = solverVariable5;
                            linearSystem2.addConstraint(linearSystem.createRow().createRowDimensionRatio(createObjectVariable2, createObjectVariable, createObjectVariable6, createObjectVariable5, f2));
                            obj2 = null;
                            if (obj2 != null || r14 == 2 || z3) {
                                obj = obj2;
                            } else {
                                i18 = Math.max(i11, i18);
                                if (i13 > 0) {
                                    i18 = Math.min(i13, i18);
                                    i9 = 6;
                                } else {
                                    i9 = 6;
                                }
                                linearSystem2.addEquality(createObjectVariable2, createObjectVariable, i18, i9);
                                obj = null;
                            }
                        }
                    }
                    createObjectVariable5 = linearSystem2.createObjectVariable(constraintWidget.mParent.getAnchor(Type.TOP));
                    createObjectVariable6 = linearSystem2.createObjectVariable(constraintWidget.mParent.getAnchor(Type.BOTTOM));
                    i11 = i14;
                    i18 = i10;
                    solverVariable6 = createObjectVariable3;
                    i13 = z2;
                    z2 = z8;
                    i12 = i16;
                    solverVariable7 = solverVariable5;
                    linearSystem2.addConstraint(linearSystem.createRow().createRowDimensionRatio(createObjectVariable2, createObjectVariable, createObjectVariable6, createObjectVariable5, f2));
                    obj2 = null;
                    if (obj2 != null) {
                    }
                    obj = obj2;
                } else {
                    i11 = i14;
                    i18 = i10;
                    i12 = i16;
                    solverVariable6 = createObjectVariable3;
                    solverVariable7 = solverVariable5;
                    i13 = z2;
                    z2 = z8;
                }
            } else if (z) {
                linearSystem2.addEquality(createObjectVariable2, createObjectVariable, i10, 6);
                z2 = z8;
                i11 = i14;
                i18 = i10;
                i12 = i16;
                solverVariable6 = createObjectVariable3;
                solverVariable7 = solverVariable5;
                i13 = z6;
            } else if (z4) {
                z2 = z6;
                linearSystem2.addEquality(createObjectVariable2, createObjectVariable, i10, 4);
                i11 = i14;
                i18 = i10;
                i12 = i16;
                solverVariable6 = createObjectVariable3;
                solverVariable7 = solverVariable5;
                i13 = z2;
                z2 = z8;
            } else {
                z2 = z6;
                linearSystem2.addEquality(createObjectVariable2, createObjectVariable, i10, 1);
                i11 = i14;
                i18 = i10;
                i12 = i16;
                solverVariable6 = createObjectVariable3;
                solverVariable7 = solverVariable5;
                i13 = z2;
                z2 = z8;
            }
            obj2 = obj;
            if (obj2 != null) {
            }
            obj = obj2;
        }
        if (z5) {
            if (!z4) {
                if (isConnected || isConnected2 || isConnected3) {
                    if (!isConnected || isConnected2) {
                        if (isConnected || !isConnected2) {
                            createObjectVariable4 = solverVariable7;
                            if (isConnected && isConnected2) {
                                SolverVariable solverVariable9;
                                Object obj3;
                                int i19;
                                Object obj4;
                                SolverVariable solverVariable10;
                                SolverVariable solverVariable11;
                                boolean z9;
                                ConstraintWidget constraintWidget2;
                                if (obj != null) {
                                    if (z && i8 == 0) {
                                        linearSystem2.addGreaterThan(createObjectVariable2, createObjectVariable, 0, 6);
                                    }
                                    if (z2) {
                                        z6 = z2;
                                        solverVariable9 = solverVariable6;
                                        if (z6) {
                                            obj3 = 1;
                                            constraintWidget2 = this;
                                            i19 = 6;
                                            obj4 = 1;
                                        } else if (z6) {
                                            if (z3) {
                                                constraintWidget2 = this;
                                            } else if (this.mResolvedDimensionRatioSide != -1 && i13 <= 0) {
                                                i8 = 6;
                                                linearSystem2.addEquality(createObjectVariable, solverVariable9, constraintAnchor.getMargin(), i8);
                                                linearSystem2.addEquality(createObjectVariable2, createObjectVariable4, -constraintAnchor2.getMargin(), i8);
                                                obj3 = 1;
                                                i19 = 5;
                                                obj4 = 1;
                                            }
                                            i8 = 4;
                                            linearSystem2.addEquality(createObjectVariable, solverVariable9, constraintAnchor.getMargin(), i8);
                                            linearSystem2.addEquality(createObjectVariable2, createObjectVariable4, -constraintAnchor2.getMargin(), i8);
                                            obj3 = 1;
                                            i19 = 5;
                                            obj4 = 1;
                                        } else {
                                            constraintWidget2 = this;
                                            obj3 = null;
                                            i19 = 5;
                                            obj4 = null;
                                        }
                                    } else {
                                        Object obj5;
                                        if (i13 <= 0) {
                                            if (i11 <= 0) {
                                                i9 = 6;
                                                obj5 = null;
                                                solverVariable9 = solverVariable6;
                                                linearSystem2.addEquality(createObjectVariable, solverVariable9, constraintAnchor.getMargin(), i9);
                                                linearSystem2.addEquality(createObjectVariable2, createObjectVariable4, -constraintAnchor2.getMargin(), i9);
                                                if (i13 <= 0) {
                                                    if (i11 > 0) {
                                                        obj3 = null;
                                                        obj4 = obj5;
                                                        constraintWidget2 = this;
                                                        i19 = 5;
                                                    }
                                                }
                                                obj3 = 1;
                                                obj4 = obj5;
                                                constraintWidget2 = this;
                                                i19 = 5;
                                            }
                                        }
                                        i9 = 4;
                                        obj5 = 1;
                                        solverVariable9 = solverVariable6;
                                        linearSystem2.addEquality(createObjectVariable, solverVariable9, constraintAnchor.getMargin(), i9);
                                        linearSystem2.addEquality(createObjectVariable2, createObjectVariable4, -constraintAnchor2.getMargin(), i9);
                                        if (i13 <= 0) {
                                            if (i11 > 0) {
                                                obj3 = null;
                                                obj4 = obj5;
                                                constraintWidget2 = this;
                                                i19 = 5;
                                            }
                                        }
                                        obj3 = 1;
                                        obj4 = obj5;
                                        constraintWidget2 = this;
                                        i19 = 5;
                                    }
                                } else {
                                    solverVariable9 = solverVariable6;
                                    constraintWidget2 = this;
                                    obj3 = 1;
                                    i19 = 5;
                                    obj4 = null;
                                }
                                if (obj3 != null) {
                                    solverVariable10 = createObjectVariable4;
                                    solverVariable11 = solverVariable9;
                                    solverVariable8 = createObjectVariable2;
                                    linearSystem.addCentering(createObjectVariable, solverVariable9, constraintAnchor.getMargin(), f, createObjectVariable4, createObjectVariable2, constraintAnchor2.getMargin(), i19);
                                    z7 = constraintAnchor.mTarget.mOwner instanceof Barrier;
                                    boolean z10 = constraintAnchor2.mTarget.mOwner instanceof Barrier;
                                    if (z7 && !z10) {
                                        z9 = z;
                                        z7 = true;
                                        i14 = 5;
                                        i10 = 6;
                                        if (obj4 != null) {
                                            i14 = 6;
                                            i10 = 6;
                                        }
                                        linearSystem2.addGreaterThan(createObjectVariable, solverVariable11, constraintAnchor.getMargin(), i14);
                                        linearSystem2.addLowerThan(solverVariable8, solverVariable10, -constraintAnchor2.getMargin(), i10);
                                        if (z) {
                                            i8 = 0;
                                            i9 = 6;
                                        } else {
                                            i8 = 0;
                                            i9 = 6;
                                            linearSystem2.addGreaterThan(createObjectVariable, solverVariable3, 0, 6);
                                        }
                                    } else if (!z7 && z10) {
                                        z7 = z;
                                        i14 = 6;
                                        i10 = 5;
                                        z9 = true;
                                        if (obj4 != null) {
                                            i14 = 6;
                                            i10 = 6;
                                        }
                                        if ((obj == null && r26) || obj4 != null) {
                                            linearSystem2.addGreaterThan(createObjectVariable, solverVariable11, constraintAnchor.getMargin(), i14);
                                        }
                                        if ((obj == null && r2) || obj4 != null) {
                                            linearSystem2.addLowerThan(solverVariable8, solverVariable10, -constraintAnchor2.getMargin(), i10);
                                        }
                                        if (z) {
                                            i8 = 0;
                                            i9 = 6;
                                            linearSystem2.addGreaterThan(createObjectVariable, solverVariable3, 0, 6);
                                        } else {
                                            i8 = 0;
                                            i9 = 6;
                                        }
                                    }
                                } else {
                                    solverVariable11 = solverVariable9;
                                    solverVariable10 = createObjectVariable4;
                                    solverVariable8 = createObjectVariable2;
                                    ConstraintAnchor constraintAnchor4 = constraintAnchor;
                                    ConstraintAnchor constraintAnchor5 = constraintAnchor2;
                                }
                                z7 = z;
                                z9 = z7;
                                i14 = 5;
                                i10 = 5;
                                if (obj4 != null) {
                                    i14 = 6;
                                    i10 = 6;
                                }
                                linearSystem2.addGreaterThan(createObjectVariable, solverVariable11, constraintAnchor.getMargin(), i14);
                                linearSystem2.addLowerThan(solverVariable8, solverVariable10, -constraintAnchor2.getMargin(), i10);
                                if (z) {
                                    i8 = 0;
                                    i9 = 6;
                                    linearSystem2.addGreaterThan(createObjectVariable, solverVariable3, 0, 6);
                                } else {
                                    i8 = 0;
                                    i9 = 6;
                                }
                            } else {
                                solverVariable8 = createObjectVariable2;
                                i8 = 0;
                                i9 = 6;
                            }
                        } else {
                            linearSystem2.addEquality(createObjectVariable2, solverVariable7, -constraintAnchor2.getMargin(), 6);
                            if (z) {
                                linearSystem2.addGreaterThan(createObjectVariable, solverVariable3, 0, 5);
                                solverVariable8 = createObjectVariable2;
                                i8 = 0;
                                i9 = 6;
                            } else {
                                solverVariable8 = createObjectVariable2;
                                i8 = 0;
                                i9 = 6;
                            }
                        }
                    } else if (z) {
                        linearSystem2.addGreaterThan(solverVariable4, createObjectVariable2, 0, 5);
                        solverVariable8 = createObjectVariable2;
                        i8 = 0;
                        i9 = 6;
                    } else {
                        solverVariable8 = createObjectVariable2;
                        i8 = 0;
                        i9 = 6;
                    }
                } else if (z) {
                    linearSystem2.addGreaterThan(solverVariable4, createObjectVariable2, 0, 5);
                    solverVariable8 = createObjectVariable2;
                    i8 = 0;
                    i9 = 6;
                } else {
                    solverVariable8 = createObjectVariable2;
                    i8 = 0;
                    i9 = 6;
                }
                if (z) {
                    linearSystem2.addGreaterThan(solverVariable4, solverVariable8, i8, i9);
                }
                return;
            }
        }
        solverVariable8 = createObjectVariable2;
        if (i12 < 2 && z) {
            linearSystem2.addGreaterThan(createObjectVariable, solverVariable3, 0, 6);
            linearSystem2.addGreaterThan(solverVariable4, solverVariable8, 0, 6);
        }
    }

    public void updateFromSolver(LinearSystem linearSystem) {
        int objectVariableValue = linearSystem.getObjectVariableValue(this.mLeft);
        int objectVariableValue2 = linearSystem.getObjectVariableValue(this.mTop);
        int objectVariableValue3 = linearSystem.getObjectVariableValue(this.mRight);
        linearSystem = linearSystem.getObjectVariableValue(this.mBottom);
        int i = linearSystem - objectVariableValue2;
        if (objectVariableValue3 - objectVariableValue < 0 || i < 0 || objectVariableValue == Integer.MIN_VALUE || objectVariableValue == Integer.MAX_VALUE || objectVariableValue2 == Integer.MIN_VALUE || objectVariableValue2 == Integer.MAX_VALUE || objectVariableValue3 == Integer.MIN_VALUE || objectVariableValue3 == Integer.MAX_VALUE || linearSystem == -2147483648 || linearSystem == 2147483647) {
            linearSystem = null;
            objectVariableValue = 0;
            objectVariableValue2 = 0;
            objectVariableValue3 = 0;
        }
        setFrame(objectVariableValue, objectVariableValue2, objectVariableValue3, linearSystem);
    }
}
