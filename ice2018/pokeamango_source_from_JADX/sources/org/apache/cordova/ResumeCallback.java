package org.apache.cordova;

public class ResumeCallback extends CallbackContext {
    private final String TAG = "CordovaResumeCallback";
    private PluginManager pluginManager;
    private String serviceName;

    public ResumeCallback(String serviceName, PluginManager pluginManager) {
        super("resumecallback", null);
        this.serviceName = serviceName;
        this.pluginManager = pluginManager;
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void sendPluginResult(org.apache.cordova.PluginResult r10) {
        /*
        r9 = this;
        monitor-enter(r9);
        r6 = r9.finished;	 Catch:{ all -> 0x007e }
        if (r6 == 0) goto L_0x0029;
    L_0x0005:
        r6 = "CordovaResumeCallback";
        r7 = new java.lang.StringBuilder;	 Catch:{ all -> 0x007e }
        r7.<init>();	 Catch:{ all -> 0x007e }
        r8 = r9.serviceName;	 Catch:{ all -> 0x007e }
        r7 = r7.append(r8);	 Catch:{ all -> 0x007e }
        r8 = " attempted to send a second callback to ResumeCallback\nResult was: ";
        r7 = r7.append(r8);	 Catch:{ all -> 0x007e }
        r8 = r10.getMessage();	 Catch:{ all -> 0x007e }
        r7 = r7.append(r8);	 Catch:{ all -> 0x007e }
        r7 = r7.toString();	 Catch:{ all -> 0x007e }
        org.apache.cordova.LOG.m12w(r6, r7);	 Catch:{ all -> 0x007e }
        monitor-exit(r9);	 Catch:{ all -> 0x007e }
    L_0x0028:
        return;
    L_0x0029:
        r6 = 1;
        r9.finished = r6;	 Catch:{ all -> 0x007e }
        monitor-exit(r9);	 Catch:{ all -> 0x007e }
        r2 = new org.json.JSONObject;
        r2.<init>();
        r4 = new org.json.JSONObject;
        r4.<init>();
        r6 = "pluginServiceName";
        r7 = r9.serviceName;	 Catch:{ JSONException -> 0x0081 }
        r4.put(r6, r7);	 Catch:{ JSONException -> 0x0081 }
        r6 = "pluginStatus";
        r7 = org.apache.cordova.PluginResult.StatusMessages;	 Catch:{ JSONException -> 0x0081 }
        r8 = r10.getStatus();	 Catch:{ JSONException -> 0x0081 }
        r7 = r7[r8];	 Catch:{ JSONException -> 0x0081 }
        r4.put(r6, r7);	 Catch:{ JSONException -> 0x0081 }
        r6 = "action";
        r7 = "resume";
        r2.put(r6, r7);	 Catch:{ JSONException -> 0x0081 }
        r6 = "pendingResult";
        r2.put(r6, r4);	 Catch:{ JSONException -> 0x0081 }
    L_0x0057:
        r3 = new org.apache.cordova.PluginResult;
        r6 = org.apache.cordova.PluginResult.Status.OK;
        r3.<init>(r6, r2);
        r5 = new java.util.ArrayList;
        r5.<init>();
        r5.add(r3);
        r5.add(r10);
        r6 = r9.pluginManager;
        r7 = "CoreAndroid";
        r0 = r6.getPlugin(r7);
        r0 = (org.apache.cordova.CoreAndroid) r0;
        r6 = new org.apache.cordova.PluginResult;
        r7 = org.apache.cordova.PluginResult.Status.OK;
        r6.<init>(r7, r5);
        r0.sendResumeEvent(r6);
        goto L_0x0028;
    L_0x007e:
        r6 = move-exception;
        monitor-exit(r9);	 Catch:{ all -> 0x007e }
        throw r6;
    L_0x0081:
        r1 = move-exception;
        r6 = "CordovaResumeCallback";
        r7 = "Unable to create resume object for Activity Result";
        org.apache.cordova.LOG.m3e(r6, r7);
        goto L_0x0057;
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.cordova.ResumeCallback.sendPluginResult(org.apache.cordova.PluginResult):void");
    }
}
