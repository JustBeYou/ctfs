.class public Lcom/google/ctf/shallweplayagame/b;
.super Ljava/lang/Object;


# static fields
.field static final a:Landroid/media/ToneGenerator;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Landroid/media/ToneGenerator;

    const/4 v1, 0x3

    const/16 v2, 0x64

    invoke-direct {v0, v1, v2}, Landroid/media/ToneGenerator;-><init>(II)V

    sput-object v0, Lcom/google/ctf/shallweplayagame/b;->a:Landroid/media/ToneGenerator;

    return-void
.end method

.method static a()V
    .locals 2

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lcom/google/ctf/shallweplayagame/b$1;

    invoke-direct {v1}, Lcom/google/ctf/shallweplayagame/b$1;-><init>()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static b()V
    .locals 2

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lcom/google/ctf/shallweplayagame/b$2;

    invoke-direct {v1}, Lcom/google/ctf/shallweplayagame/b$2;-><init>()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
