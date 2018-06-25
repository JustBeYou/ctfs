package android.support.constraint.p007a.p008a;

import android.support.constraint.p007a.p008a.C0053a.C0051b;
import java.util.ArrayList;

public class C0064g {
    private int f343a;
    private int f344b;
    private int f345c;
    private int f346d;
    private ArrayList<C0063a> f347e = new ArrayList();

    static class C0063a {
        private C0053a f338a;
        private C0053a f339b;
        private int f340c;
        private C0051b f341d;
        private int f342e;

        public C0063a(C0053a c0053a) {
            this.f338a = c0053a;
            this.f339b = c0053a.m143f();
            this.f340c = c0053a.m141d();
            this.f341d = c0053a.m142e();
            this.f342e = c0053a.m145h();
        }

        public void m257a(C0056b c0056b) {
            this.f338a = c0056b.mo31a(this.f338a.m140c());
            if (this.f338a != null) {
                this.f339b = this.f338a.m143f();
                this.f340c = this.f338a.m141d();
                this.f341d = this.f338a.m142e();
                this.f342e = this.f338a.m145h();
                return;
            }
            this.f339b = null;
            this.f340c = 0;
            this.f341d = C0051b.STRONG;
            this.f342e = 0;
        }

        public void m258b(C0056b c0056b) {
            c0056b.mo31a(this.f338a.m140c()).m138a(this.f339b, this.f340c, this.f341d, this.f342e);
        }
    }

    public C0064g(C0056b c0056b) {
        this.f343a = c0056b.m184f();
        this.f344b = c0056b.m186g();
        this.f345c = c0056b.m188h();
        this.f346d = c0056b.m196l();
        ArrayList y = c0056b.mo34y();
        int size = y.size();
        for (int i = 0; i < size; i++) {
            this.f347e.add(new C0063a((C0053a) y.get(i)));
        }
    }

    public void m259a(C0056b c0056b) {
        this.f343a = c0056b.m184f();
        this.f344b = c0056b.m186g();
        this.f345c = c0056b.m188h();
        this.f346d = c0056b.m196l();
        int size = this.f347e.size();
        for (int i = 0; i < size; i++) {
            ((C0063a) this.f347e.get(i)).m257a(c0056b);
        }
    }

    public void m260b(C0056b c0056b) {
        c0056b.m168b(this.f343a);
        c0056b.m176c(this.f344b);
        c0056b.m180d(this.f345c);
        c0056b.m183e(this.f346d);
        int size = this.f347e.size();
        for (int i = 0; i < size; i++) {
            ((C0063a) this.f347e.get(i)).m258b(c0056b);
        }
    }
}
