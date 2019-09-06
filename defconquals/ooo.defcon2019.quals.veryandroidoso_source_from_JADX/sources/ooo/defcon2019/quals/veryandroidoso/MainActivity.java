package ooo.defcon2019.quals.veryandroidoso;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import java.util.regex.Pattern;

public class MainActivity extends Activity {
    public static final String TAG = "veryandroidoso";

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(C0007R.layout.activity_main);
        Log.i(TAG, "started!");
        Solver.cc = this;
        Button button = (Button) findViewById(C0007R.id.button);
        final EditText editText = (EditText) findViewById(C0007R.id.editText);
        button.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                view = MainActivity.this.parse(editText.getText().toString());
                if (view != null) {
                    if (Solver.solve(view[0], view[1], view[2], view[3], view[4], view[5], view[6], view[7], view[8]) != null) {
                        MainActivity.this.win();
                    } else {
                        MainActivity.this.fail();
                    }
                    MainActivity.this.finish();
                    return;
                }
                MainActivity.this.fail();
                MainActivity.this.finish();
            }
        });
        CharSequence stringExtra = getIntent().getStringExtra("flag");
        if (stringExtra != null) {
            if (Solver.sleep(3000) < 3000) {
                fail();
                finish();
                return;
            }
            editText.setText(stringExtra);
            button.performClick();
        }
    }

    private int[] parse(String str) {
        if (str.length() != 23 || !str.startsWith("OOO{") || !str.endsWith("}")) {
            return null;
        }
        str = str.substring(4, str.length() - 1);
        if (!str.toLowerCase().equals(str) || !Pattern.compile("^\\p{XDigit}+$").matcher(str).matches()) {
            return null;
        }
        int[] iArr = new int[9];
        int i = 0;
        while (i < str.length() / 2) {
            int i2 = i + 1;
            iArr[i] = Integer.parseInt(str.substring(i * 2, i2 * 2), 16);
            i = i2;
        }
        return iArr;
    }

    private void win() {
        Toast.makeText(this, "Success!", 1).show();
        Log.i(TAG, "Success!");
    }

    private void fail() {
        Toast.makeText(this, "Fail!", 1).show();
        Log.i(TAG, "Fail!");
    }
}
