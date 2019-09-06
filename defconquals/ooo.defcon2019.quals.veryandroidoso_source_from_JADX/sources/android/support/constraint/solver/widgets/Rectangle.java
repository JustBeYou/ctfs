package android.support.constraint.solver.widgets;

public class Rectangle {
    public int height;
    public int width;
    /* renamed from: x */
    public int f4x;
    /* renamed from: y */
    public int f5y;

    public void setBounds(int i, int i2, int i3, int i4) {
        this.f4x = i;
        this.f5y = i2;
        this.width = i3;
        this.height = i4;
    }

    void grow(int i, int i2) {
        this.f4x -= i;
        this.f5y -= i2;
        this.width += i * 2;
        this.height += i2 * 2;
    }

    boolean intersects(Rectangle rectangle) {
        int i = this.f4x;
        int i2 = rectangle.f4x;
        if (i >= i2 && i < i2 + rectangle.width) {
            i = this.f5y;
            i2 = rectangle.f5y;
            if (i >= i2 && i < i2 + rectangle.height) {
                return true;
            }
        }
        return null;
    }

    public boolean contains(int i, int i2) {
        int i3 = this.f4x;
        if (i >= i3 && i < i3 + this.width) {
            i = this.f5y;
            if (i2 >= i && i2 < i + this.height) {
                return true;
            }
        }
        return false;
    }

    public int getCenterX() {
        return (this.f4x + this.width) / 2;
    }

    public int getCenterY() {
        return (this.f5y + this.height) / 2;
    }
}
