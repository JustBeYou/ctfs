package android.support.v4.p017h;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.os.Build.VERSION;
import android.view.View;
import android.view.animation.Interpolator;
import java.lang.ref.WeakReference;

public final class C0324r {
    Runnable f945a = null;
    Runnable f946b = null;
    int f947c = -1;
    private WeakReference<View> f948d;

    static class C0323a implements C0322s {
        C0324r f943a;
        boolean f944b;

        C0323a(C0324r c0324r) {
            this.f943a = c0324r;
        }

        public void mo155a(View view) {
            this.f944b = false;
            if (this.f943a.f947c > -1) {
                view.setLayerType(2, null);
            }
            if (this.f943a.f945a != null) {
                Runnable runnable = this.f943a.f945a;
                this.f943a.f945a = null;
                runnable.run();
            }
            Object tag = view.getTag(2113929216);
            C0322s c0322s = tag instanceof C0322s ? (C0322s) tag : null;
            if (c0322s != null) {
                c0322s.mo155a(view);
            }
        }

        public void mo156b(View view) {
            if (this.f943a.f947c > -1) {
                view.setLayerType(this.f943a.f947c, null);
                this.f943a.f947c = -1;
            }
            if (VERSION.SDK_INT >= 16 || !this.f944b) {
                if (this.f943a.f946b != null) {
                    Runnable runnable = this.f943a.f946b;
                    this.f943a.f946b = null;
                    runnable.run();
                }
                Object tag = view.getTag(2113929216);
                C0322s c0322s = tag instanceof C0322s ? (C0322s) tag : null;
                if (c0322s != null) {
                    c0322s.mo156b(view);
                }
                this.f944b = true;
            }
        }

        public void mo157c(View view) {
            Object tag = view.getTag(2113929216);
            C0322s c0322s = tag instanceof C0322s ? (C0322s) tag : null;
            if (c0322s != null) {
                c0322s.mo157c(view);
            }
        }
    }

    C0324r(View view) {
        this.f948d = new WeakReference(view);
    }

    private void m1427a(final View view, final C0322s c0322s) {
        if (c0322s != null) {
            view.animate().setListener(new AnimatorListenerAdapter(this) {
                final /* synthetic */ C0324r f939c;

                public void onAnimationCancel(Animator animator) {
                    c0322s.mo157c(view);
                }

                public void onAnimationEnd(Animator animator) {
                    c0322s.mo156b(view);
                }

                public void onAnimationStart(Animator animator) {
                    c0322s.mo155a(view);
                }
            });
        } else {
            view.animate().setListener(null);
        }
    }

    public long m1428a() {
        View view = (View) this.f948d.get();
        return view != null ? view.animate().getDuration() : 0;
    }

    public C0324r m1429a(float f) {
        View view = (View) this.f948d.get();
        if (view != null) {
            view.animate().alpha(f);
        }
        return this;
    }

    public C0324r m1430a(long j) {
        View view = (View) this.f948d.get();
        if (view != null) {
            view.animate().setDuration(j);
        }
        return this;
    }

    public C0324r m1431a(C0322s c0322s) {
        View view = (View) this.f948d.get();
        if (view != null) {
            if (VERSION.SDK_INT >= 16) {
                m1427a(view, c0322s);
            } else {
                view.setTag(2113929216, c0322s);
                m1427a(view, new C0323a(this));
            }
        }
        return this;
    }

    public C0324r m1432a(final C0326u c0326u) {
        final View view = (View) this.f948d.get();
        if (view != null && VERSION.SDK_INT >= 19) {
            AnimatorUpdateListener animatorUpdateListener = null;
            if (c0326u != null) {
                animatorUpdateListener = new AnimatorUpdateListener(this) {
                    final /* synthetic */ C0324r f942c;

                    public void onAnimationUpdate(ValueAnimator valueAnimator) {
                        c0326u.mo343a(view);
                    }
                };
            }
            view.animate().setUpdateListener(animatorUpdateListener);
        }
        return this;
    }

    public C0324r m1433a(Interpolator interpolator) {
        View view = (View) this.f948d.get();
        if (view != null) {
            view.animate().setInterpolator(interpolator);
        }
        return this;
    }

    public C0324r m1434b(float f) {
        View view = (View) this.f948d.get();
        if (view != null) {
            view.animate().translationY(f);
        }
        return this;
    }

    public C0324r m1435b(long j) {
        View view = (View) this.f948d.get();
        if (view != null) {
            view.animate().setStartDelay(j);
        }
        return this;
    }

    public void m1436b() {
        View view = (View) this.f948d.get();
        if (view != null) {
            view.animate().cancel();
        }
    }

    public void m1437c() {
        View view = (View) this.f948d.get();
        if (view != null) {
            view.animate().start();
        }
    }
}
