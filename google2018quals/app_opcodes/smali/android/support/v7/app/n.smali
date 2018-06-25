.class Landroid/support/v7/app/n;
.super Ljava/lang/Object;


# static fields
.field private static a:Ljava/lang/reflect/Field;

.field private static b:Z

.field private static c:Ljava/lang/Class;

.field private static d:Z

.field private static e:Ljava/lang/reflect/Field;

.field private static f:Z

.field private static g:Ljava/lang/reflect/Field;

.field private static h:Z


# direct methods
.method static a(Landroid/content/res/Resources;)Z
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_0

    invoke-static {p0}, Landroid/support/v7/app/n;->d(Landroid/content/res/Resources;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_1

    invoke-static {p0}, Landroid/support/v7/app/n;->c(Landroid/content/res/Resources;)Z

    move-result v0

    goto :goto_0

    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_2

    invoke-static {p0}, Landroid/support/v7/app/n;->b(Landroid/content/res/Resources;)Z

    move-result v0

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static a(Ljava/lang/Object;)Z
    .locals 6

    const/4 v1, 0x0

    const/4 v2, 0x1

    sget-boolean v0, Landroid/support/v7/app/n;->d:Z

    if-nez v0, :cond_0

    :try_start_0
    const-string v0, "android.content.res.ThemedResourceCache"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Landroid/support/v7/app/n;->c:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    sput-boolean v2, Landroid/support/v7/app/n;->d:Z

    :cond_0
    sget-object v0, Landroid/support/v7/app/n;->c:Ljava/lang/Class;

    if-nez v0, :cond_1

    move v0, v1

    :goto_1
    return v0

    :catch_0
    move-exception v0

    const-string v3, "ResourcesFlusher"

    const-string v4, "Could not find ThemedResourceCache class"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :cond_1
    sget-boolean v0, Landroid/support/v7/app/n;->f:Z

    if-nez v0, :cond_2

    :try_start_1
    sget-object v0, Landroid/support/v7/app/n;->c:Ljava/lang/Class;

    const-string v3, "mUnthemedEntries"

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sput-object v0, Landroid/support/v7/app/n;->e:Ljava/lang/reflect/Field;

    sget-object v0, Landroid/support/v7/app/n;->e:Ljava/lang/reflect/Field;

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_2
    sput-boolean v2, Landroid/support/v7/app/n;->f:Z

    :cond_2
    sget-object v0, Landroid/support/v7/app/n;->e:Ljava/lang/reflect/Field;

    if-nez v0, :cond_3

    move v0, v1

    goto :goto_1

    :catch_1
    move-exception v0

    const-string v3, "ResourcesFlusher"

    const-string v4, "Could not retrieve ThemedResourceCache#mUnthemedEntries field"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    :cond_3
    const/4 v3, 0x0

    :try_start_2
    sget-object v0, Landroid/support/v7/app/n;->e:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/LongSparseArray;
    :try_end_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_2

    :goto_3
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroid/util/LongSparseArray;->clear()V

    move v0, v2

    goto :goto_1

    :catch_2
    move-exception v0

    const-string v4, "ResourcesFlusher"

    const-string v5, "Could not retrieve value from ThemedResourceCache#mUnthemedEntries"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v0, v3

    goto :goto_3

    :cond_4
    move v0, v1

    goto :goto_1
.end method

.method private static b(Landroid/content/res/Resources;)Z
    .locals 5

    const/4 v1, 0x1

    sget-boolean v0, Landroid/support/v7/app/n;->b:Z

    if-nez v0, :cond_0

    :try_start_0
    const-class v0, Landroid/content/res/Resources;

    const-string v2, "mDrawableCache"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sput-object v0, Landroid/support/v7/app/n;->a:Ljava/lang/reflect/Field;

    sget-object v0, Landroid/support/v7/app/n;->a:Ljava/lang/reflect/Field;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    sput-boolean v1, Landroid/support/v7/app/n;->b:Z

    :cond_0
    sget-object v0, Landroid/support/v7/app/n;->a:Ljava/lang/reflect/Field;

    if-eqz v0, :cond_1

    const/4 v2, 0x0

    :try_start_1
    sget-object v0, Landroid/support/v7/app/n;->a:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    move v0, v1

    :goto_2
    return v0

    :catch_0
    move-exception v0

    const-string v2, "ResourcesFlusher"

    const-string v3, "Could not retrieve Resources#mDrawableCache field"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :catch_1
    move-exception v0

    const-string v3, "ResourcesFlusher"

    const-string v4, "Could not retrieve value from Resources#mDrawableCache"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v0, v2

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    goto :goto_2
.end method

.method private static c(Landroid/content/res/Resources;)Z
    .locals 6

    const/4 v1, 0x0

    const/4 v0, 0x1

    sget-boolean v2, Landroid/support/v7/app/n;->b:Z

    if-nez v2, :cond_0

    :try_start_0
    const-class v2, Landroid/content/res/Resources;

    const-string v3, "mDrawableCache"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    sput-object v2, Landroid/support/v7/app/n;->a:Ljava/lang/reflect/Field;

    sget-object v2, Landroid/support/v7/app/n;->a:Ljava/lang/reflect/Field;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    sput-boolean v0, Landroid/support/v7/app/n;->b:Z

    :cond_0
    const/4 v3, 0x0

    sget-object v2, Landroid/support/v7/app/n;->a:Ljava/lang/reflect/Field;

    if-eqz v2, :cond_1

    :try_start_1
    sget-object v2, Landroid/support/v7/app/n;->a:Ljava/lang/reflect/Field;

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    :goto_1
    if-nez v2, :cond_2

    :goto_2
    return v1

    :catch_0
    move-exception v2

    const-string v3, "ResourcesFlusher"

    const-string v4, "Could not retrieve Resources#mDrawableCache field"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :catch_1
    move-exception v2

    const-string v4, "ResourcesFlusher"

    const-string v5, "Could not retrieve value from Resources#mDrawableCache"

    invoke-static {v4, v5, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    move-object v2, v3

    goto :goto_1

    :cond_2
    if-eqz v2, :cond_3

    invoke-static {v2}, Landroid/support/v7/app/n;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :goto_3
    move v1, v0

    goto :goto_2

    :cond_3
    move v0, v1

    goto :goto_3
.end method

.method private static d(Landroid/content/res/Resources;)Z
    .locals 7

    const/4 v3, 0x0

    const/4 v1, 0x0

    const/4 v0, 0x1

    sget-boolean v2, Landroid/support/v7/app/n;->h:Z

    if-nez v2, :cond_0

    :try_start_0
    const-class v2, Landroid/content/res/Resources;

    const-string v4, "mResourcesImpl"

    invoke-virtual {v2, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    sput-object v2, Landroid/support/v7/app/n;->g:Ljava/lang/reflect/Field;

    sget-object v2, Landroid/support/v7/app/n;->g:Ljava/lang/reflect/Field;

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    sput-boolean v0, Landroid/support/v7/app/n;->h:Z

    :cond_0
    sget-object v2, Landroid/support/v7/app/n;->g:Ljava/lang/reflect/Field;

    if-nez v2, :cond_2

    :cond_1
    :goto_1
    return v1

    :catch_0
    move-exception v2

    const-string v4, "ResourcesFlusher"

    const-string v5, "Could not retrieve Resources#mResourcesImpl field"

    invoke-static {v4, v5, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :cond_2
    :try_start_1
    sget-object v2, Landroid/support/v7/app/n;->g:Ljava/lang/reflect/Field;

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    move-object v4, v2

    :goto_2
    if-eqz v4, :cond_1

    sget-boolean v2, Landroid/support/v7/app/n;->b:Z

    if-nez v2, :cond_3

    :try_start_2
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v5, "mDrawableCache"

    invoke-virtual {v2, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    sput-object v2, Landroid/support/v7/app/n;->a:Ljava/lang/reflect/Field;

    sget-object v2, Landroid/support/v7/app/n;->a:Ljava/lang/reflect/Field;

    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_2
    .catch Ljava/lang/NoSuchFieldException; {:try_start_2 .. :try_end_2} :catch_2

    :goto_3
    sput-boolean v0, Landroid/support/v7/app/n;->b:Z

    :cond_3
    sget-object v2, Landroid/support/v7/app/n;->a:Ljava/lang/reflect/Field;

    if-eqz v2, :cond_4

    :try_start_3
    sget-object v2, Landroid/support/v7/app/n;->a:Ljava/lang/reflect/Field;

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_3 .. :try_end_3} :catch_3

    move-result-object v2

    :goto_4
    if-eqz v2, :cond_5

    invoke-static {v2}, Landroid/support/v7/app/n;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :goto_5
    move v1, v0

    goto :goto_1

    :catch_1
    move-exception v2

    const-string v4, "ResourcesFlusher"

    const-string v5, "Could not retrieve value from Resources#mResourcesImpl"

    invoke-static {v4, v5, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v4, v3

    goto :goto_2

    :catch_2
    move-exception v2

    const-string v5, "ResourcesFlusher"

    const-string v6, "Could not retrieve ResourcesImpl#mDrawableCache field"

    invoke-static {v5, v6, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3

    :catch_3
    move-exception v2

    const-string v4, "ResourcesFlusher"

    const-string v5, "Could not retrieve value from ResourcesImpl#mDrawableCache"

    invoke-static {v4, v5, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_4
    move-object v2, v3

    goto :goto_4

    :cond_5
    move v0, v1

    goto :goto_5
.end method
