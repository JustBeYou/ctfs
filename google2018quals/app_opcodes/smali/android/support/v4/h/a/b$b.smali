.class Landroid/support/v4/h/a/b$b;
.super Landroid/support/v4/h/a/b$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/h/a/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "b"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/support/v4/h/a/b$d;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/support/v4/h/a/b;)Ljava/lang/Object;
    .locals 1

    new-instance v0, Landroid/support/v4/h/a/b$b$1;

    invoke-direct {v0, p0, p1}, Landroid/support/v4/h/a/b$b$1;-><init>(Landroid/support/v4/h/a/b$b;Landroid/support/v4/h/a/b;)V

    invoke-static {v0}, Landroid/support/v4/h/a/c;->a(Landroid/support/v4/h/a/c$a;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
