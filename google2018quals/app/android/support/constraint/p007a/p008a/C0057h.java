package android.support.constraint.p007a.p008a;

import android.support.constraint.p007a.C0067c;
import java.util.ArrayList;

public class C0057h extends C0056b {
    protected ArrayList<C0056b> aj = new ArrayList();

    public void mo30F() {
        mo28z();
        if (this.aj != null) {
            int size = this.aj.size();
            for (int i = 0; i < size; i++) {
                C0056b c0056b = (C0056b) this.aj.get(i);
                if (c0056b instanceof C0057h) {
                    ((C0057h) c0056b).mo30F();
                }
            }
        }
    }

    public C0058c m213H() {
        C0058c c0058c;
        C0056b c0056b;
        C0056b c = m174c();
        if (this instanceof C0058c) {
            c0058c = (C0058c) this;
            c0056b = c;
        } else {
            c0058c = null;
            c0056b = c;
        }
        while (c0056b != null) {
            c = c0056b.m174c();
            if (c0056b instanceof C0058c) {
                c0058c = (C0058c) c0056b;
                c0056b = c;
            } else {
                c0056b = c;
            }
        }
        return c0058c;
    }

    public void m214I() {
        this.aj.clear();
    }

    public void mo25a() {
        this.aj.clear();
        super.mo25a();
    }

    public void mo26a(C0067c c0067c) {
        super.mo26a(c0067c);
        int size = this.aj.size();
        for (int i = 0; i < size; i++) {
            ((C0056b) this.aj.get(i)).mo26a(c0067c);
        }
    }

    public void mo27b(int i, int i2) {
        super.mo27b(i, i2);
        int size = this.aj.size();
        for (int i3 = 0; i3 < size; i3++) {
            ((C0056b) this.aj.get(i3)).mo27b(m203r(), m204s());
        }
    }

    public void m218b(C0056b c0056b) {
        this.aj.add(c0056b);
        if (c0056b.m174c() != null) {
            ((C0057h) c0056b.m174c()).m219c(c0056b);
        }
        c0056b.m162a((C0056b) this);
    }

    public void m219c(C0056b c0056b) {
        this.aj.remove(c0056b);
        c0056b.m162a(null);
    }

    public void mo28z() {
        super.mo28z();
        if (this.aj != null) {
            int size = this.aj.size();
            for (int i = 0; i < size; i++) {
                C0056b c0056b = (C0056b) this.aj.get(i);
                c0056b.mo27b(m199n(), m200o());
                if (!(c0056b instanceof C0058c)) {
                    c0056b.mo28z();
                }
            }
        }
    }
}
