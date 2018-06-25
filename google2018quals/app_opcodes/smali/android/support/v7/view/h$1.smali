.class Landroid/support/v7/view/h$1;
.super Landroid/support/v4/h/t;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/view/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/support/v7/view/h;

.field private b:Z

.field private c:I


# direct methods
.method constructor <init>(Landroid/support/v7/view/h;)V
    .locals 1

    const/4 v0, 0x0

    iput-object p1, p0, Landroid/support/v7/view/h$1;->a:Landroid/support/v7/view/h;

    invoke-direct {p0}, Landroid/support/v4/h/t;-><init>()V

    iput-boolean v0, p0, Landroid/support/v7/view/h$1;->b:Z

    iput v0, p0, Landroid/support/v7/view/h$1;->c:I

    return-void
.end method


# virtual methods
.method a()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/view/h$1;->c:I

    iput-boolean v0, p0, Landroid/support/v7/view/h$1;->b:Z

    iget-object v0, p0, Landroid/support/v7/view/h$1;->a:Landroid/support/v7/view/h;

    invoke-virtual {v0}, Landroid/support/v7/view/h;->b()V

    return-void
.end method

.method public a(Landroid/view/View;)V
    .locals 2

    iget-boolean v0, p0, Landroid/support/v7/view/h$1;->b:Z

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/view/h$1;->b:Z

    iget-object v0, p0, Landroid/support/v7/view/h$1;->a:Landroid/support/v7/view/h;

    iget-object v0, v0, Landroid/support/v7/view/h;->b:Landroid/support/v4/h/s;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/view/h$1;->a:Landroid/support/v7/view/h;

    iget-object v0, v0, Landroid/support/v7/view/h;->b:Landroid/support/v4/h/s;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/support/v4/h/s;->a(Landroid/view/View;)V

    goto :goto_0
.end method

.method public b(Landroid/view/View;)V
    .locals 2

    iget v0, p0, Landroid/support/v7/view/h$1;->c:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/v7/view/h$1;->c:I

    iget-object v1, p0, Landroid/support/v7/view/h$1;->a:Landroid/support/v7/view/h;

    iget-object v1, v1, Landroid/support/v7/view/h;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Landroid/support/v7/view/h$1;->a:Landroid/support/v7/view/h;

    iget-object v0, v0, Landroid/support/v7/view/h;->b:Landroid/support/v4/h/s;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/view/h$1;->a:Landroid/support/v7/view/h;

    iget-object v0, v0, Landroid/support/v7/view/h;->b:Landroid/support/v4/h/s;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/support/v4/h/s;->b(Landroid/view/View;)V

    :cond_0
    invoke-virtual {p0}, Landroid/support/v7/view/h$1;->a()V

    :cond_1
    return-void
.end method
