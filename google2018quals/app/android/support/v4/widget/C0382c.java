package android.support.v4.widget;

import android.content.Context;
import android.database.ContentObserver;
import android.database.Cursor;
import android.database.DataSetObserver;
import android.os.Handler;
import android.support.v4.widget.C0383d.C0381a;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Filter;
import android.widget.FilterQueryProvider;
import android.widget.Filterable;

public abstract class C0382c extends BaseAdapter implements C0381a, Filterable {
    protected boolean f1097a;
    protected boolean f1098b;
    protected Cursor f1099c;
    protected Context f1100d;
    protected int f1101e;
    protected C0379a f1102f;
    protected DataSetObserver f1103g;
    protected C0383d f1104h;
    protected FilterQueryProvider f1105i;

    private class C0379a extends ContentObserver {
        final /* synthetic */ C0382c f1095a;

        C0379a(C0382c c0382c) {
            this.f1095a = c0382c;
            super(new Handler());
        }

        public boolean deliverSelfNotifications() {
            return true;
        }

        public void onChange(boolean z) {
            this.f1095a.m1806b();
        }
    }

    private class C0380b extends DataSetObserver {
        final /* synthetic */ C0382c f1096a;

        C0380b(C0382c c0382c) {
            this.f1096a = c0382c;
        }

        public void onChanged() {
            this.f1096a.f1097a = true;
            this.f1096a.notifyDataSetChanged();
        }

        public void onInvalidated() {
            this.f1096a.f1097a = false;
            this.f1096a.notifyDataSetInvalidated();
        }
    }

    public C0382c(Context context, Cursor cursor, boolean z) {
        m1801a(context, cursor, z ? 1 : 2);
    }

    public Cursor mo242a() {
        return this.f1099c;
    }

    public Cursor mo243a(CharSequence charSequence) {
        return this.f1105i != null ? this.f1105i.runQuery(charSequence) : this.f1099c;
    }

    public abstract View mo257a(Context context, Cursor cursor, ViewGroup viewGroup);

    void m1801a(Context context, Cursor cursor, int i) {
        boolean z = true;
        if ((i & 1) == 1) {
            i |= 2;
            this.f1098b = true;
        } else {
            this.f1098b = false;
        }
        if (cursor == null) {
            z = false;
        }
        this.f1099c = cursor;
        this.f1097a = z;
        this.f1100d = context;
        this.f1101e = z ? cursor.getColumnIndexOrThrow("_id") : -1;
        if ((i & 2) == 2) {
            this.f1102f = new C0379a(this);
            this.f1103g = new C0380b(this);
        } else {
            this.f1102f = null;
            this.f1103g = null;
        }
        if (z) {
            if (this.f1102f != null) {
                cursor.registerContentObserver(this.f1102f);
            }
            if (this.f1103g != null) {
                cursor.registerDataSetObserver(this.f1103g);
            }
        }
    }

    public void mo244a(Cursor cursor) {
        Cursor b = m1804b(cursor);
        if (b != null) {
            b.close();
        }
    }

    public abstract void mo492a(View view, Context context, Cursor cursor);

    public Cursor m1804b(Cursor cursor) {
        if (cursor == this.f1099c) {
            return null;
        }
        Cursor cursor2 = this.f1099c;
        if (cursor2 != null) {
            if (this.f1102f != null) {
                cursor2.unregisterContentObserver(this.f1102f);
            }
            if (this.f1103g != null) {
                cursor2.unregisterDataSetObserver(this.f1103g);
            }
        }
        this.f1099c = cursor;
        if (cursor != null) {
            if (this.f1102f != null) {
                cursor.registerContentObserver(this.f1102f);
            }
            if (this.f1103g != null) {
                cursor.registerDataSetObserver(this.f1103g);
            }
            this.f1101e = cursor.getColumnIndexOrThrow("_id");
            this.f1097a = true;
            notifyDataSetChanged();
            return cursor2;
        }
        this.f1101e = -1;
        this.f1097a = false;
        notifyDataSetInvalidated();
        return cursor2;
    }

    public View mo258b(Context context, Cursor cursor, ViewGroup viewGroup) {
        return mo257a(context, cursor, viewGroup);
    }

    protected void m1806b() {
        if (this.f1098b && this.f1099c != null && !this.f1099c.isClosed()) {
            this.f1097a = this.f1099c.requery();
        }
    }

    public CharSequence mo245c(Cursor cursor) {
        return cursor == null ? "" : cursor.toString();
    }

    public int getCount() {
        return (!this.f1097a || this.f1099c == null) ? 0 : this.f1099c.getCount();
    }

    public View getDropDownView(int i, View view, ViewGroup viewGroup) {
        if (!this.f1097a) {
            return null;
        }
        this.f1099c.moveToPosition(i);
        if (view == null) {
            view = mo258b(this.f1100d, this.f1099c, viewGroup);
        }
        mo492a(view, this.f1100d, this.f1099c);
        return view;
    }

    public Filter getFilter() {
        if (this.f1104h == null) {
            this.f1104h = new C0383d(this);
        }
        return this.f1104h;
    }

    public Object getItem(int i) {
        if (!this.f1097a || this.f1099c == null) {
            return null;
        }
        this.f1099c.moveToPosition(i);
        return this.f1099c;
    }

    public long getItemId(int i) {
        return (this.f1097a && this.f1099c != null && this.f1099c.moveToPosition(i)) ? this.f1099c.getLong(this.f1101e) : 0;
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        if (!this.f1097a) {
            throw new IllegalStateException("this should only be called when the cursor is valid");
        } else if (this.f1099c.moveToPosition(i)) {
            if (view == null) {
                view = mo257a(this.f1100d, this.f1099c, viewGroup);
            }
            mo492a(view, this.f1100d, this.f1099c);
            return view;
        } else {
            throw new IllegalStateException("couldn't move cursor to position " + i);
        }
    }

    public boolean hasStableIds() {
        return true;
    }
}
