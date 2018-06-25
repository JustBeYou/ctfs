package android.support.v7.p021b.p022a;

import java.lang.reflect.Array;

final class C0486c {
    static final /* synthetic */ boolean f1425a = (!C0486c.class.desiredAssertionStatus());

    private C0486c() {
    }

    public static int m2218a(int i) {
        return i <= 4 ? 8 : i * 2;
    }

    public static int[] m2219a(int[] iArr, int i, int i2) {
        if (f1425a || i <= iArr.length) {
            if (i + 1 > iArr.length) {
                Object obj = new int[C0486c.m2218a(i)];
                System.arraycopy(iArr, 0, obj, 0, i);
                iArr = obj;
            }
            iArr[i] = i2;
            return iArr;
        }
        throw new AssertionError();
    }

    public static <T> T[] m2220a(T[] tArr, int i, T t) {
        if (f1425a || i <= tArr.length) {
            T[] tArr2;
            if (i + 1 > tArr.length) {
                tArr2 = (Object[]) Array.newInstance(tArr.getClass().getComponentType(), C0486c.m2218a(i));
                System.arraycopy(tArr, 0, tArr2, 0, i);
            } else {
                tArr2 = tArr;
            }
            tArr2[i] = t;
            return tArr2;
        }
        throw new AssertionError();
    }
}
