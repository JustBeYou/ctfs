package org.apache.cordova;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnKeyListener;
import android.view.KeyEvent;
import android.widget.EditText;

public class CordovaDialogsHelper {
    private final Context context;
    private AlertDialog lastHandledDialog;

    public interface Result {
        void gotResult(boolean z, String str);
    }

    public CordovaDialogsHelper(Context context) {
        this.context = context;
    }

    public void showAlert(String message, final Result result) {
        Builder dlg = new Builder(this.context);
        dlg.setMessage(message);
        dlg.setTitle("Alert");
        dlg.setCancelable(true);
        dlg.setPositiveButton(17039370, new OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                result.gotResult(true, null);
            }
        });
        dlg.setOnCancelListener(new OnCancelListener() {
            public void onCancel(DialogInterface dialog) {
                result.gotResult(false, null);
            }
        });
        dlg.setOnKeyListener(new OnKeyListener() {
            public boolean onKey(DialogInterface dialog, int keyCode, KeyEvent event) {
                if (keyCode != 4) {
                    return true;
                }
                result.gotResult(true, null);
                return false;
            }
        });
        this.lastHandledDialog = dlg.show();
    }

    public void showConfirm(String message, final Result result) {
        Builder dlg = new Builder(this.context);
        dlg.setMessage(message);
        dlg.setTitle("Confirm");
        dlg.setCancelable(true);
        dlg.setPositiveButton(17039370, new OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                result.gotResult(true, null);
            }
        });
        dlg.setNegativeButton(17039360, new OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                result.gotResult(false, null);
            }
        });
        dlg.setOnCancelListener(new OnCancelListener() {
            public void onCancel(DialogInterface dialog) {
                result.gotResult(false, null);
            }
        });
        dlg.setOnKeyListener(new OnKeyListener() {
            public boolean onKey(DialogInterface dialog, int keyCode, KeyEvent event) {
                if (keyCode != 4) {
                    return true;
                }
                result.gotResult(false, null);
                return false;
            }
        });
        this.lastHandledDialog = dlg.show();
    }

    public void showPrompt(String message, String defaultValue, final Result result) {
        Builder dlg = new Builder(this.context);
        dlg.setMessage(message);
        final EditText input = new EditText(this.context);
        if (defaultValue != null) {
            input.setText(defaultValue);
        }
        dlg.setView(input);
        dlg.setCancelable(false);
        dlg.setPositiveButton(17039370, new OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                result.gotResult(true, input.getText().toString());
            }
        });
        dlg.setNegativeButton(17039360, new OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                result.gotResult(false, null);
            }
        });
        this.lastHandledDialog = dlg.show();
    }

    public void destroyLastDialog() {
        if (this.lastHandledDialog != null) {
            this.lastHandledDialog.cancel();
        }
    }
}
