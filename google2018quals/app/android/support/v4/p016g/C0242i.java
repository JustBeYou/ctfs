package android.support.v4.p016g;

public class C0242i<F, S> {
    public final F f880a;
    public final S f881b;

    private static boolean m1165a(Object obj, Object obj2) {
        return obj == obj2 || (obj != null && obj.equals(obj2));
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof C0242i)) {
            return false;
        }
        C0242i c0242i = (C0242i) obj;
        return C0242i.m1165a(c0242i.f880a, this.f880a) && C0242i.m1165a(c0242i.f881b, this.f881b);
    }

    public int hashCode() {
        int i = 0;
        int hashCode = this.f880a == null ? 0 : this.f880a.hashCode();
        if (this.f881b != null) {
            i = this.f881b.hashCode();
        }
        return hashCode ^ i;
    }

    public String toString() {
        return "Pair{" + String.valueOf(this.f880a) + " " + String.valueOf(this.f881b) + "}";
    }
}
