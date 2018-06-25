.class Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/arch/lifecycle/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$b;,
        Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;
    }
.end annotation


# static fields
.field static final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class;",
            "Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final b:Ljava/lang/Object;

.field private final c:Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->a:Ljava/util/Map;

    return-void
.end method

.method constructor <init>(Ljava/lang/Object;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->b:Ljava/lang/Object;

    iget-object v0, p0, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->b:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->a(Ljava/lang/Class;)Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;

    move-result-object v0

    iput-object v0, p0, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->c:Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;

    return-void
.end method

.method private static a(Ljava/lang/Class;)Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;
    .locals 1

    sget-object v0, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->a:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->b(Ljava/lang/Class;)Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;

    move-result-object v0

    goto :goto_0
.end method

.method private a(Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;Landroid/arch/lifecycle/c;Landroid/arch/lifecycle/b$a;)V
    .locals 2

    iget-object v0, p1, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;->a:Ljava/util/Map;

    invoke-interface {v0, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-direct {p0, v0, p2, p3}, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->a(Ljava/util/List;Landroid/arch/lifecycle/c;Landroid/arch/lifecycle/b$a;)V

    iget-object v0, p1, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;->a:Ljava/util/Map;

    sget-object v1, Landroid/arch/lifecycle/b$a;->ON_ANY:Landroid/arch/lifecycle/b$a;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-direct {p0, v0, p2, p3}, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->a(Ljava/util/List;Landroid/arch/lifecycle/c;Landroid/arch/lifecycle/b$a;)V

    return-void
.end method

.method private a(Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$b;Landroid/arch/lifecycle/c;Landroid/arch/lifecycle/b$a;)V
    .locals 4

    :try_start_0
    iget v0, p1, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$b;->a:I

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p1, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$b;->b:Ljava/lang/reflect/Method;

    iget-object v1, p0, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->b:Ljava/lang/Object;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Failed to call observer method"

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :pswitch_1
    :try_start_1
    iget-object v0, p1, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$b;->b:Ljava/lang/reflect/Method;

    iget-object v1, p0, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->b:Ljava/lang/Object;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :pswitch_2
    :try_start_2
    iget-object v0, p1, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$b;->b:Ljava/lang/reflect/Method;

    iget-object v1, p0, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->b:Ljava/lang/Object;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    const/4 v3, 0x1

    aput-object p3, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private a(Ljava/util/List;Landroid/arch/lifecycle/c;Landroid/arch/lifecycle/b$a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$b;",
            ">;",
            "Landroid/arch/lifecycle/c;",
            "Landroid/arch/lifecycle/b$a;",
            ")V"
        }
    .end annotation

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    move v1, v0

    :goto_0
    if-ltz v1, :cond_0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$b;

    invoke-direct {p0, v0, p2, p3}, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->a(Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$b;Landroid/arch/lifecycle/c;Landroid/arch/lifecycle/b$a;)V

    add-int/lit8 v0, v1, -0x1

    move v1, v0

    goto :goto_0

    :cond_0
    return-void
.end method

.method private static a(Ljava/util/Map;Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$b;Landroid/arch/lifecycle/b$a;Ljava/lang/Class;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$b;",
            "Landroid/arch/lifecycle/b$a;",
            ">;",
            "Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$b;",
            "Landroid/arch/lifecycle/b$a;",
            "Ljava/lang/Class;",
            ")V"
        }
    .end annotation

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/arch/lifecycle/b$a;

    if-eqz v0, :cond_0

    if-eq p2, v0, :cond_0

    iget-object v1, p1, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$b;->b:Ljava/lang/reflect/Method;

    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Method "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " in "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " already declared with different @OnLifecycleEvent value: previous"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " value "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", new value "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_0
    if-nez v0, :cond_1

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-void
.end method

.method private static b(Ljava/lang/Class;)Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;
    .locals 12

    const/4 v4, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    if-eqz v0, :cond_0

    invoke-static {v0}, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->a(Ljava/lang/Class;)Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, v0, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;->b:Ljava/util/Map;

    invoke-interface {v6, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v7

    invoke-virtual {p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v8

    array-length v9, v8

    move v5, v3

    :goto_0
    if-ge v5, v9, :cond_2

    aget-object v0, v8, v5

    invoke-static {v0}, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->a(Ljava/lang/Class;)Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;

    move-result-object v0

    iget-object v0, v0, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;->b:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$b;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/arch/lifecycle/b$a;

    invoke-static {v6, v1, v0, p0}, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->a(Ljava/util/Map;Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$b;Landroid/arch/lifecycle/b$a;Ljava/lang/Class;)V

    goto :goto_1

    :cond_1
    add-int/lit8 v0, v5, 0x1

    move v5, v0

    goto :goto_0

    :cond_2
    array-length v8, v7

    move v5, v3

    :goto_2
    if-ge v5, v8, :cond_9

    aget-object v9, v7, v5

    const-class v0, Landroid/arch/lifecycle/f;

    invoke-virtual {v9, v0}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Landroid/arch/lifecycle/f;

    if-nez v0, :cond_3

    :goto_3
    add-int/lit8 v0, v5, 0x1

    move v5, v0

    goto :goto_2

    :cond_3
    invoke-virtual {v9}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v10

    array-length v1, v10

    if-lez v1, :cond_a

    aget-object v1, v10, v3

    const-class v11, Landroid/arch/lifecycle/c;

    invoke-virtual {v1, v11}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_4

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "invalid parameter type. Must be one and instanceof LifecycleOwner"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    move v1, v2

    :goto_4
    invoke-interface {v0}, Landroid/arch/lifecycle/f;->a()Landroid/arch/lifecycle/b$a;

    move-result-object v0

    array-length v11, v10

    if-le v11, v2, :cond_7

    aget-object v1, v10, v2

    const-class v11, Landroid/arch/lifecycle/b$a;

    invoke-virtual {v1, v11}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_5

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "invalid parameter type. second arg must be an event"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    sget-object v1, Landroid/arch/lifecycle/b$a;->ON_ANY:Landroid/arch/lifecycle/b$a;

    if-eq v0, v1, :cond_6

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Second arg is supported only for ON_ANY value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    move v1, v4

    :cond_7
    array-length v10, v10

    if-le v10, v4, :cond_8

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "cannot have more than 2 params"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_8
    new-instance v10, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$b;

    invoke-direct {v10, v1, v9}, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$b;-><init>(ILjava/lang/reflect/Method;)V

    invoke-static {v6, v10, v0, p0}, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->a(Ljava/util/Map;Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$b;Landroid/arch/lifecycle/b$a;Ljava/lang/Class;)V

    goto :goto_3

    :cond_9
    new-instance v0, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;

    invoke-direct {v0, v6}, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;-><init>(Ljava/util/Map;)V

    sget-object v1, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->a:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    :cond_a
    move v1, v3

    goto :goto_4
.end method


# virtual methods
.method public a(Landroid/arch/lifecycle/c;Landroid/arch/lifecycle/b$a;)V
    .locals 1

    iget-object v0, p0, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->c:Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;

    invoke-direct {p0, v0, p1, p2}, Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver;->a(Landroid/arch/lifecycle/ReflectiveGenericLifecycleObserver$a;Landroid/arch/lifecycle/c;Landroid/arch/lifecycle/b$a;)V

    return-void
.end method
