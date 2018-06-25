.class public Landroid/support/constraint/a/b;
.super Ljava/lang/Object;


# instance fields
.field a:Landroid/support/constraint/a/g;

.field b:F

.field c:Z

.field final d:Landroid/support/constraint/a/a;

.field e:Z


# direct methods
.method public constructor <init>(Landroid/support/constraint/a/c;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/constraint/a/b;->a:Landroid/support/constraint/a/g;

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/constraint/a/b;->b:F

    iput-boolean v1, p0, Landroid/support/constraint/a/b;->c:Z

    iput-boolean v1, p0, Landroid/support/constraint/a/b;->e:Z

    new-instance v0, Landroid/support/constraint/a/a;

    invoke-direct {v0, p0, p1}, Landroid/support/constraint/a/a;-><init>(Landroid/support/constraint/a/b;Landroid/support/constraint/a/c;)V

    iput-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    return-void
.end method


# virtual methods
.method public a(FFFLandroid/support/constraint/a/g;ILandroid/support/constraint/a/g;ILandroid/support/constraint/a/g;ILandroid/support/constraint/a/g;I)Landroid/support/constraint/a/b;
    .locals 3

    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-eqz v0, :cond_0

    cmpl-float v0, p1, p3

    if-nez v0, :cond_1

    :cond_0
    neg-int v0, p5

    sub-int/2addr v0, p7

    add-int/2addr v0, p9

    add-int/2addr v0, p11

    int-to-float v0, v0

    iput v0, p0, Landroid/support/constraint/a/b;->b:F

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, p4, v1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-virtual {v0, p6, v1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, p10, v1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-virtual {v0, p8, v1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    :goto_0
    return-object p0

    :cond_1
    div-float v0, p1, p2

    div-float v1, p3, p2

    div-float/2addr v0, v1

    neg-int v1, p5

    sub-int/2addr v1, p7

    int-to-float v1, v1

    int-to-float v2, p9

    mul-float/2addr v2, v0

    add-float/2addr v1, v2

    int-to-float v2, p11

    mul-float/2addr v2, v0

    add-float/2addr v1, v2

    iput v1, p0, Landroid/support/constraint/a/b;->b:F

    iget-object v1, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, p4, v2}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v1, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    const/high16 v2, -0x40800000    # -1.0f

    invoke-virtual {v1, p6, v2}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v1, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v1, p10, v0}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v1, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    neg-float v0, v0

    invoke-virtual {v1, p8, v0}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    goto :goto_0
.end method

.method a(Landroid/support/constraint/a/g;I)Landroid/support/constraint/a/b;
    .locals 1

    iput-object p1, p0, Landroid/support/constraint/a/b;->a:Landroid/support/constraint/a/g;

    int-to-float v0, p2

    iput v0, p1, Landroid/support/constraint/a/g;->d:F

    int-to-float v0, p2

    iput v0, p0, Landroid/support/constraint/a/b;->b:F

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/constraint/a/b;->e:Z

    return-object p0
.end method

.method public a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;)Landroid/support/constraint/a/b;
    .locals 2

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, p1, v1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-virtual {v0, p2, v1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    return-object p0
.end method

.method public a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;I)Landroid/support/constraint/a/b;
    .locals 4

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v2, -0x40800000    # -1.0f

    const/4 v0, 0x0

    if-eqz p3, :cond_1

    if-gez p3, :cond_0

    mul-int/lit8 p3, p3, -0x1

    const/4 v0, 0x1

    :cond_0
    int-to-float v1, p3

    iput v1, p0, Landroid/support/constraint/a/b;->b:F

    :cond_1
    if-nez v0, :cond_2

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p1, v2}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p2, v3}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    :goto_0
    return-object p0

    :cond_2
    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p1, v3}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p2, v2}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    goto :goto_0
.end method

.method a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;IFLandroid/support/constraint/a/g;Landroid/support/constraint/a/g;I)Landroid/support/constraint/a/b;
    .locals 4

    const/high16 v3, -0x40800000    # -1.0f

    const/high16 v2, 0x3f800000    # 1.0f

    if-ne p2, p5, :cond_1

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p1, v2}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p6, v2}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    const/high16 v1, -0x40000000    # -2.0f

    invoke-virtual {v0, p2, v1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    :cond_0
    :goto_0
    return-object p0

    :cond_1
    const/high16 v0, 0x3f000000    # 0.5f

    cmpl-float v0, p4, v0

    if-nez v0, :cond_3

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p1, v2}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p2, v3}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p5, v3}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p6, v2}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    if-gtz p3, :cond_2

    if-lez p7, :cond_0

    :cond_2
    neg-int v0, p3

    add-int/2addr v0, p7

    int-to-float v0, v0

    iput v0, p0, Landroid/support/constraint/a/b;->b:F

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    cmpg-float v0, p4, v0

    if-gtz v0, :cond_4

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p1, v3}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p2, v2}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    int-to-float v0, p3

    iput v0, p0, Landroid/support/constraint/a/b;->b:F

    goto :goto_0

    :cond_4
    cmpl-float v0, p4, v2

    if-ltz v0, :cond_5

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p5, v3}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p6, v2}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    int-to-float v0, p7

    iput v0, p0, Landroid/support/constraint/a/b;->b:F

    goto :goto_0

    :cond_5
    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    sub-float v1, v2, p4

    mul-float/2addr v1, v2

    invoke-virtual {v0, p1, v1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    sub-float v1, v2, p4

    mul-float/2addr v1, v3

    invoke-virtual {v0, p2, v1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    mul-float v1, v3, p4

    invoke-virtual {v0, p5, v1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    mul-float v1, v2, p4

    invoke-virtual {v0, p6, v1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    if-gtz p3, :cond_6

    if-lez p7, :cond_0

    :cond_6
    neg-int v0, p3

    int-to-float v0, v0

    sub-float v1, v2, p4

    mul-float/2addr v0, v1

    int-to-float v1, p7

    mul-float/2addr v1, p4

    add-float/2addr v0, v1

    iput v0, p0, Landroid/support/constraint/a/b;->b:F

    goto :goto_0
.end method

.method a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;F)Landroid/support/constraint/a/b;
    .locals 2

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-virtual {v0, p1, v1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, p4

    invoke-virtual {v0, p2, v1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p3, p4}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    return-object p0
.end method

.method public a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;I)Landroid/support/constraint/a/b;
    .locals 4

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v2, -0x40800000    # -1.0f

    const/4 v0, 0x0

    if-eqz p4, :cond_1

    if-gez p4, :cond_0

    mul-int/lit8 p4, p4, -0x1

    const/4 v0, 0x1

    :cond_0
    int-to-float v1, p4

    iput v1, p0, Landroid/support/constraint/a/b;->b:F

    :cond_1
    if-nez v0, :cond_2

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p1, v2}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p2, v3}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p3, v3}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    :goto_0
    return-object p0

    :cond_2
    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p1, v3}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p2, v2}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p3, v2}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    goto :goto_0
.end method

.method public a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;F)Landroid/support/constraint/a/b;
    .locals 2

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-virtual {v0, p1, v1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, p2, v1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p3, p5}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    neg-float v1, p5

    invoke-virtual {v0, p4, v1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    return-object p0
.end method

.method a()V
    .locals 1

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p0}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/b;)V

    return-void
.end method

.method a(Landroid/support/constraint/a/b;)Z
    .locals 1

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p0, p1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/b;Landroid/support/constraint/a/b;)V

    const/4 v0, 0x1

    return v0
.end method

.method a(Landroid/support/constraint/a/g;)Z
    .locals 1

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p1}, Landroid/support/constraint/a/a;->b(Landroid/support/constraint/a/g;)Z

    move-result v0

    return v0
.end method

.method public b(Landroid/support/constraint/a/g;I)Landroid/support/constraint/a/b;
    .locals 2

    if-gez p2, :cond_0

    mul-int/lit8 v0, p2, -0x1

    int-to-float v0, v0

    iput v0, p0, Landroid/support/constraint/a/b;->b:F

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, p1, v1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    :goto_0
    return-object p0

    :cond_0
    int-to-float v0, p2

    iput v0, p0, Landroid/support/constraint/a/b;->b:F

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-virtual {v0, p1, v1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    goto :goto_0
.end method

.method public b(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;I)Landroid/support/constraint/a/b;
    .locals 4

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v2, -0x40800000    # -1.0f

    const/4 v0, 0x0

    if-eqz p4, :cond_1

    if-gez p4, :cond_0

    mul-int/lit8 p4, p4, -0x1

    const/4 v0, 0x1

    :cond_0
    int-to-float v1, p4

    iput v1, p0, Landroid/support/constraint/a/b;->b:F

    :cond_1
    if-nez v0, :cond_2

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p1, v2}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p2, v3}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p3, v2}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    :goto_0
    return-object p0

    :cond_2
    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p1, v3}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p2, v2}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p3, v3}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    goto :goto_0
.end method

.method b(Landroid/support/constraint/a/g;)V
    .locals 3

    const/high16 v2, -0x40800000    # -1.0f

    iget-object v0, p0, Landroid/support/constraint/a/b;->a:Landroid/support/constraint/a/g;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    iget-object v1, p0, Landroid/support/constraint/a/b;->a:Landroid/support/constraint/a/g;

    invoke-virtual {v0, v1, v2}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/constraint/a/b;->a:Landroid/support/constraint/a/g;

    :cond_0
    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0, p1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;)F

    move-result v0

    mul-float/2addr v0, v2

    iput-object p1, p0, Landroid/support/constraint/a/b;->a:Landroid/support/constraint/a/g;

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v1, v0, v1

    if-nez v1, :cond_1

    :goto_0
    return-void

    :cond_1
    iget v1, p0, Landroid/support/constraint/a/b;->b:F

    div-float/2addr v1, v0

    iput v1, p0, Landroid/support/constraint/a/b;->b:F

    iget-object v1, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v1, v0}, Landroid/support/constraint/a/a;->a(F)V

    goto :goto_0
.end method

.method b()Z
    .locals 2

    iget-object v0, p0, Landroid/support/constraint/a/b;->a:Landroid/support/constraint/a/g;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/constraint/a/b;->a:Landroid/support/constraint/a/g;

    iget-object v0, v0, Landroid/support/constraint/a/g;->f:Landroid/support/constraint/a/g$a;

    sget-object v1, Landroid/support/constraint/a/g$a;->a:Landroid/support/constraint/a/g$a;

    if-eq v0, v1, :cond_0

    iget v0, p0, Landroid/support/constraint/a/b;->b:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method c(Landroid/support/constraint/a/g;I)Landroid/support/constraint/a/b;
    .locals 2

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    int-to-float v1, p2

    invoke-virtual {v0, p1, v1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;F)V

    return-object p0
.end method

.method c()Ljava/lang/String;
    .locals 9

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/high16 v8, -0x40800000    # -1.0f

    const/4 v7, 0x0

    const-string v0, ""

    iget-object v3, p0, Landroid/support/constraint/a/b;->a:Landroid/support/constraint/a/g;

    if-nez v3, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "0"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " = "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget v3, p0, Landroid/support/constraint/a/b;->b:F

    cmpl-float v3, v3, v7

    if-eqz v3, :cond_8

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v3, p0, Landroid/support/constraint/a/b;->b:F

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v3, v0

    move v0, v1

    :goto_1
    iget-object v4, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    iget v5, v4, Landroid/support/constraint/a/a;->a:I

    move v4, v2

    move-object v2, v3

    :goto_2
    if-ge v4, v5, :cond_5

    iget-object v3, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v3, v4}, Landroid/support/constraint/a/a;->a(I)Landroid/support/constraint/a/g;

    move-result-object v6

    if-nez v6, :cond_1

    :goto_3
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    goto :goto_2

    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, p0, Landroid/support/constraint/a/b;->a:Landroid/support/constraint/a/g;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    iget-object v3, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v3, v4}, Landroid/support/constraint/a/a;->b(I)F

    move-result v3

    invoke-virtual {v6}, Landroid/support/constraint/a/g;->toString()Ljava/lang/String;

    move-result-object v6

    if-nez v0, :cond_2

    cmpg-float v0, v3, v7

    if-gez v0, :cond_7

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "- "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    mul-float v0, v3, v8

    :goto_4
    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v3, v0, v3

    if-nez v3, :cond_4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_5
    move-object v2, v0

    move v0, v1

    goto :goto_3

    :cond_2
    cmpl-float v0, v3, v7

    if-lez v0, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " + "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move v0, v3

    goto :goto_4

    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " - "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    mul-float v0, v3, v8

    goto :goto_4

    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    :cond_5
    if-nez v0, :cond_6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "0.0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_6
    return-object v2

    :cond_7
    move v0, v3

    goto :goto_4

    :cond_8
    move-object v3, v0

    move v0, v2

    goto/16 :goto_1
.end method

.method public d()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/constraint/a/b;->a:Landroid/support/constraint/a/g;

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0}, Landroid/support/constraint/a/a;->a()V

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/constraint/a/b;->b:F

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/constraint/a/b;->e:Z

    return-void
.end method

.method e()V
    .locals 2

    iget v0, p0, Landroid/support/constraint/a/b;->b:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    iget v0, p0, Landroid/support/constraint/a/b;->b:F

    const/high16 v1, -0x40800000    # -1.0f

    mul-float/2addr v0, v1

    iput v0, p0, Landroid/support/constraint/a/b;->b:F

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0}, Landroid/support/constraint/a/a;->b()V

    :cond_0
    return-void
.end method

.method f()V
    .locals 1

    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    invoke-virtual {v0}, Landroid/support/constraint/a/a;->c()Landroid/support/constraint/a/g;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, v0}, Landroid/support/constraint/a/b;->b(Landroid/support/constraint/a/g;)V

    :cond_0
    iget-object v0, p0, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    iget v0, v0, Landroid/support/constraint/a/a;->a:I

    if-nez v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/constraint/a/b;->e:Z

    :cond_1
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Landroid/support/constraint/a/b;->c()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
