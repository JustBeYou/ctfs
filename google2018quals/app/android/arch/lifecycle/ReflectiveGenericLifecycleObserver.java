package android.arch.lifecycle;

import android.arch.lifecycle.C0013b.C0011a;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

class ReflectiveGenericLifecycleObserver implements C0010a {
    static final Map<Class, C0008a> f18a = new HashMap();
    private final Object f19b;
    private final C0008a f20c = m14a(this.f19b.getClass());

    static class C0008a {
        final Map<C0011a, List<C0009b>> f14a = new HashMap();
        final Map<C0009b, C0011a> f15b;

        C0008a(Map<C0009b, C0011a> map) {
            this.f15b = map;
            for (Entry entry : map.entrySet()) {
                C0011a c0011a = (C0011a) entry.getValue();
                List list = (List) this.f14a.get(c0011a);
                if (list == null) {
                    list = new ArrayList();
                    this.f14a.put(c0011a, list);
                }
                list.add(entry.getKey());
            }
        }
    }

    static class C0009b {
        final int f16a;
        final Method f17b;

        C0009b(int i, Method method) {
            this.f16a = i;
            this.f17b = method;
            this.f17b.setAccessible(true);
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj == null || getClass() != obj.getClass()) {
                return false;
            }
            C0009b c0009b = (C0009b) obj;
            return this.f16a == c0009b.f16a && this.f17b.getName().equals(c0009b.f17b.getName());
        }

        public int hashCode() {
            return (this.f16a * 31) + this.f17b.getName().hashCode();
        }
    }

    ReflectiveGenericLifecycleObserver(Object obj) {
        this.f19b = obj;
    }

    private static C0008a m14a(Class cls) {
        C0008a c0008a = (C0008a) f18a.get(cls);
        return c0008a != null ? c0008a : m19b(cls);
    }

    private void m15a(C0008a c0008a, C0014c c0014c, C0011a c0011a) {
        m17a((List) c0008a.f14a.get(c0011a), c0014c, c0011a);
        m17a((List) c0008a.f14a.get(C0011a.ON_ANY), c0014c, c0011a);
    }

    private void m16a(C0009b c0009b, C0014c c0014c, C0011a c0011a) {
        try {
            switch (c0009b.f16a) {
                case 0:
                    c0009b.f17b.invoke(this.f19b, new Object[0]);
                    return;
                case 1:
                    c0009b.f17b.invoke(this.f19b, new Object[]{c0014c});
                    return;
                case 2:
                    c0009b.f17b.invoke(this.f19b, new Object[]{c0014c, c0011a});
                    return;
                default:
                    return;
            }
        } catch (InvocationTargetException e) {
            throw new RuntimeException("Failed to call observer method", e.getCause());
        } catch (Throwable e2) {
            throw new RuntimeException(e2);
        }
    }

    private void m17a(List<C0009b> list, C0014c c0014c, C0011a c0011a) {
        if (list != null) {
            for (int size = list.size() - 1; size >= 0; size--) {
                m16a((C0009b) list.get(size), c0014c, c0011a);
            }
        }
    }

    private static void m18a(Map<C0009b, C0011a> map, C0009b c0009b, C0011a c0011a, Class cls) {
        C0011a c0011a2 = (C0011a) map.get(c0009b);
        if (c0011a2 != null && c0011a != c0011a2) {
            throw new IllegalArgumentException("Method " + c0009b.f17b.getName() + " in " + cls.getName() + " already declared with different @OnLifecycleEvent value: previous" + " value " + c0011a2 + ", new value " + c0011a);
        } else if (c0011a2 == null) {
            map.put(c0009b, c0011a);
        }
    }

    private static C0008a m19b(Class cls) {
        C0008a a;
        Class superclass = cls.getSuperclass();
        Map hashMap = new HashMap();
        if (superclass != null) {
            a = m14a(superclass);
            if (a != null) {
                hashMap.putAll(a.f15b);
            }
        }
        Method[] declaredMethods = cls.getDeclaredMethods();
        for (Class a2 : cls.getInterfaces()) {
            for (Entry entry : m14a(a2).f15b.entrySet()) {
                m18a(hashMap, (C0009b) entry.getKey(), (C0011a) entry.getValue(), cls);
            }
        }
        for (Method method : declaredMethods) {
            C0019f c0019f = (C0019f) method.getAnnotation(C0019f.class);
            if (c0019f != null) {
                int i;
                Class[] parameterTypes = method.getParameterTypes();
                if (parameterTypes.length <= 0) {
                    i = 0;
                } else if (parameterTypes[0].isAssignableFrom(C0014c.class)) {
                    i = 1;
                } else {
                    throw new IllegalArgumentException("invalid parameter type. Must be one and instanceof LifecycleOwner");
                }
                C0011a a3 = c0019f.m36a();
                if (parameterTypes.length > 1) {
                    if (!parameterTypes[1].isAssignableFrom(C0011a.class)) {
                        throw new IllegalArgumentException("invalid parameter type. second arg must be an event");
                    } else if (a3 != C0011a.ON_ANY) {
                        throw new IllegalArgumentException("Second arg is supported only for ON_ANY value");
                    } else {
                        i = 2;
                    }
                }
                if (parameterTypes.length > 2) {
                    throw new IllegalArgumentException("cannot have more than 2 params");
                }
                m18a(hashMap, new C0009b(i, method), a3, cls);
            }
        }
        a = new C0008a(hashMap);
        f18a.put(cls, a);
        return a;
    }

    public void mo2a(C0014c c0014c, C0011a c0011a) {
        m15a(this.f20c, c0014c, c0011a);
    }
}
