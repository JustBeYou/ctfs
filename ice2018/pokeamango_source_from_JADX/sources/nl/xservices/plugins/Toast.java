package nl.xservices.plugins;

import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build.VERSION;
import android.os.CountDownTimer;
import android.text.Layout.Alignment;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.style.AlignmentSpan.Standard;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.widget.TextView;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Toast extends CordovaPlugin {
    private static final String ACTION_HIDE_EVENT = "hide";
    private static final String ACTION_SHOW_EVENT = "show";
    private static final int BASE_TOP_BOTTOM_OFFSET = 20;
    private static final int GRAVITY_BOTTOM = 81;
    private static final int GRAVITY_CENTER = 17;
    private static final int GRAVITY_TOP = 49;
    private static final boolean IS_AT_LEAST_LOLLIPOP = (VERSION.SDK_INT >= 21);
    private static CountDownTimer _timer;
    private boolean isPaused;
    private android.widget.Toast mostRecentToast;
    private ViewGroup viewGroup;

    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (ACTION_HIDE_EVENT.equals(action)) {
            hide();
            callbackContext.success();
            return true;
        } else if (!ACTION_SHOW_EVENT.equals(action)) {
            callbackContext.error("toast." + action + " is not a supported function. Did you mean '" + ACTION_SHOW_EVENT + "'?");
            return false;
        } else if (this.isPaused) {
            return true;
        } else {
            JSONObject options = args.getJSONObject(0);
            final String msg = options.getString("message");
            final Spannable message = new SpannableString(msg);
            message.setSpan(new Standard(Alignment.ALIGN_CENTER), 0, msg.length() - 1, 18);
            final String duration = options.getString("duration");
            final String position = options.getString("position");
            final int addPixelsY = options.has("addPixelsY") ? options.getInt("addPixelsY") : 0;
            final JSONObject data = options.has("data") ? options.getJSONObject("data") : null;
            final JSONObject styling = options.optJSONObject("styling");
            final CallbackContext callbackContext2 = callbackContext;
            this.cordova.getActivity().runOnUiThread(new Runnable() {

                /* renamed from: nl.xservices.plugins.Toast$1$1 */
                class C00101 implements OnTouchListener {
                    C00101() {
                    }

                    public boolean onTouch(View view, MotionEvent motionEvent) {
                        if (motionEvent.getAction() != 0) {
                            return false;
                        }
                        if (Toast.this.mostRecentToast == null || !Toast.this.mostRecentToast.getView().isShown()) {
                            Toast.this.getViewGroup().setOnTouchListener(null);
                            return false;
                        }
                        float startY;
                        float endY;
                        float w = (float) Toast.this.mostRecentToast.getView().getWidth();
                        float startX = ((float) (view.getWidth() / 2)) - (w / 2.0f);
                        float endX = ((float) (view.getWidth() / 2)) + (w / 2.0f);
                        float g = (float) Toast.this.mostRecentToast.getGravity();
                        float y = (float) Toast.this.mostRecentToast.getYOffset();
                        float h = (float) Toast.this.mostRecentToast.getView().getHeight();
                        if (g == 81.0f) {
                            startY = (((float) view.getHeight()) - y) - h;
                            endY = ((float) view.getHeight()) - y;
                        } else if (g == 17.0f) {
                            startY = (((float) (view.getHeight() / 2)) + y) - (h / 2.0f);
                            endY = (((float) (view.getHeight() / 2)) + y) + (h / 2.0f);
                        } else {
                            startY = y;
                            endY = y + h;
                        }
                        float tapX = motionEvent.getX();
                        float tapY = motionEvent.getY();
                        boolean tapped = tapX >= startX && tapX <= endX && tapY >= startY && tapY <= endY;
                        if (tapped && Toast.this.returnTapEvent(msg, data, callbackContext2)) {
                            return true;
                        }
                        return false;
                    }
                }

                /* renamed from: nl.xservices.plugins.Toast$1$2 */
                class C00112 implements OnTouchListener {
                    C00112() {
                    }

                    public boolean onTouch(View view, MotionEvent motionEvent) {
                        return motionEvent.getAction() == 0 && Toast.this.returnTapEvent(msg, data, callbackContext2);
                    }
                }

                public void run() {
                    int hideAfterMs;
                    if ("short".equalsIgnoreCase(duration)) {
                        hideAfterMs = 2000;
                    } else if ("long".equalsIgnoreCase(duration)) {
                        hideAfterMs = 4000;
                    } else {
                        hideAfterMs = Integer.parseInt(duration);
                    }
                    final android.widget.Toast toast = android.widget.Toast.makeText(Toast.IS_AT_LEAST_LOLLIPOP ? Toast.this.cordova.getActivity().getWindow().getContext() : Toast.this.cordova.getActivity().getApplicationContext(), message, 1);
                    if ("top".equals(position)) {
                        toast.setGravity(Toast.GRAVITY_TOP, 0, addPixelsY + Toast.BASE_TOP_BOTTOM_OFFSET);
                    } else if ("bottom".equals(position)) {
                        toast.setGravity(Toast.GRAVITY_BOTTOM, 0, 20 - addPixelsY);
                    } else if ("center".equals(position)) {
                        toast.setGravity(Toast.GRAVITY_CENTER, 0, addPixelsY);
                    } else {
                        callbackContext2.error("invalid position. valid options are 'top', 'center' and 'bottom'");
                        return;
                    }
                    if (styling != null && VERSION.SDK_INT >= 16) {
                        String backgroundColor = styling.optString("backgroundColor", "#333333");
                        String textColor = styling.optString("textColor", "#ffffff");
                        Double textSize = Double.valueOf(styling.optDouble("textSize", -1.0d));
                        double opacity = styling.optDouble("opacity", 0.8d);
                        int cornerRadius = styling.optInt("cornerRadius", 100);
                        int horizontalPadding = styling.optInt("horizontalPadding", 50);
                        int verticalPadding = styling.optInt("verticalPadding", 30);
                        Drawable shape = new GradientDrawable();
                        shape.setCornerRadius((float) cornerRadius);
                        shape.setAlpha((int) (255.0d * opacity));
                        shape.setColor(Color.parseColor(backgroundColor));
                        toast.getView().setBackground(shape);
                        TextView toastTextView = (TextView) toast.getView().findViewById(16908299);
                        toastTextView.setTextColor(Color.parseColor(textColor));
                        if (textSize.doubleValue() > -1.0d) {
                            toastTextView.setTextSize(textSize.floatValue());
                        }
                        toast.getView().setPadding(horizontalPadding, verticalPadding, horizontalPadding, verticalPadding);
                        if (VERSION.SDK_INT >= 21) {
                            toast.getView().setElevation(6.0f);
                        }
                    }
                    if (Toast.IS_AT_LEAST_LOLLIPOP) {
                        Toast.this.getViewGroup().setOnTouchListener(new C00101());
                    } else {
                        toast.getView().setOnTouchListener(new C00112());
                    }
                    Toast._timer = new CountDownTimer((long) hideAfterMs, 2500) {
                        public void onTick(long millisUntilFinished) {
                            toast.show();
                        }

                        public void onFinish() {
                            toast.cancel();
                        }
                    }.start();
                    Toast.this.mostRecentToast = toast;
                    toast.show();
                    PluginResult pr = new PluginResult(Status.OK);
                    pr.setKeepCallback(true);
                    callbackContext2.sendPluginResult(pr);
                }
            });
            return true;
        }
    }

    private void hide() {
        if (this.mostRecentToast != null) {
            this.mostRecentToast.cancel();
            getViewGroup().setOnTouchListener(null);
        }
        if (_timer != null) {
            _timer.cancel();
        }
    }

    private boolean returnTapEvent(String message, JSONObject data, CallbackContext callbackContext) {
        JSONObject json = new JSONObject();
        try {
            json.put("event", "touch");
            json.put("message", message);
            json.put("data", data);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        callbackContext.success(json);
        hide();
        return true;
    }

    private ViewGroup getViewGroup() {
        if (this.viewGroup == null) {
            this.viewGroup = (ViewGroup) ((ViewGroup) this.cordova.getActivity().findViewById(16908290)).getChildAt(0);
        }
        return this.viewGroup;
    }

    public void onPause(boolean multitasking) {
        hide();
        this.isPaused = true;
    }

    public void onResume(boolean multitasking) {
        this.isPaused = false;
    }
}
