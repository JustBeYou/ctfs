package com.google.ctf.shallweplayagame;

import android.media.ToneGenerator;
import android.os.Handler;

public class C0652b {
    static final ToneGenerator f2357a = new ToneGenerator(3, 100);

    static class C06501 implements Runnable {
        C06501() {
        }

        public void run() {
            C0652b.f2357a.startTone(24, 100);
        }
    }

    static class C06512 implements Runnable {
        C06512() {
        }

        public void run() {
            C0652b.f2357a.startTone(49, 100);
        }
    }

    static void m3224a() {
        new Handler().post(new C06501());
    }

    static void m3225b() {
        new Handler().post(new C06512());
    }
}
