package android.support.v7.widget;

class ao {
    private int f2065a = 0;
    private int f2066b = 0;
    private int f2067c = Integer.MIN_VALUE;
    private int f2068d = Integer.MIN_VALUE;
    private int f2069e = 0;
    private int f2070f = 0;
    private boolean f2071g = false;
    private boolean f2072h = false;

    ao() {
    }

    public int m2902a() {
        return this.f2065a;
    }

    public void m2903a(int i, int i2) {
        this.f2067c = i;
        this.f2068d = i2;
        this.f2072h = true;
        if (this.f2071g) {
            if (i2 != Integer.MIN_VALUE) {
                this.f2065a = i2;
            }
            if (i != Integer.MIN_VALUE) {
                this.f2066b = i;
                return;
            }
            return;
        }
        if (i != Integer.MIN_VALUE) {
            this.f2065a = i;
        }
        if (i2 != Integer.MIN_VALUE) {
            this.f2066b = i2;
        }
    }

    public void m2904a(boolean z) {
        if (z != this.f2071g) {
            this.f2071g = z;
            if (!this.f2072h) {
                this.f2065a = this.f2069e;
                this.f2066b = this.f2070f;
            } else if (z) {
                this.f2065a = this.f2068d != Integer.MIN_VALUE ? this.f2068d : this.f2069e;
                this.f2066b = this.f2067c != Integer.MIN_VALUE ? this.f2067c : this.f2070f;
            } else {
                this.f2065a = this.f2067c != Integer.MIN_VALUE ? this.f2067c : this.f2069e;
                this.f2066b = this.f2068d != Integer.MIN_VALUE ? this.f2068d : this.f2070f;
            }
        }
    }

    public int m2905b() {
        return this.f2066b;
    }

    public void m2906b(int i, int i2) {
        this.f2072h = false;
        if (i != Integer.MIN_VALUE) {
            this.f2069e = i;
            this.f2065a = i;
        }
        if (i2 != Integer.MIN_VALUE) {
            this.f2070f = i2;
            this.f2066b = i2;
        }
    }

    public int m2907c() {
        return this.f2071g ? this.f2066b : this.f2065a;
    }

    public int m2908d() {
        return this.f2071g ? this.f2065a : this.f2066b;
    }
}
