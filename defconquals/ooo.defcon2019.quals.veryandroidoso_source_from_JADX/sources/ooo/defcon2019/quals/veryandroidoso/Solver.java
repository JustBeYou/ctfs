//package ooo.defcon2019.quals.veryandroidoso;

//import android.content.Context;
//import android.content.pm.PackageInfo;
//import android.content.pm.PackageManager.NameNotFoundException;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;

public class Solver {
    //public static Context cc;

    public static native int m0(int i, int i2);

    public static native int m1(int i, int i2);

    public static native int m2(int i, int i2);

    public static native int m3(int i, int i2);

    public static native int m4(int i, int i2);

    public static native int m5(int i, int i2);

    public static native int m6(int i, int i2);

    public static native int m7(int i, int i2);

    public static native int m8(int i, int i2);

    public static native void m9(int i);

    public static native int ttt(int i, int i2);

    static {
        System.loadLibrary("native-lib");
    }

    public static void main(String[] args) {
        // Prints "Hello, World" to the terminal window.
        System.out.println("Hello, World");
    }


    static boolean solve(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9) {
        int m0;
        int i10;
        int i11 = i;
        int i12 = i2;
        int i13 = i3;
        int i14 = i4;
        int i15 = i5;
        int i16 = i7;
        int i17 = i8;
        int i18 = i9;
        int i19 = (((((i11 + i12) + i13) + i14) + i15) + i6) + (i16 * i17);
        int scramble = scramble(13);
        if (i11 == 0) {
            m0 = m0(100, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 1) {
            m0 = m0(190, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 2) {
            m0 = m0(88, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 3) {
            m0 = m0(240, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 4) {
            m0 = m0(97, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 5) {
            m0 = m0(216, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 6) {
            m0 = m0(47, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 7) {
            m0 = m0(243, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 8) {
            m0 = m0(39, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 9) {
            m0 = m0(18, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 10) {
            m0 = m0(173, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 11) {
            m0 = m0(144, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 12) {
            m0 = m0(157, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 13) {
            m0 = m0(114, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 14) {
            m0 = m0(116, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 15) {
            m0 = m0(250, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 16) {
            m0 = m0(152, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 17) {
            m0 = m0(150, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 18) {
            m0 = m0(196, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 19) {
            m0 = m0(175, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 20) {
            m0 = m0(28, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 21) {
            m0 = m0(179, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 22) {
            m0 = m0(23, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 23) {
            m0 = m0(213, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 24) {
            m0 = m0(73, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 25) {
            m0 = m0(66, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 26) {
            m0 = m0(20, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 27) {
            m0 = m0(228, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 28) {
            m0 = m0(67, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 29) {
            m0 = m0(200, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 30) {
            m0 = m0(156, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 31) {
            m0 = m0(7, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 32) {
            m0 = m0(221, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 33) {
            m0 = m0(210, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 34) {
            m0 = m0(50, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 35) {
            m0 = m0(233, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 36) {
            m0 = m0(110, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 37) {
            m0 = m0(32, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 38) {
            m0 = m0(71, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 39) {
            m0 = m0(194, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 40) {
            m0 = m0(117, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 41) {
            m0 = m0(220, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 42) {
            m0 = m0(43, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 43) {
            m0 = m0(113, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 44) {
            m0 = m0(148, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 45) {
            m0 = m0(247, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 46) {
            m0 = m0(217, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 47) {
            m0 = m0(185, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 48) {
            m0 = m0(41, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 49) {
            m0 = m0(177, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 50) {
            m0 = m0(239, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 51) {
            m0 = m0(12, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 52) {
            m0 = m0(232, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 53) {
            m0 = m0(101, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 54) {
            m0 = m0(82, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 55) {
            m0 = m0(178, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 56) {
            m0 = m0(128, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 57) {
            m0 = m0(191, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 58) {
            m0 = m0(42, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 59) {
            m0 = m0(172, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 60) {
            m0 = m0(136, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 61) {
            m0 = m0(81, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 62) {
            m0 = m0(115, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 63) {
            m0 = m0(251, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 64) {
            m0 = m0(69, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 65) {
            m0 = m0(89, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 66) {
            m0 = m0(139, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 67) {
            m0 = m0(48, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 68) {
            m0 = m0(129, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 69) {
            m0 = m0(63, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 70) {
            m0 = m0(154, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 71) {
            m0 = m0(125, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 72) {
            m0 = m0(242, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 73) {
            m0 = m0(95, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 74) {
            m0 = m0(132, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 75) {
            m0 = m0(143, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 76) {
            m0 = m0(102, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 77) {
            m0 = m0(29, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 78) {
            m0 = m0(199, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 79) {
            m0 = m0(10, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 80) {
            m0 = m0(146, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 81) {
            m0 = m0(79, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 82) {
            m0 = m0(225, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 83) {
            m0 = m0(149, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 84) {
            m0 = m0(236, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 85) {
            m0 = m0(245, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 86) {
            m0 = m0(56, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 87) {
            m0 = m0(105, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 88) {
            m0 = m0(27, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 89) {
            m0 = m0(235, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 90) {
            m0 = m0(162, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 91) {
            m0 = m0(201, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 92) {
            m0 = m0(193, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 93) {
            m0 = m0(208, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 94) {
            m0 = m0(104, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 95) {
            m0 = m0(96, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 96) {
            m0 = m0(209, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 97) {
            m0 = m0(155, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 98) {
            m0 = m0(34, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 99) {
            m0 = m0(68, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 100) {
            m0 = m0(202, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 101) {
            m0 = m0(169, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 102) {
            m0 = m0(49, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 103) {
            m0 = m0(13, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 104) {
            m0 = m0(134, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 105) {
            m0 = m0(45, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 106) {
            m0 = m0(226, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 107) {
            m0 = m0(255, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 108) {
            m0 = m0(14, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 109) {
            m0 = m0(52, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 110) {
            m0 = m0(33, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 111) {
            m0 = m0(62, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 112) {
            m0 = m0(44, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 113) {
            m0 = m0(186, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 114) {
            m0 = m0(6, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 115) {
            m0 = m0(121, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 116) {
            m0 = m0(21, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 117) {
            m0 = m0(244, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 118) {
            m0 = m0(131, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 119) {
            m0 = m0(64, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 120) {
            m0 = m0(111, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 121) {
            m0 = m0(123, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 122) {
            m0 = m0(248, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 123) {
            m0 = m0(124, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 124) {
            m0 = m0(36, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 125) {
            m0 = m0(9, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 126) {
            m0 = m0(58, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 127) {
            m0 = m0(112, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 128) {
            m0 = m0(222, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 129) {
            m0 = m0(130, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 130) {
            m0 = m0(254, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 131) {
            m0 = m0(120, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 132) {
            m0 = m0(75, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 133) {
            m0 = m0(224, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 134) {
            m0 = m0(76, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 135) {
            m0 = m0(145, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 136) {
            m0 = m0(80, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 137) {
            m0 = m0(231, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 138) {
            m0 = m0(198, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 139) {
            m0 = m0(219, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 140) {
            m0 = m0(182, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 141) {
            m0 = m0(24, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 142) {
            m0 = m0(126, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 143) {
            m0 = m0(40, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 144) {
            m0 = m0(246, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 145) {
            m0 = m0(192, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 146) {
            m0 = m0(78, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 147) {
            m0 = m0(166, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 148) {
            m0 = m0(140, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 149) {
            m0 = m0(158, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 150) {
            m0 = m0(223, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 151) {
            m0 = m0(57, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 152) {
            m0 = m0(207, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 153) {
            m0 = m0(90, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 154) {
            m0 = m0(161, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 155) {
            m0 = m0(54, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 156) {
            m0 = m0(38, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 157) {
            m0 = m0(252, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 158) {
            m0 = m0(72, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 159) {
            m0 = m0(203, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 160) {
            m0 = m0(70, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 161) {
            m0 = m0(85, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 162) {
            m0 = m0(171, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 163) {
            m0 = m0(107, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 164) {
            m0 = m0(98, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 165) {
            m0 = m0(4, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 166) {
            m0 = m0(51, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 167) {
            m0 = m0(188, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 168) {
            m0 = m0(238, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 169) {
            m0 = m0(15, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 170) {
            m0 = m0(147, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 171) {
            m0 = m0(237, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 172) {
            m0 = m0(65, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 173) {
            m0 = m0(214, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 174) {
            m0 = m0(99, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 175) {
            m0 = m0(183, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 176) {
            m0 = m0(22, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 177) {
            m0 = m0(5, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 178) {
            m0 = m0(92, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 179) {
            m0 = m0(141, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 180) {
            m0 = m0(184, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 181) {
            m0 = m0(30, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 182) {
            m0 = m0(108, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 183) {
            m0 = m0(60, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 184) {
            m0 = m0(135, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 185) {
            m0 = m0(118, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 186) {
            m0 = m0(127, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 187) {
            m0 = m0(205, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 188) {
            m0 = m0(133, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 189) {
            m0 = m0(159, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 190) {
            m0 = m0(19, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 191) {
            m0 = m0(197, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 192) {
            m0 = m0(74, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 193) {
            m0 = m0(17, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 194) {
            m0 = m0(59, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 195) {
            m0 = m0(138, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 196) {
            m0 = m0(195, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 197) {
            m0 = m0(119, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 198) {
            m0 = m0(8, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 199) {
            m0 = m0(25, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 200) {
            m0 = m0(206, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 201) {
            m0 = m0(55, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 202) {
            m0 = m0(106, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 203) {
            m0 = m0(91, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 204) {
            m0 = m0(160, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 205) {
            m0 = m0(122, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 206) {
            m0 = m0(218, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 207) {
            m0 = m0(37, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 208) {
            m0 = m0(181, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 209) {
            m0 = m0(211, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 210) {
            m0 = m0(212, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 211) {
            m0 = m0(234, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 212) {
            m0 = m0(241, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 213) {
            m0 = m0(46, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 214) {
            m0 = m0(77, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 215) {
            m0 = m0(170, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 216) {
            m0 = m0(11, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 217) {
            m0 = m0(109, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 218) {
            m0 = m0(16, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 219) {
            m0 = m0(249, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 220) {
            m0 = m0(168, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 221) {
            m0 = m0(230, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 222) {
            m0 = m0(215, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 223) {
            m0 = m0(174, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 224) {
            m0 = m0(204, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 225) {
            m0 = m0(164, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 226) {
            m0 = m0(2, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 227) {
            m0 = m0(253, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 228) {
            m0 = m0(94, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 229) {
            m0 = m0(31, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 230) {
            m0 = m0(189, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 231) {
            m0 = m0(35, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 232) {
            m0 = m0(153, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 233) {
            m0 = m0(180, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 234) {
            m0 = m0(103, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 235) {
            m0 = m0(142, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 236) {
            m0 = m0(1, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 237) {
            m0 = m0(137, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 238) {
            m0 = m0(187, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 239) {
            m0 = m0(84, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 240) {
            m0 = m0(165, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 241) {
            m0 = m0(26, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 242) {
            m0 = m0(87, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 243) {
            m0 = m0(93, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 244) {
            m0 = m0(83, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 245) {
            m0 = m0(86, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 246) {
            m0 = m0(0, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 247) {
            m0 = m0(151, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 248) {
            m0 = m0(3, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 249) {
            m0 = m0(167, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 250) {
            m0 = m0(53, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 251) {
            m0 = m0(176, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 252) {
            m0 = m0(227, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 253) {
            m0 = m0(163, getSecretNumber(scramble));
            i10 = 255;
        } else if (i11 == 254) {
            m0 = m0(229, getSecretNumber(scramble));
            i10 = 255;
        } else {
            i10 = 255;
            m0 = i11 == 255 ? m0(61, getSecretNumber(scramble)) : 0;
        }
        if ((m0 & i10) != 172) {
            return false;
        }
        scramble = scramble(scramble);
        if (i12 == 0) {
            m0 = m1(29, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 1) {
            m0 = m1(131, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 2) {
            m0 = m1(174, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 3) {
            m0 = m1(82, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 4) {
            m0 = m1(200, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 5) {
            m0 = m1(183, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 6) {
            m0 = m1(179, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 7) {
            m0 = m1(143, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 8) {
            m0 = m1(182, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 9) {
            m0 = m1(216, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 10) {
            m0 = m1(9, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 11) {
            m0 = m1(79, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 12) {
            m0 = m1(44, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 13) {
            m0 = m1(203, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 14) {
            m0 = m1(167, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 15) {
            m0 = m1(6, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 16) {
            m0 = m1(135, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 17) {
            m0 = m1(62, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 18) {
            m0 = m1(4, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 19) {
            m0 = m1(58, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 20) {
            m0 = m1(242, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 21) {
            m0 = m1(84, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 22) {
            m0 = m1(72, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 23) {
            m0 = m1(175, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 24) {
            m0 = m1(171, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 25) {
            m0 = m1(126, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 26) {
            m0 = m1(140, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 27) {
            m0 = m1(188, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 28) {
            m0 = m1(18, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 29) {
            m0 = m1(250, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 30) {
            m0 = m1(114, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 31) {
            m0 = m1(205, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 32) {
            m0 = m1(137, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 33) {
            m0 = m1(142, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 34) {
            m0 = m1(16, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 35) {
            m0 = m1(163, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 36) {
            m0 = m1(159, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 37) {
            m0 = m1(24, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 38) {
            m0 = m1(105, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 39) {
            m0 = m1(154, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 40) {
            m0 = m1(186, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 41) {
            m0 = m1(209, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 42) {
            m0 = m1(169, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 43) {
            m0 = m1(116, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 44) {
            m0 = m1(138, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 45) {
            m0 = m1(206, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 46) {
            m0 = m1(57, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 47) {
            m0 = m1(219, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 48) {
            m0 = m1(132, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 49) {
            m0 = m1(234, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 50) {
            m0 = m1(129, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 51) {
            m0 = m1(127, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 52) {
            m0 = m1(247, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 53) {
            m0 = m1(28, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 54) {
            m0 = m1(49, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 55) {
            m0 = m1(178, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 56) {
            m0 = m1(5, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 57) {
            m0 = m1(37, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 58) {
            m0 = m1(93, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 59) {
            m0 = m1(148, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 60) {
            m0 = m1(25, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 61) {
            m0 = m1(238, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 62) {
            m0 = m1(118, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 63) {
            m0 = m1(50, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 64) {
            m0 = m1(166, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 65) {
            m0 = m1(102, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 66) {
            m0 = m1(146, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 67) {
            m0 = m1(231, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 68) {
            m0 = m1(81, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 69) {
            m0 = m1(86, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 70) {
            m0 = m1(201, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 71) {
            m0 = m1(33, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 72) {
            m0 = m1(197, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 73) {
            m0 = m1(181, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 74) {
            m0 = m1(155, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 75) {
            m0 = m1(133, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 76) {
            m0 = m1(85, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 77) {
            m0 = m1(224, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 78) {
            m0 = m1(176, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 79) {
            m0 = m1(208, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 80) {
            m0 = m1(170, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 81) {
            m0 = m1(99, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 82) {
            m0 = m1(40, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 83) {
            m0 = m1(38, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 84) {
            m0 = m1(204, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 85) {
            m0 = m1(194, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 86) {
            m0 = m1(74, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 87) {
            m0 = m1(222, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 88) {
            m0 = m1(144, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 89) {
            m0 = m1(145, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 90) {
            m0 = m1(212, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 91) {
            m0 = m1(161, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 92) {
            m0 = m1(141, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 93) {
            m0 = m1(7, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 94) {
            m0 = m1(123, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 95) {
            m0 = m1(92, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 96) {
            m0 = m1(26, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 97) {
            m0 = m1(185, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 98) {
            m0 = m1(101, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 99) {
            m0 = m1(119, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 100) {
            m0 = m1(223, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 101) {
            m0 = m1(164, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 102) {
            m0 = m1(31, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 103) {
            m0 = m1(172, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 104) {
            m0 = m1(249, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 105) {
            m0 = m1(43, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 106) {
            m0 = m1(88, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 107) {
            m0 = m1(8, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 108) {
            m0 = m1(19, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 109) {
            m0 = m1(61, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 110) {
            m0 = m1(241, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 111) {
            m0 = m1(76, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 112) {
            m0 = m1(157, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 113) {
            m0 = m1(47, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 114) {
            m0 = m1(111, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 115) {
            m0 = m1(130, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 116) {
            m0 = m1(60, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 117) {
            m0 = m1(120, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 118) {
            m0 = m1(252, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 119) {
            m0 = m1(90, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 120) {
            m0 = m1(117, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 121) {
            m0 = m1(207, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 122) {
            m0 = m1(192, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 123) {
            m0 = m1(189, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 124) {
            m0 = m1(158, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 125) {
            m0 = m1(23, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 126) {
            m0 = m1(253, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 127) {
            m0 = m1(199, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 128) {
            m0 = m1(80, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 129) {
            m0 = m1(106, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 130) {
            m0 = m1(41, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 131) {
            m0 = m1(160, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 132) {
            m0 = m1(221, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 133) {
            m0 = m1(233, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 134) {
            m0 = m1(71, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 135) {
            m0 = m1(0, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 136) {
            m0 = m1(36, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 137) {
            m0 = m1(32, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 138) {
            m0 = m1(230, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 139) {
            m0 = m1(246, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 140) {
            m0 = m1(52, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 141) {
            m0 = m1(248, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 142) {
            m0 = m1(147, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 143) {
            m0 = m1(150, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 144) {
            m0 = m1(95, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 145) {
            m0 = m1(87, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 146) {
            m0 = m1(104, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 147) {
            m0 = m1(34, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 148) {
            m0 = m1(232, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 149) {
            m0 = m1(229, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 150) {
            m0 = m1(202, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 151) {
            m0 = m1(63, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 152) {
            m0 = m1(66, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 153) {
            m0 = m1(39, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 154) {
            m0 = m1(168, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 155) {
            m0 = m1(108, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 156) {
            m0 = m1(139, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 157) {
            m0 = m1(22, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 158) {
            m0 = m1(244, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 159) {
            m0 = m1(75, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 160) {
            m0 = m1(190, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 161) {
            m0 = m1(98, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 162) {
            m0 = m1(124, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 163) {
            m0 = m1(237, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 164) {
            m0 = m1(77, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 165) {
            m0 = m1(193, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 166) {
            m0 = m1(149, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 167) {
            m0 = m1(11, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 168) {
            m0 = m1(100, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 169) {
            m0 = m1(240, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 170) {
            m0 = m1(227, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 171) {
            m0 = m1(42, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 172) {
            m0 = m1(121, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 173) {
            m0 = m1(162, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 174) {
            m0 = m1(55, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 175) {
            m0 = m1(215, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 176) {
            m0 = m1(165, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 177) {
            m0 = m1(48, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 178) {
            m0 = m1(67, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 179) {
            m0 = m1(211, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 180) {
            m0 = m1(35, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 181) {
            m0 = m1(56, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 182) {
            m0 = m1(70, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 183) {
            m0 = m1(54, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 184) {
            m0 = m1(78, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 185) {
            m0 = m1(14, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 186) {
            m0 = m1(45, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 187) {
            m0 = m1(187, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 188) {
            m0 = m1(89, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 189) {
            m0 = m1(184, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 190) {
            m0 = m1(213, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 191) {
            m0 = m1(255, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 192) {
            m0 = m1(27, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 193) {
            m0 = m1(96, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 194) {
            m0 = m1(1, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 195) {
            m0 = m1(69, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 196) {
            m0 = m1(122, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 197) {
            m0 = m1(125, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 198) {
            m0 = m1(110, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 199) {
            m0 = m1(217, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 200) {
            m0 = m1(228, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 201) {
            m0 = m1(91, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 202) {
            m0 = m1(156, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 203) {
            m0 = m1(113, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 204) {
            m0 = m1(243, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 205) {
            m0 = m1(65, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 206) {
            m0 = m1(196, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 207) {
            m0 = m1(64, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 208) {
            m0 = m1(3, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 209) {
            m0 = m1(128, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 210) {
            m0 = m1(109, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 211) {
            m0 = m1(12, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 212) {
            m0 = m1(153, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 213) {
            m0 = m1(173, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 214) {
            m0 = m1(53, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 215) {
            m0 = m1(94, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 216) {
            m0 = m1(68, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 217) {
            m0 = m1(97, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 218) {
            m0 = m1(152, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 219) {
            m0 = m1(151, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 220) {
            m0 = m1(2, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 221) {
            m0 = m1(73, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 222) {
            m0 = m1(107, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 223) {
            m0 = m1(236, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 224) {
            m0 = m1(17, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 225) {
            m0 = m1(46, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 226) {
            m0 = m1(112, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 227) {
            m0 = m1(177, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 228) {
            m0 = m1(10, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 229) {
            m0 = m1(103, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 230) {
            m0 = m1(225, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 231) {
            m0 = m1(254, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 232) {
            m0 = m1(136, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 233) {
            m0 = m1(245, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 234) {
            m0 = m1(13, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 235) {
            m0 = m1(218, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 236) {
            m0 = m1(115, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 237) {
            m0 = m1(239, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 238) {
            m0 = m1(195, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 239) {
            m0 = m1(214, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 240) {
            m0 = m1(180, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 241) {
            m0 = m1(134, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 242) {
            m0 = m1(83, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 243) {
            m0 = m1(30, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 244) {
            m0 = m1(59, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 245) {
            m0 = m1(20, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 246) {
            m0 = m1(51, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 247) {
            m0 = m1(235, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 248) {
            m0 = m1(191, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 249) {
            m0 = m1(226, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 250) {
            m0 = m1(15, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 251) {
            m0 = m1(21, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 252) {
            m0 = m1(251, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 253) {
            m0 = m1(210, getSecretNumber(scramble));
            i10 = 255;
        } else if (i12 == 254) {
            m0 = m1(198, getSecretNumber(scramble));
            i10 = 255;
        } else {
            i10 = 255;
            m0 = i12 == 255 ? m1(220, getSecretNumber(scramble)) : 0;
        }
        if ((m0 & i10) != 6) {
            return false;
        }
        scramble = scramble(scramble);
        if (i13 == 0) {
            i10 = m2(i10, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 1) {
            i10 = m2(30, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 2) {
            i10 = m2(98, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 3) {
            i10 = m2(78, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 4) {
            i10 = m2(198, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 5) {
            i10 = m2(151, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 6) {
            i10 = m2(15, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 7) {
            i10 = m2(171, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 8) {
            i10 = m2(92, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 9) {
            i10 = m2(236, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 10) {
            i10 = m2(93, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 11) {
            i10 = m2(136, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 12) {
            i10 = m2(206, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 13) {
            i10 = m2(220, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 14) {
            i10 = m2(56, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 15) {
            i10 = m2(156, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 16) {
            i10 = m2(54, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 17) {
            i10 = m2(50, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 18) {
            i10 = m2(82, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 19) {
            i10 = m2(112, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 20) {
            i10 = m2(123, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 21) {
            i10 = m2(14, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 22) {
            i10 = m2(77, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 23) {
            i10 = m2(12, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 24) {
            i10 = m2(184, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 25) {
            i10 = m2(214, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 26) {
            i10 = m2(208, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 27) {
            i10 = m2(145, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 28) {
            i10 = m2(66, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 29) {
            i10 = m2(40, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 30) {
            i10 = m2(52, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 31) {
            i10 = m2(224, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 32) {
            i10 = m2(213, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 33) {
            i10 = m2(134, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 34) {
            i10 = m2(227, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 35) {
            i10 = m2(250, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 36) {
            i10 = m2(22, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 37) {
            i10 = m2(114, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 38) {
            i10 = m2(79, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 39) {
            i10 = m2(143, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 40) {
            i10 = m2(10, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 41) {
            i10 = m2(55, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 42) {
            i10 = m2(174, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 43) {
            i10 = m2(28, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 44) {
            i10 = m2(85, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 45) {
            i10 = m2(221, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 46) {
            i10 = m2(154, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 47) {
            i10 = m2(248, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 48) {
            i10 = m2(84, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 49) {
            i10 = m2(175, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 50) {
            i10 = m2(168, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 51) {
            i10 = m2(144, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 52) {
            i10 = m2(11, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 53) {
            i10 = m2(32, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 54) {
            i10 = m2(64, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 55) {
            i10 = m2(207, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 56) {
            i10 = m2(147, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 57) {
            i10 = m2(58, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 58) {
            i10 = m2(176, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 59) {
            i10 = m2(111, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 60) {
            i10 = m2(108, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 61) {
            i10 = m2(142, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 62) {
            i10 = m2(216, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 63) {
            i10 = m2(187, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 64) {
            i10 = m2(110, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 65) {
            i10 = m2(195, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 66) {
            i10 = m2(5, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 67) {
            i10 = m2(219, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 68) {
            i10 = m2(72, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 69) {
            i10 = m2(235, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 70) {
            i10 = m2(49, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 71) {
            i10 = m2(120, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 72) {
            i10 = m2(232, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 73) {
            i10 = m2(46, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 74) {
            i10 = m2(155, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 75) {
            i10 = m2(23, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 76) {
            i10 = m2(27, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 77) {
            i10 = m2(185, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 78) {
            i10 = m2(233, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 79) {
            i10 = m2(57, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 80) {
            i10 = m2(170, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 81) {
            i10 = m2(18, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 82) {
            i10 = m2(71, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 83) {
            i10 = m2(203, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 84) {
            i10 = m2(88, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 85) {
            i10 = m2(196, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 86) {
            i10 = m2(140, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 87) {
            i10 = m2(223, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 88) {
            i10 = m2(109, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 89) {
            i10 = m2(131, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 90) {
            i10 = m2(103, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 91) {
            i10 = m2(26, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 92) {
            m0 = 251;
            i10 = m2(251, getSecretNumber(scramble));
        } else if (i13 == 93) {
            i10 = m2(48, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 94) {
            i10 = m2(180, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 95) {
            i10 = m2(83, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 96) {
            i10 = m2(106, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 97) {
            i10 = m2(115, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 98) {
            i10 = m2(130, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 99) {
            i10 = m2(16, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 100) {
            i10 = m2(133, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 101) {
            i10 = m2(44, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 102) {
            i10 = m2(164, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 103) {
            i10 = m2(241, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 104) {
            i10 = m2(182, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 105) {
            i10 = m2(70, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 106) {
            i10 = m2(204, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 107) {
            i10 = m2(9, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 108) {
            i10 = m2(218, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 109) {
            i10 = m2(107, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 110) {
            i10 = m2(179, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 111) {
            i10 = m2(188, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 112) {
            i10 = m2(6, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 113) {
            i10 = m2(160, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 114) {
            i10 = m2(190, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 115) {
            i10 = m2(13, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 116) {
            i10 = m2(209, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 117) {
            i10 = m2(230, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 118) {
            i10 = m2(119, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 119) {
            i10 = m2(197, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 120) {
            i10 = m2(226, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 121) {
            i10 = m2(124, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 122) {
            i10 = m2(121, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 123) {
            i10 = m2(240, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 124) {
            i10 = m2(80, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 125) {
            i10 = m2(163, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 126) {
            i10 = m2(97, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 127) {
            i10 = m2(38, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 128) {
            i10 = m2(149, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 129) {
            i10 = m2(94, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 130) {
            i10 = m2(202, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 131) {
            i10 = m2(243, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 132) {
            i10 = m2(193, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 133) {
            i10 = m2(238, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 134) {
            i10 = m2(167, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 135) {
            i10 = m2(138, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 136) {
            i10 = m2(148, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 137) {
            i10 = m2(17, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 138) {
            i10 = m2(3, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 139) {
            i10 = m2(51, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 140) {
            i10 = m2(127, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 141) {
            i10 = m2(210, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 142) {
            i10 = m2(62, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 143) {
            i10 = m2(205, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 144) {
            i10 = m2(239, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 145) {
            i10 = m2(126, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 146) {
            i10 = m2(169, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 147) {
            i10 = m2(63, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 148) {
            i10 = m2(95, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 149) {
            i10 = m2(228, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 150) {
            i10 = m2(199, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 151) {
            i10 = m2(186, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 152) {
            i10 = m2(81, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 153) {
            i10 = m2(53, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 154) {
            i10 = m2(152, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 155) {
            i10 = m2(67, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 156) {
            i10 = m2(125, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 157) {
            i10 = m2(0, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 158) {
            i10 = m2(153, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 159) {
            i10 = m2(99, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 160) {
            i10 = m2(150, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 161) {
            i10 = m2(25, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 162) {
            i10 = m2(217, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 163) {
            i10 = m2(229, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 164) {
            i10 = m2(102, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 165) {
            i10 = m2(69, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 166) {
            i10 = m2(246, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 167) {
            i10 = m2(90, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 168) {
            i10 = m2(117, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 169) {
            i10 = m2(244, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 170) {
            i10 = m2(60, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 171) {
            i10 = m2(178, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 172) {
            i10 = m2(73, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 173) {
            i10 = m2(234, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 174) {
            i10 = m2(2, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 175) {
            i10 = m2(181, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 176) {
            i10 = m2(75, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 177) {
            i10 = m2(20, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 178) {
            i10 = m2(24, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 179) {
            i10 = m2(21, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 180) {
            i10 = m2(8, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 181) {
            i10 = m2(35, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 182) {
            i10 = m2(141, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 183) {
            i10 = m2(165, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 184) {
            i10 = m2(201, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 185) {
            i10 = m2(237, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 186) {
            i10 = m2(96, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 187) {
            i10 = m2(211, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 188) {
            i10 = m2(129, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 189) {
            i10 = m2(159, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 190) {
            i10 = m2(19, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 191) {
            i10 = m2(189, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 192) {
            i10 = m2(135, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 193) {
            i10 = m2(158, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 194) {
            i10 = m2(33, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 195) {
            i10 = m2(104, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 196) {
            i10 = m2(91, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 197) {
            i10 = m2(116, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 198) {
            i10 = m2(177, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 199) {
            i10 = m2(47, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 200) {
            i10 = m2(247, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 201) {
            i10 = m2(137, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 202) {
            i10 = m2(122, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 203) {
            i10 = m2(173, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 204) {
            i10 = m2(59, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 205) {
            i10 = m2(113, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 206) {
            i10 = m2(29, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 207) {
            i10 = m2(245, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 208) {
            i10 = m2(242, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 209) {
            i10 = m2(128, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 210) {
            i10 = m2(39, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 211) {
            i10 = m2(86, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 212) {
            i10 = m2(192, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 213) {
            i10 = m2(252, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 214) {
            i10 = m2(37, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 215) {
            i10 = m2(61, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 216) {
            i10 = m2(89, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 217) {
            i10 = m2(200, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 218) {
            i10 = m2(157, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 219) {
            i10 = m2(68, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 220) {
            i10 = m2(225, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 221) {
            i10 = m2(139, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 222) {
            i10 = m2(1, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 223) {
            i10 = m2(254, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 224) {
            i10 = m2(36, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 225) {
            i10 = m2(146, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 226) {
            i10 = m2(162, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 227) {
            i10 = m2(42, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 228) {
            i10 = m2(45, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 229) {
            i10 = m2(166, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 230) {
            i10 = m2(172, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 231) {
            i10 = m2(65, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 232) {
            i10 = m2(231, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 233) {
            i10 = m2(31, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 234) {
            i10 = m2(105, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 235) {
            i10 = m2(222, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 236) {
            i10 = m2(43, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 237) {
            i10 = m2(212, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 238) {
            i10 = m2(118, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 239) {
            i10 = m2(34, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 240) {
            i10 = m2(215, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 241) {
            i10 = m2(74, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 242) {
            i10 = m2(87, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 243) {
            i10 = m2(253, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 244) {
            i10 = m2(194, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 245) {
            i10 = m2(249, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 246) {
            i10 = m2(100, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 247) {
            i10 = m2(41, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 248) {
            i10 = m2(76, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 249) {
            i10 = m2(101, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 250) {
            i10 = m2(4, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 251) {
            i10 = m2(191, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 252) {
            i10 = m2(132, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 253) {
            i10 = m2(183, getSecretNumber(scramble));
            m0 = 251;
        } else if (i13 == 254) {
            i10 = m2(7, getSecretNumber(scramble));
            m0 = 251;
        } else {
            i10 = i13 == 255 ? m2(161, getSecretNumber(scramble)) : 0;
            m0 = 251;
        }
        if ((i10 & m0) != 146) {
            return false;
        }
        scramble = scramble(scramble);
        if (i14 == 0) {
            i10 = m3(1, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 1) {
            i10 = m3(223, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 2) {
            i10 = m3(134, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 3) {
            i10 = m3(163, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 4) {
            i10 = m3(178, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 5) {
            i10 = m3(59, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 6) {
            i10 = m3(65, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 7) {
            i10 = m3(116, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 8) {
            i10 = m3(117, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 9) {
            i10 = m3(17, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 10) {
            i10 = m3(224, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 11) {
            i10 = m3(122, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 12) {
            i10 = m3(99, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 13) {
            i10 = m3(85, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 14) {
            i10 = m3(52, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 15) {
            i10 = m3(63, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 16) {
            i10 = m3(206, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 17) {
            i10 = m3(131, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 18) {
            i10 = m3(204, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 19) {
            i10 = m3(32, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 20) {
            i10 = m3(40, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 21) {
            i10 = m3(177, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 22) {
            i10 = m3(132, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 23) {
            i10 = m3(133, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 24) {
            i10 = m3(92, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 25) {
            i10 = m3(101, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 26) {
            i10 = m3(97, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 27) {
            i10 = m3(230, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 28) {
            i10 = m3(106, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 29) {
            i10 = m3(144, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 30) {
            i10 = m3(30, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 31) {
            i10 = m3(73, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 32) {
            i10 = m3(0, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 33) {
            i10 = m3(153, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 34) {
            i10 = m3(192, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 35) {
            i10 = m3(107, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 36) {
            i10 = m3(44, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 37) {
            i10 = m3(123, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 38) {
            i10 = m3(86, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 39) {
            i10 = m3(233, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 40) {
            i10 = m3(62, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 41) {
            i10 = m3(164, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 42) {
            i10 = m3(118, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 43) {
            i10 = m3(80, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 44) {
            i10 = m3(71, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 45) {
            i10 = m3(179, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 46) {
            i10 = m3(197, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 47) {
            i10 = m3(184, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 48) {
            i10 = m3(29, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 49) {
            i10 = m3(108, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 50) {
            i10 = m3(4, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 51) {
            i10 = m3(58, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 52) {
            i10 = m3(244, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 53) {
            i10 = m3(235, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 54) {
            i10 = m3(8, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 55) {
            i10 = m3(209, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 56) {
            i10 = m3(41, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 57) {
            i10 = m3(28, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 58) {
            i10 = m3(150, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 59) {
            i10 = m3(199, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 60) {
            i10 = m3(14, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 61) {
            i10 = m3(94, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 62) {
            i10 = m3(45, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 63) {
            i10 = m3(203, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 64) {
            i10 = m3(159, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 65) {
            i10 = m3(51, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 66) {
            i10 = m3(212, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 67) {
            i10 = m3(222, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 68) {
            i10 = m3(183, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 69) {
            i10 = m3(157, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 70) {
            i10 = m3(95, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 71) {
            i10 = m3(66, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 72) {
            i10 = m3(142, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 73) {
            i10 = m3(34, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 74) {
            i10 = m3(185, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 75) {
            i10 = m3(61, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 76) {
            i10 = m3(74, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 77) {
            i10 = m3(26, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 78) {
            i10 = m3(161, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 79) {
            i10 = m3(39, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 80) {
            i10 = m3(55, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 81) {
            i10 = m3(248, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 82) {
            i10 = m3(16, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 83) {
            i10 = m3(180, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 84) {
            i10 = m3(191, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 85) {
            m0 = 247;
            i10 = m3(247, getSecretNumber(scramble));
        } else if (i14 == 86) {
            i10 = m3(25, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 87) {
            i10 = m3(129, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 88) {
            i10 = m3(91, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 89) {
            i10 = m3(54, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 90) {
            i10 = m3(181, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 91) {
            i10 = m3(88, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 92) {
            i10 = m3(207, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 93) {
            i10 = m3(193, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 94) {
            i10 = m3(5, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 95) {
            i10 = m3(216, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 96) {
            i10 = m3(231, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 97) {
            i10 = m3(121, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 98) {
            i10 = m3(211, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 99) {
            i10 = m3(174, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 100) {
            i10 = m3(167, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 101) {
            i10 = m3(255, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 102) {
            i10 = m3(227, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 103) {
            i10 = m3(176, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 104) {
            i10 = m3(82, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 105) {
            i10 = m3(137, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 106) {
            i10 = m3(12, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 107) {
            i10 = m3(38, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 108) {
            i10 = m3(198, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 109) {
            i10 = m3(109, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 110) {
            i10 = m3(152, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 111) {
            i10 = m3(250, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 112) {
            i10 = m3(126, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 113) {
            i10 = m3(169, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 114) {
            i10 = m3(187, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 115) {
            i10 = m3(33, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 116) {
            i10 = m3(253, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 117) {
            i10 = m3(87, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 118) {
            i10 = m3(173, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 119) {
            i10 = m3(221, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 120) {
            i10 = m3(46, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 121) {
            i10 = m3(182, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 122) {
            i10 = m3(24, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 123) {
            i10 = m3(84, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 124) {
            i10 = m3(228, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 125) {
            i10 = m3(239, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 126) {
            i10 = m3(75, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 127) {
            i10 = m3(19, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 128) {
            i10 = m3(72, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 129) {
            i10 = m3(112, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 130) {
            i10 = m3(208, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 131) {
            i10 = m3(251, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 132) {
            i10 = m3(220, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 133) {
            i10 = m3(254, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 134) {
            i10 = m3(90, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 135) {
            i10 = m3(218, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 136) {
            i10 = m3(2, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 137) {
            i10 = m3(64, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 138) {
            i10 = m3(246, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 139) {
            i10 = m3(50, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 140) {
            i10 = m3(114, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 141) {
            i10 = m3(156, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 142) {
            i10 = m3(168, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 143) {
            i10 = m3(160, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 144) {
            i10 = m3(148, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 145) {
            i10 = m3(68, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 146) {
            i10 = m3(242, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 147) {
            i10 = m3(130, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 148) {
            i10 = m3(113, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 149) {
            i10 = m3(171, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 150) {
            i10 = m3(139, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 151) {
            i10 = m3(76, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 152) {
            i10 = m3(23, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 153) {
            i10 = m3(49, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 154) {
            i10 = m3(138, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 155) {
            i10 = m3(6, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 156) {
            i10 = m3(225, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 157) {
            i10 = m3(241, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 158) {
            i10 = m3(11, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 159) {
            i10 = m3(213, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 160) {
            i10 = m3(48, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 161) {
            i10 = m3(196, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 162) {
            i10 = m3(110, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 163) {
            i10 = m3(146, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 164) {
            i10 = m3(119, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 165) {
            i10 = m3(202, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 166) {
            i10 = m3(69, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 167) {
            i10 = m3(237, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 168) {
            i10 = m3(22, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 169) {
            i10 = m3(93, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 170) {
            i10 = m3(175, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 171) {
            i10 = m3(154, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 172) {
            i10 = m3(102, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 173) {
            i10 = m3(120, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 174) {
            i10 = m3(21, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 175) {
            i10 = m3(57, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 176) {
            i10 = m3(140, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 177) {
            i10 = m3(9, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 178) {
            i10 = m3(141, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 179) {
            i10 = m3(162, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 180) {
            i10 = m3(190, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 181) {
            i10 = m3(60, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 182) {
            i10 = m3(53, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 183) {
            i10 = m3(205, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 184) {
            i10 = m3(136, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 185) {
            i10 = m3(158, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 186) {
            i10 = m3(105, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 187) {
            i10 = m3(145, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 188) {
            i10 = m3(166, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 189) {
            i10 = m3(115, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 190) {
            i10 = m3(249, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 191) {
            i10 = m3(77, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 192) {
            i10 = m3(252, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 193) {
            i10 = m3(70, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 194) {
            i10 = m3(78, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 195) {
            i10 = m3(226, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 196) {
            i10 = m3(217, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 197) {
            i10 = m3(37, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 198) {
            i10 = m3(111, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 199) {
            i10 = m3(127, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 200) {
            i10 = m3(27, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 201) {
            i10 = m3(243, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 202) {
            i10 = m3(195, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 203) {
            i10 = m3(128, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 204) {
            i10 = m3(186, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 205) {
            i10 = m3(83, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 206) {
            i10 = m3(229, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 207) {
            i10 = m3(96, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 208) {
            i10 = m3(89, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 209) {
            i10 = m3(81, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 210) {
            i10 = m3(189, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 211) {
            i10 = m3(219, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 212) {
            i10 = m3(210, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 213) {
            i10 = m3(15, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 214) {
            i10 = m3(194, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 215) {
            i10 = m3(147, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 216) {
            i10 = m3(10, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 217) {
            i10 = m3(245, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 218) {
            i10 = m3(165, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 219) {
            i10 = m3(98, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 220) {
            i10 = m3(155, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 221) {
            i10 = m3(240, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 222) {
            i10 = m3(43, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 223) {
            i10 = m3(214, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 224) {
            i10 = m3(188, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 225) {
            i10 = m3(232, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 226) {
            i10 = m3(236, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 227) {
            i10 = m3(201, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 228) {
            i10 = m3(42, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 229) {
            i10 = m3(125, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 230) {
            i10 = m3(143, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 231) {
            i10 = m3(100, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 232) {
            i10 = m3(215, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 233) {
            i10 = m3(103, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 234) {
            i10 = m3(67, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 235) {
            i10 = m3(36, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 236) {
            i10 = m3(3, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 237) {
            i10 = m3(47, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 238) {
            i10 = m3(13, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 239) {
            i10 = m3(124, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 240) {
            i10 = m3(172, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 241) {
            i10 = m3(20, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 242) {
            i10 = m3(238, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 243) {
            i10 = m3(7, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 244) {
            i10 = m3(234, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 245) {
            i10 = m3(135, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 246) {
            i10 = m3(18, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 247) {
            i10 = m3(151, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 248) {
            i10 = m3(79, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 249) {
            i10 = m3(149, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 250) {
            i10 = m3(31, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 251) {
            i10 = m3(56, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 252) {
            i10 = m3(200, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 253) {
            i10 = m3(104, getSecretNumber(scramble));
            m0 = 247;
        } else if (i14 == 254) {
            i10 = m3(170, getSecretNumber(scramble));
            m0 = 247;
        } else {
            i10 = i14 == 255 ? m3(35, getSecretNumber(scramble)) : 0;
            m0 = 247;
        }
        if ((i10 & m0) != 97) {
            return false;
        }
        scramble = scramble(scramble);
        if (i15 == 0) {
            i10 = m4(144, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 1) {
            i10 = m4(158, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 2) {
            i10 = m4(58, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 3) {
            i10 = m4(155, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 4) {
            i10 = m4(10, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 5) {
            i10 = m4(130, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 6) {
            i10 = m4(143, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 7) {
            i10 = m4(78, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 8) {
            i10 = m4(170, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 9) {
            i10 = m4(39, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 10) {
            i10 = m4(110, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 11) {
            i10 = m4(250, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 12) {
            i10 = m4(246, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 13) {
            i10 = m4(7, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 14) {
            i10 = m4(214, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 15) {
            i10 = m4(235, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 16) {
            i10 = m4(25, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 17) {
            m0 = 202;
            i10 = m4(202, getSecretNumber(scramble));
        } else if (i15 == 18) {
            i10 = m4(157, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 19) {
            i10 = m4(89, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 20) {
            i10 = m4(237, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 21) {
            i10 = m4(131, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 22) {
            i10 = m4(52, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 23) {
            i10 = m4(233, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 24) {
            i10 = m4(161, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 25) {
            i10 = m4(245, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 26) {
            i10 = m4(181, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 27) {
            i10 = m4(184, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 28) {
            i10 = m4(116, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 29) {
            i10 = m4(26, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 30) {
            i10 = m4(254, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 31) {
            i10 = m4(159, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 32) {
            i10 = m4(244, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 33) {
            i10 = m4(101, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 34) {
            i10 = m4(186, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 35) {
            i10 = m4(248, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 36) {
            i10 = m4(72, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 37) {
            i10 = m4(70, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 38) {
            i10 = m4(142, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 39) {
            i10 = m4(205, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 40) {
            i10 = m4(168, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 41) {
            i10 = m4(134, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 42) {
            i10 = m4(173, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 43) {
            i10 = m4(3, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 44) {
            i10 = m4(54, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 45) {
            i10 = m4(222, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 46) {
            i10 = m4(51, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 47) {
            i10 = m4(104, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 48) {
            i10 = m4(123, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 49) {
            i10 = m4(34, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 50) {
            i10 = m4(206, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 51) {
            i10 = m4(2, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 52) {
            i10 = m4(188, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 53) {
            i10 = m4(73, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 54) {
            i10 = m4(95, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 55) {
            i10 = m4(11, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 56) {
            i10 = m4(20, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 57) {
            i10 = m4(38, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 58) {
            i10 = m4(69, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 59) {
            i10 = m4(113, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 60) {
            i10 = m4(179, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 61) {
            i10 = m4(183, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 62) {
            i10 = m4(192, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 63) {
            i10 = m4(30, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 64) {
            i10 = m4(99, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 65) {
            i10 = m4(215, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 66) {
            i10 = m4(129, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 67) {
            i10 = m4(6, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 68) {
            i10 = m4(24, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 69) {
            i10 = m4(133, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 70) {
            i10 = m4(198, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 71) {
            i10 = m4(98, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 72) {
            i10 = m4(49, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 73) {
            i10 = m4(92, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 74) {
            i10 = m4(66, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 75) {
            i10 = m4(106, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 76) {
            i10 = m4(154, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 77) {
            i10 = m4(118, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 78) {
            i10 = m4(164, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 79) {
            i10 = m4(145, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 80) {
            i10 = m4(177, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 81) {
            i10 = m4(121, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 82) {
            i10 = m4(190, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 83) {
            i10 = m4(84, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 84) {
            i10 = m4(59, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 85) {
            i10 = m4(172, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 86) {
            i10 = m4(149, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 87) {
            i10 = m4(75, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 88) {
            i10 = m4(23, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 89) {
            i10 = m4(151, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 90) {
            i10 = m4(207, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 91) {
            i10 = m4(19, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 92) {
            i10 = m4(8, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 93) {
            i10 = m4(15, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 94) {
            i10 = m4(247, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 95) {
            i10 = m4(37, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 96) {
            i10 = m4(167, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 97) {
            i10 = m4(255, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 98) {
            i10 = m4(102, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 99) {
            i10 = m4(226, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 100) {
            i10 = m4(135, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 101) {
            i10 = m4(100, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 102) {
            i10 = m4(18, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 103) {
            i10 = m4(176, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 104) {
            i10 = m4(171, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 105) {
            i10 = m4(4, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 106) {
            i10 = m4(105, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 107) {
            i10 = m4(111, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 108) {
            i10 = m4(251, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 109) {
            i10 = m4(9, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 110) {
            i10 = m4(219, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 111) {
            i10 = m4(88, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 112) {
            i10 = m4(93, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 113) {
            i10 = m4(213, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 114) {
            i10 = m4(169, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 115) {
            i10 = m4(16, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 116) {
            i10 = m4(229, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 117) {
            i10 = m4(57, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 118) {
            i10 = m4(61, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 119) {
            i10 = m4(35, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 120) {
            i10 = m4(65, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 121) {
            i10 = m4(238, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 122) {
            i10 = m4(141, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 123) {
            i10 = m4(216, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 124) {
            i10 = m4(199, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 125) {
            i10 = m4(182, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 126) {
            i10 = m4(22, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 127) {
            i10 = m4(230, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 128) {
            i10 = m4(200, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 129) {
            i10 = m4(42, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 130) {
            i10 = m4(76, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 131) {
            i10 = m4(225, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 132) {
            i10 = m4(74, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 133) {
            i10 = m4(166, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 134) {
            i10 = m4(147, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 135) {
            i10 = m4(242, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 136) {
            i10 = m4(50, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 137) {
            i10 = m4(103, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 138) {
            i10 = m4(68, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 139) {
            i10 = m4(193, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 140) {
            i10 = m4(67, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 141) {
            i10 = m4(28, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 142) {
            i10 = m4(243, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 143) {
            i10 = m4(162, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 144) {
            i10 = m4(194, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 145) {
            i10 = m4(45, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 146) {
            i10 = m4(43, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 147) {
            i10 = m4(17, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 148) {
            i10 = m4(124, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 149) {
            i10 = m4(31, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 150) {
            i10 = m4(55, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 151) {
            i10 = m4(21, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 152) {
            i10 = m4(47, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 153) {
            i10 = m4(197, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 154) {
            i10 = m4(126, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 155) {
            i10 = m4(122, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 156) {
            i10 = m4(196, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 157) {
            i10 = m4(136, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 158) {
            i10 = m4(204, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 159) {
            i10 = m4(79, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 160) {
            i10 = m4(132, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 161) {
            i10 = m4(32, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 162) {
            i10 = m4(91, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 163) {
            i10 = m4(140, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 164) {
            i10 = m4(234, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 165) {
            i10 = m4(236, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 166) {
            i10 = m4(195, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 167) {
            i10 = m4(125, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 168) {
            i10 = m4(12, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 169) {
            i10 = m4(109, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 170) {
            i10 = m4(185, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 171) {
            i10 = m4(0, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 172) {
            i10 = m4(64, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 173) {
            i10 = m4(137, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 174) {
            i10 = m4(53, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 175) {
            i10 = m4(241, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 176) {
            i10 = m4(178, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 177) {
            i10 = m4(138, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 178) {
            i10 = m4(127, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 179) {
            i10 = m4(112, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 180) {
            i10 = m4(160, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 181) {
            i10 = m4(71, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 182) {
            i10 = m4(87, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 183) {
            i10 = m4(48, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 184) {
            i10 = m4(56, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 185) {
            i10 = m4(120, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 186) {
            i10 = m4(240, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 187) {
            i10 = m4(175, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 188) {
            i10 = m4(40, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 189) {
            i10 = m4(150, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 190) {
            i10 = m4(114, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 191) {
            i10 = m4(119, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 192) {
            i10 = m4(221, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 193) {
            i10 = m4(146, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 194) {
            i10 = m4(201, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 195) {
            i10 = m4(228, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 196) {
            i10 = m4(224, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 197) {
            i10 = m4(44, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 198) {
            i10 = m4(152, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 199) {
            i10 = m4(227, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 200) {
            i10 = m4(86, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 201) {
            i10 = m4(156, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 202) {
            i10 = m4(212, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 203) {
            i10 = m4(62, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 204) {
            i10 = m4(80, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 205) {
            i10 = m4(96, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 206) {
            i10 = m4(208, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 207) {
            i10 = m4(63, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 208) {
            i10 = m4(253, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 209) {
            i10 = m4(108, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 210) {
            i10 = m4(203, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 211) {
            i10 = m4(165, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 212) {
            i10 = m4(115, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 213) {
            i10 = m4(128, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 214) {
            i10 = m4(90, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 215) {
            i10 = m4(210, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 216) {
            i10 = m4(153, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 217) {
            i10 = m4(1, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 218) {
            i10 = m4(85, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 219) {
            i10 = m4(41, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 220) {
            i10 = m4(83, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 221) {
            i10 = m4(13, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 222) {
            i10 = m4(148, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 223) {
            i10 = m4(232, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 224) {
            i10 = m4(27, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 225) {
            i10 = m4(97, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 226) {
            i10 = m4(60, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 227) {
            i10 = m4(107, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 228) {
            i10 = m4(189, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 229) {
            i10 = m4(218, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 230) {
            i10 = m4(187, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 231) {
            i10 = m4(211, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 232) {
            i10 = m4(191, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 233) {
            i10 = m4(163, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 234) {
            i10 = m4(139, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 235) {
            i10 = m4(239, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 236) {
            i10 = m4(77, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 237) {
            i10 = m4(209, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 238) {
            i10 = m4(29, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 239) {
            i10 = m4(223, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 240) {
            i10 = m4(94, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 241) {
            i10 = m4(117, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 242) {
            i10 = m4(82, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 243) {
            i10 = m4(81, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 244) {
            i10 = m4(14, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 245) {
            i10 = m4(217, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 246) {
            i10 = m4(5, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 247) {
            i10 = m4(33, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 248) {
            i10 = m4(174, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 249) {
            i10 = m4(180, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 250) {
            i10 = m4(252, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 251) {
            i10 = m4(231, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 252) {
            i10 = m4(220, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 253) {
            i10 = m4(36, getSecretNumber(scramble));
            m0 = 202;
        } else if (i15 == 254) {
            i10 = m4(46, getSecretNumber(scramble));
            m0 = 202;
        } else {
            i10 = i15 == 255 ? m4(249, getSecretNumber(scramble)) : 0;
            m0 = 202;
        }
        if ((i10 & m0) != 130) {
            return false;
        }
        if ((i6 & 65) != 65) {
            return false;
        }
        scramble = scramble(scramble);
        if (i16 == 0) {
            m0 = m6(6, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 1) {
            m0 = m6(112, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 2) {
            m0 = m6(67, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 3) {
            m0 = m6(152, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 4) {
            m0 = m6(88, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 5) {
            m0 = m6(74, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 6) {
            m0 = m6(161, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 7) {
            m0 = m6(124, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 8) {
            m0 = m6(42, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 9) {
            m0 = m6(100, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 10) {
            m0 = m6(247, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 11) {
            m0 = m6(70, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 12) {
            m0 = m6(226, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 13) {
            m0 = m6(19, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 14) {
            m0 = m6(215, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 15) {
            m0 = m6(61, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 16) {
            m0 = m6(141, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 17) {
            m0 = m6(186, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 18) {
            m0 = m6(190, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 19) {
            m0 = m6(129, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 20) {
            m0 = m6(24, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 21) {
            m0 = m6(255, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 22) {
            m0 = m6(173, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 23) {
            m0 = m6(131, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 24) {
            m0 = m6(23, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 25) {
            m0 = m6(180, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 26) {
            m0 = m6(25, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 27) {
            m0 = m6(27, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 28) {
            m0 = m6(33, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 29) {
            m0 = m6(84, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 30) {
            m0 = m6(237, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 31) {
            m0 = m6(245, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 32) {
            m0 = m6(30, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 33) {
            m0 = m6(45, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 34) {
            m0 = m6(8, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 35) {
            m0 = m6(122, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 36) {
            m0 = m6(126, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 37) {
            m0 = m6(133, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 38) {
            m0 = m6(234, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 39) {
            m0 = m6(114, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 40) {
            m0 = m6(185, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 41) {
            m0 = m6(89, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 42) {
            m0 = m6(97, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 43) {
            m0 = m6(203, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 44) {
            m0 = m6(125, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 45) {
            m0 = m6(10, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 46) {
            m0 = m6(90, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 47) {
            m0 = m6(213, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 48) {
            m0 = m6(71, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 49) {
            m0 = m6(99, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 50) {
            m0 = m6(172, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 51) {
            m0 = m6(196, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 52) {
            m0 = m6(224, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 53) {
            m0 = m6(208, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 54) {
            m0 = m6(251, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 55) {
            m0 = m6(206, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 56) {
            m0 = m6(209, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 57) {
            m0 = m6(142, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 58) {
            m0 = m6(91, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 59) {
            m0 = m6(239, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 60) {
            m0 = m6(174, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 61) {
            m0 = m6(176, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 62) {
            m0 = m6(94, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 63) {
            m0 = m6(0, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 64) {
            m0 = m6(4, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 65) {
            m0 = m6(75, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 66) {
            m0 = m6(167, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 67) {
            m0 = m6(222, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 68) {
            m0 = m6(205, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 69) {
            m0 = m6(146, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 70) {
            m0 = m6(156, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 71) {
            m0 = m6(108, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 72) {
            m0 = m6(240, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 73) {
            m0 = m6(199, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 74) {
            m0 = m6(76, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 75) {
            m0 = m6(238, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 76) {
            m0 = m6(18, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 77) {
            m0 = m6(51, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 78) {
            m0 = m6(63, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 79) {
            m0 = m6(228, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 80) {
            m0 = m6(113, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 81) {
            m0 = m6(16, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 82) {
            m0 = m6(158, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 83) {
            m0 = m6(182, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 84) {
            m0 = m6(183, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 85) {
            m0 = m6(69, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 86) {
            m0 = m6(110, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 87) {
            m0 = m6(9, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 88) {
            m0 = m6(65, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 89) {
            m0 = m6(120, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 90) {
            m0 = m6(249, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 91) {
            m0 = m6(204, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 92) {
            m0 = m6(81, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 93) {
            m0 = m6(233, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 94) {
            m0 = m6(34, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 95) {
            m0 = m6(62, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 96) {
            m0 = m6(220, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 97) {
            m0 = m6(216, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 98) {
            m0 = m6(166, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 99) {
            m0 = m6(162, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 100) {
            m0 = m6(57, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 101) {
            m0 = m6(13, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 102) {
            m0 = m6(78, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 103) {
            m0 = m6(192, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 104) {
            m0 = m6(159, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 105) {
            m0 = m6(7, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 106) {
            m0 = m6(191, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 107) {
            m0 = m6(171, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 108) {
            m0 = m6(17, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 109) {
            m0 = m6(188, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 110) {
            m0 = m6(211, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 111) {
            m0 = m6(218, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 112) {
            m0 = m6(168, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 113) {
            m0 = m6(246, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 114) {
            m0 = m6(135, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 115) {
            m0 = m6(128, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 116) {
            m0 = m6(56, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 117) {
            m0 = m6(225, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 118) {
            m0 = m6(140, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 119) {
            m0 = m6(232, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 120) {
            m0 = m6(231, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 121) {
            m0 = m6(107, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 122) {
            m0 = m6(14, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 123) {
            m0 = m6(11, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 124) {
            m0 = m6(58, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 125) {
            m0 = m6(153, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 126) {
            m0 = m6(136, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 127) {
            m0 = m6(201, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 128) {
            m0 = m6(60, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 129) {
            m0 = m6(36, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 130) {
            m0 = m6(132, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 131) {
            m0 = m6(243, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 132) {
            m0 = m6(111, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 133) {
            m0 = m6(73, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 134) {
            m0 = m6(163, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 135) {
            m0 = m6(144, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 136) {
            m0 = m6(164, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 137) {
            m0 = m6(39, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 138) {
            m0 = m6(236, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 139) {
            m0 = m6(137, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 140) {
            m0 = m6(77, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 141) {
            m0 = m6(160, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 142) {
            m0 = m6(47, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 143) {
            m0 = m6(241, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 144) {
            m0 = m6(87, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 145) {
            m0 = m6(66, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 146) {
            m0 = m6(200, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 147) {
            m0 = m6(223, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 148) {
            m0 = m6(170, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 149) {
            m0 = m6(250, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 150) {
            m0 = m6(37, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 151) {
            m0 = m6(103, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 152) {
            m0 = m6(92, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 153) {
            m0 = m6(157, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 154) {
            m0 = m6(96, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 155) {
            m0 = m6(105, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 156) {
            m0 = m6(217, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 157) {
            m0 = m6(28, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 158) {
            m0 = m6(139, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 159) {
            m0 = m6(53, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 160) {
            m0 = m6(93, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 161) {
            m0 = m6(82, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 162) {
            m0 = m6(179, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 163) {
            m0 = m6(130, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 164) {
            m0 = m6(195, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 165) {
            m0 = m6(35, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 166) {
            m0 = m6(2, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 167) {
            m0 = m6(26, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 168) {
            m0 = m6(59, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 169) {
            m0 = m6(229, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 170) {
            m0 = m6(101, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 171) {
            m0 = m6(116, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 172) {
            m0 = m6(147, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 173) {
            m0 = m6(109, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 174) {
            m0 = m6(40, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 175) {
            m0 = m6(44, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 176) {
            m0 = m6(214, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 177) {
            m0 = m6(184, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 178) {
            m0 = m6(235, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 179) {
            m0 = m6(80, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 180) {
            m0 = m6(154, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 181) {
            m0 = m6(79, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 182) {
            m0 = m6(21, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 183) {
            m0 = m6(43, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 184) {
            m0 = m6(119, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 185) {
            m0 = m6(207, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 186) {
            m0 = m6(193, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 187) {
            m0 = m6(104, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 188) {
            m0 = m6(102, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 189) {
            m0 = m6(244, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 190) {
            m0 = m6(22, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 191) {
            m0 = m6(85, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 192) {
            m0 = m6(68, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 193) {
            m0 = m6(106, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 194) {
            m0 = m6(202, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 195) {
            m0 = m6(151, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 196) {
            m0 = m6(254, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 197) {
            m0 = m6(41, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 198) {
            m0 = m6(145, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 199) {
            m0 = m6(15, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 200) {
            m0 = m6(98, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 201) {
            m0 = m6(219, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 202) {
            m0 = m6(49, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 203) {
            m0 = m6(117, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 204) {
            m0 = m6(143, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 205) {
            m0 = m6(5, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 206) {
            m0 = m6(48, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 207) {
            m0 = m6(72, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 208) {
            m0 = m6(86, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 209) {
            m0 = m6(20, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 210) {
            m0 = m6(198, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 211) {
            m0 = m6(12, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 212) {
            m0 = m6(253, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 213) {
            m0 = m6(248, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 214) {
            m0 = m6(1, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 215) {
            m0 = m6(118, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 216) {
            m0 = m6(242, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 217) {
            m0 = m6(177, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 218) {
            m0 = m6(29, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 219) {
            m0 = m6(175, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 220) {
            m0 = m6(148, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 221) {
            m0 = m6(227, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 222) {
            m0 = m6(121, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 223) {
            m0 = m6(115, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 224) {
            m0 = m6(50, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 225) {
            m0 = m6(134, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 226) {
            m0 = m6(123, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 227) {
            m0 = m6(3, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 228) {
            m0 = m6(83, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 229) {
            m0 = m6(38, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 230) {
            m0 = m6(194, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 231) {
            m0 = m6(54, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 232) {
            m0 = m6(230, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 233) {
            m0 = m6(127, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 234) {
            m0 = m6(210, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 235) {
            m0 = m6(64, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 236) {
            m0 = m6(189, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 237) {
            m0 = m6(165, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 238) {
            m0 = m6(149, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 239) {
            m0 = m6(181, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 240) {
            m0 = m6(252, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 241) {
            m0 = m6(212, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 242) {
            m0 = m6(32, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 243) {
            m0 = m6(95, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 244) {
            m0 = m6(187, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 245) {
            m0 = m6(155, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 246) {
            m0 = m6(150, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 247) {
            m0 = m6(55, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 248) {
            m0 = m6(178, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 249) {
            m0 = m6(46, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 250) {
            m0 = m6(221, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 251) {
            m0 = m6(169, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 252) {
            m0 = m6(31, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 253) {
            m0 = m6(52, getSecretNumber(scramble));
            i10 = 255;
        } else if (i16 == 254) {
            m0 = m6(138, getSecretNumber(scramble));
            i10 = 255;
        } else {
            i10 = 255;
            m0 = i16 == 255 ? m6(197, getSecretNumber(scramble)) : 0;
        }
        if ((m0 & i10) != 236) {
            return false;
        }
        int m7;
        scramble = scramble(scramble);
        if (i17 == 0) {
            m7 = m7(208, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 1) {
            m7 = m7(168, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 2) {
            m7 = m7(97, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 3) {
            m7 = m7(242, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 4) {
            m7 = m7(78, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 5) {
            m7 = m7(60, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 6) {
            m7 = m7(100, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 7) {
            m7 = m7(128, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 8) {
            m7 = m7(232, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 9) {
            m7 = m7(152, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 10) {
            m7 = m7(127, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 11) {
            m7 = m7(115, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 12) {
            m7 = m7(253, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 13) {
            m7 = m7(36, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 14) {
            m7 = m7(174, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 15) {
            m7 = m7(209, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 16) {
            m7 = m7(181, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 17) {
            m7 = m7(159, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 18) {
            m7 = m7(88, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 19) {
            m7 = m7(165, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 20) {
            m7 = m7(19, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 21) {
            m7 = m7(212, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 22) {
            m7 = m7(211, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 23) {
            m7 = m7(111, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 24) {
            m7 = m7(26, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 25) {
            m7 = m7(12, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 26) {
            m7 = m7(229, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 27) {
            m7 = m7(43, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 28) {
            m7 = m7(8, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 29) {
            m7 = m7(136, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 30) {
            m7 = m7(199, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 31) {
            m7 = m7(240, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 32) {
            m7 = m7(135, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 33) {
            m7 = m7(178, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 34) {
            m7 = m7(44, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 35) {
            m7 = m7(48, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 36) {
            m7 = m7(82, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 37) {
            m7 = m7(125, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 38) {
            m7 = m7(254, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 39) {
            m7 = m7(195, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 40) {
            m7 = m7(173, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 41) {
            m7 = m7(207, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 42) {
            m7 = m7(121, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 43) {
            m7 = m7(233, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 44) {
            m7 = m7(68, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 45) {
            m7 = m7(84, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 46) {
            m7 = m7(52, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 47) {
            m7 = m7(215, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 48) {
            m7 = m7(137, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 49) {
            m7 = m7(158, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 50) {
            m7 = m7(154, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 51) {
            m7 = m7(69, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 52) {
            m7 = m7(186, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 53) {
            m7 = m7(133, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 54) {
            m7 = m7(51, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 55) {
            m7 = m7(180, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 56) {
            m7 = m7(80, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 57) {
            m7 = m7(126, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 58) {
            m7 = m7(144, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 59) {
            m7 = m7(226, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 60) {
            m7 = m7(40, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 61) {
            m7 = m7(2, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 62) {
            m7 = m7(66, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 63) {
            m7 = m7(38, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 64) {
            m7 = m7(244, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 65) {
            m7 = m7(171, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 66) {
            m7 = m7(67, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 67) {
            m7 = m7(118, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 68) {
            m7 = m7(57, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 69) {
            m7 = m7(247, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 70) {
            m7 = m7(112, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 71) {
            m7 = m7(18, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 72) {
            m7 = m7(138, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 73) {
            m7 = m7(231, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 74) {
            m7 = m7(202, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 75) {
            m7 = m7(73, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 76) {
            m7 = m7(201, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 77) {
            m7 = m7(179, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 78) {
            m7 = m7(85, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 79) {
            m7 = m7(119, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 80) {
            m7 = m7(116, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 81) {
            m7 = m7(141, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 82) {
            m7 = m7(90, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 83) {
            m7 = m7(161, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 84) {
            m7 = m7(238, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 85) {
            m7 = m7(162, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 86) {
            m7 = m7(204, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 87) {
            m7 = m7(224, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 88) {
            m7 = m7(81, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 89) {
            m7 = m7(103, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 90) {
            m7 = m7(214, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 91) {
            m7 = m7(203, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 92) {
            m7 = m7(198, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 93) {
            m7 = m7(184, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 94) {
            m7 = m7(92, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 95) {
            m7 = m7(147, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 96) {
            m7 = m7(105, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 97) {
            m7 = m7(221, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 98) {
            m7 = m7(11, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 99) {
            m7 = m7(134, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 100) {
            m7 = m7(70, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 101) {
            m7 = m7(95, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 102) {
            m7 = m7(27, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 103) {
            m7 = m7(166, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 104) {
            m7 = m7(24, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 105) {
            m7 = m7(71, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 106) {
            m7 = m7(185, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 107) {
            m7 = m7(46, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 108) {
            m7 = m7(172, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 109) {
            m7 = m7(237, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 110) {
            m7 = m7(39, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 111) {
            m7 = m7(123, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 112) {
            m7 = m7(76, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 113) {
            m7 = m7(91, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 114) {
            m7 = m7(228, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 115) {
            m7 = m7(108, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 116) {
            m7 = m7(74, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 117) {
            m7 = m7(206, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 118) {
            m7 = m7(87, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 119) {
            m7 = m7(197, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 120) {
            m7 = m7(50, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 121) {
            m7 = m7(35, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 122) {
            m7 = m7(15, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 123) {
            m7 = m7(25, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 124) {
            m7 = m7(7, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 125) {
            m7 = m7(164, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 126) {
            m7 = m7(219, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 127) {
            m7 = m7(130, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 128) {
            m7 = m7(54, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 129) {
            m7 = m7(188, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 130) {
            m7 = m7(213, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 131) {
            m7 = m7(120, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 132) {
            m7 = m7(61, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 133) {
            m7 = m7(250, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 134) {
            m7 = m7(189, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 135) {
            m7 = m7(217, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 136) {
            m7 = m7(241, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 137) {
            m7 = m7(230, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 138) {
            m7 = m7(55, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 139) {
            m7 = m7(246, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 140) {
            m7 = m7(192, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 141) {
            m7 = m7(96, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 142) {
            m7 = m7(94, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 143) {
            m7 = m7(89, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 144) {
            m7 = m7(218, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 145) {
            m7 = m7(245, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 146) {
            m7 = m7(176, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 147) {
            m7 = m7(98, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 148) {
            m7 = m7(75, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 149) {
            m7 = m7(102, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 150) {
            m7 = m7(194, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 151) {
            m7 = m7(47, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 152) {
            m7 = m7(101, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 153) {
            m7 = m7(58, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 154) {
            m7 = m7(132, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 155) {
            m7 = m7(182, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 156) {
            m7 = m7(234, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 157) {
            m7 = m7(190, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 158) {
            m7 = m7(223, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 159) {
            m7 = m7(45, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 160) {
            m7 = m7(150, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 161) {
            m7 = m7(107, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 162) {
            m7 = m7(86, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 163) {
            m7 = m7(64, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 164) {
            m7 = m7(20, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 165) {
            m7 = m7(49, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 166) {
            m7 = m7(23, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 167) {
            m7 = m7(210, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 168) {
            m7 = m7(251, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 169) {
            m7 = m7(21, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 170) {
            m7 = m7(59, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 171) {
            m7 = m7(72, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 172) {
            m7 = m7(104, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 173) {
            m7 = m7(53, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 174) {
            m7 = m7(155, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 175) {
            m7 = m7(113, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 176) {
            m7 = m7(106, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 177) {
            m7 = m7(131, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 178) {
            m7 = m7(6, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 179) {
            m7 = m7(14, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 180) {
            m7 = m7(3, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 181) {
            m7 = m7(255, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 182) {
            m7 = m7(17, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 183) {
            m7 = m7(225, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 184) {
            m7 = m7(143, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 185) {
            m7 = m7(28, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 186) {
            m7 = m7(167, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 187) {
            m7 = m7(93, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 188) {
            m7 = m7(196, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 189) {
            m7 = m7(16, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 190) {
            m7 = m7(129, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 191) {
            m7 = m7(65, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 192) {
            m7 = m7(200, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 193) {
            m7 = m7(41, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 194) {
            m7 = m7(29, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 195) {
            m7 = m7(235, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 196) {
            m7 = m7(149, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 197) {
            m7 = m7(30, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 198) {
            m7 = m7(169, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 199) {
            m7 = m7(79, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 200) {
            m7 = m7(33, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 201) {
            m7 = m7(32, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 202) {
            m7 = m7(5, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 203) {
            m7 = m7(160, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 204) {
            m7 = m7(110, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 205) {
            m7 = m7(175, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 206) {
            m7 = m7(1, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 207) {
            m7 = m7(140, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 208) {
            m7 = m7(109, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 209) {
            m7 = m7(170, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 210) {
            m7 = m7(183, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 211) {
            m7 = m7(42, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 212) {
            m7 = m7(99, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 213) {
            m7 = m7(63, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 214) {
            m7 = m7(157, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 215) {
            m7 = m7(117, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 216) {
            m7 = m7(151, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 217) {
            m7 = m7(56, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 218) {
            m7 = m7(124, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 219) {
            m7 = m7(236, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 220) {
            m7 = m7(177, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 221) {
            m7 = m7(216, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 222) {
            m7 = m7(156, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 223) {
            m7 = m7(227, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 224) {
            m7 = m7(4, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 225) {
            m7 = m7(248, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 226) {
            m7 = m7(37, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 227) {
            m7 = m7(0, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 228) {
            m7 = m7(9, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 229) {
            m7 = m7(220, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 230) {
            m7 = m7(31, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 231) {
            m7 = m7(243, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 232) {
            m7 = m7(148, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 233) {
            m7 = m7(77, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 234) {
            m7 = m7(114, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 235) {
            m7 = m7(145, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 236) {
            m7 = m7(10, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 237) {
            m7 = m7(13, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 238) {
            m7 = m7(139, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 239) {
            m7 = m7(249, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 240) {
            m7 = m7(252, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 241) {
            m7 = m7(22, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 242) {
            m7 = m7(122, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 243) {
            m7 = m7(193, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 244) {
            m7 = m7(34, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 245) {
            m7 = m7(83, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 246) {
            m7 = m7(222, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 247) {
            m7 = m7(191, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 248) {
            m7 = m7(62, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 249) {
            m7 = m7(239, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 250) {
            m7 = m7(205, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 251) {
            m7 = m7(187, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 252) {
            m7 = m7(163, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 253) {
            m7 = m7(146, getSecretNumber(scramble));
            i10 = 255;
            m0 = 142;
        } else if (i17 == 254) {
            m0 = 142;
            m7 = m7(142, getSecretNumber(scramble));
            i10 = 255;
        } else {
            i10 = 255;
            m0 = 142;
            m7 = i17 == 255 ? m7(153, getSecretNumber(scramble)) : 0;
        }
        if ((m7 & i10) != m0) {
            return false;
        }
        m9(i19);
        i19 = scramble(scramble + i17);
        i10 = i18 == 0 ? m8(74, getSecretNumber(i19)) : i18 == 1 ? m8(42, getSecretNumber(i19)) : i18 == 2 ? m8(108, getSecretNumber(i19)) : i18 == 3 ? m8(90, getSecretNumber(i19)) : i18 == 4 ? m8(10, getSecretNumber(i19)) : i18 == 5 ? m8(82, getSecretNumber(i19)) : i18 == 6 ? m8(182, getSecretNumber(i19)) : i18 == 7 ? m8(2, getSecretNumber(i19)) : i18 == 8 ? m8(156, getSecretNumber(i19)) : i18 == 9 ? m8(188, getSecretNumber(i19)) : i18 == 10 ? m8(147, getSecretNumber(i19)) : i18 == 11 ? m8(187, getSecretNumber(i19)) : i18 == 12 ? m8(66, getSecretNumber(i19)) : i18 == 13 ? m8(137, getSecretNumber(i19)) : i18 == 14 ? m8(18, getSecretNumber(i19)) : i18 == 15 ? m8(140, getSecretNumber(i19)) : i18 == 16 ? m8(44, getSecretNumber(i19)) : i18 == 17 ? m8(115, getSecretNumber(i19)) : i18 == 18 ? m8(26, getSecretNumber(i19)) : i18 == 19 ? m8(64, getSecretNumber(i19)) : i18 == 20 ? m8(255, getSecretNumber(i19)) : i18 == 21 ? m8(229, getSecretNumber(i19)) : i18 == 22 ? m8(204, getSecretNumber(i19)) : i18 == 23 ? m8(50, getSecretNumber(i19)) : i18 == 24 ? m8(153, getSecretNumber(i19)) : i18 == 25 ? m8(53, getSecretNumber(i19)) : i18 == 26 ? m8(30, getSecretNumber(i19)) : i18 == 27 ? m8(101, getSecretNumber(i19)) : i18 == 28 ? m8(161, getSecretNumber(i19)) : i18 == 29 ? m8(145, getSecretNumber(i19)) : i18 == 30 ? m8(136, getSecretNumber(i19)) : i18 == 31 ? m8(155, getSecretNumber(i19)) : i18 == 32 ? m8(159, getSecretNumber(i19)) : i18 == 33 ? m8(78, getSecretNumber(i19)) : i18 == 34 ? m8(11, getSecretNumber(i19)) : i18 == 35 ? m8(142, getSecretNumber(i19)) : i18 == 36 ? m8(131, getSecretNumber(i19)) : i18 == 37 ? m8(226, getSecretNumber(i19)) : i18 == 38 ? m8(68, getSecretNumber(i19)) : i18 == 39 ? m8(233, getSecretNumber(i19)) : i18 == 40 ? m8(109, getSecretNumber(i19)) : i18 == 41 ? m8(62, getSecretNumber(i19)) : i18 == 42 ? m8(88, getSecretNumber(i19)) : i18 == 43 ? m8(99, getSecretNumber(i19)) : i18 == 44 ? m8(94, getSecretNumber(i19)) : i18 == 45 ? m8(19, getSecretNumber(i19)) : i18 == 46 ? m8(114, getSecretNumber(i19)) : i18 == 47 ? m8(100, getSecretNumber(i19)) : i18 == 48 ? m8(39, getSecretNumber(i19)) : i18 == 49 ? m8(138, getSecretNumber(i19)) : i18 == 50 ? m8(237, getSecretNumber(i19)) : i18 == 51 ? m8(144, getSecretNumber(i19)) : i18 == 52 ? m8(143, getSecretNumber(i19)) : i18 == 53 ? m8(98, getSecretNumber(i19)) : i18 == 54 ? m8(251, getSecretNumber(i19)) : i18 == 55 ? m8(246, getSecretNumber(i19)) : i18 == 56 ? m8(146, getSecretNumber(i19)) : i18 == 57 ? m8(33, getSecretNumber(i19)) : i18 == 58 ? m8(199, getSecretNumber(i19)) : i18 == 59 ? m8(91, getSecretNumber(i19)) : i18 == 60 ? m8(171, getSecretNumber(i19)) : i18 == 61 ? m8(195, getSecretNumber(i19)) : i18 == 62 ? m8(200, getSecretNumber(i19)) : i18 == 63 ? m8(192, getSecretNumber(i19)) : i18 == 64 ? m8(126, getSecretNumber(i19)) : i18 == 65 ? m8(248, getSecretNumber(i19)) : i18 == 66 ? m8(38, getSecretNumber(i19)) : i18 == 67 ? m8(35, getSecretNumber(i19)) : i18 == 68 ? m8(29, getSecretNumber(i19)) : i18 == 69 ? m8(205, getSecretNumber(i19)) : i18 == 70 ? m8(230, getSecretNumber(i19)) : i18 == 71 ? m8(71, getSecretNumber(i19)) : i18 == 72 ? m8(166, getSecretNumber(i19)) : i18 == 73 ? m8(176, getSecretNumber(i19)) : i18 == 74 ? m8(239, getSecretNumber(i19)) : i18 == 75 ? m8(197, getSecretNumber(i19)) : i18 == 76 ? m8(6, getSecretNumber(i19)) : i18 == 77 ? m8(217, getSecretNumber(i19)) : i18 == 78 ? m8(25, getSecretNumber(i19)) : i18 == 79 ? m8(209, getSecretNumber(i19)) : i18 == 80 ? m8(241, getSecretNumber(i19)) : i18 == 81 ? m8(152, getSecretNumber(i19)) : i18 == 82 ? m8(202, getSecretNumber(i19)) : i18 == 83 ? m8(93, getSecretNumber(i19)) : i18 == 84 ? m8(117, getSecretNumber(i19)) : i18 == 85 ? m8(13, getSecretNumber(i19)) : i18 == 86 ? m8(228, getSecretNumber(i19)) : i18 == 87 ? m8(86, getSecretNumber(i19)) : i18 == 88 ? m8(80, getSecretNumber(i19)) : i18 == 89 ? m8(207, getSecretNumber(i19)) : i18 == 90 ? m8(96, getSecretNumber(i19)) : i18 == 91 ? m8(21, getSecretNumber(i19)) : i18 == 92 ? m8(48, getSecretNumber(i19)) : i18 == 93 ? m8(196, getSecretNumber(i19)) : i18 == 94 ? m8(224, getSecretNumber(i19)) : i18 == 95 ? m8(102, getSecretNumber(i19)) : i18 == 96 ? m8(58, getSecretNumber(i19)) : i18 == 97 ? m8(149, getSecretNumber(i19)) : i18 == 98 ? m8(133, getSecretNumber(i19)) : i18 == 99 ? m8(89, getSecretNumber(i19)) : i18 == 100 ? m8(232, getSecretNumber(i19)) : i18 == 101 ? m8(157, getSecretNumber(i19)) : i18 == 102 ? m8(106, getSecretNumber(i19)) : i18 == 103 ? m8(125, getSecretNumber(i19)) : i18 == 104 ? m8(132, getSecretNumber(i19)) : i18 == 105 ? m8(7, getSecretNumber(i19)) : i18 == 106 ? m8(63, getSecretNumber(i19)) : i18 == 107 ? m8(60, getSecretNumber(i19)) : i18 == 108 ? m8(165, getSecretNumber(i19)) : i18 == 109 ? m8(254, getSecretNumber(i19)) : i18 == 110 ? m8(9, getSecretNumber(i19)) : i18 == 111 ? m8(116, getSecretNumber(i19)) : i18 == 112 ? m8(59, getSecretNumber(i19)) : i18 == 113 ? m8(208, getSecretNumber(i19)) : i18 == 114 ? m8(216, getSecretNumber(i19)) : i18 == 115 ? m8(111, getSecretNumber(i19)) : i18 == 116 ? m8(173, getSecretNumber(i19)) : i18 == 117 ? m8(105, getSecretNumber(i19)) : i18 == 118 ? m8(84, getSecretNumber(i19)) : i18 == 119 ? m8(201, getSecretNumber(i19)) : i18 == 120 ? m8(151, getSecretNumber(i19)) : i18 == 121 ? m8(253, getSecretNumber(i19)) : i18 == 122 ? m8(123, getSecretNumber(i19)) : i18 == 123 ? m8(220, getSecretNumber(i19)) : i18 == 124 ? m8(69, getSecretNumber(i19)) : i18 == 125 ? m8(225, getSecretNumber(i19)) : i18 == 126 ? m8(236, getSecretNumber(i19)) : i18 == 127 ? m8(24, getSecretNumber(i19)) : i18 == 128 ? m8(22, getSecretNumber(i19)) : i18 == 129 ? m8(242, getSecretNumber(i19)) : i18 == 130 ? m8(16, getSecretNumber(i19)) : i18 == 131 ? m8(194, getSecretNumber(i19)) : i18 == 132 ? m8(31, getSecretNumber(i19)) : i18 == 133 ? m8(110, getSecretNumber(i19)) : i18 == 134 ? m8(193, getSecretNumber(i19)) : i18 == 135 ? m8(36, getSecretNumber(i19)) : i18 == 136 ? m8(20, getSecretNumber(i19)) : i18 == 137 ? m8(61, getSecretNumber(i19)) : i18 == 138 ? m8(150, getSecretNumber(i19)) : i18 == 139 ? m8(167, getSecretNumber(i19)) : i18 == 140 ? m8(162, getSecretNumber(i19)) : i18 == 141 ? m8(184, getSecretNumber(i19)) : i18 == 142 ? m8(190, getSecretNumber(i19)) : i18 == 143 ? m8(127, getSecretNumber(i19)) : i18 == 144 ? m8(72, getSecretNumber(i19)) : i18 == 145 ? m8(234, getSecretNumber(i19)) : i18 == 146 ? m8(172, getSecretNumber(i19)) : i18 == 147 ? m8(141, getSecretNumber(i19)) : i18 == 148 ? m8(175, getSecretNumber(i19)) : i18 == 149 ? m8(54, getSecretNumber(i19)) : i18 == 150 ? m8(8, getSecretNumber(i19)) : i18 == 151 ? m8(174, getSecretNumber(i19)) : i18 == 152 ? m8(5, getSecretNumber(i19)) : i18 == 153 ? m8(206, getSecretNumber(i19)) : i18 == 154 ? m8(168, getSecretNumber(i19)) : i18 == 155 ? m8(45, getSecretNumber(i19)) : i18 == 156 ? m8(67, getSecretNumber(i19)) : i18 == 157 ? m8(43, getSecretNumber(i19)) : i18 == 158 ? m8(148, getSecretNumber(i19)) : i18 == 159 ? m8(250, getSecretNumber(i19)) : i18 == 160 ? m8(51, getSecretNumber(i19)) : i18 == 161 ? m8(87, getSecretNumber(i19)) : i18 == 162 ? m8(103, getSecretNumber(i19)) : i18 == 163 ? m8(81, getSecretNumber(i19)) : i18 == 164 ? m8(119, getSecretNumber(i19)) : i18 == 165 ? m8(73, getSecretNumber(i19)) : i18 == 166 ? m8(189, getSecretNumber(i19)) : i18 == 167 ? m8(163, getSecretNumber(i19)) : i18 == 168 ? m8(214, getSecretNumber(i19)) : i18 == 169 ? m8(178, getSecretNumber(i19)) : i18 == 170 ? m8(221, getSecretNumber(i19)) : i18 == 171 ? m8(227, getSecretNumber(i19)) : i18 == 172 ? m8(4, getSecretNumber(i19)) : i18 == 173 ? m8(23, getSecretNumber(i19)) : i18 == 174 ? m8(130, getSecretNumber(i19)) : i18 == 175 ? m8(240, getSecretNumber(i19)) : i18 == 176 ? m8(120, getSecretNumber(i19)) : i18 == 177 ? m8(55, getSecretNumber(i19)) : i18 == 178 ? m8(177, getSecretNumber(i19)) : i18 == 179 ? m8(85, getSecretNumber(i19)) : i18 == 180 ? m8(243, getSecretNumber(i19)) : i18 == 181 ? m8(247, getSecretNumber(i19)) : i18 == 182 ? m8(249, getSecretNumber(i19)) : i18 == 183 ? m8(180, getSecretNumber(i19)) : i18 == 184 ? m8(231, getSecretNumber(i19)) : i18 == 185 ? m8(52, getSecretNumber(i19)) : i18 == 186 ? m8(223, getSecretNumber(i19)) : i18 == 187 ? m8(218, getSecretNumber(i19)) : i18 == 188 ? m8(183, getSecretNumber(i19)) : i18 == 189 ? m8(34, getSecretNumber(i19)) : i18 == 190 ? m8(46, getSecretNumber(i19)) : i18 == 191 ? m8(128, getSecretNumber(i19)) : i18 == 192 ? m8(70, getSecretNumber(i19)) : i18 == 193 ? m8(77, getSecretNumber(i19)) : i18 == 194 ? m8(65, getSecretNumber(i19)) : i18 == 195 ? m8(32, getSecretNumber(i19)) : i18 == 196 ? m8(97, getSecretNumber(i19)) : i18 == 197 ? m8(203, getSecretNumber(i19)) : i18 == 198 ? m8(49, getSecretNumber(i19)) : i18 == 199 ? m8(95, getSecretNumber(i19)) : i18 == 200 ? m8(219, getSecretNumber(i19)) : i18 == 201 ? m8(56, getSecretNumber(i19)) : i18 == 202 ? m8(185, getSecretNumber(i19)) : i18 == 203 ? m8(215, getSecretNumber(i19)) : i18 == 204 ? m8(15, getSecretNumber(i19)) : i18 == 205 ? m8(124, getSecretNumber(i19)) : i18 == 206 ? m8(37, getSecretNumber(i19)) : i18 == 207 ? m8(238, getSecretNumber(i19)) : i18 == 208 ? m8(12, getSecretNumber(i19)) : i18 == 209 ? m8(210, getSecretNumber(i19)) : i18 == 210 ? m8(1, getSecretNumber(i19)) : i18 == 211 ? m8(244, getSecretNumber(i19)) : i18 == 212 ? m8(76, getSecretNumber(i19)) : i18 == 213 ? m8(57, getSecretNumber(i19)) : i18 == 214 ? m8(211, getSecretNumber(i19)) : i18 == 215 ? m8(129, getSecretNumber(i19)) : i18 == 216 ? m8(75, getSecretNumber(i19)) : i18 == 217 ? m8(28, getSecretNumber(i19)) : i18 == 218 ? m8(212, getSecretNumber(i19)) : i18 == 219 ? m8(3, getSecretNumber(i19)) : i18 == 220 ? m8(113, getSecretNumber(i19)) : i18 == 221 ? m8(121, getSecretNumber(i19)) : i18 == 222 ? m8(107, getSecretNumber(i19)) : i18 == 223 ? m8(169, getSecretNumber(i19)) : i18 == 224 ? m8(92, getSecretNumber(i19)) : i18 == 225 ? m8(170, getSecretNumber(i19)) : i18 == 226 ? m8(135, getSecretNumber(i19)) : i18 == 227 ? m8(154, getSecretNumber(i19)) : i18 == 228 ? m8(181, getSecretNumber(i19)) : i18 == 229 ? m8(41, getSecretNumber(i19)) : i18 == 230 ? m8(213, getSecretNumber(i19)) : i18 == 231 ? m8(222, getSecretNumber(i19)) : i18 == 232 ? m8(112, getSecretNumber(i19)) : i18 == 233 ? m8(164, getSecretNumber(i19)) : i18 == 234 ? m8(252, getSecretNumber(i19)) : i18 == 235 ? m8(0, getSecretNumber(i19)) : i18 == 236 ? m8(134, getSecretNumber(i19)) : i18 == 237 ? m8(27, getSecretNumber(i19)) : i18 == 238 ? m8(14, getSecretNumber(i19)) : i18 == 239 ? m8(40, getSecretNumber(i19)) : i18 == 240 ? m8(118, getSecretNumber(i19)) : i18 == 241 ? m8(245, getSecretNumber(i19)) : i18 == 242 ? m8(235, getSecretNumber(i19)) : i18 == 243 ? m8(191, getSecretNumber(i19)) : i18 == 244 ? m8(104, getSecretNumber(i19)) : i18 == 245 ? m8(17, getSecretNumber(i19)) : i18 == 246 ? m8(79, getSecretNumber(i19)) : i18 == 247 ? m8(186, getSecretNumber(i19)) : i18 == 248 ? m8(198, getSecretNumber(i19)) : i18 == 249 ? m8(179, getSecretNumber(i19)) : i18 == 250 ? m8(83, getSecretNumber(i19)) : i18 == 251 ? m8(158, getSecretNumber(i19)) : i18 == 252 ? m8(139, getSecretNumber(i19)) : i18 == 253 ? m8(47, getSecretNumber(i19)) : i18 == 254 ? m8(122, getSecretNumber(i19)) : i18 == 255 ? m8(160, getSecretNumber(i19)) : 0;
        if ((i10 & 255) != 103) {
            return false;
        }
        if (((((((((((long) getSecretNumber(i)) * ((long) getSecretNumber(i2))) * ((long) getSecretNumber(i3))) * ((long) getSecretNumber(i4))) * ((long) getSecretNumber(i5))) * ((long) getSecretNumber(i6))) * ((long) getSecretNumber(i7))) + ((long) i17)) + ((long) getSecretNumber(i9))) % 144 != 37) {
            return false;
        }
        return true;
    }

    static long sleep(int r4) {
        return 500;
    }

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

    public static int scramble(int i) {
        int sleep = ((int) sleep(500)) - 499;
        return ((i + ((int) Math.round(Math.sqrt((double) ((sleep * 4) * sleep)) / ((double) sleep)))) + 321) % 256;
    }
}
