package android.support.multidex;

import java.io.File;
import java.io.RandomAccessFile;
import java.util.zip.CRC32;
import java.util.zip.ZipException;

final class C0091c {

    static class C0090a {
        long f419a;
        long f420b;

        C0090a() {
        }
    }

    static long m380a(File file) {
        RandomAccessFile randomAccessFile = new RandomAccessFile(file, "r");
        try {
            long a = C0091c.m381a(randomAccessFile, C0091c.m382a(randomAccessFile));
            return a;
        } finally {
            randomAccessFile.close();
        }
    }

    static long m381a(RandomAccessFile randomAccessFile, C0090a c0090a) {
        CRC32 crc32 = new CRC32();
        long j = c0090a.f420b;
        randomAccessFile.seek(c0090a.f419a);
        byte[] bArr = new byte[16384];
        int read = randomAccessFile.read(bArr, 0, (int) Math.min(16384, j));
        while (read != -1) {
            crc32.update(bArr, 0, read);
            j -= (long) read;
            if (j == 0) {
                break;
            }
            read = randomAccessFile.read(bArr, 0, (int) Math.min(16384, j));
        }
        return crc32.getValue();
    }

    static C0090a m382a(RandomAccessFile randomAccessFile) {
        long j = 0;
        long length = randomAccessFile.length() - 22;
        if (length < 0) {
            throw new ZipException("File too short to be a zip file: " + randomAccessFile.length());
        }
        long j2 = length - 65536;
        if (j2 >= 0) {
            j = j2;
        }
        int reverseBytes = Integer.reverseBytes(101010256);
        j2 = length;
        do {
            randomAccessFile.seek(j2);
            if (randomAccessFile.readInt() == reverseBytes) {
                randomAccessFile.skipBytes(2);
                randomAccessFile.skipBytes(2);
                randomAccessFile.skipBytes(2);
                randomAccessFile.skipBytes(2);
                C0090a c0090a = new C0090a();
                c0090a.f420b = ((long) Integer.reverseBytes(randomAccessFile.readInt())) & 4294967295L;
                c0090a.f419a = ((long) Integer.reverseBytes(randomAccessFile.readInt())) & 4294967295L;
                return c0090a;
            }
            j2--;
        } while (j2 >= j);
        throw new ZipException("End Of Central Directory signature not found");
    }
}
