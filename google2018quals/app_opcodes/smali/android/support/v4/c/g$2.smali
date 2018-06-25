.class Landroid/support/v4/c/g$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/support/v4/c/g$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/c/g;->a(Landroid/support/v4/b/a/a$b;I)Landroid/support/v4/b/a/a$c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/support/v4/c/g$a",
        "<",
        "Landroid/support/v4/b/a/a$c;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Landroid/support/v4/c/g;


# direct methods
.method constructor <init>(Landroid/support/v4/c/g;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/c/g$2;->a:Landroid/support/v4/c/g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/support/v4/b/a/a$c;)I
    .locals 1

    invoke-virtual {p1}, Landroid/support/v4/b/a/a$c;->b()I

    move-result v0

    return v0
.end method

.method public synthetic a(Ljava/lang/Object;)Z
    .locals 1

    check-cast p1, Landroid/support/v4/b/a/a$c;

    invoke-virtual {p0, p1}, Landroid/support/v4/c/g$2;->b(Landroid/support/v4/b/a/a$c;)Z

    move-result v0

    return v0
.end method

.method public synthetic b(Ljava/lang/Object;)I
    .locals 1

    check-cast p1, Landroid/support/v4/b/a/a$c;

    invoke-virtual {p0, p1}, Landroid/support/v4/c/g$2;->a(Landroid/support/v4/b/a/a$c;)I

    move-result v0

    return v0
.end method

.method public b(Landroid/support/v4/b/a/a$c;)Z
    .locals 1

    invoke-virtual {p1}, Landroid/support/v4/b/a/a$c;->c()Z

    move-result v0

    return v0
.end method
