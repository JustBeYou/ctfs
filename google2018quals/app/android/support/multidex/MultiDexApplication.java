package android.support.multidex;

import android.app.Application;
import android.content.Context;

public class MultiDexApplication extends Application {
    protected void attachBaseContext(Context context) {
        super.attachBaseContext(context);
        C0086a.m358a((Context) this);
    }
}
