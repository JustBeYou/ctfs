package android.support.v7.widget;

import android.content.res.AssetFileDescriptor;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.graphics.Movie;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import java.io.InputStream;

class an extends Resources {
    private final Resources f2064a;

    public an(Resources resources) {
        super(resources.getAssets(), resources.getDisplayMetrics(), resources.getConfiguration());
        this.f2064a = resources;
    }

    public XmlResourceParser getAnimation(int i) {
        return this.f2064a.getAnimation(i);
    }

    public boolean getBoolean(int i) {
        return this.f2064a.getBoolean(i);
    }

    public int getColor(int i) {
        return this.f2064a.getColor(i);
    }

    public ColorStateList getColorStateList(int i) {
        return this.f2064a.getColorStateList(i);
    }

    public Configuration getConfiguration() {
        return this.f2064a.getConfiguration();
    }

    public float getDimension(int i) {
        return this.f2064a.getDimension(i);
    }

    public int getDimensionPixelOffset(int i) {
        return this.f2064a.getDimensionPixelOffset(i);
    }

    public int getDimensionPixelSize(int i) {
        return this.f2064a.getDimensionPixelSize(i);
    }

    public DisplayMetrics getDisplayMetrics() {
        return this.f2064a.getDisplayMetrics();
    }

    public Drawable getDrawable(int i) {
        return this.f2064a.getDrawable(i);
    }

    public Drawable getDrawable(int i, Theme theme) {
        return this.f2064a.getDrawable(i, theme);
    }

    public Drawable getDrawableForDensity(int i, int i2) {
        return this.f2064a.getDrawableForDensity(i, i2);
    }

    public Drawable getDrawableForDensity(int i, int i2, Theme theme) {
        return this.f2064a.getDrawableForDensity(i, i2, theme);
    }

    public float getFraction(int i, int i2, int i3) {
        return this.f2064a.getFraction(i, i2, i3);
    }

    public int getIdentifier(String str, String str2, String str3) {
        return this.f2064a.getIdentifier(str, str2, str3);
    }

    public int[] getIntArray(int i) {
        return this.f2064a.getIntArray(i);
    }

    public int getInteger(int i) {
        return this.f2064a.getInteger(i);
    }

    public XmlResourceParser getLayout(int i) {
        return this.f2064a.getLayout(i);
    }

    public Movie getMovie(int i) {
        return this.f2064a.getMovie(i);
    }

    public String getQuantityString(int i, int i2) {
        return this.f2064a.getQuantityString(i, i2);
    }

    public String getQuantityString(int i, int i2, Object... objArr) {
        return this.f2064a.getQuantityString(i, i2, objArr);
    }

    public CharSequence getQuantityText(int i, int i2) {
        return this.f2064a.getQuantityText(i, i2);
    }

    public String getResourceEntryName(int i) {
        return this.f2064a.getResourceEntryName(i);
    }

    public String getResourceName(int i) {
        return this.f2064a.getResourceName(i);
    }

    public String getResourcePackageName(int i) {
        return this.f2064a.getResourcePackageName(i);
    }

    public String getResourceTypeName(int i) {
        return this.f2064a.getResourceTypeName(i);
    }

    public String getString(int i) {
        return this.f2064a.getString(i);
    }

    public String getString(int i, Object... objArr) {
        return this.f2064a.getString(i, objArr);
    }

    public String[] getStringArray(int i) {
        return this.f2064a.getStringArray(i);
    }

    public CharSequence getText(int i) {
        return this.f2064a.getText(i);
    }

    public CharSequence getText(int i, CharSequence charSequence) {
        return this.f2064a.getText(i, charSequence);
    }

    public CharSequence[] getTextArray(int i) {
        return this.f2064a.getTextArray(i);
    }

    public void getValue(int i, TypedValue typedValue, boolean z) {
        this.f2064a.getValue(i, typedValue, z);
    }

    public void getValue(String str, TypedValue typedValue, boolean z) {
        this.f2064a.getValue(str, typedValue, z);
    }

    public void getValueForDensity(int i, int i2, TypedValue typedValue, boolean z) {
        this.f2064a.getValueForDensity(i, i2, typedValue, z);
    }

    public XmlResourceParser getXml(int i) {
        return this.f2064a.getXml(i);
    }

    public TypedArray obtainAttributes(AttributeSet attributeSet, int[] iArr) {
        return this.f2064a.obtainAttributes(attributeSet, iArr);
    }

    public TypedArray obtainTypedArray(int i) {
        return this.f2064a.obtainTypedArray(i);
    }

    public InputStream openRawResource(int i) {
        return this.f2064a.openRawResource(i);
    }

    public InputStream openRawResource(int i, TypedValue typedValue) {
        return this.f2064a.openRawResource(i, typedValue);
    }

    public AssetFileDescriptor openRawResourceFd(int i) {
        return this.f2064a.openRawResourceFd(i);
    }

    public void parseBundleExtra(String str, AttributeSet attributeSet, Bundle bundle) {
        this.f2064a.parseBundleExtra(str, attributeSet, bundle);
    }

    public void parseBundleExtras(XmlResourceParser xmlResourceParser, Bundle bundle) {
        this.f2064a.parseBundleExtras(xmlResourceParser, bundle);
    }

    public void updateConfiguration(Configuration configuration, DisplayMetrics displayMetrics) {
        super.updateConfiguration(configuration, displayMetrics);
        if (this.f2064a != null) {
            this.f2064a.updateConfiguration(configuration, displayMetrics);
        }
    }
}
