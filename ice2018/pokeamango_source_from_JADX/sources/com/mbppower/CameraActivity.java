package com.mbppower;

import android.app.Fragment;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.hardware.Camera;
import android.hardware.Camera.CameraInfo;
import android.hardware.Camera.Parameters;
import android.hardware.Camera.PreviewCallback;
import android.os.Bundle;
import android.util.Log;
import android.view.GestureDetector;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.cordova.CordovaResourceApi;

public class CameraActivity extends Fragment {
    private static final String TAG = "CameraActivity";
    private String appResourcesPackage;
    private int cameraCurrentlyLocked;
    private Parameters cameraParameters;
    private boolean canTakePicture = true;
    public String defaultCamera;
    private int defaultCameraId;
    public boolean dragEnabled;
    private CameraPreviewListener eventListener;
    public FrameLayout frameContainerLayout;
    public int height;
    private Camera mCamera;
    private Preview mPreview;
    public FrameLayout mainLayout;
    private int numberOfCameras;
    public boolean tapToTakePicture;
    private View view;
    public int width;
    /* renamed from: x */
    public int f0x;
    /* renamed from: y */
    public int f1y;

    public interface CameraPreviewListener {
        void onPictureTaken(String str, String str2);
    }

    public void setEventListener(CameraPreviewListener listener) {
        this.eventListener = listener;
    }

    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        this.appResourcesPackage = getActivity().getPackageName();
        this.view = inflater.inflate(getResources().getIdentifier("camera_activity", "layout", this.appResourcesPackage), container, false);
        createCameraPreview();
        return this.view;
    }

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    public void setRect(int x, int y, int width, int height) {
        this.f0x = x;
        this.f1y = y;
        this.width = width;
        this.height = height;
    }

    private void createCameraPreview() {
        if (this.mPreview == null) {
            setDefaultCameraId();
            LayoutParams layoutParams = new LayoutParams(this.width, this.height);
            layoutParams.setMargins(this.f0x, this.f1y, 0, 0);
            this.frameContainerLayout = (FrameLayout) this.view.findViewById(getResources().getIdentifier("frame_container", "id", this.appResourcesPackage));
            this.frameContainerLayout.setLayoutParams(layoutParams);
            this.mPreview = new Preview(getActivity());
            this.mainLayout = (FrameLayout) this.view.findViewById(getResources().getIdentifier("video_view", "id", this.appResourcesPackage));
            this.mainLayout.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
            this.mainLayout.addView(this.mPreview);
            this.mainLayout.setEnabled(false);
            final GestureDetector gestureDetector = new GestureDetector(getActivity().getApplicationContext(), new TapGestureDetector());
            getActivity().runOnUiThread(new Runnable() {

                /* renamed from: com.mbppower.CameraActivity$1$1 */
                class C00001 implements OnTouchListener {
                    private int mLastTouchX;
                    private int mLastTouchY;
                    private int mPosX = 0;
                    private int mPosY = 0;

                    C00001() {
                    }

                    public boolean onTouch(View v, MotionEvent event) {
                        LayoutParams layoutParams = (LayoutParams) CameraActivity.this.frameContainerLayout.getLayoutParams();
                        boolean isSingleTapTouch = gestureDetector.onTouchEvent(event);
                        if (event.getAction() == 2 || !isSingleTapTouch) {
                            if (CameraActivity.this.dragEnabled) {
                                switch (event.getAction()) {
                                    case CordovaResourceApi.URI_TYPE_FILE /*0*/:
                                        if (this.mLastTouchX != 0 && this.mLastTouchY != 0) {
                                            this.mLastTouchX = (int) event.getRawX();
                                            this.mLastTouchY = (int) event.getRawY();
                                            break;
                                        }
                                        this.mLastTouchX = ((int) event.getRawX()) - layoutParams.leftMargin;
                                        this.mLastTouchY = ((int) event.getRawY()) - layoutParams.topMargin;
                                        break;
                                        break;
                                    case 2:
                                        int x = (int) event.getRawX();
                                        int y = (int) event.getRawY();
                                        float dy = (float) (y - this.mLastTouchY);
                                        this.mPosX = (int) (((float) this.mPosX) + ((float) (x - this.mLastTouchX)));
                                        this.mPosY = (int) (((float) this.mPosY) + dy);
                                        layoutParams.leftMargin = this.mPosX;
                                        layoutParams.topMargin = this.mPosY;
                                        CameraActivity.this.frameContainerLayout.setLayoutParams(layoutParams);
                                        this.mLastTouchX = x;
                                        this.mLastTouchY = y;
                                        break;
                                    default:
                                        break;
                                }
                            }
                        } else if (CameraActivity.this.tapToTakePicture) {
                            CameraActivity.this.takePicture(0.0d, 0.0d);
                        }
                        return true;
                    }
                }

                public void run() {
                    CameraActivity.this.frameContainerLayout.setClickable(true);
                    CameraActivity.this.frameContainerLayout.setOnTouchListener(new C00001());
                }
            });
        }
    }

    private void setDefaultCameraId() {
        this.numberOfCameras = Camera.getNumberOfCameras();
        int camId = this.defaultCamera.equals("front") ? 1 : 0;
        CameraInfo cameraInfo = new CameraInfo();
        for (int i = 0; i < this.numberOfCameras; i++) {
            Camera.getCameraInfo(i, cameraInfo);
            if (cameraInfo.facing == camId) {
                this.defaultCameraId = camId;
                return;
            }
        }
    }

    public void onResume() {
        super.onResume();
        this.mCamera = Camera.open(this.defaultCameraId);
        if (this.cameraParameters != null) {
            this.mCamera.setParameters(this.cameraParameters);
        }
        this.cameraCurrentlyLocked = this.defaultCameraId;
        if (this.mPreview.mPreviewSize == null) {
            this.mPreview.setCamera(this.mCamera, this.cameraCurrentlyLocked);
        } else {
            this.mPreview.switchCamera(this.mCamera, this.cameraCurrentlyLocked);
            this.mCamera.startPreview();
        }
        Log.d(TAG, "cameraCurrentlyLocked:" + this.cameraCurrentlyLocked);
        final FrameLayout frameContainerLayout = (FrameLayout) this.view.findViewById(getResources().getIdentifier("frame_container", "id", this.appResourcesPackage));
        ViewTreeObserver viewTreeObserver = frameContainerLayout.getViewTreeObserver();
        if (viewTreeObserver.isAlive()) {
            viewTreeObserver.addOnGlobalLayoutListener(new OnGlobalLayoutListener() {
                public void onGlobalLayout() {
                    frameContainerLayout.getViewTreeObserver().removeGlobalOnLayoutListener(this);
                    frameContainerLayout.measure(0, 0);
                    RelativeLayout frameCamContainerLayout = (RelativeLayout) CameraActivity.this.view.findViewById(CameraActivity.this.getResources().getIdentifier("frame_camera_cont", "id", CameraActivity.this.appResourcesPackage));
                    LayoutParams camViewLayout = new LayoutParams(frameContainerLayout.getWidth(), frameContainerLayout.getHeight());
                    camViewLayout.gravity = 17;
                    frameCamContainerLayout.setLayoutParams(camViewLayout);
                }
            });
        }
    }

    public void onPause() {
        super.onPause();
        if (this.mCamera != null) {
            this.mPreview.setCamera(null, -1);
            this.mCamera.release();
            this.mCamera = null;
        }
    }

    public Camera getCamera() {
        return this.mCamera;
    }

    public void switchCamera() {
        if (this.numberOfCameras == 1) {
            Log.d(TAG, "numberOfCameras: " + this.numberOfCameras);
        } else {
            Log.d(TAG, "numberOfCameras: " + this.numberOfCameras);
        }
        if (this.mCamera != null) {
            this.mCamera.stopPreview();
            this.mPreview.setCamera(null, -1);
            this.mCamera.release();
            this.mCamera = null;
        }
        this.mCamera = Camera.open((this.cameraCurrentlyLocked + 1) % this.numberOfCameras);
        if (this.cameraParameters != null) {
            this.mCamera.setParameters(this.cameraParameters);
        }
        this.cameraCurrentlyLocked = (this.cameraCurrentlyLocked + 1) % this.numberOfCameras;
        this.mPreview.switchCamera(this.mCamera, this.cameraCurrentlyLocked);
        Log.d(TAG, "cameraCurrentlyLocked new: " + this.cameraCurrentlyLocked);
        this.mCamera.startPreview();
    }

    public void setCameraParameters(Parameters params) {
        this.cameraParameters = params;
        if (this.mCamera != null && this.cameraParameters != null) {
            this.mCamera.setParameters(this.cameraParameters);
        }
    }

    public boolean hasFrontCamera() {
        return getActivity().getApplicationContext().getPackageManager().hasSystemFeature("android.hardware.camera.front");
    }

    public Bitmap cropBitmap(Bitmap bitmap, Rect rect) {
        Bitmap ret = Bitmap.createBitmap(rect.right - rect.left, rect.bottom - rect.top, bitmap.getConfig());
        new Canvas(ret).drawBitmap(bitmap, (float) (-rect.left), (float) (-rect.top), null);
        return ret;
    }

    public void takePicture(double maxWidth, double maxHeight) {
        final ImageView pictureView = (ImageView) this.view.findViewById(getResources().getIdentifier("picture_view", "id", this.appResourcesPackage));
        if (this.mPreview == null) {
            this.canTakePicture = true;
        } else if (this.canTakePicture) {
            this.canTakePicture = false;
            final double d = maxWidth;
            final double d2 = maxHeight;
            this.mPreview.setOneShotPreviewCallback(new PreviewCallback() {
                public void onPreviewFrame(final byte[] data, final Camera camera) {
                    new Thread() {
                        public void run() {
                            byte[] bytes = CameraActivity.this.mPreview.getFramePicture(data, camera);
                            final Bitmap pic = BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
                            float scale = ((float) pictureView.getWidth()) / ((float) pic.getWidth());
                            Bitmap scaledBitmap = Bitmap.createScaledBitmap(pic, (int) (((float) pic.getWidth()) * scale), (int) (((float) pic.getHeight()) * scale), false);
                            Matrix matrix = new Matrix();
                            if (CameraActivity.this.cameraCurrentlyLocked == 1) {
                                Log.d(CameraActivity.TAG, "mirror y axis");
                                matrix.preScale(-1.0f, 1.0f);
                            }
                            Log.d(CameraActivity.TAG, "preRotate " + CameraActivity.this.mPreview.getDisplayOrientation() + "deg");
                            matrix.postRotate((float) CameraActivity.this.mPreview.getDisplayOrientation());
                            final Bitmap fixedPic = Bitmap.createBitmap(scaledBitmap, 0, 0, scaledBitmap.getWidth(), scaledBitmap.getHeight(), matrix, false);
                            final Rect rect = new Rect(CameraActivity.this.mPreview.mSurfaceView.getLeft(), CameraActivity.this.mPreview.mSurfaceView.getTop(), CameraActivity.this.mPreview.mSurfaceView.getRight(), CameraActivity.this.mPreview.mSurfaceView.getBottom());
                            final Matrix matrix2 = matrix;
                            CameraActivity.this.getActivity().runOnUiThread(new Runnable() {
                                public void run() {
                                    Bitmap finalPic;
                                    pictureView.setImageBitmap(fixedPic);
                                    pictureView.layout(rect.left, rect.top, rect.right, rect.bottom);
                                    if (d <= 0.0d || d2 <= 0.0d) {
                                        finalPic = pic;
                                    } else {
                                        double scale;
                                        double scaleHeight = d / ((double) pic.getHeight());
                                        double scaleWidth = d2 / ((double) pic.getWidth());
                                        if (scaleHeight < scaleWidth) {
                                            scale = scaleWidth;
                                        } else {
                                            scale = scaleHeight;
                                        }
                                        finalPic = Bitmap.createScaledBitmap(pic, (int) (((double) pic.getWidth()) * scale), (int) (((double) pic.getHeight()) * scale), false);
                                    }
                                    Bitmap originalPicture = Bitmap.createBitmap(finalPic, 0, 0, finalPic.getWidth(), finalPic.getHeight(), matrix2, false);
                                    Bitmap picture = CameraActivity.this.loadBitmapFromView(CameraActivity.this.view.findViewById(CameraActivity.this.getResources().getIdentifier("frame_camera_cont", "id", CameraActivity.this.appResourcesPackage)));
                                    picture.compress(CompressFormat.PNG, 80, new ByteArrayOutputStream());
                                    CameraActivity.this.generatePictureFromView(originalPicture, picture);
                                    CameraActivity.this.canTakePicture = true;
                                }
                            });
                        }
                    }.start();
                }
            });
        }
    }

    private void generatePictureFromView(Bitmap originalPicture, Bitmap picture) {
        final FrameLayout cameraLoader = (FrameLayout) this.view.findViewById(getResources().getIdentifier("camera_loader", "id", this.appResourcesPackage));
        cameraLoader.setVisibility(0);
        final ImageView pictureView = (ImageView) this.view.findViewById(getResources().getIdentifier("picture_view", "id", this.appResourcesPackage));
        final Bitmap bitmap = picture;
        final Bitmap bitmap2 = originalPicture;
        new Thread() {

            /* renamed from: com.mbppower.CameraActivity$4$1 */
            class C00061 implements Runnable {
                C00061() {
                }

                public void run() {
                    cameraLoader.setVisibility(4);
                    pictureView.setImageBitmap(null);
                }
            }

            /* renamed from: com.mbppower.CameraActivity$4$2 */
            class C00072 implements Runnable {
                C00072() {
                }

                public void run() {
                    cameraLoader.setVisibility(4);
                    pictureView.setImageBitmap(null);
                }
            }

            public void run() {
                try {
                    File picFile = CameraActivity.this.storeImage(bitmap, "_preview");
                    CameraActivity.this.eventListener.onPictureTaken(CameraActivity.this.storeImage(bitmap2, "_original").getAbsolutePath(), picFile.getAbsolutePath());
                    CameraActivity.this.getActivity().runOnUiThread(new C00061());
                } catch (Exception e) {
                    CameraActivity.this.getActivity().runOnUiThread(new C00072());
                }
            }
        }.start();
    }

    private File getOutputMediaFile(String suffix) {
        File mediaStorageDir = getActivity().getApplicationContext().getFilesDir();
        if (!mediaStorageDir.exists() && !mediaStorageDir.mkdirs()) {
            return null;
        }
        return new File(mediaStorageDir.getPath() + File.separator + ("camerapreview_" + new SimpleDateFormat("dd_MM_yyyy_HHmm_ss").format(new Date()) + suffix + ".jpg"));
    }

    private File storeImage(Bitmap image, String suffix) {
        File pictureFile = getOutputMediaFile(suffix);
        if (pictureFile != null) {
            try {
                FileOutputStream fos = new FileOutputStream(pictureFile);
                image.compress(CompressFormat.JPEG, 80, fos);
                fos.close();
                return pictureFile;
            } catch (Exception e) {
            }
        }
        return null;
    }

    public int calculateInSampleSize(Options options, int reqWidth, int reqHeight) {
        int height = options.outHeight;
        int width = options.outWidth;
        int inSampleSize = 1;
        if (height > reqHeight || width > reqWidth) {
            int halfHeight = height / 2;
            int halfWidth = width / 2;
            while (halfHeight / inSampleSize > reqHeight && halfWidth / inSampleSize > reqWidth) {
                inSampleSize *= 2;
            }
        }
        return inSampleSize;
    }

    private Bitmap loadBitmapFromView(View v) {
        Bitmap b = Bitmap.createBitmap(v.getMeasuredWidth(), v.getMeasuredHeight(), Config.ARGB_8888);
        Canvas c = new Canvas(b);
        v.layout(v.getLeft(), v.getTop(), v.getRight(), v.getBottom());
        v.draw(c);
        return b;
    }

    public void onDestroy() {
        super.onDestroy();
    }
}
