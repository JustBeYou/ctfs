package android.support.v4.widget;

import android.widget.ListView;

public class C0391g extends C0374a {
    private final ListView f1109f;

    public C0391g(ListView listView) {
        super(listView);
        this.f1109f = listView;
    }

    public void mo251a(int i, int i2) {
        C0392h.m1830a(this.f1109f, i2);
    }

    public boolean mo252e(int i) {
        return false;
    }

    public boolean mo253f(int i) {
        ListView listView = this.f1109f;
        int count = listView.getCount();
        if (count == 0) {
            return false;
        }
        int childCount = listView.getChildCount();
        int firstVisiblePosition = listView.getFirstVisiblePosition();
        int i2 = firstVisiblePosition + childCount;
        if (i > 0) {
            if (i2 >= count && listView.getChildAt(childCount - 1).getBottom() <= listView.getHeight()) {
                return false;
            }
        } else if (i >= 0) {
            return false;
        } else {
            if (firstVisiblePosition <= 0 && listView.getChildAt(0).getTop() >= 0) {
                return false;
            }
        }
        return true;
    }
}
