package android.support.v4.p009b;

import android.support.v4.p016g.C0233d;
import java.io.FileDescriptor;
import java.io.PrintWriter;

public class C0172b<D> {
    int f726a;
    C0158b<D> f727b;
    C0157a<D> f728c;
    boolean f729d;
    boolean f730e;
    boolean f731f;
    boolean f732g;
    boolean f733h;

    public interface C0157a<D> {
    }

    public interface C0158b<D> {
    }

    public String m880a(D d) {
        StringBuilder stringBuilder = new StringBuilder(64);
        C0233d.m1144a(d, stringBuilder);
        stringBuilder.append("}");
        return stringBuilder.toString();
    }

    public final void m881a() {
        this.f729d = true;
        this.f731f = false;
        this.f730e = false;
        m886b();
    }

    public void m882a(int i, C0158b<D> c0158b) {
        if (this.f727b != null) {
            throw new IllegalStateException("There is already a listener registered");
        }
        this.f727b = c0158b;
        this.f726a = i;
    }

    public void m883a(C0157a<D> c0157a) {
        if (this.f728c != null) {
            throw new IllegalStateException("There is already a listener registered");
        }
        this.f728c = c0157a;
    }

    public void m884a(C0158b<D> c0158b) {
        if (this.f727b == null) {
            throw new IllegalStateException("No listener register");
        } else if (this.f727b != c0158b) {
            throw new IllegalArgumentException("Attempting to unregister the wrong listener");
        } else {
            this.f727b = null;
        }
    }

    public void m885a(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        printWriter.print(str);
        printWriter.print("mId=");
        printWriter.print(this.f726a);
        printWriter.print(" mListener=");
        printWriter.println(this.f727b);
        if (this.f729d || this.f732g || this.f733h) {
            printWriter.print(str);
            printWriter.print("mStarted=");
            printWriter.print(this.f729d);
            printWriter.print(" mContentChanged=");
            printWriter.print(this.f732g);
            printWriter.print(" mProcessingChange=");
            printWriter.println(this.f733h);
        }
        if (this.f730e || this.f731f) {
            printWriter.print(str);
            printWriter.print("mAbandoned=");
            printWriter.print(this.f730e);
            printWriter.print(" mReset=");
            printWriter.println(this.f731f);
        }
    }

    protected void m886b() {
    }

    public void m887b(C0157a<D> c0157a) {
        if (this.f728c == null) {
            throw new IllegalStateException("No listener register");
        } else if (this.f728c != c0157a) {
            throw new IllegalArgumentException("Attempting to unregister the wrong listener");
        } else {
            this.f728c = null;
        }
    }

    public void m888c() {
        this.f729d = false;
        m889d();
    }

    protected void m889d() {
    }

    public void m890e() {
        m891f();
        this.f731f = true;
        this.f729d = false;
        this.f730e = false;
        this.f732g = false;
        this.f733h = false;
    }

    protected void m891f() {
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder(64);
        C0233d.m1144a(this, stringBuilder);
        stringBuilder.append(" id=");
        stringBuilder.append(this.f726a);
        stringBuilder.append("}");
        return stringBuilder.toString();
    }
}
