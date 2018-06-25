.class public Landroid/support/constraint/a/a;
.super Ljava/lang/Object;


# instance fields
.field a:I

.field private final b:Landroid/support/constraint/a/b;

.field private final c:Landroid/support/constraint/a/c;

.field private d:I

.field private e:Landroid/support/constraint/a/g;

.field private f:[I

.field private g:[I

.field private h:[F

.field private i:I

.field private j:I

.field private k:Z


# direct methods
.method constructor <init>(Landroid/support/constraint/a/b;Landroid/support/constraint/a/c;)V
    .locals 3

    const/4 v2, 0x0

    const/4 v1, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v2, p0, Landroid/support/constraint/a/a;->a:I

    const/16 v0, 0x8

    iput v0, p0, Landroid/support/constraint/a/a;->d:I

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/constraint/a/a;->e:Landroid/support/constraint/a/g;

    iget v0, p0, Landroid/support/constraint/a/a;->d:I

    new-array v0, v0, [I

    iput-object v0, p0, Landroid/support/constraint/a/a;->f:[I

    iget v0, p0, Landroid/support/constraint/a/a;->d:I

    new-array v0, v0, [I

    iput-object v0, p0, Landroid/support/constraint/a/a;->g:[I

    iget v0, p0, Landroid/support/constraint/a/a;->d:I

    new-array v0, v0, [F

    iput-object v0, p0, Landroid/support/constraint/a/a;->h:[F

    iput v1, p0, Landroid/support/constraint/a/a;->i:I

    iput v1, p0, Landroid/support/constraint/a/a;->j:I

    iput-boolean v2, p0, Landroid/support/constraint/a/a;->k:Z

    iput-object p1, p0, Landroid/support/constraint/a/a;->b:Landroid/support/constraint/a/b;

    iput-object p2, p0, Landroid/support/constraint/a/a;->c:Landroid/support/constraint/a/c;

    return-void
.end method


# virtual methods
.method public final a(Landroid/support/constraint/a/g;)F
    .locals 8

    const/4 v0, 0x0

    const/4 v3, -0x1

    iget-object v1, p0, Landroid/support/constraint/a/a;->e:Landroid/support/constraint/a/g;

    if-ne v1, p1, :cond_0

    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/constraint/a/a;->e:Landroid/support/constraint/a/g;

    :cond_0
    iget v1, p0, Landroid/support/constraint/a/a;->i:I

    if-ne v1, v3, :cond_2

    :cond_1
    :goto_0
    return v0

    :cond_2
    iget v4, p0, Landroid/support/constraint/a/a;->i:I

    const/4 v1, 0x0

    move v2, v3

    :goto_1
    if-eq v4, v3, :cond_1

    iget v5, p0, Landroid/support/constraint/a/a;->a:I

    if-ge v1, v5, :cond_1

    iget-object v5, p0, Landroid/support/constraint/a/a;->f:[I

    aget v5, v5, v4

    iget v6, p1, Landroid/support/constraint/a/g;->a:I

    if-ne v5, v6, :cond_5

    iget v0, p0, Landroid/support/constraint/a/a;->i:I

    if-ne v4, v0, :cond_4

    iget-object v0, p0, Landroid/support/constraint/a/a;->g:[I

    aget v0, v0, v4

    iput v0, p0, Landroid/support/constraint/a/a;->i:I

    :goto_2
    iget-object v0, p0, Landroid/support/constraint/a/a;->c:Landroid/support/constraint/a/c;

    iget-object v0, v0, Landroid/support/constraint/a/c;->c:[Landroid/support/constraint/a/g;

    aget-object v0, v0, v5

    iget-object v1, p0, Landroid/support/constraint/a/a;->b:Landroid/support/constraint/a/b;

    invoke-virtual {v0, v1}, Landroid/support/constraint/a/g;->b(Landroid/support/constraint/a/b;)V

    iget v0, p0, Landroid/support/constraint/a/a;->a:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/support/constraint/a/a;->a:I

    iget-object v0, p0, Landroid/support/constraint/a/a;->f:[I

    aput v3, v0, v4

    iget-boolean v0, p0, Landroid/support/constraint/a/a;->k:Z

    if-eqz v0, :cond_3

    iput v4, p0, Landroid/support/constraint/a/a;->j:I

    :cond_3
    iget-object v0, p0, Landroid/support/constraint/a/a;->h:[F

    aget v0, v0, v4

    goto :goto_0

    :cond_4
    iget-object v0, p0, Landroid/support/constraint/a/a;->g:[I

    iget-object v1, p0, Landroid/support/constraint/a/a;->g:[I

    aget v1, v1, v4

    aput v1, v0, v2

    goto :goto_2

    :cond_5
    iget-object v2, p0, Landroid/support/constraint/a/a;->g:[I

    aget v2, v2, v4

    add-int/lit8 v1, v1, 0x1

    move v7, v4

    move v4, v2

    move v2, v7

    goto :goto_1
.end method

.method final a(I)Landroid/support/constraint/a/g;
    .locals 3

    iget v1, p0, Landroid/support/constraint/a/a;->i:I

    const/4 v0, 0x0

    :goto_0
    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    iget v2, p0, Landroid/support/constraint/a/a;->a:I

    if-ge v0, v2, :cond_1

    if-ne v0, p1, :cond_0

    iget-object v0, p0, Landroid/support/constraint/a/a;->c:Landroid/support/constraint/a/c;

    iget-object v0, v0, Landroid/support/constraint/a/c;->c:[Landroid/support/constraint/a/g;

    iget-object v2, p0, Landroid/support/constraint/a/a;->f:[I

    aget v1, v2, v1

    aget-object v0, v0, v1

    :goto_1
    return-object v0

    :cond_0
    iget-object v2, p0, Landroid/support/constraint/a/a;->g:[I

    aget v1, v2, v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public final a()V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/constraint/a/a;->i:I

    iput v0, p0, Landroid/support/constraint/a/a;->j:I

    iput-boolean v1, p0, Landroid/support/constraint/a/a;->k:Z

    iput v1, p0, Landroid/support/constraint/a/a;->a:I

    return-void
.end method

.method a(F)V
    .locals 4

    iget v1, p0, Landroid/support/constraint/a/a;->i:I

    const/4 v0, 0x0

    :goto_0
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    iget v2, p0, Landroid/support/constraint/a/a;->a:I

    if-ge v0, v2, :cond_0

    iget-object v2, p0, Landroid/support/constraint/a/a;->h:[F

    aget v3, v2, v1

    div-float/2addr v3, p1

    aput v3, v2, v1

    iget-object v2, p0, Landroid/support/constraint/a/a;->g:[I

    aget v1, v2, v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method a(Landroid/support/constraint/a/b;)V
    .locals 4

    iget v1, p0, Landroid/support/constraint/a/a;->i:I

    const/4 v0, 0x0

    :goto_0
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    iget v2, p0, Landroid/support/constraint/a/a;->a:I

    if-ge v0, v2, :cond_0

    iget-object v2, p0, Landroid/support/constraint/a/a;->c:Landroid/support/constraint/a/c;

    iget-object v2, v2, Landroid/support/constraint/a/c;->c:[Landroid/support/constraint/a/g;

    iget-object v3, p0, Landroid/support/constraint/a/a;->f:[I

    aget v3, v3, v1

    aget-object v2, v2, v3

    invoke-virtual {v2, p1}, Landroid/support/constraint/a/g;->a(Landroid/support/constraint/a/b;)V

    iget-object v2, p0, Landroid/support/constraint/a/a;->g:[I

    aget v1, v2, v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method a(Landroid/support/constraint/a/b;Landroid/support/constraint/a/b;)V
    .locals 8

    const/4 v7, -0x1

    const/4 v1, 0x0

    iget v0, p0, Landroid/support/constraint/a/a;->i:I

    move v2, v0

    move v0, v1

    :goto_0
    if-eq v2, v7, :cond_2

    iget v3, p0, Landroid/support/constraint/a/a;->a:I

    if-ge v0, v3, :cond_2

    iget-object v3, p0, Landroid/support/constraint/a/a;->f:[I

    aget v3, v3, v2

    iget-object v4, p2, Landroid/support/constraint/a/b;->a:Landroid/support/constraint/a/g;

    iget v4, v4, Landroid/support/constraint/a/g;->a:I

    if-ne v3, v4, :cond_1

    iget-object v0, p0, Landroid/support/constraint/a/a;->h:[F

    aget v3, v0, v2

    iget-object v0, p2, Landroid/support/constraint/a/b;->a:Landroid/support/constraint/a/g;

    invoke-virtual {p0, v0}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;)F

    iget-object v4, p2, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    iget v0, v4, Landroid/support/constraint/a/a;->i:I

    move v2, v0

    move v0, v1

    :goto_1
    if-eq v2, v7, :cond_0

    iget v5, v4, Landroid/support/constraint/a/a;->a:I

    if-ge v0, v5, :cond_0

    iget-object v5, p0, Landroid/support/constraint/a/a;->c:Landroid/support/constraint/a/c;

    iget-object v5, v5, Landroid/support/constraint/a/c;->c:[Landroid/support/constraint/a/g;

    iget-object v6, v4, Landroid/support/constraint/a/a;->f:[I

    aget v6, v6, v2

    aget-object v5, v5, v6

    iget-object v6, v4, Landroid/support/constraint/a/a;->h:[F

    aget v6, v6, v2

    mul-float/2addr v6, v3

    invoke-virtual {p0, v5, v6}, Landroid/support/constraint/a/a;->b(Landroid/support/constraint/a/g;F)V

    iget-object v5, v4, Landroid/support/constraint/a/a;->g:[I

    aget v2, v5, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_0
    iget v0, p1, Landroid/support/constraint/a/b;->b:F

    iget v2, p2, Landroid/support/constraint/a/b;->b:F

    mul-float/2addr v2, v3

    add-float/2addr v0, v2

    iput v0, p1, Landroid/support/constraint/a/b;->b:F

    iget-object v0, p2, Landroid/support/constraint/a/b;->a:Landroid/support/constraint/a/g;

    invoke-virtual {v0, p1}, Landroid/support/constraint/a/g;->b(Landroid/support/constraint/a/b;)V

    iget v0, p0, Landroid/support/constraint/a/a;->i:I

    move v2, v0

    move v0, v1

    goto :goto_0

    :cond_1
    iget-object v3, p0, Landroid/support/constraint/a/a;->g:[I

    aget v2, v3, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method a(Landroid/support/constraint/a/b;[Landroid/support/constraint/a/b;)V
    .locals 9

    const/4 v1, 0x0

    const/4 v8, -0x1

    iget v0, p0, Landroid/support/constraint/a/a;->i:I

    move v2, v0

    move v0, v1

    :goto_0
    if-eq v2, v8, :cond_2

    iget v3, p0, Landroid/support/constraint/a/a;->a:I

    if-ge v0, v3, :cond_2

    iget-object v3, p0, Landroid/support/constraint/a/a;->c:Landroid/support/constraint/a/c;

    iget-object v3, v3, Landroid/support/constraint/a/c;->c:[Landroid/support/constraint/a/g;

    iget-object v4, p0, Landroid/support/constraint/a/a;->f:[I

    aget v4, v4, v2

    aget-object v3, v3, v4

    iget v4, v3, Landroid/support/constraint/a/g;->b:I

    if-eq v4, v8, :cond_1

    iget-object v0, p0, Landroid/support/constraint/a/a;->h:[F

    aget v4, v0, v2

    invoke-virtual {p0, v3}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;)F

    iget v0, v3, Landroid/support/constraint/a/g;->b:I

    aget-object v3, p2, v0

    iget-boolean v0, v3, Landroid/support/constraint/a/b;->e:Z

    if-nez v0, :cond_0

    iget-object v5, v3, Landroid/support/constraint/a/b;->d:Landroid/support/constraint/a/a;

    iget v0, v5, Landroid/support/constraint/a/a;->i:I

    move v2, v0

    move v0, v1

    :goto_1
    if-eq v2, v8, :cond_0

    iget v6, v5, Landroid/support/constraint/a/a;->a:I

    if-ge v0, v6, :cond_0

    iget-object v6, p0, Landroid/support/constraint/a/a;->c:Landroid/support/constraint/a/c;

    iget-object v6, v6, Landroid/support/constraint/a/c;->c:[Landroid/support/constraint/a/g;

    iget-object v7, v5, Landroid/support/constraint/a/a;->f:[I

    aget v7, v7, v2

    aget-object v6, v6, v7

    iget-object v7, v5, Landroid/support/constraint/a/a;->h:[F

    aget v7, v7, v2

    mul-float/2addr v7, v4

    invoke-virtual {p0, v6, v7}, Landroid/support/constraint/a/a;->b(Landroid/support/constraint/a/g;F)V

    iget-object v6, v5, Landroid/support/constraint/a/a;->g:[I

    aget v2, v6, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_0
    iget v0, p1, Landroid/support/constraint/a/b;->b:F

    iget v2, v3, Landroid/support/constraint/a/b;->b:F

    mul-float/2addr v2, v4

    add-float/2addr v0, v2

    iput v0, p1, Landroid/support/constraint/a/b;->b:F

    iget-object v0, v3, Landroid/support/constraint/a/b;->a:Landroid/support/constraint/a/g;

    invoke-virtual {v0, p1}, Landroid/support/constraint/a/g;->b(Landroid/support/constraint/a/b;)V

    iget v0, p0, Landroid/support/constraint/a/a;->i:I

    move v2, v0

    move v0, v1

    goto :goto_0

    :cond_1
    iget-object v3, p0, Landroid/support/constraint/a/a;->g:[I

    aget v2, v3, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public final a(Landroid/support/constraint/a/g;F)V
    .locals 7

    const/4 v3, 0x0

    const/4 v4, -0x1

    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-nez v0, :cond_1

    invoke-virtual {p0, p1}, Landroid/support/constraint/a/a;->a(Landroid/support/constraint/a/g;)F

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget v0, p0, Landroid/support/constraint/a/a;->i:I

    if-ne v0, v4, :cond_2

    iput v3, p0, Landroid/support/constraint/a/a;->i:I

    iget-object v0, p0, Landroid/support/constraint/a/a;->h:[F

    iget v1, p0, Landroid/support/constraint/a/a;->i:I

    aput p2, v0, v1

    iget-object v0, p0, Landroid/support/constraint/a/a;->f:[I

    iget v1, p0, Landroid/support/constraint/a/a;->i:I

    iget v2, p1, Landroid/support/constraint/a/g;->a:I

    aput v2, v0, v1

    iget-object v0, p0, Landroid/support/constraint/a/a;->g:[I

    iget v1, p0, Landroid/support/constraint/a/a;->i:I

    aput v4, v0, v1

    iget v0, p0, Landroid/support/constraint/a/a;->a:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/constraint/a/a;->a:I

    iget-boolean v0, p0, Landroid/support/constraint/a/a;->k:Z

    if-nez v0, :cond_0

    iget v0, p0, Landroid/support/constraint/a/a;->j:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/constraint/a/a;->j:I

    goto :goto_0

    :cond_2
    iget v1, p0, Landroid/support/constraint/a/a;->i:I

    move v2, v3

    move v0, v4

    :goto_1
    if-eq v1, v4, :cond_5

    iget v5, p0, Landroid/support/constraint/a/a;->a:I

    if-ge v2, v5, :cond_5

    iget-object v5, p0, Landroid/support/constraint/a/a;->f:[I

    aget v5, v5, v1

    iget v6, p1, Landroid/support/constraint/a/g;->a:I

    if-ne v5, v6, :cond_3

    iget-object v0, p0, Landroid/support/constraint/a/a;->h:[F

    aput p2, v0, v1

    goto :goto_0

    :cond_3
    iget-object v5, p0, Landroid/support/constraint/a/a;->f:[I

    aget v5, v5, v1

    iget v6, p1, Landroid/support/constraint/a/g;->a:I

    if-ge v5, v6, :cond_4

    move v0, v1

    :cond_4
    iget-object v5, p0, Landroid/support/constraint/a/a;->g:[I

    aget v5, v5, v1

    add-int/lit8 v1, v2, 0x1

    move v2, v1

    move v1, v5

    goto :goto_1

    :cond_5
    iget v1, p0, Landroid/support/constraint/a/a;->j:I

    add-int/lit8 v1, v1, 0x1

    iget-boolean v2, p0, Landroid/support/constraint/a/a;->k:Z

    if-eqz v2, :cond_6

    iget-object v1, p0, Landroid/support/constraint/a/a;->f:[I

    iget v2, p0, Landroid/support/constraint/a/a;->j:I

    aget v1, v1, v2

    if-ne v1, v4, :cond_a

    iget v1, p0, Landroid/support/constraint/a/a;->j:I

    :cond_6
    :goto_2
    iget-object v2, p0, Landroid/support/constraint/a/a;->f:[I

    array-length v2, v2

    if-lt v1, v2, :cond_7

    iget v2, p0, Landroid/support/constraint/a/a;->a:I

    iget-object v5, p0, Landroid/support/constraint/a/a;->f:[I

    array-length v5, v5

    if-ge v2, v5, :cond_7

    move v2, v3

    :goto_3
    iget-object v5, p0, Landroid/support/constraint/a/a;->f:[I

    array-length v5, v5

    if-ge v2, v5, :cond_7

    iget-object v5, p0, Landroid/support/constraint/a/a;->f:[I

    aget v5, v5, v2

    if-ne v5, v4, :cond_b

    move v1, v2

    :cond_7
    iget-object v2, p0, Landroid/support/constraint/a/a;->f:[I

    array-length v2, v2

    if-lt v1, v2, :cond_8

    iget-object v1, p0, Landroid/support/constraint/a/a;->f:[I

    array-length v1, v1

    iget v2, p0, Landroid/support/constraint/a/a;->d:I

    mul-int/lit8 v2, v2, 0x2

    iput v2, p0, Landroid/support/constraint/a/a;->d:I

    iput-boolean v3, p0, Landroid/support/constraint/a/a;->k:Z

    add-int/lit8 v2, v1, -0x1

    iput v2, p0, Landroid/support/constraint/a/a;->j:I

    iget-object v2, p0, Landroid/support/constraint/a/a;->h:[F

    iget v3, p0, Landroid/support/constraint/a/a;->d:I

    invoke-static {v2, v3}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v2

    iput-object v2, p0, Landroid/support/constraint/a/a;->h:[F

    iget-object v2, p0, Landroid/support/constraint/a/a;->f:[I

    iget v3, p0, Landroid/support/constraint/a/a;->d:I

    invoke-static {v2, v3}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v2

    iput-object v2, p0, Landroid/support/constraint/a/a;->f:[I

    iget-object v2, p0, Landroid/support/constraint/a/a;->g:[I

    iget v3, p0, Landroid/support/constraint/a/a;->d:I

    invoke-static {v2, v3}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v2

    iput-object v2, p0, Landroid/support/constraint/a/a;->g:[I

    :cond_8
    iget-object v2, p0, Landroid/support/constraint/a/a;->f:[I

    iget v3, p1, Landroid/support/constraint/a/g;->a:I

    aput v3, v2, v1

    iget-object v2, p0, Landroid/support/constraint/a/a;->h:[F

    aput p2, v2, v1

    if-eq v0, v4, :cond_c

    iget-object v2, p0, Landroid/support/constraint/a/a;->g:[I

    iget-object v3, p0, Landroid/support/constraint/a/a;->g:[I

    aget v3, v3, v0

    aput v3, v2, v1

    iget-object v2, p0, Landroid/support/constraint/a/a;->g:[I

    aput v1, v2, v0

    :goto_4
    iget v0, p0, Landroid/support/constraint/a/a;->a:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/constraint/a/a;->a:I

    iget-boolean v0, p0, Landroid/support/constraint/a/a;->k:Z

    if-nez v0, :cond_9

    iget v0, p0, Landroid/support/constraint/a/a;->j:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/constraint/a/a;->j:I

    :cond_9
    iget v0, p0, Landroid/support/constraint/a/a;->a:I

    iget-object v1, p0, Landroid/support/constraint/a/a;->f:[I

    array-length v1, v1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/constraint/a/a;->k:Z

    goto/16 :goto_0

    :cond_a
    iget-object v1, p0, Landroid/support/constraint/a/a;->f:[I

    array-length v1, v1

    goto/16 :goto_2

    :cond_b
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_c
    iget-object v0, p0, Landroid/support/constraint/a/a;->g:[I

    iget v2, p0, Landroid/support/constraint/a/a;->i:I

    aput v2, v0, v1

    iput v1, p0, Landroid/support/constraint/a/a;->i:I

    goto :goto_4
.end method

.method final b(I)F
    .locals 3

    iget v1, p0, Landroid/support/constraint/a/a;->i:I

    const/4 v0, 0x0

    :goto_0
    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    iget v2, p0, Landroid/support/constraint/a/a;->a:I

    if-ge v0, v2, :cond_1

    if-ne v0, p1, :cond_0

    iget-object v0, p0, Landroid/support/constraint/a/a;->h:[F

    aget v0, v0, v1

    :goto_1
    return v0

    :cond_0
    iget-object v2, p0, Landroid/support/constraint/a/a;->g:[I

    aget v1, v2, v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method b()V
    .locals 5

    iget v1, p0, Landroid/support/constraint/a/a;->i:I

    const/4 v0, 0x0

    :goto_0
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    iget v2, p0, Landroid/support/constraint/a/a;->a:I

    if-ge v0, v2, :cond_0

    iget-object v2, p0, Landroid/support/constraint/a/a;->h:[F

    aget v3, v2, v1

    const/high16 v4, -0x40800000    # -1.0f

    mul-float/2addr v3, v4

    aput v3, v2, v1

    iget-object v2, p0, Landroid/support/constraint/a/a;->g:[I

    aget v1, v2, v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final b(Landroid/support/constraint/a/g;F)V
    .locals 8

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v4, -0x1

    cmpl-float v0, p2, v7

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget v0, p0, Landroid/support/constraint/a/a;->i:I

    if-ne v0, v4, :cond_2

    iput v3, p0, Landroid/support/constraint/a/a;->i:I

    iget-object v0, p0, Landroid/support/constraint/a/a;->h:[F

    iget v1, p0, Landroid/support/constraint/a/a;->i:I

    aput p2, v0, v1

    iget-object v0, p0, Landroid/support/constraint/a/a;->f:[I

    iget v1, p0, Landroid/support/constraint/a/a;->i:I

    iget v2, p1, Landroid/support/constraint/a/g;->a:I

    aput v2, v0, v1

    iget-object v0, p0, Landroid/support/constraint/a/a;->g:[I

    iget v1, p0, Landroid/support/constraint/a/a;->i:I

    aput v4, v0, v1

    iget v0, p0, Landroid/support/constraint/a/a;->a:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/constraint/a/a;->a:I

    iget-boolean v0, p0, Landroid/support/constraint/a/a;->k:Z

    if-nez v0, :cond_0

    iget v0, p0, Landroid/support/constraint/a/a;->j:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/constraint/a/a;->j:I

    goto :goto_0

    :cond_2
    iget v1, p0, Landroid/support/constraint/a/a;->i:I

    move v2, v3

    move v0, v4

    :goto_1
    if-eq v1, v4, :cond_7

    iget v5, p0, Landroid/support/constraint/a/a;->a:I

    if-ge v2, v5, :cond_7

    iget-object v5, p0, Landroid/support/constraint/a/a;->f:[I

    aget v5, v5, v1

    iget v6, p1, Landroid/support/constraint/a/g;->a:I

    if-ne v5, v6, :cond_5

    iget-object v2, p0, Landroid/support/constraint/a/a;->h:[F

    aget v3, v2, v1

    add-float/2addr v3, p2

    aput v3, v2, v1

    iget-object v2, p0, Landroid/support/constraint/a/a;->h:[F

    aget v2, v2, v1

    cmpl-float v2, v2, v7

    if-nez v2, :cond_0

    iget v2, p0, Landroid/support/constraint/a/a;->i:I

    if-ne v1, v2, :cond_4

    iget-object v0, p0, Landroid/support/constraint/a/a;->g:[I

    aget v0, v0, v1

    iput v0, p0, Landroid/support/constraint/a/a;->i:I

    :goto_2
    iget-object v0, p0, Landroid/support/constraint/a/a;->c:Landroid/support/constraint/a/c;

    iget-object v0, v0, Landroid/support/constraint/a/c;->c:[Landroid/support/constraint/a/g;

    aget-object v0, v0, v5

    iget-object v2, p0, Landroid/support/constraint/a/a;->b:Landroid/support/constraint/a/b;

    invoke-virtual {v0, v2}, Landroid/support/constraint/a/g;->b(Landroid/support/constraint/a/b;)V

    iget-boolean v0, p0, Landroid/support/constraint/a/a;->k:Z

    if-eqz v0, :cond_3

    iput v1, p0, Landroid/support/constraint/a/a;->j:I

    :cond_3
    iget v0, p0, Landroid/support/constraint/a/a;->a:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/support/constraint/a/a;->a:I

    goto :goto_0

    :cond_4
    iget-object v2, p0, Landroid/support/constraint/a/a;->g:[I

    iget-object v3, p0, Landroid/support/constraint/a/a;->g:[I

    aget v3, v3, v1

    aput v3, v2, v0

    goto :goto_2

    :cond_5
    iget-object v5, p0, Landroid/support/constraint/a/a;->f:[I

    aget v5, v5, v1

    iget v6, p1, Landroid/support/constraint/a/g;->a:I

    if-ge v5, v6, :cond_6

    move v0, v1

    :cond_6
    iget-object v5, p0, Landroid/support/constraint/a/a;->g:[I

    aget v5, v5, v1

    add-int/lit8 v1, v2, 0x1

    move v2, v1

    move v1, v5

    goto :goto_1

    :cond_7
    iget v1, p0, Landroid/support/constraint/a/a;->j:I

    add-int/lit8 v1, v1, 0x1

    iget-boolean v2, p0, Landroid/support/constraint/a/a;->k:Z

    if-eqz v2, :cond_8

    iget-object v1, p0, Landroid/support/constraint/a/a;->f:[I

    iget v2, p0, Landroid/support/constraint/a/a;->j:I

    aget v1, v1, v2

    if-ne v1, v4, :cond_c

    iget v1, p0, Landroid/support/constraint/a/a;->j:I

    :cond_8
    :goto_3
    iget-object v2, p0, Landroid/support/constraint/a/a;->f:[I

    array-length v2, v2

    if-lt v1, v2, :cond_9

    iget v2, p0, Landroid/support/constraint/a/a;->a:I

    iget-object v5, p0, Landroid/support/constraint/a/a;->f:[I

    array-length v5, v5

    if-ge v2, v5, :cond_9

    move v2, v3

    :goto_4
    iget-object v5, p0, Landroid/support/constraint/a/a;->f:[I

    array-length v5, v5

    if-ge v2, v5, :cond_9

    iget-object v5, p0, Landroid/support/constraint/a/a;->f:[I

    aget v5, v5, v2

    if-ne v5, v4, :cond_d

    move v1, v2

    :cond_9
    iget-object v2, p0, Landroid/support/constraint/a/a;->f:[I

    array-length v2, v2

    if-lt v1, v2, :cond_a

    iget-object v1, p0, Landroid/support/constraint/a/a;->f:[I

    array-length v1, v1

    iget v2, p0, Landroid/support/constraint/a/a;->d:I

    mul-int/lit8 v2, v2, 0x2

    iput v2, p0, Landroid/support/constraint/a/a;->d:I

    iput-boolean v3, p0, Landroid/support/constraint/a/a;->k:Z

    add-int/lit8 v2, v1, -0x1

    iput v2, p0, Landroid/support/constraint/a/a;->j:I

    iget-object v2, p0, Landroid/support/constraint/a/a;->h:[F

    iget v3, p0, Landroid/support/constraint/a/a;->d:I

    invoke-static {v2, v3}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v2

    iput-object v2, p0, Landroid/support/constraint/a/a;->h:[F

    iget-object v2, p0, Landroid/support/constraint/a/a;->f:[I

    iget v3, p0, Landroid/support/constraint/a/a;->d:I

    invoke-static {v2, v3}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v2

    iput-object v2, p0, Landroid/support/constraint/a/a;->f:[I

    iget-object v2, p0, Landroid/support/constraint/a/a;->g:[I

    iget v3, p0, Landroid/support/constraint/a/a;->d:I

    invoke-static {v2, v3}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v2

    iput-object v2, p0, Landroid/support/constraint/a/a;->g:[I

    :cond_a
    iget-object v2, p0, Landroid/support/constraint/a/a;->f:[I

    iget v3, p1, Landroid/support/constraint/a/g;->a:I

    aput v3, v2, v1

    iget-object v2, p0, Landroid/support/constraint/a/a;->h:[F

    aput p2, v2, v1

    if-eq v0, v4, :cond_e

    iget-object v2, p0, Landroid/support/constraint/a/a;->g:[I

    iget-object v3, p0, Landroid/support/constraint/a/a;->g:[I

    aget v3, v3, v0

    aput v3, v2, v1

    iget-object v2, p0, Landroid/support/constraint/a/a;->g:[I

    aput v1, v2, v0

    :goto_5
    iget v0, p0, Landroid/support/constraint/a/a;->a:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/constraint/a/a;->a:I

    iget-boolean v0, p0, Landroid/support/constraint/a/a;->k:Z

    if-nez v0, :cond_b

    iget v0, p0, Landroid/support/constraint/a/a;->j:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/constraint/a/a;->j:I

    :cond_b
    iget v0, p0, Landroid/support/constraint/a/a;->j:I

    iget-object v1, p0, Landroid/support/constraint/a/a;->f:[I

    array-length v1, v1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/constraint/a/a;->k:Z

    iget-object v0, p0, Landroid/support/constraint/a/a;->f:[I

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/support/constraint/a/a;->j:I

    goto/16 :goto_0

    :cond_c
    iget-object v1, p0, Landroid/support/constraint/a/a;->f:[I

    array-length v1, v1

    goto/16 :goto_3

    :cond_d
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_e
    iget-object v0, p0, Landroid/support/constraint/a/a;->g:[I

    iget v2, p0, Landroid/support/constraint/a/a;->i:I

    aput v2, v0, v1

    iput v1, p0, Landroid/support/constraint/a/a;->i:I

    goto :goto_5
.end method

.method final b(Landroid/support/constraint/a/g;)Z
    .locals 6

    const/4 v5, -0x1

    const/4 v0, 0x0

    iget v1, p0, Landroid/support/constraint/a/a;->i:I

    if-ne v1, v5, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    iget v1, p0, Landroid/support/constraint/a/a;->i:I

    move v2, v1

    move v1, v0

    :goto_1
    if-eq v2, v5, :cond_0

    iget v3, p0, Landroid/support/constraint/a/a;->a:I

    if-ge v1, v3, :cond_0

    iget-object v3, p0, Landroid/support/constraint/a/a;->f:[I

    aget v3, v3, v2

    iget v4, p1, Landroid/support/constraint/a/g;->a:I

    if-ne v3, v4, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    iget-object v3, p0, Landroid/support/constraint/a/a;->g:[I

    aget v2, v3, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public final c(Landroid/support/constraint/a/g;)F
    .locals 4

    iget v1, p0, Landroid/support/constraint/a/a;->i:I

    const/4 v0, 0x0

    :goto_0
    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    iget v2, p0, Landroid/support/constraint/a/a;->a:I

    if-ge v0, v2, :cond_1

    iget-object v2, p0, Landroid/support/constraint/a/a;->f:[I

    aget v2, v2, v1

    iget v3, p1, Landroid/support/constraint/a/g;->a:I

    if-ne v2, v3, :cond_0

    iget-object v0, p0, Landroid/support/constraint/a/a;->h:[F

    aget v0, v0, v1

    :goto_1
    return v0

    :cond_0
    iget-object v2, p0, Landroid/support/constraint/a/a;->g:[I

    aget v1, v2, v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method c()Landroid/support/constraint/a/g;
    .locals 10

    const/4 v2, 0x0

    const/4 v4, 0x0

    iget v1, p0, Landroid/support/constraint/a/a;->i:I

    const/4 v0, 0x0

    move v5, v0

    move v6, v1

    move-object v1, v2

    :goto_0
    const/4 v0, -0x1

    if-eq v6, v0, :cond_4

    iget v0, p0, Landroid/support/constraint/a/a;->a:I

    if-ge v5, v0, :cond_4

    iget-object v0, p0, Landroid/support/constraint/a/a;->h:[F

    aget v0, v0, v6

    const v3, 0x3a83126f    # 0.001f

    cmpg-float v7, v0, v4

    if-gez v7, :cond_0

    neg-float v3, v3

    cmpl-float v3, v0, v3

    if-lez v3, :cond_7

    iget-object v0, p0, Landroid/support/constraint/a/a;->h:[F

    aput v4, v0, v6

    move v3, v4

    :goto_1
    cmpl-float v0, v3, v4

    if-eqz v0, :cond_6

    iget-object v0, p0, Landroid/support/constraint/a/a;->c:Landroid/support/constraint/a/c;

    iget-object v0, v0, Landroid/support/constraint/a/c;->c:[Landroid/support/constraint/a/g;

    iget-object v7, p0, Landroid/support/constraint/a/a;->f:[I

    aget v7, v7, v6

    aget-object v0, v0, v7

    iget-object v7, v0, Landroid/support/constraint/a/g;->f:Landroid/support/constraint/a/g$a;

    sget-object v8, Landroid/support/constraint/a/g$a;->a:Landroid/support/constraint/a/g$a;

    if-ne v7, v8, :cond_2

    cmpg-float v3, v3, v4

    if-gez v3, :cond_1

    :goto_2
    return-object v0

    :cond_0
    cmpg-float v3, v0, v3

    if-gez v3, :cond_7

    iget-object v0, p0, Landroid/support/constraint/a/a;->h:[F

    aput v4, v0, v6

    move v3, v4

    goto :goto_1

    :cond_1
    if-nez v1, :cond_6

    move-object v1, v2

    :goto_3
    iget-object v2, p0, Landroid/support/constraint/a/a;->g:[I

    aget v3, v2, v6

    add-int/lit8 v2, v5, 0x1

    move v5, v2

    move v6, v3

    move-object v2, v1

    move-object v1, v0

    goto :goto_0

    :cond_2
    cmpg-float v3, v3, v4

    if-gez v3, :cond_6

    if-eqz v2, :cond_3

    iget v3, v0, Landroid/support/constraint/a/g;->c:I

    iget v7, v2, Landroid/support/constraint/a/g;->c:I

    if-ge v3, v7, :cond_6

    :cond_3
    move-object v9, v1

    move-object v1, v0

    move-object v0, v9

    goto :goto_3

    :cond_4
    if-eqz v1, :cond_5

    move-object v0, v1

    goto :goto_2

    :cond_5
    move-object v0, v2

    goto :goto_2

    :cond_6
    move-object v0, v1

    move-object v1, v2

    goto :goto_3

    :cond_7
    move v3, v0

    goto :goto_1
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    const-string v2, ""

    iget v1, p0, Landroid/support/constraint/a/a;->i:I

    const/4 v0, 0x0

    :goto_0
    const/4 v3, -0x1

    if-eq v1, v3, :cond_0

    iget v3, p0, Landroid/support/constraint/a/a;->a:I

    if-ge v0, v3, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " -> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/support/constraint/a/a;->h:[F

    aget v3, v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/support/constraint/a/a;->c:Landroid/support/constraint/a/c;

    iget-object v3, v3, Landroid/support/constraint/a/c;->c:[Landroid/support/constraint/a/g;

    iget-object v4, p0, Landroid/support/constraint/a/a;->f:[I

    aget v4, v4, v1

    aget-object v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroid/support/constraint/a/a;->g:[I

    aget v1, v3, v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object v2
.end method
