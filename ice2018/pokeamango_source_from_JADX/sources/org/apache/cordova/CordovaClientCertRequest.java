package org.apache.cordova;

import android.annotation.SuppressLint;
import android.webkit.ClientCertRequest;
import java.security.Principal;
import java.security.PrivateKey;
import java.security.cert.X509Certificate;

public class CordovaClientCertRequest implements ICordovaClientCertRequest {
    private final ClientCertRequest request;

    public CordovaClientCertRequest(ClientCertRequest request) {
        this.request = request;
    }

    @SuppressLint({"NewApi"})
    public void cancel() {
        this.request.cancel();
    }

    @SuppressLint({"NewApi"})
    public String getHost() {
        return this.request.getHost();
    }

    @SuppressLint({"NewApi"})
    public String[] getKeyTypes() {
        return this.request.getKeyTypes();
    }

    @SuppressLint({"NewApi"})
    public int getPort() {
        return this.request.getPort();
    }

    @SuppressLint({"NewApi"})
    public Principal[] getPrincipals() {
        return this.request.getPrincipals();
    }

    @SuppressLint({"NewApi"})
    public void ignore() {
        this.request.ignore();
    }

    @SuppressLint({"NewApi"})
    public void proceed(PrivateKey privateKey, X509Certificate[] chain) {
        this.request.proceed(privateKey, chain);
    }
}
