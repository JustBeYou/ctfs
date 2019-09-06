
    public static int getSecretNumber(int i) {
        /*PackageInfo packageInfo;
        CertificateFactory instance;
        X509Certificate x509Certificate;
        try {
            packageInfo = cc.getPackageManager().getPackageInfo(cc.getPackageName(), 64);
        } catch (NameNotFoundException e) {
            e.printStackTrace();
            packageInfo = null;
        }
        InputStream byteArrayInputStream = new ByteArrayInputStream(packageInfo.signatures[0].toByteArray());
        try {
            instance = CertificateFactory.getInstance("X509");
        } catch (CertificateException e2) {
            e2.printStackTrace();
            instance = null;
        }
        try {
            x509Certificate = (X509Certificate) instance.generateCertificate(byteArrayInputStream);
        } catch (CertificateException e22) {
            e22.printStackTrace();
            x509Certificate = null;
        }
        try {
            MessageDigest instance2 = MessageDigest.getInstance("SHA256");
            int[] iArr = new int[256];
            for (int i2 = 0; i2 < 8; i2++) {
                byte[] encoded = x509Certificate.getEncoded();
                encoded[i2] = (byte) 33;
                encoded = instance2.digest(encoded);
                for (int i3 = 0; i3 < encoded.length; i3++) {
                    byte b = encoded[i3];
                    if (b < (byte) 0) {
                        b += 256;
                    }
                    if (b == (byte) 0) {
                        b = (byte) 1;
                    }
                    iArr[(i2 * 32) + i3] = b;
                }
            }
            return iArr[i];
        } catch (int i4) {
            i4.printStackTrace();
            i4 = 2 / 0;
            return 0;
        } catch (int i42) {
            i42.printStackTrace();
            i42 = 2 / 0;
            return 0;
        }*/
        return 123;
    }

