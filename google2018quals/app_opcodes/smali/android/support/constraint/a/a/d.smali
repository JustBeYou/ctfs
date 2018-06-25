.class public Landroid/support/constraint/a/a/d;
.super Landroid/support/constraint/a/a/b;


# instance fields
.field protected aa:F

.field protected ab:I

.field protected ac:I

.field private ad:Landroid/support/constraint/a/a/a;

.field private ae:I

.field private af:Z

.field private ag:I

.field private ah:Landroid/support/constraint/a/a/f;

.field private ai:I


# direct methods
.method public constructor <init>()V
    .locals 3

    const/4 v2, -0x1

    const/4 v1, 0x0

    invoke-direct {p0}, Landroid/support/constraint/a/a/b;-><init>()V

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Landroid/support/constraint/a/a/d;->aa:F

    iput v2, p0, Landroid/support/constraint/a/a/d;->ab:I

    iput v2, p0, Landroid/support/constraint/a/a/d;->ac:I

    iget-object v0, p0, Landroid/support/constraint/a/a/d;->j:Landroid/support/constraint/a/a/a;

    iput-object v0, p0, Landroid/support/constraint/a/a/d;->ad:Landroid/support/constraint/a/a/a;

    iput v1, p0, Landroid/support/constraint/a/a/d;->ae:I

    iput-boolean v1, p0, Landroid/support/constraint/a/a/d;->af:Z

    iput v1, p0, Landroid/support/constraint/a/a/d;->ag:I

    new-instance v0, Landroid/support/constraint/a/a/f;

    invoke-direct {v0}, Landroid/support/constraint/a/a/f;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/a/a/d;->ah:Landroid/support/constraint/a/a/f;

    const/16 v0, 0x8

    iput v0, p0, Landroid/support/constraint/a/a/d;->ai:I

    iget-object v0, p0, Landroid/support/constraint/a/a/d;->q:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Landroid/support/constraint/a/a/d;->q:Ljava/util/ArrayList;

    iget-object v1, p0, Landroid/support/constraint/a/a/d;->ad:Landroid/support/constraint/a/a/a;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public D()I
    .locals 1

    iget v0, p0, Landroid/support/constraint/a/a/d;->ae:I

    return v0
.end method

.method public E()F
    .locals 1

    iget v0, p0, Landroid/support/constraint/a/a/d;->aa:F

    return v0
.end method

.method public F()I
    .locals 1

    iget v0, p0, Landroid/support/constraint/a/a/d;->ab:I

    return v0
.end method

.method public G()I
    .locals 1

    iget v0, p0, Landroid/support/constraint/a/a/d;->ac:I

    return v0
.end method

.method public a(Landroid/support/constraint/a/a/a$c;)Landroid/support/constraint/a/a/a;
    .locals 2

    sget-object v0, Landroid/support/constraint/a/a/d$1;->a:[I

    invoke-virtual {p1}, Landroid/support/constraint/a/a/a$c;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    :pswitch_0
    iget v0, p0, Landroid/support/constraint/a/a/d;->ae:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Landroid/support/constraint/a/a/d;->ad:Landroid/support/constraint/a/a/a;

    goto :goto_0

    :pswitch_1
    iget v0, p0, Landroid/support/constraint/a/a/d;->ae:I

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/constraint/a/a/d;->ad:Landroid/support/constraint/a/a/a;

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public a(Landroid/support/constraint/a/e;I)V
    .locals 6

    const/4 v5, 0x0

    const/4 v4, -0x1

    invoke-virtual {p0}, Landroid/support/constraint/a/a/d;->c()Landroid/support/constraint/a/a/b;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a/a/c;

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    sget-object v1, Landroid/support/constraint/a/a/a$c;->b:Landroid/support/constraint/a/a/a$c;

    invoke-virtual {v0, v1}, Landroid/support/constraint/a/a/c;->a(Landroid/support/constraint/a/a/a$c;)Landroid/support/constraint/a/a/a;

    move-result-object v2

    sget-object v1, Landroid/support/constraint/a/a/a$c;->d:Landroid/support/constraint/a/a/a$c;

    invoke-virtual {v0, v1}, Landroid/support/constraint/a/a/c;->a(Landroid/support/constraint/a/a/a$c;)Landroid/support/constraint/a/a/a;

    move-result-object v1

    iget v3, p0, Landroid/support/constraint/a/a/d;->ae:I

    if-nez v3, :cond_4

    sget-object v1, Landroid/support/constraint/a/a/a$c;->c:Landroid/support/constraint/a/a/a$c;

    invoke-virtual {v0, v1}, Landroid/support/constraint/a/a/c;->a(Landroid/support/constraint/a/a/a$c;)Landroid/support/constraint/a/a/a;

    move-result-object v1

    sget-object v2, Landroid/support/constraint/a/a/a$c;->e:Landroid/support/constraint/a/a/a$c;

    invoke-virtual {v0, v2}, Landroid/support/constraint/a/a/c;->a(Landroid/support/constraint/a/a/a$c;)Landroid/support/constraint/a/a/a;

    move-result-object v0

    move-object v2, v1

    :goto_1
    iget v1, p0, Landroid/support/constraint/a/a/d;->ab:I

    if-eq v1, v4, :cond_2

    iget-object v0, p0, Landroid/support/constraint/a/a/d;->ad:Landroid/support/constraint/a/a/a;

    invoke-virtual {p1, v0}, Landroid/support/constraint/a/e;->a(Ljava/lang/Object;)Landroid/support/constraint/a/g;

    move-result-object v0

    invoke-virtual {p1, v2}, Landroid/support/constraint/a/e;->a(Ljava/lang/Object;)Landroid/support/constraint/a/g;

    move-result-object v1

    iget v2, p0, Landroid/support/constraint/a/a/d;->ab:I

    invoke-static {p1, v0, v1, v2, v5}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/e;Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;IZ)Landroid/support/constraint/a/b;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/b;)V

    goto :goto_0

    :cond_2
    iget v1, p0, Landroid/support/constraint/a/a/d;->ac:I

    if-eq v1, v4, :cond_3

    iget-object v1, p0, Landroid/support/constraint/a/a/d;->ad:Landroid/support/constraint/a/a/a;

    invoke-virtual {p1, v1}, Landroid/support/constraint/a/e;->a(Ljava/lang/Object;)Landroid/support/constraint/a/g;

    move-result-object v1

    invoke-virtual {p1, v0}, Landroid/support/constraint/a/e;->a(Ljava/lang/Object;)Landroid/support/constraint/a/g;

    move-result-object v0

    iget v2, p0, Landroid/support/constraint/a/a/d;->ac:I

    neg-int v2, v2

    invoke-static {p1, v1, v0, v2, v5}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/e;Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;IZ)Landroid/support/constraint/a/b;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/b;)V

    goto :goto_0

    :cond_3
    iget v1, p0, Landroid/support/constraint/a/a/d;->aa:F

    const/high16 v3, -0x40800000    # -1.0f

    cmpl-float v1, v1, v3

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/support/constraint/a/a/d;->ad:Landroid/support/constraint/a/a/a;

    invoke-virtual {p1, v1}, Landroid/support/constraint/a/e;->a(Ljava/lang/Object;)Landroid/support/constraint/a/g;

    move-result-object v1

    invoke-virtual {p1, v2}, Landroid/support/constraint/a/e;->a(Ljava/lang/Object;)Landroid/support/constraint/a/g;

    move-result-object v2

    invoke-virtual {p1, v0}, Landroid/support/constraint/a/e;->a(Ljava/lang/Object;)Landroid/support/constraint/a/g;

    move-result-object v3

    iget v4, p0, Landroid/support/constraint/a/a/d;->aa:F

    iget-boolean v5, p0, Landroid/support/constraint/a/a/d;->af:Z

    move-object v0, p1

    invoke-static/range {v0 .. v5}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/e;Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;FZ)Landroid/support/constraint/a/b;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/b;)V

    goto :goto_0

    :cond_4
    move-object v0, v1

    goto :goto_1
.end method

.method public b(Landroid/support/constraint/a/e;I)V
    .locals 4

    const/4 v3, 0x0

    invoke-virtual {p0}, Landroid/support/constraint/a/a/d;->c()Landroid/support/constraint/a/a/b;

    move-result-object v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Landroid/support/constraint/a/a/d;->ad:Landroid/support/constraint/a/a/a;

    invoke-virtual {p1, v0}, Landroid/support/constraint/a/e;->b(Ljava/lang/Object;)I

    move-result v0

    iget v1, p0, Landroid/support/constraint/a/a/d;->ae:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    invoke-virtual {p0, v0}, Landroid/support/constraint/a/a/d;->b(I)V

    invoke-virtual {p0, v3}, Landroid/support/constraint/a/a/d;->c(I)V

    invoke-virtual {p0}, Landroid/support/constraint/a/a/d;->c()Landroid/support/constraint/a/a/b;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->l()I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/support/constraint/a/a/d;->e(I)V

    invoke-virtual {p0, v3}, Landroid/support/constraint/a/a/d;->d(I)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v3}, Landroid/support/constraint/a/a/d;->b(I)V

    invoke-virtual {p0, v0}, Landroid/support/constraint/a/a/d;->c(I)V

    invoke-virtual {p0}, Landroid/support/constraint/a/a/d;->c()Landroid/support/constraint/a/a/b;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->h()I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/support/constraint/a/a/d;->d(I)V

    invoke-virtual {p0, v3}, Landroid/support/constraint/a/a/d;->e(I)V

    goto :goto_0
.end method

.method public e(F)V
    .locals 2

    const/4 v1, -0x1

    const/high16 v0, -0x40800000    # -1.0f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    iput p1, p0, Landroid/support/constraint/a/a/d;->aa:F

    iput v1, p0, Landroid/support/constraint/a/a/d;->ab:I

    iput v1, p0, Landroid/support/constraint/a/a/d;->ac:I

    :cond_0
    return-void
.end method

.method public m(I)V
    .locals 2

    iget v0, p0, Landroid/support/constraint/a/a/d;->ae:I

    if-ne v0, p1, :cond_0

    :goto_0
    return-void

    :cond_0
    iput p1, p0, Landroid/support/constraint/a/a/d;->ae:I

    iget-object v0, p0, Landroid/support/constraint/a/a/d;->q:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget v0, p0, Landroid/support/constraint/a/a/d;->ae:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Landroid/support/constraint/a/a/d;->i:Landroid/support/constraint/a/a/a;

    iput-object v0, p0, Landroid/support/constraint/a/a/d;->ad:Landroid/support/constraint/a/a/a;

    :goto_1
    iget-object v0, p0, Landroid/support/constraint/a/a/d;->q:Ljava/util/ArrayList;

    iget-object v1, p0, Landroid/support/constraint/a/a/d;->ad:Landroid/support/constraint/a/a/a;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    iget-object v0, p0, Landroid/support/constraint/a/a/d;->j:Landroid/support/constraint/a/a/a;

    iput-object v0, p0, Landroid/support/constraint/a/a/d;->ad:Landroid/support/constraint/a/a/a;

    goto :goto_1
.end method

.method public n(I)V
    .locals 2

    const/4 v1, -0x1

    if-le p1, v1, :cond_0

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Landroid/support/constraint/a/a/d;->aa:F

    iput p1, p0, Landroid/support/constraint/a/a/d;->ab:I

    iput v1, p0, Landroid/support/constraint/a/a/d;->ac:I

    :cond_0
    return-void
.end method

.method public o(I)V
    .locals 2

    const/4 v1, -0x1

    if-le p1, v1, :cond_0

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Landroid/support/constraint/a/a/d;->aa:F

    iput v1, p0, Landroid/support/constraint/a/a/d;->ab:I

    iput p1, p0, Landroid/support/constraint/a/a/d;->ac:I

    :cond_0
    return-void
.end method

.method public y()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/constraint/a/a/a;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/constraint/a/a/d;->q:Ljava/util/ArrayList;

    return-object v0
.end method
