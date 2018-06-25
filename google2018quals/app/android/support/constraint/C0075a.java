package android.support.constraint;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Build.VERSION;
import android.support.constraint.C0078c.C0077a;
import android.support.constraint.ConstraintLayout.C0046a;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseIntArray;
import android.util.Xml;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

public class C0075a {
    private static final int[] f401a = new int[]{0, 4, 8};
    private static SparseIntArray f402c = new SparseIntArray();
    private HashMap<Integer, C0048a> f403b = new HashMap();

    private static class C0048a {
        public int f199A;
        public int f200B;
        public int f201C;
        public int f202D;
        public int f203E;
        public int f204F;
        public int f205G;
        public int f206H;
        public int f207I;
        public int f208J;
        public int f209K;
        public int f210L;
        public int f211M;
        public float f212N;
        public float f213O;
        public int f214P;
        public int f215Q;
        public float f216R;
        public boolean f217S;
        public float f218T;
        public float f219U;
        public float f220V;
        public float f221W;
        public float f222X;
        public float f223Y;
        public float f224Z;
        boolean f225a;
        public float aa;
        public float ab;
        public float ac;
        public int ad;
        public int ae;
        public int af;
        public int ag;
        public int ah;
        public int ai;
        public int f226b;
        public int f227c;
        int f228d;
        public int f229e;
        public int f230f;
        public float f231g;
        public int f232h;
        public int f233i;
        public int f234j;
        public int f235k;
        public int f236l;
        public int f237m;
        public int f238n;
        public int f239o;
        public int f240p;
        public int f241q;
        public int f242r;
        public int f243s;
        public int f244t;
        public float f245u;
        public float f246v;
        public String f247w;
        public int f248x;
        public int f249y;
        public int f250z;

        private C0048a() {
            this.f225a = false;
            this.f229e = -1;
            this.f230f = -1;
            this.f231g = -1.0f;
            this.f232h = -1;
            this.f233i = -1;
            this.f234j = -1;
            this.f235k = -1;
            this.f236l = -1;
            this.f237m = -1;
            this.f238n = -1;
            this.f239o = -1;
            this.f240p = -1;
            this.f241q = -1;
            this.f242r = -1;
            this.f243s = -1;
            this.f244t = -1;
            this.f245u = 0.5f;
            this.f246v = 0.5f;
            this.f247w = null;
            this.f248x = -1;
            this.f249y = -1;
            this.f250z = -1;
            this.f199A = -1;
            this.f200B = -1;
            this.f201C = -1;
            this.f202D = -1;
            this.f203E = -1;
            this.f204F = -1;
            this.f205G = 0;
            this.f206H = -1;
            this.f207I = -1;
            this.f208J = -1;
            this.f209K = -1;
            this.f210L = -1;
            this.f211M = -1;
            this.f212N = 0.0f;
            this.f213O = 0.0f;
            this.f214P = 0;
            this.f215Q = 0;
            this.f216R = 1.0f;
            this.f217S = false;
            this.f218T = 0.0f;
            this.f219U = 0.0f;
            this.f220V = 0.0f;
            this.f221W = 1.0f;
            this.f222X = 1.0f;
            this.f223Y = 0.0f;
            this.f224Z = 0.0f;
            this.aa = 0.0f;
            this.ab = 0.0f;
            this.ac = 0.0f;
            this.ad = -1;
            this.ae = -1;
            this.af = -1;
            this.ag = -1;
            this.ah = -1;
            this.ai = -1;
        }

        public C0048a m130a() {
            C0048a c0048a = new C0048a();
            c0048a.f225a = this.f225a;
            c0048a.f226b = this.f226b;
            c0048a.f227c = this.f227c;
            c0048a.f229e = this.f229e;
            c0048a.f230f = this.f230f;
            c0048a.f231g = this.f231g;
            c0048a.f232h = this.f232h;
            c0048a.f233i = this.f233i;
            c0048a.f234j = this.f234j;
            c0048a.f235k = this.f235k;
            c0048a.f236l = this.f236l;
            c0048a.f237m = this.f237m;
            c0048a.f238n = this.f238n;
            c0048a.f239o = this.f239o;
            c0048a.f240p = this.f240p;
            c0048a.f241q = this.f241q;
            c0048a.f242r = this.f242r;
            c0048a.f243s = this.f243s;
            c0048a.f244t = this.f244t;
            c0048a.f245u = this.f245u;
            c0048a.f246v = this.f246v;
            c0048a.f247w = this.f247w;
            c0048a.f248x = this.f248x;
            c0048a.f249y = this.f249y;
            c0048a.f245u = this.f245u;
            c0048a.f245u = this.f245u;
            c0048a.f245u = this.f245u;
            c0048a.f245u = this.f245u;
            c0048a.f245u = this.f245u;
            c0048a.f250z = this.f250z;
            c0048a.f199A = this.f199A;
            c0048a.f200B = this.f200B;
            c0048a.f201C = this.f201C;
            c0048a.f202D = this.f202D;
            c0048a.f203E = this.f203E;
            c0048a.f204F = this.f204F;
            c0048a.f205G = this.f205G;
            c0048a.f206H = this.f206H;
            c0048a.f207I = this.f207I;
            c0048a.f208J = this.f208J;
            c0048a.f209K = this.f209K;
            c0048a.f210L = this.f210L;
            c0048a.f211M = this.f211M;
            c0048a.f212N = this.f212N;
            c0048a.f213O = this.f213O;
            c0048a.f214P = this.f214P;
            c0048a.f215Q = this.f215Q;
            c0048a.f216R = this.f216R;
            c0048a.f217S = this.f217S;
            c0048a.f218T = this.f218T;
            c0048a.f219U = this.f219U;
            c0048a.f220V = this.f220V;
            c0048a.f221W = this.f221W;
            c0048a.f222X = this.f222X;
            c0048a.f223Y = this.f223Y;
            c0048a.f224Z = this.f224Z;
            c0048a.aa = this.aa;
            c0048a.ab = this.ab;
            c0048a.ac = this.ac;
            c0048a.ad = this.ad;
            c0048a.ae = this.ae;
            c0048a.af = this.af;
            c0048a.ag = this.ag;
            c0048a.ah = this.ah;
            c0048a.ai = this.ai;
            return c0048a;
        }

        public void m131a(C0046a c0046a) {
            c0046a.f166d = this.f232h;
            c0046a.f167e = this.f233i;
            c0046a.f168f = this.f234j;
            c0046a.f169g = this.f235k;
            c0046a.f170h = this.f236l;
            c0046a.f171i = this.f237m;
            c0046a.f172j = this.f238n;
            c0046a.f173k = this.f239o;
            c0046a.f174l = this.f240p;
            c0046a.f175m = this.f241q;
            c0046a.f176n = this.f242r;
            c0046a.f177o = this.f243s;
            c0046a.f178p = this.f244t;
            c0046a.leftMargin = this.f199A;
            c0046a.rightMargin = this.f200B;
            c0046a.topMargin = this.f201C;
            c0046a.bottomMargin = this.f202D;
            c0046a.f183u = this.f211M;
            c0046a.f184v = this.f210L;
            c0046a.f185w = this.f245u;
            c0046a.f186x = this.f246v;
            c0046a.f187y = this.f247w;
            c0046a.f148L = this.f248x;
            c0046a.f149M = this.f249y;
            c0046a.f139C = this.f212N;
            c0046a.f138B = this.f213O;
            c0046a.f141E = this.f215Q;
            c0046a.f140D = this.f214P;
            c0046a.f142F = this.ad;
            c0046a.f143G = this.ae;
            c0046a.f146J = this.af;
            c0046a.f147K = this.ag;
            c0046a.f144H = this.ah;
            c0046a.f145I = this.ai;
            c0046a.f150N = this.f250z;
            c0046a.f165c = this.f231g;
            c0046a.f163a = this.f229e;
            c0046a.f164b = this.f230f;
            c0046a.width = this.f226b;
            c0046a.height = this.f227c;
            if (VERSION.SDK_INT >= 17) {
                c0046a.setMarginStart(this.f204F);
                c0046a.setMarginEnd(this.f203E);
            }
            c0046a.m119a();
        }

        public /* synthetic */ Object clone() {
            return m130a();
        }
    }

    static {
        f402c.append(C0077a.ConstraintSet_layout_constraintLeft_toLeftOf, 25);
        f402c.append(C0077a.ConstraintSet_layout_constraintLeft_toRightOf, 26);
        f402c.append(C0077a.ConstraintSet_layout_constraintRight_toLeftOf, 29);
        f402c.append(C0077a.ConstraintSet_layout_constraintRight_toRightOf, 30);
        f402c.append(C0077a.ConstraintSet_layout_constraintTop_toTopOf, 36);
        f402c.append(C0077a.ConstraintSet_layout_constraintTop_toBottomOf, 35);
        f402c.append(C0077a.ConstraintSet_layout_constraintBottom_toTopOf, 4);
        f402c.append(C0077a.ConstraintSet_layout_constraintBottom_toBottomOf, 3);
        f402c.append(C0077a.ConstraintSet_layout_constraintBaseline_toBaselineOf, 1);
        f402c.append(C0077a.ConstraintSet_layout_editor_absoluteX, 6);
        f402c.append(C0077a.ConstraintSet_layout_editor_absoluteY, 7);
        f402c.append(C0077a.ConstraintSet_layout_constraintGuide_begin, 17);
        f402c.append(C0077a.ConstraintSet_layout_constraintGuide_end, 18);
        f402c.append(C0077a.ConstraintSet_layout_constraintGuide_percent, 19);
        f402c.append(C0077a.ConstraintSet_android_orientation, 27);
        f402c.append(C0077a.ConstraintSet_layout_constraintStart_toEndOf, 32);
        f402c.append(C0077a.ConstraintSet_layout_constraintStart_toStartOf, 33);
        f402c.append(C0077a.ConstraintSet_layout_constraintEnd_toStartOf, 10);
        f402c.append(C0077a.ConstraintSet_layout_constraintEnd_toEndOf, 9);
        f402c.append(C0077a.ConstraintSet_layout_goneMarginLeft, 13);
        f402c.append(C0077a.ConstraintSet_layout_goneMarginTop, 16);
        f402c.append(C0077a.ConstraintSet_layout_goneMarginRight, 14);
        f402c.append(C0077a.ConstraintSet_layout_goneMarginBottom, 11);
        f402c.append(C0077a.ConstraintSet_layout_goneMarginStart, 15);
        f402c.append(C0077a.ConstraintSet_layout_goneMarginEnd, 12);
        f402c.append(C0077a.ConstraintSet_layout_constraintVertical_weight, 40);
        f402c.append(C0077a.ConstraintSet_layout_constraintHorizontal_weight, 39);
        f402c.append(C0077a.ConstraintSet_layout_constraintHorizontal_chainStyle, 41);
        f402c.append(C0077a.ConstraintSet_layout_constraintVertical_chainStyle, 42);
        f402c.append(C0077a.ConstraintSet_layout_constraintHorizontal_bias, 20);
        f402c.append(C0077a.ConstraintSet_layout_constraintVertical_bias, 37);
        f402c.append(C0077a.ConstraintSet_layout_constraintDimensionRatio, 5);
        f402c.append(C0077a.ConstraintSet_layout_constraintLeft_creator, 60);
        f402c.append(C0077a.ConstraintSet_layout_constraintTop_creator, 60);
        f402c.append(C0077a.ConstraintSet_layout_constraintRight_creator, 60);
        f402c.append(C0077a.ConstraintSet_layout_constraintBottom_creator, 60);
        f402c.append(C0077a.ConstraintSet_layout_constraintBaseline_creator, 60);
        f402c.append(C0077a.ConstraintSet_android_layout_marginLeft, 24);
        f402c.append(C0077a.ConstraintSet_android_layout_marginRight, 28);
        f402c.append(C0077a.ConstraintSet_android_layout_marginStart, 31);
        f402c.append(C0077a.ConstraintSet_android_layout_marginEnd, 8);
        f402c.append(C0077a.ConstraintSet_android_layout_marginTop, 34);
        f402c.append(C0077a.ConstraintSet_android_layout_marginBottom, 2);
        f402c.append(C0077a.ConstraintSet_android_layout_width, 23);
        f402c.append(C0077a.ConstraintSet_android_layout_height, 21);
        f402c.append(C0077a.ConstraintSet_android_visibility, 22);
        f402c.append(C0077a.ConstraintSet_android_alpha, 43);
        f402c.append(C0077a.ConstraintSet_android_elevation, 44);
        f402c.append(C0077a.ConstraintSet_android_rotationX, 45);
        f402c.append(C0077a.ConstraintSet_android_rotationY, 46);
        f402c.append(C0077a.ConstraintSet_android_scaleX, 47);
        f402c.append(C0077a.ConstraintSet_android_scaleY, 48);
        f402c.append(C0077a.ConstraintSet_android_transformPivotX, 49);
        f402c.append(C0077a.ConstraintSet_android_transformPivotY, 50);
        f402c.append(C0077a.ConstraintSet_android_translationX, 51);
        f402c.append(C0077a.ConstraintSet_android_translationY, 52);
        f402c.append(C0077a.ConstraintSet_android_translationZ, 53);
        f402c.append(C0077a.ConstraintSet_layout_constraintWidth_default, 54);
        f402c.append(C0077a.ConstraintSet_layout_constraintHeight_default, 55);
        f402c.append(C0077a.ConstraintSet_layout_constraintWidth_max, 56);
        f402c.append(C0077a.ConstraintSet_layout_constraintHeight_max, 57);
        f402c.append(C0077a.ConstraintSet_layout_constraintWidth_min, 58);
        f402c.append(C0077a.ConstraintSet_layout_constraintHeight_min, 59);
        f402c.append(C0077a.ConstraintSet_android_id, 38);
    }

    private static int m340a(TypedArray typedArray, int i, int i2) {
        int resourceId = typedArray.getResourceId(i, i2);
        return resourceId == -1 ? typedArray.getInt(i, -1) : resourceId;
    }

    private C0048a m341a(Context context, AttributeSet attributeSet) {
        C0048a c0048a = new C0048a();
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, C0077a.ConstraintSet);
        m342a(c0048a, obtainStyledAttributes);
        obtainStyledAttributes.recycle();
        return c0048a;
    }

    private void m342a(C0048a c0048a, TypedArray typedArray) {
        int indexCount = typedArray.getIndexCount();
        for (int i = 0; i < indexCount; i++) {
            int index = typedArray.getIndex(i);
            switch (f402c.get(index)) {
                case 1:
                    c0048a.f240p = C0075a.m340a(typedArray, index, c0048a.f240p);
                    break;
                case 2:
                    c0048a.f202D = typedArray.getDimensionPixelSize(index, c0048a.f202D);
                    break;
                case 3:
                    c0048a.f239o = C0075a.m340a(typedArray, index, c0048a.f239o);
                    break;
                case 4:
                    c0048a.f238n = C0075a.m340a(typedArray, index, c0048a.f238n);
                    break;
                case 5:
                    c0048a.f247w = typedArray.getString(index);
                    break;
                case 6:
                    c0048a.f248x = typedArray.getDimensionPixelOffset(index, c0048a.f248x);
                    break;
                case 7:
                    c0048a.f249y = typedArray.getDimensionPixelOffset(index, c0048a.f249y);
                    break;
                case 8:
                    c0048a.f203E = typedArray.getDimensionPixelSize(index, c0048a.f203E);
                    break;
                case 9:
                    c0048a.f238n = C0075a.m340a(typedArray, index, c0048a.f244t);
                    break;
                case 10:
                    c0048a.f243s = C0075a.m340a(typedArray, index, c0048a.f243s);
                    break;
                case 11:
                    c0048a.f209K = typedArray.getDimensionPixelSize(index, c0048a.f209K);
                    break;
                case 12:
                    c0048a.f210L = typedArray.getDimensionPixelSize(index, c0048a.f210L);
                    break;
                case 13:
                    c0048a.f206H = typedArray.getDimensionPixelSize(index, c0048a.f206H);
                    break;
                case 14:
                    c0048a.f208J = typedArray.getDimensionPixelSize(index, c0048a.f208J);
                    break;
                case 15:
                    c0048a.f211M = typedArray.getDimensionPixelSize(index, c0048a.f211M);
                    break;
                case 16:
                    c0048a.f207I = typedArray.getDimensionPixelSize(index, c0048a.f207I);
                    break;
                case 17:
                    c0048a.f229e = typedArray.getDimensionPixelOffset(index, c0048a.f229e);
                    break;
                case 18:
                    c0048a.f230f = typedArray.getDimensionPixelOffset(index, c0048a.f230f);
                    break;
                case 19:
                    c0048a.f231g = typedArray.getFloat(index, c0048a.f231g);
                    break;
                case 20:
                    c0048a.f245u = typedArray.getFloat(index, c0048a.f245u);
                    break;
                case 21:
                    c0048a.f227c = typedArray.getLayoutDimension(index, c0048a.f227c);
                    break;
                case 22:
                    c0048a.f205G = typedArray.getInt(index, c0048a.f205G);
                    c0048a.f205G = f401a[c0048a.f205G];
                    break;
                case 23:
                    c0048a.f226b = typedArray.getLayoutDimension(index, c0048a.f226b);
                    break;
                case 24:
                    c0048a.f199A = typedArray.getDimensionPixelSize(index, c0048a.f199A);
                    break;
                case 25:
                    c0048a.f232h = C0075a.m340a(typedArray, index, c0048a.f232h);
                    break;
                case 26:
                    c0048a.f233i = C0075a.m340a(typedArray, index, c0048a.f233i);
                    break;
                case 27:
                    c0048a.f250z = typedArray.getInt(index, c0048a.f250z);
                    break;
                case 28:
                    c0048a.f200B = typedArray.getDimensionPixelSize(index, c0048a.f200B);
                    break;
                case 29:
                    c0048a.f234j = C0075a.m340a(typedArray, index, c0048a.f234j);
                    break;
                case 30:
                    c0048a.f235k = C0075a.m340a(typedArray, index, c0048a.f235k);
                    break;
                case 31:
                    c0048a.f204F = typedArray.getDimensionPixelSize(index, c0048a.f204F);
                    break;
                case 32:
                    c0048a.f241q = C0075a.m340a(typedArray, index, c0048a.f241q);
                    break;
                case 33:
                    c0048a.f242r = C0075a.m340a(typedArray, index, c0048a.f242r);
                    break;
                case 34:
                    c0048a.f201C = typedArray.getDimensionPixelSize(index, c0048a.f201C);
                    break;
                case 35:
                    c0048a.f237m = C0075a.m340a(typedArray, index, c0048a.f237m);
                    break;
                case 36:
                    c0048a.f236l = C0075a.m340a(typedArray, index, c0048a.f236l);
                    break;
                case 37:
                    c0048a.f246v = typedArray.getFloat(index, c0048a.f246v);
                    break;
                case 38:
                    c0048a.f228d = typedArray.getResourceId(index, c0048a.f228d);
                    break;
                case 39:
                    c0048a.f213O = typedArray.getFloat(index, c0048a.f213O);
                    break;
                case 40:
                    c0048a.f212N = typedArray.getFloat(index, c0048a.f212N);
                    break;
                case 41:
                    c0048a.f214P = typedArray.getInt(index, c0048a.f214P);
                    break;
                case 42:
                    c0048a.f215Q = typedArray.getInt(index, c0048a.f215Q);
                    break;
                case 43:
                    c0048a.f216R = typedArray.getFloat(index, c0048a.f216R);
                    break;
                case 44:
                    c0048a.f217S = true;
                    c0048a.f218T = typedArray.getFloat(index, c0048a.f218T);
                    break;
                case 45:
                    c0048a.f219U = typedArray.getFloat(index, c0048a.f219U);
                    break;
                case 46:
                    c0048a.f220V = typedArray.getFloat(index, c0048a.f220V);
                    break;
                case 47:
                    c0048a.f221W = typedArray.getFloat(index, c0048a.f221W);
                    break;
                case 48:
                    c0048a.f222X = typedArray.getFloat(index, c0048a.f222X);
                    break;
                case 49:
                    c0048a.f223Y = typedArray.getFloat(index, c0048a.f223Y);
                    break;
                case 50:
                    c0048a.f224Z = typedArray.getFloat(index, c0048a.f224Z);
                    break;
                case 51:
                    c0048a.aa = typedArray.getFloat(index, c0048a.aa);
                    break;
                case 52:
                    c0048a.ab = typedArray.getFloat(index, c0048a.ab);
                    break;
                case 53:
                    c0048a.ac = typedArray.getFloat(index, c0048a.ac);
                    break;
                case 60:
                    Log.w("ConstraintSet", "unused attribute 0x" + Integer.toHexString(index) + "   " + f402c.get(index));
                    break;
                default:
                    Log.w("ConstraintSet", "Unknown attribute 0x" + Integer.toHexString(index) + "   " + f402c.get(index));
                    break;
            }
        }
    }

    public void m343a(Context context, int i) {
        XmlPullParser xml = context.getResources().getXml(i);
        try {
            for (int eventType = xml.getEventType(); eventType != 1; eventType = xml.next()) {
                switch (eventType) {
                    case 0:
                        xml.getName();
                        break;
                    case 2:
                        String name = xml.getName();
                        C0048a a = m341a(context, Xml.asAttributeSet(xml));
                        if (name.equalsIgnoreCase("Guideline")) {
                            a.f225a = true;
                        }
                        this.f403b.put(Integer.valueOf(a.f228d), a);
                        break;
                    default:
                        break;
                }
            }
        } catch (XmlPullParserException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        }
    }

    void m344a(ConstraintLayout constraintLayout) {
        int childCount = constraintLayout.getChildCount();
        HashSet hashSet = new HashSet(this.f403b.keySet());
        for (int i = 0; i < childCount; i++) {
            View childAt = constraintLayout.getChildAt(i);
            int id = childAt.getId();
            if (this.f403b.containsKey(Integer.valueOf(id))) {
                hashSet.remove(Integer.valueOf(id));
                C0048a c0048a = (C0048a) this.f403b.get(Integer.valueOf(id));
                C0046a c0046a = (C0046a) childAt.getLayoutParams();
                c0048a.m131a(c0046a);
                childAt.setLayoutParams(c0046a);
                childAt.setVisibility(c0048a.f205G);
                if (VERSION.SDK_INT >= 17) {
                    childAt.setAlpha(c0048a.f216R);
                    childAt.setRotationX(c0048a.f219U);
                    childAt.setRotationY(c0048a.f220V);
                    childAt.setScaleX(c0048a.f221W);
                    childAt.setScaleY(c0048a.f222X);
                    childAt.setPivotX(c0048a.f223Y);
                    childAt.setPivotY(c0048a.f224Z);
                    childAt.setTranslationX(c0048a.aa);
                    childAt.setTranslationY(c0048a.ab);
                    if (VERSION.SDK_INT >= 21) {
                        childAt.setTranslationZ(c0048a.ac);
                        if (c0048a.f217S) {
                            childAt.setElevation(c0048a.f218T);
                        }
                    }
                }
            }
        }
        Iterator it = hashSet.iterator();
        while (it.hasNext()) {
            Integer num = (Integer) it.next();
            C0048a c0048a2 = (C0048a) this.f403b.get(num);
            if (c0048a2.f225a) {
                View c0076b = new C0076b(constraintLayout.getContext());
                c0076b.setId(num.intValue());
                LayoutParams b = constraintLayout.m129b();
                c0048a2.m131a(b);
                constraintLayout.addView(c0076b, b);
            }
        }
    }
}
