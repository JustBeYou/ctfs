package android.support.v7.widget;

import android.app.SearchManager;
import android.app.SearchableInfo;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.database.Cursor;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Bundle;
import android.support.v4.p009b.C0092a;
import android.support.v4.widget.C0398j;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.p020a.C0411a.C0406f;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.style.TextAppearanceSpan;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.List;
import java.util.WeakHashMap;

class aq extends C0398j implements OnClickListener {
    private final SearchManager f2098j = ((SearchManager) this.d.getSystemService("search"));
    private final SearchView f2099k;
    private final SearchableInfo f2100l;
    private final Context f2101m;
    private final WeakHashMap<String, ConstantState> f2102n;
    private final int f2103o;
    private boolean f2104p = false;
    private int f2105q = 1;
    private ColorStateList f2106r;
    private int f2107s = -1;
    private int f2108t = -1;
    private int f2109u = -1;
    private int f2110v = -1;
    private int f2111w = -1;
    private int f2112x = -1;

    private static final class C0588a {
        public final TextView f2093a;
        public final TextView f2094b;
        public final ImageView f2095c;
        public final ImageView f2096d;
        public final ImageView f2097e;

        public C0588a(View view) {
            this.f2093a = (TextView) view.findViewById(16908308);
            this.f2094b = (TextView) view.findViewById(16908309);
            this.f2095c = (ImageView) view.findViewById(16908295);
            this.f2096d = (ImageView) view.findViewById(16908296);
            this.f2097e = (ImageView) view.findViewById(C0406f.edit_query);
        }
    }

    public aq(Context context, SearchView searchView, SearchableInfo searchableInfo, WeakHashMap<String, ConstantState> weakHashMap) {
        super(context, searchView.getSuggestionRowLayout(), null, true);
        this.f2099k = searchView;
        this.f2100l = searchableInfo;
        this.f2103o = searchView.getSuggestionCommitIconResId();
        this.f2101m = context;
        this.f2102n = weakHashMap;
    }

    private Drawable m2918a(ComponentName componentName) {
        Object obj = null;
        String flattenToShortString = componentName.flattenToShortString();
        if (this.f2102n.containsKey(flattenToShortString)) {
            ConstantState constantState = (ConstantState) this.f2102n.get(flattenToShortString);
            return constantState == null ? null : constantState.newDrawable(this.f2101m.getResources());
        } else {
            Drawable b = m2925b(componentName);
            if (b != null) {
                obj = b.getConstantState();
            }
            this.f2102n.put(flattenToShortString, obj);
            return b;
        }
    }

    private Drawable m2919a(String str) {
        Drawable b;
        if (str == null || str.isEmpty() || "0".equals(str)) {
            return null;
        }
        try {
            int parseInt = Integer.parseInt(str);
            String str2 = "android.resource://" + this.f2101m.getPackageName() + "/" + parseInt;
            b = m2927b(str2);
            if (b != null) {
                return b;
            }
            b = C0092a.m383a(this.f2101m, parseInt);
            m2924a(str2, b);
            return b;
        } catch (NumberFormatException e) {
            b = m2927b(str);
            if (b != null) {
                return b;
            }
            b = m2926b(Uri.parse(str));
            m2924a(str, b);
            return b;
        } catch (NotFoundException e2) {
            Log.w("SuggestionsAdapter", "Icon resource not found: " + str);
            return null;
        }
    }

    private static String m2920a(Cursor cursor, int i) {
        String str = null;
        if (i != -1) {
            try {
                str = cursor.getString(i);
            } catch (Throwable e) {
                Log.e("SuggestionsAdapter", "unexpected error retrieving valid column from cursor, did the remote process die?", e);
            }
        }
        return str;
    }

    public static String m2921a(Cursor cursor, String str) {
        return m2920a(cursor, cursor.getColumnIndex(str));
    }

    private void m2922a(ImageView imageView, Drawable drawable, int i) {
        imageView.setImageDrawable(drawable);
        if (drawable == null) {
            imageView.setVisibility(i);
            return;
        }
        imageView.setVisibility(0);
        drawable.setVisible(false, false);
        drawable.setVisible(true, false);
    }

    private void m2923a(TextView textView, CharSequence charSequence) {
        textView.setText(charSequence);
        if (TextUtils.isEmpty(charSequence)) {
            textView.setVisibility(8);
        } else {
            textView.setVisibility(0);
        }
    }

    private void m2924a(String str, Drawable drawable) {
        if (drawable != null) {
            this.f2102n.put(str, drawable.getConstantState());
        }
    }

    private Drawable m2925b(ComponentName componentName) {
        PackageManager packageManager = this.d.getPackageManager();
        try {
            ActivityInfo activityInfo = packageManager.getActivityInfo(componentName, 128);
            int iconResource = activityInfo.getIconResource();
            if (iconResource == 0) {
                return null;
            }
            Drawable drawable = packageManager.getDrawable(componentName.getPackageName(), iconResource, activityInfo.applicationInfo);
            if (drawable != null) {
                return drawable;
            }
            Log.w("SuggestionsAdapter", "Invalid icon resource " + iconResource + " for " + componentName.flattenToShortString());
            return null;
        } catch (NameNotFoundException e) {
            Log.w("SuggestionsAdapter", e.toString());
            return null;
        }
    }

    private Drawable m2926b(Uri uri) {
        InputStream openInputStream;
        try {
            if ("android.resource".equals(uri.getScheme())) {
                return m2935a(uri);
            }
            openInputStream = this.f2101m.getContentResolver().openInputStream(uri);
            if (openInputStream == null) {
                throw new FileNotFoundException("Failed to open " + uri);
            }
            Drawable createFromStream = Drawable.createFromStream(openInputStream, null);
            try {
                openInputStream.close();
                return createFromStream;
            } catch (Throwable e) {
                Log.e("SuggestionsAdapter", "Error closing icon stream for " + uri, e);
                return createFromStream;
            }
        } catch (NotFoundException e2) {
            throw new FileNotFoundException("Resource does not exist: " + uri);
        } catch (FileNotFoundException e3) {
            Log.w("SuggestionsAdapter", "Icon not found: " + uri + ", " + e3.getMessage());
            return null;
        } catch (Throwable th) {
            try {
                openInputStream.close();
            } catch (Throwable e4) {
                Log.e("SuggestionsAdapter", "Error closing icon stream for " + uri, e4);
            }
        }
    }

    private Drawable m2927b(String str) {
        ConstantState constantState = (ConstantState) this.f2102n.get(str);
        return constantState == null ? null : constantState.newDrawable();
    }

    private CharSequence m2928b(CharSequence charSequence) {
        if (this.f2106r == null) {
            TypedValue typedValue = new TypedValue();
            this.d.getTheme().resolveAttribute(C0401a.textColorSearchUrl, typedValue, true);
            this.f2106r = this.d.getResources().getColorStateList(typedValue.resourceId);
        }
        CharSequence spannableString = new SpannableString(charSequence);
        spannableString.setSpan(new TextAppearanceSpan(null, 0, 0, this.f2106r, null), 0, charSequence.length(), 33);
        return spannableString;
    }

    private void m2929d(Cursor cursor) {
        Bundle extras = cursor != null ? cursor.getExtras() : null;
        if (extras != null && !extras.getBoolean("in_progress")) {
        }
    }

    private Drawable m2930e(Cursor cursor) {
        if (this.f2110v == -1) {
            return null;
        }
        Drawable a = m2919a(cursor.getString(this.f2110v));
        return a == null ? m2932g(cursor) : a;
    }

    private Drawable m2931f(Cursor cursor) {
        return this.f2111w == -1 ? null : m2919a(cursor.getString(this.f2111w));
    }

    private Drawable m2932g(Cursor cursor) {
        Drawable a = m2918a(this.f2100l.getSearchActivity());
        return a != null ? a : this.d.getPackageManager().getDefaultActivityIcon();
    }

    Cursor m2933a(SearchableInfo searchableInfo, String str, int i) {
        if (searchableInfo == null) {
            return null;
        }
        String suggestAuthority = searchableInfo.getSuggestAuthority();
        if (suggestAuthority == null) {
            return null;
        }
        String[] strArr;
        Builder fragment = new Builder().scheme("content").authority(suggestAuthority).query("").fragment("");
        String suggestPath = searchableInfo.getSuggestPath();
        if (suggestPath != null) {
            fragment.appendEncodedPath(suggestPath);
        }
        fragment.appendPath("search_suggest_query");
        String suggestSelection = searchableInfo.getSuggestSelection();
        if (suggestSelection != null) {
            strArr = new String[]{str};
        } else {
            fragment.appendPath(str);
            strArr = null;
        }
        if (i > 0) {
            fragment.appendQueryParameter("limit", String.valueOf(i));
        }
        return this.d.getContentResolver().query(fragment.build(), null, suggestSelection, strArr, null);
    }

    public Cursor mo243a(CharSequence charSequence) {
        String charSequence2 = charSequence == null ? "" : charSequence.toString();
        if (this.f2099k.getVisibility() != 0 || this.f2099k.getWindowVisibility() != 0) {
            return null;
        }
        try {
            Cursor a = m2933a(this.f2100l, charSequence2, 50);
            if (a != null) {
                a.getCount();
                return a;
            }
        } catch (Throwable e) {
            Log.w("SuggestionsAdapter", "Search suggestions query threw an exception.", e);
        }
        return null;
    }

    Drawable m2935a(Uri uri) {
        String authority = uri.getAuthority();
        if (TextUtils.isEmpty(authority)) {
            throw new FileNotFoundException("No authority: " + uri);
        }
        try {
            Resources resourcesForApplication = this.d.getPackageManager().getResourcesForApplication(authority);
            List pathSegments = uri.getPathSegments();
            if (pathSegments == null) {
                throw new FileNotFoundException("No path: " + uri);
            }
            int size = pathSegments.size();
            if (size == 1) {
                try {
                    size = Integer.parseInt((String) pathSegments.get(0));
                } catch (NumberFormatException e) {
                    throw new FileNotFoundException("Single path segment is not a resource ID: " + uri);
                }
            } else if (size == 2) {
                size = resourcesForApplication.getIdentifier((String) pathSegments.get(1), (String) pathSegments.get(0), authority);
            } else {
                throw new FileNotFoundException("More than two path segments: " + uri);
            }
            if (size != 0) {
                return resourcesForApplication.getDrawable(size);
            }
            throw new FileNotFoundException("No resource found for: " + uri);
        } catch (NameNotFoundException e2) {
            throw new FileNotFoundException("No package found for authority: " + uri);
        }
    }

    public View mo257a(Context context, Cursor cursor, ViewGroup viewGroup) {
        View a = super.mo257a(context, cursor, viewGroup);
        a.setTag(new C0588a(a));
        ((ImageView) a.findViewById(C0406f.edit_query)).setImageResource(this.f2103o);
        return a;
    }

    public void m2937a(int i) {
        this.f2105q = i;
    }

    public void mo244a(Cursor cursor) {
        if (this.f2104p) {
            Log.w("SuggestionsAdapter", "Tried to change cursor after adapter was closed.");
            if (cursor != null) {
                cursor.close();
                return;
            }
            return;
        }
        try {
            super.mo244a(cursor);
            if (cursor != null) {
                this.f2107s = cursor.getColumnIndex("suggest_text_1");
                this.f2108t = cursor.getColumnIndex("suggest_text_2");
                this.f2109u = cursor.getColumnIndex("suggest_text_2_url");
                this.f2110v = cursor.getColumnIndex("suggest_icon_1");
                this.f2111w = cursor.getColumnIndex("suggest_icon_2");
                this.f2112x = cursor.getColumnIndex("suggest_flags");
            }
        } catch (Throwable e) {
            Log.e("SuggestionsAdapter", "error changing cursor and caching columns", e);
        }
    }

    public void mo492a(View view, Context context, Cursor cursor) {
        C0588a c0588a = (C0588a) view.getTag();
        int i = this.f2112x != -1 ? cursor.getInt(this.f2112x) : 0;
        if (c0588a.f2093a != null) {
            m2923a(c0588a.f2093a, m2920a(cursor, this.f2107s));
        }
        if (c0588a.f2094b != null) {
            CharSequence a = m2920a(cursor, this.f2109u);
            a = a != null ? m2928b(a) : m2920a(cursor, this.f2108t);
            if (TextUtils.isEmpty(a)) {
                if (c0588a.f2093a != null) {
                    c0588a.f2093a.setSingleLine(false);
                    c0588a.f2093a.setMaxLines(2);
                }
            } else if (c0588a.f2093a != null) {
                c0588a.f2093a.setSingleLine(true);
                c0588a.f2093a.setMaxLines(1);
            }
            m2923a(c0588a.f2094b, a);
        }
        if (c0588a.f2095c != null) {
            m2922a(c0588a.f2095c, m2930e(cursor), 4);
        }
        if (c0588a.f2096d != null) {
            m2922a(c0588a.f2096d, m2931f(cursor), 8);
        }
        if (this.f2105q == 2 || (this.f2105q == 1 && (i & 1) != 0)) {
            c0588a.f2097e.setVisibility(0);
            c0588a.f2097e.setTag(c0588a.f2093a.getText());
            c0588a.f2097e.setOnClickListener(this);
            return;
        }
        c0588a.f2097e.setVisibility(8);
    }

    public CharSequence mo245c(Cursor cursor) {
        if (cursor == null) {
            return null;
        }
        String a = m2921a(cursor, "suggest_intent_query");
        if (a != null) {
            return a;
        }
        if (this.f2100l.shouldRewriteQueryFromData()) {
            a = m2921a(cursor, "suggest_intent_data");
            if (a != null) {
                return a;
            }
        }
        if (!this.f2100l.shouldRewriteQueryFromText()) {
            return null;
        }
        a = m2921a(cursor, "suggest_text_1");
        return a != null ? a : null;
    }

    public View getDropDownView(int i, View view, ViewGroup viewGroup) {
        try {
            return super.getDropDownView(i, view, viewGroup);
        } catch (Throwable e) {
            Log.w("SuggestionsAdapter", "Search suggestions cursor threw exception.", e);
            View b = mo258b(this.d, this.c, viewGroup);
            if (b != null) {
                ((C0588a) b.getTag()).f2093a.setText(e.toString());
            }
            return b;
        }
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        try {
            return super.getView(i, view, viewGroup);
        } catch (Throwable e) {
            Log.w("SuggestionsAdapter", "Search suggestions cursor threw exception.", e);
            View a = mo257a(this.d, this.c, viewGroup);
            if (a != null) {
                ((C0588a) a.getTag()).f2093a.setText(e.toString());
            }
            return a;
        }
    }

    public boolean hasStableIds() {
        return false;
    }

    public void notifyDataSetChanged() {
        super.notifyDataSetChanged();
        m2929d(mo242a());
    }

    public void notifyDataSetInvalidated() {
        super.notifyDataSetInvalidated();
        m2929d(mo242a());
    }

    public void onClick(View view) {
        Object tag = view.getTag();
        if (tag instanceof CharSequence) {
            this.f2099k.m2717a((CharSequence) tag);
        }
    }
}
