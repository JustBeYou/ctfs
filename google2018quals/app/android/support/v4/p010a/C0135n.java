package android.support.v4.p010a;

import android.animation.Animator;
import android.animation.AnimatorInflater;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.PropertyValuesHolder;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources.NotFoundException;
import android.content.res.TypedArray;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Looper;
import android.os.Parcelable;
import android.support.v4.p010a.C0114h.C0113c;
import android.support.v4.p010a.C0123m.C0121a;
import android.support.v4.p010a.C0123m.C0122b;
import android.support.v4.p016g.C0231b;
import android.support.v4.p016g.C0233d;
import android.support.v4.p016g.C0234e;
import android.support.v4.p016g.C0242i;
import android.support.v4.p017h.C0315p;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.LayoutInflater.Factory2;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationSet;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.ScaleAnimation;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

final class C0135n extends C0123m implements Factory2 {
    static final Interpolator f587E = new DecelerateInterpolator(2.5f);
    static final Interpolator f588F = new DecelerateInterpolator(1.5f);
    static final Interpolator f589G = new AccelerateInterpolator(2.5f);
    static final Interpolator f590H = new AccelerateInterpolator(1.5f);
    static boolean f591a = false;
    static Field f592q = null;
    SparseArray<Parcelable> f593A = null;
    ArrayList<C0134g> f594B;
    C0136o f595C;
    Runnable f596D = new C01241(this);
    private final CopyOnWriteArrayList<C0242i<C0121a, Boolean>> f597I = new CopyOnWriteArrayList();
    ArrayList<C0100f> f598b;
    boolean f599c;
    int f600d = 0;
    final ArrayList<C0114h> f601e = new ArrayList();
    SparseArray<C0114h> f602f;
    ArrayList<C0101c> f603g;
    ArrayList<C0114h> f604h;
    ArrayList<C0101c> f605i;
    ArrayList<Integer> f606j;
    ArrayList<C0122b> f607k;
    int f608l = 0;
    C0116l f609m;
    C0109j f610n;
    C0114h f611o;
    C0114h f612p;
    boolean f613r;
    boolean f614s;
    boolean f615t;
    String f616u;
    boolean f617v;
    ArrayList<C0101c> f618w;
    ArrayList<Boolean> f619x;
    ArrayList<C0114h> f620y;
    Bundle f621z = null;

    interface C0100f {
        boolean mo40a(ArrayList<C0101c> arrayList, ArrayList<Boolean> arrayList2);
    }

    class C01241 implements Runnable {
        final /* synthetic */ C0135n f566a;

        C01241(C0135n c0135n) {
            this.f566a = c0135n;
        }

        public void run() {
            this.f566a.m721e();
        }
    }

    private static class C0125b implements AnimationListener {
        private final AnimationListener f567a;

        private C0125b(AnimationListener animationListener) {
            this.f567a = animationListener;
        }

        public void onAnimationEnd(Animation animation) {
            if (this.f567a != null) {
                this.f567a.onAnimationEnd(animation);
            }
        }

        public void onAnimationRepeat(Animation animation) {
            if (this.f567a != null) {
                this.f567a.onAnimationRepeat(animation);
            }
        }

        public void onAnimationStart(Animation animation) {
            if (this.f567a != null) {
                this.f567a.onAnimationStart(animation);
            }
        }
    }

    private static class C0130a extends C0125b {
        View f579a;

        class C01291 implements Runnable {
            final /* synthetic */ C0130a f578a;

            C01291(C0130a c0130a) {
                this.f578a = c0130a;
            }

            public void run() {
                this.f578a.f579a.setLayerType(0, null);
            }
        }

        C0130a(View view, AnimationListener animationListener) {
            super(animationListener);
            this.f579a = view;
        }

        public void onAnimationEnd(Animation animation) {
            if (C0315p.m1398m(this.f579a) || VERSION.SDK_INT >= 24) {
                this.f579a.post(new C01291(this));
            } else {
                this.f579a.setLayerType(0, null);
            }
            super.onAnimationEnd(animation);
        }
    }

    private static class C0131c {
        public final Animation f580a;
        public final Animator f581b;

        private C0131c(Animator animator) {
            this.f580a = null;
            this.f581b = animator;
            if (animator == null) {
                throw new IllegalStateException("Animator cannot be null");
            }
        }

        private C0131c(Animation animation) {
            this.f580a = animation;
            this.f581b = null;
            if (animation == null) {
                throw new IllegalStateException("Animation cannot be null");
            }
        }
    }

    private static class C0132d extends AnimatorListenerAdapter {
        View f582a;

        C0132d(View view) {
            this.f582a = view;
        }

        public void onAnimationEnd(Animator animator) {
            this.f582a.setLayerType(0, null);
            animator.removeListener(this);
        }

        public void onAnimationStart(Animator animator) {
            this.f582a.setLayerType(2, null);
        }
    }

    static class C0133e {
        public static final int[] f583a = new int[]{16842755, 16842960, 16842961};
    }

    static class C0134g implements C0113c {
        private final boolean f584a;
        private final C0101c f585b;
        private int f586c;

        C0134g(C0101c c0101c, boolean z) {
            this.f584a = z;
            this.f585b = c0101c;
        }

        public void mo60a() {
            this.f586c--;
            if (this.f586c == 0) {
                this.f585b.f435b.m674y();
            }
        }

        public void mo61b() {
            this.f586c++;
        }

        public boolean m640c() {
            return this.f586c == 0;
        }

        public void m641d() {
            boolean z = false;
            boolean z2 = this.f586c > 0;
            C0135n c0135n = this.f585b.f435b;
            int size = c0135n.f601e.size();
            for (int i = 0; i < size; i++) {
                C0114h c0114h = (C0114h) c0135n.f601e.get(i);
                c0114h.m479a(null);
                if (z2 && c0114h.m461U()) {
                    c0114h.m441A();
                }
            }
            C0135n c0135n2 = this.f585b.f435b;
            C0101c c0101c = this.f585b;
            boolean z3 = this.f584a;
            if (!z2) {
                z = true;
            }
            c0135n2.m650a(c0101c, z3, z, true);
        }

        public void m642e() {
            this.f585b.f435b.m650a(this.f585b, this.f584a, false, false);
        }
    }

    C0135n() {
    }

    private void m643A() {
        if (this.f594B != null) {
            while (!this.f594B.isEmpty()) {
                ((C0134g) this.f594B.remove(0)).m641d();
            }
        }
    }

    private void m644B() {
        int size = this.f602f == null ? 0 : this.f602f.size();
        for (int i = 0; i < size; i++) {
            C0114h c0114h = (C0114h) this.f602f.valueAt(i);
            if (c0114h != null) {
                if (c0114h.m458R() != null) {
                    int T = c0114h.m460T();
                    View R = c0114h.m458R();
                    c0114h.m483a(null);
                    Animation animation = R.getAnimation();
                    if (animation != null) {
                        animation.cancel();
                        R.clearAnimation();
                    }
                    m686a(c0114h, T, 0, 0, false);
                } else if (c0114h.m459S() != null) {
                    c0114h.m459S().end();
                }
            }
        }
    }

    private void m645C() {
        if (this.f602f != null) {
            for (int size = this.f602f.size() - 1; size >= 0; size--) {
                if (this.f602f.valueAt(size) == null) {
                    this.f602f.delete(this.f602f.keyAt(size));
                }
            }
        }
    }

    private int m646a(ArrayList<C0101c> arrayList, ArrayList<Boolean> arrayList2, int i, int i2, C0231b<C0114h> c0231b) {
        int i3 = i2 - 1;
        int i4 = i2;
        while (i3 >= i) {
            int i5;
            C0101c c0101c = (C0101c) arrayList.get(i3);
            boolean booleanValue = ((Boolean) arrayList2.get(i3)).booleanValue();
            boolean z = c0101c.m411c() && !c0101c.m406a((ArrayList) arrayList, i3 + 1, i2);
            if (z) {
                if (this.f594B == null) {
                    this.f594B = new ArrayList();
                }
                C0113c c0134g = new C0134g(c0101c, booleanValue);
                this.f594B.add(c0134g);
                c0101c.m402a(c0134g);
                if (booleanValue) {
                    c0101c.m409b();
                } else {
                    c0101c.m405a(false);
                }
                int i6 = i4 - 1;
                if (i3 != i6) {
                    arrayList.remove(i3);
                    arrayList.add(i6, c0101c);
                }
                m664b((C0231b) c0231b);
                i5 = i6;
            } else {
                i5 = i4;
            }
            i3--;
            i4 = i5;
        }
        return i4;
    }

    static C0131c m647a(Context context, float f, float f2) {
        Animation alphaAnimation = new AlphaAnimation(f, f2);
        alphaAnimation.setInterpolator(f588F);
        alphaAnimation.setDuration(220);
        return new C0131c(alphaAnimation);
    }

    static C0131c m648a(Context context, float f, float f2, float f3, float f4) {
        Animation animationSet = new AnimationSet(false);
        Animation scaleAnimation = new ScaleAnimation(f, f2, f, f2, 1, 0.5f, 1, 0.5f);
        scaleAnimation.setInterpolator(f587E);
        scaleAnimation.setDuration(220);
        animationSet.addAnimation(scaleAnimation);
        scaleAnimation = new AlphaAnimation(f3, f4);
        scaleAnimation.setInterpolator(f588F);
        scaleAnimation.setDuration(220);
        animationSet.addAnimation(scaleAnimation);
        return new C0131c(animationSet);
    }

    private static AnimationListener m649a(Animation animation) {
        try {
            if (f592q == null) {
                f592q = Animation.class.getDeclaredField("mListener");
                f592q.setAccessible(true);
            }
            return (AnimationListener) f592q.get(animation);
        } catch (Throwable e) {
            Log.e("FragmentManager", "No field with the name mListener is found in Animation class", e);
            return null;
        } catch (Throwable e2) {
            Log.e("FragmentManager", "Cannot access Animation's mListener field", e2);
            return null;
        }
    }

    private void m650a(C0101c c0101c, boolean z, boolean z2, boolean z3) {
        if (z) {
            c0101c.m405a(z3);
        } else {
            c0101c.m409b();
        }
        ArrayList arrayList = new ArrayList(1);
        ArrayList arrayList2 = new ArrayList(1);
        arrayList.add(c0101c);
        arrayList2.add(Boolean.valueOf(z));
        if (z2) {
            C0146s.m774a(this, arrayList, arrayList2, 0, 1, true);
        }
        if (z3) {
            m680a(this.f608l, true);
        }
        if (this.f602f != null) {
            int size = this.f602f.size();
            for (int i = 0; i < size; i++) {
                C0114h c0114h = (C0114h) this.f602f.valueAt(i);
                if (c0114h != null && c0114h.f502H != null && c0114h.f510P && c0101c.m410b(c0114h.f538x)) {
                    if (c0114h.f512R > 0.0f) {
                        c0114h.f502H.setAlpha(c0114h.f512R);
                    }
                    if (z3) {
                        c0114h.f512R = 0.0f;
                    } else {
                        c0114h.f512R = -1.0f;
                        c0114h.f510P = false;
                    }
                }
            }
        }
    }

    private void m651a(final C0114h c0114h, C0131c c0131c, int i) {
        final View view = c0114h.f502H;
        c0114h.m490b(i);
        if (c0131c.f580a != null) {
            Animation animation = c0131c.f580a;
            c0114h.m483a(c0114h.f502H);
            animation.setAnimationListener(new C0125b(this, C0135n.m649a(animation)) {
                final /* synthetic */ C0135n f569b;

                public void onAnimationEnd(Animation animation) {
                    super.onAnimationEnd(animation);
                    if (c0114h.m458R() != null) {
                        c0114h.m483a(null);
                        this.f569b.m686a(c0114h, c0114h.m460T(), 0, 0, false);
                    }
                }
            });
            C0135n.m665b(view, c0131c);
            c0114h.f502H.startAnimation(animation);
            return;
        }
        Animator animator = c0131c.f581b;
        c0114h.m472a(c0131c.f581b);
        final ViewGroup viewGroup = c0114h.f501G;
        if (viewGroup != null) {
            viewGroup.startViewTransition(view);
        }
        animator.addListener(new AnimatorListenerAdapter(this) {
            final /* synthetic */ C0135n f573d;

            public void onAnimationEnd(Animator animator) {
                if (viewGroup != null) {
                    viewGroup.endViewTransition(view);
                }
                if (c0114h.m459S() != null) {
                    c0114h.m472a(null);
                    this.f573d.m686a(c0114h, c0114h.m460T(), 0, 0, false);
                }
            }
        });
        animator.setTarget(c0114h.f502H);
        C0135n.m665b(c0114h.f502H, c0131c);
        animator.start();
    }

    private static void m654a(C0136o c0136o) {
        if (c0136o != null) {
            List<C0114h> a = c0136o.m753a();
            if (a != null) {
                for (C0114h c0114h : a) {
                    c0114h.f497C = true;
                }
            }
            List<C0136o> b = c0136o.m754b();
            if (b != null) {
                for (C0136o a2 : b) {
                    C0135n.m654a(a2);
                }
            }
        }
    }

    private void m655a(C0231b<C0114h> c0231b) {
        int size = c0231b.size();
        for (int i = 0; i < size; i++) {
            C0114h c0114h = (C0114h) c0231b.m1136b(i);
            if (!c0114h.f525k) {
                View i2 = c0114h.m517i();
                c0114h.f512R = i2.getAlpha();
                i2.setAlpha(0.0f);
            }
        }
    }

    private void m656a(RuntimeException runtimeException) {
        Log.e("FragmentManager", runtimeException.getMessage());
        Log.e("FragmentManager", "Activity state:");
        PrintWriter printWriter = new PrintWriter(new C0234e("FragmentManager"));
        if (this.f609m != null) {
            try {
                this.f609m.mo44a("  ", null, printWriter, new String[0]);
            } catch (Throwable e) {
                Log.e("FragmentManager", "Failed dumping state", e);
            }
        } else {
            try {
                mo62a("  ", null, printWriter, new String[0]);
            } catch (Throwable e2) {
                Log.e("FragmentManager", "Failed dumping state", e2);
            }
        }
        throw runtimeException;
    }

    private void m657a(ArrayList<C0101c> arrayList, ArrayList<Boolean> arrayList2) {
        int i = 0;
        int size = this.f594B == null ? 0 : this.f594B.size();
        while (i < size) {
            int indexOf;
            int i2;
            C0134g c0134g = (C0134g) this.f594B.get(i);
            if (!(arrayList == null || c0134g.f584a)) {
                indexOf = arrayList.indexOf(c0134g.f585b);
                if (indexOf != -1 && ((Boolean) arrayList2.get(indexOf)).booleanValue()) {
                    c0134g.m642e();
                    i2 = i;
                    indexOf = size;
                    i = i2 + 1;
                    size = indexOf;
                }
            }
            if (c0134g.m640c() || (arrayList != null && c0134g.f585b.m406a((ArrayList) arrayList, 0, arrayList.size()))) {
                this.f594B.remove(i);
                i--;
                size--;
                if (!(arrayList == null || c0134g.f584a)) {
                    indexOf = arrayList.indexOf(c0134g.f585b);
                    if (indexOf != -1 && ((Boolean) arrayList2.get(indexOf)).booleanValue()) {
                        c0134g.m642e();
                        i2 = i;
                        indexOf = size;
                        i = i2 + 1;
                        size = indexOf;
                    }
                }
                c0134g.m641d();
            }
            i2 = i;
            indexOf = size;
            i = i2 + 1;
            size = indexOf;
        }
    }

    private void m658a(ArrayList<C0101c> arrayList, ArrayList<Boolean> arrayList2, int i, int i2) {
        int a;
        boolean z = ((C0101c) arrayList.get(i)).f454u;
        if (this.f620y == null) {
            this.f620y = new ArrayList();
        } else {
            this.f620y.clear();
        }
        this.f620y.addAll(this.f601e);
        int i3 = i;
        C0114h v = m751v();
        boolean z2 = false;
        while (i3 < i2) {
            C0101c c0101c = (C0101c) arrayList.get(i3);
            C0114h a2 = !((Boolean) arrayList2.get(i3)).booleanValue() ? c0101c.m398a(this.f620y, v) : c0101c.m408b(this.f620y, v);
            boolean z3 = z2 || c0101c.f443j;
            i3++;
            v = a2;
            z2 = z3;
        }
        this.f620y.clear();
        if (!z) {
            C0146s.m774a(this, arrayList, arrayList2, i, i2, false);
        }
        C0135n.m667b(arrayList, arrayList2, i, i2);
        if (z) {
            C0231b c0231b = new C0231b();
            m664b(c0231b);
            a = m646a((ArrayList) arrayList, (ArrayList) arrayList2, i, i2, c0231b);
            m655a(c0231b);
        } else {
            a = i2;
        }
        if (a != i && z) {
            C0146s.m774a(this, arrayList, arrayList2, i, a, true);
            m680a(this.f608l, true);
        }
        while (i < i2) {
            c0101c = (C0101c) arrayList.get(i);
            if (((Boolean) arrayList2.get(i)).booleanValue() && c0101c.f447n >= 0) {
                m710c(c0101c.f447n);
                c0101c.f447n = -1;
            }
            c0101c.m399a();
            i++;
        }
        if (z2) {
            m725g();
        }
    }

    static boolean m659a(Animator animator) {
        if (animator == null) {
            return false;
        }
        if (animator instanceof ValueAnimator) {
            PropertyValuesHolder[] values = ((ValueAnimator) animator).getValues();
            for (PropertyValuesHolder propertyName : values) {
                if ("alpha".equals(propertyName.getPropertyName())) {
                    return true;
                }
            }
            return false;
        } else if (!(animator instanceof AnimatorSet)) {
            return false;
        } else {
            List childAnimations = ((AnimatorSet) animator).getChildAnimations();
            for (int i = 0; i < childAnimations.size(); i++) {
                if (C0135n.m659a((Animator) childAnimations.get(i))) {
                    return true;
                }
            }
            return false;
        }
    }

    static boolean m660a(C0131c c0131c) {
        if (c0131c.f580a instanceof AlphaAnimation) {
            return true;
        }
        if (!(c0131c.f580a instanceof AnimationSet)) {
            return C0135n.m659a(c0131c.f581b);
        }
        List animations = ((AnimationSet) c0131c.f580a).getAnimations();
        for (int i = 0; i < animations.size(); i++) {
            if (animations.get(i) instanceof AlphaAnimation) {
                return true;
            }
        }
        return false;
    }

    static boolean m661a(View view, C0131c c0131c) {
        return view != null && c0131c != null && VERSION.SDK_INT >= 19 && view.getLayerType() == 0 && C0315p.m1393h(view) && C0135n.m660a(c0131c);
    }

    private boolean m662a(String str, int i, int i2) {
        m721e();
        m668c(true);
        if (this.f612p != null && i < 0 && str == null) {
            C0123m h = this.f612p.m515h();
            if (h != null && h.mo63a()) {
                return true;
            }
        }
        boolean a = m699a(this.f618w, this.f619x, str, i, i2);
        if (a) {
            this.f599c = true;
            try {
                m666b(this.f618w, this.f619x);
            } finally {
                m675z();
            }
        }
        m722f();
        m645C();
        return a;
    }

    public static int m663b(int i, boolean z) {
        switch (i) {
            case 4097:
                return z ? 1 : 2;
            case 4099:
                return z ? 5 : 6;
            case 8194:
                return z ? 3 : 4;
            default:
                return -1;
        }
    }

    private void m664b(C0231b<C0114h> c0231b) {
        if (this.f608l >= 1) {
            int min = Math.min(this.f608l, 4);
            int size = this.f601e.size();
            for (int i = 0; i < size; i++) {
                C0114h c0114h = (C0114h) this.f601e.get(i);
                if (c0114h.f516b < min) {
                    m686a(c0114h, min, c0114h.m453M(), c0114h.m454N(), false);
                    if (!(c0114h.f502H == null || c0114h.f540z || !c0114h.f510P)) {
                        c0231b.add(c0114h);
                    }
                }
            }
        }
    }

    private static void m665b(View view, C0131c c0131c) {
        if (view != null && c0131c != null && C0135n.m661a(view, c0131c)) {
            if (c0131c.f581b != null) {
                c0131c.f581b.addListener(new C0132d(view));
                return;
            }
            AnimationListener a = C0135n.m649a(c0131c.f580a);
            view.setLayerType(2, null);
            c0131c.f580a.setAnimationListener(new C0130a(view, a));
        }
    }

    private void m666b(ArrayList<C0101c> arrayList, ArrayList<Boolean> arrayList2) {
        int i = 0;
        if (arrayList != null && !arrayList.isEmpty()) {
            if (arrayList2 == null || arrayList.size() != arrayList2.size()) {
                throw new IllegalStateException("Internal error with the back stack records");
            }
            m657a((ArrayList) arrayList, (ArrayList) arrayList2);
            int size = arrayList.size();
            int i2 = 0;
            while (i < size) {
                int i3;
                if (((C0101c) arrayList.get(i)).f454u) {
                    i3 = i;
                } else {
                    if (i2 != i) {
                        m658a((ArrayList) arrayList, (ArrayList) arrayList2, i2, i);
                    }
                    i2 = i + 1;
                    if (((Boolean) arrayList2.get(i)).booleanValue()) {
                        while (i2 < size && ((Boolean) arrayList2.get(i2)).booleanValue() && !((C0101c) arrayList.get(i2)).f454u) {
                            i2++;
                        }
                    }
                    i3 = i2;
                    m658a((ArrayList) arrayList, (ArrayList) arrayList2, i, i3);
                    i2 = i3;
                    i3--;
                }
                i = i3 + 1;
            }
            if (i2 != size) {
                m658a((ArrayList) arrayList, (ArrayList) arrayList2, i2, size);
            }
        }
    }

    private static void m667b(ArrayList<C0101c> arrayList, ArrayList<Boolean> arrayList2, int i, int i2) {
        while (i < i2) {
            C0101c c0101c = (C0101c) arrayList.get(i);
            if (((Boolean) arrayList2.get(i)).booleanValue()) {
                c0101c.m400a(-1);
                c0101c.m405a(i == i2 + -1);
            } else {
                c0101c.m400a(1);
                c0101c.m409b();
            }
            i++;
        }
    }

    private void m668c(boolean z) {
        if (this.f599c) {
            throw new IllegalStateException("FragmentManager is already executing transactions");
        } else if (Looper.myLooper() != this.f609m.m556h().getLooper()) {
            throw new IllegalStateException("Must be called from main thread of fragment host");
        } else {
            if (!z) {
                m673x();
            }
            if (this.f618w == null) {
                this.f618w = new ArrayList();
                this.f619x = new ArrayList();
            }
            this.f599c = true;
            try {
                m657a(null, null);
            } finally {
                this.f599c = false;
            }
        }
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private boolean m669c(java.util.ArrayList<android.support.v4.p010a.C0101c> r5, java.util.ArrayList<java.lang.Boolean> r6) {
        /*
        r4 = this;
        r0 = 0;
        monitor-enter(r4);
        r1 = r4.f598b;	 Catch:{ all -> 0x003e }
        if (r1 == 0) goto L_0x000e;
    L_0x0006:
        r1 = r4.f598b;	 Catch:{ all -> 0x003e }
        r1 = r1.size();	 Catch:{ all -> 0x003e }
        if (r1 != 0) goto L_0x0010;
    L_0x000e:
        monitor-exit(r4);	 Catch:{ all -> 0x003e }
    L_0x000f:
        return r0;
    L_0x0010:
        r1 = r4.f598b;	 Catch:{ all -> 0x003e }
        r3 = r1.size();	 Catch:{ all -> 0x003e }
        r2 = r0;
        r1 = r0;
    L_0x0018:
        if (r2 >= r3) goto L_0x002b;
    L_0x001a:
        r0 = r4.f598b;	 Catch:{ all -> 0x003e }
        r0 = r0.get(r2);	 Catch:{ all -> 0x003e }
        r0 = (android.support.v4.p010a.C0135n.C0100f) r0;	 Catch:{ all -> 0x003e }
        r0 = r0.mo40a(r5, r6);	 Catch:{ all -> 0x003e }
        r1 = r1 | r0;
        r0 = r2 + 1;
        r2 = r0;
        goto L_0x0018;
    L_0x002b:
        r0 = r4.f598b;	 Catch:{ all -> 0x003e }
        r0.clear();	 Catch:{ all -> 0x003e }
        r0 = r4.f609m;	 Catch:{ all -> 0x003e }
        r0 = r0.m556h();	 Catch:{ all -> 0x003e }
        r2 = r4.f596D;	 Catch:{ all -> 0x003e }
        r0.removeCallbacks(r2);	 Catch:{ all -> 0x003e }
        monitor-exit(r4);	 Catch:{ all -> 0x003e }
        r0 = r1;
        goto L_0x000f;
    L_0x003e:
        r0 = move-exception;
        monitor-exit(r4);	 Catch:{ all -> 0x003e }
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.a.n.c(java.util.ArrayList, java.util.ArrayList):boolean");
    }

    public static int m670d(int i) {
        switch (i) {
            case 4097:
                return 8194;
            case 4099:
                return 4099;
            case 8194:
                return 4097;
            default:
                return 0;
        }
    }

    private void m671e(int i) {
        try {
            this.f599c = true;
            m680a(i, false);
            m721e();
        } finally {
            this.f599c = false;
        }
    }

    private C0114h m672p(C0114h c0114h) {
        ViewGroup viewGroup = c0114h.f501G;
        View view = c0114h.f502H;
        if (viewGroup == null || view == null) {
            return null;
        }
        for (int indexOf = this.f601e.indexOf(c0114h) - 1; indexOf >= 0; indexOf--) {
            C0114h c0114h2 = (C0114h) this.f601e.get(indexOf);
            if (c0114h2.f501G == viewGroup && c0114h2.f502H != null) {
                return c0114h2;
            }
        }
        return null;
    }

    private void m673x() {
        if (this.f614s) {
            throw new IllegalStateException("Can not perform this action after onSaveInstanceState");
        } else if (this.f616u != null) {
            throw new IllegalStateException("Can not perform this action inside of " + this.f616u);
        }
    }

    private void m674y() {
        Object obj = 1;
        synchronized (this) {
            Object obj2 = (this.f594B == null || this.f594B.isEmpty()) ? null : 1;
            if (this.f598b == null || this.f598b.size() != 1) {
                obj = null;
            }
            if (!(obj2 == null && r0 == null)) {
                this.f609m.m556h().removeCallbacks(this.f596D);
                this.f609m.m556h().post(this.f596D);
            }
        }
    }

    private void m675z() {
        this.f599c = false;
        this.f619x.clear();
        this.f618w.clear();
    }

    public C0114h m676a(Bundle bundle, String str) {
        int i = bundle.getInt(str, -1);
        if (i == -1) {
            return null;
        }
        C0114h c0114h = (C0114h) this.f602f.get(i);
        if (c0114h != null) {
            return c0114h;
        }
        m656a(new IllegalStateException("Fragment no longer exists for key " + str + ": index " + i));
        return c0114h;
    }

    public C0114h m677a(String str) {
        int size;
        C0114h c0114h;
        if (str != null) {
            for (size = this.f601e.size() - 1; size >= 0; size--) {
                c0114h = (C0114h) this.f601e.get(size);
                if (c0114h != null && str.equals(c0114h.f539y)) {
                    return c0114h;
                }
            }
        }
        if (!(this.f602f == null || str == null)) {
            for (size = this.f602f.size() - 1; size >= 0; size--) {
                c0114h = (C0114h) this.f602f.valueAt(size);
                if (c0114h != null && str.equals(c0114h.f539y)) {
                    return c0114h;
                }
            }
        }
        return null;
    }

    C0131c m678a(C0114h c0114h, int i, boolean z, int i2) {
        int M = c0114h.m453M();
        Animation a = c0114h.m466a(i, z, M);
        if (a != null) {
            return new C0131c(a);
        }
        Animator b = c0114h.m488b(i, z, M);
        if (b != null) {
            return new C0131c(b);
        }
        if (M != 0) {
            Object obj;
            boolean equals = "anim".equals(this.f609m.m555g().getResources().getResourceTypeName(M));
            if (equals) {
                try {
                    Animation loadAnimation = AnimationUtils.loadAnimation(this.f609m.m555g(), M);
                    if (loadAnimation != null) {
                        return new C0131c(loadAnimation);
                    }
                    obj = 1;
                } catch (NotFoundException e) {
                    throw e;
                } catch (RuntimeException e2) {
                    obj = null;
                }
            } else {
                obj = null;
            }
            if (obj == null) {
                try {
                    b = AnimatorInflater.loadAnimator(this.f609m.m555g(), M);
                    if (b != null) {
                        return new C0131c(b);
                    }
                } catch (RuntimeException e3) {
                    if (equals) {
                        throw e3;
                    }
                    a = AnimationUtils.loadAnimation(this.f609m.m555g(), M);
                    if (a != null) {
                        return new C0131c(a);
                    }
                }
            }
        }
        if (i == 0) {
            return null;
        }
        int b2 = C0135n.m663b(i, z);
        if (b2 < 0) {
            return null;
        }
        switch (b2) {
            case 1:
                return C0135n.m648a(this.f609m.m555g(), 1.125f, 1.0f, 0.0f, 1.0f);
            case 2:
                return C0135n.m648a(this.f609m.m555g(), 1.0f, 0.975f, 1.0f, 0.0f);
            case 3:
                return C0135n.m648a(this.f609m.m555g(), 0.975f, 1.0f, 0.0f, 1.0f);
            case 4:
                return C0135n.m648a(this.f609m.m555g(), 1.0f, 1.075f, 1.0f, 0.0f);
            case 5:
                return C0135n.m647a(this.f609m.m555g(), 0.0f, 1.0f);
            case 6:
                return C0135n.m647a(this.f609m.m555g(), 1.0f, 0.0f);
            default:
                if (i2 == 0 && this.f609m.mo49d()) {
                    i2 = this.f609m.mo50e();
                }
                return i2 == 0 ? null : null;
        }
    }

    public void m679a(int i, C0101c c0101c) {
        synchronized (this) {
            if (this.f605i == null) {
                this.f605i = new ArrayList();
            }
            int size = this.f605i.size();
            if (i < size) {
                if (f591a) {
                    Log.v("FragmentManager", "Setting back stack index " + i + " to " + c0101c);
                }
                this.f605i.set(i, c0101c);
            } else {
                while (size < i) {
                    this.f605i.add(null);
                    if (this.f606j == null) {
                        this.f606j = new ArrayList();
                    }
                    if (f591a) {
                        Log.v("FragmentManager", "Adding available back stack index " + size);
                    }
                    this.f606j.add(Integer.valueOf(size));
                    size++;
                }
                if (f591a) {
                    Log.v("FragmentManager", "Adding back stack index " + i + " with " + c0101c);
                }
                this.f605i.add(c0101c);
            }
        }
    }

    void m680a(int i, boolean z) {
        if (this.f609m == null && i != 0) {
            throw new IllegalStateException("No activity");
        } else if (z || i != this.f608l) {
            this.f608l = i;
            if (this.f602f != null) {
                C0114h c0114h;
                int size = this.f601e.size();
                int i2 = 0;
                int i3 = 0;
                while (i2 < size) {
                    c0114h = (C0114h) this.f601e.get(i2);
                    m719e(c0114h);
                    i2++;
                    i3 = c0114h.f506L != null ? c0114h.f506L.mo66a() | i3 : i3;
                }
                size = this.f602f.size();
                i2 = 0;
                while (i2 < size) {
                    int a;
                    c0114h = (C0114h) this.f602f.valueAt(i2);
                    if (c0114h != null && ((c0114h.f526l || c0114h.f495A) && !c0114h.f510P)) {
                        m719e(c0114h);
                        if (c0114h.f506L != null) {
                            a = c0114h.f506L.mo66a() | i3;
                            i2++;
                            i3 = a;
                        }
                    }
                    a = i3;
                    i2++;
                    i3 = a;
                }
                if (i3 == 0) {
                    m715d();
                }
                if (this.f613r && this.f609m != null && this.f608l == 5) {
                    this.f609m.mo48c();
                    this.f613r = false;
                }
            }
        }
    }

    public void m681a(Configuration configuration) {
        for (int i = 0; i < this.f601e.size(); i++) {
            C0114h c0114h = (C0114h) this.f601e.get(i);
            if (c0114h != null) {
                c0114h.m477a(configuration);
            }
        }
    }

    public void m682a(Bundle bundle, String str, C0114h c0114h) {
        if (c0114h.f519e < 0) {
            m656a(new IllegalStateException("Fragment " + c0114h + " is not currently in the FragmentManager"));
        }
        bundle.putInt(str, c0114h.f519e);
    }

    void m683a(Parcelable parcelable, C0136o c0136o) {
        if (parcelable != null) {
            C0138p c0138p = (C0138p) parcelable;
            if (c0138p.f624a != null) {
                int size;
                C0114h c0114h;
                int i;
                List list;
                if (c0136o != null) {
                    List a = c0136o.m753a();
                    List b = c0136o.m754b();
                    if (a != null) {
                        size = a.size();
                    } else {
                        boolean z = false;
                    }
                    for (int i2 = 0; i2 < size; i2++) {
                        c0114h = (C0114h) a.get(i2);
                        if (f591a) {
                            Log.v("FragmentManager", "restoreAllState: re-attaching retained " + c0114h);
                        }
                        i = 0;
                        while (i < c0138p.f624a.length && c0138p.f624a[i].f630b != c0114h.f519e) {
                            i++;
                        }
                        if (i == c0138p.f624a.length) {
                            m656a(new IllegalStateException("Could not find active fragment with index " + c0114h.f519e));
                        }
                        C0140q c0140q = c0138p.f624a[i];
                        c0140q.f640l = c0114h;
                        c0114h.f518d = null;
                        c0114h.f531q = 0;
                        c0114h.f528n = false;
                        c0114h.f525k = false;
                        c0114h.f522h = null;
                        if (c0140q.f639k != null) {
                            c0140q.f639k.setClassLoader(this.f609m.m555g().getClassLoader());
                            c0114h.f518d = c0140q.f639k.getSparseParcelableArray("android:view_state");
                            c0114h.f517c = c0140q.f639k;
                        }
                    }
                    list = b;
                } else {
                    list = null;
                }
                this.f602f = new SparseArray(c0138p.f624a.length);
                i = 0;
                while (i < c0138p.f624a.length) {
                    C0140q c0140q2 = c0138p.f624a[i];
                    if (c0140q2 != null) {
                        C0136o c0136o2 = (list == null || i >= list.size()) ? null : (C0136o) list.get(i);
                        c0114h = c0140q2.m759a(this.f609m, this.f610n, this.f611o, c0136o2);
                        if (f591a) {
                            Log.v("FragmentManager", "restoreAllState: active #" + i + ": " + c0114h);
                        }
                        this.f602f.put(c0114h.f519e, c0114h);
                        c0140q2.f640l = null;
                    }
                    i++;
                }
                if (c0136o != null) {
                    List a2 = c0136o.m753a();
                    if (a2 != null) {
                        i = a2.size();
                    } else {
                        boolean z2 = false;
                    }
                    for (int i3 = 0; i3 < i; i3++) {
                        c0114h = (C0114h) a2.get(i3);
                        if (c0114h.f523i >= 0) {
                            c0114h.f522h = (C0114h) this.f602f.get(c0114h.f523i);
                            if (c0114h.f522h == null) {
                                Log.w("FragmentManager", "Re-attaching retained fragment " + c0114h + " target no longer exists: " + c0114h.f523i);
                            }
                        }
                    }
                }
                this.f601e.clear();
                if (c0138p.f625b != null) {
                    for (size = 0; size < c0138p.f625b.length; size++) {
                        c0114h = (C0114h) this.f602f.get(c0138p.f625b[size]);
                        if (c0114h == null) {
                            m656a(new IllegalStateException("No instantiated fragment for index #" + c0138p.f625b[size]));
                        }
                        c0114h.f525k = true;
                        if (f591a) {
                            Log.v("FragmentManager", "restoreAllState: added #" + size + ": " + c0114h);
                        }
                        if (this.f601e.contains(c0114h)) {
                            throw new IllegalStateException("Already added!");
                        }
                        synchronized (this.f601e) {
                            this.f601e.add(c0114h);
                        }
                    }
                }
                if (c0138p.f626c != null) {
                    this.f603g = new ArrayList(c0138p.f626c.length);
                    for (int i4 = 0; i4 < c0138p.f626c.length; i4++) {
                        C0101c a3 = c0138p.f626c[i4].m415a(this);
                        if (f591a) {
                            Log.v("FragmentManager", "restoreAllState: back stack #" + i4 + " (index " + a3.f447n + "): " + a3);
                            PrintWriter printWriter = new PrintWriter(new C0234e("FragmentManager"));
                            a3.m404a("  ", printWriter, false);
                            printWriter.close();
                        }
                        this.f603g.add(a3);
                        if (a3.f447n >= 0) {
                            m679a(a3.f447n, a3);
                        }
                    }
                } else {
                    this.f603g = null;
                }
                if (c0138p.f627d >= 0) {
                    this.f612p = (C0114h) this.f602f.get(c0138p.f627d);
                }
                this.f600d = c0138p.f628e;
            }
        }
    }

    void m684a(C0101c c0101c) {
        if (this.f603g == null) {
            this.f603g = new ArrayList();
        }
        this.f603g.add(c0101c);
    }

    public void m685a(C0114h c0114h) {
        if (!c0114h.f504J) {
            return;
        }
        if (this.f599c) {
            this.f617v = true;
            return;
        }
        c0114h.f504J = false;
        m686a(c0114h, this.f608l, 0, 0, false);
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    void m686a(android.support.v4.p010a.C0114h r11, int r12, int r13, int r14, boolean r15) {
        /*
        r10 = this;
        r9 = 4;
        r6 = 3;
        r5 = 1;
        r7 = 0;
        r3 = 0;
        r0 = r11.f525k;
        if (r0 == 0) goto L_0x000d;
    L_0x0009:
        r0 = r11.f495A;
        if (r0 == 0) goto L_0x0010;
    L_0x000d:
        if (r12 <= r5) goto L_0x0010;
    L_0x000f:
        r12 = r5;
    L_0x0010:
        r0 = r11.f526l;
        if (r0 == 0) goto L_0x0023;
    L_0x0014:
        r0 = r11.f516b;
        if (r12 <= r0) goto L_0x0023;
    L_0x0018:
        r0 = r11.f516b;
        if (r0 != 0) goto L_0x003b;
    L_0x001c:
        r0 = r11.m494b();
        if (r0 == 0) goto L_0x003b;
    L_0x0022:
        r12 = r5;
    L_0x0023:
        r0 = r11.f504J;
        if (r0 == 0) goto L_0x002e;
    L_0x0027:
        r0 = r11.f516b;
        if (r0 >= r9) goto L_0x002e;
    L_0x002b:
        if (r12 <= r6) goto L_0x002e;
    L_0x002d:
        r12 = r6;
    L_0x002e:
        r0 = r11.f516b;
        if (r0 > r12) goto L_0x032e;
    L_0x0032:
        r0 = r11.f527m;
        if (r0 == 0) goto L_0x003e;
    L_0x0036:
        r0 = r11.f528n;
        if (r0 != 0) goto L_0x003e;
    L_0x003a:
        return;
    L_0x003b:
        r12 = r11.f516b;
        goto L_0x0023;
    L_0x003e:
        r0 = r11.m458R();
        if (r0 != 0) goto L_0x004a;
    L_0x0044:
        r0 = r11.m459S();
        if (r0 == 0) goto L_0x005a;
    L_0x004a:
        r11.m483a(r7);
        r11.m472a(r7);
        r2 = r11.m460T();
        r0 = r10;
        r1 = r11;
        r4 = r3;
        r0.m686a(r1, r2, r3, r4, r5);
    L_0x005a:
        r0 = r11.f516b;
        switch(r0) {
            case 0: goto L_0x009a;
            case 1: goto L_0x01c2;
            case 2: goto L_0x02c0;
            case 3: goto L_0x02c5;
            case 4: goto L_0x02e9;
            default: goto L_0x005f;
        };
    L_0x005f:
        r0 = r11.f516b;
        if (r0 == r12) goto L_0x003a;
    L_0x0063:
        r0 = "FragmentManager";
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "moveToState: Fragment state for ";
        r1 = r1.append(r2);
        r1 = r1.append(r11);
        r2 = " not updated inline; ";
        r1 = r1.append(r2);
        r2 = "expected state ";
        r1 = r1.append(r2);
        r1 = r1.append(r12);
        r2 = " found ";
        r1 = r1.append(r2);
        r2 = r11.f516b;
        r1 = r1.append(r2);
        r1 = r1.toString();
        android.util.Log.w(r0, r1);
        r11.f516b = r12;
        goto L_0x003a;
    L_0x009a:
        if (r12 <= 0) goto L_0x01c2;
    L_0x009c:
        r0 = f591a;
        if (r0 == 0) goto L_0x00b8;
    L_0x00a0:
        r0 = "FragmentManager";
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "moveto CREATED: ";
        r1 = r1.append(r2);
        r1 = r1.append(r11);
        r1 = r1.toString();
        android.util.Log.v(r0, r1);
    L_0x00b8:
        r0 = r11.f517c;
        if (r0 == 0) goto L_0x0100;
    L_0x00bc:
        r0 = r11.f517c;
        r1 = r10.f609m;
        r1 = r1.m555g();
        r1 = r1.getClassLoader();
        r0.setClassLoader(r1);
        r0 = r11.f517c;
        r1 = "android:view_state";
        r0 = r0.getSparseParcelableArray(r1);
        r11.f518d = r0;
        r0 = r11.f517c;
        r1 = "android:target_state";
        r0 = r10.m676a(r0, r1);
        r11.f522h = r0;
        r0 = r11.f522h;
        if (r0 == 0) goto L_0x00ed;
    L_0x00e3:
        r0 = r11.f517c;
        r1 = "android:target_req_state";
        r0 = r0.getInt(r1, r3);
        r11.f524j = r0;
    L_0x00ed:
        r0 = r11.f517c;
        r1 = "android:user_visible_hint";
        r0 = r0.getBoolean(r1, r5);
        r11.f505K = r0;
        r0 = r11.f505K;
        if (r0 != 0) goto L_0x0100;
    L_0x00fb:
        r11.f504J = r5;
        if (r12 <= r6) goto L_0x0100;
    L_0x00ff:
        r12 = r6;
    L_0x0100:
        r0 = r10.f609m;
        r11.f533s = r0;
        r0 = r10.f611o;
        r11.f536v = r0;
        r0 = r10.f611o;
        if (r0 == 0) goto L_0x014f;
    L_0x010c:
        r0 = r10.f611o;
        r0 = r0.f534t;
    L_0x0110:
        r11.f532r = r0;
        r0 = r11.f522h;
        if (r0 == 0) goto L_0x0164;
    L_0x0116:
        r0 = r10.f602f;
        r1 = r11.f522h;
        r1 = r1.f519e;
        r0 = r0.get(r1);
        r1 = r11.f522h;
        if (r0 == r1) goto L_0x0156;
    L_0x0124:
        r0 = new java.lang.IllegalStateException;
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "Fragment ";
        r1 = r1.append(r2);
        r1 = r1.append(r11);
        r2 = " declared target fragment ";
        r1 = r1.append(r2);
        r2 = r11.f522h;
        r1 = r1.append(r2);
        r2 = " that does not belong to this FragmentManager!";
        r1 = r1.append(r2);
        r1 = r1.toString();
        r0.<init>(r1);
        throw r0;
    L_0x014f:
        r0 = r10.f609m;
        r0 = r0.m557i();
        goto L_0x0110;
    L_0x0156:
        r0 = r11.f522h;
        r0 = r0.f516b;
        if (r0 >= r5) goto L_0x0164;
    L_0x015c:
        r1 = r11.f522h;
        r0 = r10;
        r2 = r5;
        r4 = r3;
        r0.m686a(r1, r2, r3, r4, r5);
    L_0x0164:
        r0 = r10.f609m;
        r0 = r0.m555g();
        r10.m687a(r11, r0, r3);
        r11.f500F = r3;
        r0 = r10.f609m;
        r0 = r0.m555g();
        r11.m475a(r0);
        r0 = r11.f500F;
        if (r0 != 0) goto L_0x019b;
    L_0x017c:
        r0 = new android.support.v4.a.z;
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "Fragment ";
        r1 = r1.append(r2);
        r1 = r1.append(r11);
        r2 = " did not call through to super.onAttach()";
        r1 = r1.append(r2);
        r1 = r1.toString();
        r0.<init>(r1);
        throw r0;
    L_0x019b:
        r0 = r11.f536v;
        if (r0 != 0) goto L_0x0313;
    L_0x019f:
        r0 = r10.f609m;
        r0.mo47b(r11);
    L_0x01a4:
        r0 = r10.f609m;
        r0 = r0.m555g();
        r10.m704b(r11, r0, r3);
        r0 = r11.f514T;
        if (r0 != 0) goto L_0x031a;
    L_0x01b1:
        r0 = r11.f517c;
        r10.m688a(r11, r0, r3);
        r0 = r11.f517c;
        r11.m522k(r0);
        r0 = r11.f517c;
        r10.m705b(r11, r0, r3);
    L_0x01c0:
        r11.f497C = r3;
    L_0x01c2:
        r10.m711c(r11);
        if (r12 <= r5) goto L_0x02c0;
    L_0x01c7:
        r0 = f591a;
        if (r0 == 0) goto L_0x01e3;
    L_0x01cb:
        r0 = "FragmentManager";
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "moveto ACTIVITY_CREATED: ";
        r1 = r1.append(r2);
        r1 = r1.append(r11);
        r1 = r1.toString();
        android.util.Log.v(r0, r1);
    L_0x01e3:
        r0 = r11.f527m;
        if (r0 != 0) goto L_0x02ab;
    L_0x01e7:
        r0 = r11.f538x;
        if (r0 == 0) goto L_0x04a1;
    L_0x01eb:
        r0 = r11.f538x;
        r1 = -1;
        if (r0 != r1) goto L_0x0211;
    L_0x01f0:
        r0 = new java.lang.IllegalArgumentException;
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "Cannot create fragment ";
        r1 = r1.append(r2);
        r1 = r1.append(r11);
        r2 = " for a container view with no id";
        r1 = r1.append(r2);
        r1 = r1.toString();
        r0.<init>(r1);
        r10.m656a(r0);
    L_0x0211:
        r0 = r10.f610n;
        r1 = r11.f538x;
        r0 = r0.mo42a(r1);
        r0 = (android.view.ViewGroup) r0;
        if (r0 != 0) goto L_0x0260;
    L_0x021d:
        r1 = r11.f529o;
        if (r1 != 0) goto L_0x0260;
    L_0x0221:
        r1 = r11.m507e();	 Catch:{ NotFoundException -> 0x0323 }
        r2 = r11.f538x;	 Catch:{ NotFoundException -> 0x0323 }
        r1 = r1.getResourceName(r2);	 Catch:{ NotFoundException -> 0x0323 }
    L_0x022b:
        r2 = new java.lang.IllegalArgumentException;
        r4 = new java.lang.StringBuilder;
        r4.<init>();
        r8 = "No view found for id 0x";
        r4 = r4.append(r8);
        r8 = r11.f538x;
        r8 = java.lang.Integer.toHexString(r8);
        r4 = r4.append(r8);
        r8 = " (";
        r4 = r4.append(r8);
        r1 = r4.append(r1);
        r4 = ") for fragment ";
        r1 = r1.append(r4);
        r1 = r1.append(r11);
        r1 = r1.toString();
        r2.<init>(r1);
        r10.m656a(r2);
    L_0x0260:
        r11.f501G = r0;
        r1 = r11.f517c;
        r1 = r11.m503d(r1);
        r2 = r11.f517c;
        r1 = r11.m489b(r1, r0, r2);
        r11.f502H = r1;
        r1 = r11.f502H;
        if (r1 == 0) goto L_0x032a;
    L_0x0274:
        r1 = r11.f502H;
        r11.f503I = r1;
        r1 = r11.f502H;
        r1.setSaveFromParentEnabled(r3);
        if (r0 == 0) goto L_0x0284;
    L_0x027f:
        r1 = r11.f502H;
        r0.addView(r1);
    L_0x0284:
        r0 = r11.f540z;
        if (r0 == 0) goto L_0x028f;
    L_0x0288:
        r0 = r11.f502H;
        r1 = 8;
        r0.setVisibility(r1);
    L_0x028f:
        r0 = r11.f502H;
        r1 = r11.f517c;
        r11.m484a(r0, r1);
        r0 = r11.f502H;
        r1 = r11.f517c;
        r10.m689a(r11, r0, r1, r3);
        r0 = r11.f502H;
        r0 = r0.getVisibility();
        if (r0 != 0) goto L_0x0328;
    L_0x02a5:
        r0 = r11.f501G;
        if (r0 == 0) goto L_0x0328;
    L_0x02a9:
        r11.f510P = r5;
    L_0x02ab:
        r0 = r11.f517c;
        r11.m524l(r0);
        r0 = r11.f517c;
        r10.m712c(r11, r0, r3);
        r0 = r11.f502H;
        if (r0 == 0) goto L_0x02be;
    L_0x02b9:
        r0 = r11.f517c;
        r11.m478a(r0);
    L_0x02be:
        r11.f517c = r7;
    L_0x02c0:
        r0 = 2;
        if (r12 <= r0) goto L_0x02c5;
    L_0x02c3:
        r11.f516b = r6;
    L_0x02c5:
        if (r12 <= r6) goto L_0x02e9;
    L_0x02c7:
        r0 = f591a;
        if (r0 == 0) goto L_0x02e3;
    L_0x02cb:
        r0 = "FragmentManager";
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "moveto STARTED: ";
        r1 = r1.append(r2);
        r1 = r1.append(r11);
        r1 = r1.toString();
        android.util.Log.v(r0, r1);
    L_0x02e3:
        r11.m443C();
        r10.m706b(r11, r3);
    L_0x02e9:
        if (r12 <= r9) goto L_0x005f;
    L_0x02eb:
        r0 = f591a;
        if (r0 == 0) goto L_0x0307;
    L_0x02ef:
        r0 = "FragmentManager";
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "moveto RESUMED: ";
        r1 = r1.append(r2);
        r1 = r1.append(r11);
        r1 = r1.toString();
        android.util.Log.v(r0, r1);
    L_0x0307:
        r11.m444D();
        r10.m713c(r11, r3);
        r11.f517c = r7;
        r11.f518d = r7;
        goto L_0x005f;
    L_0x0313:
        r0 = r11.f536v;
        r0.m480a(r11);
        goto L_0x01a4;
    L_0x031a:
        r0 = r11.f517c;
        r11.m514g(r0);
        r11.f516b = r5;
        goto L_0x01c0;
    L_0x0323:
        r1 = move-exception;
        r1 = "unknown";
        goto L_0x022b;
    L_0x0328:
        r5 = r3;
        goto L_0x02a9;
    L_0x032a:
        r11.f503I = r7;
        goto L_0x02ab;
    L_0x032e:
        r0 = r11.f516b;
        if (r0 <= r12) goto L_0x005f;
    L_0x0332:
        r0 = r11.f516b;
        switch(r0) {
            case 1: goto L_0x0339;
            case 2: goto L_0x03cb;
            case 3: goto L_0x03aa;
            case 4: goto L_0x0386;
            case 5: goto L_0x0361;
            default: goto L_0x0337;
        };
    L_0x0337:
        goto L_0x005f;
    L_0x0339:
        if (r12 >= r5) goto L_0x005f;
    L_0x033b:
        r0 = r10.f615t;
        if (r0 == 0) goto L_0x034f;
    L_0x033f:
        r0 = r11.m458R();
        if (r0 == 0) goto L_0x044b;
    L_0x0345:
        r0 = r11.m458R();
        r11.m483a(r7);
        r0.clearAnimation();
    L_0x034f:
        r0 = r11.m458R();
        if (r0 != 0) goto L_0x035b;
    L_0x0355:
        r0 = r11.m459S();
        if (r0 == 0) goto L_0x045d;
    L_0x035b:
        r11.m490b(r12);
        r12 = r5;
        goto L_0x005f;
    L_0x0361:
        r0 = 5;
        if (r12 >= r0) goto L_0x0386;
    L_0x0364:
        r0 = f591a;
        if (r0 == 0) goto L_0x0380;
    L_0x0368:
        r0 = "FragmentManager";
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "movefrom RESUMED: ";
        r1 = r1.append(r2);
        r1 = r1.append(r11);
        r1 = r1.toString();
        android.util.Log.v(r0, r1);
    L_0x0380:
        r11.m447G();
        r10.m718d(r11, r3);
    L_0x0386:
        if (r12 >= r9) goto L_0x03aa;
    L_0x0388:
        r0 = f591a;
        if (r0 == 0) goto L_0x03a4;
    L_0x038c:
        r0 = "FragmentManager";
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "movefrom STARTED: ";
        r1 = r1.append(r2);
        r1 = r1.append(r11);
        r1 = r1.toString();
        android.util.Log.v(r0, r1);
    L_0x03a4:
        r11.m448H();
        r10.m720e(r11, r3);
    L_0x03aa:
        if (r12 >= r6) goto L_0x03cb;
    L_0x03ac:
        r0 = f591a;
        if (r0 == 0) goto L_0x03c8;
    L_0x03b0:
        r0 = "FragmentManager";
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "movefrom STOPPED: ";
        r1 = r1.append(r2);
        r1 = r1.append(r11);
        r1 = r1.toString();
        android.util.Log.v(r0, r1);
    L_0x03c8:
        r11.m449I();
    L_0x03cb:
        r0 = 2;
        if (r12 >= r0) goto L_0x0339;
    L_0x03ce:
        r0 = f591a;
        if (r0 == 0) goto L_0x03ea;
    L_0x03d2:
        r0 = "FragmentManager";
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "movefrom ACTIVITY_CREATED: ";
        r1 = r1.append(r2);
        r1 = r1.append(r11);
        r1 = r1.toString();
        android.util.Log.v(r0, r1);
    L_0x03ea:
        r0 = r11.f502H;
        if (r0 == 0) goto L_0x03fd;
    L_0x03ee:
        r0 = r10.f609m;
        r0 = r0.mo45a(r11);
        if (r0 == 0) goto L_0x03fd;
    L_0x03f6:
        r0 = r11.f518d;
        if (r0 != 0) goto L_0x03fd;
    L_0x03fa:
        r10.m740m(r11);
    L_0x03fd:
        r11.m450J();
        r10.m724f(r11, r3);
        r0 = r11.f502H;
        if (r0 == 0) goto L_0x0441;
    L_0x0407:
        r0 = r11.f501G;
        if (r0 == 0) goto L_0x0441;
    L_0x040b:
        r0 = r11.f502H;
        r0.clearAnimation();
        r0 = r11.f501G;
        r1 = r11.f502H;
        r0.endViewTransition(r1);
        r0 = r10.f608l;
        if (r0 <= 0) goto L_0x049f;
    L_0x041b:
        r0 = r10.f615t;
        if (r0 != 0) goto L_0x049f;
    L_0x041f:
        r0 = r11.f502H;
        r0 = r0.getVisibility();
        if (r0 != 0) goto L_0x049f;
    L_0x0427:
        r0 = r11.f512R;
        r1 = 0;
        r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1));
        if (r0 < 0) goto L_0x049f;
    L_0x042e:
        r0 = r10.m678a(r11, r13, r3, r14);
    L_0x0432:
        r1 = 0;
        r11.f512R = r1;
        if (r0 == 0) goto L_0x043a;
    L_0x0437:
        r10.m651a(r11, r0, r12);
    L_0x043a:
        r0 = r11.f501G;
        r1 = r11.f502H;
        r0.removeView(r1);
    L_0x0441:
        r11.f501G = r7;
        r11.f502H = r7;
        r11.f503I = r7;
        r11.f528n = r3;
        goto L_0x0339;
    L_0x044b:
        r0 = r11.m459S();
        if (r0 == 0) goto L_0x034f;
    L_0x0451:
        r0 = r11.m459S();
        r11.m472a(r7);
        r0.cancel();
        goto L_0x034f;
    L_0x045d:
        r0 = f591a;
        if (r0 == 0) goto L_0x0479;
    L_0x0461:
        r0 = "FragmentManager";
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "movefrom CREATED: ";
        r1 = r1.append(r2);
        r1 = r1.append(r11);
        r1 = r1.toString();
        android.util.Log.v(r0, r1);
    L_0x0479:
        r0 = r11.f497C;
        if (r0 != 0) goto L_0x0494;
    L_0x047d:
        r11.m451K();
        r10.m727g(r11, r3);
    L_0x0483:
        r11.m452L();
        r10.m730h(r11, r3);
        if (r15 != 0) goto L_0x005f;
    L_0x048b:
        r0 = r11.f497C;
        if (r0 != 0) goto L_0x0497;
    L_0x048f:
        r10.m726g(r11);
        goto L_0x005f;
    L_0x0494:
        r11.f516b = r3;
        goto L_0x0483;
    L_0x0497:
        r11.f533s = r7;
        r11.f536v = r7;
        r11.f532r = r7;
        goto L_0x005f;
    L_0x049f:
        r0 = r7;
        goto L_0x0432;
    L_0x04a1:
        r0 = r7;
        goto L_0x0260;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.a.n.a(android.support.v4.a.h, int, int, int, boolean):void");
    }

    void m687a(C0114h c0114h, Context context, boolean z) {
        if (this.f611o != null) {
            C0123m f = this.f611o.m510f();
            if (f instanceof C0135n) {
                ((C0135n) f).m687a(c0114h, context, true);
            }
        }
        Iterator it = this.f597I.iterator();
        while (it.hasNext()) {
            C0242i c0242i = (C0242i) it.next();
            if (!z || ((Boolean) c0242i.f881b).booleanValue()) {
                ((C0121a) c0242i.f880a).m618a((C0123m) this, c0114h, context);
            }
        }
    }

    void m688a(C0114h c0114h, Bundle bundle, boolean z) {
        if (this.f611o != null) {
            C0123m f = this.f611o.m510f();
            if (f instanceof C0135n) {
                ((C0135n) f).m688a(c0114h, bundle, true);
            }
        }
        Iterator it = this.f597I.iterator();
        while (it.hasNext()) {
            C0242i c0242i = (C0242i) it.next();
            if (!z || ((Boolean) c0242i.f881b).booleanValue()) {
                ((C0121a) c0242i.f880a).m619a((C0123m) this, c0114h, bundle);
            }
        }
    }

    void m689a(C0114h c0114h, View view, Bundle bundle, boolean z) {
        if (this.f611o != null) {
            C0123m f = this.f611o.m510f();
            if (f instanceof C0135n) {
                ((C0135n) f).m689a(c0114h, view, bundle, true);
            }
        }
        Iterator it = this.f597I.iterator();
        while (it.hasNext()) {
            C0242i c0242i = (C0242i) it.next();
            if (!z || ((Boolean) c0242i.f881b).booleanValue()) {
                ((C0121a) c0242i.f880a).m620a(this, c0114h, view, bundle);
            }
        }
    }

    public void m690a(C0114h c0114h, boolean z) {
        if (f591a) {
            Log.v("FragmentManager", "add: " + c0114h);
        }
        m723f(c0114h);
        if (!c0114h.f495A) {
            if (this.f601e.contains(c0114h)) {
                throw new IllegalStateException("Fragment already added: " + c0114h);
            }
            synchronized (this.f601e) {
                this.f601e.add(c0114h);
            }
            c0114h.f525k = true;
            c0114h.f526l = false;
            if (c0114h.f502H == null) {
                c0114h.f511Q = false;
            }
            if (c0114h.f498D && c0114h.f499E) {
                this.f613r = true;
            }
            if (z) {
                m703b(c0114h);
            }
        }
    }

    public void m691a(C0116l c0116l, C0109j c0109j, C0114h c0114h) {
        if (this.f609m != null) {
            throw new IllegalStateException("Already attached");
        }
        this.f609m = c0116l;
        this.f610n = c0109j;
        this.f611o = c0114h;
    }

    public void mo62a(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        int size;
        int i;
        C0114h c0114h;
        int i2 = 0;
        String str2 = str + "    ";
        if (this.f602f != null) {
            size = this.f602f.size();
            if (size > 0) {
                printWriter.print(str);
                printWriter.print("Active Fragments in ");
                printWriter.print(Integer.toHexString(System.identityHashCode(this)));
                printWriter.println(":");
                for (i = 0; i < size; i++) {
                    c0114h = (C0114h) this.f602f.valueAt(i);
                    printWriter.print(str);
                    printWriter.print("  #");
                    printWriter.print(i);
                    printWriter.print(": ");
                    printWriter.println(c0114h);
                    if (c0114h != null) {
                        c0114h.m485a(str2, fileDescriptor, printWriter, strArr);
                    }
                }
            }
        }
        size = this.f601e.size();
        if (size > 0) {
            printWriter.print(str);
            printWriter.println("Added Fragments:");
            for (i = 0; i < size; i++) {
                c0114h = (C0114h) this.f601e.get(i);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i);
                printWriter.print(": ");
                printWriter.println(c0114h.toString());
            }
        }
        if (this.f604h != null) {
            size = this.f604h.size();
            if (size > 0) {
                printWriter.print(str);
                printWriter.println("Fragments Created Menus:");
                for (i = 0; i < size; i++) {
                    c0114h = (C0114h) this.f604h.get(i);
                    printWriter.print(str);
                    printWriter.print("  #");
                    printWriter.print(i);
                    printWriter.print(": ");
                    printWriter.println(c0114h.toString());
                }
            }
        }
        if (this.f603g != null) {
            size = this.f603g.size();
            if (size > 0) {
                printWriter.print(str);
                printWriter.println("Back Stack:");
                for (i = 0; i < size; i++) {
                    C0101c c0101c = (C0101c) this.f603g.get(i);
                    printWriter.print(str);
                    printWriter.print("  #");
                    printWriter.print(i);
                    printWriter.print(": ");
                    printWriter.println(c0101c.toString());
                    c0101c.m403a(str2, fileDescriptor, printWriter, strArr);
                }
            }
        }
        synchronized (this) {
            if (this.f605i != null) {
                int size2 = this.f605i.size();
                if (size2 > 0) {
                    printWriter.print(str);
                    printWriter.println("Back Stack Indices:");
                    for (i = 0; i < size2; i++) {
                        c0101c = (C0101c) this.f605i.get(i);
                        printWriter.print(str);
                        printWriter.print("  #");
                        printWriter.print(i);
                        printWriter.print(": ");
                        printWriter.println(c0101c);
                    }
                }
            }
            if (this.f606j != null && this.f606j.size() > 0) {
                printWriter.print(str);
                printWriter.print("mAvailBackStackIndices: ");
                printWriter.println(Arrays.toString(this.f606j.toArray()));
            }
        }
        if (this.f598b != null) {
            i = this.f598b.size();
            if (i > 0) {
                printWriter.print(str);
                printWriter.println("Pending Actions:");
                while (i2 < i) {
                    C0100f c0100f = (C0100f) this.f598b.get(i2);
                    printWriter.print(str);
                    printWriter.print("  #");
                    printWriter.print(i2);
                    printWriter.print(": ");
                    printWriter.println(c0100f);
                    i2++;
                }
            }
        }
        printWriter.print(str);
        printWriter.println("FragmentManager misc state:");
        printWriter.print(str);
        printWriter.print("  mHost=");
        printWriter.println(this.f609m);
        printWriter.print(str);
        printWriter.print("  mContainer=");
        printWriter.println(this.f610n);
        if (this.f611o != null) {
            printWriter.print(str);
            printWriter.print("  mParent=");
            printWriter.println(this.f611o);
        }
        printWriter.print(str);
        printWriter.print("  mCurState=");
        printWriter.print(this.f608l);
        printWriter.print(" mStateSaved=");
        printWriter.print(this.f614s);
        printWriter.print(" mDestroyed=");
        printWriter.println(this.f615t);
        if (this.f613r) {
            printWriter.print(str);
            printWriter.print("  mNeedMenuInvalidate=");
            printWriter.println(this.f613r);
        }
        if (this.f616u != null) {
            printWriter.print(str);
            printWriter.print("  mNoTransactionsBecause=");
            printWriter.println(this.f616u);
        }
    }

    public void m693a(boolean z) {
        for (int size = this.f601e.size() - 1; size >= 0; size--) {
            C0114h c0114h = (C0114h) this.f601e.get(size);
            if (c0114h != null) {
                c0114h.m505d(z);
            }
        }
    }

    public boolean mo63a() {
        m673x();
        return m662a(null, -1, 0);
    }

    boolean m695a(int i) {
        return this.f608l >= i;
    }

    public boolean m696a(Menu menu) {
        boolean z = false;
        for (int i = 0; i < this.f601e.size(); i++) {
            C0114h c0114h = (C0114h) this.f601e.get(i);
            if (c0114h != null && c0114h.m500c(menu)) {
                z = true;
            }
        }
        return z;
    }

    public boolean m697a(Menu menu, MenuInflater menuInflater) {
        int i = 0;
        ArrayList arrayList = null;
        int i2 = 0;
        boolean z = false;
        while (i2 < this.f601e.size()) {
            C0114h c0114h = (C0114h) this.f601e.get(i2);
            if (c0114h != null && c0114h.m495b(menu, menuInflater)) {
                z = true;
                if (arrayList == null) {
                    arrayList = new ArrayList();
                }
                arrayList.add(c0114h);
            }
            i2++;
            z = z;
        }
        if (this.f604h != null) {
            while (i < this.f604h.size()) {
                c0114h = (C0114h) this.f604h.get(i);
                if (arrayList == null || !arrayList.contains(c0114h)) {
                    c0114h.m531r();
                }
                i++;
            }
        }
        this.f604h = arrayList;
        return z;
    }

    public boolean m698a(MenuItem menuItem) {
        for (int i = 0; i < this.f601e.size(); i++) {
            C0114h c0114h = (C0114h) this.f601e.get(i);
            if (c0114h != null && c0114h.m501c(menuItem)) {
                return true;
            }
        }
        return false;
    }

    boolean m699a(ArrayList<C0101c> arrayList, ArrayList<Boolean> arrayList2, String str, int i, int i2) {
        if (this.f603g == null) {
            return false;
        }
        int size;
        if (str == null && i < 0 && (i2 & 1) == 0) {
            size = this.f603g.size() - 1;
            if (size < 0) {
                return false;
            }
            arrayList.add(this.f603g.remove(size));
            arrayList2.add(Boolean.valueOf(true));
        } else {
            int size2;
            size = -1;
            if (str != null || i >= 0) {
                C0101c c0101c;
                size2 = this.f603g.size() - 1;
                while (size2 >= 0) {
                    c0101c = (C0101c) this.f603g.get(size2);
                    if ((str != null && str.equals(c0101c.m412d())) || (i >= 0 && i == c0101c.f447n)) {
                        break;
                    }
                    size2--;
                }
                if (size2 < 0) {
                    return false;
                }
                if ((i2 & 1) != 0) {
                    size2--;
                    while (size2 >= 0) {
                        c0101c = (C0101c) this.f603g.get(size2);
                        if ((str == null || !str.equals(c0101c.m412d())) && (i < 0 || i != c0101c.f447n)) {
                            break;
                        }
                        size2--;
                    }
                }
                size = size2;
            }
            if (size == this.f603g.size() - 1) {
                return false;
            }
            for (size2 = this.f603g.size() - 1; size2 > size; size2--) {
                arrayList.add(this.f603g.remove(size2));
                arrayList2.add(Boolean.valueOf(true));
            }
        }
        return true;
    }

    public C0114h m700b(int i) {
        int size;
        for (size = this.f601e.size() - 1; size >= 0; size--) {
            C0114h c0114h = (C0114h) this.f601e.get(size);
            if (c0114h != null && c0114h.f537w == i) {
                return c0114h;
            }
        }
        if (this.f602f != null) {
            for (size = this.f602f.size() - 1; size >= 0; size--) {
                c0114h = (C0114h) this.f602f.valueAt(size);
                if (c0114h != null && c0114h.f537w == i) {
                    return c0114h;
                }
            }
        }
        return null;
    }

    public C0114h m701b(String str) {
        if (!(this.f602f == null || str == null)) {
            for (int size = this.f602f.size() - 1; size >= 0; size--) {
                C0114h c0114h = (C0114h) this.f602f.valueAt(size);
                if (c0114h != null) {
                    c0114h = c0114h.m464a(str);
                    if (c0114h != null) {
                        return c0114h;
                    }
                }
            }
        }
        return null;
    }

    public List<C0114h> mo64b() {
        if (this.f601e.isEmpty()) {
            return Collections.EMPTY_LIST;
        }
        List<C0114h> list;
        synchronized (this.f601e) {
            list = (List) this.f601e.clone();
        }
        return list;
    }

    void m703b(C0114h c0114h) {
        m686a(c0114h, this.f608l, 0, 0, false);
    }

    void m704b(C0114h c0114h, Context context, boolean z) {
        if (this.f611o != null) {
            C0123m f = this.f611o.m510f();
            if (f instanceof C0135n) {
                ((C0135n) f).m704b(c0114h, context, true);
            }
        }
        Iterator it = this.f597I.iterator();
        while (it.hasNext()) {
            C0242i c0242i = (C0242i) it.next();
            if (!z || ((Boolean) c0242i.f881b).booleanValue()) {
                ((C0121a) c0242i.f880a).m622b((C0123m) this, c0114h, context);
            }
        }
    }

    void m705b(C0114h c0114h, Bundle bundle, boolean z) {
        if (this.f611o != null) {
            C0123m f = this.f611o.m510f();
            if (f instanceof C0135n) {
                ((C0135n) f).m705b(c0114h, bundle, true);
            }
        }
        Iterator it = this.f597I.iterator();
        while (it.hasNext()) {
            C0242i c0242i = (C0242i) it.next();
            if (!z || ((Boolean) c0242i.f881b).booleanValue()) {
                ((C0121a) c0242i.f880a).m623b((C0123m) this, c0114h, bundle);
            }
        }
    }

    void m706b(C0114h c0114h, boolean z) {
        if (this.f611o != null) {
            C0123m f = this.f611o.m510f();
            if (f instanceof C0135n) {
                ((C0135n) f).m706b(c0114h, true);
            }
        }
        Iterator it = this.f597I.iterator();
        while (it.hasNext()) {
            C0242i c0242i = (C0242i) it.next();
            if (!z || ((Boolean) c0242i.f881b).booleanValue()) {
                ((C0121a) c0242i.f880a).m617a(this, c0114h);
            }
        }
    }

    public void m707b(Menu menu) {
        for (int i = 0; i < this.f601e.size(); i++) {
            C0114h c0114h = (C0114h) this.f601e.get(i);
            if (c0114h != null) {
                c0114h.m504d(menu);
            }
        }
    }

    public void m708b(boolean z) {
        for (int size = this.f601e.size() - 1; size >= 0; size--) {
            C0114h c0114h = (C0114h) this.f601e.get(size);
            if (c0114h != null) {
                c0114h.m509e(z);
            }
        }
    }

    public boolean m709b(MenuItem menuItem) {
        for (int i = 0; i < this.f601e.size(); i++) {
            C0114h c0114h = (C0114h) this.f601e.get(i);
            if (c0114h != null && c0114h.m506d(menuItem)) {
                return true;
            }
        }
        return false;
    }

    public void m710c(int i) {
        synchronized (this) {
            this.f605i.set(i, null);
            if (this.f606j == null) {
                this.f606j = new ArrayList();
            }
            if (f591a) {
                Log.v("FragmentManager", "Freeing back stack index " + i);
            }
            this.f606j.add(Integer.valueOf(i));
        }
    }

    void m711c(C0114h c0114h) {
        if (c0114h.f527m && !c0114h.f530p) {
            c0114h.f502H = c0114h.m489b(c0114h.m503d(c0114h.f517c), null, c0114h.f517c);
            if (c0114h.f502H != null) {
                c0114h.f503I = c0114h.f502H;
                c0114h.f502H.setSaveFromParentEnabled(false);
                if (c0114h.f540z) {
                    c0114h.f502H.setVisibility(8);
                }
                c0114h.m484a(c0114h.f502H, c0114h.f517c);
                m689a(c0114h, c0114h.f502H, c0114h.f517c, false);
                return;
            }
            c0114h.f503I = null;
        }
    }

    void m712c(C0114h c0114h, Bundle bundle, boolean z) {
        if (this.f611o != null) {
            C0123m f = this.f611o.m510f();
            if (f instanceof C0135n) {
                ((C0135n) f).m712c(c0114h, bundle, true);
            }
        }
        Iterator it = this.f597I.iterator();
        while (it.hasNext()) {
            C0242i c0242i = (C0242i) it.next();
            if (!z || ((Boolean) c0242i.f881b).booleanValue()) {
                ((C0121a) c0242i.f880a).m625c(this, c0114h, bundle);
            }
        }
    }

    void m713c(C0114h c0114h, boolean z) {
        if (this.f611o != null) {
            C0123m f = this.f611o.m510f();
            if (f instanceof C0135n) {
                ((C0135n) f).m713c(c0114h, true);
            }
        }
        Iterator it = this.f597I.iterator();
        while (it.hasNext()) {
            C0242i c0242i = (C0242i) it.next();
            if (!z || ((Boolean) c0242i.f881b).booleanValue()) {
                ((C0121a) c0242i.f880a).m621b(this, c0114h);
            }
        }
    }

    public boolean mo65c() {
        return this.f614s;
    }

    void m715d() {
        if (this.f602f != null) {
            for (int i = 0; i < this.f602f.size(); i++) {
                C0114h c0114h = (C0114h) this.f602f.valueAt(i);
                if (c0114h != null) {
                    m685a(c0114h);
                }
            }
        }
    }

    void m716d(final C0114h c0114h) {
        if (c0114h.f502H != null) {
            C0131c a = m678a(c0114h, c0114h.m454N(), !c0114h.f540z, c0114h.m455O());
            if (a == null || a.f581b == null) {
                if (a != null) {
                    C0135n.m665b(c0114h.f502H, a);
                    c0114h.f502H.startAnimation(a.f580a);
                    a.f580a.start();
                }
                int i = (!c0114h.f540z || c0114h.m462V()) ? 0 : 8;
                c0114h.f502H.setVisibility(i);
                if (c0114h.m462V()) {
                    c0114h.m512f(false);
                }
            } else {
                a.f581b.setTarget(c0114h.f502H);
                if (!c0114h.f540z) {
                    c0114h.f502H.setVisibility(0);
                } else if (c0114h.m462V()) {
                    c0114h.m512f(false);
                } else {
                    final ViewGroup viewGroup = c0114h.f501G;
                    final View view = c0114h.f502H;
                    viewGroup.startViewTransition(view);
                    a.f581b.addListener(new AnimatorListenerAdapter(this) {
                        final /* synthetic */ C0135n f577d;

                        public void onAnimationEnd(Animator animator) {
                            viewGroup.endViewTransition(view);
                            animator.removeListener(this);
                            if (c0114h.f502H != null) {
                                c0114h.f502H.setVisibility(8);
                            }
                        }
                    });
                }
                C0135n.m665b(c0114h.f502H, a);
                a.f581b.start();
            }
        }
        if (c0114h.f525k && c0114h.f498D && c0114h.f499E) {
            this.f613r = true;
        }
        c0114h.f511Q = false;
        c0114h.m486a(c0114h.f540z);
    }

    void m717d(C0114h c0114h, Bundle bundle, boolean z) {
        if (this.f611o != null) {
            C0123m f = this.f611o.m510f();
            if (f instanceof C0135n) {
                ((C0135n) f).m717d(c0114h, bundle, true);
            }
        }
        Iterator it = this.f597I.iterator();
        while (it.hasNext()) {
            C0242i c0242i = (C0242i) it.next();
            if (!z || ((Boolean) c0242i.f881b).booleanValue()) {
                ((C0121a) c0242i.f880a).m627d(this, c0114h, bundle);
            }
        }
    }

    void m718d(C0114h c0114h, boolean z) {
        if (this.f611o != null) {
            C0123m f = this.f611o.m510f();
            if (f instanceof C0135n) {
                ((C0135n) f).m718d(c0114h, true);
            }
        }
        Iterator it = this.f597I.iterator();
        while (it.hasNext()) {
            C0242i c0242i = (C0242i) it.next();
            if (!z || ((Boolean) c0242i.f881b).booleanValue()) {
                ((C0121a) c0242i.f880a).m624c(this, c0114h);
            }
        }
    }

    void m719e(C0114h c0114h) {
        if (c0114h != null) {
            int i = this.f608l;
            if (c0114h.f526l) {
                i = c0114h.m494b() ? Math.min(i, 1) : Math.min(i, 0);
            }
            m686a(c0114h, i, c0114h.m454N(), c0114h.m455O(), false);
            if (c0114h.f502H != null) {
                C0114h p = m672p(c0114h);
                if (p != null) {
                    View view = p.f502H;
                    ViewGroup viewGroup = c0114h.f501G;
                    int indexOfChild = viewGroup.indexOfChild(view);
                    i = viewGroup.indexOfChild(c0114h.f502H);
                    if (i < indexOfChild) {
                        viewGroup.removeViewAt(i);
                        viewGroup.addView(c0114h.f502H, indexOfChild);
                    }
                }
                if (c0114h.f510P && c0114h.f501G != null) {
                    if (c0114h.f512R > 0.0f) {
                        c0114h.f502H.setAlpha(c0114h.f512R);
                    }
                    c0114h.f512R = 0.0f;
                    c0114h.f510P = false;
                    C0131c a = m678a(c0114h, c0114h.m454N(), true, c0114h.m455O());
                    if (a != null) {
                        C0135n.m665b(c0114h.f502H, a);
                        if (a.f580a != null) {
                            c0114h.f502H.startAnimation(a.f580a);
                        } else {
                            a.f581b.setTarget(c0114h.f502H);
                            a.f581b.start();
                        }
                    }
                }
            }
            if (c0114h.f511Q) {
                m716d(c0114h);
            }
        }
    }

    void m720e(C0114h c0114h, boolean z) {
        if (this.f611o != null) {
            C0123m f = this.f611o.m510f();
            if (f instanceof C0135n) {
                ((C0135n) f).m720e(c0114h, true);
            }
        }
        Iterator it = this.f597I.iterator();
        while (it.hasNext()) {
            C0242i c0242i = (C0242i) it.next();
            if (!z || ((Boolean) c0242i.f881b).booleanValue()) {
                ((C0121a) c0242i.f880a).m626d(this, c0114h);
            }
        }
    }

    public boolean m721e() {
        /* JADX: method processing error */
/*
Error: java.lang.NullPointerException
	at jadx.core.dex.visitors.ssa.SSATransform.placePhi(SSATransform.java:82)
	at jadx.core.dex.visitors.ssa.SSATransform.process(SSATransform.java:50)
	at jadx.core.dex.visitors.ssa.SSATransform.visit(SSATransform.java:42)
	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:31)
	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:17)
	at jadx.core.ProcessClass.process(ProcessClass.java:37)
	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:59)
	at jadx.core.ProcessClass.process(ProcessClass.java:42)
	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:306)
	at jadx.api.JavaClass.decompile(JavaClass.java:62)
	at jadx.api.JadxDecompiler$1.run(JadxDecompiler.java:199)
*/
        /*
        r4 = this;
        r1 = 1;
        r4.m668c(r1);
        r0 = 0;
    L_0x0005:
        r2 = r4.f618w;
        r3 = r4.f619x;
        r2 = r4.m669c(r2, r3);
        if (r2 == 0) goto L_0x0022;
    L_0x000f:
        r4.f599c = r1;
        r0 = r4.f618w;	 Catch:{ all -> 0x001d }
        r2 = r4.f619x;	 Catch:{ all -> 0x001d }
        r4.m666b(r0, r2);	 Catch:{ all -> 0x001d }
        r4.m675z();
        r0 = r1;
        goto L_0x0005;
    L_0x001d:
        r0 = move-exception;
        r4.m675z();
        throw r0;
    L_0x0022:
        r4.m722f();
        r4.m645C();
        return r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.a.n.e():boolean");
    }

    void m722f() {
        if (this.f617v) {
            int i = 0;
            for (int i2 = 0; i2 < this.f602f.size(); i2++) {
                C0114h c0114h = (C0114h) this.f602f.valueAt(i2);
                if (!(c0114h == null || c0114h.f506L == null)) {
                    i |= c0114h.f506L.mo66a();
                }
            }
            if (i == 0) {
                this.f617v = false;
                m715d();
            }
        }
    }

    void m723f(C0114h c0114h) {
        if (c0114h.f519e < 0) {
            int i = this.f600d;
            this.f600d = i + 1;
            c0114h.m470a(i, this.f611o);
            if (this.f602f == null) {
                this.f602f = new SparseArray();
            }
            this.f602f.put(c0114h.f519e, c0114h);
            if (f591a) {
                Log.v("FragmentManager", "Allocated fragment index " + c0114h);
            }
        }
    }

    void m724f(C0114h c0114h, boolean z) {
        if (this.f611o != null) {
            C0123m f = this.f611o.m510f();
            if (f instanceof C0135n) {
                ((C0135n) f).m724f(c0114h, true);
            }
        }
        Iterator it = this.f597I.iterator();
        while (it.hasNext()) {
            C0242i c0242i = (C0242i) it.next();
            if (!z || ((Boolean) c0242i.f881b).booleanValue()) {
                ((C0121a) c0242i.f880a).m628e(this, c0114h);
            }
        }
    }

    void m725g() {
        if (this.f607k != null) {
            for (int i = 0; i < this.f607k.size(); i++) {
                ((C0122b) this.f607k.get(i)).m631a();
            }
        }
    }

    void m726g(C0114h c0114h) {
        if (c0114h.f519e >= 0) {
            if (f591a) {
                Log.v("FragmentManager", "Freeing fragment index " + c0114h);
            }
            this.f602f.put(c0114h.f519e, null);
            this.f609m.m543a(c0114h.f520f);
            c0114h.m529p();
        }
    }

    void m727g(C0114h c0114h, boolean z) {
        if (this.f611o != null) {
            C0123m f = this.f611o.m510f();
            if (f instanceof C0135n) {
                ((C0135n) f).m727g(c0114h, true);
            }
        }
        Iterator it = this.f597I.iterator();
        while (it.hasNext()) {
            C0242i c0242i = (C0242i) it.next();
            if (!z || ((Boolean) c0242i.f881b).booleanValue()) {
                ((C0121a) c0242i.f880a).m629f(this, c0114h);
            }
        }
    }

    C0136o m728h() {
        C0135n.m654a(this.f595C);
        return this.f595C;
    }

    public void m729h(C0114h c0114h) {
        if (f591a) {
            Log.v("FragmentManager", "remove: " + c0114h + " nesting=" + c0114h.f531q);
        }
        boolean z = !c0114h.m494b();
        if (!c0114h.f495A || z) {
            synchronized (this.f601e) {
                this.f601e.remove(c0114h);
            }
            if (c0114h.f498D && c0114h.f499E) {
                this.f613r = true;
            }
            c0114h.f525k = false;
            c0114h.f526l = true;
        }
    }

    void m730h(C0114h c0114h, boolean z) {
        if (this.f611o != null) {
            C0123m f = this.f611o.m510f();
            if (f instanceof C0135n) {
                ((C0135n) f).m730h(c0114h, true);
            }
        }
        Iterator it = this.f597I.iterator();
        while (it.hasNext()) {
            C0242i c0242i = (C0242i) it.next();
            if (!z || ((Boolean) c0242i.f881b).booleanValue()) {
                ((C0121a) c0242i.f880a).m630g(this, c0114h);
            }
        }
    }

    void m731i() {
        List list;
        List list2;
        if (this.f602f != null) {
            int i = 0;
            list = null;
            list2 = null;
            while (i < this.f602f.size()) {
                ArrayList arrayList;
                ArrayList arrayList2;
                C0114h c0114h = (C0114h) this.f602f.valueAt(i);
                if (c0114h != null) {
                    ArrayList arrayList3;
                    Object obj;
                    if (c0114h.f496B) {
                        if (list2 == null) {
                            arrayList3 = new ArrayList();
                        }
                        arrayList3.add(c0114h);
                        c0114h.f523i = c0114h.f522h != null ? c0114h.f522h.f519e : -1;
                        if (f591a) {
                            Log.v("FragmentManager", "retainNonConfig: keeping retained " + c0114h);
                        }
                    }
                    if (c0114h.f534t != null) {
                        c0114h.f534t.m731i();
                        obj = c0114h.f534t.f595C;
                    } else {
                        C0136o c0136o = c0114h.f535u;
                    }
                    if (list == null && obj != null) {
                        list = new ArrayList(this.f602f.size());
                        for (int i2 = 0; i2 < i; i2++) {
                            list.add(null);
                        }
                    }
                    arrayList = list;
                    if (arrayList != null) {
                        arrayList.add(obj);
                    }
                    arrayList2 = arrayList3;
                } else {
                    List list3 = list;
                    list = list2;
                }
                i++;
                Object obj2 = arrayList2;
                Object obj3 = arrayList;
            }
        } else {
            list = null;
            list2 = null;
        }
        if (list2 == null && list == null) {
            this.f595C = null;
        } else {
            this.f595C = new C0136o(list2, list);
        }
    }

    public void m732i(C0114h c0114h) {
        boolean z = true;
        if (f591a) {
            Log.v("FragmentManager", "hide: " + c0114h);
        }
        if (!c0114h.f540z) {
            c0114h.f540z = true;
            if (c0114h.f511Q) {
                z = false;
            }
            c0114h.f511Q = z;
        }
    }

    Parcelable m733j() {
        C0103d[] c0103dArr = null;
        m643A();
        m644B();
        m721e();
        this.f614s = true;
        this.f595C = null;
        if (this.f602f == null || this.f602f.size() <= 0) {
            return null;
        }
        int size = this.f602f.size();
        C0140q[] c0140qArr = new C0140q[size];
        int i = 0;
        boolean z = false;
        while (i < size) {
            boolean z2;
            C0114h c0114h = (C0114h) this.f602f.valueAt(i);
            if (c0114h != null) {
                if (c0114h.f519e < 0) {
                    m656a(new IllegalStateException("Failure saving state: active " + c0114h + " has cleared index: " + c0114h.f519e));
                }
                C0140q c0140q = new C0140q(c0114h);
                c0140qArr[i] = c0140q;
                if (c0114h.f516b <= 0 || c0140q.f639k != null) {
                    c0140q.f639k = c0114h.f517c;
                } else {
                    c0140q.f639k = m741n(c0114h);
                    if (c0114h.f522h != null) {
                        if (c0114h.f522h.f519e < 0) {
                            m656a(new IllegalStateException("Failure saving state: " + c0114h + " has target not in fragment manager: " + c0114h.f522h));
                        }
                        if (c0140q.f639k == null) {
                            c0140q.f639k = new Bundle();
                        }
                        m682a(c0140q.f639k, "android:target_state", c0114h.f522h);
                        if (c0114h.f524j != 0) {
                            c0140q.f639k.putInt("android:target_req_state", c0114h.f524j);
                        }
                    }
                }
                if (f591a) {
                    Log.v("FragmentManager", "Saved state of " + c0114h + ": " + c0140q.f639k);
                }
                z2 = true;
            } else {
                z2 = z;
            }
            i++;
            z = z2;
        }
        if (z) {
            int[] iArr;
            int i2;
            i = this.f601e.size();
            if (i > 0) {
                iArr = new int[i];
                for (i2 = 0; i2 < i; i2++) {
                    iArr[i2] = ((C0114h) this.f601e.get(i2)).f519e;
                    if (iArr[i2] < 0) {
                        m656a(new IllegalStateException("Failure saving state: active " + this.f601e.get(i2) + " has cleared index: " + iArr[i2]));
                    }
                    if (f591a) {
                        Log.v("FragmentManager", "saveAllState: adding fragment #" + i2 + ": " + this.f601e.get(i2));
                    }
                }
            } else {
                iArr = null;
            }
            if (this.f603g != null) {
                i = this.f603g.size();
                if (i > 0) {
                    c0103dArr = new C0103d[i];
                    for (i2 = 0; i2 < i; i2++) {
                        c0103dArr[i2] = new C0103d((C0101c) this.f603g.get(i2));
                        if (f591a) {
                            Log.v("FragmentManager", "saveAllState: adding back stack #" + i2 + ": " + this.f603g.get(i2));
                        }
                    }
                }
            }
            C0138p c0138p = new C0138p();
            c0138p.f624a = c0140qArr;
            c0138p.f625b = iArr;
            c0138p.f626c = c0103dArr;
            if (this.f612p != null) {
                c0138p.f627d = this.f612p.f519e;
            }
            c0138p.f628e = this.f600d;
            m731i();
            return c0138p;
        } else if (!f591a) {
            return null;
        } else {
            Log.v("FragmentManager", "saveAllState: no fragments!");
            return null;
        }
    }

    public void m734j(C0114h c0114h) {
        boolean z = false;
        if (f591a) {
            Log.v("FragmentManager", "show: " + c0114h);
        }
        if (c0114h.f540z) {
            c0114h.f540z = false;
            if (!c0114h.f511Q) {
                z = true;
            }
            c0114h.f511Q = z;
        }
    }

    public void m735k() {
        this.f595C = null;
        this.f614s = false;
        int size = this.f601e.size();
        for (int i = 0; i < size; i++) {
            C0114h c0114h = (C0114h) this.f601e.get(i);
            if (c0114h != null) {
                c0114h.m445E();
            }
        }
    }

    public void m736k(C0114h c0114h) {
        if (f591a) {
            Log.v("FragmentManager", "detach: " + c0114h);
        }
        if (!c0114h.f495A) {
            c0114h.f495A = true;
            if (c0114h.f525k) {
                if (f591a) {
                    Log.v("FragmentManager", "remove from detach: " + c0114h);
                }
                synchronized (this.f601e) {
                    this.f601e.remove(c0114h);
                }
                if (c0114h.f498D && c0114h.f499E) {
                    this.f613r = true;
                }
                c0114h.f525k = false;
            }
        }
    }

    public void m737l() {
        this.f614s = false;
        m671e(1);
    }

    public void m738l(C0114h c0114h) {
        if (f591a) {
            Log.v("FragmentManager", "attach: " + c0114h);
        }
        if (c0114h.f495A) {
            c0114h.f495A = false;
            if (!c0114h.f525k) {
                if (this.f601e.contains(c0114h)) {
                    throw new IllegalStateException("Fragment already added: " + c0114h);
                }
                if (f591a) {
                    Log.v("FragmentManager", "add from attach: " + c0114h);
                }
                synchronized (this.f601e) {
                    this.f601e.add(c0114h);
                }
                c0114h.f525k = true;
                if (c0114h.f498D && c0114h.f499E) {
                    this.f613r = true;
                }
            }
        }
    }

    public void m739m() {
        this.f614s = false;
        m671e(2);
    }

    void m740m(C0114h c0114h) {
        if (c0114h.f503I != null) {
            if (this.f593A == null) {
                this.f593A = new SparseArray();
            } else {
                this.f593A.clear();
            }
            c0114h.f503I.saveHierarchyState(this.f593A);
            if (this.f593A.size() > 0) {
                c0114h.f518d = this.f593A;
                this.f593A = null;
            }
        }
    }

    Bundle m741n(C0114h c0114h) {
        Bundle bundle;
        if (this.f621z == null) {
            this.f621z = new Bundle();
        }
        c0114h.m526m(this.f621z);
        m717d(c0114h, this.f621z, false);
        if (this.f621z.isEmpty()) {
            bundle = null;
        } else {
            bundle = this.f621z;
            this.f621z = null;
        }
        if (c0114h.f502H != null) {
            m740m(c0114h);
        }
        if (c0114h.f518d != null) {
            if (bundle == null) {
                bundle = new Bundle();
            }
            bundle.putSparseParcelableArray("android:view_state", c0114h.f518d);
        }
        if (!c0114h.f505K) {
            if (bundle == null) {
                bundle = new Bundle();
            }
            bundle.putBoolean("android:user_visible_hint", c0114h.f505K);
        }
        return bundle;
    }

    public void m742n() {
        this.f614s = false;
        m671e(4);
    }

    public void m743o() {
        this.f614s = false;
        m671e(5);
    }

    public void m744o(C0114h c0114h) {
        if (c0114h == null || (this.f602f.get(c0114h.f519e) == c0114h && (c0114h.f533s == null || c0114h.m510f() == this))) {
            this.f612p = c0114h;
            return;
        }
        throw new IllegalArgumentException("Fragment " + c0114h + " is not an active fragment of FragmentManager " + this);
    }

    public View onCreateView(View view, String str, Context context, AttributeSet attributeSet) {
        if (!"fragment".equals(str)) {
            return null;
        }
        String attributeValue = attributeSet.getAttributeValue(null, "class");
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, C0133e.f583a);
        String string = attributeValue == null ? obtainStyledAttributes.getString(0) : attributeValue;
        int resourceId = obtainStyledAttributes.getResourceId(1, -1);
        String string2 = obtainStyledAttributes.getString(2);
        obtainStyledAttributes.recycle();
        if (!C0114h.m439a(this.f609m.m555g(), string)) {
            return null;
        }
        int id = view != null ? view.getId() : 0;
        if (id == -1 && resourceId == -1 && string2 == null) {
            throw new IllegalArgumentException(attributeSet.getPositionDescription() + ": Must specify unique android:id, android:tag, or have a parent with an id for " + string);
        }
        C0114h c0114h;
        C0114h b = resourceId != -1 ? m700b(resourceId) : null;
        if (b == null && string2 != null) {
            b = m677a(string2);
        }
        if (b == null && id != -1) {
            b = m700b(id);
        }
        if (f591a) {
            Log.v("FragmentManager", "onCreateView: id=0x" + Integer.toHexString(resourceId) + " fname=" + string + " existing=" + b);
        }
        if (b == null) {
            C0114h a = this.f610n.mo41a(context, string, null);
            a.f527m = true;
            a.f537w = resourceId != 0 ? resourceId : id;
            a.f538x = id;
            a.f539y = string2;
            a.f528n = true;
            a.f532r = this;
            a.f533s = this.f609m;
            a.m476a(this.f609m.m555g(), attributeSet, a.f517c);
            m690a(a, true);
            c0114h = a;
        } else if (b.f528n) {
            throw new IllegalArgumentException(attributeSet.getPositionDescription() + ": Duplicate id 0x" + Integer.toHexString(resourceId) + ", tag " + string2 + ", or parent id 0x" + Integer.toHexString(id) + " with another fragment for " + string);
        } else {
            b.f528n = true;
            b.f533s = this.f609m;
            if (!b.f497C) {
                b.m476a(this.f609m.m555g(), attributeSet, b.f517c);
            }
            c0114h = b;
        }
        if (this.f608l >= 1 || !c0114h.f527m) {
            m703b(c0114h);
        } else {
            m686a(c0114h, 1, 0, 0, false);
        }
        if (c0114h.f502H == null) {
            throw new IllegalStateException("Fragment " + string + " did not create a view.");
        }
        if (resourceId != 0) {
            c0114h.f502H.setId(resourceId);
        }
        if (c0114h.f502H.getTag() == null) {
            c0114h.f502H.setTag(string2);
        }
        return c0114h.f502H;
    }

    public View onCreateView(String str, Context context, AttributeSet attributeSet) {
        return onCreateView(null, str, context, attributeSet);
    }

    public void m745p() {
        m671e(4);
    }

    public void m746q() {
        this.f614s = true;
        m671e(3);
    }

    public void m747r() {
        m671e(2);
    }

    public void m748s() {
        m671e(1);
    }

    public void m749t() {
        this.f615t = true;
        m721e();
        m671e(0);
        this.f609m = null;
        this.f610n = null;
        this.f611o = null;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder(128);
        stringBuilder.append("FragmentManager{");
        stringBuilder.append(Integer.toHexString(System.identityHashCode(this)));
        stringBuilder.append(" in ");
        if (this.f611o != null) {
            C0233d.m1144a(this.f611o, stringBuilder);
        } else {
            C0233d.m1144a(this.f609m, stringBuilder);
        }
        stringBuilder.append("}}");
        return stringBuilder.toString();
    }

    public void m750u() {
        for (int i = 0; i < this.f601e.size(); i++) {
            C0114h c0114h = (C0114h) this.f601e.get(i);
            if (c0114h != null) {
                c0114h.m446F();
            }
        }
    }

    public C0114h m751v() {
        return this.f612p;
    }

    Factory2 m752w() {
        return this;
    }
}
