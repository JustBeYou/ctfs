package android.support.v7.view.menu;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.v4.p017h.C0315p;
import android.support.v7.p020a.C0411a.C0401a;
import android.support.v7.p020a.C0411a.C0406f;
import android.support.v7.p020a.C0411a.C0407g;
import android.support.v7.p020a.C0411a.C0410j;
import android.support.v7.view.menu.C0504p.C0501a;
import android.support.v7.widget.aw;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.TextView;

public class ListMenuItemView extends LinearLayout implements C0501a {
    private C0524j f1522a;
    private ImageView f1523b;
    private RadioButton f1524c;
    private TextView f1525d;
    private CheckBox f1526e;
    private TextView f1527f;
    private ImageView f1528g;
    private Drawable f1529h;
    private int f1530i;
    private Context f1531j;
    private boolean f1532k;
    private Drawable f1533l;
    private int f1534m;
    private LayoutInflater f1535n;
    private boolean f1536o;

    public ListMenuItemView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, C0401a.listMenuViewStyle);
    }

    public ListMenuItemView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet);
        aw a = aw.m2953a(getContext(), attributeSet, C0410j.MenuView, i, 0);
        this.f1529h = a.m2957a(C0410j.MenuView_android_itemBackground);
        this.f1530i = a.m2970g(C0410j.MenuView_android_itemTextAppearance, -1);
        this.f1532k = a.m2959a(C0410j.MenuView_preserveIconSpacing, false);
        this.f1531j = context;
        this.f1533l = a.m2957a(C0410j.MenuView_subMenuArrow);
        a.m2958a();
    }

    private void m2310b() {
        this.f1523b = (ImageView) getInflater().inflate(C0407g.abc_list_menu_item_icon, this, false);
        addView(this.f1523b, 0);
    }

    private void m2311c() {
        this.f1524c = (RadioButton) getInflater().inflate(C0407g.abc_list_menu_item_radio, this, false);
        addView(this.f1524c);
    }

    private void m2312d() {
        this.f1526e = (CheckBox) getInflater().inflate(C0407g.abc_list_menu_item_checkbox, this, false);
        addView(this.f1526e);
    }

    private LayoutInflater getInflater() {
        if (this.f1535n == null) {
            this.f1535n = LayoutInflater.from(getContext());
        }
        return this.f1535n;
    }

    private void setSubMenuArrowVisible(boolean z) {
        if (this.f1528g != null) {
            this.f1528g.setVisibility(z ? 0 : 8);
        }
    }

    public void mo372a(C0524j c0524j, int i) {
        this.f1522a = c0524j;
        this.f1534m = i;
        setVisibility(c0524j.isVisible() ? 0 : 8);
        setTitle(c0524j.m2490a((C0501a) this));
        setCheckable(c0524j.isCheckable());
        m2314a(c0524j.m2504f(), c0524j.m2500d());
        setIcon(c0524j.getIcon());
        setEnabled(c0524j.isEnabled());
        setSubMenuArrowVisible(c0524j.hasSubMenu());
        setContentDescription(c0524j.getContentDescription());
    }

    public void m2314a(boolean z, char c) {
        int i = (z && this.f1522a.m2504f()) ? 0 : 8;
        if (i == 0) {
            this.f1527f.setText(this.f1522a.m2502e());
        }
        if (this.f1527f.getVisibility() != i) {
            this.f1527f.setVisibility(i);
        }
    }

    public boolean mo373a() {
        return false;
    }

    public C0524j getItemData() {
        return this.f1522a;
    }

    protected void onFinishInflate() {
        super.onFinishInflate();
        C0315p.m1382a((View) this, this.f1529h);
        this.f1525d = (TextView) findViewById(C0406f.title);
        if (this.f1530i != -1) {
            this.f1525d.setTextAppearance(this.f1531j, this.f1530i);
        }
        this.f1527f = (TextView) findViewById(C0406f.shortcut);
        this.f1528g = (ImageView) findViewById(C0406f.submenuarrow);
        if (this.f1528g != null) {
            this.f1528g.setImageDrawable(this.f1533l);
        }
    }

    protected void onMeasure(int i, int i2) {
        if (this.f1523b != null && this.f1532k) {
            LayoutParams layoutParams = getLayoutParams();
            LinearLayout.LayoutParams layoutParams2 = (LinearLayout.LayoutParams) this.f1523b.getLayoutParams();
            if (layoutParams.height > 0 && layoutParams2.width <= 0) {
                layoutParams2.width = layoutParams.height;
            }
        }
        super.onMeasure(i, i2);
    }

    public void setCheckable(boolean z) {
        if (z || this.f1524c != null || this.f1526e != null) {
            CompoundButton compoundButton;
            CompoundButton compoundButton2;
            if (this.f1522a.m2505g()) {
                if (this.f1524c == null) {
                    m2311c();
                }
                compoundButton = this.f1524c;
                compoundButton2 = this.f1526e;
            } else {
                if (this.f1526e == null) {
                    m2312d();
                }
                compoundButton = this.f1526e;
                compoundButton2 = this.f1524c;
            }
            if (z) {
                compoundButton.setChecked(this.f1522a.isChecked());
                int i = z ? 0 : 8;
                if (compoundButton.getVisibility() != i) {
                    compoundButton.setVisibility(i);
                }
                if (compoundButton2 != null && compoundButton2.getVisibility() != 8) {
                    compoundButton2.setVisibility(8);
                    return;
                }
                return;
            }
            if (this.f1526e != null) {
                this.f1526e.setVisibility(8);
            }
            if (this.f1524c != null) {
                this.f1524c.setVisibility(8);
            }
        }
    }

    public void setChecked(boolean z) {
        CompoundButton compoundButton;
        if (this.f1522a.m2505g()) {
            if (this.f1524c == null) {
                m2311c();
            }
            compoundButton = this.f1524c;
        } else {
            if (this.f1526e == null) {
                m2312d();
            }
            compoundButton = this.f1526e;
        }
        compoundButton.setChecked(z);
    }

    public void setForceShowIcon(boolean z) {
        this.f1536o = z;
        this.f1532k = z;
    }

    public void setIcon(Drawable drawable) {
        int i = (this.f1522a.m2507i() || this.f1536o) ? 1 : 0;
        if (i == 0 && !this.f1532k) {
            return;
        }
        if (this.f1523b != null || drawable != null || this.f1532k) {
            if (this.f1523b == null) {
                m2310b();
            }
            if (drawable != null || this.f1532k) {
                ImageView imageView = this.f1523b;
                if (i == 0) {
                    drawable = null;
                }
                imageView.setImageDrawable(drawable);
                if (this.f1523b.getVisibility() != 0) {
                    this.f1523b.setVisibility(0);
                    return;
                }
                return;
            }
            this.f1523b.setVisibility(8);
        }
    }

    public void setTitle(CharSequence charSequence) {
        if (charSequence != null) {
            this.f1525d.setText(charSequence);
            if (this.f1525d.getVisibility() != 0) {
                this.f1525d.setVisibility(0);
            }
        } else if (this.f1525d.getVisibility() != 8) {
            this.f1525d.setVisibility(8);
        }
    }
}
