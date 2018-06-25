package android.support.v4.p010a;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Parcelable;
import android.support.v4.p016g.C0228k;
import android.util.AttributeSet;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import java.io.FileDescriptor;
import java.io.PrintWriter;

public class C0120k {
    private final C0116l<?> f565a;

    private C0120k(C0116l<?> c0116l) {
        this.f565a = c0116l;
    }

    public static final C0120k m583a(C0116l<?> c0116l) {
        return new C0120k(c0116l);
    }

    public C0114h m584a(String str) {
        return this.f565a.f545d.m701b(str);
    }

    public C0123m m585a() {
        return this.f565a.m557i();
    }

    public View m586a(View view, String str, Context context, AttributeSet attributeSet) {
        return this.f565a.f545d.onCreateView(view, str, context, attributeSet);
    }

    public void m587a(Configuration configuration) {
        this.f565a.f545d.m681a(configuration);
    }

    public void m588a(Parcelable parcelable, C0136o c0136o) {
        this.f565a.f545d.m683a(parcelable, c0136o);
    }

    public void m589a(C0114h c0114h) {
        this.f565a.f545d.m691a(this.f565a, this.f565a, c0114h);
    }

    public void m590a(C0228k<String, C0156u> c0228k) {
        this.f565a.m542a((C0228k) c0228k);
    }

    public void m591a(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        this.f565a.m550b(str, fileDescriptor, printWriter, strArr);
    }

    public void m592a(boolean z) {
        this.f565a.f545d.m693a(z);
    }

    public boolean m593a(Menu menu) {
        return this.f565a.f545d.m696a(menu);
    }

    public boolean m594a(Menu menu, MenuInflater menuInflater) {
        return this.f565a.f545d.m697a(menu, menuInflater);
    }

    public boolean m595a(MenuItem menuItem) {
        return this.f565a.f545d.m698a(menuItem);
    }

    public void m596b() {
        this.f565a.f545d.m735k();
    }

    public void m597b(Menu menu) {
        this.f565a.f545d.m707b(menu);
    }

    public void m598b(boolean z) {
        this.f565a.f545d.m708b(z);
    }

    public boolean m599b(MenuItem menuItem) {
        return this.f565a.f545d.m709b(menuItem);
    }

    public Parcelable m600c() {
        return this.f565a.f545d.m733j();
    }

    public void m601c(boolean z) {
        this.f565a.m545a(z);
    }

    public C0136o m602d() {
        return this.f565a.f545d.m728h();
    }

    public void m603e() {
        this.f565a.f545d.m737l();
    }

    public void m604f() {
        this.f565a.f545d.m739m();
    }

    public void m605g() {
        this.f565a.f545d.m742n();
    }

    public void m606h() {
        this.f565a.f545d.m743o();
    }

    public void m607i() {
        this.f565a.f545d.m745p();
    }

    public void m608j() {
        this.f565a.f545d.m746q();
    }

    public void m609k() {
        this.f565a.f545d.m747r();
    }

    public void m610l() {
        this.f565a.f545d.m749t();
    }

    public void m611m() {
        this.f565a.f545d.m750u();
    }

    public boolean m612n() {
        return this.f565a.f545d.m721e();
    }

    public void m613o() {
        this.f565a.m559k();
    }

    public void m614p() {
        this.f565a.m560l();
    }

    public void m615q() {
        this.f565a.m561m();
    }

    public C0228k<String, C0156u> m616r() {
        return this.f565a.m562n();
    }
}
