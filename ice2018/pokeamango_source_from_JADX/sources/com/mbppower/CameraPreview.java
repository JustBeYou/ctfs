package com.mbppower;

import android.app.FragmentTransaction;
import android.hardware.Camera;
import android.hardware.Camera.Parameters;
import android.util.DisplayMetrics;
import android.util.Log;
import android.util.TypedValue;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import com.mbppower.CameraActivity.CameraPreviewListener;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;

public class CameraPreview extends CordovaPlugin implements CameraPreviewListener {
    private final String TAG = "CameraPreview";
    private int containerViewId = 1;
    private CameraActivity fragment;
    private final String hideCameraAction = "hideCamera";
    private final String setColorEffectAction = "setColorEffect";
    private final String setOnPictureTakenHandlerAction = "setOnPictureTakenHandler";
    private final String showCameraAction = "showCamera";
    private final String startCameraAction = "startCamera";
    private final String stopCameraAction = "stopCamera";
    private final String switchCameraAction = "switchCamera";
    private final String takePictureAction = "takePicture";
    private CallbackContext takePictureCallbackContext;

    public CameraPreview() {
        Log.d("CameraPreview", "Constructing");
    }

    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if ("setOnPictureTakenHandler".equals(action)) {
            return setOnPictureTakenHandler(args, callbackContext);
        }
        if ("startCamera".equals(action)) {
            return startCamera(args, callbackContext);
        }
        if ("takePicture".equals(action)) {
            return takePicture(args, callbackContext);
        }
        if ("setColorEffect".equals(action)) {
            return setColorEffect(args, callbackContext);
        }
        if ("stopCamera".equals(action)) {
            return stopCamera(args, callbackContext);
        }
        if ("hideCamera".equals(action)) {
            return hideCamera(args, callbackContext);
        }
        if ("showCamera".equals(action)) {
            return showCamera(args, callbackContext);
        }
        if ("switchCamera".equals(action)) {
            return switchCamera(args, callbackContext);
        }
        return false;
    }

    private boolean startCamera(final JSONArray args, CallbackContext callbackContext) {
        if (this.fragment != null) {
            return false;
        }
        this.fragment = new CameraActivity();
        this.fragment.setEventListener(this);
        this.cordova.getActivity().runOnUiThread(new Runnable() {
            public void run() {
                try {
                    DisplayMetrics metrics = CameraPreview.this.cordova.getActivity().getResources().getDisplayMetrics();
                    int x = (int) TypedValue.applyDimension(1, (float) args.getInt(0), metrics);
                    int y = (int) TypedValue.applyDimension(1, (float) args.getInt(1), metrics);
                    int width = (int) TypedValue.applyDimension(1, (float) args.getInt(2), metrics);
                    int height = (int) TypedValue.applyDimension(1, (float) args.getInt(3), metrics);
                    String defaultCamera = args.getString(4);
                    Boolean tapToTakePicture = Boolean.valueOf(args.getBoolean(5));
                    Boolean dragEnabled = Boolean.valueOf(args.getBoolean(6));
                    Boolean toBack = Boolean.valueOf(args.getBoolean(7));
                    CameraPreview.this.fragment.defaultCamera = defaultCamera;
                    CameraPreview.this.fragment.tapToTakePicture = tapToTakePicture.booleanValue();
                    CameraPreview.this.fragment.dragEnabled = dragEnabled.booleanValue();
                    CameraPreview.this.fragment.setRect(x, y, width, height);
                    FrameLayout containerView = (FrameLayout) CameraPreview.this.cordova.getActivity().findViewById(CameraPreview.this.containerViewId);
                    if (containerView == null) {
                        containerView = new FrameLayout(CameraPreview.this.cordova.getActivity().getApplicationContext());
                        containerView.setId(CameraPreview.this.containerViewId);
                        CameraPreview.this.cordova.getActivity().addContentView(containerView, new LayoutParams(-1, -1));
                    }
                    if (toBack.booleanValue()) {
                        CameraPreview.this.webView.getView().setBackgroundColor(0);
                        ((ViewGroup) CameraPreview.this.webView.getView()).bringToFront();
                    } else {
                        containerView.setAlpha(Float.parseFloat(args.getString(8)));
                        containerView.bringToFront();
                    }
                    FragmentTransaction fragmentTransaction = CameraPreview.this.cordova.getActivity().getFragmentManager().beginTransaction();
                    fragmentTransaction.add(containerView.getId(), CameraPreview.this.fragment);
                    fragmentTransaction.commit();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
        return true;
    }

    private boolean takePicture(JSONArray args, CallbackContext callbackContext) {
        if (this.fragment == null) {
            return false;
        }
        PluginResult pluginResult = new PluginResult(Status.OK);
        pluginResult.setKeepCallback(true);
        callbackContext.sendPluginResult(pluginResult);
        try {
            this.fragment.takePicture(args.getDouble(0), args.getDouble(1));
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void onPictureTaken(String originalPicturePath, String previewPicturePath) {
        JSONArray data = new JSONArray();
        data.put(originalPicturePath).put(previewPicturePath);
        PluginResult pluginResult = new PluginResult(Status.OK, data);
        pluginResult.setKeepCallback(true);
        this.takePictureCallbackContext.sendPluginResult(pluginResult);
    }

    private boolean setColorEffect(JSONArray args, CallbackContext callbackContext) {
        if (this.fragment == null) {
            return false;
        }
        Camera camera = this.fragment.getCamera();
        if (camera == null) {
            return true;
        }
        Parameters params = camera.getParameters();
        try {
            String effect = args.getString(0);
            if (effect.equals("aqua")) {
                params.setColorEffect("aqua");
            } else if (effect.equals("blackboard")) {
                params.setColorEffect("blackboard");
            } else if (effect.equals("mono")) {
                params.setColorEffect("mono");
            } else if (effect.equals("negative")) {
                params.setColorEffect("negative");
            } else if (effect.equals("none")) {
                params.setColorEffect("none");
            } else if (effect.equals("posterize")) {
                params.setColorEffect("posterize");
            } else if (effect.equals("sepia")) {
                params.setColorEffect("sepia");
            } else if (effect.equals("solarize")) {
                params.setColorEffect("solarize");
            } else if (effect.equals("whiteboard")) {
                params.setColorEffect("whiteboard");
            }
            this.fragment.setCameraParameters(params);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean stopCamera(JSONArray args, CallbackContext callbackContext) {
        if (this.fragment == null) {
            return false;
        }
        FragmentTransaction fragmentTransaction = this.cordova.getActivity().getFragmentManager().beginTransaction();
        fragmentTransaction.remove(this.fragment);
        fragmentTransaction.commit();
        this.fragment = null;
        return true;
    }

    private boolean showCamera(JSONArray args, CallbackContext callbackContext) {
        if (this.fragment == null) {
            return false;
        }
        FragmentTransaction fragmentTransaction = this.cordova.getActivity().getFragmentManager().beginTransaction();
        fragmentTransaction.show(this.fragment);
        fragmentTransaction.commit();
        return true;
    }

    private boolean hideCamera(JSONArray args, CallbackContext callbackContext) {
        if (this.fragment == null) {
            return false;
        }
        FragmentTransaction fragmentTransaction = this.cordova.getActivity().getFragmentManager().beginTransaction();
        fragmentTransaction.hide(this.fragment);
        fragmentTransaction.commit();
        return true;
    }

    private boolean switchCamera(JSONArray args, CallbackContext callbackContext) {
        if (this.fragment == null) {
            return false;
        }
        this.fragment.switchCamera();
        return true;
    }

    private boolean setOnPictureTakenHandler(JSONArray args, CallbackContext callbackContext) {
        Log.d("CameraPreview", "setOnPictureTakenHandler");
        this.takePictureCallbackContext = callbackContext;
        return true;
    }
}
