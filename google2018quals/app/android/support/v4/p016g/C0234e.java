package android.support.v4.p016g;

import android.util.Log;
import java.io.Writer;

public class C0234e extends Writer {
    private final String f853a;
    private StringBuilder f854b = new StringBuilder(128);

    public C0234e(String str) {
        this.f853a = str;
    }

    private void m1145a() {
        if (this.f854b.length() > 0) {
            Log.d(this.f853a, this.f854b.toString());
            this.f854b.delete(0, this.f854b.length());
        }
    }

    public void close() {
        m1145a();
    }

    public void flush() {
        m1145a();
    }

    public void write(char[] cArr, int i, int i2) {
        for (int i3 = 0; i3 < i2; i3++) {
            char c = cArr[i + i3];
            if (c == '\n') {
                m1145a();
            } else {
                this.f854b.append(c);
            }
        }
    }
}
