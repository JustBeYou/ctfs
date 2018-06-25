.class public Landroid/support/constraint/a/a/c;
.super Landroid/support/constraint/a/a/h;


# static fields
.field static ac:Z


# instance fields
.field protected aa:Landroid/support/constraint/a/e;

.field protected ab:Landroid/support/constraint/a/e;

.field ad:I

.field ae:I

.field af:I

.field ag:I

.field ah:I

.field ai:I

.field private ak:Landroid/support/constraint/a/a/g;

.field private al:I

.field private am:I

.field private an:[Landroid/support/constraint/a/a/b;

.field private ao:[Landroid/support/constraint/a/a/b;

.field private ap:[Landroid/support/constraint/a/a/b;

.field private aq:I

.field private ar:[Z

.field private as:[Landroid/support/constraint/a/a/b;

.field private at:Z

.field private au:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x1

    sput-boolean v0, Landroid/support/constraint/a/a/c;->ac:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    const/4 v2, 0x4

    const/4 v1, 0x0

    invoke-direct {p0}, Landroid/support/constraint/a/a/h;-><init>()V

    new-instance v0, Landroid/support/constraint/a/e;

    invoke-direct {v0}, Landroid/support/constraint/a/e;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/a/a/c;->aa:Landroid/support/constraint/a/e;

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/constraint/a/a/c;->ab:Landroid/support/constraint/a/e;

    iput v1, p0, Landroid/support/constraint/a/a/c;->al:I

    iput v1, p0, Landroid/support/constraint/a/a/c;->am:I

    new-array v0, v2, [Landroid/support/constraint/a/a/b;

    iput-object v0, p0, Landroid/support/constraint/a/a/c;->an:[Landroid/support/constraint/a/a/b;

    new-array v0, v2, [Landroid/support/constraint/a/a/b;

    iput-object v0, p0, Landroid/support/constraint/a/a/c;->ao:[Landroid/support/constraint/a/a/b;

    new-array v0, v2, [Landroid/support/constraint/a/a/b;

    iput-object v0, p0, Landroid/support/constraint/a/a/c;->ap:[Landroid/support/constraint/a/a/b;

    const/4 v0, 0x2

    iput v0, p0, Landroid/support/constraint/a/a/c;->aq:I

    const/4 v0, 0x3

    new-array v0, v0, [Z

    iput-object v0, p0, Landroid/support/constraint/a/a/c;->ar:[Z

    new-array v0, v2, [Landroid/support/constraint/a/a/b;

    iput-object v0, p0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    iput-boolean v1, p0, Landroid/support/constraint/a/a/c;->at:Z

    iput-boolean v1, p0, Landroid/support/constraint/a/a/c;->au:Z

    return-void
.end method

.method private J()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/constraint/a/a/c;->al:I

    iput v0, p0, Landroid/support/constraint/a/a/c;->am:I

    return-void
.end method

.method private a(Landroid/support/constraint/a/e;[Landroid/support/constraint/a/a/b;Landroid/support/constraint/a/a/b;I[Z)I
    .locals 10

    const/4 v3, 0x0

    const/4 v0, 0x0

    const/4 v1, 0x1

    aput-boolean v1, p5, v0

    const/4 v0, 0x1

    const/4 v1, 0x0

    aput-boolean v1, p5, v0

    const/4 v0, 0x0

    const/4 v1, 0x0

    aput-object v1, p2, v0

    const/4 v0, 0x2

    const/4 v1, 0x0

    aput-object v1, p2, v0

    const/4 v0, 0x1

    const/4 v1, 0x0

    aput-object v1, p2, v0

    const/4 v0, 0x3

    const/4 v1, 0x0

    aput-object v1, p2, v0

    if-nez p4, :cond_b

    const/4 v0, 0x1

    const/4 v2, 0x0

    iget-object v1, p3, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v1, v1, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v1, :cond_1c

    iget-object v1, p3, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v1, v1, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v1, v1, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-eq v1, p0, :cond_1c

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/4 v0, 0x0

    iput-object v0, p3, Landroid/support/constraint/a/a/b;->Y:Landroid/support/constraint/a/a/b;

    const/4 v0, 0x0

    invoke-virtual {p3}, Landroid/support/constraint/a/a/b;->d()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_0

    move-object v0, p3

    :cond_0
    move-object v4, v2

    move v5, v3

    move-object v6, p3

    move-object v2, v0

    :goto_1
    iget-object v3, v6, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v3, v3, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v3, :cond_1b

    const/4 v3, 0x0

    iput-object v3, v6, Landroid/support/constraint/a/a/b;->Y:Landroid/support/constraint/a/a/b;

    invoke-virtual {v6}, Landroid/support/constraint/a/a/b;->d()I

    move-result v3

    const/16 v7, 0x8

    if-eq v3, v7, :cond_9

    if-nez v2, :cond_1a

    move-object v3, v6

    :goto_2
    if-eqz v0, :cond_1

    if-eq v0, v6, :cond_1

    iput-object v6, v0, Landroid/support/constraint/a/a/b;->Y:Landroid/support/constraint/a/a/b;

    :cond_1
    move-object v2, v6

    :goto_3
    invoke-virtual {v6}, Landroid/support/constraint/a/a/b;->d()I

    move-result v0

    const/16 v7, 0x8

    if-eq v0, v7, :cond_4

    iget-object v0, v6, Landroid/support/constraint/a/a/b;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v7, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-ne v0, v7, :cond_4

    iget-object v0, v6, Landroid/support/constraint/a/a/b;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v7, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-ne v0, v7, :cond_2

    const/4 v0, 0x0

    const/4 v7, 0x0

    aput-boolean v7, p5, v0

    :cond_2
    iget v0, v6, Landroid/support/constraint/a/a/b;->u:F

    const/4 v7, 0x0

    cmpg-float v0, v0, v7

    if-gtz v0, :cond_4

    const/4 v0, 0x0

    const/4 v7, 0x0

    aput-boolean v7, p5, v0

    add-int/lit8 v0, v5, 0x1

    iget-object v7, p0, Landroid/support/constraint/a/a/c;->an:[Landroid/support/constraint/a/a/b;

    array-length v7, v7

    if-lt v0, v7, :cond_3

    iget-object v0, p0, Landroid/support/constraint/a/a/c;->an:[Landroid/support/constraint/a/a/b;

    iget-object v7, p0, Landroid/support/constraint/a/a/c;->an:[Landroid/support/constraint/a/a/b;

    array-length v7, v7

    mul-int/lit8 v7, v7, 0x2

    invoke-static {v0, v7}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/support/constraint/a/a/b;

    iput-object v0, p0, Landroid/support/constraint/a/a/c;->an:[Landroid/support/constraint/a/a/b;

    :cond_3
    iget-object v7, p0, Landroid/support/constraint/a/a/c;->an:[Landroid/support/constraint/a/a/b;

    add-int/lit8 v0, v5, 0x1

    aput-object v6, v7, v5

    move v5, v0

    :cond_4
    iget-object v0, v6, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v0, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-nez v0, :cond_a

    :cond_5
    :goto_4
    iget-object v0, v6, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v0, :cond_6

    iget-object v0, v6, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-eq v0, p0, :cond_6

    const/4 v1, 0x0

    :cond_6
    iget-object v0, p3, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v0, :cond_7

    iget-object v0, v4, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-nez v0, :cond_8

    :cond_7
    const/4 v0, 0x1

    const/4 v6, 0x1

    aput-boolean v6, p5, v0

    :cond_8
    iput-boolean v1, p3, Landroid/support/constraint/a/a/b;->U:Z

    const/4 v0, 0x0

    iput-object v0, v4, Landroid/support/constraint/a/a/b;->Y:Landroid/support/constraint/a/a/b;

    const/4 v0, 0x0

    aput-object p3, p2, v0

    const/4 v0, 0x2

    aput-object v3, p2, v0

    const/4 v0, 0x1

    aput-object v4, p2, v0

    const/4 v0, 0x3

    aput-object v2, p2, v0

    :goto_5
    return v5

    :cond_9
    iget-object v3, v6, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v3, v3, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v7, v6, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v8, 0x0

    const/4 v9, 0x5

    invoke-virtual {p1, v3, v7, v8, v9}, Landroid/support/constraint/a/e;->c(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)Landroid/support/constraint/a/b;

    iget-object v3, v6, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v3, v3, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v7, v6, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v8, 0x0

    const/4 v9, 0x5

    invoke-virtual {p1, v3, v7, v8, v9}, Landroid/support/constraint/a/e;->c(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)Landroid/support/constraint/a/b;

    move-object v3, v2

    move-object v2, v0

    goto/16 :goto_3

    :cond_a
    iget-object v0, v6, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v0, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-ne v0, v6, :cond_5

    iget-object v0, v6, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-eq v0, v6, :cond_5

    iget-object v0, v6, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    move-object v4, v0

    move-object v6, v0

    move-object v0, v2

    move-object v2, v3

    goto/16 :goto_1

    :cond_b
    const/4 v0, 0x1

    const/4 v2, 0x0

    iget-object v1, p3, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v1, v1, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v1, :cond_19

    iget-object v1, p3, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v1, v1, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v1, v1, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-eq v1, p0, :cond_19

    const/4 v0, 0x0

    move v1, v0

    :goto_6
    const/4 v0, 0x0

    iput-object v0, p3, Landroid/support/constraint/a/a/b;->Z:Landroid/support/constraint/a/a/b;

    const/4 v0, 0x0

    invoke-virtual {p3}, Landroid/support/constraint/a/a/b;->d()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_c

    move-object v0, p3

    :cond_c
    move-object v4, v2

    move v5, v3

    move-object v6, p3

    move-object v2, v0

    :goto_7
    iget-object v3, v6, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v3, v3, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v3, :cond_18

    const/4 v3, 0x0

    iput-object v3, v6, Landroid/support/constraint/a/a/b;->Z:Landroid/support/constraint/a/a/b;

    invoke-virtual {v6}, Landroid/support/constraint/a/a/b;->d()I

    move-result v3

    const/16 v7, 0x8

    if-eq v3, v7, :cond_15

    if-nez v2, :cond_17

    move-object v3, v6

    :goto_8
    if-eqz v0, :cond_d

    if-eq v0, v6, :cond_d

    iput-object v6, v0, Landroid/support/constraint/a/a/b;->Z:Landroid/support/constraint/a/a/b;

    :cond_d
    move-object v2, v6

    :goto_9
    invoke-virtual {v6}, Landroid/support/constraint/a/a/b;->d()I

    move-result v0

    const/16 v7, 0x8

    if-eq v0, v7, :cond_10

    iget-object v0, v6, Landroid/support/constraint/a/a/b;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v7, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-ne v0, v7, :cond_10

    iget-object v0, v6, Landroid/support/constraint/a/a/b;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v7, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-ne v0, v7, :cond_e

    const/4 v0, 0x0

    const/4 v7, 0x0

    aput-boolean v7, p5, v0

    :cond_e
    iget v0, v6, Landroid/support/constraint/a/a/b;->u:F

    const/4 v7, 0x0

    cmpg-float v0, v0, v7

    if-gtz v0, :cond_10

    const/4 v0, 0x0

    const/4 v7, 0x0

    aput-boolean v7, p5, v0

    add-int/lit8 v0, v5, 0x1

    iget-object v7, p0, Landroid/support/constraint/a/a/c;->an:[Landroid/support/constraint/a/a/b;

    array-length v7, v7

    if-lt v0, v7, :cond_f

    iget-object v0, p0, Landroid/support/constraint/a/a/c;->an:[Landroid/support/constraint/a/a/b;

    iget-object v7, p0, Landroid/support/constraint/a/a/c;->an:[Landroid/support/constraint/a/a/b;

    array-length v7, v7

    mul-int/lit8 v7, v7, 0x2

    invoke-static {v0, v7}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/support/constraint/a/a/b;

    iput-object v0, p0, Landroid/support/constraint/a/a/c;->an:[Landroid/support/constraint/a/a/b;

    :cond_f
    iget-object v7, p0, Landroid/support/constraint/a/a/c;->an:[Landroid/support/constraint/a/a/b;

    add-int/lit8 v0, v5, 0x1

    aput-object v6, v7, v5

    move v5, v0

    :cond_10
    iget-object v0, v6, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v0, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-nez v0, :cond_16

    :cond_11
    :goto_a
    iget-object v0, v6, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v0, :cond_12

    iget-object v0, v6, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-eq v0, p0, :cond_12

    const/4 v1, 0x0

    :cond_12
    iget-object v0, p3, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v0, :cond_13

    iget-object v0, v4, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-nez v0, :cond_14

    :cond_13
    const/4 v0, 0x1

    const/4 v6, 0x1

    aput-boolean v6, p5, v0

    :cond_14
    iput-boolean v1, p3, Landroid/support/constraint/a/a/b;->V:Z

    const/4 v0, 0x0

    iput-object v0, v4, Landroid/support/constraint/a/a/b;->Z:Landroid/support/constraint/a/a/b;

    const/4 v0, 0x0

    aput-object p3, p2, v0

    const/4 v0, 0x2

    aput-object v3, p2, v0

    const/4 v0, 0x1

    aput-object v4, p2, v0

    const/4 v0, 0x3

    aput-object v2, p2, v0

    goto/16 :goto_5

    :cond_15
    iget-object v3, v6, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v3, v3, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v7, v6, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v8, 0x0

    const/4 v9, 0x5

    invoke-virtual {p1, v3, v7, v8, v9}, Landroid/support/constraint/a/e;->c(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)Landroid/support/constraint/a/b;

    iget-object v3, v6, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v3, v3, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v7, v6, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v8, 0x0

    const/4 v9, 0x5

    invoke-virtual {p1, v3, v7, v8, v9}, Landroid/support/constraint/a/e;->c(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)Landroid/support/constraint/a/b;

    move-object v3, v2

    move-object v2, v0

    goto/16 :goto_9

    :cond_16
    iget-object v0, v6, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v0, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-ne v0, v6, :cond_11

    iget-object v0, v6, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-eq v0, v6, :cond_11

    iget-object v0, v6, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    move-object v4, v0

    move-object v6, v0

    move-object v0, v2

    move-object v2, v3

    goto/16 :goto_7

    :cond_17
    move-object v3, v2

    goto/16 :goto_8

    :cond_18
    move-object v3, v2

    move-object v2, v0

    goto :goto_a

    :cond_19
    move v1, v0

    goto/16 :goto_6

    :cond_1a
    move-object v3, v2

    goto/16 :goto_2

    :cond_1b
    move-object v3, v2

    move-object v2, v0

    goto/16 :goto_4

    :cond_1c
    move v1, v0

    goto/16 :goto_0
.end method

.method private a(Landroid/support/constraint/a/e;)Z
    .locals 14

    const/4 v13, -0x1

    const/4 v3, 0x1

    const/4 v5, 0x0

    iget-object v0, p0, Landroid/support/constraint/a/a/c;->aj:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v10

    move v1, v5

    :goto_0
    if-ge v1, v10, :cond_12

    iget-object v0, p0, Landroid/support/constraint/a/a/c;->aj:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a/a/b;

    iput v13, v0, Landroid/support/constraint/a/a/b;->a:I

    iput v13, v0, Landroid/support/constraint/a/a/b;->b:I

    iget-object v2, v0, Landroid/support/constraint/a/a/b;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v4, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-eq v2, v4, :cond_0

    iget-object v2, v0, Landroid/support/constraint/a/a/b;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v4, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-ne v2, v4, :cond_1

    :cond_0
    iput v3, v0, Landroid/support/constraint/a/a/b;->a:I

    iput v3, v0, Landroid/support/constraint/a/a/b;->b:I

    :cond_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_2
    if-nez v1, :cond_8

    if-nez v2, :cond_8

    move v0, v3

    :goto_1
    move v8, v2

    move v9, v1

    move v4, v0

    move v0, v7

    :goto_2
    if-nez v4, :cond_9

    add-int/lit8 v7, v0, 0x1

    move v6, v5

    move v2, v5

    move v1, v5

    :goto_3
    if-ge v6, v10, :cond_2

    iget-object v0, p0, Landroid/support/constraint/a/a/c;->aj:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a/a/b;

    iget v11, v0, Landroid/support/constraint/a/a/b;->a:I

    if-ne v11, v13, :cond_3

    iget-object v11, p0, Landroid/support/constraint/a/a/c;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v12, Landroid/support/constraint/a/a/b$a;->b:Landroid/support/constraint/a/a/b$a;

    if-ne v11, v12, :cond_6

    iput v3, v0, Landroid/support/constraint/a/a/b;->a:I

    :cond_3
    :goto_4
    iget v11, v0, Landroid/support/constraint/a/a/b;->b:I

    if-ne v11, v13, :cond_4

    iget-object v11, p0, Landroid/support/constraint/a/a/c;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v12, Landroid/support/constraint/a/a/b$a;->b:Landroid/support/constraint/a/a/b$a;

    if-ne v11, v12, :cond_7

    iput v3, v0, Landroid/support/constraint/a/a/b;->b:I

    :cond_4
    :goto_5
    iget v11, v0, Landroid/support/constraint/a/a/b;->b:I

    if-ne v11, v13, :cond_5

    add-int/lit8 v1, v1, 0x1

    :cond_5
    iget v0, v0, Landroid/support/constraint/a/a/b;->a:I

    if-ne v0, v13, :cond_11

    add-int/lit8 v0, v2, 0x1

    :goto_6
    add-int/lit8 v2, v6, 0x1

    move v6, v2

    move v2, v0

    goto :goto_3

    :cond_6
    invoke-static {p0, p1, v0}, Landroid/support/constraint/a/a/e;->b(Landroid/support/constraint/a/a/c;Landroid/support/constraint/a/e;Landroid/support/constraint/a/a/b;)V

    goto :goto_4

    :cond_7
    invoke-static {p0, p1, v0}, Landroid/support/constraint/a/a/e;->c(Landroid/support/constraint/a/a/c;Landroid/support/constraint/a/e;Landroid/support/constraint/a/a/b;)V

    goto :goto_5

    :cond_8
    if-ne v9, v1, :cond_10

    if-ne v8, v2, :cond_10

    move v0, v3

    goto :goto_1

    :cond_9
    move v4, v5

    move v2, v5

    move v1, v5

    :goto_7
    if-ge v4, v10, :cond_d

    iget-object v0, p0, Landroid/support/constraint/a/a/c;->aj:Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a/a/b;

    iget v6, v0, Landroid/support/constraint/a/a/b;->a:I

    if-eq v6, v3, :cond_a

    iget v6, v0, Landroid/support/constraint/a/a/b;->a:I

    if-ne v6, v13, :cond_b

    :cond_a
    add-int/lit8 v1, v1, 0x1

    :cond_b
    iget v6, v0, Landroid/support/constraint/a/a/b;->b:I

    if-eq v6, v3, :cond_c

    iget v0, v0, Landroid/support/constraint/a/a/b;->b:I

    if-ne v0, v13, :cond_f

    :cond_c
    add-int/lit8 v0, v2, 0x1

    :goto_8
    add-int/lit8 v2, v4, 0x1

    move v4, v2

    move v2, v0

    goto :goto_7

    :cond_d
    if-nez v1, :cond_e

    if-nez v2, :cond_e

    :goto_9
    return v3

    :cond_e
    move v3, v5

    goto :goto_9

    :cond_f
    move v0, v2

    goto :goto_8

    :cond_10
    move v0, v4

    goto :goto_1

    :cond_11
    move v0, v2

    goto :goto_6

    :cond_12
    move v0, v5

    move v8, v5

    move v9, v5

    move v4, v5

    goto :goto_2
.end method

.method private b(Landroid/support/constraint/a/e;)V
    .locals 22

    const/4 v4, 0x0

    move/from16 v16, v4

    :goto_0
    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/constraint/a/a/c;->al:I

    move/from16 v0, v16

    if-ge v0, v4, :cond_31

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->ap:[Landroid/support/constraint/a/a/b;

    aget-object v21, v4, v16

    move-object/from16 v0, p0

    iget-object v6, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->ap:[Landroid/support/constraint/a/a/b;

    aget-object v7, v4, v16

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget-object v9, v0, Landroid/support/constraint/a/a/c;->ar:[Z

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    invoke-direct/range {v4 .. v9}, Landroid/support/constraint/a/a/c;->a(Landroid/support/constraint/a/e;[Landroid/support/constraint/a/a/b;Landroid/support/constraint/a/a/b;I[Z)I

    move-result v18

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    const/4 v5, 0x2

    aget-object v15, v4, v5

    if-nez v15, :cond_1

    :cond_0
    :goto_1
    add-int/lit8 v4, v16, 0x1

    move/from16 v16, v4

    goto :goto_0

    :cond_1
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->ar:[Z

    const/4 v5, 0x1

    aget-boolean v4, v4, v5

    if-eqz v4, :cond_2

    invoke-virtual/range {v21 .. v21}, Landroid/support/constraint/a/a/b;->n()I

    move-result v4

    :goto_2
    if-eqz v15, :cond_0

    iget-object v5, v15, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v4}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;I)V

    iget-object v5, v15, Landroid/support/constraint/a/a/b;->Y:Landroid/support/constraint/a/a/b;

    iget-object v6, v15, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    invoke-virtual {v6}, Landroid/support/constraint/a/a/a;->d()I

    move-result v6

    invoke-virtual {v15}, Landroid/support/constraint/a/a/b;->h()I

    move-result v7

    add-int/2addr v6, v7

    iget-object v7, v15, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    invoke-virtual {v7}, Landroid/support/constraint/a/a/a;->d()I

    move-result v7

    add-int/2addr v6, v7

    add-int/2addr v4, v6

    move-object v15, v5

    goto :goto_2

    :cond_2
    move-object/from16 v0, v21

    iget v4, v0, Landroid/support/constraint/a/a/b;->S:I

    if-nez v4, :cond_4

    const/4 v4, 0x1

    move v13, v4

    :goto_3
    move-object/from16 v0, v21

    iget v4, v0, Landroid/support/constraint/a/a/b;->S:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_5

    const/4 v4, 0x1

    move v14, v4

    :goto_4
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v5, Landroid/support/constraint/a/a/b$a;->b:Landroid/support/constraint/a/a/b$a;

    if-ne v4, v5, :cond_6

    const/4 v4, 0x1

    :goto_5
    move-object/from16 v0, p0

    iget v5, v0, Landroid/support/constraint/a/a/c;->aq:I

    const/4 v6, 0x2

    if-eq v5, v6, :cond_3

    move-object/from16 v0, p0

    iget v5, v0, Landroid/support/constraint/a/a/c;->aq:I

    const/16 v6, 0x8

    if-ne v5, v6, :cond_7

    :cond_3
    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/constraint/a/a/c;->ar:[Z

    const/4 v6, 0x0

    aget-boolean v5, v5, v6

    if-eqz v5, :cond_7

    move-object/from16 v0, v21

    iget-boolean v5, v0, Landroid/support/constraint/a/a/b;->U:Z

    if-eqz v5, :cond_7

    if-nez v14, :cond_7

    if-nez v4, :cond_7

    move-object/from16 v0, v21

    iget v4, v0, Landroid/support/constraint/a/a/b;->S:I

    if-nez v4, :cond_7

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v18

    move-object/from16 v3, v21

    invoke-static {v0, v1, v2, v3}, Landroid/support/constraint/a/a/e;->a(Landroid/support/constraint/a/a/c;Landroid/support/constraint/a/e;ILandroid/support/constraint/a/a/b;)V

    goto/16 :goto_1

    :cond_4
    const/4 v4, 0x0

    move v13, v4

    goto :goto_3

    :cond_5
    const/4 v4, 0x0

    move v14, v4

    goto :goto_4

    :cond_6
    const/4 v4, 0x0

    goto :goto_5

    :cond_7
    if-eqz v18, :cond_8

    if-eqz v14, :cond_1c

    :cond_8
    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v4, 0x0

    move-object v9, v5

    move-object/from16 v20, v15

    :goto_6
    if-eqz v20, :cond_19

    move-object/from16 v0, v20

    iget-object v5, v0, Landroid/support/constraint/a/a/b;->Y:Landroid/support/constraint/a/a/b;

    if-nez v5, :cond_35

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    const/4 v6, 0x1

    aget-object v6, v4, v6

    const/4 v4, 0x1

    move/from16 v18, v4

    move-object/from16 v19, v6

    :goto_7
    if-eqz v14, :cond_d

    move-object/from16 v0, v20

    iget-object v7, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    invoke-virtual {v7}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    if-eqz v9, :cond_34

    iget-object v6, v9, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    invoke-virtual {v6}, Landroid/support/constraint/a/a/a;->d()I

    move-result v6

    add-int/2addr v4, v6

    move v6, v4

    :goto_8
    const/4 v4, 0x1

    move-object/from16 v0, v20

    if-eq v15, v0, :cond_9

    const/4 v4, 0x3

    :cond_9
    iget-object v8, v7, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v9, v7, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v9, v9, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v9, v6, v4}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    move-object/from16 v0, v20

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v6, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-ne v4, v6, :cond_a

    move-object/from16 v0, v20

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    move-object/from16 v0, v20

    iget v6, v0, Landroid/support/constraint/a/a/b;->c:I

    const/4 v8, 0x1

    if-ne v6, v8, :cond_c

    move-object/from16 v0, v20

    iget v6, v0, Landroid/support/constraint/a/a/b;->e:I

    invoke-virtual/range {v20 .. v20}, Landroid/support/constraint/a/a/b;->h()I

    move-result v8

    invoke-static {v6, v8}, Ljava/lang/Math;->max(II)I

    move-result v6

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v8, 0x3

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v7, v6, v8}, Landroid/support/constraint/a/e;->c(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)Landroid/support/constraint/a/b;

    :cond_a
    :goto_9
    move-object v4, v5

    :goto_a
    if-eqz v18, :cond_b

    const/4 v4, 0x0

    :cond_b
    move-object/from16 v8, v19

    move-object/from16 v9, v20

    move-object/from16 v20, v4

    move/from16 v4, v18

    goto :goto_6

    :cond_c
    iget-object v6, v7, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v8, v7, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget v9, v7, Landroid/support/constraint/a/a/a;->d:I

    const/4 v10, 0x3

    move-object/from16 v0, p1

    invoke-virtual {v0, v6, v8, v9, v10}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v6, v7, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, v20

    iget v7, v0, Landroid/support/constraint/a/a/b;->e:I

    const/4 v8, 0x3

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v6, v7, v8}, Landroid/support/constraint/a/e;->b(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    goto :goto_9

    :cond_d
    if-nez v13, :cond_f

    if-eqz v18, :cond_f

    if-eqz v9, :cond_f

    move-object/from16 v0, v20

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-nez v4, :cond_e

    move-object/from16 v0, v20

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    invoke-virtual/range {v20 .. v20}, Landroid/support/constraint/a/a/b;->q()I

    move-result v6

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v6}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;I)V

    move-object v4, v5

    goto :goto_a

    :cond_e
    move-object/from16 v0, v20

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    move-object/from16 v0, v20

    iget-object v6, v0, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, v19

    iget-object v7, v0, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    neg-int v4, v4

    const/4 v8, 0x5

    move-object/from16 v0, p1

    invoke-virtual {v0, v6, v7, v4, v8}, Landroid/support/constraint/a/e;->c(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)Landroid/support/constraint/a/b;

    move-object v4, v5

    goto :goto_a

    :cond_f
    if-nez v13, :cond_11

    if-nez v18, :cond_11

    if-nez v9, :cond_11

    move-object/from16 v0, v20

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-nez v4, :cond_10

    move-object/from16 v0, v20

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    invoke-virtual/range {v20 .. v20}, Landroid/support/constraint/a/a/b;->n()I

    move-result v6

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v6}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;I)V

    move-object v4, v5

    goto/16 :goto_a

    :cond_10
    move-object/from16 v0, v20

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    move-object/from16 v0, v20

    iget-object v6, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, v21

    iget-object v7, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v8, 0x5

    move-object/from16 v0, p1

    invoke-virtual {v0, v6, v7, v4, v8}, Landroid/support/constraint/a/e;->c(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)Landroid/support/constraint/a/b;

    move-object v4, v5

    goto/16 :goto_a

    :cond_11
    move-object/from16 v0, v20

    iget-object v8, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    move-object/from16 v0, v20

    iget-object v10, v0, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    invoke-virtual {v8}, Landroid/support/constraint/a/a/a;->d()I

    move-result v7

    invoke-virtual {v10}, Landroid/support/constraint/a/a/a;->d()I

    move-result v11

    iget-object v4, v8, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v6, v8, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v12, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v6, v7, v12}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    iget-object v4, v10, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v6, v10, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    neg-int v12, v11

    const/16 v17, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v4, v6, v12, v1}, Landroid/support/constraint/a/e;->b(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    iget-object v4, v8, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v4, :cond_15

    iget-object v4, v8, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v6, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    :goto_b
    if-nez v9, :cond_12

    move-object/from16 v0, v21

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v4, :cond_16

    move-object/from16 v0, v21

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    :goto_c
    move-object v6, v4

    :cond_12
    if-nez v5, :cond_33

    move-object/from16 v0, v19

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v4, :cond_17

    move-object/from16 v0, v19

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    :goto_d
    move-object/from16 v17, v4

    :goto_e
    if-eqz v17, :cond_14

    move-object/from16 v0, v17

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v9, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    if-eqz v18, :cond_13

    move-object/from16 v0, v19

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v4, :cond_18

    move-object/from16 v0, v19

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    :goto_f
    move-object v9, v4

    :cond_13
    if-eqz v6, :cond_14

    if-eqz v9, :cond_14

    iget-object v5, v8, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/high16 v8, 0x3f000000    # 0.5f

    iget-object v10, v10, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v12, 0x4

    move-object/from16 v4, p1

    invoke-virtual/range {v4 .. v12}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;IFLandroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    :cond_14
    move-object/from16 v4, v17

    goto/16 :goto_a

    :cond_15
    const/4 v6, 0x0

    goto :goto_b

    :cond_16
    const/4 v4, 0x0

    goto :goto_c

    :cond_17
    const/4 v4, 0x0

    goto :goto_d

    :cond_18
    const/4 v4, 0x0

    goto :goto_f

    :cond_19
    if-eqz v14, :cond_0

    iget-object v4, v15, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v10, v8, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v7

    invoke-virtual {v10}, Landroid/support/constraint/a/a/a;->d()I

    move-result v11

    move-object/from16 v0, v21

    iget-object v5, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_1a

    move-object/from16 v0, v21

    iget-object v5, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v6, v5, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    :goto_10
    iget-object v5, v8, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_1b

    iget-object v5, v8, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v9, v5, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    :goto_11
    if-eqz v6, :cond_0

    if-eqz v9, :cond_0

    iget-object v5, v10, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    neg-int v8, v11

    const/4 v12, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v9, v8, v12}, Landroid/support/constraint/a/e;->b(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    iget-object v5, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, v21

    iget v8, v0, Landroid/support/constraint/a/a/b;->E:F

    iget-object v10, v10, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v12, 0x4

    move-object/from16 v4, p1

    invoke-virtual/range {v4 .. v12}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;IFLandroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    goto/16 :goto_1

    :cond_1a
    const/4 v6, 0x0

    goto :goto_10

    :cond_1b
    const/4 v9, 0x0

    goto :goto_11

    :cond_1c
    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object v5, v4

    move-object v7, v15

    :goto_12
    if-eqz v7, :cond_23

    iget-object v4, v7, Landroid/support/constraint/a/a/b;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v8, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-eq v4, v8, :cond_21

    iget-object v4, v7, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    if-eqz v5, :cond_1d

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    add-int/2addr v4, v5

    :cond_1d
    const/4 v5, 0x3

    iget-object v8, v7, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v8, v8, Landroid/support/constraint/a/a/b;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v9, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-ne v8, v9, :cond_1e

    const/4 v5, 0x2

    :cond_1e
    iget-object v8, v7, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v9, v7, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v9, v9, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v9, v9, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v9, v4, v5}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    iget-object v4, v7, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    iget-object v5, v7, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_1f

    iget-object v5, v7, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-ne v5, v7, :cond_1f

    iget-object v5, v7, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    add-int/2addr v4, v5

    :cond_1f
    const/4 v5, 0x3

    iget-object v8, v7, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v8, v8, Landroid/support/constraint/a/a/b;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v9, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-ne v8, v9, :cond_20

    const/4 v5, 0x2

    :cond_20
    iget-object v8, v7, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v9, v7, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v9, v9, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v9, v9, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    neg-int v4, v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v9, v4, v5}, Landroid/support/constraint/a/e;->b(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    :goto_13
    iget-object v4, v7, Landroid/support/constraint/a/a/b;->Y:Landroid/support/constraint/a/a/b;

    move-object v5, v7

    move-object v7, v4

    goto/16 :goto_12

    :cond_21
    iget v4, v7, Landroid/support/constraint/a/a/b;->W:F

    add-float/2addr v6, v4

    const/4 v4, 0x0

    iget-object v5, v7, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_22

    iget-object v4, v7, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    const/4 v8, 0x3

    aget-object v5, v5, v8

    if-eq v7, v5, :cond_22

    iget-object v5, v7, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    add-int/2addr v4, v5

    :cond_22
    iget-object v5, v7, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v8, v7, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v9, 0x0

    const/4 v10, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v8, v9, v10}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    iget-object v5, v7, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v8, v7, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    neg-int v4, v4

    const/4 v9, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v8, v4, v9}, Landroid/support/constraint/a/e;->b(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    goto :goto_13

    :cond_23
    const/4 v4, 0x1

    move/from16 v0, v18

    if-ne v0, v4, :cond_28

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->an:[Landroid/support/constraint/a/a/b;

    const/4 v5, 0x0

    aget-object v7, v4, v5

    iget-object v4, v7, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    iget-object v5, v7, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_24

    iget-object v5, v7, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    add-int/2addr v4, v5

    :cond_24
    iget-object v5, v7, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    iget-object v6, v7, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v6, :cond_25

    iget-object v6, v7, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    invoke-virtual {v6}, Landroid/support/constraint/a/a/a;->d()I

    move-result v6

    add-int/2addr v5, v6

    :cond_25
    move-object/from16 v0, v21

    iget-object v6, v0, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, p0

    iget-object v8, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    const/4 v9, 0x3

    aget-object v8, v8, v9

    if-ne v7, v8, :cond_26

    move-object/from16 v0, p0

    iget-object v6, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    const/4 v8, 0x1

    aget-object v6, v6, v8

    iget-object v6, v6, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    :cond_26
    iget v8, v7, Landroid/support/constraint/a/a/b;->c:I

    const/4 v9, 0x1

    if-ne v8, v9, :cond_27

    move-object/from16 v0, v21

    iget-object v7, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, v21

    iget-object v8, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v9, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v7, v8, v4, v9}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    move-object/from16 v0, v21

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    neg-int v5, v5

    const/4 v7, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v6, v5, v7}, Landroid/support/constraint/a/e;->b(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    move-object/from16 v0, v21

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, v21

    iget-object v5, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    invoke-virtual/range {v21 .. v21}, Landroid/support/constraint/a/a/b;->h()I

    move-result v6

    const/4 v7, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v5, v6, v7}, Landroid/support/constraint/a/e;->c(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)Landroid/support/constraint/a/b;

    goto/16 :goto_1

    :cond_27
    iget-object v8, v7, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v9, v7, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v9, v9, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v9, v9, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v10, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v9, v4, v10}, Landroid/support/constraint/a/e;->c(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)Landroid/support/constraint/a/b;

    iget-object v4, v7, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    neg-int v5, v5

    const/4 v7, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v6, v5, v7}, Landroid/support/constraint/a/e;->c(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)Landroid/support/constraint/a/b;

    goto/16 :goto_1

    :cond_28
    const/4 v4, 0x0

    move/from16 v17, v4

    :goto_14
    add-int/lit8 v4, v18, -0x1

    move/from16 v0, v17

    if-ge v0, v4, :cond_0

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->an:[Landroid/support/constraint/a/a/b;

    aget-object v11, v4, v17

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->an:[Landroid/support/constraint/a/a/b;

    add-int/lit8 v5, v17, 0x1

    aget-object v15, v4, v5

    iget-object v4, v11, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v8, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v4, v11, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v10, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v4, v15, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v12, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v4, v15, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v14, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    const/4 v5, 0x3

    aget-object v4, v4, v5

    if-ne v15, v4, :cond_29

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    const/4 v5, 0x1

    aget-object v4, v4, v5

    iget-object v4, v4, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v14, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    :cond_29
    iget-object v4, v11, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    iget-object v5, v11, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_2a

    iget-object v5, v11, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_2a

    iget-object v5, v11, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-ne v5, v11, :cond_2a

    iget-object v5, v11, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    add-int/2addr v4, v5

    :cond_2a
    iget-object v5, v11, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v7, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v5, v4, v7}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    iget-object v4, v11, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    iget-object v4, v11, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v4, :cond_32

    iget-object v4, v11, Landroid/support/constraint/a/a/b;->Y:Landroid/support/constraint/a/a/b;

    if-eqz v4, :cond_32

    iget-object v4, v11, Landroid/support/constraint/a/a/b;->Y:Landroid/support/constraint/a/a/b;

    iget-object v4, v4, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v4, :cond_30

    iget-object v4, v11, Landroid/support/constraint/a/a/b;->Y:Landroid/support/constraint/a/a/b;

    iget-object v4, v4, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    :goto_15
    add-int/2addr v4, v5

    :goto_16
    iget-object v5, v11, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    neg-int v4, v4

    const/4 v7, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v10, v5, v4, v7}, Landroid/support/constraint/a/e;->b(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    add-int/lit8 v4, v17, 0x1

    add-int/lit8 v5, v18, -0x1

    if-ne v4, v5, :cond_2e

    iget-object v4, v15, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    iget-object v5, v15, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_2b

    iget-object v5, v15, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_2b

    iget-object v5, v15, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-ne v5, v15, :cond_2b

    iget-object v5, v15, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    add-int/2addr v4, v5

    :cond_2b
    iget-object v5, v15, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v7, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v12, v5, v4, v7}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    iget-object v4, v15, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    const/4 v7, 0x3

    aget-object v5, v5, v7

    if-ne v15, v5, :cond_2c

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    const/4 v5, 0x1

    aget-object v4, v4, v5

    iget-object v4, v4, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    :cond_2c
    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    iget-object v7, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v7, :cond_2d

    iget-object v7, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v7, v7, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v7, :cond_2d

    iget-object v7, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v7, v7, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-ne v7, v15, :cond_2d

    iget-object v7, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v7, v7, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    invoke-virtual {v7}, Landroid/support/constraint/a/a/a;->d()I

    move-result v7

    add-int/2addr v5, v7

    :cond_2d
    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    neg-int v5, v5

    const/4 v7, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v4, v5, v7}, Landroid/support/constraint/a/e;->b(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    :cond_2e
    move-object/from16 v0, v21

    iget v4, v0, Landroid/support/constraint/a/a/b;->f:I

    if-lez v4, :cond_2f

    move-object/from16 v0, v21

    iget v4, v0, Landroid/support/constraint/a/a/b;->f:I

    const/4 v5, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v10, v8, v4, v5}, Landroid/support/constraint/a/e;->b(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    :cond_2f
    invoke-virtual/range {p1 .. p1}, Landroid/support/constraint/a/e;->b()Landroid/support/constraint/a/b;

    move-result-object v4

    iget v5, v11, Landroid/support/constraint/a/a/b;->W:F

    iget v7, v15, Landroid/support/constraint/a/a/b;->W:F

    iget-object v9, v11, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    invoke-virtual {v9}, Landroid/support/constraint/a/a/a;->d()I

    move-result v9

    iget-object v11, v11, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    invoke-virtual {v11}, Landroid/support/constraint/a/a/a;->d()I

    move-result v11

    iget-object v13, v15, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    invoke-virtual {v13}, Landroid/support/constraint/a/a/a;->d()I

    move-result v13

    iget-object v15, v15, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    invoke-virtual {v15}, Landroid/support/constraint/a/a/a;->d()I

    move-result v15

    invoke-virtual/range {v4 .. v15}, Landroid/support/constraint/a/b;->a(FFFLandroid/support/constraint/a/g;ILandroid/support/constraint/a/g;ILandroid/support/constraint/a/g;ILandroid/support/constraint/a/g;I)Landroid/support/constraint/a/b;

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/b;)V

    add-int/lit8 v4, v17, 0x1

    move/from16 v17, v4

    goto/16 :goto_14

    :cond_30
    const/4 v4, 0x0

    goto/16 :goto_15

    :cond_31
    return-void

    :cond_32
    move v4, v5

    goto/16 :goto_16

    :cond_33
    move-object/from16 v17, v5

    goto/16 :goto_e

    :cond_34
    move v6, v4

    goto/16 :goto_8

    :cond_35
    move/from16 v18, v4

    move-object/from16 v19, v8

    goto/16 :goto_7
.end method

.method private c(Landroid/support/constraint/a/e;)V
    .locals 22

    const/4 v4, 0x0

    move/from16 v16, v4

    :goto_0
    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/constraint/a/a/c;->am:I

    move/from16 v0, v16

    if-ge v0, v4, :cond_35

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->ao:[Landroid/support/constraint/a/a/b;

    aget-object v21, v4, v16

    move-object/from16 v0, p0

    iget-object v6, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->ao:[Landroid/support/constraint/a/a/b;

    aget-object v7, v4, v16

    const/4 v8, 0x1

    move-object/from16 v0, p0

    iget-object v9, v0, Landroid/support/constraint/a/a/c;->ar:[Z

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    invoke-direct/range {v4 .. v9}, Landroid/support/constraint/a/a/c;->a(Landroid/support/constraint/a/e;[Landroid/support/constraint/a/a/b;Landroid/support/constraint/a/a/b;I[Z)I

    move-result v18

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    const/4 v5, 0x2

    aget-object v15, v4, v5

    if-nez v15, :cond_1

    :cond_0
    :goto_1
    add-int/lit8 v4, v16, 0x1

    move/from16 v16, v4

    goto :goto_0

    :cond_1
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->ar:[Z

    const/4 v5, 0x1

    aget-boolean v4, v4, v5

    if-eqz v4, :cond_2

    invoke-virtual/range {v21 .. v21}, Landroid/support/constraint/a/a/b;->o()I

    move-result v4

    :goto_2
    if-eqz v15, :cond_0

    iget-object v5, v15, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v4}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;I)V

    iget-object v5, v15, Landroid/support/constraint/a/a/b;->Z:Landroid/support/constraint/a/a/b;

    iget-object v6, v15, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    invoke-virtual {v6}, Landroid/support/constraint/a/a/a;->d()I

    move-result v6

    invoke-virtual {v15}, Landroid/support/constraint/a/a/b;->l()I

    move-result v7

    add-int/2addr v6, v7

    iget-object v7, v15, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    invoke-virtual {v7}, Landroid/support/constraint/a/a/a;->d()I

    move-result v7

    add-int/2addr v6, v7

    add-int/2addr v4, v6

    move-object v15, v5

    goto :goto_2

    :cond_2
    move-object/from16 v0, v21

    iget v4, v0, Landroid/support/constraint/a/a/b;->T:I

    if-nez v4, :cond_4

    const/4 v4, 0x1

    move v13, v4

    :goto_3
    move-object/from16 v0, v21

    iget v4, v0, Landroid/support/constraint/a/a/b;->T:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_5

    const/4 v4, 0x1

    move v14, v4

    :goto_4
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v5, Landroid/support/constraint/a/a/b$a;->b:Landroid/support/constraint/a/a/b$a;

    if-ne v4, v5, :cond_6

    const/4 v4, 0x1

    :goto_5
    move-object/from16 v0, p0

    iget v5, v0, Landroid/support/constraint/a/a/c;->aq:I

    const/4 v6, 0x2

    if-eq v5, v6, :cond_3

    move-object/from16 v0, p0

    iget v5, v0, Landroid/support/constraint/a/a/c;->aq:I

    const/16 v6, 0x8

    if-ne v5, v6, :cond_7

    :cond_3
    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/constraint/a/a/c;->ar:[Z

    const/4 v6, 0x0

    aget-boolean v5, v5, v6

    if-eqz v5, :cond_7

    move-object/from16 v0, v21

    iget-boolean v5, v0, Landroid/support/constraint/a/a/b;->V:Z

    if-eqz v5, :cond_7

    if-nez v14, :cond_7

    if-nez v4, :cond_7

    move-object/from16 v0, v21

    iget v4, v0, Landroid/support/constraint/a/a/b;->T:I

    if-nez v4, :cond_7

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v18

    move-object/from16 v3, v21

    invoke-static {v0, v1, v2, v3}, Landroid/support/constraint/a/a/e;->b(Landroid/support/constraint/a/a/c;Landroid/support/constraint/a/e;ILandroid/support/constraint/a/a/b;)V

    goto/16 :goto_1

    :cond_4
    const/4 v4, 0x0

    move v13, v4

    goto :goto_3

    :cond_5
    const/4 v4, 0x0

    move v14, v4

    goto :goto_4

    :cond_6
    const/4 v4, 0x0

    goto :goto_5

    :cond_7
    if-eqz v18, :cond_8

    if-eqz v14, :cond_20

    :cond_8
    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v4, 0x0

    move-object v9, v5

    move-object/from16 v20, v15

    :goto_6
    if-eqz v20, :cond_1d

    move-object/from16 v0, v20

    iget-object v5, v0, Landroid/support/constraint/a/a/b;->Z:Landroid/support/constraint/a/a/b;

    if-nez v5, :cond_38

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    const/4 v6, 0x1

    aget-object v6, v4, v6

    const/4 v4, 0x1

    move/from16 v18, v4

    move-object/from16 v19, v6

    :goto_7
    if-eqz v14, :cond_11

    move-object/from16 v0, v20

    iget-object v10, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    invoke-virtual {v10}, Landroid/support/constraint/a/a/a;->d()I

    move-result v8

    if-eqz v9, :cond_9

    iget-object v4, v9, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    add-int/2addr v8, v4

    :cond_9
    const/4 v4, 0x1

    move-object/from16 v0, v20

    if-eq v15, v0, :cond_a

    const/4 v4, 0x3

    :cond_a
    const/4 v7, 0x0

    const/4 v6, 0x0

    iget-object v9, v10, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v9, :cond_f

    iget-object v7, v10, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v6, v10, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    :cond_b
    :goto_8
    if-eqz v7, :cond_c

    if-eqz v6, :cond_c

    move-object/from16 v0, p1

    invoke-virtual {v0, v7, v6, v8, v4}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    :cond_c
    move-object/from16 v0, v20

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v6, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-ne v4, v6, :cond_d

    move-object/from16 v0, v20

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    move-object/from16 v0, v20

    iget v6, v0, Landroid/support/constraint/a/a/b;->d:I

    const/4 v7, 0x1

    if-ne v6, v7, :cond_10

    move-object/from16 v0, v20

    iget v6, v0, Landroid/support/constraint/a/a/b;->g:I

    invoke-virtual/range {v20 .. v20}, Landroid/support/constraint/a/a/b;->l()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v6

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v7, v10, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v8, 0x3

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v7, v6, v8}, Landroid/support/constraint/a/e;->c(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)Landroid/support/constraint/a/b;

    :cond_d
    :goto_9
    move-object v4, v5

    :goto_a
    if-eqz v18, :cond_e

    const/4 v4, 0x0

    :cond_e
    move-object/from16 v8, v19

    move-object/from16 v9, v20

    move-object/from16 v20, v4

    move/from16 v4, v18

    goto :goto_6

    :cond_f
    move-object/from16 v0, v20

    iget-object v9, v0, Landroid/support/constraint/a/a/b;->m:Landroid/support/constraint/a/a/a;

    iget-object v9, v9, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v9, :cond_b

    move-object/from16 v0, v20

    iget-object v6, v0, Landroid/support/constraint/a/a/b;->m:Landroid/support/constraint/a/a/a;

    iget-object v7, v6, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, v20

    iget-object v6, v0, Landroid/support/constraint/a/a/b;->m:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    invoke-virtual {v10}, Landroid/support/constraint/a/a/a;->d()I

    move-result v9

    sub-int/2addr v8, v9

    goto :goto_8

    :cond_10
    iget-object v6, v10, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v7, v10, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget v8, v10, Landroid/support/constraint/a/a/a;->d:I

    const/4 v9, 0x3

    move-object/from16 v0, p1

    invoke-virtual {v0, v6, v7, v8, v9}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v6, v10, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, v20

    iget v7, v0, Landroid/support/constraint/a/a/b;->g:I

    const/4 v8, 0x3

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v6, v7, v8}, Landroid/support/constraint/a/e;->b(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    goto :goto_9

    :cond_11
    if-nez v13, :cond_13

    if-eqz v18, :cond_13

    if-eqz v9, :cond_13

    move-object/from16 v0, v20

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-nez v4, :cond_12

    move-object/from16 v0, v20

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    invoke-virtual/range {v20 .. v20}, Landroid/support/constraint/a/a/b;->p()I

    move-result v6

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v6}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;I)V

    move-object v4, v5

    goto :goto_a

    :cond_12
    move-object/from16 v0, v20

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    move-object/from16 v0, v20

    iget-object v6, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, v19

    iget-object v7, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    neg-int v4, v4

    const/4 v8, 0x5

    move-object/from16 v0, p1

    invoke-virtual {v0, v6, v7, v4, v8}, Landroid/support/constraint/a/e;->c(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)Landroid/support/constraint/a/b;

    move-object v4, v5

    goto/16 :goto_a

    :cond_13
    if-nez v13, :cond_15

    if-nez v18, :cond_15

    if-nez v9, :cond_15

    move-object/from16 v0, v20

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-nez v4, :cond_14

    move-object/from16 v0, v20

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    invoke-virtual/range {v20 .. v20}, Landroid/support/constraint/a/a/b;->o()I

    move-result v6

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v6}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;I)V

    move-object v4, v5

    goto/16 :goto_a

    :cond_14
    move-object/from16 v0, v20

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    move-object/from16 v0, v20

    iget-object v6, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, v21

    iget-object v7, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v8, 0x5

    move-object/from16 v0, p1

    invoke-virtual {v0, v6, v7, v4, v8}, Landroid/support/constraint/a/e;->c(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)Landroid/support/constraint/a/b;

    move-object v4, v5

    goto/16 :goto_a

    :cond_15
    move-object/from16 v0, v20

    iget-object v8, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    move-object/from16 v0, v20

    iget-object v10, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    invoke-virtual {v8}, Landroid/support/constraint/a/a/a;->d()I

    move-result v7

    invoke-virtual {v10}, Landroid/support/constraint/a/a/a;->d()I

    move-result v11

    iget-object v4, v8, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v6, v8, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v12, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v6, v7, v12}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    iget-object v4, v10, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v6, v10, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    neg-int v12, v11

    const/16 v17, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v4, v6, v12, v1}, Landroid/support/constraint/a/e;->b(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    iget-object v4, v8, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v4, :cond_19

    iget-object v4, v8, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v6, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    :goto_b
    if-nez v9, :cond_16

    move-object/from16 v0, v21

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v4, :cond_1a

    move-object/from16 v0, v21

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    :goto_c
    move-object v6, v4

    :cond_16
    if-nez v5, :cond_37

    move-object/from16 v0, v19

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v4, :cond_1b

    move-object/from16 v0, v19

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    :goto_d
    move-object/from16 v17, v4

    :goto_e
    if-eqz v17, :cond_18

    move-object/from16 v0, v17

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v9, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    if-eqz v18, :cond_17

    move-object/from16 v0, v19

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v4, :cond_1c

    move-object/from16 v0, v19

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    :goto_f
    move-object v9, v4

    :cond_17
    if-eqz v6, :cond_18

    if-eqz v9, :cond_18

    iget-object v5, v8, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/high16 v8, 0x3f000000    # 0.5f

    iget-object v10, v10, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v12, 0x4

    move-object/from16 v4, p1

    invoke-virtual/range {v4 .. v12}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;IFLandroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    :cond_18
    move-object/from16 v4, v17

    goto/16 :goto_a

    :cond_19
    const/4 v6, 0x0

    goto :goto_b

    :cond_1a
    const/4 v4, 0x0

    goto :goto_c

    :cond_1b
    const/4 v4, 0x0

    goto :goto_d

    :cond_1c
    const/4 v4, 0x0

    goto :goto_f

    :cond_1d
    if-eqz v14, :cond_0

    iget-object v4, v15, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v10, v8, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v7

    invoke-virtual {v10}, Landroid/support/constraint/a/a/a;->d()I

    move-result v11

    move-object/from16 v0, v21

    iget-object v5, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_1e

    move-object/from16 v0, v21

    iget-object v5, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v6, v5, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    :goto_10
    iget-object v5, v8, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_1f

    iget-object v5, v8, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v9, v5, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    :goto_11
    if-eqz v6, :cond_0

    if-eqz v9, :cond_0

    iget-object v5, v10, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    neg-int v8, v11

    const/4 v12, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v9, v8, v12}, Landroid/support/constraint/a/e;->b(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    iget-object v5, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, v21

    iget v8, v0, Landroid/support/constraint/a/a/b;->F:F

    iget-object v10, v10, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v12, 0x4

    move-object/from16 v4, p1

    invoke-virtual/range {v4 .. v12}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;IFLandroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    goto/16 :goto_1

    :cond_1e
    const/4 v6, 0x0

    goto :goto_10

    :cond_1f
    const/4 v9, 0x0

    goto :goto_11

    :cond_20
    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object v5, v4

    move-object v7, v15

    :goto_12
    if-eqz v7, :cond_27

    iget-object v4, v7, Landroid/support/constraint/a/a/b;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v8, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-eq v4, v8, :cond_25

    iget-object v4, v7, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    if-eqz v5, :cond_21

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    add-int/2addr v4, v5

    :cond_21
    const/4 v5, 0x3

    iget-object v8, v7, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v8, v8, Landroid/support/constraint/a/a/b;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v9, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-ne v8, v9, :cond_22

    const/4 v5, 0x2

    :cond_22
    iget-object v8, v7, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v9, v7, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v9, v9, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v9, v9, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v9, v4, v5}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    iget-object v4, v7, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    iget-object v5, v7, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_23

    iget-object v5, v7, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-ne v5, v7, :cond_23

    iget-object v5, v7, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    add-int/2addr v4, v5

    :cond_23
    const/4 v5, 0x3

    iget-object v8, v7, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v8, v8, Landroid/support/constraint/a/a/b;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v9, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-ne v8, v9, :cond_24

    const/4 v5, 0x2

    :cond_24
    iget-object v8, v7, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v9, v7, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v9, v9, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v9, v9, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    neg-int v4, v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v9, v4, v5}, Landroid/support/constraint/a/e;->b(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    :goto_13
    iget-object v4, v7, Landroid/support/constraint/a/a/b;->Z:Landroid/support/constraint/a/a/b;

    move-object v5, v7

    move-object v7, v4

    goto/16 :goto_12

    :cond_25
    iget v4, v7, Landroid/support/constraint/a/a/b;->X:F

    add-float/2addr v6, v4

    const/4 v4, 0x0

    iget-object v5, v7, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_26

    iget-object v4, v7, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    const/4 v8, 0x3

    aget-object v5, v5, v8

    if-eq v7, v5, :cond_26

    iget-object v5, v7, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    add-int/2addr v4, v5

    :cond_26
    iget-object v5, v7, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v8, v7, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v9, 0x0

    const/4 v10, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v8, v9, v10}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    iget-object v5, v7, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v8, v7, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    neg-int v4, v4

    const/4 v9, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v8, v4, v9}, Landroid/support/constraint/a/e;->b(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    goto :goto_13

    :cond_27
    const/4 v4, 0x1

    move/from16 v0, v18

    if-ne v0, v4, :cond_2c

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->an:[Landroid/support/constraint/a/a/b;

    const/4 v5, 0x0

    aget-object v7, v4, v5

    iget-object v4, v7, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    iget-object v5, v7, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_28

    iget-object v5, v7, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    add-int/2addr v4, v5

    :cond_28
    iget-object v5, v7, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    iget-object v6, v7, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v6, :cond_29

    iget-object v6, v7, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    invoke-virtual {v6}, Landroid/support/constraint/a/a/a;->d()I

    move-result v6

    add-int/2addr v5, v6

    :cond_29
    move-object/from16 v0, v21

    iget-object v6, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, p0

    iget-object v8, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    const/4 v9, 0x3

    aget-object v8, v8, v9

    if-ne v7, v8, :cond_2a

    move-object/from16 v0, p0

    iget-object v6, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    const/4 v8, 0x1

    aget-object v6, v6, v8

    iget-object v6, v6, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v6, v6, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    :cond_2a
    iget v8, v7, Landroid/support/constraint/a/a/b;->d:I

    const/4 v9, 0x1

    if-ne v8, v9, :cond_2b

    move-object/from16 v0, v21

    iget-object v7, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, v21

    iget-object v8, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v9, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v7, v8, v4, v9}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    move-object/from16 v0, v21

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    neg-int v5, v5

    const/4 v7, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v6, v5, v7}, Landroid/support/constraint/a/e;->b(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    move-object/from16 v0, v21

    iget-object v4, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, v21

    iget-object v5, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    invoke-virtual/range {v21 .. v21}, Landroid/support/constraint/a/a/b;->l()I

    move-result v6

    const/4 v7, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v5, v6, v7}, Landroid/support/constraint/a/e;->c(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)Landroid/support/constraint/a/b;

    goto/16 :goto_1

    :cond_2b
    iget-object v8, v7, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v8, v8, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v9, v7, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v9, v9, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v9, v9, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v10, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v9, v4, v10}, Landroid/support/constraint/a/e;->c(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)Landroid/support/constraint/a/b;

    iget-object v4, v7, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    neg-int v5, v5

    const/4 v7, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v6, v5, v7}, Landroid/support/constraint/a/e;->c(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)Landroid/support/constraint/a/b;

    goto/16 :goto_1

    :cond_2c
    const/4 v4, 0x0

    move/from16 v17, v4

    :goto_14
    add-int/lit8 v4, v18, -0x1

    move/from16 v0, v17

    if-ge v0, v4, :cond_0

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->an:[Landroid/support/constraint/a/a/b;

    aget-object v11, v4, v17

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->an:[Landroid/support/constraint/a/a/b;

    add-int/lit8 v5, v17, 0x1

    aget-object v15, v4, v5

    iget-object v4, v11, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v8, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v4, v11, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v10, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v4, v15, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v12, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    iget-object v4, v15, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v14, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    const/4 v5, 0x3

    aget-object v4, v4, v5

    if-ne v15, v4, :cond_2d

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    const/4 v5, 0x1

    aget-object v4, v4, v5

    iget-object v4, v4, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v14, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    :cond_2d
    iget-object v4, v11, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    iget-object v5, v11, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_2e

    iget-object v5, v11, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_2e

    iget-object v5, v11, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-ne v5, v11, :cond_2e

    iget-object v5, v11, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    add-int/2addr v4, v5

    :cond_2e
    iget-object v5, v11, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v7, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v5, v4, v7}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    iget-object v4, v11, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    iget-object v4, v11, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v4, :cond_36

    iget-object v4, v11, Landroid/support/constraint/a/a/b;->Z:Landroid/support/constraint/a/a/b;

    if-eqz v4, :cond_36

    iget-object v4, v11, Landroid/support/constraint/a/a/b;->Z:Landroid/support/constraint/a/a/b;

    iget-object v4, v4, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v4, :cond_34

    iget-object v4, v11, Landroid/support/constraint/a/a/b;->Z:Landroid/support/constraint/a/a/b;

    iget-object v4, v4, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    :goto_15
    add-int/2addr v4, v5

    :goto_16
    iget-object v5, v11, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    neg-int v4, v4

    const/4 v7, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v10, v5, v4, v7}, Landroid/support/constraint/a/e;->b(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    add-int/lit8 v4, v17, 0x1

    add-int/lit8 v5, v18, -0x1

    if-ne v4, v5, :cond_32

    iget-object v4, v15, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    iget-object v5, v15, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_2f

    iget-object v5, v15, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_2f

    iget-object v5, v15, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-ne v5, v15, :cond_2f

    iget-object v5, v15, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, v5, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    add-int/2addr v4, v5

    :cond_2f
    iget-object v5, v15, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    const/4 v7, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v12, v5, v4, v7}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    iget-object v4, v15, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    const/4 v7, 0x3

    aget-object v5, v5, v7

    if-ne v15, v5, :cond_30

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->as:[Landroid/support/constraint/a/a/b;

    const/4 v5, 0x1

    aget-object v4, v4, v5

    iget-object v4, v4, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    :cond_30
    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    iget-object v7, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v7, :cond_31

    iget-object v7, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v7, v7, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v7, :cond_31

    iget-object v7, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v7, v7, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-ne v7, v15, :cond_31

    iget-object v7, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v7, v7, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v7, v7, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    invoke-virtual {v7}, Landroid/support/constraint/a/a/a;->d()I

    move-result v7

    add-int/2addr v5, v7

    :cond_31
    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->f:Landroid/support/constraint/a/g;

    neg-int v5, v5

    const/4 v7, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v4, v5, v7}, Landroid/support/constraint/a/e;->b(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    :cond_32
    move-object/from16 v0, v21

    iget v4, v0, Landroid/support/constraint/a/a/b;->h:I

    if-lez v4, :cond_33

    move-object/from16 v0, v21

    iget v4, v0, Landroid/support/constraint/a/a/b;->h:I

    const/4 v5, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v10, v8, v4, v5}, Landroid/support/constraint/a/e;->b(Landroid/support/constraint/a/g;Landroid/support/constraint/a/g;II)V

    :cond_33
    invoke-virtual/range {p1 .. p1}, Landroid/support/constraint/a/e;->b()Landroid/support/constraint/a/b;

    move-result-object v4

    iget v5, v11, Landroid/support/constraint/a/a/b;->X:F

    iget v7, v15, Landroid/support/constraint/a/a/b;->X:F

    iget-object v9, v11, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    invoke-virtual {v9}, Landroid/support/constraint/a/a/a;->d()I

    move-result v9

    iget-object v11, v11, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    invoke-virtual {v11}, Landroid/support/constraint/a/a/a;->d()I

    move-result v11

    iget-object v13, v15, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    invoke-virtual {v13}, Landroid/support/constraint/a/a/a;->d()I

    move-result v13

    iget-object v15, v15, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    invoke-virtual {v15}, Landroid/support/constraint/a/a/a;->d()I

    move-result v15

    invoke-virtual/range {v4 .. v15}, Landroid/support/constraint/a/b;->a(FFFLandroid/support/constraint/a/g;ILandroid/support/constraint/a/g;ILandroid/support/constraint/a/g;ILandroid/support/constraint/a/g;I)Landroid/support/constraint/a/b;

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/support/constraint/a/e;->a(Landroid/support/constraint/a/b;)V

    add-int/lit8 v4, v17, 0x1

    move/from16 v17, v4

    goto/16 :goto_14

    :cond_34
    const/4 v4, 0x0

    goto/16 :goto_15

    :cond_35
    return-void

    :cond_36
    move v4, v5

    goto/16 :goto_16

    :cond_37
    move-object/from16 v17, v5

    goto/16 :goto_e

    :cond_38
    move/from16 v18, v4

    move-object/from16 v19, v8

    goto/16 :goto_7
.end method

.method private d(Landroid/support/constraint/a/a/b;)V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    iget v1, p0, Landroid/support/constraint/a/a/c;->al:I

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Landroid/support/constraint/a/a/c;->ap:[Landroid/support/constraint/a/a/b;

    aget-object v1, v1, v0

    if-ne v1, p1, :cond_0

    :goto_1
    return-void

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iget v0, p0, Landroid/support/constraint/a/a/c;->al:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Landroid/support/constraint/a/a/c;->ap:[Landroid/support/constraint/a/a/b;

    array-length v1, v1

    if-lt v0, v1, :cond_2

    iget-object v0, p0, Landroid/support/constraint/a/a/c;->ap:[Landroid/support/constraint/a/a/b;

    iget-object v1, p0, Landroid/support/constraint/a/a/c;->ap:[Landroid/support/constraint/a/a/b;

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/support/constraint/a/a/b;

    iput-object v0, p0, Landroid/support/constraint/a/a/c;->ap:[Landroid/support/constraint/a/a/b;

    :cond_2
    iget-object v0, p0, Landroid/support/constraint/a/a/c;->ap:[Landroid/support/constraint/a/a/b;

    iget v1, p0, Landroid/support/constraint/a/a/c;->al:I

    aput-object p1, v0, v1

    iget v0, p0, Landroid/support/constraint/a/a/c;->al:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/constraint/a/a/c;->al:I

    goto :goto_1
.end method

.method private e(Landroid/support/constraint/a/a/b;)V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    iget v1, p0, Landroid/support/constraint/a/a/c;->am:I

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Landroid/support/constraint/a/a/c;->ao:[Landroid/support/constraint/a/a/b;

    aget-object v1, v1, v0

    if-ne v1, p1, :cond_0

    :goto_1
    return-void

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iget v0, p0, Landroid/support/constraint/a/a/c;->am:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Landroid/support/constraint/a/a/c;->ao:[Landroid/support/constraint/a/a/b;

    array-length v1, v1

    if-lt v0, v1, :cond_2

    iget-object v0, p0, Landroid/support/constraint/a/a/c;->ao:[Landroid/support/constraint/a/a/b;

    iget-object v1, p0, Landroid/support/constraint/a/a/c;->ao:[Landroid/support/constraint/a/a/b;

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/support/constraint/a/a/b;

    iput-object v0, p0, Landroid/support/constraint/a/a/c;->ao:[Landroid/support/constraint/a/a/b;

    :cond_2
    iget-object v0, p0, Landroid/support/constraint/a/a/c;->ao:[Landroid/support/constraint/a/a/b;

    iget v1, p0, Landroid/support/constraint/a/a/c;->am:I

    aput-object p1, v0, v1

    iget v0, p0, Landroid/support/constraint/a/a/c;->am:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/constraint/a/a/c;->am:I

    goto :goto_1
.end method


# virtual methods
.method public D()Z
    .locals 1

    iget-boolean v0, p0, Landroid/support/constraint/a/a/c;->at:Z

    return v0
.end method

.method public E()Z
    .locals 1

    iget-boolean v0, p0, Landroid/support/constraint/a/a/c;->au:Z

    return v0
.end method

.method public F()V
    .locals 18

    move-object/from16 v0, p0

    iget v8, v0, Landroid/support/constraint/a/a/c;->w:I

    move-object/from16 v0, p0

    iget v9, v0, Landroid/support/constraint/a/a/c;->x:I

    const/4 v1, 0x0

    invoke-virtual/range {p0 .. p0}, Landroid/support/constraint/a/a/c;->h()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v10

    const/4 v1, 0x0

    invoke-virtual/range {p0 .. p0}, Landroid/support/constraint/a/a/c;->l()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v11

    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput-boolean v1, v0, Landroid/support/constraint/a/a/c;->at:Z

    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput-boolean v1, v0, Landroid/support/constraint/a/a/c;->au:Z

    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->r:Landroid/support/constraint/a/a/b;

    if-eqz v1, :cond_6

    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->ak:Landroid/support/constraint/a/a/g;

    if-nez v1, :cond_0

    new-instance v1, Landroid/support/constraint/a/a/g;

    move-object/from16 v0, p0

    invoke-direct {v1, v0}, Landroid/support/constraint/a/a/g;-><init>(Landroid/support/constraint/a/a/b;)V

    move-object/from16 v0, p0

    iput-object v1, v0, Landroid/support/constraint/a/a/c;->ak:Landroid/support/constraint/a/a/g;

    :cond_0
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->ak:Landroid/support/constraint/a/a/g;

    move-object/from16 v0, p0

    invoke-virtual {v1, v0}, Landroid/support/constraint/a/a/g;->a(Landroid/support/constraint/a/a/b;)V

    move-object/from16 v0, p0

    iget v1, v0, Landroid/support/constraint/a/a/c;->af:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Landroid/support/constraint/a/a/c;->b(I)V

    move-object/from16 v0, p0

    iget v1, v0, Landroid/support/constraint/a/a/c;->ag:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Landroid/support/constraint/a/a/c;->c(I)V

    invoke-virtual/range {p0 .. p0}, Landroid/support/constraint/a/a/c;->A()V

    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->aa:Landroid/support/constraint/a/e;

    invoke-virtual {v1}, Landroid/support/constraint/a/e;->f()Landroid/support/constraint/a/c;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Landroid/support/constraint/a/a/c;->a(Landroid/support/constraint/a/c;)V

    :goto_0
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iget-object v12, v0, Landroid/support/constraint/a/a/c;->H:Landroid/support/constraint/a/a/b$a;

    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/constraint/a/a/c;->G:Landroid/support/constraint/a/a/b$a;

    move-object/from16 v0, p0

    iget v2, v0, Landroid/support/constraint/a/a/c;->aq:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_9

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/constraint/a/a/c;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v3, Landroid/support/constraint/a/a/b$a;->b:Landroid/support/constraint/a/a/b$a;

    if-eq v2, v3, :cond_1

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/constraint/a/a/c;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v3, Landroid/support/constraint/a/a/b$a;->b:Landroid/support/constraint/a/a/b$a;

    if-ne v2, v3, :cond_9

    :cond_1
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->aj:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/constraint/a/a/c;->ar:[Z

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v2}, Landroid/support/constraint/a/a/c;->a(Ljava/util/ArrayList;[Z)V

    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->ar:[Z

    const/4 v2, 0x0

    aget-boolean v1, v1, v2

    if-lez v10, :cond_3

    if-lez v11, :cond_3

    move-object/from16 v0, p0

    iget v2, v0, Landroid/support/constraint/a/a/c;->ad:I

    if-gt v2, v10, :cond_2

    move-object/from16 v0, p0

    iget v2, v0, Landroid/support/constraint/a/a/c;->ae:I

    if-le v2, v11, :cond_3

    :cond_2
    const/4 v1, 0x0

    :cond_3
    if-eqz v1, :cond_9

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/constraint/a/a/c;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v3, Landroid/support/constraint/a/a/b$a;->b:Landroid/support/constraint/a/a/b$a;

    if-ne v2, v3, :cond_4

    sget-object v2, Landroid/support/constraint/a/a/b$a;->a:Landroid/support/constraint/a/a/b$a;

    move-object/from16 v0, p0

    iput-object v2, v0, Landroid/support/constraint/a/a/c;->G:Landroid/support/constraint/a/a/b$a;

    if-lez v10, :cond_7

    move-object/from16 v0, p0

    iget v2, v0, Landroid/support/constraint/a/a/c;->ad:I

    if-ge v10, v2, :cond_7

    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Landroid/support/constraint/a/a/c;->at:Z

    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Landroid/support/constraint/a/a/c;->d(I)V

    :cond_4
    :goto_1
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/constraint/a/a/c;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v3, Landroid/support/constraint/a/a/b$a;->b:Landroid/support/constraint/a/a/b$a;

    if-ne v2, v3, :cond_9

    sget-object v2, Landroid/support/constraint/a/a/b$a;->a:Landroid/support/constraint/a/a/b$a;

    move-object/from16 v0, p0

    iput-object v2, v0, Landroid/support/constraint/a/a/c;->H:Landroid/support/constraint/a/a/b$a;

    if-lez v11, :cond_8

    move-object/from16 v0, p0

    iget v2, v0, Landroid/support/constraint/a/a/c;->ae:I

    if-ge v11, v2, :cond_8

    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Landroid/support/constraint/a/a/c;->au:Z

    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Landroid/support/constraint/a/a/c;->e(I)V

    move v2, v1

    :goto_2
    invoke-direct/range {p0 .. p0}, Landroid/support/constraint/a/a/c;->J()V

    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->aj:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v14

    const/4 v1, 0x0

    move v3, v1

    :goto_3
    if-ge v3, v14, :cond_a

    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->aj:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/constraint/a/a/b;

    instance-of v4, v1, Landroid/support/constraint/a/a/h;

    if-eqz v4, :cond_5

    check-cast v1, Landroid/support/constraint/a/a/h;

    invoke-virtual {v1}, Landroid/support/constraint/a/a/h;->F()V

    :cond_5
    add-int/lit8 v1, v3, 0x1

    move v3, v1

    goto :goto_3

    :cond_6
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput v1, v0, Landroid/support/constraint/a/a/c;->w:I

    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput v1, v0, Landroid/support/constraint/a/a/c;->x:I

    goto/16 :goto_0

    :cond_7
    move-object/from16 v0, p0

    iget v2, v0, Landroid/support/constraint/a/a/c;->B:I

    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/constraint/a/a/c;->ad:I

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Landroid/support/constraint/a/a/c;->d(I)V

    goto :goto_1

    :cond_8
    move-object/from16 v0, p0

    iget v2, v0, Landroid/support/constraint/a/a/c;->C:I

    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/constraint/a/a/c;->ae:I

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Landroid/support/constraint/a/a/c;->e(I)V

    :cond_9
    move v2, v1

    goto :goto_2

    :cond_a
    const/4 v3, 0x1

    const/4 v1, 0x0

    move/from16 v17, v3

    move v3, v2

    move/from16 v2, v17

    :goto_4
    if-eqz v2, :cond_16

    add-int/lit8 v7, v1, 0x1

    :try_start_0
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->aa:Landroid/support/constraint/a/e;

    invoke-virtual {v1}, Landroid/support/constraint/a/e;->a()V

    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->aa:Landroid/support/constraint/a/e;

    const v4, 0x7fffffff

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v4}, Landroid/support/constraint/a/a/c;->c(Landroid/support/constraint/a/e;I)Z

    move-result v2

    if-eqz v2, :cond_b

    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->aa:Landroid/support/constraint/a/e;

    invoke-virtual {v1}, Landroid/support/constraint/a/e;->e()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_b
    :goto_5
    if-eqz v2, :cond_d

    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->aa:Landroid/support/constraint/a/e;

    const v2, 0x7fffffff

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->ar:[Z

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v2, v4}, Landroid/support/constraint/a/a/c;->a(Landroid/support/constraint/a/e;I[Z)V

    :cond_c
    :goto_6
    const/4 v2, 0x0

    const/16 v1, 0x8

    if-ge v7, v1, :cond_1b

    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->ar:[Z

    const/4 v4, 0x2

    aget-boolean v1, v1, v4

    if-eqz v1, :cond_1b

    const/4 v5, 0x0

    const/4 v4, 0x0

    const/4 v1, 0x0

    move v6, v5

    move v5, v4

    move v4, v1

    :goto_7
    if-ge v4, v14, :cond_10

    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->aj:Ljava/util/ArrayList;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/constraint/a/a/b;

    iget v15, v1, Landroid/support/constraint/a/a/b;->w:I

    invoke-virtual {v1}, Landroid/support/constraint/a/a/b;->h()I

    move-result v16

    add-int v15, v15, v16

    invoke-static {v6, v15}, Ljava/lang/Math;->max(II)I

    move-result v6

    iget v15, v1, Landroid/support/constraint/a/a/b;->x:I

    invoke-virtual {v1}, Landroid/support/constraint/a/a/b;->l()I

    move-result v1

    add-int/2addr v1, v15

    invoke-static {v5, v1}, Ljava/lang/Math;->max(II)I

    move-result v5

    add-int/lit8 v1, v4, 0x1

    move v4, v1

    goto :goto_7

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_5

    :cond_d
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->aa:Landroid/support/constraint/a/e;

    const v2, 0x7fffffff

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v2}, Landroid/support/constraint/a/a/c;->b(Landroid/support/constraint/a/e;I)V

    const/4 v1, 0x0

    move v2, v1

    :goto_8
    if-ge v2, v14, :cond_c

    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->aj:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/constraint/a/a/b;

    iget-object v4, v1, Landroid/support/constraint/a/a/b;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v5, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-ne v4, v5, :cond_e

    invoke-virtual {v1}, Landroid/support/constraint/a/a/b;->h()I

    move-result v4

    invoke-virtual {v1}, Landroid/support/constraint/a/a/b;->k()I

    move-result v5

    if-ge v4, v5, :cond_e

    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->ar:[Z

    const/4 v2, 0x2

    const/4 v4, 0x1

    aput-boolean v4, v1, v2

    goto :goto_6

    :cond_e
    iget-object v4, v1, Landroid/support/constraint/a/a/b;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v5, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-ne v4, v5, :cond_f

    invoke-virtual {v1}, Landroid/support/constraint/a/a/b;->l()I

    move-result v4

    invoke-virtual {v1}, Landroid/support/constraint/a/a/b;->m()I

    move-result v1

    if-ge v4, v1, :cond_f

    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->ar:[Z

    const/4 v2, 0x2

    const/4 v4, 0x1

    aput-boolean v4, v1, v2

    goto/16 :goto_6

    :cond_f
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_8

    :cond_10
    move-object/from16 v0, p0

    iget v1, v0, Landroid/support/constraint/a/a/c;->B:I

    invoke-static {v1, v6}, Ljava/lang/Math;->max(II)I

    move-result v1

    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/constraint/a/a/c;->C:I

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    sget-object v5, Landroid/support/constraint/a/a/b$a;->b:Landroid/support/constraint/a/a/b$a;

    if-ne v13, v5, :cond_1a

    invoke-virtual/range {p0 .. p0}, Landroid/support/constraint/a/a/c;->h()I

    move-result v5

    if-ge v5, v1, :cond_1a

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Landroid/support/constraint/a/a/c;->d(I)V

    sget-object v1, Landroid/support/constraint/a/a/b$a;->b:Landroid/support/constraint/a/a/b$a;

    move-object/from16 v0, p0

    iput-object v1, v0, Landroid/support/constraint/a/a/c;->G:Landroid/support/constraint/a/a/b$a;

    const/4 v2, 0x1

    const/4 v1, 0x1

    :goto_9
    sget-object v3, Landroid/support/constraint/a/a/b$a;->b:Landroid/support/constraint/a/a/b$a;

    if-ne v12, v3, :cond_11

    invoke-virtual/range {p0 .. p0}, Landroid/support/constraint/a/a/c;->l()I

    move-result v3

    if-ge v3, v4, :cond_11

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Landroid/support/constraint/a/a/c;->e(I)V

    sget-object v1, Landroid/support/constraint/a/a/b$a;->b:Landroid/support/constraint/a/a/b$a;

    move-object/from16 v0, p0

    iput-object v1, v0, Landroid/support/constraint/a/a/c;->H:Landroid/support/constraint/a/a/b$a;

    const/4 v2, 0x1

    const/4 v1, 0x1

    :cond_11
    :goto_a
    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/constraint/a/a/c;->B:I

    invoke-virtual/range {p0 .. p0}, Landroid/support/constraint/a/a/c;->h()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Landroid/support/constraint/a/a/c;->h()I

    move-result v4

    if-le v3, v4, :cond_12

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/support/constraint/a/a/c;->d(I)V

    sget-object v1, Landroid/support/constraint/a/a/b$a;->a:Landroid/support/constraint/a/a/b$a;

    move-object/from16 v0, p0

    iput-object v1, v0, Landroid/support/constraint/a/a/c;->G:Landroid/support/constraint/a/a/b$a;

    const/4 v2, 0x1

    const/4 v1, 0x1

    :cond_12
    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/constraint/a/a/c;->C:I

    invoke-virtual/range {p0 .. p0}, Landroid/support/constraint/a/a/c;->l()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Landroid/support/constraint/a/a/c;->l()I

    move-result v4

    if-le v3, v4, :cond_13

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/support/constraint/a/a/c;->e(I)V

    sget-object v1, Landroid/support/constraint/a/a/b$a;->a:Landroid/support/constraint/a/a/b$a;

    move-object/from16 v0, p0

    iput-object v1, v0, Landroid/support/constraint/a/a/c;->H:Landroid/support/constraint/a/a/b$a;

    const/4 v2, 0x1

    const/4 v1, 0x1

    :cond_13
    if-nez v2, :cond_15

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/constraint/a/a/c;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v4, Landroid/support/constraint/a/a/b$a;->b:Landroid/support/constraint/a/a/b$a;

    if-ne v3, v4, :cond_14

    if-lez v10, :cond_14

    invoke-virtual/range {p0 .. p0}, Landroid/support/constraint/a/a/c;->h()I

    move-result v3

    if-le v3, v10, :cond_14

    const/4 v1, 0x1

    move-object/from16 v0, p0

    iput-boolean v1, v0, Landroid/support/constraint/a/a/c;->at:Z

    const/4 v2, 0x1

    sget-object v1, Landroid/support/constraint/a/a/b$a;->a:Landroid/support/constraint/a/a/b$a;

    move-object/from16 v0, p0

    iput-object v1, v0, Landroid/support/constraint/a/a/c;->G:Landroid/support/constraint/a/a/b$a;

    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Landroid/support/constraint/a/a/c;->d(I)V

    const/4 v1, 0x1

    :cond_14
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/constraint/a/a/c;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v4, Landroid/support/constraint/a/a/b$a;->b:Landroid/support/constraint/a/a/b$a;

    if-ne v3, v4, :cond_15

    if-lez v11, :cond_15

    invoke-virtual/range {p0 .. p0}, Landroid/support/constraint/a/a/c;->l()I

    move-result v3

    if-le v3, v11, :cond_15

    const/4 v1, 0x1

    move-object/from16 v0, p0

    iput-boolean v1, v0, Landroid/support/constraint/a/a/c;->au:Z

    const/4 v2, 0x1

    sget-object v1, Landroid/support/constraint/a/a/b$a;->a:Landroid/support/constraint/a/a/b$a;

    move-object/from16 v0, p0

    iput-object v1, v0, Landroid/support/constraint/a/a/c;->H:Landroid/support/constraint/a/a/b$a;

    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Landroid/support/constraint/a/a/c;->e(I)V

    const/4 v1, 0x1

    :cond_15
    move v3, v2

    move v2, v1

    move v1, v7

    goto/16 :goto_4

    :cond_16
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->r:Landroid/support/constraint/a/a/b;

    if-eqz v1, :cond_19

    move-object/from16 v0, p0

    iget v1, v0, Landroid/support/constraint/a/a/c;->B:I

    invoke-virtual/range {p0 .. p0}, Landroid/support/constraint/a/a/c;->h()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    move-object/from16 v0, p0

    iget v2, v0, Landroid/support/constraint/a/a/c;->C:I

    invoke-virtual/range {p0 .. p0}, Landroid/support/constraint/a/a/c;->l()I

    move-result v4

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/constraint/a/a/c;->ak:Landroid/support/constraint/a/a/g;

    move-object/from16 v0, p0

    invoke-virtual {v4, v0}, Landroid/support/constraint/a/a/g;->b(Landroid/support/constraint/a/a/b;)V

    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/constraint/a/a/c;->af:I

    add-int/2addr v1, v4

    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/constraint/a/a/c;->ah:I

    add-int/2addr v1, v4

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Landroid/support/constraint/a/a/c;->d(I)V

    move-object/from16 v0, p0

    iget v1, v0, Landroid/support/constraint/a/a/c;->ag:I

    add-int/2addr v1, v2

    move-object/from16 v0, p0

    iget v2, v0, Landroid/support/constraint/a/a/c;->ai:I

    add-int/2addr v1, v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Landroid/support/constraint/a/a/c;->e(I)V

    :goto_b
    if-eqz v3, :cond_17

    move-object/from16 v0, p0

    iput-object v13, v0, Landroid/support/constraint/a/a/c;->G:Landroid/support/constraint/a/a/b$a;

    move-object/from16 v0, p0

    iput-object v12, v0, Landroid/support/constraint/a/a/c;->H:Landroid/support/constraint/a/a/b$a;

    :cond_17
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/constraint/a/a/c;->aa:Landroid/support/constraint/a/e;

    invoke-virtual {v1}, Landroid/support/constraint/a/e;->f()Landroid/support/constraint/a/c;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Landroid/support/constraint/a/a/c;->a(Landroid/support/constraint/a/c;)V

    invoke-virtual/range {p0 .. p0}, Landroid/support/constraint/a/a/c;->H()Landroid/support/constraint/a/a/c;

    move-result-object v1

    move-object/from16 v0, p0

    if-ne v0, v1, :cond_18

    invoke-virtual/range {p0 .. p0}, Landroid/support/constraint/a/a/c;->z()V

    :cond_18
    return-void

    :cond_19
    move-object/from16 v0, p0

    iput v8, v0, Landroid/support/constraint/a/a/c;->w:I

    move-object/from16 v0, p0

    iput v9, v0, Landroid/support/constraint/a/a/c;->x:I

    goto :goto_b

    :cond_1a
    move v1, v2

    move v2, v3

    goto/16 :goto_9

    :cond_1b
    move v1, v2

    move v2, v3

    goto/16 :goto_a
.end method

.method public G()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public a()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Landroid/support/constraint/a/a/c;->aa:Landroid/support/constraint/a/e;

    invoke-virtual {v0}, Landroid/support/constraint/a/e;->a()V

    iput v1, p0, Landroid/support/constraint/a/a/c;->af:I

    iput v1, p0, Landroid/support/constraint/a/a/c;->ah:I

    iput v1, p0, Landroid/support/constraint/a/a/c;->ag:I

    iput v1, p0, Landroid/support/constraint/a/a/c;->ai:I

    invoke-super {p0}, Landroid/support/constraint/a/a/h;->a()V

    return-void
.end method

.method a(Landroid/support/constraint/a/a/b;I)V
    .locals 2

    if-nez p2, :cond_2

    :goto_0
    iget-object v0, p1, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v0, v0, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v0, v0, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v1, p1, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    if-ne v0, v1, :cond_0

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-eq v0, p1, :cond_0

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object p1, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Landroid/support/constraint/a/a/c;->d(Landroid/support/constraint/a/a/b;)V

    :cond_1
    :goto_1
    return-void

    :cond_2
    const/4 v0, 0x1

    if-ne p2, v0, :cond_1

    :goto_2
    iget-object v0, p1, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v0, :cond_3

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v0, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v0, :cond_3

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v0, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v1, p1, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    if-ne v0, v1, :cond_3

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-eq v0, p1, :cond_3

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object p1, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    goto :goto_2

    :cond_3
    invoke-direct {p0, p1}, Landroid/support/constraint/a/a/c;->e(Landroid/support/constraint/a/a/b;)V

    goto :goto_1
.end method

.method public a(Landroid/support/constraint/a/a/b;[Z)V
    .locals 8

    const/4 v3, 0x0

    const/4 v7, -0x1

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v1, 0x0

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v2, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-ne v0, v2, :cond_0

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v2, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-ne v0, v2, :cond_0

    iget v0, p1, Landroid/support/constraint/a/a/b;->u:F

    cmpl-float v0, v0, v5

    if-lez v0, :cond_0

    aput-boolean v1, p2, v1

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/support/constraint/a/a/b;->i()I

    move-result v2

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v4, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-ne v0, v4, :cond_1

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v4, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-eq v0, v4, :cond_1

    iget v0, p1, Landroid/support/constraint/a/a/b;->u:F

    cmpl-float v0, v0, v5

    if-lez v0, :cond_1

    aput-boolean v1, p2, v1

    goto :goto_0

    :cond_1
    iput-boolean v6, p1, Landroid/support/constraint/a/a/b;->Q:Z

    instance-of v0, p1, Landroid/support/constraint/a/a/d;

    if-eqz v0, :cond_5

    move-object v0, p1

    check-cast v0, Landroid/support/constraint/a/a/d;

    invoke-virtual {v0}, Landroid/support/constraint/a/a/d;->D()I

    move-result v3

    if-ne v3, v6, :cond_18

    invoke-virtual {v0}, Landroid/support/constraint/a/a/d;->F()I

    move-result v2

    if-eq v2, v7, :cond_4

    invoke-virtual {v0}, Landroid/support/constraint/a/a/d;->F()I

    move-result v0

    :goto_1
    move v2, v0

    move v4, v1

    :cond_2
    :goto_2
    invoke-virtual {p1}, Landroid/support/constraint/a/a/b;->d()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_3

    iget v0, p1, Landroid/support/constraint/a/a/b;->s:I

    sub-int/2addr v2, v0

    iget v0, p1, Landroid/support/constraint/a/a/b;->s:I

    sub-int/2addr v4, v0

    :cond_3
    iput v2, p1, Landroid/support/constraint/a/a/b;->J:I

    iput v4, p1, Landroid/support/constraint/a/a/b;->K:I

    goto :goto_0

    :cond_4
    invoke-virtual {v0}, Landroid/support/constraint/a/a/d;->G()I

    move-result v2

    if-eq v2, v7, :cond_17

    invoke-virtual {v0}, Landroid/support/constraint/a/a/d;->G()I

    move-result v2

    move v0, v1

    move v1, v2

    goto :goto_1

    :cond_5
    iget-object v0, p1, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    invoke-virtual {v0}, Landroid/support/constraint/a/a/a;->j()Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    invoke-virtual {v0}, Landroid/support/constraint/a/a/a;->j()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {p1}, Landroid/support/constraint/a/a/b;->f()I

    move-result v0

    add-int/2addr v0, v2

    move v4, v2

    move v2, v0

    goto :goto_2

    :cond_6
    iget-object v0, p1, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v0, :cond_8

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v0, :cond_8

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v4, p1, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eq v0, v4, :cond_7

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v4, p1, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-ne v0, v4, :cond_8

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v4, p1, Landroid/support/constraint/a/a/b;->r:Landroid/support/constraint/a/a/b;

    if-eq v0, v4, :cond_8

    :cond_7
    aput-boolean v1, p2, v1

    goto/16 :goto_0

    :cond_8
    iget-object v0, p1, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v0, :cond_16

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v4, p1, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    add-int/2addr v4, v2

    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->b()Z

    move-result v5

    if-nez v5, :cond_9

    iget-boolean v5, v0, Landroid/support/constraint/a/a/b;->Q:Z

    if-nez v5, :cond_9

    invoke-virtual {p0, v0, p2}, Landroid/support/constraint/a/a/c;->a(Landroid/support/constraint/a/a/b;[Z)V

    :cond_9
    :goto_3
    iget-object v5, p1, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_a

    iget-object v3, p1, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v3, v3, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v3, v3, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v5, p1, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    add-int/2addr v2, v5

    invoke-virtual {v3}, Landroid/support/constraint/a/a/b;->b()Z

    move-result v5

    if-nez v5, :cond_a

    iget-boolean v5, v3, Landroid/support/constraint/a/a/b;->Q:Z

    if-nez v5, :cond_a

    invoke-virtual {p0, v3, p2}, Landroid/support/constraint/a/a/c;->a(Landroid/support/constraint/a/a/b;[Z)V

    :cond_a
    iget-object v5, p1, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_d

    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->b()Z

    move-result v5

    if-nez v5, :cond_d

    iget-object v5, p1, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->b:Landroid/support/constraint/a/a/a$c;

    sget-object v7, Landroid/support/constraint/a/a/a$c;->d:Landroid/support/constraint/a/a/a$c;

    if-ne v5, v7, :cond_11

    iget v5, v0, Landroid/support/constraint/a/a/b;->K:I

    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->i()I

    move-result v7

    sub-int/2addr v5, v7

    add-int/2addr v4, v5

    :cond_b
    :goto_4
    iget-boolean v5, v0, Landroid/support/constraint/a/a/b;->N:Z

    if-nez v5, :cond_c

    iget-object v5, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_12

    iget-object v5, v0, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_12

    iget-object v5, v0, Landroid/support/constraint/a/a/b;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v7, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-eq v5, v7, :cond_12

    :cond_c
    move v5, v6

    :goto_5
    iput-boolean v5, p1, Landroid/support/constraint/a/a/b;->N:Z

    iget-boolean v5, p1, Landroid/support/constraint/a/a/b;->N:Z

    if-eqz v5, :cond_d

    iget-object v5, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-nez v5, :cond_13

    :goto_6
    iget v0, v0, Landroid/support/constraint/a/a/b;->K:I

    sub-int v0, v4, v0

    add-int/2addr v4, v0

    :cond_d
    iget-object v0, p1, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v0, :cond_2

    invoke-virtual {v3}, Landroid/support/constraint/a/a/b;->b()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    invoke-virtual {v0}, Landroid/support/constraint/a/a/a;->c()Landroid/support/constraint/a/a/a$c;

    move-result-object v0

    sget-object v5, Landroid/support/constraint/a/a/a$c;->b:Landroid/support/constraint/a/a/a$c;

    if-ne v0, v5, :cond_14

    iget v0, v3, Landroid/support/constraint/a/a/b;->J:I

    invoke-virtual {v3}, Landroid/support/constraint/a/a/b;->i()I

    move-result v5

    sub-int/2addr v0, v5

    add-int/2addr v2, v0

    :cond_e
    :goto_7
    iget-boolean v0, v3, Landroid/support/constraint/a/a/b;->M:Z

    if-nez v0, :cond_f

    iget-object v0, v3, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v0, :cond_10

    iget-object v0, v3, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v0, :cond_10

    iget-object v0, v3, Landroid/support/constraint/a/a/b;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v5, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-eq v0, v5, :cond_10

    :cond_f
    move v1, v6

    :cond_10
    iput-boolean v1, p1, Landroid/support/constraint/a/a/b;->M:Z

    iget-boolean v0, p1, Landroid/support/constraint/a/a/b;->M:Z

    if-eqz v0, :cond_2

    iget-object v0, v3, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-nez v0, :cond_15

    :goto_8
    iget v0, v3, Landroid/support/constraint/a/a/b;->J:I

    sub-int v0, v2, v0

    add-int/2addr v2, v0

    goto/16 :goto_2

    :cond_11
    iget-object v5, p1, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->c()Landroid/support/constraint/a/a/a$c;

    move-result-object v5

    sget-object v7, Landroid/support/constraint/a/a/a$c;->b:Landroid/support/constraint/a/a/a$c;

    if-ne v5, v7, :cond_b

    iget v5, v0, Landroid/support/constraint/a/a/b;->K:I

    add-int/2addr v4, v5

    goto/16 :goto_4

    :cond_12
    move v5, v1

    goto :goto_5

    :cond_13
    iget-object v5, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-eq v5, p1, :cond_d

    goto :goto_6

    :cond_14
    iget-object v0, p1, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    invoke-virtual {v0}, Landroid/support/constraint/a/a/a;->c()Landroid/support/constraint/a/a/a$c;

    move-result-object v0

    sget-object v5, Landroid/support/constraint/a/a/a$c;->d:Landroid/support/constraint/a/a/a$c;

    if-ne v0, v5, :cond_e

    iget v0, v3, Landroid/support/constraint/a/a/b;->J:I

    add-int/2addr v2, v0

    goto :goto_7

    :cond_15
    iget-object v0, v3, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-eq v0, p1, :cond_2

    goto :goto_8

    :cond_16
    move-object v0, v3

    move v4, v2

    goto/16 :goto_3

    :cond_17
    move v0, v1

    goto/16 :goto_1

    :cond_18
    move v0, v2

    move v1, v2

    goto/16 :goto_1
.end method

.method public a(Landroid/support/constraint/a/e;I[Z)V
    .locals 7

    const/4 v6, 0x1

    const/4 v0, 0x0

    const/4 v5, 0x2

    aput-boolean v0, p3, v5

    invoke-virtual {p0, p1, p2}, Landroid/support/constraint/a/a/c;->b(Landroid/support/constraint/a/e;I)V

    iget-object v1, p0, Landroid/support/constraint/a/a/c;->aj:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_2

    iget-object v0, p0, Landroid/support/constraint/a/a/c;->aj:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a/a/b;

    invoke-virtual {v0, p1, p2}, Landroid/support/constraint/a/a/b;->b(Landroid/support/constraint/a/e;I)V

    iget-object v3, v0, Landroid/support/constraint/a/a/b;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v4, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-ne v3, v4, :cond_0

    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->h()I

    move-result v3

    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->k()I

    move-result v4

    if-ge v3, v4, :cond_0

    aput-boolean v6, p3, v5

    :cond_0
    iget-object v3, v0, Landroid/support/constraint/a/a/b;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v4, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-ne v3, v4, :cond_1

    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->l()I

    move-result v3

    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->m()I

    move-result v0

    if-ge v3, v0, :cond_1

    aput-boolean v6, p3, v5

    :cond_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_2
    return-void
.end method

.method public a(Ljava/util/ArrayList;[Z)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/constraint/a/a/b;",
            ">;[Z)V"
        }
    .end annotation

    const/4 v8, 0x0

    const/4 v7, 0x0

    const/4 v6, 0x0

    const/4 v5, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v10

    const/4 v0, 0x0

    const/4 v1, 0x1

    aput-boolean v1, p2, v0

    const/4 v0, 0x0

    move v9, v0

    :goto_0
    if-ge v9, v10, :cond_8

    invoke-virtual {p1, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a/a/b;

    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->b()Z

    move-result v1

    if-eqz v1, :cond_0

    move v0, v3

    move v1, v4

    move v2, v5

    move v3, v6

    move v4, v7

    move v5, v8

    :goto_1
    add-int/lit8 v6, v9, 0x1

    move v9, v6

    move v7, v4

    move v8, v5

    move v5, v2

    move v6, v3

    move v4, v1

    move v3, v0

    goto :goto_0

    :cond_0
    iget-boolean v1, v0, Landroid/support/constraint/a/a/b;->Q:Z

    if-nez v1, :cond_1

    invoke-virtual {p0, v0, p2}, Landroid/support/constraint/a/a/c;->a(Landroid/support/constraint/a/a/b;[Z)V

    :cond_1
    iget-boolean v1, v0, Landroid/support/constraint/a/a/b;->R:Z

    if-nez v1, :cond_2

    invoke-virtual {p0, v0, p2}, Landroid/support/constraint/a/a/c;->b(Landroid/support/constraint/a/a/b;[Z)V

    :cond_2
    const/4 v1, 0x0

    aget-boolean v1, p2, v1

    if-nez v1, :cond_4

    :cond_3
    return-void

    :cond_4
    iget v1, v0, Landroid/support/constraint/a/a/b;->J:I

    iget v2, v0, Landroid/support/constraint/a/a/b;->K:I

    add-int/2addr v1, v2

    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->h()I

    move-result v2

    sub-int/2addr v1, v2

    iget v2, v0, Landroid/support/constraint/a/a/b;->I:I

    iget v11, v0, Landroid/support/constraint/a/a/b;->L:I

    add-int/2addr v2, v11

    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->l()I

    move-result v11

    sub-int/2addr v2, v11

    iget-object v11, v0, Landroid/support/constraint/a/a/b;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v12, Landroid/support/constraint/a/a/b$a;->d:Landroid/support/constraint/a/a/b$a;

    if-ne v11, v12, :cond_5

    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->h()I

    move-result v1

    iget-object v11, v0, Landroid/support/constraint/a/a/b;->i:Landroid/support/constraint/a/a/a;

    iget v11, v11, Landroid/support/constraint/a/a/a;->d:I

    add-int/2addr v1, v11

    iget-object v11, v0, Landroid/support/constraint/a/a/b;->k:Landroid/support/constraint/a/a/a;

    iget v11, v11, Landroid/support/constraint/a/a/a;->d:I

    add-int/2addr v1, v11

    :cond_5
    iget-object v11, v0, Landroid/support/constraint/a/a/b;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v12, Landroid/support/constraint/a/a/b$a;->d:Landroid/support/constraint/a/a/b$a;

    if-ne v11, v12, :cond_6

    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->l()I

    move-result v2

    iget-object v11, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget v11, v11, Landroid/support/constraint/a/a/a;->d:I

    add-int/2addr v2, v11

    iget-object v11, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget v11, v11, Landroid/support/constraint/a/a/a;->d:I

    add-int/2addr v2, v11

    :cond_6
    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->d()I

    move-result v11

    const/16 v12, 0x8

    if-ne v11, v12, :cond_7

    const/4 v1, 0x0

    const/4 v2, 0x0

    :cond_7
    iget v11, v0, Landroid/support/constraint/a/a/b;->J:I

    invoke-static {v7, v11}, Ljava/lang/Math;->max(II)I

    move-result v7

    iget v11, v0, Landroid/support/constraint/a/a/b;->K:I

    invoke-static {v6, v11}, Ljava/lang/Math;->max(II)I

    move-result v6

    iget v11, v0, Landroid/support/constraint/a/a/b;->L:I

    invoke-static {v5, v11}, Ljava/lang/Math;->max(II)I

    move-result v5

    iget v0, v0, Landroid/support/constraint/a/a/b;->I:I

    invoke-static {v8, v0}, Ljava/lang/Math;->max(II)I

    move-result v8

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    move v2, v5

    move v3, v6

    move v4, v7

    move v5, v8

    goto/16 :goto_1

    :cond_8
    invoke-static {v7, v6}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget v1, p0, Landroid/support/constraint/a/a/c;->B:I

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/a/a/c;->ad:I

    invoke-static {v8, v5}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget v1, p0, Landroid/support/constraint/a/a/c;->C:I

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/a/a/c;->ae:I

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    if-ge v1, v10, :cond_3

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a/a/b;

    const/4 v2, 0x0

    iput-boolean v2, v0, Landroid/support/constraint/a/a/b;->Q:Z

    const/4 v2, 0x0

    iput-boolean v2, v0, Landroid/support/constraint/a/a/b;->R:Z

    const/4 v2, 0x0

    iput-boolean v2, v0, Landroid/support/constraint/a/a/b;->M:Z

    const/4 v2, 0x0

    iput-boolean v2, v0, Landroid/support/constraint/a/a/b;->N:Z

    const/4 v2, 0x0

    iput-boolean v2, v0, Landroid/support/constraint/a/a/b;->O:Z

    const/4 v2, 0x0

    iput-boolean v2, v0, Landroid/support/constraint/a/a/b;->P:Z

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_2
.end method

.method public b(Landroid/support/constraint/a/a/b;[Z)V
    .locals 9

    const/4 v3, 0x0

    const/16 v8, 0x8

    const/4 v4, -0x1

    const/4 v6, 0x1

    const/4 v1, 0x0

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v2, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-ne v0, v2, :cond_0

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->G:Landroid/support/constraint/a/a/b$a;

    sget-object v2, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-eq v0, v2, :cond_0

    iget v0, p1, Landroid/support/constraint/a/a/b;->u:F

    const/4 v2, 0x0

    cmpl-float v0, v0, v2

    if-lez v0, :cond_0

    aput-boolean v1, p2, v1

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/support/constraint/a/a/b;->j()I

    move-result v2

    iput-boolean v6, p1, Landroid/support/constraint/a/a/b;->R:Z

    instance-of v0, p1, Landroid/support/constraint/a/a/d;

    if-eqz v0, :cond_4

    move-object v0, p1

    check-cast v0, Landroid/support/constraint/a/a/d;

    invoke-virtual {v0}, Landroid/support/constraint/a/a/d;->D()I

    move-result v3

    if-nez v3, :cond_1a

    invoke-virtual {v0}, Landroid/support/constraint/a/a/d;->F()I

    move-result v2

    if-eq v2, v4, :cond_3

    invoke-virtual {v0}, Landroid/support/constraint/a/a/d;->F()I

    move-result v2

    move v0, v1

    move v1, v2

    :goto_1
    move v2, v0

    move v4, v1

    :cond_1
    :goto_2
    invoke-virtual {p1}, Landroid/support/constraint/a/a/b;->d()I

    move-result v0

    if-ne v0, v8, :cond_2

    iget v0, p1, Landroid/support/constraint/a/a/b;->t:I

    sub-int/2addr v4, v0

    iget v0, p1, Landroid/support/constraint/a/a/b;->t:I

    sub-int/2addr v2, v0

    :cond_2
    iput v4, p1, Landroid/support/constraint/a/a/b;->I:I

    iput v2, p1, Landroid/support/constraint/a/a/b;->L:I

    goto :goto_0

    :cond_3
    invoke-virtual {v0}, Landroid/support/constraint/a/a/d;->G()I

    move-result v2

    if-eq v2, v4, :cond_19

    invoke-virtual {v0}, Landroid/support/constraint/a/a/d;->G()I

    move-result v0

    goto :goto_1

    :cond_4
    iget-object v0, p1, Landroid/support/constraint/a/a/b;->m:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-nez v0, :cond_5

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-nez v0, :cond_5

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-nez v0, :cond_5

    invoke-virtual {p1}, Landroid/support/constraint/a/a/b;->g()I

    move-result v0

    add-int v4, v2, v0

    goto :goto_2

    :cond_5
    iget-object v0, p1, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v0, :cond_7

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v0, :cond_7

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v4, p1, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eq v0, v4, :cond_6

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v4, p1, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v4, v4, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-ne v0, v4, :cond_7

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    iget-object v4, p1, Landroid/support/constraint/a/a/b;->r:Landroid/support/constraint/a/a/b;

    if-eq v0, v4, :cond_7

    :cond_6
    aput-boolean v1, p2, v1

    goto/16 :goto_0

    :cond_7
    iget-object v0, p1, Landroid/support/constraint/a/a/b;->m:Landroid/support/constraint/a/a/a;

    invoke-virtual {v0}, Landroid/support/constraint/a/a/a;->j()Z

    move-result v0

    if-eqz v0, :cond_a

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->m:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    invoke-virtual {v0}, Landroid/support/constraint/a/a/a;->b()Landroid/support/constraint/a/a/b;

    move-result-object v0

    iget-boolean v1, v0, Landroid/support/constraint/a/a/b;->R:Z

    if-nez v1, :cond_8

    invoke-virtual {p0, v0, p2}, Landroid/support/constraint/a/a/c;->b(Landroid/support/constraint/a/a/b;[Z)V

    :cond_8
    iget v1, v0, Landroid/support/constraint/a/a/b;->I:I

    iget v3, v0, Landroid/support/constraint/a/a/b;->t:I

    sub-int/2addr v1, v3

    add-int/2addr v1, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget v3, v0, Landroid/support/constraint/a/a/b;->L:I

    iget v0, v0, Landroid/support/constraint/a/a/b;->t:I

    sub-int v0, v3, v0

    add-int/2addr v0, v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p1}, Landroid/support/constraint/a/a/b;->d()I

    move-result v2

    if-ne v2, v8, :cond_9

    iget v2, p1, Landroid/support/constraint/a/a/b;->t:I

    sub-int/2addr v1, v2

    iget v2, p1, Landroid/support/constraint/a/a/b;->t:I

    sub-int/2addr v0, v2

    :cond_9
    iput v1, p1, Landroid/support/constraint/a/a/b;->I:I

    iput v0, p1, Landroid/support/constraint/a/a/b;->L:I

    goto/16 :goto_0

    :cond_a
    iget-object v0, p1, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    invoke-virtual {v0}, Landroid/support/constraint/a/a/a;->j()Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    invoke-virtual {v0}, Landroid/support/constraint/a/a/a;->b()Landroid/support/constraint/a/a/b;

    move-result-object v0

    iget-object v4, p1, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    invoke-virtual {v4}, Landroid/support/constraint/a/a/a;->d()I

    move-result v4

    add-int/2addr v4, v2

    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->b()Z

    move-result v5

    if-nez v5, :cond_b

    iget-boolean v5, v0, Landroid/support/constraint/a/a/b;->R:Z

    if-nez v5, :cond_b

    invoke-virtual {p0, v0, p2}, Landroid/support/constraint/a/a/c;->b(Landroid/support/constraint/a/a/b;[Z)V

    :cond_b
    :goto_3
    iget-object v5, p1, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->j()Z

    move-result v5

    if-eqz v5, :cond_c

    iget-object v3, p1, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v3, v3, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    invoke-virtual {v3}, Landroid/support/constraint/a/a/a;->b()Landroid/support/constraint/a/a/b;

    move-result-object v3

    iget-object v5, p1, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->d()I

    move-result v5

    add-int/2addr v2, v5

    invoke-virtual {v3}, Landroid/support/constraint/a/a/b;->b()Z

    move-result v5

    if-nez v5, :cond_c

    iget-boolean v5, v3, Landroid/support/constraint/a/a/b;->R:Z

    if-nez v5, :cond_c

    invoke-virtual {p0, v3, p2}, Landroid/support/constraint/a/a/c;->b(Landroid/support/constraint/a/a/b;[Z)V

    :cond_c
    iget-object v5, p1, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_f

    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->b()Z

    move-result v5

    if-nez v5, :cond_f

    iget-object v5, p1, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->c()Landroid/support/constraint/a/a/a$c;

    move-result-object v5

    sget-object v7, Landroid/support/constraint/a/a/a$c;->c:Landroid/support/constraint/a/a/a$c;

    if-ne v5, v7, :cond_13

    iget v5, v0, Landroid/support/constraint/a/a/b;->I:I

    invoke-virtual {v0}, Landroid/support/constraint/a/a/b;->j()I

    move-result v7

    sub-int/2addr v5, v7

    add-int/2addr v4, v5

    :cond_d
    :goto_4
    iget-boolean v5, v0, Landroid/support/constraint/a/a/b;->O:Z

    if-nez v5, :cond_e

    iget-object v5, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_14

    iget-object v5, v0, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-eq v5, p1, :cond_14

    iget-object v5, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v5, :cond_14

    iget-object v5, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-eq v5, p1, :cond_14

    iget-object v5, v0, Landroid/support/constraint/a/a/b;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v7, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-eq v5, v7, :cond_14

    :cond_e
    move v5, v6

    :goto_5
    iput-boolean v5, p1, Landroid/support/constraint/a/a/b;->O:Z

    iget-boolean v5, p1, Landroid/support/constraint/a/a/b;->O:Z

    if-eqz v5, :cond_f

    iget-object v5, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-nez v5, :cond_15

    :goto_6
    iget v0, v0, Landroid/support/constraint/a/a/b;->I:I

    sub-int v0, v4, v0

    add-int/2addr v4, v0

    :cond_f
    iget-object v0, p1, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v0, :cond_1

    invoke-virtual {v3}, Landroid/support/constraint/a/a/b;->b()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p1, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    invoke-virtual {v0}, Landroid/support/constraint/a/a/a;->c()Landroid/support/constraint/a/a/a$c;

    move-result-object v0

    sget-object v5, Landroid/support/constraint/a/a/a$c;->e:Landroid/support/constraint/a/a/a$c;

    if-ne v0, v5, :cond_16

    iget v0, v3, Landroid/support/constraint/a/a/b;->L:I

    invoke-virtual {v3}, Landroid/support/constraint/a/a/b;->j()I

    move-result v5

    sub-int/2addr v0, v5

    add-int/2addr v2, v0

    :cond_10
    :goto_7
    iget-boolean v0, v3, Landroid/support/constraint/a/a/b;->P:Z

    if-nez v0, :cond_11

    iget-object v0, v3, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v0, :cond_12

    iget-object v0, v3, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-eq v0, p1, :cond_12

    iget-object v0, v3, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-eqz v0, :cond_12

    iget-object v0, v3, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-eq v0, p1, :cond_12

    iget-object v0, v3, Landroid/support/constraint/a/a/b;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v5, Landroid/support/constraint/a/a/b$a;->c:Landroid/support/constraint/a/a/b$a;

    if-eq v0, v5, :cond_12

    :cond_11
    move v1, v6

    :cond_12
    iput-boolean v1, p1, Landroid/support/constraint/a/a/b;->P:Z

    iget-boolean v0, p1, Landroid/support/constraint/a/a/b;->P:Z

    if-eqz v0, :cond_1

    iget-object v0, v3, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    if-nez v0, :cond_17

    :goto_8
    iget v0, v3, Landroid/support/constraint/a/a/b;->L:I

    sub-int v0, v2, v0

    add-int/2addr v2, v0

    goto/16 :goto_2

    :cond_13
    iget-object v5, p1, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    invoke-virtual {v5}, Landroid/support/constraint/a/a/a;->c()Landroid/support/constraint/a/a/a$c;

    move-result-object v5

    sget-object v7, Landroid/support/constraint/a/a/a$c;->e:Landroid/support/constraint/a/a/a$c;

    if-ne v5, v7, :cond_d

    iget v5, v0, Landroid/support/constraint/a/a/b;->I:I

    add-int/2addr v4, v5

    goto/16 :goto_4

    :cond_14
    move v5, v1

    goto :goto_5

    :cond_15
    iget-object v5, v0, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v5, v5, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-eq v5, p1, :cond_f

    goto :goto_6

    :cond_16
    iget-object v0, p1, Landroid/support/constraint/a/a/b;->l:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    invoke-virtual {v0}, Landroid/support/constraint/a/a/a;->c()Landroid/support/constraint/a/a/a$c;

    move-result-object v0

    sget-object v5, Landroid/support/constraint/a/a/a$c;->c:Landroid/support/constraint/a/a/a$c;

    if-ne v0, v5, :cond_10

    iget v0, v3, Landroid/support/constraint/a/a/b;->L:I

    add-int/2addr v2, v0

    goto :goto_7

    :cond_17
    iget-object v0, v3, Landroid/support/constraint/a/a/b;->j:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->c:Landroid/support/constraint/a/a/a;

    iget-object v0, v0, Landroid/support/constraint/a/a/a;->a:Landroid/support/constraint/a/a/b;

    if-eq v0, p1, :cond_1

    goto :goto_8

    :cond_18
    move-object v0, v3

    move v4, v2

    goto/16 :goto_3

    :cond_19
    move v0, v1

    goto/16 :goto_1

    :cond_1a
    move v0, v2

    move v1, v2

    goto/16 :goto_1
.end method

.method public c(Landroid/support/constraint/a/e;I)Z
    .locals 8

    const/4 v2, 0x1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/support/constraint/a/a/c;->a(Landroid/support/constraint/a/e;I)V

    iget-object v1, p0, Landroid/support/constraint/a/a/c;->aj:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    iget v1, p0, Landroid/support/constraint/a/a/c;->aq:I

    const/4 v3, 0x2

    if-eq v1, v3, :cond_0

    iget v1, p0, Landroid/support/constraint/a/a/c;->aq:I

    const/4 v3, 0x4

    if-ne v1, v3, :cond_1

    :cond_0
    invoke-direct {p0, p1}, Landroid/support/constraint/a/a/c;->a(Landroid/support/constraint/a/e;)Z

    move-result v1

    if-eqz v1, :cond_b

    :goto_0
    return v0

    :cond_1
    move v1, v2

    :goto_1
    move v3, v0

    :goto_2
    if-ge v3, v4, :cond_8

    iget-object v0, p0, Landroid/support/constraint/a/a/c;->aj:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a/a/b;

    instance-of v5, v0, Landroid/support/constraint/a/a/c;

    if-eqz v5, :cond_6

    iget-object v5, v0, Landroid/support/constraint/a/a/b;->G:Landroid/support/constraint/a/a/b$a;

    iget-object v6, v0, Landroid/support/constraint/a/a/b;->H:Landroid/support/constraint/a/a/b$a;

    sget-object v7, Landroid/support/constraint/a/a/b$a;->b:Landroid/support/constraint/a/a/b$a;

    if-ne v5, v7, :cond_2

    sget-object v7, Landroid/support/constraint/a/a/b$a;->a:Landroid/support/constraint/a/a/b$a;

    invoke-virtual {v0, v7}, Landroid/support/constraint/a/a/b;->a(Landroid/support/constraint/a/a/b$a;)V

    :cond_2
    sget-object v7, Landroid/support/constraint/a/a/b$a;->b:Landroid/support/constraint/a/a/b$a;

    if-ne v6, v7, :cond_3

    sget-object v7, Landroid/support/constraint/a/a/b$a;->a:Landroid/support/constraint/a/a/b$a;

    invoke-virtual {v0, v7}, Landroid/support/constraint/a/a/b;->b(Landroid/support/constraint/a/a/b$a;)V

    :cond_3
    invoke-virtual {v0, p1, p2}, Landroid/support/constraint/a/a/b;->a(Landroid/support/constraint/a/e;I)V

    sget-object v7, Landroid/support/constraint/a/a/b$a;->b:Landroid/support/constraint/a/a/b$a;

    if-ne v5, v7, :cond_4

    invoke-virtual {v0, v5}, Landroid/support/constraint/a/a/b;->a(Landroid/support/constraint/a/a/b$a;)V

    :cond_4
    sget-object v5, Landroid/support/constraint/a/a/b$a;->b:Landroid/support/constraint/a/a/b$a;

    if-ne v6, v5, :cond_5

    invoke-virtual {v0, v6}, Landroid/support/constraint/a/a/b;->b(Landroid/support/constraint/a/a/b$a;)V

    :cond_5
    :goto_3
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_2

    :cond_6
    if-eqz v1, :cond_7

    invoke-static {p0, p1, v0}, Landroid/support/constraint/a/a/e;->a(Landroid/support/constraint/a/a/c;Landroid/support/constraint/a/e;Landroid/support/constraint/a/a/b;)V

    :cond_7
    invoke-virtual {v0, p1, p2}, Landroid/support/constraint/a/a/b;->a(Landroid/support/constraint/a/e;I)V

    goto :goto_3

    :cond_8
    iget v0, p0, Landroid/support/constraint/a/a/c;->al:I

    if-lez v0, :cond_9

    invoke-direct {p0, p1}, Landroid/support/constraint/a/a/c;->b(Landroid/support/constraint/a/e;)V

    :cond_9
    iget v0, p0, Landroid/support/constraint/a/a/c;->am:I

    if-lez v0, :cond_a

    invoke-direct {p0, p1}, Landroid/support/constraint/a/a/c;->c(Landroid/support/constraint/a/e;)V

    :cond_a
    move v0, v2

    goto :goto_0

    :cond_b
    move v1, v0

    goto :goto_1
.end method

.method public m(I)V
    .locals 0

    iput p1, p0, Landroid/support/constraint/a/a/c;->aq:I

    return-void
.end method
