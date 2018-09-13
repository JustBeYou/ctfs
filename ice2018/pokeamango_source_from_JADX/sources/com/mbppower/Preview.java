package com.mbppower;

import android.app.Activity;
import android.content.Context;
import android.graphics.Rect;
import android.graphics.YuvImage;
import android.hardware.Camera;
import android.hardware.Camera.CameraInfo;
import android.hardware.Camera.Parameters;
import android.hardware.Camera.PreviewCallback;
import android.hardware.Camera.Size;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.view.View;
import android.widget.RelativeLayout;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;
import org.apache.cordova.CordovaResourceApi;
import org.apache.cordova.LOG;

/* compiled from: CameraActivity */
class Preview extends RelativeLayout implements Callback {
    private final String TAG = "Preview";
    int cameraId;
    int displayOrientation;
    Camera mCamera;
    SurfaceHolder mHolder;
    Size mPreviewSize;
    List<Size> mSupportedPreviewSizes;
    CustomSurfaceView mSurfaceView;

    Preview(Context context) {
        super(context);
        this.mSurfaceView = new CustomSurfaceView(context);
        addView(this.mSurfaceView);
        requestLayout();
        this.mHolder = this.mSurfaceView.getHolder();
        this.mHolder.addCallback(this);
        this.mHolder.setType(3);
    }

    public void setCamera(Camera camera, int cameraId) {
        this.mCamera = camera;
        this.cameraId = cameraId;
        if (this.mCamera != null) {
            this.mSupportedPreviewSizes = this.mCamera.getParameters().getSupportedPreviewSizes();
            setCameraDisplayOrientation();
        }
    }

    public int getDisplayOrientation() {
        return this.displayOrientation;
    }

    private void setCameraDisplayOrientation() {
        CameraInfo info = new CameraInfo();
        int rotation = ((Activity) getContext()).getWindowManager().getDefaultDisplay().getRotation();
        int degrees = 0;
        DisplayMetrics dm = new DisplayMetrics();
        Camera.getCameraInfo(this.cameraId, info);
        ((Activity) getContext()).getWindowManager().getDefaultDisplay().getMetrics(dm);
        switch (rotation) {
            case CordovaResourceApi.URI_TYPE_FILE /*0*/:
                degrees = 0;
                break;
            case 1:
                degrees = 90;
                break;
            case 2:
                degrees = 180;
                break;
            case 3:
                degrees = 270;
                break;
        }
        if (info.facing == 1) {
            this.displayOrientation = (info.orientation + degrees) % 360;
            this.displayOrientation = (360 - this.displayOrientation) % 360;
        } else {
            this.displayOrientation = ((info.orientation - degrees) + 360) % 360;
        }
        Log.d("Preview", "screen is rotated " + degrees + "deg from natural");
        Log.d("Preview", (info.facing == 1 ? "front" : "back") + " camera is oriented -" + info.orientation + "deg from natural");
        Log.d("Preview", "need to rotate preview " + this.displayOrientation + "deg");
        this.mCamera.setDisplayOrientation(this.displayOrientation);
    }

    public void switchCamera(Camera camera, int cameraId) {
        setCamera(camera, cameraId);
        try {
            camera.setPreviewDisplay(this.mHolder);
            Parameters parameters = camera.getParameters();
            parameters.setPreviewSize(this.mPreviewSize.width, this.mPreviewSize.height);
            camera.setParameters(parameters);
        } catch (IOException exception) {
            Log.e("Preview", exception.getMessage());
        }
    }

    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int width = resolveSize(getSuggestedMinimumWidth(), widthMeasureSpec);
        int height = resolveSize(getSuggestedMinimumHeight(), heightMeasureSpec);
        setMeasuredDimension(width, height);
        if (this.mSupportedPreviewSizes != null) {
            this.mPreviewSize = getOptimalPreviewSize(this.mSupportedPreviewSizes, width, height);
        }
    }

    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        if (changed && getChildCount() > 0) {
            int nW;
            int nH;
            int top;
            int left;
            View child = getChildAt(0);
            int width = r - l;
            int height = b - t;
            int previewWidth = width;
            int previewHeight = height;
            if (this.mPreviewSize != null) {
                previewWidth = this.mPreviewSize.width;
                previewHeight = this.mPreviewSize.height;
                if (this.displayOrientation == 90 || this.displayOrientation == 270) {
                    previewWidth = this.mPreviewSize.height;
                    previewHeight = this.mPreviewSize.width;
                }
                LOG.m0d("Preview", "previewWidth:" + previewWidth + " previewHeight:" + previewHeight);
            }
            if (width * previewHeight < height * previewWidth) {
                Log.d("Preview", "center horizontally");
                int scaledChildWidth = (int) (((float) ((previewWidth * height) / previewHeight)) * 1.0f);
                nW = (width + scaledChildWidth) / 2;
                nH = (int) (((float) height) * 1.0f);
                top = 0;
                left = (width - scaledChildWidth) / 2;
            } else {
                Log.d("Preview", "center vertically");
                int scaledChildHeight = (int) (((float) ((previewHeight * width) / previewWidth)) * 1.0f);
                nW = (int) (((float) width) * 1.0f);
                nH = (height + scaledChildHeight) / 2;
                top = (height - scaledChildHeight) / 2;
                left = 0;
            }
            child.layout(left, top, nW, nH);
            Log.d("layout", "left:" + left);
            Log.d("layout", "top:" + top);
            Log.d("layout", "right:" + nW);
            Log.d("layout", "bottom:" + nH);
        }
    }

    public void surfaceCreated(SurfaceHolder holder) {
        try {
            if (this.mCamera != null) {
                this.mSurfaceView.setWillNotDraw(false);
                this.mCamera.setPreviewDisplay(holder);
            }
        } catch (IOException exception) {
            Log.e("Preview", "IOException caused by setPreviewDisplay()", exception);
        }
    }

    public void surfaceDestroyed(SurfaceHolder holder) {
        if (this.mCamera != null) {
            this.mCamera.stopPreview();
        }
    }

    private Size getOptimalPreviewSize(List<Size> sizes, int w, int h) {
        double targetRatio = ((double) w) / ((double) h);
        if (this.displayOrientation == 90 || this.displayOrientation == 270) {
            targetRatio = ((double) h) / ((double) w);
        }
        if (sizes == null) {
            return null;
        }
        Size optimalSize = null;
        double minDiff = Double.MAX_VALUE;
        int targetHeight = h;
        for (Size size : sizes) {
            if (Math.abs((((double) size.width) / ((double) size.height)) - targetRatio) <= 0.1d && ((double) Math.abs(size.height - targetHeight)) < minDiff) {
                optimalSize = size;
                minDiff = (double) Math.abs(size.height - targetHeight);
            }
        }
        if (optimalSize == null) {
            minDiff = Double.MAX_VALUE;
            for (Size size2 : sizes) {
                if (((double) Math.abs(size2.height - targetHeight)) < minDiff) {
                    optimalSize = size2;
                    minDiff = (double) Math.abs(size2.height - targetHeight);
                }
            }
        }
        Log.d("Preview", "optimal preview size: w: " + optimalSize.width + " h: " + optimalSize.height);
        return optimalSize;
    }

    public void surfaceChanged(SurfaceHolder holder, int format, int w, int h) {
        if (this.mCamera != null) {
            Parameters parameters = this.mCamera.getParameters();
            parameters.setPreviewSize(this.mPreviewSize.width, this.mPreviewSize.height);
            requestLayout();
            this.mCamera.setParameters(parameters);
            this.mCamera.startPreview();
        }
    }

    public byte[] getFramePicture(byte[] data, Camera camera) {
        Parameters parameters = camera.getParameters();
        int format = parameters.getPreviewFormat();
        if (format != 17 && format != 20 && format != 16) {
            return data;
        }
        int w = parameters.getPreviewSize().width;
        int h = parameters.getPreviewSize().height;
        YuvImage yuvImage = new YuvImage(data, format, w, h, null);
        Rect rect = new Rect(0, 0, w, h);
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        yuvImage.compressToJpeg(rect, 80, outputStream);
        return outputStream.toByteArray();
    }

    public void setOneShotPreviewCallback(PreviewCallback callback) {
        if (this.mCamera != null) {
            this.mCamera.setOneShotPreviewCallback(callback);
        }
    }
}
