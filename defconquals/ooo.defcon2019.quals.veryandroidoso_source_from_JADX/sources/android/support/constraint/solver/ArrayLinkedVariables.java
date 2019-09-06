package android.support.constraint.solver;

import android.support.constraint.solver.SolverVariable.Type;
import java.io.PrintStream;
import ooo.defcon2019.quals.veryandroidoso.BuildConfig;

public class ArrayLinkedVariables {
    private static final boolean DEBUG = false;
    private static final boolean FULL_NEW_CHECK = false;
    private static final int NONE = -1;
    private int ROW_SIZE = 8;
    private SolverVariable candidate = null;
    int currentSize = 0;
    private int[] mArrayIndices;
    private int[] mArrayNextIndices;
    private float[] mArrayValues;
    private final Cache mCache;
    private boolean mDidFillOnce;
    private int mHead;
    private int mLast;
    private final ArrayRow mRow;

    ArrayLinkedVariables(ArrayRow arrayRow, Cache cache) {
        int i = this.ROW_SIZE;
        this.mArrayIndices = new int[i];
        this.mArrayNextIndices = new int[i];
        this.mArrayValues = new float[i];
        this.mHead = -1;
        this.mLast = -1;
        this.mDidFillOnce = false;
        this.mRow = arrayRow;
        this.mCache = cache;
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public final void put(android.support.constraint.solver.SolverVariable r9, float r10) {
        /*
        r8 = this;
        r0 = 1;
        r1 = 0;
        r1 = (r10 > r1 ? 1 : (r10 == r1 ? 0 : -1));
        if (r1 != 0) goto L_0x000a;
    L_0x0006:
        r8.remove(r9, r0);
        return;
    L_0x000a:
        r1 = r8.mHead;
        r2 = 0;
        r3 = -1;
        if (r1 != r3) goto L_0x004a;
    L_0x0010:
        r8.mHead = r2;
        r1 = r8.mArrayValues;
        r2 = r8.mHead;
        r1[r2] = r10;
        r10 = r8.mArrayIndices;
        r1 = r9.id;
        r10[r2] = r1;
        r10 = r8.mArrayNextIndices;
        r1 = r8.mHead;
        r10[r1] = r3;
        r10 = r9.usageInRowCount;
        r10 = r10 + r0;
        r9.usageInRowCount = r10;
        r10 = r8.mRow;
        r9.addToRow(r10);
        r9 = r8.currentSize;
        r9 = r9 + r0;
        r8.currentSize = r9;
        r9 = r8.mDidFillOnce;
        if (r9 != 0) goto L_0x0049;
    L_0x0037:
        r9 = r8.mLast;
        r9 = r9 + r0;
        r8.mLast = r9;
        r9 = r8.mLast;
        r10 = r8.mArrayIndices;
        r1 = r10.length;
        if (r9 < r1) goto L_0x0049;
    L_0x0043:
        r8.mDidFillOnce = r0;
        r9 = r10.length;
        r9 = r9 - r0;
        r8.mLast = r9;
    L_0x0049:
        return;
    L_0x004a:
        r4 = 0;
        r5 = -1;
    L_0x004c:
        if (r1 == r3) goto L_0x006f;
    L_0x004e:
        r6 = r8.currentSize;
        if (r4 >= r6) goto L_0x006f;
    L_0x0052:
        r6 = r8.mArrayIndices;
        r6 = r6[r1];
        r7 = r9.id;
        if (r6 != r7) goto L_0x005f;
    L_0x005a:
        r9 = r8.mArrayValues;
        r9[r1] = r10;
        return;
    L_0x005f:
        r6 = r8.mArrayIndices;
        r6 = r6[r1];
        r7 = r9.id;
        if (r6 >= r7) goto L_0x0068;
    L_0x0067:
        r5 = r1;
    L_0x0068:
        r6 = r8.mArrayNextIndices;
        r1 = r6[r1];
        r4 = r4 + 1;
        goto L_0x004c;
    L_0x006f:
        r1 = r8.mLast;
        r4 = r1 + 1;
        r6 = r8.mDidFillOnce;
        if (r6 == 0) goto L_0x0080;
    L_0x0077:
        r4 = r8.mArrayIndices;
        r6 = r4[r1];
        if (r6 != r3) goto L_0x007e;
    L_0x007d:
        goto L_0x0081;
    L_0x007e:
        r1 = r4.length;
        goto L_0x0081;
    L_0x0080:
        r1 = r4;
    L_0x0081:
        r4 = r8.mArrayIndices;
        r6 = r4.length;
        if (r1 < r6) goto L_0x009a;
    L_0x0086:
        r6 = r8.currentSize;
        r4 = r4.length;
        if (r6 >= r4) goto L_0x009a;
    L_0x008b:
        r4 = 0;
    L_0x008c:
        r6 = r8.mArrayIndices;
        r7 = r6.length;
        if (r4 >= r7) goto L_0x009a;
    L_0x0091:
        r6 = r6[r4];
        if (r6 != r3) goto L_0x0097;
    L_0x0095:
        r1 = r4;
        goto L_0x009a;
    L_0x0097:
        r4 = r4 + 1;
        goto L_0x008c;
    L_0x009a:
        r4 = r8.mArrayIndices;
        r6 = r4.length;
        if (r1 < r6) goto L_0x00ca;
    L_0x009f:
        r1 = r4.length;
        r4 = r8.ROW_SIZE;
        r4 = r4 * 2;
        r8.ROW_SIZE = r4;
        r8.mDidFillOnce = r2;
        r2 = r1 + -1;
        r8.mLast = r2;
        r2 = r8.mArrayValues;
        r4 = r8.ROW_SIZE;
        r2 = java.util.Arrays.copyOf(r2, r4);
        r8.mArrayValues = r2;
        r2 = r8.mArrayIndices;
        r4 = r8.ROW_SIZE;
        r2 = java.util.Arrays.copyOf(r2, r4);
        r8.mArrayIndices = r2;
        r2 = r8.mArrayNextIndices;
        r4 = r8.ROW_SIZE;
        r2 = java.util.Arrays.copyOf(r2, r4);
        r8.mArrayNextIndices = r2;
    L_0x00ca:
        r2 = r8.mArrayIndices;
        r4 = r9.id;
        r2[r1] = r4;
        r2 = r8.mArrayValues;
        r2[r1] = r10;
        if (r5 == r3) goto L_0x00df;
    L_0x00d6:
        r10 = r8.mArrayNextIndices;
        r2 = r10[r5];
        r10[r1] = r2;
        r10[r5] = r1;
        goto L_0x00e7;
    L_0x00df:
        r10 = r8.mArrayNextIndices;
        r2 = r8.mHead;
        r10[r1] = r2;
        r8.mHead = r1;
    L_0x00e7:
        r10 = r9.usageInRowCount;
        r10 = r10 + r0;
        r9.usageInRowCount = r10;
        r10 = r8.mRow;
        r9.addToRow(r10);
        r9 = r8.currentSize;
        r9 = r9 + r0;
        r8.currentSize = r9;
        r9 = r8.mDidFillOnce;
        if (r9 != 0) goto L_0x00ff;
    L_0x00fa:
        r9 = r8.mLast;
        r9 = r9 + r0;
        r8.mLast = r9;
    L_0x00ff:
        r9 = r8.currentSize;
        r10 = r8.mArrayIndices;
        r10 = r10.length;
        if (r9 < r10) goto L_0x0108;
    L_0x0106:
        r8.mDidFillOnce = r0;
    L_0x0108:
        r9 = r8.mLast;
        r10 = r8.mArrayIndices;
        r1 = r10.length;
        if (r9 < r1) goto L_0x0115;
    L_0x010f:
        r8.mDidFillOnce = r0;
        r9 = r10.length;
        r9 = r9 - r0;
        r8.mLast = r9;
    L_0x0115:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.constraint.solver.ArrayLinkedVariables.put(android.support.constraint.solver.SolverVariable, float):void");
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    final void add(android.support.constraint.solver.SolverVariable r10, float r11, boolean r12) {
        /*
        r9 = this;
        r0 = 0;
        r1 = (r11 > r0 ? 1 : (r11 == r0 ? 0 : -1));
        if (r1 != 0) goto L_0x0006;
    L_0x0005:
        return;
    L_0x0006:
        r1 = r9.mHead;
        r2 = 0;
        r3 = -1;
        r4 = 1;
        if (r1 != r3) goto L_0x0047;
    L_0x000d:
        r9.mHead = r2;
        r12 = r9.mArrayValues;
        r0 = r9.mHead;
        r12[r0] = r11;
        r11 = r9.mArrayIndices;
        r12 = r10.id;
        r11[r0] = r12;
        r11 = r9.mArrayNextIndices;
        r12 = r9.mHead;
        r11[r12] = r3;
        r11 = r10.usageInRowCount;
        r11 = r11 + r4;
        r10.usageInRowCount = r11;
        r11 = r9.mRow;
        r10.addToRow(r11);
        r10 = r9.currentSize;
        r10 = r10 + r4;
        r9.currentSize = r10;
        r10 = r9.mDidFillOnce;
        if (r10 != 0) goto L_0x0046;
    L_0x0034:
        r10 = r9.mLast;
        r10 = r10 + r4;
        r9.mLast = r10;
        r10 = r9.mLast;
        r11 = r9.mArrayIndices;
        r12 = r11.length;
        if (r10 < r12) goto L_0x0046;
    L_0x0040:
        r9.mDidFillOnce = r4;
        r10 = r11.length;
        r10 = r10 - r4;
        r9.mLast = r10;
    L_0x0046:
        return;
    L_0x0047:
        r5 = 0;
        r6 = -1;
    L_0x0049:
        if (r1 == r3) goto L_0x009d;
    L_0x004b:
        r7 = r9.currentSize;
        if (r5 >= r7) goto L_0x009d;
    L_0x004f:
        r7 = r9.mArrayIndices;
        r7 = r7[r1];
        r8 = r10.id;
        if (r7 != r8) goto L_0x008d;
    L_0x0057:
        r2 = r9.mArrayValues;
        r3 = r2[r1];
        r3 = r3 + r11;
        r2[r1] = r3;
        r11 = r2[r1];
        r11 = (r11 > r0 ? 1 : (r11 == r0 ? 0 : -1));
        if (r11 != 0) goto L_0x008c;
    L_0x0064:
        r11 = r9.mHead;
        if (r1 != r11) goto L_0x006f;
    L_0x0068:
        r11 = r9.mArrayNextIndices;
        r11 = r11[r1];
        r9.mHead = r11;
        goto L_0x0075;
    L_0x006f:
        r11 = r9.mArrayNextIndices;
        r0 = r11[r1];
        r11[r6] = r0;
    L_0x0075:
        if (r12 == 0) goto L_0x007c;
    L_0x0077:
        r11 = r9.mRow;
        r10.removeFromRow(r11);
    L_0x007c:
        r11 = r9.mDidFillOnce;
        if (r11 == 0) goto L_0x0082;
    L_0x0080:
        r9.mLast = r1;
    L_0x0082:
        r11 = r10.usageInRowCount;
        r11 = r11 - r4;
        r10.usageInRowCount = r11;
        r10 = r9.currentSize;
        r10 = r10 - r4;
        r9.currentSize = r10;
    L_0x008c:
        return;
    L_0x008d:
        r7 = r9.mArrayIndices;
        r7 = r7[r1];
        r8 = r10.id;
        if (r7 >= r8) goto L_0x0096;
    L_0x0095:
        r6 = r1;
    L_0x0096:
        r7 = r9.mArrayNextIndices;
        r1 = r7[r1];
        r5 = r5 + 1;
        goto L_0x0049;
    L_0x009d:
        r12 = r9.mLast;
        r0 = r12 + 1;
        r1 = r9.mDidFillOnce;
        if (r1 == 0) goto L_0x00ae;
    L_0x00a5:
        r0 = r9.mArrayIndices;
        r1 = r0[r12];
        if (r1 != r3) goto L_0x00ac;
    L_0x00ab:
        goto L_0x00af;
    L_0x00ac:
        r12 = r0.length;
        goto L_0x00af;
    L_0x00ae:
        r12 = r0;
    L_0x00af:
        r0 = r9.mArrayIndices;
        r1 = r0.length;
        if (r12 < r1) goto L_0x00c8;
    L_0x00b4:
        r1 = r9.currentSize;
        r0 = r0.length;
        if (r1 >= r0) goto L_0x00c8;
    L_0x00b9:
        r0 = 0;
    L_0x00ba:
        r1 = r9.mArrayIndices;
        r5 = r1.length;
        if (r0 >= r5) goto L_0x00c8;
    L_0x00bf:
        r1 = r1[r0];
        if (r1 != r3) goto L_0x00c5;
    L_0x00c3:
        r12 = r0;
        goto L_0x00c8;
    L_0x00c5:
        r0 = r0 + 1;
        goto L_0x00ba;
    L_0x00c8:
        r0 = r9.mArrayIndices;
        r1 = r0.length;
        if (r12 < r1) goto L_0x00f8;
    L_0x00cd:
        r12 = r0.length;
        r0 = r9.ROW_SIZE;
        r0 = r0 * 2;
        r9.ROW_SIZE = r0;
        r9.mDidFillOnce = r2;
        r0 = r12 + -1;
        r9.mLast = r0;
        r0 = r9.mArrayValues;
        r1 = r9.ROW_SIZE;
        r0 = java.util.Arrays.copyOf(r0, r1);
        r9.mArrayValues = r0;
        r0 = r9.mArrayIndices;
        r1 = r9.ROW_SIZE;
        r0 = java.util.Arrays.copyOf(r0, r1);
        r9.mArrayIndices = r0;
        r0 = r9.mArrayNextIndices;
        r1 = r9.ROW_SIZE;
        r0 = java.util.Arrays.copyOf(r0, r1);
        r9.mArrayNextIndices = r0;
    L_0x00f8:
        r0 = r9.mArrayIndices;
        r1 = r10.id;
        r0[r12] = r1;
        r0 = r9.mArrayValues;
        r0[r12] = r11;
        if (r6 == r3) goto L_0x010d;
    L_0x0104:
        r11 = r9.mArrayNextIndices;
        r0 = r11[r6];
        r11[r12] = r0;
        r11[r6] = r12;
        goto L_0x0115;
    L_0x010d:
        r11 = r9.mArrayNextIndices;
        r0 = r9.mHead;
        r11[r12] = r0;
        r9.mHead = r12;
    L_0x0115:
        r11 = r10.usageInRowCount;
        r11 = r11 + r4;
        r10.usageInRowCount = r11;
        r11 = r9.mRow;
        r10.addToRow(r11);
        r10 = r9.currentSize;
        r10 = r10 + r4;
        r9.currentSize = r10;
        r10 = r9.mDidFillOnce;
        if (r10 != 0) goto L_0x012d;
    L_0x0128:
        r10 = r9.mLast;
        r10 = r10 + r4;
        r9.mLast = r10;
    L_0x012d:
        r10 = r9.mLast;
        r11 = r9.mArrayIndices;
        r12 = r11.length;
        if (r10 < r12) goto L_0x013a;
    L_0x0134:
        r9.mDidFillOnce = r4;
        r10 = r11.length;
        r10 = r10 - r4;
        r9.mLast = r10;
    L_0x013a:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.constraint.solver.ArrayLinkedVariables.add(android.support.constraint.solver.SolverVariable, float, boolean):void");
    }

    public final float remove(SolverVariable solverVariable, boolean z) {
        if (this.candidate == solverVariable) {
            this.candidate = null;
        }
        int i = this.mHead;
        if (i == -1) {
            return 0.0f;
        }
        int i2 = 0;
        int i3 = -1;
        while (i != -1 && i2 < this.currentSize) {
            if (this.mArrayIndices[i] == solverVariable.id) {
                if (i == this.mHead) {
                    this.mHead = this.mArrayNextIndices[i];
                } else {
                    int[] iArr = this.mArrayNextIndices;
                    iArr[i3] = iArr[i];
                }
                if (z) {
                    solverVariable.removeFromRow(this.mRow);
                }
                solverVariable.usageInRowCount--;
                this.currentSize--;
                this.mArrayIndices[i] = -1;
                if (this.mDidFillOnce != null) {
                    this.mLast = i;
                }
                return this.mArrayValues[i];
            }
            i2++;
            i3 = i;
            i = this.mArrayNextIndices[i];
        }
        return 0.0f;
    }

    public final void clear() {
        int i = this.mHead;
        int i2 = 0;
        while (i != -1 && i2 < this.currentSize) {
            SolverVariable solverVariable = this.mCache.mIndexedVariables[this.mArrayIndices[i]];
            if (solverVariable != null) {
                solverVariable.removeFromRow(this.mRow);
            }
            i = this.mArrayNextIndices[i];
            i2++;
        }
        this.mHead = -1;
        this.mLast = -1;
        this.mDidFillOnce = false;
        this.currentSize = 0;
    }

    final boolean containsKey(SolverVariable solverVariable) {
        int i = this.mHead;
        if (i == -1) {
            return false;
        }
        int i2 = 0;
        while (i != -1 && i2 < this.currentSize) {
            if (this.mArrayIndices[i] == solverVariable.id) {
                return true;
            }
            i = this.mArrayNextIndices[i];
            i2++;
        }
        return false;
    }

    boolean hasAtLeastOnePositiveVariable() {
        int i = this.mHead;
        int i2 = 0;
        while (i != -1 && i2 < this.currentSize) {
            if (this.mArrayValues[i] > 0.0f) {
                return true;
            }
            i = this.mArrayNextIndices[i];
            i2++;
        }
        return false;
    }

    void invert() {
        int i = this.mHead;
        int i2 = 0;
        while (i != -1 && i2 < this.currentSize) {
            float[] fArr = this.mArrayValues;
            fArr[i] = fArr[i] * -1.0f;
            i = this.mArrayNextIndices[i];
            i2++;
        }
    }

    void divideByAmount(float f) {
        int i = this.mHead;
        int i2 = 0;
        while (i != -1 && i2 < this.currentSize) {
            float[] fArr = this.mArrayValues;
            fArr[i] = fArr[i] / f;
            i = this.mArrayNextIndices[i];
            i2++;
        }
    }

    private boolean isNew(SolverVariable solverVariable, LinearSystem linearSystem) {
        return solverVariable.usageInRowCount <= 1 ? true : null;
    }

    SolverVariable chooseSubject(LinearSystem linearSystem) {
        int i = this.mHead;
        SolverVariable solverVariable = null;
        int i2 = 0;
        SolverVariable solverVariable2 = null;
        float f = 0.0f;
        boolean z = false;
        float f2 = 0.0f;
        boolean z2 = false;
        while (i != -1 && i2 < this.currentSize) {
            float f3 = this.mArrayValues[i];
            SolverVariable solverVariable3 = this.mCache.mIndexedVariables[this.mArrayIndices[i]];
            if (f3 < 0.0f) {
                if (f3 > -0.001f) {
                    this.mArrayValues[i] = 0.0f;
                    solverVariable3.removeFromRow(this.mRow);
                    f3 = 0.0f;
                }
            } else if (f3 < 0.001f) {
                this.mArrayValues[i] = 0.0f;
                solverVariable3.removeFromRow(this.mRow);
                f3 = 0.0f;
            }
            if (f3 != 0.0f) {
                if (solverVariable3.mType == Type.UNRESTRICTED) {
                    if (solverVariable2 == null) {
                        z = isNew(solverVariable3, linearSystem);
                        f = f3;
                        solverVariable2 = solverVariable3;
                    } else if (f > f3) {
                        z = isNew(solverVariable3, linearSystem);
                        f = f3;
                        solverVariable2 = solverVariable3;
                    } else if (!z && isNew(solverVariable3, linearSystem)) {
                        f = f3;
                        solverVariable2 = solverVariable3;
                        z = true;
                    }
                } else if (solverVariable2 == null && f3 < 0.0f) {
                    if (solverVariable == null) {
                        z2 = isNew(solverVariable3, linearSystem);
                        f2 = f3;
                        solverVariable = solverVariable3;
                    } else if (f2 > f3) {
                        z2 = isNew(solverVariable3, linearSystem);
                        f2 = f3;
                        solverVariable = solverVariable3;
                    } else if (!z2 && isNew(solverVariable3, linearSystem)) {
                        f2 = f3;
                        solverVariable = solverVariable3;
                        z2 = true;
                    }
                }
            }
            i = this.mArrayNextIndices[i];
            i2++;
        }
        return solverVariable2 != null ? solverVariable2 : solverVariable;
    }

    final void updateFromRow(ArrayRow arrayRow, ArrayRow arrayRow2, boolean z) {
        int i = this.mHead;
        int i2 = 0;
        while (i != -1 && i2 < this.currentSize) {
            if (this.mArrayIndices[i] == arrayRow2.variable.id) {
                float f = this.mArrayValues[i];
                remove(arrayRow2.variable, z);
                ArrayLinkedVariables arrayLinkedVariables = arrayRow2.variables;
                int i3 = arrayLinkedVariables.mHead;
                int i4 = 0;
                while (i3 != -1 && i4 < arrayLinkedVariables.currentSize) {
                    add(this.mCache.mIndexedVariables[arrayLinkedVariables.mArrayIndices[i3]], arrayLinkedVariables.mArrayValues[i3] * f, z);
                    i3 = arrayLinkedVariables.mArrayNextIndices[i3];
                    i4++;
                }
                arrayRow.constantValue += arrayRow2.constantValue * f;
                if (z) {
                    arrayRow2.variable.removeFromRow(arrayRow);
                }
                i = this.mHead;
                i2 = 0;
            } else {
                i = this.mArrayNextIndices[i];
                i2++;
            }
        }
    }

    void updateFromSystem(ArrayRow arrayRow, ArrayRow[] arrayRowArr) {
        int i = this.mHead;
        int i2 = 0;
        while (i != -1 && i2 < this.currentSize) {
            SolverVariable solverVariable = this.mCache.mIndexedVariables[this.mArrayIndices[i]];
            if (solverVariable.definitionId != -1) {
                float f = this.mArrayValues[i];
                remove(solverVariable, true);
                ArrayRow arrayRow2 = arrayRowArr[solverVariable.definitionId];
                if (!arrayRow2.isSimpleDefinition) {
                    ArrayLinkedVariables arrayLinkedVariables = arrayRow2.variables;
                    int i3 = arrayLinkedVariables.mHead;
                    int i4 = 0;
                    while (i3 != -1 && i4 < arrayLinkedVariables.currentSize) {
                        add(this.mCache.mIndexedVariables[arrayLinkedVariables.mArrayIndices[i3]], arrayLinkedVariables.mArrayValues[i3] * f, true);
                        i3 = arrayLinkedVariables.mArrayNextIndices[i3];
                        i4++;
                    }
                }
                arrayRow.constantValue += arrayRow2.constantValue * f;
                arrayRow2.variable.removeFromRow(arrayRow);
                i = this.mHead;
                i2 = 0;
            } else {
                i = this.mArrayNextIndices[i];
                i2++;
            }
        }
    }

    SolverVariable getPivotCandidate() {
        SolverVariable solverVariable = this.candidate;
        if (solverVariable != null) {
            return solverVariable;
        }
        int i = this.mHead;
        int i2 = 0;
        SolverVariable solverVariable2 = null;
        while (i != -1 && i2 < this.currentSize) {
            if (this.mArrayValues[i] < 0.0f) {
                SolverVariable solverVariable3 = this.mCache.mIndexedVariables[this.mArrayIndices[i]];
                if (solverVariable2 == null || solverVariable2.strength < solverVariable3.strength) {
                    solverVariable2 = solverVariable3;
                }
            }
            i = this.mArrayNextIndices[i];
            i2++;
        }
        return solverVariable2;
    }

    SolverVariable getPivotCandidate(boolean[] zArr, SolverVariable solverVariable) {
        int i = this.mHead;
        int i2 = 0;
        SolverVariable solverVariable2 = null;
        float f = 0.0f;
        while (i != -1 && i2 < this.currentSize) {
            if (this.mArrayValues[i] < 0.0f) {
                SolverVariable solverVariable3 = this.mCache.mIndexedVariables[this.mArrayIndices[i]];
                if ((zArr == null || !zArr[solverVariable3.id]) && solverVariable3 != solverVariable && (solverVariable3.mType == Type.SLACK || solverVariable3.mType == Type.ERROR)) {
                    float f2 = this.mArrayValues[i];
                    if (f2 < f) {
                        solverVariable2 = solverVariable3;
                        f = f2;
                    }
                }
            }
            i = this.mArrayNextIndices[i];
            i2++;
        }
        return solverVariable2;
    }

    final SolverVariable getVariable(int i) {
        int i2 = this.mHead;
        int i3 = 0;
        while (i2 != -1 && i3 < this.currentSize) {
            if (i3 == i) {
                return this.mCache.mIndexedVariables[this.mArrayIndices[i2]];
            }
            i2 = this.mArrayNextIndices[i2];
            i3++;
        }
        return 0;
    }

    final float getVariableValue(int i) {
        int i2 = this.mHead;
        int i3 = 0;
        while (i2 != -1 && i3 < this.currentSize) {
            if (i3 == i) {
                return this.mArrayValues[i2];
            }
            i2 = this.mArrayNextIndices[i2];
            i3++;
        }
        return 0;
    }

    public final float get(SolverVariable solverVariable) {
        int i = this.mHead;
        int i2 = 0;
        while (i != -1 && i2 < this.currentSize) {
            if (this.mArrayIndices[i] == solverVariable.id) {
                return this.mArrayValues[i];
            }
            i = this.mArrayNextIndices[i];
            i2++;
        }
        return null;
    }

    int sizeInBytes() {
        return (((this.mArrayIndices.length * 4) * 3) + 0) + 36;
    }

    public void display() {
        int i = this.currentSize;
        System.out.print("{ ");
        for (int i2 = 0; i2 < i; i2++) {
            SolverVariable variable = getVariable(i2);
            if (variable != null) {
                PrintStream printStream = System.out;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(variable);
                stringBuilder.append(" = ");
                stringBuilder.append(getVariableValue(i2));
                stringBuilder.append(" ");
                printStream.print(stringBuilder.toString());
            }
        }
        System.out.println(" }");
    }

    public String toString() {
        String str = BuildConfig.FLAVOR;
        int i = this.mHead;
        int i2 = 0;
        while (i != -1 && i2 < this.currentSize) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(" -> ");
            str = stringBuilder.toString();
            stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(this.mArrayValues[i]);
            stringBuilder.append(" : ");
            str = stringBuilder.toString();
            stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(this.mCache.mIndexedVariables[this.mArrayIndices[i]]);
            str = stringBuilder.toString();
            i = this.mArrayNextIndices[i];
            i2++;
        }
        return str;
    }
}
