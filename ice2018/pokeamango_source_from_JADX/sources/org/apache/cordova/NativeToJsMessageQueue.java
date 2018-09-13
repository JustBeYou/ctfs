package org.apache.cordova;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import org.apache.cordova.PluginResult.Status;

public class NativeToJsMessageQueue {
    static final boolean DISABLE_EXEC_CHAINING = false;
    private static final boolean FORCE_ENCODE_USING_EVAL = false;
    private static final String LOG_TAG = "JsMessageQueue";
    private static int MAX_PAYLOAD_SIZE = 524288000;
    private BridgeMode activeBridgeMode;
    private ArrayList<BridgeMode> bridgeModes = new ArrayList();
    private boolean paused;
    private final LinkedList<JsMessage> queue = new LinkedList();

    public static abstract class BridgeMode {
        public abstract void onNativeToJsMessageAvailable(NativeToJsMessageQueue nativeToJsMessageQueue);

        public void notifyOfFlush(NativeToJsMessageQueue queue, boolean fromOnlineEvent) {
        }

        public void reset() {
        }
    }

    private static class JsMessage {
        final String jsPayloadOrCallbackId;
        final PluginResult pluginResult;

        JsMessage(String js) {
            if (js == null) {
                throw new NullPointerException();
            }
            this.jsPayloadOrCallbackId = js;
            this.pluginResult = null;
        }

        JsMessage(PluginResult pluginResult, String callbackId) {
            if (callbackId == null || pluginResult == null) {
                throw new NullPointerException();
            }
            this.jsPayloadOrCallbackId = callbackId;
            this.pluginResult = pluginResult;
        }

        static int calculateEncodedLengthHelper(PluginResult pluginResult) {
            switch (pluginResult.getMessageType()) {
                case 1:
                    return pluginResult.getStrMessage().length() + 1;
                case 3:
                    return pluginResult.getMessage().length() + 1;
                case 4:
                case 5:
                    return 1;
                case 6:
                    return pluginResult.getMessage().length() + 1;
                case 7:
                    return pluginResult.getMessage().length() + 1;
                case PluginResult.MESSAGE_TYPE_MULTIPART /*8*/:
                    int ret = 1;
                    for (int i = 0; i < pluginResult.getMultipartMessagesSize(); i++) {
                        int length = calculateEncodedLengthHelper(pluginResult.getMultipartMessage(i));
                        ret += (String.valueOf(length).length() + 1) + length;
                    }
                    return ret;
                default:
                    return pluginResult.getMessage().length();
            }
        }

        int calculateEncodedLength() {
            if (this.pluginResult == null) {
                return this.jsPayloadOrCallbackId.length() + 1;
            }
            return calculateEncodedLengthHelper(this.pluginResult) + ((((String.valueOf(this.pluginResult.getStatus()).length() + 2) + 1) + this.jsPayloadOrCallbackId.length()) + 1);
        }

        static void encodeAsMessageHelper(StringBuilder sb, PluginResult pluginResult) {
            switch (pluginResult.getMessageType()) {
                case 1:
                    sb.append('s');
                    sb.append(pluginResult.getStrMessage());
                    return;
                case 3:
                    sb.append('n').append(pluginResult.getMessage());
                    return;
                case 4:
                    sb.append(pluginResult.getMessage().charAt(0));
                    return;
                case 5:
                    sb.append('N');
                    return;
                case 6:
                    sb.append('A');
                    sb.append(pluginResult.getMessage());
                    return;
                case 7:
                    sb.append('S');
                    sb.append(pluginResult.getMessage());
                    return;
                case PluginResult.MESSAGE_TYPE_MULTIPART /*8*/:
                    sb.append('M');
                    for (int i = 0; i < pluginResult.getMultipartMessagesSize(); i++) {
                        PluginResult multipartMessage = pluginResult.getMultipartMessage(i);
                        sb.append(String.valueOf(calculateEncodedLengthHelper(multipartMessage)));
                        sb.append(' ');
                        encodeAsMessageHelper(sb, multipartMessage);
                    }
                    return;
                default:
                    sb.append(pluginResult.getMessage());
                    return;
            }
        }

        void encodeAsMessage(StringBuilder sb) {
            if (this.pluginResult == null) {
                sb.append('J').append(this.jsPayloadOrCallbackId);
                return;
            }
            boolean noResult;
            boolean resultOk;
            int status = this.pluginResult.getStatus();
            if (status == Status.NO_RESULT.ordinal()) {
                noResult = true;
            } else {
                noResult = false;
            }
            if (status == Status.OK.ordinal()) {
                resultOk = true;
            } else {
                resultOk = false;
            }
            boolean keepCallback = this.pluginResult.getKeepCallback();
            char c = (noResult || resultOk) ? 'S' : 'F';
            sb.append(c).append(keepCallback ? '1' : '0').append(status).append(' ').append(this.jsPayloadOrCallbackId).append(' ');
            encodeAsMessageHelper(sb, this.pluginResult);
        }

        void buildJsMessage(StringBuilder sb) {
            switch (this.pluginResult.getMessageType()) {
                case 5:
                    sb.append("null");
                    return;
                case 6:
                    sb.append("cordova.require('cordova/base64').toArrayBuffer('").append(this.pluginResult.getMessage()).append("')");
                    return;
                case 7:
                    sb.append("atob('").append(this.pluginResult.getMessage()).append("')");
                    return;
                case PluginResult.MESSAGE_TYPE_MULTIPART /*8*/:
                    int size = this.pluginResult.getMultipartMessagesSize();
                    for (int i = 0; i < size; i++) {
                        new JsMessage(this.pluginResult.getMultipartMessage(i), this.jsPayloadOrCallbackId).buildJsMessage(sb);
                        if (i < size - 1) {
                            sb.append(",");
                        }
                    }
                    return;
                default:
                    sb.append(this.pluginResult.getMessage());
                    return;
            }
        }

        void encodeAsJsMessage(StringBuilder sb) {
            if (this.pluginResult == null) {
                sb.append(this.jsPayloadOrCallbackId);
                return;
            }
            int status = this.pluginResult.getStatus();
            boolean success = status == Status.OK.ordinal() || status == Status.NO_RESULT.ordinal();
            sb.append("cordova.callbackFromNative('").append(this.jsPayloadOrCallbackId).append("',").append(success).append(",").append(status).append(",[");
            buildJsMessage(sb);
            sb.append("],").append(this.pluginResult.getKeepCallback()).append(");");
        }
    }

    public static class EvalBridgeMode extends BridgeMode {
        private final CordovaInterface cordova;
        private final CordovaWebViewEngine engine;

        public EvalBridgeMode(CordovaWebViewEngine engine, CordovaInterface cordova) {
            this.engine = engine;
            this.cordova = cordova;
        }

        public void onNativeToJsMessageAvailable(final NativeToJsMessageQueue queue) {
            this.cordova.getActivity().runOnUiThread(new Runnable() {
                public void run() {
                    String js = queue.popAndEncodeAsJs();
                    if (js != null) {
                        EvalBridgeMode.this.engine.evaluateJavascript(js, null);
                    }
                }
            });
        }
    }

    public static class LoadUrlBridgeMode extends BridgeMode {
        private final CordovaInterface cordova;
        private final CordovaWebViewEngine engine;

        public LoadUrlBridgeMode(CordovaWebViewEngine engine, CordovaInterface cordova) {
            this.engine = engine;
            this.cordova = cordova;
        }

        public void onNativeToJsMessageAvailable(final NativeToJsMessageQueue queue) {
            this.cordova.getActivity().runOnUiThread(new Runnable() {
                public void run() {
                    String js = queue.popAndEncodeAsJs();
                    if (js != null) {
                        LoadUrlBridgeMode.this.engine.loadUrl("javascript:" + js, false);
                    }
                }
            });
        }
    }

    public static class NoOpBridgeMode extends BridgeMode {
        public void onNativeToJsMessageAvailable(NativeToJsMessageQueue queue) {
        }
    }

    public static class OnlineEventsBridgeMode extends BridgeMode {
        private final OnlineEventsBridgeModeDelegate delegate;
        private boolean ignoreNextFlush;
        private boolean online;

        /* renamed from: org.apache.cordova.NativeToJsMessageQueue$OnlineEventsBridgeMode$1 */
        class C00391 implements Runnable {
            C00391() {
            }

            public void run() {
                OnlineEventsBridgeMode.this.online = false;
                OnlineEventsBridgeMode.this.ignoreNextFlush = true;
                OnlineEventsBridgeMode.this.delegate.setNetworkAvailable(true);
            }
        }

        public interface OnlineEventsBridgeModeDelegate {
            void runOnUiThread(Runnable runnable);

            void setNetworkAvailable(boolean z);
        }

        public OnlineEventsBridgeMode(OnlineEventsBridgeModeDelegate delegate) {
            this.delegate = delegate;
        }

        public void reset() {
            this.delegate.runOnUiThread(new C00391());
        }

        public void onNativeToJsMessageAvailable(final NativeToJsMessageQueue queue) {
            this.delegate.runOnUiThread(new Runnable() {
                public void run() {
                    if (!queue.isEmpty()) {
                        OnlineEventsBridgeMode.this.ignoreNextFlush = false;
                        OnlineEventsBridgeMode.this.delegate.setNetworkAvailable(OnlineEventsBridgeMode.this.online);
                    }
                }
            });
        }

        public void notifyOfFlush(NativeToJsMessageQueue queue, boolean fromOnlineEvent) {
            if (fromOnlineEvent && !this.ignoreNextFlush) {
                this.online = !this.online;
            }
        }
    }

    public void addBridgeMode(BridgeMode bridgeMode) {
        this.bridgeModes.add(bridgeMode);
    }

    public boolean isBridgeEnabled() {
        return this.activeBridgeMode != null;
    }

    public boolean isEmpty() {
        return this.queue.isEmpty();
    }

    public void setBridgeMode(int value) {
        if (value < -1 || value >= this.bridgeModes.size()) {
            LOG.m0d(LOG_TAG, "Invalid NativeToJsBridgeMode: " + value);
            return;
        }
        BridgeMode newMode = value < 0 ? null : (BridgeMode) this.bridgeModes.get(value);
        if (newMode != this.activeBridgeMode) {
            LOG.m0d(LOG_TAG, "Set native->JS mode to " + (newMode == null ? "null" : newMode.getClass().getSimpleName()));
            synchronized (this) {
                this.activeBridgeMode = newMode;
                if (newMode != null) {
                    newMode.reset();
                    if (!(this.paused || this.queue.isEmpty())) {
                        newMode.onNativeToJsMessageAvailable(this);
                    }
                }
            }
        }
    }

    public void reset() {
        synchronized (this) {
            this.queue.clear();
            setBridgeMode(-1);
        }
    }

    private int calculatePackedMessageLength(JsMessage message) {
        int messageLen = message.calculateEncodedLength();
        return (String.valueOf(messageLen).length() + messageLen) + 1;
    }

    private void packMessage(JsMessage message, StringBuilder sb) {
        sb.append(message.calculateEncodedLength()).append(' ');
        message.encodeAsMessage(sb);
    }

    public String popAndEncode(boolean fromOnlineEvent) {
        String str = null;
        synchronized (this) {
            if (this.activeBridgeMode == null) {
            } else {
                this.activeBridgeMode.notifyOfFlush(this, fromOnlineEvent);
                if (this.queue.isEmpty()) {
                } else {
                    int totalPayloadLen = 0;
                    int numMessagesToSend = 0;
                    Iterator it = this.queue.iterator();
                    while (it.hasNext()) {
                        int messageSize = calculatePackedMessageLength((JsMessage) it.next());
                        if (numMessagesToSend > 0 && totalPayloadLen + messageSize > MAX_PAYLOAD_SIZE && MAX_PAYLOAD_SIZE > 0) {
                            break;
                        }
                        totalPayloadLen += messageSize;
                        numMessagesToSend++;
                    }
                    StringBuilder sb = new StringBuilder(totalPayloadLen);
                    for (int i = 0; i < numMessagesToSend; i++) {
                        packMessage((JsMessage) this.queue.removeFirst(), sb);
                    }
                    if (!this.queue.isEmpty()) {
                        sb.append('*');
                    }
                    str = sb.toString();
                }
            }
        }
        return str;
    }

    public String popAndEncodeAsJs() {
        String str;
        synchronized (this) {
            if (this.queue.size() == 0) {
                str = null;
            } else {
                boolean willSendAllMessages;
                int totalPayloadLen = 0;
                int numMessagesToSend = 0;
                Iterator it = this.queue.iterator();
                while (it.hasNext()) {
                    int messageSize = ((JsMessage) it.next()).calculateEncodedLength() + 50;
                    if (numMessagesToSend > 0 && totalPayloadLen + messageSize > MAX_PAYLOAD_SIZE && MAX_PAYLOAD_SIZE > 0) {
                        break;
                    }
                    totalPayloadLen += messageSize;
                    numMessagesToSend++;
                }
                if (numMessagesToSend == this.queue.size()) {
                    willSendAllMessages = true;
                } else {
                    willSendAllMessages = false;
                }
                StringBuilder sb = new StringBuilder((willSendAllMessages ? 0 : 100) + totalPayloadLen);
                int i = 0;
                while (i < numMessagesToSend) {
                    JsMessage message = (JsMessage) this.queue.removeFirst();
                    if (willSendAllMessages && i + 1 == numMessagesToSend) {
                        message.encodeAsJsMessage(sb);
                    } else {
                        sb.append("try{");
                        message.encodeAsJsMessage(sb);
                        sb.append("}finally{");
                    }
                    i++;
                }
                if (!willSendAllMessages) {
                    sb.append("window.setTimeout(function(){cordova.require('cordova/plugin/android/polling').pollOnce();},0);");
                }
                i = willSendAllMessages ? 1 : 0;
                while (i < numMessagesToSend) {
                    sb.append('}');
                    i++;
                }
                str = sb.toString();
            }
        }
        return str;
    }

    public void addJavaScript(String statement) {
        enqueueMessage(new JsMessage(statement));
    }

    public void addPluginResult(PluginResult result, String callbackId) {
        if (callbackId == null) {
            LOG.m4e(LOG_TAG, "Got plugin result with no callbackId", new Throwable());
            return;
        }
        boolean noResult = result.getStatus() == Status.NO_RESULT.ordinal();
        boolean keepCallback = result.getKeepCallback();
        if (!noResult || !keepCallback) {
            enqueueMessage(new JsMessage(result, callbackId));
        }
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void enqueueMessage(org.apache.cordova.NativeToJsMessageQueue.JsMessage r3) {
        /*
        r2 = this;
        monitor-enter(r2);
        r0 = r2.activeBridgeMode;	 Catch:{ all -> 0x001e }
        if (r0 != 0) goto L_0x000e;
    L_0x0005:
        r0 = "JsMessageQueue";
        r1 = "Dropping Native->JS message due to disabled bridge";
        org.apache.cordova.LOG.m0d(r0, r1);	 Catch:{ all -> 0x001e }
        monitor-exit(r2);	 Catch:{ all -> 0x001e }
    L_0x000d:
        return;
    L_0x000e:
        r0 = r2.queue;	 Catch:{ all -> 0x001e }
        r0.add(r3);	 Catch:{ all -> 0x001e }
        r0 = r2.paused;	 Catch:{ all -> 0x001e }
        if (r0 != 0) goto L_0x001c;
    L_0x0017:
        r0 = r2.activeBridgeMode;	 Catch:{ all -> 0x001e }
        r0.onNativeToJsMessageAvailable(r2);	 Catch:{ all -> 0x001e }
    L_0x001c:
        monitor-exit(r2);	 Catch:{ all -> 0x001e }
        goto L_0x000d;
    L_0x001e:
        r0 = move-exception;
        monitor-exit(r2);	 Catch:{ all -> 0x001e }
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.cordova.NativeToJsMessageQueue.enqueueMessage(org.apache.cordova.NativeToJsMessageQueue$JsMessage):void");
    }

    public void setPaused(boolean value) {
        if (this.paused && value) {
            LOG.m4e(LOG_TAG, "nested call to setPaused detected.", new Throwable());
        }
        this.paused = value;
        if (!value) {
            synchronized (this) {
                if (!(this.queue.isEmpty() || this.activeBridgeMode == null)) {
                    this.activeBridgeMode.onNativeToJsMessageAvailable(this);
                }
            }
        }
    }
}
