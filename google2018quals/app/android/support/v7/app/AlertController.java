package android.support.v7.app;

import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnDismissListener;
import android.content.DialogInterface.OnKeyListener;
import android.content.DialogInterface.OnMultiChoiceClickListener;
import android.content.res.TypedArray;
import android.database.Cursor;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Message;
import android.support.v4.p017h.C0315p;
import android.support.v4.widget.NestedScrollView;
import android.support.v4.widget.NestedScrollView.C0369b;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.p020a.C0411a.C0406f;
import android.support.v7.p020a.C0411a.C0410j;
import android.support.v7.widget.ai.C0548a;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.view.ViewStub;
import android.view.Window;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckedTextView;
import android.widget.CursorAdapter;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleCursorAdapter;
import android.widget.TextView;
import java.lang.ref.WeakReference;

class AlertController {
    private boolean f1184A = false;
    private CharSequence f1185B;
    private CharSequence f1186C;
    private CharSequence f1187D;
    private int f1188E = 0;
    private Drawable f1189F;
    private ImageView f1190G;
    private TextView f1191H;
    private TextView f1192I;
    private View f1193J;
    private int f1194K;
    private int f1195L;
    private boolean f1196M;
    private int f1197N = 0;
    private final OnClickListener f1198O = new C04121(this);
    final C0431l f1199a;
    ListView f1200b;
    Button f1201c;
    Message f1202d;
    Button f1203e;
    Message f1204f;
    Button f1205g;
    Message f1206h;
    NestedScrollView f1207i;
    ListAdapter f1208j;
    int f1209k = -1;
    int f1210l;
    int f1211m;
    int f1212n;
    int f1213o;
    Handler f1214p;
    private final Context f1215q;
    private final Window f1216r;
    private CharSequence f1217s;
    private CharSequence f1218t;
    private View f1219u;
    private int f1220v;
    private int f1221w;
    private int f1222x;
    private int f1223y;
    private int f1224z;

    class C04121 implements OnClickListener {
        final /* synthetic */ AlertController f1117a;

        C04121(AlertController alertController) {
            this.f1117a = alertController;
        }

        public void onClick(View view) {
            Message obtain = (view != this.f1117a.f1201c || this.f1117a.f1202d == null) ? (view != this.f1117a.f1203e || this.f1117a.f1204f == null) ? (view != this.f1117a.f1205g || this.f1117a.f1206h == null) ? null : Message.obtain(this.f1117a.f1206h) : Message.obtain(this.f1117a.f1204f) : Message.obtain(this.f1117a.f1202d);
            if (obtain != null) {
                obtain.sendToTarget();
            }
            this.f1117a.f1214p.obtainMessage(1, this.f1117a.f1199a).sendToTarget();
        }
    }

    public static class RecycleListView extends ListView {
        private final int f1130a;
        private final int f1131b;

        public RecycleListView(Context context) {
            this(context, null);
        }

        public RecycleListView(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, C0410j.RecycleListView);
            this.f1131b = obtainStyledAttributes.getDimensionPixelOffset(C0410j.RecycleListView_paddingBottomNoButtons, -1);
            this.f1130a = obtainStyledAttributes.getDimensionPixelOffset(C0410j.RecycleListView_paddingTopNoTitle, -1);
        }

        public void m1844a(boolean z, boolean z2) {
            if (!z2 || !z) {
                setPadding(getPaddingLeft(), z ? getPaddingTop() : this.f1130a, getPaddingRight(), z2 ? getPaddingBottom() : this.f1131b);
            }
        }
    }

    public static class C0422a {
        public int f1144A;
        public boolean f1145B = false;
        public boolean[] f1146C;
        public boolean f1147D;
        public boolean f1148E;
        public int f1149F = -1;
        public OnMultiChoiceClickListener f1150G;
        public Cursor f1151H;
        public String f1152I;
        public String f1153J;
        public OnItemSelectedListener f1154K;
        public C0421a f1155L;
        public boolean f1156M = true;
        public final Context f1157a;
        public final LayoutInflater f1158b;
        public int f1159c = 0;
        public Drawable f1160d;
        public int f1161e = 0;
        public CharSequence f1162f;
        public View f1163g;
        public CharSequence f1164h;
        public CharSequence f1165i;
        public DialogInterface.OnClickListener f1166j;
        public CharSequence f1167k;
        public DialogInterface.OnClickListener f1168l;
        public CharSequence f1169m;
        public DialogInterface.OnClickListener f1170n;
        public boolean f1171o;
        public OnCancelListener f1172p;
        public OnDismissListener f1173q;
        public OnKeyListener f1174r;
        public CharSequence[] f1175s;
        public ListAdapter f1176t;
        public DialogInterface.OnClickListener f1177u;
        public int f1178v;
        public View f1179w;
        public int f1180x;
        public int f1181y;
        public int f1182z;

        public interface C0421a {
            void m1845a(ListView listView);
        }

        public C0422a(Context context) {
            this.f1157a = context;
            this.f1171o = true;
            this.f1158b = (LayoutInflater) context.getSystemService("layout_inflater");
        }

        private void m1846b(final AlertController alertController) {
            ListAdapter simpleCursorAdapter;
            final RecycleListView recycleListView = (RecycleListView) this.f1158b.inflate(alertController.f1210l, null);
            if (!this.f1147D) {
                int i = this.f1148E ? alertController.f1212n : alertController.f1213o;
                simpleCursorAdapter = this.f1151H != null ? new SimpleCursorAdapter(this.f1157a, i, this.f1151H, new String[]{this.f1152I}, new int[]{16908308}) : this.f1176t != null ? this.f1176t : new C0424c(this.f1157a, i, 16908308, this.f1175s);
            } else if (this.f1151H == null) {
                simpleCursorAdapter = new ArrayAdapter<CharSequence>(this, this.f1157a, alertController.f1211m, 16908308, this.f1175s) {
                    final /* synthetic */ C0422a f1133b;

                    public View getView(int i, View view, ViewGroup viewGroup) {
                        View view2 = super.getView(i, view, viewGroup);
                        if (this.f1133b.f1146C != null && this.f1133b.f1146C[i]) {
                            recycleListView.setItemChecked(i, true);
                        }
                        return view2;
                    }
                };
            } else {
                final AlertController alertController2 = alertController;
                Object c04182 = new CursorAdapter(this, this.f1157a, this.f1151H, false) {
                    final /* synthetic */ C0422a f1136c;
                    private final int f1137d;
                    private final int f1138e;

                    public void bindView(View view, Context context, Cursor cursor) {
                        ((CheckedTextView) view.findViewById(16908308)).setText(cursor.getString(this.f1137d));
                        recycleListView.setItemChecked(cursor.getPosition(), cursor.getInt(this.f1138e) == 1);
                    }

                    public View newView(Context context, Cursor cursor, ViewGroup viewGroup) {
                        return this.f1136c.f1158b.inflate(alertController2.f1211m, viewGroup, false);
                    }
                };
            }
            if (this.f1155L != null) {
                this.f1155L.m1845a(recycleListView);
            }
            alertController.f1208j = simpleCursorAdapter;
            alertController.f1209k = this.f1149F;
            if (this.f1177u != null) {
                recycleListView.setOnItemClickListener(new OnItemClickListener(this) {
                    final /* synthetic */ C0422a f1140b;

                    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                        this.f1140b.f1177u.onClick(alertController.f1199a, i);
                        if (!this.f1140b.f1148E) {
                            alertController.f1199a.dismiss();
                        }
                    }
                });
            } else if (this.f1150G != null) {
                recycleListView.setOnItemClickListener(new OnItemClickListener(this) {
                    final /* synthetic */ C0422a f1143c;

                    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                        if (this.f1143c.f1146C != null) {
                            this.f1143c.f1146C[i] = recycleListView.isItemChecked(i);
                        }
                        this.f1143c.f1150G.onClick(alertController.f1199a, i, recycleListView.isItemChecked(i));
                    }
                });
            }
            if (this.f1154K != null) {
                recycleListView.setOnItemSelectedListener(this.f1154K);
            }
            if (this.f1148E) {
                recycleListView.setChoiceMode(1);
            } else if (this.f1147D) {
                recycleListView.setChoiceMode(2);
            }
            alertController.f1200b = recycleListView;
        }

        public void m1847a(AlertController alertController) {
            if (this.f1163g != null) {
                alertController.m1868b(this.f1163g);
            } else {
                if (this.f1162f != null) {
                    alertController.m1865a(this.f1162f);
                }
                if (this.f1160d != null) {
                    alertController.m1863a(this.f1160d);
                }
                if (this.f1159c != 0) {
                    alertController.m1867b(this.f1159c);
                }
                if (this.f1161e != 0) {
                    alertController.m1867b(alertController.m1871c(this.f1161e));
                }
            }
            if (this.f1164h != null) {
                alertController.m1869b(this.f1164h);
            }
            if (this.f1165i != null) {
                alertController.m1862a(-1, this.f1165i, this.f1166j, null);
            }
            if (this.f1167k != null) {
                alertController.m1862a(-2, this.f1167k, this.f1168l, null);
            }
            if (this.f1169m != null) {
                alertController.m1862a(-3, this.f1169m, this.f1170n, null);
            }
            if (!(this.f1175s == null && this.f1151H == null && this.f1176t == null)) {
                m1846b(alertController);
            }
            if (this.f1179w != null) {
                if (this.f1145B) {
                    alertController.m1864a(this.f1179w, this.f1180x, this.f1181y, this.f1182z, this.f1144A);
                    return;
                }
                alertController.m1872c(this.f1179w);
            } else if (this.f1178v != 0) {
                alertController.m1861a(this.f1178v);
            }
        }
    }

    private static final class C0423b extends Handler {
        private WeakReference<DialogInterface> f1183a;

        public C0423b(DialogInterface dialogInterface) {
            this.f1183a = new WeakReference(dialogInterface);
        }

        public void handleMessage(Message message) {
            switch (message.what) {
                case -3:
                case -2:
                case -1:
                    ((DialogInterface.OnClickListener) message.obj).onClick((DialogInterface) this.f1183a.get(), message.what);
                    return;
                case 1:
                    ((DialogInterface) message.obj).dismiss();
                    return;
                default:
                    return;
            }
        }
    }

    private static class C0424c extends ArrayAdapter<CharSequence> {
        public C0424c(Context context, int i, int i2, CharSequence[] charSequenceArr) {
            super(context, i, i2, charSequenceArr);
        }

        public long getItemId(int i) {
            return (long) i;
        }

        public boolean hasStableIds() {
            return true;
        }
    }

    public AlertController(Context context, C0431l c0431l, Window window) {
        this.f1215q = context;
        this.f1199a = c0431l;
        this.f1216r = window;
        this.f1214p = new C0423b(c0431l);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(null, C0410j.AlertDialog, C0401a.alertDialogStyle, 0);
        this.f1194K = obtainStyledAttributes.getResourceId(C0410j.AlertDialog_android_layout, 0);
        this.f1195L = obtainStyledAttributes.getResourceId(C0410j.AlertDialog_buttonPanelSideLayout, 0);
        this.f1210l = obtainStyledAttributes.getResourceId(C0410j.AlertDialog_listLayout, 0);
        this.f1211m = obtainStyledAttributes.getResourceId(C0410j.AlertDialog_multiChoiceItemLayout, 0);
        this.f1212n = obtainStyledAttributes.getResourceId(C0410j.AlertDialog_singleChoiceItemLayout, 0);
        this.f1213o = obtainStyledAttributes.getResourceId(C0410j.AlertDialog_listItemLayout, 0);
        this.f1196M = obtainStyledAttributes.getBoolean(C0410j.AlertDialog_showTitle, true);
        obtainStyledAttributes.recycle();
        c0431l.m1911a(1);
    }

    private ViewGroup m1848a(View view, View view2) {
        if (view == null) {
            return (ViewGroup) (view2 instanceof ViewStub ? ((ViewStub) view2).inflate() : view2);
        }
        if (view2 != null) {
            ViewParent parent = view2.getParent();
            if (parent instanceof ViewGroup) {
                ((ViewGroup) parent).removeView(view2);
            }
        }
        return (ViewGroup) (view instanceof ViewStub ? ((ViewStub) view).inflate() : view);
    }

    static void m1849a(View view, View view2, View view3) {
        int i = 0;
        if (view2 != null) {
            view2.setVisibility(view.canScrollVertically(-1) ? 0 : 4);
        }
        if (view3 != null) {
            if (!view.canScrollVertically(1)) {
                i = 4;
            }
            view3.setVisibility(i);
        }
    }

    private void m1850a(ViewGroup viewGroup) {
        boolean z = false;
        View inflate = this.f1219u != null ? this.f1219u : this.f1220v != 0 ? LayoutInflater.from(this.f1215q).inflate(this.f1220v, viewGroup, false) : null;
        if (inflate != null) {
            z = true;
        }
        if (!(z && m1854a(inflate))) {
            this.f1216r.setFlags(131072, 131072);
        }
        if (z) {
            FrameLayout frameLayout = (FrameLayout) this.f1216r.findViewById(C0406f.custom);
            frameLayout.addView(inflate, new LayoutParams(-1, -1));
            if (this.f1184A) {
                frameLayout.setPadding(this.f1221w, this.f1222x, this.f1223y, this.f1224z);
            }
            if (this.f1200b != null) {
                ((C0548a) viewGroup.getLayoutParams()).f1801g = 0.0f;
                return;
            }
            return;
        }
        viewGroup.setVisibility(8);
    }

    private void m1851a(ViewGroup viewGroup, View view, int i, int i2) {
        View view2 = null;
        View findViewById = this.f1216r.findViewById(C0406f.scrollIndicatorUp);
        View findViewById2 = this.f1216r.findViewById(C0406f.scrollIndicatorDown);
        if (VERSION.SDK_INT >= 23) {
            C0315p.m1379a(view, i, i2);
            if (findViewById != null) {
                viewGroup.removeView(findViewById);
            }
            if (findViewById2 != null) {
                viewGroup.removeView(findViewById2);
                return;
            }
            return;
        }
        if (findViewById != null && (i & 1) == 0) {
            viewGroup.removeView(findViewById);
            findViewById = null;
        }
        if (findViewById2 == null || (i & 2) != 0) {
            view2 = findViewById2;
        } else {
            viewGroup.removeView(findViewById2);
        }
        if (findViewById != null || view2 != null) {
            if (this.f1218t != null) {
                this.f1207i.setOnScrollChangeListener(new C0369b(this) {
                    final /* synthetic */ AlertController f1120c;

                    public void mo259a(NestedScrollView nestedScrollView, int i, int i2, int i3, int i4) {
                        AlertController.m1849a(nestedScrollView, findViewById, view2);
                    }
                });
                this.f1207i.post(new Runnable(this) {
                    final /* synthetic */ AlertController f1123c;

                    public void run() {
                        AlertController.m1849a(this.f1123c.f1207i, findViewById, view2);
                    }
                });
            } else if (this.f1200b != null) {
                this.f1200b.setOnScrollListener(new OnScrollListener(this) {
                    final /* synthetic */ AlertController f1126c;

                    public void onScroll(AbsListView absListView, int i, int i2, int i3) {
                        AlertController.m1849a(absListView, findViewById, view2);
                    }

                    public void onScrollStateChanged(AbsListView absListView, int i) {
                    }
                });
                this.f1200b.post(new Runnable(this) {
                    final /* synthetic */ AlertController f1129c;

                    public void run() {
                        AlertController.m1849a(this.f1129c.f1200b, findViewById, view2);
                    }
                });
            } else {
                if (findViewById != null) {
                    viewGroup.removeView(findViewById);
                }
                if (view2 != null) {
                    viewGroup.removeView(view2);
                }
            }
        }
    }

    private void m1852a(Button button) {
        LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) button.getLayoutParams();
        layoutParams.gravity = 1;
        layoutParams.weight = 0.5f;
        button.setLayoutParams(layoutParams);
    }

    private static boolean m1853a(Context context) {
        TypedValue typedValue = new TypedValue();
        context.getTheme().resolveAttribute(C0401a.alertDialogCenterButtons, typedValue, true);
        return typedValue.data != 0;
    }

    static boolean m1854a(View view) {
        if (view.onCheckIsTextEditor()) {
            return true;
        }
        if (!(view instanceof ViewGroup)) {
            return false;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        int childCount = viewGroup.getChildCount();
        while (childCount > 0) {
            childCount--;
            if (m1854a(viewGroup.getChildAt(childCount))) {
                return true;
            }
        }
        return false;
    }

    private int m1855b() {
        return this.f1195L == 0 ? this.f1194K : this.f1197N == 1 ? this.f1195L : this.f1194K;
    }

    private void m1856b(ViewGroup viewGroup) {
        if (this.f1193J != null) {
            viewGroup.addView(this.f1193J, 0, new LayoutParams(-1, -2));
            this.f1216r.findViewById(C0406f.title_template).setVisibility(8);
            return;
        }
        this.f1190G = (ImageView) this.f1216r.findViewById(16908294);
        if ((!TextUtils.isEmpty(this.f1217s) ? 1 : 0) == 0 || !this.f1196M) {
            this.f1216r.findViewById(C0406f.title_template).setVisibility(8);
            this.f1190G.setVisibility(8);
            viewGroup.setVisibility(8);
            return;
        }
        this.f1191H = (TextView) this.f1216r.findViewById(C0406f.alertTitle);
        this.f1191H.setText(this.f1217s);
        if (this.f1188E != 0) {
            this.f1190G.setImageResource(this.f1188E);
        } else if (this.f1189F != null) {
            this.f1190G.setImageDrawable(this.f1189F);
        } else {
            this.f1191H.setPadding(this.f1190G.getPaddingLeft(), this.f1190G.getPaddingTop(), this.f1190G.getPaddingRight(), this.f1190G.getPaddingBottom());
            this.f1190G.setVisibility(8);
        }
    }

    private void m1857c() {
        View findViewById = this.f1216r.findViewById(C0406f.parentPanel);
        View findViewById2 = findViewById.findViewById(C0406f.topPanel);
        View findViewById3 = findViewById.findViewById(C0406f.contentPanel);
        View findViewById4 = findViewById.findViewById(C0406f.buttonPanel);
        ViewGroup viewGroup = (ViewGroup) findViewById.findViewById(C0406f.customPanel);
        m1850a(viewGroup);
        View findViewById5 = viewGroup.findViewById(C0406f.topPanel);
        View findViewById6 = viewGroup.findViewById(C0406f.contentPanel);
        View findViewById7 = viewGroup.findViewById(C0406f.buttonPanel);
        ViewGroup a = m1848a(findViewById5, findViewById2);
        ViewGroup a2 = m1848a(findViewById6, findViewById3);
        ViewGroup a3 = m1848a(findViewById7, findViewById4);
        m1858c(a2);
        m1859d(a3);
        m1856b(a);
        boolean z = (viewGroup == null || viewGroup.getVisibility() == 8) ? false : true;
        boolean z2 = (a == null || a.getVisibility() == 8) ? false : true;
        boolean z3 = (a3 == null || a3.getVisibility() == 8) ? false : true;
        if (!(z3 || a2 == null)) {
            findViewById = a2.findViewById(C0406f.textSpacerNoButtons);
            if (findViewById != null) {
                findViewById.setVisibility(0);
            }
        }
        if (z2) {
            if (this.f1207i != null) {
                this.f1207i.setClipToPadding(true);
            }
            findViewById = null;
            if (!(this.f1218t == null && this.f1200b == null)) {
                findViewById = a.findViewById(C0406f.titleDividerNoCustom);
            }
            if (findViewById != null) {
                findViewById.setVisibility(0);
            }
        } else if (a2 != null) {
            findViewById = a2.findViewById(C0406f.textSpacerNoTitle);
            if (findViewById != null) {
                findViewById.setVisibility(0);
            }
        }
        if (this.f1200b instanceof RecycleListView) {
            ((RecycleListView) this.f1200b).m1844a(z2, z3);
        }
        if (!z) {
            findViewById3 = this.f1200b != null ? this.f1200b : this.f1207i;
            if (findViewById3 != null) {
                m1851a(a2, findViewById3, (z3 ? 2 : 0) | (z2 ? 1 : 0), 3);
            }
        }
        ListView listView = this.f1200b;
        if (listView != null && this.f1208j != null) {
            listView.setAdapter(this.f1208j);
            int i = this.f1209k;
            if (i > -1) {
                listView.setItemChecked(i, true);
                listView.setSelection(i);
            }
        }
    }

    private void m1858c(ViewGroup viewGroup) {
        this.f1207i = (NestedScrollView) this.f1216r.findViewById(C0406f.scrollView);
        this.f1207i.setFocusable(false);
        this.f1207i.setNestedScrollingEnabled(false);
        this.f1192I = (TextView) viewGroup.findViewById(16908299);
        if (this.f1192I != null) {
            if (this.f1218t != null) {
                this.f1192I.setText(this.f1218t);
                return;
            }
            this.f1192I.setVisibility(8);
            this.f1207i.removeView(this.f1192I);
            if (this.f1200b != null) {
                ViewGroup viewGroup2 = (ViewGroup) this.f1207i.getParent();
                int indexOfChild = viewGroup2.indexOfChild(this.f1207i);
                viewGroup2.removeViewAt(indexOfChild);
                viewGroup2.addView(this.f1200b, indexOfChild, new LayoutParams(-1, -1));
                return;
            }
            viewGroup.setVisibility(8);
        }
    }

    private void m1859d(ViewGroup viewGroup) {
        int i;
        int i2 = 1;
        this.f1201c = (Button) viewGroup.findViewById(16908313);
        this.f1201c.setOnClickListener(this.f1198O);
        if (TextUtils.isEmpty(this.f1185B)) {
            this.f1201c.setVisibility(8);
            i = 0;
        } else {
            this.f1201c.setText(this.f1185B);
            this.f1201c.setVisibility(0);
            i = 1;
        }
        this.f1203e = (Button) viewGroup.findViewById(16908314);
        this.f1203e.setOnClickListener(this.f1198O);
        if (TextUtils.isEmpty(this.f1186C)) {
            this.f1203e.setVisibility(8);
        } else {
            this.f1203e.setText(this.f1186C);
            this.f1203e.setVisibility(0);
            i |= 2;
        }
        this.f1205g = (Button) viewGroup.findViewById(16908315);
        this.f1205g.setOnClickListener(this.f1198O);
        if (TextUtils.isEmpty(this.f1187D)) {
            this.f1205g.setVisibility(8);
        } else {
            this.f1205g.setText(this.f1187D);
            this.f1205g.setVisibility(0);
            i |= 4;
        }
        if (m1853a(this.f1215q)) {
            if (i == 1) {
                m1852a(this.f1201c);
            } else if (i == 2) {
                m1852a(this.f1203e);
            } else if (i == 4) {
                m1852a(this.f1205g);
            }
        }
        if (i == 0) {
            i2 = 0;
        }
        if (i2 == 0) {
            viewGroup.setVisibility(8);
        }
    }

    public void m1860a() {
        this.f1199a.setContentView(m1855b());
        m1857c();
    }

    public void m1861a(int i) {
        this.f1219u = null;
        this.f1220v = i;
        this.f1184A = false;
    }

    public void m1862a(int i, CharSequence charSequence, DialogInterface.OnClickListener onClickListener, Message message) {
        if (message == null && onClickListener != null) {
            message = this.f1214p.obtainMessage(i, onClickListener);
        }
        switch (i) {
            case -3:
                this.f1187D = charSequence;
                this.f1206h = message;
                return;
            case -2:
                this.f1186C = charSequence;
                this.f1204f = message;
                return;
            case -1:
                this.f1185B = charSequence;
                this.f1202d = message;
                return;
            default:
                throw new IllegalArgumentException("Button does not exist");
        }
    }

    public void m1863a(Drawable drawable) {
        this.f1189F = drawable;
        this.f1188E = 0;
        if (this.f1190G == null) {
            return;
        }
        if (drawable != null) {
            this.f1190G.setVisibility(0);
            this.f1190G.setImageDrawable(drawable);
            return;
        }
        this.f1190G.setVisibility(8);
    }

    public void m1864a(View view, int i, int i2, int i3, int i4) {
        this.f1219u = view;
        this.f1220v = 0;
        this.f1184A = true;
        this.f1221w = i;
        this.f1222x = i2;
        this.f1223y = i3;
        this.f1224z = i4;
    }

    public void m1865a(CharSequence charSequence) {
        this.f1217s = charSequence;
        if (this.f1191H != null) {
            this.f1191H.setText(charSequence);
        }
    }

    public boolean m1866a(int i, KeyEvent keyEvent) {
        return this.f1207i != null && this.f1207i.m1741a(keyEvent);
    }

    public void m1867b(int i) {
        this.f1189F = null;
        this.f1188E = i;
        if (this.f1190G == null) {
            return;
        }
        if (i != 0) {
            this.f1190G.setVisibility(0);
            this.f1190G.setImageResource(this.f1188E);
            return;
        }
        this.f1190G.setVisibility(8);
    }

    public void m1868b(View view) {
        this.f1193J = view;
    }

    public void m1869b(CharSequence charSequence) {
        this.f1218t = charSequence;
        if (this.f1192I != null) {
            this.f1192I.setText(charSequence);
        }
    }

    public boolean m1870b(int i, KeyEvent keyEvent) {
        return this.f1207i != null && this.f1207i.m1741a(keyEvent);
    }

    public int m1871c(int i) {
        TypedValue typedValue = new TypedValue();
        this.f1215q.getTheme().resolveAttribute(i, typedValue, true);
        return typedValue.resourceId;
    }

    public void m1872c(View view) {
        this.f1219u = view;
        this.f1220v = 0;
        this.f1184A = false;
    }
}
