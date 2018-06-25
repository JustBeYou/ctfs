package android.support.constraint.p007a;

final class C0072f {

    interface C0070a<T> {
        T mo35a();

        void mo36a(T[] tArr, int i);

        boolean mo37a(T t);
    }

    static class C0071b<T> implements C0070a<T> {
        private final Object[] f383a;
        private int f384b;

        C0071b(int i) {
            if (i <= 0) {
                throw new IllegalArgumentException("The max pool size must be > 0");
            }
            this.f383a = new Object[i];
        }

        public T mo35a() {
            if (this.f384b <= 0) {
                return null;
            }
            int i = this.f384b - 1;
            T t = this.f383a[i];
            this.f383a[i] = null;
            this.f384b--;
            return t;
        }

        public void mo36a(T[] tArr, int i) {
            if (i > tArr.length) {
                i = tArr.length;
            }
            for (int i2 = 0; i2 < i; i2++) {
                T t = tArr[i2];
                if (this.f384b < this.f383a.length) {
                    this.f383a[this.f384b] = t;
                    this.f384b++;
                }
            }
        }

        public boolean mo37a(T t) {
            if (this.f384b >= this.f383a.length) {
                return false;
            }
            this.f383a[this.f384b] = t;
            this.f384b++;
            return true;
        }
    }
}
