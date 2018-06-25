.class public Landroid/support/constraint/a/a/g;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/constraint/a/a/g$a;
    }
.end annotation


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/constraint/a/a/g$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/support/constraint/a/a/b;)V
    .locals 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/a/a/g;->e:Ljava/util/ArrayList;

    invoke-virtual {p1}, Landroid/support/constraint/a/a/b;->f()I

    move-result v0

    iput v0, p0, Landroid/support/constraint/a/a/g;->a:I

    invoke-virtual {p1}, Landroid/support/constraint/a/a/b;->g()I

    move-result v0

    iput v0, p0, Landroid/support/constraint/a/a/g;->b:I

    invoke-virtual {p1}, Landroid/support/constraint/a/a/b;->h()I

    move-result v0

    iput v0, p0, Landroid/support/constraint/a/a/g;->c:I

    invoke-virtual {p1}, Landroid/support/constraint/a/a/b;->l()I

    move-result v0

    iput v0, p0, Landroid/support/constraint/a/a/g;->d:I

    invoke-virtual {p1}, Landroid/support/constraint/a/a/b;->y()Ljava/util/ArrayList;

    move-result-object v2

    const/4 v0, 0x0

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v1, v0

    :goto_0
    if-ge v1, v3, :cond_0

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a/a/a;

    iget-object v4, p0, Landroid/support/constraint/a/a/g;->e:Ljava/util/ArrayList;

    new-instance v5, Landroid/support/constraint/a/a/g$a;

    invoke-direct {v5, v0}, Landroid/support/constraint/a/a/g$a;-><init>(Landroid/support/constraint/a/a/a;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public a(Landroid/support/constraint/a/a/b;)V
    .locals 3

    invoke-virtual {p1}, Landroid/support/constraint/a/a/b;->f()I

    move-result v0

    iput v0, p0, Landroid/support/constraint/a/a/g;->a:I

    invoke-virtual {p1}, Landroid/support/constraint/a/a/b;->g()I

    move-result v0

    iput v0, p0, Landroid/support/constraint/a/a/g;->b:I

    invoke-virtual {p1}, Landroid/support/constraint/a/a/b;->h()I

    move-result v0

    iput v0, p0, Landroid/support/constraint/a/a/g;->c:I

    invoke-virtual {p1}, Landroid/support/constraint/a/a/b;->l()I

    move-result v0

    iput v0, p0, Landroid/support/constraint/a/a/g;->d:I

    iget-object v0, p0, Landroid/support/constraint/a/a/g;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_0

    iget-object v0, p0, Landroid/support/constraint/a/a/g;->e:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a/a/g$a;

    invoke-virtual {v0, p1}, Landroid/support/constraint/a/a/g$a;->a(Landroid/support/constraint/a/a/b;)V

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    return-void
.end method

.method public b(Landroid/support/constraint/a/a/b;)V
    .locals 3

    iget v0, p0, Landroid/support/constraint/a/a/g;->a:I

    invoke-virtual {p1, v0}, Landroid/support/constraint/a/a/b;->b(I)V

    iget v0, p0, Landroid/support/constraint/a/a/g;->b:I

    invoke-virtual {p1, v0}, Landroid/support/constraint/a/a/b;->c(I)V

    iget v0, p0, Landroid/support/constraint/a/a/g;->c:I

    invoke-virtual {p1, v0}, Landroid/support/constraint/a/a/b;->d(I)V

    iget v0, p0, Landroid/support/constraint/a/a/g;->d:I

    invoke-virtual {p1, v0}, Landroid/support/constraint/a/a/b;->e(I)V

    const/4 v0, 0x0

    iget-object v1, p0, Landroid/support/constraint/a/a/g;->e:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_0

    iget-object v0, p0, Landroid/support/constraint/a/a/g;->e:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a/a/g$a;

    invoke-virtual {v0, p1}, Landroid/support/constraint/a/a/g$a;->b(Landroid/support/constraint/a/a/b;)V

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    return-void
.end method
