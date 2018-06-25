package android.support.v4.widget;

import android.database.Cursor;
import android.widget.Filter;
import android.widget.Filter.FilterResults;

class C0383d extends Filter {
    C0381a f1106a;

    interface C0381a {
        Cursor mo242a();

        Cursor mo243a(CharSequence charSequence);

        void mo244a(Cursor cursor);

        CharSequence mo245c(Cursor cursor);
    }

    C0383d(C0381a c0381a) {
        this.f1106a = c0381a;
    }

    public CharSequence convertResultToString(Object obj) {
        return this.f1106a.mo245c((Cursor) obj);
    }

    protected FilterResults performFiltering(CharSequence charSequence) {
        Cursor a = this.f1106a.mo243a(charSequence);
        FilterResults filterResults = new FilterResults();
        if (a != null) {
            filterResults.count = a.getCount();
            filterResults.values = a;
        } else {
            filterResults.count = 0;
            filterResults.values = null;
        }
        return filterResults;
    }

    protected void publishResults(CharSequence charSequence, FilterResults filterResults) {
        Cursor a = this.f1106a.mo242a();
        if (filterResults.values != null && filterResults.values != a) {
            this.f1106a.mo244a((Cursor) filterResults.values);
        }
    }
}
