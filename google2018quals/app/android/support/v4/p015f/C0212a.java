package android.support.v4.p015f;

import android.support.v4.p016g.C0243j;
import android.util.Base64;
import java.util.List;

public final class C0212a {
    private final String f779a;
    private final String f780b;
    private final String f781c;
    private final List<List<byte[]>> f782d;
    private final int f783e = 0;
    private final String f784f = new StringBuilder(this.f779a).append("-").append(this.f780b).append("-").append(this.f781c).toString();

    public C0212a(String str, String str2, String str3, List<List<byte[]>> list) {
        this.f779a = (String) C0243j.m1166a(str);
        this.f780b = (String) C0243j.m1166a(str2);
        this.f781c = (String) C0243j.m1166a(str3);
        this.f782d = (List) C0243j.m1166a(list);
    }

    public String m1039a() {
        return this.f779a;
    }

    public String m1040b() {
        return this.f780b;
    }

    public String m1041c() {
        return this.f781c;
    }

    public List<List<byte[]>> m1042d() {
        return this.f782d;
    }

    public int m1043e() {
        return this.f783e;
    }

    public String m1044f() {
        return this.f784f;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("FontRequest {mProviderAuthority: " + this.f779a + ", mProviderPackage: " + this.f780b + ", mQuery: " + this.f781c + ", mCertificates:");
        for (int i = 0; i < this.f782d.size(); i++) {
            stringBuilder.append(" [");
            List list = (List) this.f782d.get(i);
            for (int i2 = 0; i2 < list.size(); i2++) {
                stringBuilder.append(" \"");
                stringBuilder.append(Base64.encodeToString((byte[]) list.get(i2), 0));
                stringBuilder.append("\"");
            }
            stringBuilder.append(" ]");
        }
        stringBuilder.append("}");
        stringBuilder.append("mCertificatesArray: " + this.f783e);
        return stringBuilder.toString();
    }
}
