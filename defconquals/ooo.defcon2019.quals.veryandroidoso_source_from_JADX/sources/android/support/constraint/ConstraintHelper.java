package android.support.constraint;

import android.content.Context;
import android.graphics.Canvas;
import android.support.constraint.solver.widgets.Helper;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import java.util.Arrays;

public abstract class ConstraintHelper extends View {
    protected int mCount;
    protected Helper mHelperWidget;
    protected int[] mIds;
    private String mReferenceIds;
    protected boolean mUseViewMeasure;
    protected Context myContext;

    public void onDraw(Canvas canvas) {
    }

    public void updatePostLayout(ConstraintLayout constraintLayout) {
    }

    public void updatePostMeasure(ConstraintLayout constraintLayout) {
    }

    public ConstraintHelper(Context context) {
        super(context);
        this.mIds = new int[32];
        this.mUseViewMeasure = false;
        this.myContext = context;
        init(null);
    }

    public ConstraintHelper(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mIds = new int[32];
        this.mUseViewMeasure = false;
        this.myContext = context;
        init(attributeSet);
    }

    public ConstraintHelper(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mIds = new int[32];
        this.mUseViewMeasure = false;
        this.myContext = context;
        init(attributeSet);
    }

    protected void init(AttributeSet attributeSet) {
        if (attributeSet != null) {
            attributeSet = getContext().obtainStyledAttributes(attributeSet, C0001R.styleable.ConstraintLayout_Layout);
            int indexCount = attributeSet.getIndexCount();
            for (int i = 0; i < indexCount; i++) {
                int index = attributeSet.getIndex(i);
                if (index == C0001R.styleable.ConstraintLayout_Layout_constraint_referenced_ids) {
                    this.mReferenceIds = attributeSet.getString(index);
                    setIds(this.mReferenceIds);
                }
            }
        }
    }

    public int[] getReferencedIds() {
        return Arrays.copyOf(this.mIds, this.mCount);
    }

    public void setReferencedIds(int[] iArr) {
        int i = 0;
        this.mCount = 0;
        while (i < iArr.length) {
            setTag(iArr[i], null);
            i++;
        }
    }

    public void setTag(int i, Object obj) {
        obj = this.mCount + 1;
        int[] iArr = this.mIds;
        if (obj > iArr.length) {
            this.mIds = Arrays.copyOf(iArr, iArr.length * 2);
        }
        obj = this.mIds;
        int i2 = this.mCount;
        obj[i2] = i;
        this.mCount = i2 + 1;
    }

    protected void onMeasure(int i, int i2) {
        if (this.mUseViewMeasure) {
            super.onMeasure(i, i2);
        } else {
            setMeasuredDimension(0, 0);
        }
    }

    public void validateParams() {
        if (this.mHelperWidget != null) {
            LayoutParams layoutParams = getLayoutParams();
            if (layoutParams instanceof ConstraintLayout.LayoutParams) {
                ((ConstraintLayout.LayoutParams) layoutParams).widget = this.mHelperWidget;
            }
        }
    }

    private void addID(java.lang.String r6) {
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
	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:282)
	at jadx.api.JavaClass.decompile(JavaClass.java:62)
	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:200)
	at jadx.api.JadxDecompiler$$Lambda$8/1860513229.run(Unknown Source)
*/
        /*
        r5 = this;
        if (r6 != 0) goto L_0x0003;
    L_0x0002:
        return;
    L_0x0003:
        r0 = r5.myContext;
        if (r0 != 0) goto L_0x0008;
    L_0x0007:
        return;
    L_0x0008:
        r6 = r6.trim();
        r0 = 0;
        r1 = 0;
        r2 = android.support.constraint.C0001R.id.class;	 Catch:{ Exception -> 0x0019 }
        r2 = r2.getField(r6);	 Catch:{ Exception -> 0x0019 }
        r2 = r2.getInt(r0);	 Catch:{ Exception -> 0x0019 }
        goto L_0x001a;
    L_0x0019:
        r2 = 0;
    L_0x001a:
        if (r2 != 0) goto L_0x002e;
    L_0x001c:
        r2 = r5.myContext;
        r2 = r2.getResources();
        r3 = "id";
        r4 = r5.myContext;
        r4 = r4.getPackageName();
        r2 = r2.getIdentifier(r6, r3, r4);
    L_0x002e:
        if (r2 != 0) goto L_0x0054;
    L_0x0030:
        r3 = r5.isInEditMode();
        if (r3 == 0) goto L_0x0054;
    L_0x0036:
        r3 = r5.getParent();
        r3 = r3 instanceof android.support.constraint.ConstraintLayout;
        if (r3 == 0) goto L_0x0054;
    L_0x003e:
        r3 = r5.getParent();
        r3 = (android.support.constraint.ConstraintLayout) r3;
        r1 = r3.getDesignInformation(r1, r6);
        if (r1 == 0) goto L_0x0054;
    L_0x004a:
        r3 = r1 instanceof java.lang.Integer;
        if (r3 == 0) goto L_0x0054;
    L_0x004e:
        r1 = (java.lang.Integer) r1;
        r2 = r1.intValue();
    L_0x0054:
        if (r2 == 0) goto L_0x005a;
    L_0x0056:
        r5.setTag(r2, r0);
        goto L_0x0075;
    L_0x005a:
        r0 = "ConstraintHelper";
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "Could not find id of \"";
        r1.append(r2);
        r1.append(r6);
        r6 = "\"";
        r1.append(r6);
        r6 = r1.toString();
        android.util.Log.w(r0, r6);
    L_0x0075:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.constraint.ConstraintHelper.addID(java.lang.String):void");
    }

    private void setIds(String str) {
        if (str != null) {
            int i = 0;
            while (true) {
                int indexOf = str.indexOf(44, i);
                if (indexOf == -1) {
                    addID(str.substring(i));
                    return;
                } else {
                    addID(str.substring(i, indexOf));
                    i = indexOf + 1;
                }
            }
        }
    }

    public void updatePreLayout(ConstraintLayout constraintLayout) {
        if (isInEditMode()) {
            setIds(this.mReferenceIds);
        }
        Helper helper = this.mHelperWidget;
        if (helper != null) {
            helper.removeAllIds();
            for (int i = 0; i < this.mCount; i++) {
                View viewById = constraintLayout.getViewById(this.mIds[i]);
                if (viewById != null) {
                    this.mHelperWidget.add(constraintLayout.getViewWidget(viewById));
                }
            }
        }
    }
}
