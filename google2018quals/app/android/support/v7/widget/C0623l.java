package android.support.v7.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources.Theme;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.graphics.drawable.LayerDrawable;
import android.os.Build.VERSION;
import android.support.p003b.p004a.C0031c;
import android.support.p003b.p004a.C0045i;
import android.support.v4.p005c.C0188a;
import android.support.v4.p005c.p006a.C0179a;
import android.support.v4.p009b.C0092a;
import android.support.v4.p016g.C0229a;
import android.support.v4.p016g.C0235f;
import android.support.v4.p016g.C0236g;
import android.support.v4.p016g.C0244l;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.p020a.C0411a.C0403c;
import android.support.v7.p020a.C0411a.C0405e;
import android.support.v7.p021b.p022a.C0485b;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
import org.xmlpull.v1.XmlPullParser;

public final class C0623l {
    private static final Mode f2251a = Mode.SRC_IN;
    private static C0623l f2252b;
    private static final C0621b f2253c = new C0621b(6);
    private static final int[] f2254d = new int[]{C0405e.abc_textfield_search_default_mtrl_alpha, C0405e.abc_textfield_default_mtrl_alpha, C0405e.abc_ab_share_pack_mtrl_alpha};
    private static final int[] f2255e = new int[]{C0405e.abc_ic_commit_search_api_mtrl_alpha, C0405e.abc_seekbar_tick_mark_material, C0405e.abc_ic_menu_share_mtrl_alpha, C0405e.abc_ic_menu_copy_mtrl_am_alpha, C0405e.abc_ic_menu_cut_mtrl_alpha, C0405e.abc_ic_menu_selectall_mtrl_alpha, C0405e.abc_ic_menu_paste_mtrl_am_alpha};
    private static final int[] f2256f = new int[]{C0405e.abc_textfield_activated_mtrl_alpha, C0405e.abc_textfield_search_activated_mtrl_alpha, C0405e.abc_cab_background_top_mtrl_alpha, C0405e.abc_text_cursor_material, C0405e.abc_text_select_handle_left_mtrl_dark, C0405e.abc_text_select_handle_middle_mtrl_dark, C0405e.abc_text_select_handle_right_mtrl_dark, C0405e.abc_text_select_handle_left_mtrl_light, C0405e.abc_text_select_handle_middle_mtrl_light, C0405e.abc_text_select_handle_right_mtrl_light};
    private static final int[] f2257g = new int[]{C0405e.abc_popup_background_mtrl_mult, C0405e.abc_cab_background_internal_bg, C0405e.abc_menu_hardkey_panel_mtrl_mult};
    private static final int[] f2258h = new int[]{C0405e.abc_tab_indicator_material, C0405e.abc_textfield_search_material};
    private static final int[] f2259i = new int[]{C0405e.abc_btn_check_material, C0405e.abc_btn_radio_material};
    private WeakHashMap<Context, C0244l<ColorStateList>> f2260j;
    private C0229a<String, C0619c> f2261k;
    private C0244l<String> f2262l;
    private final Object f2263m = new Object();
    private final WeakHashMap<Context, C0235f<WeakReference<ConstantState>>> f2264n = new WeakHashMap(0);
    private TypedValue f2265o;
    private boolean f2266p;

    private interface C0619c {
        Drawable mo543a(Context context, XmlPullParser xmlPullParser, AttributeSet attributeSet, Theme theme);
    }

    private static class C0620a implements C0619c {
        C0620a() {
        }

        public Drawable mo543a(Context context, XmlPullParser xmlPullParser, AttributeSet attributeSet, Theme theme) {
            try {
                return C0031c.m48a(context, context.getResources(), xmlPullParser, attributeSet, theme);
            } catch (Throwable e) {
                Log.e("AvdcInflateDelegate", "Exception while inflating <animated-vector>", e);
                return null;
            }
        }
    }

    private static class C0621b extends C0236g<Integer, PorterDuffColorFilter> {
        public C0621b(int i) {
            super(i);
        }

        private static int m3116b(int i, Mode mode) {
            return ((i + 31) * 31) + mode.hashCode();
        }

        PorterDuffColorFilter m3117a(int i, Mode mode) {
            return (PorterDuffColorFilter) m1157a((Object) Integer.valueOf(C0621b.m3116b(i, mode)));
        }

        PorterDuffColorFilter m3118a(int i, Mode mode, PorterDuffColorFilter porterDuffColorFilter) {
            return (PorterDuffColorFilter) m1158a(Integer.valueOf(C0621b.m3116b(i, mode)), porterDuffColorFilter);
        }
    }

    private static class C0622d implements C0619c {
        C0622d() {
        }

        public Drawable mo543a(Context context, XmlPullParser xmlPullParser, AttributeSet attributeSet, Theme theme) {
            try {
                return C0045i.m112a(context.getResources(), xmlPullParser, attributeSet, theme);
            } catch (Throwable e) {
                Log.e("VdcInflateDelegate", "Exception while inflating <vector>", e);
                return null;
            }
        }
    }

    private static long m3120a(TypedValue typedValue) {
        return (((long) typedValue.assetCookie) << 32) | ((long) typedValue.data);
    }

    static Mode m3121a(int i) {
        return i == C0405e.abc_switch_thumb_material ? Mode.MULTIPLY : null;
    }

    public static PorterDuffColorFilter m3122a(int i, Mode mode) {
        PorterDuffColorFilter a = f2253c.m3117a(i, mode);
        if (a != null) {
            return a;
        }
        a = new PorterDuffColorFilter(i, mode);
        f2253c.m3118a(i, mode, a);
        return a;
    }

    private static PorterDuffColorFilter m3123a(ColorStateList colorStateList, Mode mode, int[] iArr) {
        return (colorStateList == null || mode == null) ? null : C0623l.m3122a(colorStateList.getColorForState(iArr, 0), mode);
    }

    private Drawable m3124a(Context context, int i, boolean z, Drawable drawable) {
        ColorStateList b = m3149b(context, i);
        if (b != null) {
            if (ae.m2844b(drawable)) {
                drawable = drawable.mutate();
            }
            drawable = C0179a.m943f(drawable);
            C0179a.m933a(drawable, b);
            Mode a = C0623l.m3121a(i);
            if (a == null) {
                return drawable;
            }
            C0179a.m936a(drawable, a);
            return drawable;
        } else if (i == C0405e.abc_seekbar_track_material) {
            r0 = (LayerDrawable) drawable;
            C0623l.m3128a(r0.findDrawableByLayerId(16908288), ar.m2941a(context, C0401a.colorControlNormal), f2251a);
            C0623l.m3128a(r0.findDrawableByLayerId(16908303), ar.m2941a(context, C0401a.colorControlNormal), f2251a);
            C0623l.m3128a(r0.findDrawableByLayerId(16908301), ar.m2941a(context, C0401a.colorControlActivated), f2251a);
            return drawable;
        } else if (i != C0405e.abc_ratingbar_material && i != C0405e.abc_ratingbar_indicator_material && i != C0405e.abc_ratingbar_small_material) {
            return (C0623l.m3132a(context, i, drawable) || !z) ? drawable : null;
        } else {
            r0 = (LayerDrawable) drawable;
            C0623l.m3128a(r0.findDrawableByLayerId(16908288), ar.m2945c(context, C0401a.colorControlNormal), f2251a);
            C0623l.m3128a(r0.findDrawableByLayerId(16908303), ar.m2941a(context, C0401a.colorControlActivated), f2251a);
            C0623l.m3128a(r0.findDrawableByLayerId(16908301), ar.m2941a(context, C0401a.colorControlActivated), f2251a);
            return drawable;
        }
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private android.graphics.drawable.Drawable m3125a(android.content.Context r5, long r6) {
        /*
        r4 = this;
        r2 = 0;
        r3 = r4.f2263m;
        monitor-enter(r3);
        r0 = r4.f2264n;	 Catch:{ all -> 0x002b }
        r0 = r0.get(r5);	 Catch:{ all -> 0x002b }
        r0 = (android.support.v4.p016g.C0235f) r0;	 Catch:{ all -> 0x002b }
        if (r0 != 0) goto L_0x0011;
    L_0x000e:
        monitor-exit(r3);	 Catch:{ all -> 0x002b }
        r0 = r2;
    L_0x0010:
        return r0;
    L_0x0011:
        r1 = r0.m1149a(r6);	 Catch:{ all -> 0x002b }
        r1 = (java.lang.ref.WeakReference) r1;	 Catch:{ all -> 0x002b }
        if (r1 == 0) goto L_0x0031;
    L_0x0019:
        r1 = r1.get();	 Catch:{ all -> 0x002b }
        r1 = (android.graphics.drawable.Drawable.ConstantState) r1;	 Catch:{ all -> 0x002b }
        if (r1 == 0) goto L_0x002e;
    L_0x0021:
        r0 = r5.getResources();	 Catch:{ all -> 0x002b }
        r0 = r1.newDrawable(r0);	 Catch:{ all -> 0x002b }
        monitor-exit(r3);	 Catch:{ all -> 0x002b }
        goto L_0x0010;
    L_0x002b:
        r0 = move-exception;
        monitor-exit(r3);	 Catch:{ all -> 0x002b }
        throw r0;
    L_0x002e:
        r0.m1153b(r6);	 Catch:{ all -> 0x002b }
    L_0x0031:
        monitor-exit(r3);	 Catch:{ all -> 0x002b }
        r0 = r2;
        goto L_0x0010;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v7.widget.l.a(android.content.Context, long):android.graphics.drawable.Drawable");
    }

    public static C0623l m3126a() {
        if (f2252b == null) {
            f2252b = new C0623l();
            C0623l.m3130a(f2252b);
        }
        return f2252b;
    }

    private void m3127a(Context context, int i, ColorStateList colorStateList) {
        if (this.f2260j == null) {
            this.f2260j = new WeakHashMap();
        }
        C0244l c0244l = (C0244l) this.f2260j.get(context);
        if (c0244l == null) {
            c0244l = new C0244l();
            this.f2260j.put(context, c0244l);
        }
        c0244l.m1176c(i, colorStateList);
    }

    private static void m3128a(Drawable drawable, int i, Mode mode) {
        if (ae.m2844b(drawable)) {
            drawable = drawable.mutate();
        }
        if (mode == null) {
            mode = f2251a;
        }
        drawable.setColorFilter(C0623l.m3122a(i, mode));
    }

    static void m3129a(Drawable drawable, au auVar, int[] iArr) {
        if (!ae.m2844b(drawable) || drawable.mutate() == drawable) {
            if (auVar.f2130d || auVar.f2129c) {
                drawable.setColorFilter(C0623l.m3123a(auVar.f2130d ? auVar.f2127a : null, auVar.f2129c ? auVar.f2128b : f2251a, iArr));
            } else {
                drawable.clearColorFilter();
            }
            if (VERSION.SDK_INT <= 23) {
                drawable.invalidateSelf();
                return;
            }
            return;
        }
        Log.d("AppCompatDrawableManager", "Mutated drawable is not the same instance as the input.");
    }

    private static void m3130a(C0623l c0623l) {
        if (VERSION.SDK_INT < 24) {
            c0623l.m3131a("vector", new C0622d());
            if (VERSION.SDK_INT >= 11) {
                c0623l.m3131a("animated-vector", new C0620a());
            }
        }
    }

    private void m3131a(String str, C0619c c0619c) {
        if (this.f2261k == null) {
            this.f2261k = new C0229a();
        }
        this.f2261k.put(str, c0619c);
    }

    static boolean m3132a(Context context, int i, Drawable drawable) {
        int i2;
        Mode mode;
        boolean z;
        int i3;
        Mode mode2 = f2251a;
        if (C0623l.m3135a(f2254d, i)) {
            i2 = C0401a.colorControlNormal;
            mode = mode2;
            z = true;
            i3 = -1;
        } else if (C0623l.m3135a(f2256f, i)) {
            i2 = C0401a.colorControlActivated;
            mode = mode2;
            z = true;
            i3 = -1;
        } else if (C0623l.m3135a(f2257g, i)) {
            z = true;
            mode = Mode.MULTIPLY;
            i2 = 16842801;
            i3 = -1;
        } else if (i == C0405e.abc_list_divider_mtrl_alpha) {
            i2 = 16842800;
            i3 = Math.round(40.8f);
            mode = mode2;
            z = true;
        } else if (i == C0405e.abc_dialog_material_background) {
            i2 = 16842801;
            mode = mode2;
            z = true;
            i3 = -1;
        } else {
            i3 = -1;
            i2 = 0;
            mode = mode2;
            z = false;
        }
        if (!z) {
            return false;
        }
        if (ae.m2844b(drawable)) {
            drawable = drawable.mutate();
        }
        drawable.setColorFilter(C0623l.m3122a(ar.m2941a(context, i2), mode));
        if (i3 == -1) {
            return true;
        }
        drawable.setAlpha(i3);
        return true;
    }

    private boolean m3133a(Context context, long j, Drawable drawable) {
        ConstantState constantState = drawable.getConstantState();
        if (constantState == null) {
            return false;
        }
        synchronized (this.f2263m) {
            C0235f c0235f = (C0235f) this.f2264n.get(context);
            if (c0235f == null) {
                c0235f = new C0235f();
                this.f2264n.put(context, c0235f);
            }
            c0235f.m1154b(j, new WeakReference(constantState));
        }
        return true;
    }

    private static boolean m3134a(Drawable drawable) {
        return (drawable instanceof C0045i) || "android.graphics.drawable.VectorDrawable".equals(drawable.getClass().getName());
    }

    private static boolean m3135a(int[] iArr, int i) {
        for (int i2 : iArr) {
            if (i2 == i) {
                return true;
            }
        }
        return false;
    }

    private ColorStateList m3136b(Context context) {
        return m3143f(context, ar.m2941a(context, C0401a.colorButtonNormal));
    }

    private ColorStateList m3137c(Context context) {
        return m3143f(context, 0);
    }

    private Drawable m3138c(Context context, int i) {
        if (this.f2265o == null) {
            this.f2265o = new TypedValue();
        }
        TypedValue typedValue = this.f2265o;
        context.getResources().getValue(i, typedValue, true);
        long a = C0623l.m3120a(typedValue);
        Drawable a2 = m3125a(context, a);
        if (a2 == null) {
            if (i == C0405e.abc_cab_background_top_material) {
                a2 = new LayerDrawable(new Drawable[]{m3145a(context, C0405e.abc_cab_background_internal_bg), m3145a(context, C0405e.abc_cab_background_top_mtrl_alpha)});
            }
            if (a2 != null) {
                a2.setChangingConfigurations(typedValue.changingConfigurations);
                m3133a(context, a, a2);
            }
        }
        return a2;
    }

    private ColorStateList m3139d(Context context) {
        return m3143f(context, ar.m2941a(context, C0401a.colorAccent));
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private android.graphics.drawable.Drawable m3140d(android.content.Context r10, int r11) {
        /*
        r9 = this;
        r1 = 0;
        r8 = 2;
        r7 = 1;
        r0 = r9.f2261k;
        if (r0 == 0) goto L_0x00bf;
    L_0x0007:
        r0 = r9.f2261k;
        r0 = r0.isEmpty();
        if (r0 != 0) goto L_0x00bf;
    L_0x000f:
        r0 = r9.f2262l;
        if (r0 == 0) goto L_0x002f;
    L_0x0013:
        r0 = r9.f2262l;
        r0 = r0.m1169a(r11);
        r0 = (java.lang.String) r0;
        r2 = "appcompat_skip_skip";
        r2 = r2.equals(r0);
        if (r2 != 0) goto L_0x002d;
    L_0x0023:
        if (r0 == 0) goto L_0x0036;
    L_0x0025:
        r2 = r9.f2261k;
        r0 = r2.get(r0);
        if (r0 != 0) goto L_0x0036;
    L_0x002d:
        r0 = r1;
    L_0x002e:
        return r0;
    L_0x002f:
        r0 = new android.support.v4.g.l;
        r0.<init>();
        r9.f2262l = r0;
    L_0x0036:
        r0 = r9.f2265o;
        if (r0 != 0) goto L_0x0041;
    L_0x003a:
        r0 = new android.util.TypedValue;
        r0.<init>();
        r9.f2265o = r0;
    L_0x0041:
        r2 = r9.f2265o;
        r0 = r10.getResources();
        r0.getValue(r11, r2, r7);
        r4 = android.support.v7.widget.C0623l.m3120a(r2);
        r1 = r9.m3125a(r10, r4);
        if (r1 == 0) goto L_0x0056;
    L_0x0054:
        r0 = r1;
        goto L_0x002e;
    L_0x0056:
        r3 = r2.string;
        if (r3 == 0) goto L_0x008a;
    L_0x005a:
        r3 = r2.string;
        r3 = r3.toString();
        r6 = ".xml";
        r3 = r3.endsWith(r6);
        if (r3 == 0) goto L_0x008a;
    L_0x0068:
        r3 = r0.getXml(r11);	 Catch:{ Exception -> 0x0082 }
        r6 = android.util.Xml.asAttributeSet(r3);	 Catch:{ Exception -> 0x0082 }
    L_0x0070:
        r0 = r3.next();	 Catch:{ Exception -> 0x0082 }
        if (r0 == r8) goto L_0x0078;
    L_0x0076:
        if (r0 != r7) goto L_0x0070;
    L_0x0078:
        if (r0 == r8) goto L_0x0095;
    L_0x007a:
        r0 = new org.xmlpull.v1.XmlPullParserException;	 Catch:{ Exception -> 0x0082 }
        r2 = "No start tag found";
        r0.<init>(r2);	 Catch:{ Exception -> 0x0082 }
        throw r0;	 Catch:{ Exception -> 0x0082 }
    L_0x0082:
        r0 = move-exception;
        r2 = "AppCompatDrawableManager";
        r3 = "Exception while inflating drawable";
        android.util.Log.e(r2, r3, r0);
    L_0x008a:
        r0 = r1;
    L_0x008b:
        if (r0 != 0) goto L_0x002e;
    L_0x008d:
        r1 = r9.f2262l;
        r2 = "appcompat_skip_skip";
        r1.m1176c(r11, r2);
        goto L_0x002e;
    L_0x0095:
        r0 = r3.getName();	 Catch:{ Exception -> 0x0082 }
        r7 = r9.f2262l;	 Catch:{ Exception -> 0x0082 }
        r7.m1176c(r11, r0);	 Catch:{ Exception -> 0x0082 }
        r7 = r9.f2261k;	 Catch:{ Exception -> 0x0082 }
        r0 = r7.get(r0);	 Catch:{ Exception -> 0x0082 }
        r0 = (android.support.v7.widget.C0623l.C0619c) r0;	 Catch:{ Exception -> 0x0082 }
        if (r0 == 0) goto L_0x00b0;
    L_0x00a8:
        r7 = r10.getTheme();	 Catch:{ Exception -> 0x0082 }
        r1 = r0.mo543a(r10, r3, r6, r7);	 Catch:{ Exception -> 0x0082 }
    L_0x00b0:
        if (r1 == 0) goto L_0x00bd;
    L_0x00b2:
        r0 = r2.changingConfigurations;	 Catch:{ Exception -> 0x0082 }
        r1.setChangingConfigurations(r0);	 Catch:{ Exception -> 0x0082 }
        r0 = r9.m3133a(r10, r4, r1);	 Catch:{ Exception -> 0x0082 }
        if (r0 == 0) goto L_0x00bd;
    L_0x00bd:
        r0 = r1;
        goto L_0x008b;
    L_0x00bf:
        r0 = r1;
        goto L_0x002e;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v7.widget.l.d(android.content.Context, int):android.graphics.drawable.Drawable");
    }

    private ColorStateList m3141e(Context context) {
        int[][] iArr = new int[3][];
        int[] iArr2 = new int[3];
        ColorStateList b = ar.m2944b(context, C0401a.colorSwitchThumbNormal);
        if (b == null || !b.isStateful()) {
            iArr[0] = ar.f2113a;
            iArr2[0] = ar.m2945c(context, C0401a.colorSwitchThumbNormal);
            iArr[1] = ar.f2117e;
            iArr2[1] = ar.m2941a(context, C0401a.colorControlActivated);
            iArr[2] = ar.f2120h;
            iArr2[2] = ar.m2941a(context, C0401a.colorSwitchThumbNormal);
        } else {
            iArr[0] = ar.f2113a;
            iArr2[0] = b.getColorForState(iArr[0], 0);
            iArr[1] = ar.f2117e;
            iArr2[1] = ar.m2941a(context, C0401a.colorControlActivated);
            iArr[2] = ar.f2120h;
            iArr2[2] = b.getDefaultColor();
        }
        return new ColorStateList(iArr, iArr2);
    }

    private ColorStateList m3142e(Context context, int i) {
        if (this.f2260j == null) {
            return null;
        }
        C0244l c0244l = (C0244l) this.f2260j.get(context);
        return c0244l != null ? (ColorStateList) c0244l.m1169a(i) : null;
    }

    private ColorStateList m3143f(Context context, int i) {
        r0 = new int[4][];
        r1 = new int[4];
        int a = ar.m2941a(context, C0401a.colorControlHighlight);
        int c = ar.m2945c(context, C0401a.colorButtonNormal);
        r0[0] = ar.f2113a;
        r1[0] = c;
        r0[1] = ar.f2116d;
        r1[1] = C0188a.m959a(a, i);
        r0[2] = ar.f2114b;
        r1[2] = C0188a.m959a(a, i);
        r0[3] = ar.f2120h;
        r1[3] = i;
        return new ColorStateList(r0, r1);
    }

    private void m3144f(Context context) {
        if (!this.f2266p) {
            this.f2266p = true;
            Drawable a = m3145a(context, C0405e.abc_vector_test);
            if (a == null || !C0623l.m3134a(a)) {
                this.f2266p = false;
                throw new IllegalStateException("This app has been built with an incorrect configuration. Please configure your build for VectorDrawableCompat.");
            }
        }
    }

    public Drawable m3145a(Context context, int i) {
        return m3146a(context, i, false);
    }

    Drawable m3146a(Context context, int i, boolean z) {
        m3144f(context);
        Drawable d = m3140d(context, i);
        if (d == null) {
            d = m3138c(context, i);
        }
        if (d == null) {
            d = C0092a.m383a(context, i);
        }
        if (d != null) {
            d = m3124a(context, i, z, d);
        }
        if (d != null) {
            ae.m2843a(d);
        }
        return d;
    }

    Drawable m3147a(Context context, bb bbVar, int i) {
        Drawable d = m3140d(context, i);
        if (d == null) {
            d = bbVar.m3033a(i);
        }
        return d != null ? m3124a(context, i, false, d) : null;
    }

    public void m3148a(Context context) {
        synchronized (this.f2263m) {
            C0235f c0235f = (C0235f) this.f2264n.get(context);
            if (c0235f != null) {
                c0235f.m1155c();
            }
        }
    }

    ColorStateList m3149b(Context context, int i) {
        ColorStateList e = m3142e(context, i);
        if (e == null) {
            if (i == C0405e.abc_edit_text_material) {
                e = C0485b.m2211a(context, C0403c.abc_tint_edittext);
            } else if (i == C0405e.abc_switch_track_mtrl_alpha) {
                e = C0485b.m2211a(context, C0403c.abc_tint_switch_track);
            } else if (i == C0405e.abc_switch_thumb_material) {
                e = m3141e(context);
            } else if (i == C0405e.abc_btn_default_mtrl_shape) {
                e = m3136b(context);
            } else if (i == C0405e.abc_btn_borderless_material) {
                e = m3137c(context);
            } else if (i == C0405e.abc_btn_colored_material) {
                e = m3139d(context);
            } else if (i == C0405e.abc_spinner_mtrl_am_alpha || i == C0405e.abc_spinner_textfield_background_material) {
                e = C0485b.m2211a(context, C0403c.abc_tint_spinner);
            } else if (C0623l.m3135a(f2255e, i)) {
                e = ar.m2944b(context, C0401a.colorControlNormal);
            } else if (C0623l.m3135a(f2258h, i)) {
                e = C0485b.m2211a(context, C0403c.abc_tint_default);
            } else if (C0623l.m3135a(f2259i, i)) {
                e = C0485b.m2211a(context, C0403c.abc_tint_btn_checkable);
            } else if (i == C0405e.abc_seekbar_thumb_material) {
                e = C0485b.m2211a(context, C0403c.abc_tint_seek_thumb);
            }
            if (e != null) {
                m3127a(context, i, e);
            }
        }
        return e;
    }
}
