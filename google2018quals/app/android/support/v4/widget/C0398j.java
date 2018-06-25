package android.support.v4.widget;

import android.content.Context;
import android.database.Cursor;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public abstract class C0398j extends C0382c {
    private int f1114j;
    private int f1115k;
    private LayoutInflater f1116l;

    @Deprecated
    public C0398j(Context context, int i, Cursor cursor, boolean z) {
        super(context, cursor, z);
        this.f1115k = i;
        this.f1114j = i;
        this.f1116l = (LayoutInflater) context.getSystemService("layout_inflater");
    }

    public View mo257a(Context context, Cursor cursor, ViewGroup viewGroup) {
        return this.f1116l.inflate(this.f1114j, viewGroup, false);
    }

    public View mo258b(Context context, Cursor cursor, ViewGroup viewGroup) {
        return this.f1116l.inflate(this.f1115k, viewGroup, false);
    }
}
