.class public Landroid/support/v4/a/h;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/arch/lifecycle/c;
.implements Landroid/content/ComponentCallbacks;
.implements Landroid/view/View$OnCreateContextMenuListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/a/h$a;,
        Landroid/support/v4/a/h$c;,
        Landroid/support/v4/a/h$b;
    }
.end annotation


# static fields
.field private static final V:Landroid/support/v4/g/k;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/g/k",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field

.field static final a:Ljava/lang/Object;


# instance fields
.field A:Z

.field B:Z

.field C:Z

.field D:Z

.field E:Z

.field F:Z

.field G:Landroid/view/ViewGroup;

.field H:Landroid/view/View;

.field I:Landroid/view/View;

.field J:Z

.field K:Z

.field L:Landroid/support/v4/a/v;

.field M:Z

.field N:Z

.field O:Landroid/support/v4/a/h$a;

.field P:Z

.field Q:Z

.field R:F

.field S:Landroid/view/LayoutInflater;

.field T:Z

.field U:Landroid/arch/lifecycle/d;

.field b:I

.field c:Landroid/os/Bundle;

.field d:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/os/Parcelable;",
            ">;"
        }
    .end annotation
.end field

.field e:I

.field f:Ljava/lang/String;

.field g:Landroid/os/Bundle;

.field h:Landroid/support/v4/a/h;

.field i:I

.field j:I

.field k:Z

.field l:Z

.field m:Z

.field n:Z

.field o:Z

.field p:Z

.field q:I

.field r:Landroid/support/v4/a/n;

.field s:Landroid/support/v4/a/l;

.field t:Landroid/support/v4/a/n;

.field u:Landroid/support/v4/a/o;

.field v:Landroid/support/v4/a/h;

.field w:I

.field x:I

.field y:Ljava/lang/String;

.field z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/support/v4/g/k;

    invoke-direct {v0}, Landroid/support/v4/g/k;-><init>()V

    sput-object v0, Landroid/support/v4/a/h;->V:Landroid/support/v4/g/k;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroid/support/v4/a/h;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    const/4 v2, 0x1

    const/4 v1, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/a/h;->b:I

    iput v1, p0, Landroid/support/v4/a/h;->e:I

    iput v1, p0, Landroid/support/v4/a/h;->i:I

    iput-boolean v2, p0, Landroid/support/v4/a/h;->E:Z

    iput-boolean v2, p0, Landroid/support/v4/a/h;->K:Z

    new-instance v0, Landroid/arch/lifecycle/d;

    invoke-direct {v0, p0}, Landroid/arch/lifecycle/d;-><init>(Landroid/arch/lifecycle/c;)V

    iput-object v0, p0, Landroid/support/v4/a/h;->U:Landroid/arch/lifecycle/d;

    return-void
.end method

.method private W()V
    .locals 3

    const/4 v0, 0x0

    iget-object v1, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v1, :cond_1

    :goto_0
    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/support/v4/a/h$c;->a()V

    :cond_0
    return-void

    :cond_1
    iget-object v1, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    const/4 v2, 0x0

    iput-boolean v2, v1, Landroid/support/v4/a/h$a;->i:Z

    iget-object v1, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    iget-object v1, v1, Landroid/support/v4/a/h$a;->j:Landroid/support/v4/a/h$c;

    iget-object v2, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    iput-object v0, v2, Landroid/support/v4/a/h$a;->j:Landroid/support/v4/a/h$c;

    move-object v0, v1

    goto :goto_0
.end method

.method private X()Landroid/support/v4/a/h$a;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v0, :cond_0

    new-instance v0, Landroid/support/v4/a/h$a;

    invoke-direct {v0}, Landroid/support/v4/a/h$a;-><init>()V

    iput-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    return-object v0
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/support/v4/a/h;
    .locals 4

    :try_start_0
    sget-object v0, Landroid/support/v4/a/h;->V:Landroid/support/v4/g/k;

    invoke-virtual {v0, p1}, Landroid/support/v4/g/k;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Landroid/support/v4/a/h;->V:Landroid/support/v4/g/k;

    invoke-virtual {v1, p1, v0}, Landroid/support/v4/g/k;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/a/h;

    if-eqz p2, :cond_1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    invoke-virtual {v0, p2}, Landroid/support/v4/a/h;->b(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_4

    :cond_1
    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Landroid/support/v4/a/h$b;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to instantiate fragment "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": make sure class name exists, is public, and has an"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " empty constructor that is public"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Landroid/support/v4/a/h$b;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1

    :catch_1
    move-exception v0

    new-instance v1, Landroid/support/v4/a/h$b;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to instantiate fragment "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": make sure class name exists, is public, and has an"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " empty constructor that is public"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Landroid/support/v4/a/h$b;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1

    :catch_2
    move-exception v0

    new-instance v1, Landroid/support/v4/a/h$b;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to instantiate fragment "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": make sure class name exists, is public, and has an"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " empty constructor that is public"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Landroid/support/v4/a/h$b;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1

    :catch_3
    move-exception v0

    new-instance v1, Landroid/support/v4/a/h$b;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to instantiate fragment "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": could not find Fragment constructor"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Landroid/support/v4/a/h$b;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1

    :catch_4
    move-exception v0

    new-instance v1, Landroid/support/v4/a/h$b;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to instantiate fragment "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": calling Fragment constructor caused an exception"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Landroid/support/v4/a/h$b;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method static a(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 2

    :try_start_0
    sget-object v0, Landroid/support/v4/a/h;->V:Landroid/support/v4/g/k;

    invoke-virtual {v0, p1}, Landroid/support/v4/g/k;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Landroid/support/v4/a/h;->V:Landroid/support/v4/g/k;

    invoke-virtual {v1, p1, v0}, Landroid/support/v4/g/k;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const-class v1, Landroid/support/v4/a/h;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    return v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic b(Landroid/support/v4/a/h;)V
    .locals 0

    invoke-direct {p0}, Landroid/support/v4/a/h;->W()V

    return-void
.end method


# virtual methods
.method public A()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/a/h;->r:Landroid/support/v4/a/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->r:Landroid/support/v4/a/n;

    iget-object v0, v0, Landroid/support/v4/a/n;->m:Landroid/support/v4/a/l;

    if-nez v0, :cond_1

    :cond_0
    invoke-direct {p0}, Landroid/support/v4/a/h;->X()Landroid/support/v4/a/h$a;

    move-result-object v0

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/support/v4/a/h$a;->i:Z

    :goto_0
    return-void

    :cond_1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/a/h;->r:Landroid/support/v4/a/n;

    iget-object v1, v1, Landroid/support/v4/a/n;->m:Landroid/support/v4/a/l;

    invoke-virtual {v1}, Landroid/support/v4/a/l;->h()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_2

    iget-object v0, p0, Landroid/support/v4/a/h;->r:Landroid/support/v4/a/n;

    iget-object v0, v0, Landroid/support/v4/a/n;->m:Landroid/support/v4/a/l;

    invoke-virtual {v0}, Landroid/support/v4/a/l;->h()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Landroid/support/v4/a/h$1;

    invoke-direct {v1, p0}, Landroid/support/v4/a/h$1;-><init>(Landroid/support/v4/a/h;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Landroid/support/v4/a/h;->W()V

    goto :goto_0
.end method

.method B()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/a/h;->s:Landroid/support/v4/a/l;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Fragment has not been attached yet."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    new-instance v0, Landroid/support/v4/a/n;

    invoke-direct {v0}, Landroid/support/v4/a/n;-><init>()V

    iput-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    iget-object v1, p0, Landroid/support/v4/a/h;->s:Landroid/support/v4/a/l;

    new-instance v2, Landroid/support/v4/a/h$2;

    invoke-direct {v2, p0}, Landroid/support/v4/a/h$2;-><init>(Landroid/support/v4/a/h;)V

    invoke-virtual {v0, v1, v2, p0}, Landroid/support/v4/a/n;->a(Landroid/support/v4/a/l;Landroid/support/v4/a/j;Landroid/support/v4/a/h;)V

    return-void
.end method

.method C()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->k()V

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->e()Z

    :cond_0
    const/4 v0, 0x4

    iput v0, p0, Landroid/support/v4/a/h;->b:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    invoke-virtual {p0}, Landroid/support/v4/a/h;->j()V

    iget-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    if-nez v0, :cond_1

    new-instance v0, Landroid/support/v4/a/z;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " did not call through to super.onStart()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/a/z;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->n()V

    :cond_2
    iget-object v0, p0, Landroid/support/v4/a/h;->L:Landroid/support/v4/a/v;

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/support/v4/a/h;->L:Landroid/support/v4/a/v;

    invoke-virtual {v0}, Landroid/support/v4/a/v;->g()V

    :cond_3
    iget-object v0, p0, Landroid/support/v4/a/h;->U:Landroid/arch/lifecycle/d;

    sget-object v1, Landroid/arch/lifecycle/b$a;->ON_START:Landroid/arch/lifecycle/b$a;

    invoke-virtual {v0, v1}, Landroid/arch/lifecycle/d;->a(Landroid/arch/lifecycle/b$a;)V

    return-void
.end method

.method D()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->k()V

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->e()Z

    :cond_0
    const/4 v0, 0x5

    iput v0, p0, Landroid/support/v4/a/h;->b:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    invoke-virtual {p0}, Landroid/support/v4/a/h;->k()V

    iget-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    if-nez v0, :cond_1

    new-instance v0, Landroid/support/v4/a/z;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " did not call through to super.onResume()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/a/z;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->o()V

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->e()Z

    :cond_2
    iget-object v0, p0, Landroid/support/v4/a/h;->U:Landroid/arch/lifecycle/d;

    sget-object v1, Landroid/arch/lifecycle/b$a;->ON_RESUME:Landroid/arch/lifecycle/b$a;

    invoke-virtual {v0, v1}, Landroid/arch/lifecycle/d;->a(Landroid/arch/lifecycle/b$a;)V

    return-void
.end method

.method E()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->k()V

    :cond_0
    return-void
.end method

.method F()V
    .locals 1

    invoke-virtual {p0}, Landroid/support/v4/a/h;->onLowMemory()V

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->u()V

    :cond_0
    return-void
.end method

.method G()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/a/h;->U:Landroid/arch/lifecycle/d;

    sget-object v1, Landroid/arch/lifecycle/b$a;->ON_PAUSE:Landroid/arch/lifecycle/b$a;

    invoke-virtual {v0, v1}, Landroid/arch/lifecycle/d;->a(Landroid/arch/lifecycle/b$a;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->p()V

    :cond_0
    const/4 v0, 0x4

    iput v0, p0, Landroid/support/v4/a/h;->b:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    invoke-virtual {p0}, Landroid/support/v4/a/h;->l()V

    iget-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    if-nez v0, :cond_1

    new-instance v0, Landroid/support/v4/a/z;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " did not call through to super.onPause()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/a/z;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    return-void
.end method

.method H()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/a/h;->U:Landroid/arch/lifecycle/d;

    sget-object v1, Landroid/arch/lifecycle/b$a;->ON_STOP:Landroid/arch/lifecycle/b$a;

    invoke-virtual {v0, v1}, Landroid/arch/lifecycle/d;->a(Landroid/arch/lifecycle/b$a;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->q()V

    :cond_0
    const/4 v0, 0x3

    iput v0, p0, Landroid/support/v4/a/h;->b:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    invoke-virtual {p0}, Landroid/support/v4/a/h;->m()V

    iget-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    if-nez v0, :cond_1

    new-instance v0, Landroid/support/v4/a/z;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " did not call through to super.onStop()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/a/z;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    return-void
.end method

.method I()V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->r()V

    :cond_0
    const/4 v0, 0x2

    iput v0, p0, Landroid/support/v4/a/h;->b:I

    iget-boolean v0, p0, Landroid/support/v4/a/h;->M:Z

    if-eqz v0, :cond_2

    iput-boolean v3, p0, Landroid/support/v4/a/h;->M:Z

    iget-boolean v0, p0, Landroid/support/v4/a/h;->N:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/a/h;->N:Z

    iget-object v0, p0, Landroid/support/v4/a/h;->s:Landroid/support/v4/a/l;

    iget-object v1, p0, Landroid/support/v4/a/h;->f:Ljava/lang/String;

    iget-boolean v2, p0, Landroid/support/v4/a/h;->M:Z

    invoke-virtual {v0, v1, v2, v3}, Landroid/support/v4/a/l;->a(Ljava/lang/String;ZZ)Landroid/support/v4/a/v;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/a/h;->L:Landroid/support/v4/a/v;

    :cond_1
    iget-object v0, p0, Landroid/support/v4/a/h;->L:Landroid/support/v4/a/v;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/a/h;->s:Landroid/support/v4/a/l;

    invoke-virtual {v0}, Landroid/support/v4/a/l;->j()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/support/v4/a/h;->L:Landroid/support/v4/a/v;

    invoke-virtual {v0}, Landroid/support/v4/a/v;->d()V

    :cond_2
    :goto_0
    return-void

    :cond_3
    iget-object v0, p0, Landroid/support/v4/a/h;->L:Landroid/support/v4/a/v;

    invoke-virtual {v0}, Landroid/support/v4/a/v;->c()V

    goto :goto_0
.end method

.method J()V
    .locals 3

    const/4 v1, 0x0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->s()V

    :cond_0
    const/4 v0, 0x1

    iput v0, p0, Landroid/support/v4/a/h;->b:I

    iput-boolean v1, p0, Landroid/support/v4/a/h;->F:Z

    invoke-virtual {p0}, Landroid/support/v4/a/h;->n()V

    iget-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    if-nez v0, :cond_1

    new-instance v0, Landroid/support/v4/a/z;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " did not call through to super.onDestroyView()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/a/z;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/a/h;->L:Landroid/support/v4/a/v;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/a/h;->L:Landroid/support/v4/a/v;

    invoke-virtual {v0}, Landroid/support/v4/a/v;->f()V

    :cond_2
    iput-boolean v1, p0, Landroid/support/v4/a/h;->p:Z

    return-void
.end method

.method K()V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Landroid/support/v4/a/h;->U:Landroid/arch/lifecycle/d;

    sget-object v1, Landroid/arch/lifecycle/b$a;->ON_DESTROY:Landroid/arch/lifecycle/b$a;

    invoke-virtual {v0, v1}, Landroid/arch/lifecycle/d;->a(Landroid/arch/lifecycle/b$a;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->t()V

    :cond_0
    iput v2, p0, Landroid/support/v4/a/h;->b:I

    iput-boolean v2, p0, Landroid/support/v4/a/h;->F:Z

    iput-boolean v2, p0, Landroid/support/v4/a/h;->T:Z

    invoke-virtual {p0}, Landroid/support/v4/a/h;->o()V

    iget-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    if-nez v0, :cond_1

    new-instance v0, Landroid/support/v4/a/z;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " did not call through to super.onDestroy()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/a/z;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    return-void
.end method

.method L()V
    .locals 3

    const/4 v1, 0x0

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    invoke-virtual {p0}, Landroid/support/v4/a/h;->q()V

    iput-object v1, p0, Landroid/support/v4/a/h;->S:Landroid/view/LayoutInflater;

    iget-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    if-nez v0, :cond_0

    new-instance v0, Landroid/support/v4/a/z;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " did not call through to super.onDetach()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/a/z;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Landroid/support/v4/a/h;->C:Z

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Child FragmentManager of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " was not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " destroyed and this fragment is not retaining instance"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->t()V

    iput-object v1, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    :cond_2
    return-void
.end method

.method M()I
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    iget v0, v0, Landroid/support/v4/a/h$a;->d:I

    goto :goto_0
.end method

.method N()I
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    iget v0, v0, Landroid/support/v4/a/h$a;->e:I

    goto :goto_0
.end method

.method O()I
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    iget v0, v0, Landroid/support/v4/a/h$a;->f:I

    goto :goto_0
.end method

.method P()Landroid/support/v4/a/y;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    iget-object v0, v0, Landroid/support/v4/a/h$a;->g:Landroid/support/v4/a/y;

    goto :goto_0
.end method

.method Q()Landroid/support/v4/a/y;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    iget-object v0, v0, Landroid/support/v4/a/h$a;->h:Landroid/support/v4/a/y;

    goto :goto_0
.end method

.method R()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    iget-object v0, v0, Landroid/support/v4/a/h$a;->a:Landroid/view/View;

    goto :goto_0
.end method

.method S()Landroid/animation/Animator;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    iget-object v0, v0, Landroid/support/v4/a/h$a;->b:Landroid/animation/Animator;

    goto :goto_0
.end method

.method T()I
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    iget v0, v0, Landroid/support/v4/a/h$a;->c:I

    goto :goto_0
.end method

.method U()Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    iget-boolean v0, v0, Landroid/support/v4/a/h$a;->i:Z

    goto :goto_0
.end method

.method V()Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    iget-boolean v0, v0, Landroid/support/v4/a/h$a;->k:Z

    goto :goto_0
.end method

.method public a()Landroid/arch/lifecycle/b;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->U:Landroid/arch/lifecycle/d;

    return-object v0
.end method

.method a(Ljava/lang/String;)Landroid/support/v4/a/h;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->f:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-object p0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/n;->b(Ljava/lang/String;)Landroid/support/v4/a/h;

    move-result-object p0

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    goto :goto_0
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public a(IZI)Landroid/view/animation/Animation;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method a(I)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v0, :cond_0

    if-nez p1, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0}, Landroid/support/v4/a/h;->X()Landroid/support/v4/a/h$a;

    move-result-object v0

    iput p1, v0, Landroid/support/v4/a/h$a;->d:I

    goto :goto_0
.end method

.method a(II)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v0, :cond_0

    if-nez p1, :cond_0

    if-nez p2, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0}, Landroid/support/v4/a/h;->X()Landroid/support/v4/a/h$a;

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    iput p1, v0, Landroid/support/v4/a/h$a;->e:I

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    iput p2, v0, Landroid/support/v4/a/h$a;->f:I

    goto :goto_0
.end method

.method public a(IILandroid/content/Intent;)V
    .locals 0

    return-void
.end method

.method final a(ILandroid/support/v4/a/h;)V
    .locals 2

    iput p1, p0, Landroid/support/v4/a/h;->e:I

    if-eqz p2, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p2, Landroid/support/v4/a/h;->f:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/support/v4/a/h;->e:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/a/h;->f:Ljava/lang/String;

    :goto_0
    return-void

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "android:fragment:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/support/v4/a/h;->e:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/a/h;->f:Ljava/lang/String;

    goto :goto_0
.end method

.method public a(I[Ljava/lang/String;[I)V
    .locals 0

    return-void
.end method

.method a(Landroid/animation/Animator;)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/a/h;->X()Landroid/support/v4/a/h$a;

    move-result-object v0

    iput-object p1, v0, Landroid/support/v4/a/h$a;->b:Landroid/animation/Animator;

    return-void
.end method

.method public a(Landroid/app/Activity;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    return-void
.end method

.method public a(Landroid/app/Activity;Landroid/util/AttributeSet;Landroid/os/Bundle;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    return-void
.end method

.method public a(Landroid/content/Context;)V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    iget-object v0, p0, Landroid/support/v4/a/h;->s:Landroid/support/v4/a/l;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_0

    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v4/a/h;->F:Z

    invoke-virtual {p0, v0}, Landroid/support/v4/a/h;->a(Landroid/app/Activity;)V

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Landroid/support/v4/a/h;->s:Landroid/support/v4/a/l;

    invoke-virtual {v0}, Landroid/support/v4/a/l;->f()Landroid/app/Activity;

    move-result-object v0

    goto :goto_0
.end method

.method public a(Landroid/content/Context;Landroid/util/AttributeSet;Landroid/os/Bundle;)V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    iget-object v0, p0, Landroid/support/v4/a/h;->s:Landroid/support/v4/a/l;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_0

    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v4/a/h;->F:Z

    invoke-virtual {p0, v0, p2, p3}, Landroid/support/v4/a/h;->a(Landroid/app/Activity;Landroid/util/AttributeSet;Landroid/os/Bundle;)V

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Landroid/support/v4/a/h;->s:Landroid/support/v4/a/l;

    invoke-virtual {v0}, Landroid/support/v4/a/l;->f()Landroid/app/Activity;

    move-result-object v0

    goto :goto_0
.end method

.method a(Landroid/content/res/Configuration;)V
    .locals 1

    invoke-virtual {p0, p1}, Landroid/support/v4/a/h;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/n;->a(Landroid/content/res/Configuration;)V

    :cond_0
    return-void
.end method

.method final a(Landroid/os/Bundle;)V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/a/h;->d:Landroid/util/SparseArray;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->I:Landroid/view/View;

    iget-object v1, p0, Landroid/support/v4/a/h;->d:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Landroid/view/View;->restoreHierarchyState(Landroid/util/SparseArray;)V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/a/h;->d:Landroid/util/SparseArray;

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    invoke-virtual {p0, p1}, Landroid/support/v4/a/h;->i(Landroid/os/Bundle;)V

    iget-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    if-nez v0, :cond_1

    new-instance v0, Landroid/support/v4/a/z;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " did not call through to super.onViewStateRestored()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/a/z;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    return-void
.end method

.method a(Landroid/support/v4/a/h$c;)V
    .locals 3

    invoke-direct {p0}, Landroid/support/v4/a/h;->X()Landroid/support/v4/a/h$a;

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    iget-object v0, v0, Landroid/support/v4/a/h$a;->j:Landroid/support/v4/a/h$c;

    if-ne p1, v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-eqz p1, :cond_2

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    iget-object v0, v0, Landroid/support/v4/a/h$a;->j:Landroid/support/v4/a/h$c;

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Trying to set a replacement startPostponedEnterTransition on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    iget-boolean v0, v0, Landroid/support/v4/a/h$a;->i:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    iput-object p1, v0, Landroid/support/v4/a/h$a;->j:Landroid/support/v4/a/h$c;

    :cond_3
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/support/v4/a/h$c;->b()V

    goto :goto_0
.end method

.method public a(Landroid/support/v4/a/h;)V
    .locals 0

    return-void
.end method

.method public a(Landroid/view/Menu;)V
    .locals 0

    return-void
.end method

.method public a(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 0

    return-void
.end method

.method a(Landroid/view/View;)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/a/h;->X()Landroid/support/v4/a/h$a;

    move-result-object v0

    iput-object p1, v0, Landroid/support/v4/a/h$a;->a:Landroid/view/View;

    return-void
.end method

.method public a(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public a(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 3

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mFragmentId=#"

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Landroid/support/v4/a/h;->w:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, " mContainerId=#"

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Landroid/support/v4/a/h;->x:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, " mTag="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->y:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mState="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Landroid/support/v4/a/h;->b:I

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(I)V

    const-string v0, " mIndex="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Landroid/support/v4/a/h;->e:I

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(I)V

    const-string v0, " mWho="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->f:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, " mBackStackNesting="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Landroid/support/v4/a/h;->q:I

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(I)V

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mAdded="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroid/support/v4/a/h;->k:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Z)V

    const-string v0, " mRemoving="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroid/support/v4/a/h;->l:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Z)V

    const-string v0, " mFromLayout="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroid/support/v4/a/h;->m:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Z)V

    const-string v0, " mInLayout="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroid/support/v4/a/h;->n:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Z)V

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mHidden="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroid/support/v4/a/h;->z:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Z)V

    const-string v0, " mDetached="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroid/support/v4/a/h;->A:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Z)V

    const-string v0, " mMenuVisible="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroid/support/v4/a/h;->E:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Z)V

    const-string v0, " mHasMenu="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroid/support/v4/a/h;->D:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Z)V

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mRetainInstance="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroid/support/v4/a/h;->B:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Z)V

    const-string v0, " mRetaining="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroid/support/v4/a/h;->C:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Z)V

    const-string v0, " mUserVisibleHint="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroid/support/v4/a/h;->K:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Z)V

    iget-object v0, p0, Landroid/support/v4/a/h;->r:Landroid/support/v4/a/n;

    if-eqz v0, :cond_0

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mFragmentManager="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->r:Landroid/support/v4/a/n;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->s:Landroid/support/v4/a/l;

    if-eqz v0, :cond_1

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mHost="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->s:Landroid/support/v4/a/l;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_1
    iget-object v0, p0, Landroid/support/v4/a/h;->v:Landroid/support/v4/a/h;

    if-eqz v0, :cond_2

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mParentFragment="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->v:Landroid/support/v4/a/h;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_2
    iget-object v0, p0, Landroid/support/v4/a/h;->g:Landroid/os/Bundle;

    if-eqz v0, :cond_3

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mArguments="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->g:Landroid/os/Bundle;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_3
    iget-object v0, p0, Landroid/support/v4/a/h;->c:Landroid/os/Bundle;

    if-eqz v0, :cond_4

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mSavedFragmentState="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->c:Landroid/os/Bundle;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_4
    iget-object v0, p0, Landroid/support/v4/a/h;->d:Landroid/util/SparseArray;

    if-eqz v0, :cond_5

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mSavedViewState="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->d:Landroid/util/SparseArray;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_5
    iget-object v0, p0, Landroid/support/v4/a/h;->h:Landroid/support/v4/a/h;

    if-eqz v0, :cond_6

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mTarget="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->h:Landroid/support/v4/a/h;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    const-string v0, " mTargetRequestCode="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Landroid/support/v4/a/h;->j:I

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(I)V

    :cond_6
    invoke-virtual {p0}, Landroid/support/v4/a/h;->M()I

    move-result v0

    if-eqz v0, :cond_7

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mNextAnim="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/a/h;->M()I

    move-result v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(I)V

    :cond_7
    iget-object v0, p0, Landroid/support/v4/a/h;->G:Landroid/view/ViewGroup;

    if-eqz v0, :cond_8

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mContainer="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->G:Landroid/view/ViewGroup;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_8
    iget-object v0, p0, Landroid/support/v4/a/h;->H:Landroid/view/View;

    if-eqz v0, :cond_9

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mView="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->H:Landroid/view/View;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_9
    iget-object v0, p0, Landroid/support/v4/a/h;->I:Landroid/view/View;

    if-eqz v0, :cond_a

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mInnerView="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->H:Landroid/view/View;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_a
    invoke-virtual {p0}, Landroid/support/v4/a/h;->R()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_b

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mAnimatingAway="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/a/h;->R()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mStateAfterAnimating="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/a/h;->T()I

    move-result v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(I)V

    :cond_b
    iget-object v0, p0, Landroid/support/v4/a/h;->L:Landroid/support/v4/a/v;

    if-eqz v0, :cond_c

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "Loader Manager:"

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->L:Landroid/support/v4/a/v;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2, p3, p4}, Landroid/support/v4/a/v;->a(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    :cond_c
    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_d

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Child "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2, p3, p4}, Landroid/support/v4/a/n;->a(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    :cond_d
    return-void
.end method

.method public a(Z)V
    .locals 0

    return-void
.end method

.method public a(Landroid/view/MenuItem;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public b(IZI)Landroid/animation/Animator;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->k()V

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/a/h;->p:Z

    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v4/a/h;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method b(I)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/a/h;->X()Landroid/support/v4/a/h$a;

    move-result-object v0

    iput p1, v0, Landroid/support/v4/a/h$a;->c:I

    return-void
.end method

.method public b(Landroid/os/Bundle;)V
    .locals 2

    iget v0, p0, Landroid/support/v4/a/h;->e:I

    if-ltz v0, :cond_0

    invoke-virtual {p0}, Landroid/support/v4/a/h;->c()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Fragment already active and state has been saved"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object p1, p0, Landroid/support/v4/a/h;->g:Landroid/os/Bundle;

    return-void
.end method

.method public b(Landroid/view/Menu;)V
    .locals 0

    return-void
.end method

.method public b(Z)V
    .locals 0

    return-void
.end method

.method final b()Z
    .locals 1

    iget v0, p0, Landroid/support/v4/a/h;->q:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method b(Landroid/view/Menu;Landroid/view/MenuInflater;)Z
    .locals 2

    const/4 v0, 0x0

    iget-boolean v1, p0, Landroid/support/v4/a/h;->z:Z

    if-nez v1, :cond_1

    iget-boolean v1, p0, Landroid/support/v4/a/h;->D:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Landroid/support/v4/a/h;->E:Z

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2}, Landroid/support/v4/a/h;->a(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    :cond_0
    iget-object v1, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v1, p1, p2}, Landroid/support/v4/a/n;->a(Landroid/view/Menu;Landroid/view/MenuInflater;)Z

    move-result v1

    or-int/2addr v0, v1

    :cond_1
    return v0
.end method

.method public b(Landroid/view/MenuItem;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public c(Landroid/os/Bundle;)Landroid/view/LayoutInflater;
    .locals 1

    invoke-virtual {p0, p1}, Landroid/support/v4/a/h;->e(Landroid/os/Bundle;)Landroid/view/LayoutInflater;

    move-result-object v0

    return-object v0
.end method

.method public c(Z)V
    .locals 0

    return-void
.end method

.method public final c()Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->r:Landroid/support/v4/a/n;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->r:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->c()Z

    move-result v0

    goto :goto_0
.end method

.method c(Landroid/view/Menu;)Z
    .locals 2

    const/4 v0, 0x0

    iget-boolean v1, p0, Landroid/support/v4/a/h;->z:Z

    if-nez v1, :cond_1

    iget-boolean v1, p0, Landroid/support/v4/a/h;->D:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Landroid/support/v4/a/h;->E:Z

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, p1}, Landroid/support/v4/a/h;->a(Landroid/view/Menu;)V

    :cond_0
    iget-object v1, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v1, p1}, Landroid/support/v4/a/n;->a(Landroid/view/Menu;)Z

    move-result v1

    or-int/2addr v0, v1

    :cond_1
    return v0
.end method

.method c(Landroid/view/MenuItem;)Z
    .locals 2

    const/4 v0, 0x1

    iget-boolean v1, p0, Landroid/support/v4/a/h;->z:Z

    if-nez v1, :cond_2

    iget-boolean v1, p0, Landroid/support/v4/a/h;->D:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Landroid/support/v4/a/h;->E:Z

    if-eqz v1, :cond_1

    invoke-virtual {p0, p1}, Landroid/support/v4/a/h;->a(Landroid/view/MenuItem;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v1, p1}, Landroid/support/v4/a/n;->a(Landroid/view/MenuItem;)Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final d()Landroid/support/v4/a/i;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->s:Landroid/support/v4/a/l;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->s:Landroid/support/v4/a/l;

    invoke-virtual {v0}, Landroid/support/v4/a/l;->f()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/support/v4/a/i;

    goto :goto_0
.end method

.method d(Landroid/os/Bundle;)Landroid/view/LayoutInflater;
    .locals 1

    invoke-virtual {p0, p1}, Landroid/support/v4/a/h;->c(Landroid/os/Bundle;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/a/h;->S:Landroid/view/LayoutInflater;

    iget-object v0, p0, Landroid/support/v4/a/h;->S:Landroid/view/LayoutInflater;

    return-object v0
.end method

.method d(Landroid/view/Menu;)V
    .locals 1

    iget-boolean v0, p0, Landroid/support/v4/a/h;->z:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Landroid/support/v4/a/h;->D:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Landroid/support/v4/a/h;->E:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Landroid/support/v4/a/h;->b(Landroid/view/Menu;)V

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/n;->b(Landroid/view/Menu;)V

    :cond_1
    return-void
.end method

.method d(Z)V
    .locals 1

    invoke-virtual {p0, p1}, Landroid/support/v4/a/h;->b(Z)V

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/n;->a(Z)V

    :cond_0
    return-void
.end method

.method d(Landroid/view/MenuItem;)Z
    .locals 2

    const/4 v0, 0x1

    iget-boolean v1, p0, Landroid/support/v4/a/h;->z:Z

    if-nez v1, :cond_2

    invoke-virtual {p0, p1}, Landroid/support/v4/a/h;->b(Landroid/view/MenuItem;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v1, p1}, Landroid/support/v4/a/n;->b(Landroid/view/MenuItem;)Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final e()Landroid/content/res/Resources;
    .locals 3

    iget-object v0, p0, Landroid/support/v4/a/h;->s:Landroid/support/v4/a/l;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not attached to Activity"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->s:Landroid/support/v4/a/l;

    invoke-virtual {v0}, Landroid/support/v4/a/l;->g()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    return-object v0
.end method

.method public e(Landroid/os/Bundle;)Landroid/view/LayoutInflater;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/a/h;->s:Landroid/support/v4/a/l;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "onGetLayoutInflater() cannot be executed until the Fragment is attached to the FragmentManager."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->s:Landroid/support/v4/a/l;

    invoke-virtual {v0}, Landroid/support/v4/a/l;->b()Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-virtual {p0}, Landroid/support/v4/a/h;->g()Landroid/support/v4/a/m;

    iget-object v1, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v1}, Landroid/support/v4/a/n;->w()Landroid/view/LayoutInflater$Factory2;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/support/v4/h/e;->b(Landroid/view/LayoutInflater;Landroid/view/LayoutInflater$Factory2;)V

    return-object v0
.end method

.method e(Z)V
    .locals 1

    invoke-virtual {p0, p1}, Landroid/support/v4/a/h;->c(Z)V

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/n;->b(Z)V

    :cond_0
    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 1

    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public final f()Landroid/support/v4/a/m;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->r:Landroid/support/v4/a/n;

    return-object v0
.end method

.method public f(Landroid/os/Bundle;)V
    .locals 2

    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/support/v4/a/h;->F:Z

    invoke-virtual {p0, p1}, Landroid/support/v4/a/h;->g(Landroid/os/Bundle;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0, v1}, Landroid/support/v4/a/n;->a(I)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->l()V

    :cond_0
    return-void
.end method

.method f(Z)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/a/h;->X()Landroid/support/v4/a/h$a;

    move-result-object v0

    iput-boolean p1, v0, Landroid/support/v4/a/h$a;->k:Z

    return-void
.end method

.method public final g()Landroid/support/v4/a/m;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/support/v4/a/h;->B()V

    iget v0, p0, Landroid/support/v4/a/h;->b:I

    const/4 v1, 0x5

    if-lt v0, v1, :cond_1

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->o()V

    :cond_0
    :goto_0
    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    return-object v0

    :cond_1
    iget v0, p0, Landroid/support/v4/a/h;->b:I

    const/4 v1, 0x4

    if-lt v0, v1, :cond_2

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->n()V

    goto :goto_0

    :cond_2
    iget v0, p0, Landroid/support/v4/a/h;->b:I

    const/4 v1, 0x2

    if-lt v0, v1, :cond_3

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->m()V

    goto :goto_0

    :cond_3
    iget v0, p0, Landroid/support/v4/a/h;->b:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->l()V

    goto :goto_0
.end method

.method g(Landroid/os/Bundle;)V
    .locals 3

    if-eqz p1, :cond_1

    const-string v0, "android:support:fragments"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-nez v1, :cond_0

    invoke-virtual {p0}, Landroid/support/v4/a/h;->B()V

    :cond_0
    iget-object v1, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    iget-object v2, p0, Landroid/support/v4/a/h;->u:Landroid/support/v4/a/o;

    invoke-virtual {v1, v0, v2}, Landroid/support/v4/a/n;->a(Landroid/os/Parcelable;Landroid/support/v4/a/o;)V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/a/h;->u:Landroid/support/v4/a/o;

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->l()V

    :cond_1
    return-void
.end method

.method h()Landroid/support/v4/a/m;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    return-object v0
.end method

.method public h(Landroid/os/Bundle;)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    return-void
.end method

.method public final hashCode()I
    .locals 1

    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public i()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->H:Landroid/view/View;

    return-object v0
.end method

.method public i(Landroid/os/Bundle;)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    return-void
.end method

.method public j()V
    .locals 4

    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/support/v4/a/h;->F:Z

    iget-boolean v0, p0, Landroid/support/v4/a/h;->M:Z

    if-nez v0, :cond_0

    iput-boolean v1, p0, Landroid/support/v4/a/h;->M:Z

    iget-boolean v0, p0, Landroid/support/v4/a/h;->N:Z

    if-nez v0, :cond_1

    iput-boolean v1, p0, Landroid/support/v4/a/h;->N:Z

    iget-object v0, p0, Landroid/support/v4/a/h;->s:Landroid/support/v4/a/l;

    iget-object v1, p0, Landroid/support/v4/a/h;->f:Ljava/lang/String;

    iget-boolean v2, p0, Landroid/support/v4/a/h;->M:Z

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/support/v4/a/l;->a(Ljava/lang/String;ZZ)Landroid/support/v4/a/v;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/a/h;->L:Landroid/support/v4/a/v;

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Landroid/support/v4/a/h;->L:Landroid/support/v4/a/v;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->L:Landroid/support/v4/a/v;

    invoke-virtual {v0}, Landroid/support/v4/a/v;->b()V

    goto :goto_0
.end method

.method public j(Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public k()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    return-void
.end method

.method k(Landroid/os/Bundle;)V
    .locals 3

    const/4 v1, 0x1

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->k()V

    :cond_0
    iput v1, p0, Landroid/support/v4/a/h;->b:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    invoke-virtual {p0, p1}, Landroid/support/v4/a/h;->f(Landroid/os/Bundle;)V

    iput-boolean v1, p0, Landroid/support/v4/a/h;->T:Z

    iget-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    if-nez v0, :cond_1

    new-instance v0, Landroid/support/v4/a/z;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " did not call through to super.onCreate()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/a/z;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/a/h;->U:Landroid/arch/lifecycle/d;

    sget-object v1, Landroid/arch/lifecycle/b$a;->ON_CREATE:Landroid/arch/lifecycle/b$a;

    invoke-virtual {v0, v1}, Landroid/arch/lifecycle/d;->a(Landroid/arch/lifecycle/b$a;)V

    return-void
.end method

.method public l()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    return-void
.end method

.method l(Landroid/os/Bundle;)V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->k()V

    :cond_0
    const/4 v0, 0x2

    iput v0, p0, Landroid/support/v4/a/h;->b:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    invoke-virtual {p0, p1}, Landroid/support/v4/a/h;->h(Landroid/os/Bundle;)V

    iget-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    if-nez v0, :cond_1

    new-instance v0, Landroid/support/v4/a/z;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " did not call through to super.onActivityCreated()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/a/z;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->m()V

    :cond_2
    return-void
.end method

.method public m()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    return-void
.end method

.method m(Landroid/os/Bundle;)V
    .locals 2

    invoke-virtual {p0, p1}, Landroid/support/v4/a/h;->j(Landroid/os/Bundle;)V

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->j()Landroid/os/Parcelable;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "android:support:fragments"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_0
    return-void
.end method

.method public n()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    return-void
.end method

.method public o()V
    .locals 4

    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/support/v4/a/h;->F:Z

    iget-boolean v0, p0, Landroid/support/v4/a/h;->N:Z

    if-nez v0, :cond_0

    iput-boolean v1, p0, Landroid/support/v4/a/h;->N:Z

    iget-object v0, p0, Landroid/support/v4/a/h;->s:Landroid/support/v4/a/l;

    iget-object v1, p0, Landroid/support/v4/a/h;->f:Ljava/lang/String;

    iget-boolean v2, p0, Landroid/support/v4/a/h;->M:Z

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/support/v4/a/l;->a(Ljava/lang/String;ZZ)Landroid/support/v4/a/v;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/a/h;->L:Landroid/support/v4/a/v;

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->L:Landroid/support/v4/a/v;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/a/h;->L:Landroid/support/v4/a/v;

    invoke-virtual {v0}, Landroid/support/v4/a/v;->h()V

    :cond_1
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 1

    invoke-virtual {p0}, Landroid/support/v4/a/h;->d()Landroid/support/v4/a/i;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/a/i;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    return-void
.end method

.method public onLowMemory()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    return-void
.end method

.method p()V
    .locals 3

    const/4 v2, 0x0

    const/4 v1, 0x0

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v4/a/h;->e:I

    iput-object v2, p0, Landroid/support/v4/a/h;->f:Ljava/lang/String;

    iput-boolean v1, p0, Landroid/support/v4/a/h;->k:Z

    iput-boolean v1, p0, Landroid/support/v4/a/h;->l:Z

    iput-boolean v1, p0, Landroid/support/v4/a/h;->m:Z

    iput-boolean v1, p0, Landroid/support/v4/a/h;->n:Z

    iput-boolean v1, p0, Landroid/support/v4/a/h;->o:Z

    iput v1, p0, Landroid/support/v4/a/h;->q:I

    iput-object v2, p0, Landroid/support/v4/a/h;->r:Landroid/support/v4/a/n;

    iput-object v2, p0, Landroid/support/v4/a/h;->t:Landroid/support/v4/a/n;

    iput-object v2, p0, Landroid/support/v4/a/h;->s:Landroid/support/v4/a/l;

    iput v1, p0, Landroid/support/v4/a/h;->w:I

    iput v1, p0, Landroid/support/v4/a/h;->x:I

    iput-object v2, p0, Landroid/support/v4/a/h;->y:Ljava/lang/String;

    iput-boolean v1, p0, Landroid/support/v4/a/h;->z:Z

    iput-boolean v1, p0, Landroid/support/v4/a/h;->A:Z

    iput-boolean v1, p0, Landroid/support/v4/a/h;->C:Z

    iput-object v2, p0, Landroid/support/v4/a/h;->L:Landroid/support/v4/a/v;

    iput-boolean v1, p0, Landroid/support/v4/a/h;->M:Z

    iput-boolean v1, p0, Landroid/support/v4/a/h;->N:Z

    return-void
.end method

.method public q()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/a/h;->F:Z

    return-void
.end method

.method public r()V
    .locals 0

    return-void
.end method

.method public s()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    invoke-static {v0}, Landroid/support/v4/a/h$a;->a(Landroid/support/v4/a/h$a;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public t()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    invoke-static {v0}, Landroid/support/v4/a/h$a;->b(Landroid/support/v4/a/h$a;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Landroid/support/v4/a/h;->a:Ljava/lang/Object;

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Landroid/support/v4/a/h;->s()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    invoke-static {v0}, Landroid/support/v4/a/h$a;->b(Landroid/support/v4/a/h$a;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-static {p0, v0}, Landroid/support/v4/g/d;->a(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    iget v1, p0, Landroid/support/v4/a/h;->e:I

    if-ltz v1, :cond_0

    const-string v1, " #"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/a/h;->e:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_0
    iget v1, p0, Landroid/support/v4/a/h;->w:I

    if-eqz v1, :cond_1

    const-string v1, " id=0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/a/h;->w:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    iget-object v1, p0, Landroid/support/v4/a/h;->y:Ljava/lang/String;

    if-eqz v1, :cond_2

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v4/a/h;->y:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public u()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    invoke-static {v0}, Landroid/support/v4/a/h$a;->c(Landroid/support/v4/a/h$a;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public v()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    invoke-static {v0}, Landroid/support/v4/a/h$a;->d(Landroid/support/v4/a/h$a;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Landroid/support/v4/a/h;->a:Ljava/lang/Object;

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Landroid/support/v4/a/h;->u()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    invoke-static {v0}, Landroid/support/v4/a/h$a;->d(Landroid/support/v4/a/h$a;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public w()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    invoke-static {v0}, Landroid/support/v4/a/h$a;->e(Landroid/support/v4/a/h$a;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public x()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    invoke-static {v0}, Landroid/support/v4/a/h$a;->f(Landroid/support/v4/a/h$a;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Landroid/support/v4/a/h;->a:Ljava/lang/Object;

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Landroid/support/v4/a/h;->w()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    invoke-static {v0}, Landroid/support/v4/a/h$a;->f(Landroid/support/v4/a/h$a;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public y()Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    invoke-static {v0}, Landroid/support/v4/a/h$a;->g(Landroid/support/v4/a/h$a;)Ljava/lang/Boolean;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    invoke-static {v0}, Landroid/support/v4/a/h$a;->g(Landroid/support/v4/a/h$a;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_0
.end method

.method public z()Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    invoke-static {v0}, Landroid/support/v4/a/h$a;->h(Landroid/support/v4/a/h$a;)Ljava/lang/Boolean;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/a/h;->O:Landroid/support/v4/a/h$a;

    invoke-static {v0}, Landroid/support/v4/a/h$a;->h(Landroid/support/v4/a/h$a;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_0
.end method
