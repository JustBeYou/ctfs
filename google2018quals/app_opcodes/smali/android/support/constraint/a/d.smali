.class public Landroid/support/constraint/a/d;
.super Ljava/lang/Object;


# instance fields
.field a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/constraint/a/g;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/a/d;->a:Ljava/util/ArrayList;

    return-void
.end method

.method private b(Landroid/support/constraint/a/e;)V
    .locals 5

    iget-object v0, p0, Landroid/support/constraint/a/d;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x1

    :goto_0
    iget v1, p1, Landroid/support/constraint/a/e;->b:I

    if-ge v0, v1, :cond_2

    iget-object v1, p1, Landroid/support/constraint/a/e;->c:Landroid/support/constraint/a/c;

    iget-object v1, v1, Landroid/support/constraint/a/c;->c:[Landroid/support/constraint/a/g;

    aget-object v2, v1, v0

    const/4 v1, 0x0

    :goto_1
    const/4 v3, 0x6

    if-ge v1, v3, :cond_0

    iget-object v3, v2, Landroid/support/constraint/a/g;->e:[F

    const/4 v4, 0x0

    aput v4, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_0
    iget-object v1, v2, Landroid/support/constraint/a/g;->e:[F

    iget v3, v2, Landroid/support/constraint/a/g;->c:I

    const/high16 v4, 0x3f800000    # 1.0f

    aput v4, v1, v3

    iget-object v1, v2, Landroid/support/constraint/a/g;->f:Landroid/support/constraint/a/g$a;

    sget-object v3, Landroid/support/constraint/a/g$a;->d:Landroid/support/constraint/a/g$a;

    if-eq v1, v3, :cond_1

    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Landroid/support/constraint/a/d;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_2
    return-void
.end method


# virtual methods
.method a()Landroid/support/constraint/a/g;
    .locals 11

    const/4 v4, 0x0

    const/4 v0, 0x0

    const/4 v9, 0x0

    iget-object v1, p0, Landroid/support/constraint/a/d;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v6

    move v5, v0

    move v1, v0

    move-object v2, v4

    :goto_0
    if-ge v5, v6, :cond_3

    iget-object v0, p0, Landroid/support/constraint/a/d;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a/g;

    const/4 v3, 0x5

    move v10, v3

    move-object v3, v2

    move v2, v10

    :goto_1
    if-ltz v2, :cond_2

    iget-object v7, v0, Landroid/support/constraint/a/g;->e:[F

    aget v7, v7, v2

    if-nez v3, :cond_0

    cmpg-float v8, v7, v9

    if-gez v8, :cond_0

    if-lt v2, v1, :cond_0

    move v1, v2

    move-object v3, v0

    :cond_0
    cmpl-float v7, v7, v9

    if-lez v7, :cond_1

    if-le v2, v1, :cond_1

    move v1, v2

    move-object v3, v4

    :cond_1
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    :cond_2
    add-int/lit8 v0, v5, 0x1

    move v5, v0

    move-object v2, v3

    goto :goto_0

    :cond_3
    return-object v2
.end method

.method a(Landroid/support/constraint/a/e;)V
    .locals 13

    const/4 v2, 0x0

    invoke-direct {p0, p1}, Landroid/support/constraint/a/d;->b(Landroid/support/constraint/a/e;)V

    iget-object v0, p0, Landroid/support/constraint/a/d;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v4, v2

    :goto_0
    if-ge v4, v5, :cond_5

    iget-object v0, p0, Landroid/support/constraint/a/d;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a/g;

    iget v1, v0, Landroid/support/constraint/a/g;->b:I

    const/4 v3, -0x1

    if-eq v1, v3, :cond_4

    iget v1, v0, Landroid/support/constraint/a/g;->b:I

    invoke-virtual {p1, v1}, Landroid/support/constraint/a/e;->a(I)Landroid/support/constraint/a/b;

    move-result-object v1

    iget-object v6, v1, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    iget v7, v6, Landroid/support/constraint/a/a;->a:I

    move v3, v2

    :goto_1
    if-ge v3, v7, :cond_3

    invoke-virtual {v6, v3}, Landroid/support/constraint/a/a;->a(I)Landroid/support/constraint/a/g;

    move-result-object v8

    if-nez v8, :cond_1

    :cond_0
    :goto_2
    add-int/lit8 v1, v3, 0x1

    move v3, v1

    goto :goto_1

    :cond_1
    invoke-virtual {v6, v3}, Landroid/support/constraint/a/a;->b(I)F

    move-result v9

    move v1, v2

    :goto_3
    const/4 v10, 0x6

    if-ge v1, v10, :cond_2

    iget-object v10, v8, Landroid/support/constraint/a/g;->e:[F

    aget v11, v10, v1

    iget-object v12, v0, Landroid/support/constraint/a/g;->e:[F

    aget v12, v12, v1

    mul-float/2addr v12, v9

    add-float/2addr v11, v12

    aput v11, v10, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_2
    iget-object v1, p0, Landroid/support/constraint/a/d;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Landroid/support/constraint/a/d;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_3
    invoke-virtual {v0}, Landroid/support/constraint/a/g;->a()V

    :cond_4
    add-int/lit8 v0, v4, 0x1

    move v4, v0

    goto :goto_0

    :cond_5
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    const-string v1, "Goal: "

    iget-object v0, p0, Landroid/support/constraint/a/d;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v0, 0x0

    move-object v2, v1

    move v1, v0

    :goto_0
    if-ge v1, v3, :cond_0

    iget-object v0, p0, Landroid/support/constraint/a/d;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a/g;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/support/constraint/a/g;->b()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    return-object v2
.end method
