package com.mbppower;

import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;

/* compiled from: CameraActivity */
class TapGestureDetector extends SimpleOnGestureListener {
    TapGestureDetector() {
    }

    public boolean onDown(MotionEvent e) {
        return false;
    }

    public boolean onSingleTapUp(MotionEvent e) {
        return true;
    }

    public boolean onSingleTapConfirmed(MotionEvent e) {
        return true;
    }
}
