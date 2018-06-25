package android.support.v4.p009b.p011a;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.content.res.Resources.Theme;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.support.v4.p005c.C0193c;
import android.support.v4.p009b.p011a.C0169a.C0165a;
import android.util.Log;
import android.util.TypedValue;
import android.widget.TextView;

public final class C0170b {
    public static Typeface m867a(Context context, int i, TypedValue typedValue, int i2, TextView textView) {
        return context.isRestricted() ? null : C0170b.m870b(context, i, typedValue, i2, textView);
    }

    private static Typeface m868a(Context context, Resources resources, TypedValue typedValue, int i, int i2, TextView textView) {
        if (typedValue.string == null) {
            throw new NotFoundException("Resource \"" + resources.getResourceName(i) + "\" (" + Integer.toHexString(i) + ") is not a Font: " + typedValue);
        }
        String charSequence = typedValue.string.toString();
        if (!charSequence.startsWith("res/")) {
            return null;
        }
        Typeface a = C0193c.m984a(resources, i, i2);
        if (a != null) {
            return a;
        }
        try {
            if (!charSequence.toLowerCase().endsWith(".xml")) {
                return C0193c.m981a(context, resources, i, charSequence, i2);
            }
            C0165a a2 = C0169a.m860a(resources.getXml(i), resources);
            if (a2 != null) {
                return C0193c.m983a(context, a2, resources, i, i2, textView);
            }
            Log.e("ResourcesCompat", "Failed to find font-family tag");
            return null;
        } catch (Throwable e) {
            Log.e("ResourcesCompat", "Failed to parse xml resource " + charSequence, e);
            return null;
        } catch (Throwable e2) {
            Log.e("ResourcesCompat", "Failed to read xml resource " + charSequence, e2);
            return null;
        }
    }

    public static Drawable m869a(Resources resources, int i, Theme theme) {
        return VERSION.SDK_INT >= 21 ? resources.getDrawable(i, theme) : resources.getDrawable(i);
    }

    private static Typeface m870b(Context context, int i, TypedValue typedValue, int i2, TextView textView) {
        Resources resources = context.getResources();
        resources.getValue(i, typedValue, true);
        Typeface a = C0170b.m868a(context, resources, typedValue, i, i2, textView);
        if (a != null) {
            return a;
        }
        throw new NotFoundException("Font resource ID #0x" + Integer.toHexString(i));
    }
}
