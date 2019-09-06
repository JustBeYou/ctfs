package android.support.constraint.solver;

import java.util.Arrays;
import ooo.defcon2019.quals.veryandroidoso.BuildConfig;

public class SolverVariable {
    private static final boolean INTERNAL_DEBUG = false;
    static final int MAX_STRENGTH = 7;
    public static final int STRENGTH_BARRIER = 7;
    public static final int STRENGTH_EQUALITY = 5;
    public static final int STRENGTH_FIXED = 6;
    public static final int STRENGTH_HIGH = 3;
    public static final int STRENGTH_HIGHEST = 4;
    public static final int STRENGTH_LOW = 1;
    public static final int STRENGTH_MEDIUM = 2;
    public static final int STRENGTH_NONE = 0;
    private static int uniqueConstantId = 1;
    private static int uniqueErrorId = 1;
    private static int uniqueId = 1;
    private static int uniqueSlackId = 1;
    private static int uniqueUnrestrictedId = 1;
    public float computedValue;
    int definitionId;
    public int id;
    ArrayRow[] mClientEquations;
    int mClientEquationsCount;
    private String mName;
    Type mType;
    public int strength;
    float[] strengthVector;
    public int usageInRowCount;

    public enum Type {
        UNRESTRICTED,
        CONSTANT,
        SLACK,
        ERROR,
        UNKNOWN
    }

    static void increaseErrorId() {
        uniqueErrorId++;
    }

    private static String getUniqueName(Type type, String str) {
        if (str != null) {
            type = new StringBuilder();
            type.append(str);
            type.append(uniqueErrorId);
            return type.toString();
        }
        switch (type) {
            case UNRESTRICTED:
                type = new StringBuilder();
                type.append("U");
                str = uniqueUnrestrictedId + 1;
                uniqueUnrestrictedId = str;
                type.append(str);
                return type.toString();
            case CONSTANT:
                type = new StringBuilder();
                type.append("C");
                str = uniqueConstantId + 1;
                uniqueConstantId = str;
                type.append(str);
                return type.toString();
            case SLACK:
                type = new StringBuilder();
                type.append("S");
                str = uniqueSlackId + 1;
                uniqueSlackId = str;
                type.append(str);
                return type.toString();
            case ERROR:
                type = new StringBuilder();
                type.append("e");
                str = uniqueErrorId + 1;
                uniqueErrorId = str;
                type.append(str);
                return type.toString();
            case UNKNOWN:
                type = new StringBuilder();
                type.append("V");
                str = uniqueId + 1;
                uniqueId = str;
                type.append(str);
                return type.toString();
            default:
                throw new AssertionError(type.name());
        }
    }

    public SolverVariable(String str, Type type) {
        this.id = -1;
        this.definitionId = -1;
        this.strength = 0;
        this.strengthVector = new float[7];
        this.mClientEquations = new ArrayRow[8];
        this.mClientEquationsCount = 0;
        this.usageInRowCount = 0;
        this.mName = str;
        this.mType = type;
    }

    public SolverVariable(Type type, String str) {
        this.id = -1;
        this.definitionId = -1;
        this.strength = 0;
        this.strengthVector = new float[7];
        this.mClientEquations = new ArrayRow[8];
        this.mClientEquationsCount = 0;
        this.usageInRowCount = 0;
        this.mType = type;
    }

    void clearStrengths() {
        for (int i = 0; i < 7; i++) {
            this.strengthVector[i] = 0.0f;
        }
    }

    String strengthsToString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(this);
        stringBuilder.append("[");
        String stringBuilder2 = stringBuilder.toString();
        Object obj = null;
        Object obj2 = 1;
        for (int i = 0; i < this.strengthVector.length; i++) {
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append(stringBuilder2);
            stringBuilder3.append(this.strengthVector[i]);
            stringBuilder2 = stringBuilder3.toString();
            float[] fArr = this.strengthVector;
            if (fArr[i] > 0.0f) {
                obj = null;
            } else if (fArr[i] < 0.0f) {
                obj = 1;
            }
            if (this.strengthVector[i] != 0.0f) {
                obj2 = null;
            }
            if (i < this.strengthVector.length - 1) {
                stringBuilder3 = new StringBuilder();
                stringBuilder3.append(stringBuilder2);
                stringBuilder3.append(", ");
                stringBuilder2 = stringBuilder3.toString();
            } else {
                stringBuilder3 = new StringBuilder();
                stringBuilder3.append(stringBuilder2);
                stringBuilder3.append("] ");
                stringBuilder2 = stringBuilder3.toString();
            }
        }
        if (obj != null) {
            stringBuilder = new StringBuilder();
            stringBuilder.append(stringBuilder2);
            stringBuilder.append(" (-)");
            stringBuilder2 = stringBuilder.toString();
        }
        if (obj2 == null) {
            return stringBuilder2;
        }
        stringBuilder = new StringBuilder();
        stringBuilder.append(stringBuilder2);
        stringBuilder.append(" (*)");
        return stringBuilder.toString();
    }

    public final void addToRow(ArrayRow arrayRow) {
        int i;
        int i2 = 0;
        while (true) {
            i = this.mClientEquationsCount;
            if (i2 >= i) {
                break;
            } else if (this.mClientEquations[i2] != arrayRow) {
                i2++;
            } else {
                return;
            }
        }
        ArrayRow[] arrayRowArr = this.mClientEquations;
        if (i >= arrayRowArr.length) {
            this.mClientEquations = (ArrayRow[]) Arrays.copyOf(arrayRowArr, arrayRowArr.length * 2);
        }
        arrayRowArr = this.mClientEquations;
        i = this.mClientEquationsCount;
        arrayRowArr[i] = arrayRow;
        this.mClientEquationsCount = i + 1;
    }

    public final void removeFromRow(ArrayRow arrayRow) {
        int i = this.mClientEquationsCount;
        for (int i2 = 0; i2 < i; i2++) {
            if (this.mClientEquations[i2] == arrayRow) {
                for (int i3 = 0; i3 < (i - i2) - 1; i3++) {
                    arrayRow = this.mClientEquations;
                    int i4 = i2 + i3;
                    arrayRow[i4] = arrayRow[i4 + 1];
                }
                this.mClientEquationsCount--;
                return;
            }
        }
    }

    public final void updateReferencesWithNewDefinition(ArrayRow arrayRow) {
        int i = this.mClientEquationsCount;
        for (int i2 = 0; i2 < i; i2++) {
            this.mClientEquations[i2].variables.updateFromRow(this.mClientEquations[i2], arrayRow, false);
        }
        this.mClientEquationsCount = 0;
    }

    public void reset() {
        this.mName = null;
        this.mType = Type.UNKNOWN;
        this.strength = 0;
        this.id = -1;
        this.definitionId = -1;
        this.computedValue = 0.0f;
        this.mClientEquationsCount = 0;
        this.usageInRowCount = 0;
    }

    public String getName() {
        return this.mName;
    }

    public void setName(String str) {
        this.mName = str;
    }

    public void setType(Type type, String str) {
        this.mType = type;
    }

    public String toString() {
        String str = BuildConfig.FLAVOR;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(this.mName);
        return stringBuilder.toString();
    }
}
