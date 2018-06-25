package com.google.ctf.shallweplayagame;

import android.animation.AnimatorSet;
import android.os.Bundle;
import android.support.v7.app.C0433c;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.google.ctf.shallweplayagame.C0649a.C0648a;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.Random;

public class GameActivity extends C0433c implements OnClickListener {
    C0649a[][] f2327l = ((C0649a[][]) Array.newInstance(C0649a.class, new int[]{3, 3}));
    Queue<AnimatorSet> f2328m = new LinkedList();
    Object f2329n = C0644N.m3217_(Integer.valueOf(3), C0644N.f2341h, Long.valueOf((((((((1416127776 + 1869507705) + 544696686) + 1852403303) + 544042870) + 1696622963) + 544108404) + 544501536) + 1886151033));
    int f2330o;
    boolean f2331p;
    byte[] f2332q = new byte[32];
    byte[] f2333r = new byte[]{(byte) -61, (byte) 15, (byte) 25, (byte) -115, (byte) -46, (byte) -11, (byte) 65, (byte) -3, (byte) 34, (byte) 93, (byte) -39, (byte) 98, (byte) 123, (byte) 17, (byte) 42, (byte) -121, (byte) 60, (byte) 40, (byte) -60, (byte) -112, (byte) 77, (byte) 111, (byte) 34, (byte) 14, (byte) -31, (byte) -4, (byte) -7, (byte) 66, (byte) 116, (byte) 108, (byte) 114, (byte) -122};

    public GameActivity() {
        C0644N.m3217_(Integer.valueOf(3), C0644N.f2342i, this.f2329n, this.f2332q);
        this.f2330o = 0;
        this.f2331p = false;
    }

    C0649a m3210a(List<C0649a> list) {
        return (C0649a) list.get(((Random) this.f2329n).nextInt(list.size()));
    }

    boolean m3211a(C0648a c0648a) {
        int[] iArr = new int[]{0, 0, 0};
        int[] iArr2 = new int[]{0, 0, 0};
        int[] iArr3 = new int[]{0, 0};
        for (int i = 0; i < 3; i++) {
            for (int i2 = 0; i2 < 3; i2++) {
                if (this.f2327l[i2][i].f2355d == c0648a) {
                    iArr[i] = iArr[i] + 1;
                    iArr2[i2] = iArr2[i2] + 1;
                    if (i == i2) {
                        iArr3[0] = iArr3[0] + 1;
                    }
                    if (i + i2 == 2) {
                        iArr3[1] = iArr3[1] + 1;
                    }
                }
            }
        }
        for (int i3 : iArr) {
            if (i3 >= 3) {
                return true;
            }
        }
        for (int i4 : iArr2) {
            if (i4 >= 3) {
                return true;
            }
        }
        for (int i42 : iArr3) {
            if (i42 >= 3) {
                return true;
            }
        }
        return false;
    }

    void m3212k() {
        AnimatorSet animatorSet = (AnimatorSet) this.f2328m.poll();
        if (animatorSet != null) {
            animatorSet.start();
        }
    }

    List<C0649a> m3213l() {
        List<C0649a> arrayList = new ArrayList();
        for (int i = 0; i < 3; i++) {
            for (int i2 = 0; i2 < 3; i2++) {
                if (this.f2327l[i2][i].m3223a()) {
                    arrayList.add(this.f2327l[i2][i]);
                }
            }
        }
        return arrayList;
    }

    void m3214m() {
        Object _ = C0644N.m3217_(Integer.valueOf(0), C0644N.f2334a, Integer.valueOf(0));
        Object _2 = C0644N.m3217_(Integer.valueOf(1), C0644N.f2335b, this.f2332q, Integer.valueOf(1));
        C0644N.m3217_(Integer.valueOf(0), C0644N.f2336c, _, Integer.valueOf(2), _2);
        ((TextView) findViewById(R.id.score)).setText(new String((byte[]) C0644N.m3217_(Integer.valueOf(0), C0644N.f2337d, _, this.f2333r)));
        m3216o();
    }

    void m3215n() {
        for (int i = 0; i < 3; i++) {
            for (int i2 = 0; i2 < 3; i2++) {
                this.f2327l[i2][i].m3222a(C0648a.EMPTY, 25);
            }
        }
        m3212k();
        this.f2330o++;
        Object _ = C0644N.m3217_(Integer.valueOf(2), C0644N.f2338e, Integer.valueOf(2));
        C0644N.m3217_(Integer.valueOf(2), C0644N.f2339f, _, this.f2332q);
        this.f2332q = (byte[]) C0644N.m3217_(Integer.valueOf(2), C0644N.f2340g, _);
        if (this.f2330o == 1000000) {
            m3214m();
            return;
        }
        ((TextView) findViewById(R.id.score)).setText(String.format("%d / %d", new Object[]{Integer.valueOf(this.f2330o), Integer.valueOf(1000000)}));
    }

    void m3216o() {
        for (int i = 0; i < 3; i++) {
            for (int i2 = 0; i2 < 3; i2++) {
                this.f2327l[i2][i].setValue(C0648a.DEATH);
            }
        }
        this.f2330o = 0;
        this.f2331p = true;
        m3212k();
    }

    public void onClick(View view) {
        if (!this.f2331p && this.f2328m.isEmpty()) {
            C0649a c0649a = (C0649a) view;
            if (c0649a.m3223a()) {
                C0652b.m3224a();
                c0649a.setValue(C0648a.X);
                if (m3211a(C0648a.X)) {
                    m3215n();
                    return;
                }
                List l = m3213l();
                if (l.isEmpty()) {
                    m3215n();
                    return;
                }
                m3210a(l).setValue(C0648a.O);
                if (m3211a(C0648a.O)) {
                    m3216o();
                    return;
                } else {
                    m3212k();
                    return;
                }
            }
            C0652b.m3225b();
        }
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView((int) R.layout.activity_game);
        LinearLayout linearLayout = (LinearLayout) findViewById(R.id.rows);
        for (int i = 0; i < 3; i++) {
            View linearLayout2 = new LinearLayout(getApplicationContext());
            for (int i2 = 0; i2 < 3; i2++) {
                View c0649a = new C0649a(getApplicationContext(), this.f2328m);
                linearLayout2.addView(c0649a);
                this.f2327l[i2][i] = c0649a;
                c0649a.setOnClickListener(this);
            }
            linearLayout.addView(linearLayout2);
        }
    }
}
