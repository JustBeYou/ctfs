package android.support.multidex;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Build.VERSION;
import android.util.Log;
import dalvik.system.DexFile;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.ZipFile;

public final class C0086a {
    private static final Set<File> f409a = new HashSet();
    private static final boolean f410b = C0086a.m363a(System.getProperty("java.vm.version"));

    private static final class C0083a {
        private static final int f407a = ".zip".length();
        private final C0079a f408b;

        private interface C0079a {
            Object mo38a(File file, DexFile dexFile);
        }

        private static class C0080b implements C0079a {
            private final Constructor<?> f404a;

            C0080b(Class<?> cls) {
                this.f404a = cls.getConstructor(new Class[]{File.class, ZipFile.class, DexFile.class});
                this.f404a.setAccessible(true);
            }

            public Object mo38a(File file, DexFile dexFile) {
                return this.f404a.newInstance(new Object[]{file, new ZipFile(file), dexFile});
            }
        }

        private static class C0081c implements C0079a {
            private final Constructor<?> f405a;

            C0081c(Class<?> cls) {
                this.f405a = cls.getConstructor(new Class[]{File.class, File.class, DexFile.class});
                this.f405a.setAccessible(true);
            }

            public Object mo38a(File file, DexFile dexFile) {
                return this.f405a.newInstance(new Object[]{file, file, dexFile});
            }
        }

        private static class C0082d implements C0079a {
            private final Constructor<?> f406a;

            C0082d(Class<?> cls) {
                this.f406a = cls.getConstructor(new Class[]{File.class, Boolean.TYPE, File.class, DexFile.class});
                this.f406a.setAccessible(true);
            }

            public Object mo38a(File file, DexFile dexFile) {
                return this.f406a.newInstance(new Object[]{file, Boolean.FALSE, file, dexFile});
            }
        }

        private C0083a() {
            C0079a c0080b;
            Class cls = Class.forName("dalvik.system.DexPathList$Element");
            try {
                c0080b = new C0080b(cls);
            } catch (NoSuchMethodException e) {
                try {
                    c0080b = new C0081c(cls);
                } catch (NoSuchMethodException e2) {
                    c0080b = new C0082d(cls);
                }
            }
            this.f408b = c0080b;
        }

        private static String m349a(File file) {
            File parentFile = file.getParentFile();
            String name = file.getName();
            return new File(parentFile, name.substring(0, name.length() - f407a) + ".dex").getPath();
        }

        static void m350a(ClassLoader classLoader, List<? extends File> list) {
            Object obj = C0086a.m365b(classLoader, "pathList").get(classLoader);
            Object[] a = new C0083a().m351a((List) list);
            try {
                C0086a.m367b(obj, "dexElements", a);
            } catch (Throwable e) {
                Log.w("MultiDex", "Failed find field 'dexElements' attempting 'pathElements'", e);
                C0086a.m367b(obj, "pathElements", a);
            }
        }

        private Object[] m351a(List<? extends File> list) {
            Object[] objArr = new Object[list.size()];
            for (int i = 0; i < objArr.length; i++) {
                File file = (File) list.get(i);
                objArr[i] = this.f408b.mo38a(file, DexFile.loadDex(file.getPath(), C0083a.m349a(file), 0));
            }
            return objArr;
        }
    }

    private static final class C0084b {
        static void m352a(ClassLoader classLoader, List<? extends File> list, File file) {
            Object obj = C0086a.m365b(classLoader, "pathList").get(classLoader);
            ArrayList arrayList = new ArrayList();
            C0086a.m367b(obj, "dexElements", C0084b.m353a(obj, new ArrayList(list), file, arrayList));
            if (arrayList.size() > 0) {
                Object obj2;
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    Log.w("MultiDex", "Exception in makeDexElement", (IOException) it.next());
                }
                Field a = C0086a.m365b(obj, "dexElementsSuppressedExceptions");
                IOException[] iOExceptionArr = (IOException[]) a.get(obj);
                if (iOExceptionArr == null) {
                    obj2 = (IOException[]) arrayList.toArray(new IOException[arrayList.size()]);
                } else {
                    Object obj3 = new IOException[(arrayList.size() + iOExceptionArr.length)];
                    arrayList.toArray(obj3);
                    System.arraycopy(iOExceptionArr, 0, obj3, arrayList.size(), iOExceptionArr.length);
                    obj2 = obj3;
                }
                a.set(obj, obj2);
                IOException iOException = new IOException("I/O exception during makeDexElement");
                iOException.initCause((Throwable) arrayList.get(0));
                throw iOException;
            }
        }

        private static Object[] m353a(Object obj, ArrayList<File> arrayList, File file, ArrayList<IOException> arrayList2) {
            return (Object[]) C0086a.m366b(obj, "makeDexElements", ArrayList.class, File.class, ArrayList.class).invoke(obj, new Object[]{arrayList, file, arrayList2});
        }
    }

    private static final class C0085c {
        static void m354a(ClassLoader classLoader, List<? extends File> list) {
            int size = list.size();
            Field a = C0086a.m365b(classLoader, "path");
            StringBuilder stringBuilder = new StringBuilder((String) a.get(classLoader));
            Object[] objArr = new String[size];
            Object[] objArr2 = new File[size];
            Object[] objArr3 = new ZipFile[size];
            Object[] objArr4 = new DexFile[size];
            ListIterator listIterator = list.listIterator();
            while (listIterator.hasNext()) {
                File file = (File) listIterator.next();
                String absolutePath = file.getAbsolutePath();
                stringBuilder.append(':').append(absolutePath);
                int previousIndex = listIterator.previousIndex();
                objArr[previousIndex] = absolutePath;
                objArr2[previousIndex] = file;
                objArr3[previousIndex] = new ZipFile(file);
                objArr4[previousIndex] = DexFile.loadDex(absolutePath, absolutePath + ".dex", 0);
            }
            a.set(classLoader, stringBuilder.toString());
            C0086a.m367b((Object) classLoader, "mPaths", objArr);
            C0086a.m367b((Object) classLoader, "mFiles", objArr2);
            C0086a.m367b((Object) classLoader, "mZips", objArr3);
            C0086a.m367b((Object) classLoader, "mDexs", objArr4);
        }
    }

    private static File m355a(Context context, File file, String str) {
        File file2 = new File(file, "code_cache");
        try {
            C0086a.m360a(file2);
        } catch (IOException e) {
            file2 = new File(context.getFilesDir(), "code_cache");
            C0086a.m360a(file2);
        }
        File file3 = new File(file2, str);
        C0086a.m360a(file3);
        return file3;
    }

    public static void m358a(Context context) {
        Log.i("MultiDex", "Installing application");
        if (f410b) {
            Log.i("MultiDex", "VM has multidex support, MultiDex support library is disabled.");
        } else if (VERSION.SDK_INT < 4) {
            throw new RuntimeException("MultiDex installation failed. SDK " + VERSION.SDK_INT + " is unsupported. Min SDK version is " + 4 + ".");
        } else {
            try {
                ApplicationInfo b = C0086a.m364b(context);
                if (b == null) {
                    Log.i("MultiDex", "No ApplicationInfo available, i.e. running on a test Context: MultiDex support library is disabled.");
                    return;
                }
                C0086a.m359a(context, new File(b.sourceDir), new File(b.dataDir), "secondary-dexes", "", true);
                Log.i("MultiDex", "install done");
            } catch (Throwable e) {
                Log.e("MultiDex", "MultiDex installation failure", e);
                throw new RuntimeException("MultiDex installation failed (" + e.getMessage() + ").");
            }
        }
    }

    private static void m359a(Context context, File file, File file2, String str, String str2, boolean z) {
        synchronized (f409a) {
            if (f409a.contains(file)) {
                return;
            }
            f409a.add(file);
            if (VERSION.SDK_INT > 20) {
                Log.w("MultiDex", "MultiDex is not guaranteed to work in SDK version " + VERSION.SDK_INT + ": SDK version higher than " + 20 + " should be backed by " + "runtime with built-in multidex capabilty but it's not the " + "case here: java.vm.version=\"" + System.getProperty("java.vm.version") + "\"");
            }
            try {
                ClassLoader classLoader = context.getClassLoader();
                if (classLoader == null) {
                    Log.e("MultiDex", "Context class loader is null. Must be running in test mode. Skip patching.");
                    return;
                }
                try {
                    C0086a.m368c(context);
                } catch (Throwable th) {
                    Log.w("MultiDex", "Something went wrong when trying to clear old MultiDex extraction, continuing without cleaning.", th);
                }
                File a = C0086a.m355a(context, file2, str);
                C0089b c0089b = new C0089b(file, a);
                IOException iOException = null;
                try {
                    C0086a.m361a(classLoader, a, c0089b.m379a(context, str2, false));
                } catch (Throwable e) {
                    if (z) {
                        Log.w("MultiDex", "Failed to install extracted secondary dex files, retrying with forced extraction", e);
                        C0086a.m361a(classLoader, a, c0089b.m379a(context, str2, true));
                    } else {
                        throw e;
                    }
                } catch (Throwable th2) {
                    try {
                        c0089b.close();
                    } catch (IOException e2) {
                    }
                }
                try {
                    c0089b.close();
                } catch (IOException e3) {
                    iOException = e3;
                }
                if (iOException != null) {
                    throw iOException;
                }
                return;
            } catch (Throwable th3) {
                Log.w("MultiDex", "Failure while trying to obtain Context class loader. Must be running in test mode. Skip patching.", th3);
                return;
            }
        }
    }

    private static void m360a(File file) {
        file.mkdir();
        if (!file.isDirectory()) {
            File parentFile = file.getParentFile();
            if (parentFile == null) {
                Log.e("MultiDex", "Failed to create dir " + file.getPath() + ". Parent file is null.");
            } else {
                Log.e("MultiDex", "Failed to create dir " + file.getPath() + ". parent file is a dir " + parentFile.isDirectory() + ", a file " + parentFile.isFile() + ", exists " + parentFile.exists() + ", readable " + parentFile.canRead() + ", writable " + parentFile.canWrite());
            }
            throw new IOException("Failed to create directory " + file.getPath());
        }
    }

    private static void m361a(ClassLoader classLoader, File file, List<? extends File> list) {
        if (!list.isEmpty()) {
            if (VERSION.SDK_INT >= 19) {
                C0084b.m352a(classLoader, list, file);
            } else if (VERSION.SDK_INT >= 14) {
                C0083a.m350a(classLoader, list);
            } else {
                C0085c.m354a(classLoader, list);
            }
        }
    }

    static boolean m363a(String str) {
        boolean z = false;
        if (str != null) {
            Matcher matcher = Pattern.compile("(\\d+)\\.(\\d+)(\\.\\d+)?").matcher(str);
            if (matcher.matches()) {
                try {
                    int parseInt = Integer.parseInt(matcher.group(1));
                    int parseInt2 = Integer.parseInt(matcher.group(2));
                    if (parseInt > 2 || (parseInt == 2 && parseInt2 >= 1)) {
                        z = true;
                    }
                } catch (NumberFormatException e) {
                }
            }
        }
        Log.i("MultiDex", "VM with version " + str + (z ? " has multidex support" : " does not have multidex support"));
        return z;
    }

    private static ApplicationInfo m364b(Context context) {
        try {
            return context.getApplicationInfo();
        } catch (Throwable e) {
            Log.w("MultiDex", "Failure while trying to obtain ApplicationInfo from Context. Must be running in test mode. Skip patching.", e);
            return null;
        }
    }

    private static Field m365b(Object obj, String str) {
        Class cls = obj.getClass();
        while (cls != null) {
            try {
                Field declaredField = cls.getDeclaredField(str);
                if (!declaredField.isAccessible()) {
                    declaredField.setAccessible(true);
                }
                return declaredField;
            } catch (NoSuchFieldException e) {
                cls = cls.getSuperclass();
            }
        }
        throw new NoSuchFieldException("Field " + str + " not found in " + obj.getClass());
    }

    private static Method m366b(Object obj, String str, Class<?>... clsArr) {
        Class cls = obj.getClass();
        while (cls != null) {
            try {
                Method declaredMethod = cls.getDeclaredMethod(str, clsArr);
                if (!declaredMethod.isAccessible()) {
                    declaredMethod.setAccessible(true);
                }
                return declaredMethod;
            } catch (NoSuchMethodException e) {
                cls = cls.getSuperclass();
            }
        }
        throw new NoSuchMethodException("Method " + str + " with parameters " + Arrays.asList(clsArr) + " not found in " + obj.getClass());
    }

    private static void m367b(Object obj, String str, Object[] objArr) {
        Field b = C0086a.m365b(obj, str);
        Object[] objArr2 = (Object[]) b.get(obj);
        Object[] objArr3 = (Object[]) Array.newInstance(objArr2.getClass().getComponentType(), objArr2.length + objArr.length);
        System.arraycopy(objArr2, 0, objArr3, 0, objArr2.length);
        System.arraycopy(objArr, 0, objArr3, objArr2.length, objArr.length);
        b.set(obj, objArr3);
    }

    private static void m368c(Context context) {
        File file = new File(context.getFilesDir(), "secondary-dexes");
        if (file.isDirectory()) {
            Log.i("MultiDex", "Clearing old secondary dex dir (" + file.getPath() + ").");
            File[] listFiles = file.listFiles();
            if (listFiles == null) {
                Log.w("MultiDex", "Failed to list secondary dex dir content (" + file.getPath() + ").");
                return;
            }
            for (File file2 : listFiles) {
                Log.i("MultiDex", "Trying to delete old file " + file2.getPath() + " of size " + file2.length());
                if (file2.delete()) {
                    Log.i("MultiDex", "Deleted old file " + file2.getPath());
                } else {
                    Log.w("MultiDex", "Failed to delete old file " + file2.getPath());
                }
            }
            if (file.delete()) {
                Log.i("MultiDex", "Deleted old secondary dex dir " + file.getPath());
            } else {
                Log.w("MultiDex", "Failed to delete secondary dex dir " + file.getPath());
            }
        }
    }
}
