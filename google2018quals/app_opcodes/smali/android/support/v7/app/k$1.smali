.class Landroid/support/v7/app/k$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/app/k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/support/v7/app/k;


# direct methods
.method constructor <init>(Landroid/support/v7/app/k;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v7/app/k$1;->a:Landroid/support/v7/app/k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Landroid/support/v7/app/k$1;->a:Landroid/support/v7/app/k;

    iget v0, v0, Landroid/support/v7/app/k;->s:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/app/k$1;->a:Landroid/support/v7/app/k;

    invoke-virtual {v0, v2}, Landroid/support/v7/app/k;->f(I)V

    :cond_0
    iget-object v0, p0, Landroid/support/v7/app/k$1;->a:Landroid/support/v7/app/k;

    iget v0, v0, Landroid/support/v7/app/k;->s:I

    and-int/lit16 v0, v0, 0x1000

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v7/app/k$1;->a:Landroid/support/v7/app/k;

    const/16 v1, 0x6c

    invoke-virtual {v0, v1}, Landroid/support/v7/app/k;->f(I)V

    :cond_1
    iget-object v0, p0, Landroid/support/v7/app/k$1;->a:Landroid/support/v7/app/k;

    iput-boolean v2, v0, Landroid/support/v7/app/k;->r:Z

    iget-object v0, p0, Landroid/support/v7/app/k$1;->a:Landroid/support/v7/app/k;

    iput v2, v0, Landroid/support/v7/app/k;->s:I

    return-void
.end method
