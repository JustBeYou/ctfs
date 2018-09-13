package com.mbppower;

import android.content.Context;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.view.SurfaceView;

/* compiled from: CameraActivity */
class CustomSurfaceView extends SurfaceView implements Callback {
    private final String TAG = "CustomSurfaceView";

    CustomSurfaceView(Context context) {
        super(context);
    }

    public void surfaceCreated(SurfaceHolder holder) {
    }

    public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
    }

    public void surfaceDestroyed(SurfaceHolder holder) {
    }
}
