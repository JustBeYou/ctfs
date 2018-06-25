.class public Landroid/support/constraint/a/a/h;
.super Landroid/support/constraint/a/a/b;


# instance fields
.field protected aj:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/constraint/a/a/b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/support/constraint/a/a/b;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/a/a/h;->aj:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public F()V
    .locals 4

    invoke-virtual {p0}, Landroid/support/constraint/a/a/h;->z()V

    iget-object v0, p0, Landroid/support/constraint/a/a/h;->aj:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Landroid/support/constraint/a/a/h;->aj:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_0

    iget-object v0, p0, Landroid/support/constraint/a/a/h;->aj:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a/a/b;

    instance-of v3, v0, Landroid/support/constraint/a/a/h;

    if-eqz v3, :cond_2

    check-cast v0, Landroid/support/constraint/a/a/h;

    invoke-virtual {v0}, Landroid/support/constraint/a/a/h;->F()V

    :cond_2
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0
.end method

.method public H()Landroid/support/constraint/a/a/c;
    .locals 3

    invoke-virtual {p0}, Landroid/support/constraint/a/a/b;->c()Landroid/support/constraint/a/a/b;

    move-result-object v1

    const/4 v0, 0x0

    instance-of v2, p0, Landroid/support/constraint/a/a/c;

    if-eqz v2, :cond_2

    check-cast p0, Landroid/support/constraint/a/a/c;

    move-object v0, v1

    :goto_0
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->c()Landroid/support/constraint/a/a/b;

    move-result-object v1

    instance-of v2, v0, Landroid/support/constraint/a/a/c;

    if-eqz v2, :cond_1

    check-cast v0, Landroid/support/constraint/a/a/c;

    move-object p0, v0

    move-object v0, v1

    goto :goto_0

    :cond_0
    return-object p0

    :cond_1
    move-object v0, v1

    goto :goto_0

    :cond_2
    move-object p0, v0

    move-object v0, v1

    goto :goto_0
.end method

.method public I()V
    .locals 1

    iget-object v0, p0, Landroid/support/constraint/a/a/h;->aj:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public a()V
    .locals 1

    iget-object v0, p0, Landroid/support/constraint/a/a/h;->aj:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-super {p0}, Landroid/support/constraint/a/a/b;->a()V

    return-void
.end method

.method public a(Landroid/support/constraint/a/c;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/support/constraint/a/a/b;->a(Landroid/support/constraint/a/c;)V

    iget-object v0, p0, Landroid/support/constraint/a/a/h;->aj:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_0

    iget-object v0, p0, Landroid/support/constraint/a/a/h;->aj:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a/a/b;

    invoke-virtual {v0, p1}, Landroid/support/constraint/a/a/b;->a(Landroid/support/constraint/a/c;)V

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    return-void
.end method

.method public b(II)V
    .locals 5

    invoke-super {p0, p1, p2}, Landroid/support/constraint/a/a/b;->b(II)V

    iget-object v0, p0, Landroid/support/constraint/a/a/h;->aj:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_0

    iget-object v0, p0, Landroid/support/constraint/a/a/h;->aj:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a/a/b;

    invoke-virtual {p0}, Landroid/support/constraint/a/a/h;->r()I

    move-result v3

    invoke-virtual {p0}, Landroid/support/constraint/a/a/h;->s()I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/support/constraint/a/a/b;->b(II)V

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    return-void
.end method

.method public b(Landroid/support/constraint/a/a/b;)V
    .locals 1

    iget-object v0, p0, Landroid/support/constraint/a/a/h;->aj:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Landroid/support/constraint/a/a/b;->c()Landroid/support/constraint/a/a/b;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/support/constraint/a/a/b;->c()Landroid/support/constraint/a/a/b;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a/a/h;

    invoke-virtual {v0, p1}, Landroid/support/constraint/a/a/h;->c(Landroid/support/constraint/a/a/b;)V

    :cond_0
    invoke-virtual {p1, p0}, Landroid/support/constraint/a/a/b;->a(Landroid/support/constraint/a/a/b;)V

    return-void
.end method

.method public c(Landroid/support/constraint/a/a/b;)V
    .locals 1

    iget-object v0, p0, Landroid/support/constraint/a/a/h;->aj:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/constraint/a/a/b;->a(Landroid/support/constraint/a/a/b;)V

    return-void
.end method

.method public z()V
    .locals 5

    invoke-super {p0}, Landroid/support/constraint/a/a/b;->z()V

    iget-object v0, p0, Landroid/support/constraint/a/a/h;->aj:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Landroid/support/constraint/a/a/h;->aj:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_0

    iget-object v0, p0, Landroid/support/constraint/a/a/h;->aj:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a/a/b;

    invoke-virtual {p0}, Landroid/support/constraint/a/a/h;->n()I

    move-result v3

    invoke-virtual {p0}, Landroid/support/constraint/a/a/h;->o()I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/support/constraint/a/a/b;->b(II)V

    instance-of v3, v0, Landroid/support/constraint/a/a/c;

    if-nez v3, :cond_2

    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->z()V

    :cond_2
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0
.end method
