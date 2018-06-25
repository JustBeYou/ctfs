.class public Landroid/support/constraint/ConstraintLayout$a;
.super Landroid/view/ViewGroup$MarginLayoutParams;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/constraint/ConstraintLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field A:I

.field public B:F

.field public C:F

.field public D:I

.field public E:I

.field public F:I

.field public G:I

.field public H:I

.field public I:I

.field public J:I

.field public K:I

.field public L:I

.field public M:I

.field public N:I

.field O:Z

.field P:Z

.field Q:Z

.field R:Z

.field S:I

.field T:I

.field U:I

.field V:I

.field W:I

.field X:I

.field Y:F

.field Z:Landroid/support/constraint/a/a/b;

.field public a:I

.field public b:I

.field public c:F

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public s:I

.field public t:I

.field public u:I

.field public v:I

.field public w:F

.field public x:F

.field public y:Ljava/lang/String;

.field z:F


# direct methods
.method public constructor <init>(II)V
    .locals 6

    const/4 v5, 0x1

    const/high16 v4, 0x3f000000    # 0.5f

    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, -0x1

    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->a:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->b:I

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->c:F

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->d:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->e:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->f:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->g:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->h:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->i:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->j:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->k:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->l:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->m:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->n:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->o:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->p:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->q:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->r:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->s:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->t:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->u:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->v:I

    iput v4, p0, Landroid/support/constraint/ConstraintLayout$a;->w:F

    iput v4, p0, Landroid/support/constraint/ConstraintLayout$a;->x:F

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/constraint/ConstraintLayout$a;->y:Ljava/lang/String;

    iput v3, p0, Landroid/support/constraint/ConstraintLayout$a;->z:F

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$a;->A:I

    iput v3, p0, Landroid/support/constraint/ConstraintLayout$a;->B:F

    iput v3, p0, Landroid/support/constraint/ConstraintLayout$a;->C:F

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->D:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->E:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->F:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->G:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->H:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->I:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->J:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->K:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->L:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->M:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->N:I

    iput-boolean v5, p0, Landroid/support/constraint/ConstraintLayout$a;->O:Z

    iput-boolean v5, p0, Landroid/support/constraint/ConstraintLayout$a;->P:Z

    iput-boolean v2, p0, Landroid/support/constraint/ConstraintLayout$a;->Q:Z

    iput-boolean v2, p0, Landroid/support/constraint/ConstraintLayout$a;->R:Z

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->S:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->T:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->U:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->V:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->W:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->X:I

    iput v4, p0, Landroid/support/constraint/ConstraintLayout$a;->Y:F

    new-instance v0, Landroid/support/constraint/a/a/b;

    invoke-direct {v0}, Landroid/support/constraint/a/a/b;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/ConstraintLayout$a;->Z:Landroid/support/constraint/a/a/b;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 11

    const/high16 v2, 0x3f000000    # 0.5f

    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v1, 0x0

    const/4 v8, -0x1

    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->a:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->b:I

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->c:F

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->d:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->e:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->f:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->g:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->h:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->i:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->j:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->k:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->l:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->m:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->n:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->o:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->p:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->q:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->r:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->s:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->t:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->u:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->v:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->w:F

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->x:F

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/constraint/ConstraintLayout$a;->y:Ljava/lang/String;

    iput v9, p0, Landroid/support/constraint/ConstraintLayout$a;->z:F

    iput v10, p0, Landroid/support/constraint/ConstraintLayout$a;->A:I

    iput v9, p0, Landroid/support/constraint/ConstraintLayout$a;->B:F

    iput v9, p0, Landroid/support/constraint/ConstraintLayout$a;->C:F

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->D:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->E:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->F:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->G:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->H:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->I:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->J:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->K:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->L:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->M:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->N:I

    iput-boolean v10, p0, Landroid/support/constraint/ConstraintLayout$a;->O:Z

    iput-boolean v10, p0, Landroid/support/constraint/ConstraintLayout$a;->P:Z

    iput-boolean v1, p0, Landroid/support/constraint/ConstraintLayout$a;->Q:Z

    iput-boolean v1, p0, Landroid/support/constraint/ConstraintLayout$a;->R:Z

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->S:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->T:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->U:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->V:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->W:I

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->X:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->Y:F

    new-instance v0, Landroid/support/constraint/a/a/b;

    invoke-direct {v0}, Landroid/support/constraint/a/a/b;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/ConstraintLayout$a;->Z:Landroid/support/constraint/a/a/b;

    sget-object v0, Landroid/support/constraint/c$a;->ConstraintLayout_Layout:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v4

    move v2, v1

    :goto_0
    if-ge v2, v4, :cond_2c

    invoke-virtual {v3, v2}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v0

    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintLeft_toLeftOf:I

    if-ne v0, v5, :cond_1

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->d:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$a;->d:I

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->d:I

    if-ne v5, v8, :cond_0

    invoke-virtual {v3, v0, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->d:I

    :cond_0
    :goto_1
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_1
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintLeft_toRightOf:I

    if-ne v0, v5, :cond_2

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->e:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$a;->e:I

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->e:I

    if-ne v5, v8, :cond_0

    invoke-virtual {v3, v0, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->e:I

    goto :goto_1

    :cond_2
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintRight_toLeftOf:I

    if-ne v0, v5, :cond_3

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->f:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$a;->f:I

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->f:I

    if-ne v5, v8, :cond_0

    invoke-virtual {v3, v0, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->f:I

    goto :goto_1

    :cond_3
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintRight_toRightOf:I

    if-ne v0, v5, :cond_4

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->g:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$a;->g:I

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->g:I

    if-ne v5, v8, :cond_0

    invoke-virtual {v3, v0, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->g:I

    goto :goto_1

    :cond_4
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintTop_toTopOf:I

    if-ne v0, v5, :cond_5

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->h:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$a;->h:I

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->h:I

    if-ne v5, v8, :cond_0

    invoke-virtual {v3, v0, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->h:I

    goto :goto_1

    :cond_5
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintTop_toBottomOf:I

    if-ne v0, v5, :cond_6

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->i:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$a;->i:I

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->i:I

    if-ne v5, v8, :cond_0

    invoke-virtual {v3, v0, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->i:I

    goto :goto_1

    :cond_6
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintBottom_toTopOf:I

    if-ne v0, v5, :cond_7

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->j:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$a;->j:I

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->j:I

    if-ne v5, v8, :cond_0

    invoke-virtual {v3, v0, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->j:I

    goto/16 :goto_1

    :cond_7
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintBottom_toBottomOf:I

    if-ne v0, v5, :cond_8

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->k:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$a;->k:I

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->k:I

    if-ne v5, v8, :cond_0

    invoke-virtual {v3, v0, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->k:I

    goto/16 :goto_1

    :cond_8
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintBaseline_toBaselineOf:I

    if-ne v0, v5, :cond_9

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->l:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$a;->l:I

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->l:I

    if-ne v5, v8, :cond_0

    invoke-virtual {v3, v0, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->l:I

    goto/16 :goto_1

    :cond_9
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_editor_absoluteX:I

    if-ne v0, v5, :cond_a

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->L:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->L:I

    goto/16 :goto_1

    :cond_a
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_editor_absoluteY:I

    if-ne v0, v5, :cond_b

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->M:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->M:I

    goto/16 :goto_1

    :cond_b
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintGuide_begin:I

    if-ne v0, v5, :cond_c

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->a:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->a:I

    goto/16 :goto_1

    :cond_c
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintGuide_end:I

    if-ne v0, v5, :cond_d

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->b:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->b:I

    goto/16 :goto_1

    :cond_d
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintGuide_percent:I

    if-ne v0, v5, :cond_e

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->c:F

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->c:F

    goto/16 :goto_1

    :cond_e
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_android_orientation:I

    if-ne v0, v5, :cond_f

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->N:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->N:I

    goto/16 :goto_1

    :cond_f
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintStart_toEndOf:I

    if-ne v0, v5, :cond_10

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->m:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$a;->m:I

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->m:I

    if-ne v5, v8, :cond_0

    invoke-virtual {v3, v0, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->m:I

    goto/16 :goto_1

    :cond_10
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintStart_toStartOf:I

    if-ne v0, v5, :cond_11

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->n:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$a;->n:I

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->n:I

    if-ne v5, v8, :cond_0

    invoke-virtual {v3, v0, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->n:I

    goto/16 :goto_1

    :cond_11
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintEnd_toStartOf:I

    if-ne v0, v5, :cond_12

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->o:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$a;->o:I

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->o:I

    if-ne v5, v8, :cond_0

    invoke-virtual {v3, v0, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->o:I

    goto/16 :goto_1

    :cond_12
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintEnd_toEndOf:I

    if-ne v0, v5, :cond_13

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->p:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$a;->p:I

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->p:I

    if-ne v5, v8, :cond_0

    invoke-virtual {v3, v0, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->p:I

    goto/16 :goto_1

    :cond_13
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_goneMarginLeft:I

    if-ne v0, v5, :cond_14

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->q:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->q:I

    goto/16 :goto_1

    :cond_14
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_goneMarginTop:I

    if-ne v0, v5, :cond_15

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->r:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->r:I

    goto/16 :goto_1

    :cond_15
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_goneMarginRight:I

    if-ne v0, v5, :cond_16

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->s:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->s:I

    goto/16 :goto_1

    :cond_16
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_goneMarginBottom:I

    if-ne v0, v5, :cond_17

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->t:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->t:I

    goto/16 :goto_1

    :cond_17
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_goneMarginStart:I

    if-ne v0, v5, :cond_18

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->u:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->u:I

    goto/16 :goto_1

    :cond_18
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_goneMarginEnd:I

    if-ne v0, v5, :cond_19

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->v:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->v:I

    goto/16 :goto_1

    :cond_19
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintHorizontal_bias:I

    if-ne v0, v5, :cond_1a

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->w:F

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->w:F

    goto/16 :goto_1

    :cond_1a
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintVertical_bias:I

    if-ne v0, v5, :cond_1b

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->x:F

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->x:F

    goto/16 :goto_1

    :cond_1b
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintDimensionRatio:I

    if-ne v0, v5, :cond_21

    invoke-virtual {v3, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/support/constraint/ConstraintLayout$a;->y:Ljava/lang/String;

    const/high16 v0, 0x7fc00000    # NaNf

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->z:F

    iput v8, p0, Landroid/support/constraint/ConstraintLayout$a;->A:I

    iget-object v0, p0, Landroid/support/constraint/ConstraintLayout$a;->y:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/constraint/ConstraintLayout$a;->y:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    iget-object v0, p0, Landroid/support/constraint/ConstraintLayout$a;->y:Ljava/lang/String;

    const/16 v6, 0x2c

    invoke-virtual {v0, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-lez v0, :cond_1e

    add-int/lit8 v6, v5, -0x1

    if-ge v0, v6, :cond_1e

    iget-object v6, p0, Landroid/support/constraint/ConstraintLayout$a;->y:Ljava/lang/String;

    invoke-virtual {v6, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    const-string v7, "W"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1d

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->A:I

    :cond_1c
    :goto_2
    add-int/lit8 v0, v0, 0x1

    :goto_3
    iget-object v6, p0, Landroid/support/constraint/ConstraintLayout$a;->y:Ljava/lang/String;

    const/16 v7, 0x3a

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-ltz v6, :cond_20

    add-int/lit8 v5, v5, -0x1

    if-ge v6, v5, :cond_20

    iget-object v5, p0, Landroid/support/constraint/ConstraintLayout$a;->y:Ljava/lang/String;

    invoke-virtual {v5, v0, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iget-object v5, p0, Landroid/support/constraint/ConstraintLayout$a;->y:Ljava/lang/String;

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_0

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_0

    :try_start_0
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v5

    cmpl-float v6, v0, v9

    if-lez v6, :cond_0

    cmpl-float v6, v5, v9

    if-lez v6, :cond_0

    iget v6, p0, Landroid/support/constraint/ConstraintLayout$a;->A:I

    if-ne v6, v10, :cond_1f

    div-float v0, v5, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->z:F
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    :catch_0
    move-exception v0

    goto/16 :goto_1

    :cond_1d
    const-string v7, "H"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1c

    iput v10, p0, Landroid/support/constraint/ConstraintLayout$a;->A:I

    goto :goto_2

    :cond_1e
    move v0, v1

    goto :goto_3

    :cond_1f
    div-float/2addr v0, v5

    :try_start_1
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->z:F
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    :cond_20
    iget-object v5, p0, Landroid/support/constraint/ConstraintLayout$a;->y:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_0

    :try_start_2
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->z:F
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_1

    :catch_1
    move-exception v0

    goto/16 :goto_1

    :cond_21
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintHorizontal_weight:I

    if-ne v0, v5, :cond_22

    invoke-virtual {v3, v0, v9}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->B:F

    goto/16 :goto_1

    :cond_22
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintVertical_weight:I

    if-ne v0, v5, :cond_23

    invoke-virtual {v3, v0, v9}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->C:F

    goto/16 :goto_1

    :cond_23
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintHorizontal_chainStyle:I

    if-ne v0, v5, :cond_24

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->D:I

    goto/16 :goto_1

    :cond_24
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintVertical_chainStyle:I

    if-ne v0, v5, :cond_25

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->E:I

    goto/16 :goto_1

    :cond_25
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintWidth_default:I

    if-ne v0, v5, :cond_26

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->F:I

    goto/16 :goto_1

    :cond_26
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintHeight_default:I

    if-ne v0, v5, :cond_27

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->G:I

    goto/16 :goto_1

    :cond_27
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintWidth_min:I

    if-ne v0, v5, :cond_28

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->H:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->H:I

    goto/16 :goto_1

    :cond_28
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintWidth_max:I

    if-ne v0, v5, :cond_29

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->J:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->J:I

    goto/16 :goto_1

    :cond_29
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintHeight_min:I

    if-ne v0, v5, :cond_2a

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->I:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->I:I

    goto/16 :goto_1

    :cond_2a
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintHeight_max:I

    if-ne v0, v5, :cond_2b

    iget v5, p0, Landroid/support/constraint/ConstraintLayout$a;->K:I

    invoke-virtual {v3, v0, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->K:I

    goto/16 :goto_1

    :cond_2b
    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintLeft_creator:I

    if-eq v0, v5, :cond_0

    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintTop_creator:I

    if-eq v0, v5, :cond_0

    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintRight_creator:I

    if-eq v0, v5, :cond_0

    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintBottom_creator:I

    if-eq v0, v5, :cond_0

    sget v5, Landroid/support/constraint/c$a;->ConstraintLayout_Layout_layout_constraintBaseline_creator:I

    if-ne v0, v5, :cond_0

    goto/16 :goto_1

    :cond_2c
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {p0}, Landroid/support/constraint/ConstraintLayout$a;->a()V

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .locals 6

    const/4 v5, 0x1

    const/high16 v4, 0x3f000000    # 0.5f

    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, -0x1

    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->a:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->b:I

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->c:F

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->d:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->e:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->f:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->g:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->h:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->i:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->j:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->k:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->l:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->m:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->n:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->o:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->p:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->q:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->r:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->s:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->t:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->u:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->v:I

    iput v4, p0, Landroid/support/constraint/ConstraintLayout$a;->w:F

    iput v4, p0, Landroid/support/constraint/ConstraintLayout$a;->x:F

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/constraint/ConstraintLayout$a;->y:Ljava/lang/String;

    iput v3, p0, Landroid/support/constraint/ConstraintLayout$a;->z:F

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$a;->A:I

    iput v3, p0, Landroid/support/constraint/ConstraintLayout$a;->B:F

    iput v3, p0, Landroid/support/constraint/ConstraintLayout$a;->C:F

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->D:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->E:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->F:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->G:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->H:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->I:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->J:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->K:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->L:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->M:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->N:I

    iput-boolean v5, p0, Landroid/support/constraint/ConstraintLayout$a;->O:Z

    iput-boolean v5, p0, Landroid/support/constraint/ConstraintLayout$a;->P:Z

    iput-boolean v2, p0, Landroid/support/constraint/ConstraintLayout$a;->Q:Z

    iput-boolean v2, p0, Landroid/support/constraint/ConstraintLayout$a;->R:Z

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->S:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->T:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->U:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->V:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->W:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->X:I

    iput v4, p0, Landroid/support/constraint/ConstraintLayout$a;->Y:F

    new-instance v0, Landroid/support/constraint/a/a/b;

    invoke-direct {v0}, Landroid/support/constraint/a/a/b;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/ConstraintLayout$a;->Z:Landroid/support/constraint/a/a/b;

    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    const/4 v1, 0x0

    const/4 v3, -0x1

    const/4 v2, 0x1

    iput-boolean v1, p0, Landroid/support/constraint/ConstraintLayout$a;->R:Z

    iput-boolean v2, p0, Landroid/support/constraint/ConstraintLayout$a;->O:Z

    iput-boolean v2, p0, Landroid/support/constraint/ConstraintLayout$a;->P:Z

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->width:I

    if-eqz v0, :cond_0

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->width:I

    if-ne v0, v3, :cond_1

    :cond_0
    iput-boolean v1, p0, Landroid/support/constraint/ConstraintLayout$a;->O:Z

    :cond_1
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->height:I

    if-eqz v0, :cond_2

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->height:I

    if-ne v0, v3, :cond_3

    :cond_2
    iput-boolean v1, p0, Landroid/support/constraint/ConstraintLayout$a;->P:Z

    :cond_3
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->c:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_4

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->a:I

    if-ne v0, v3, :cond_4

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->b:I

    if-eq v0, v3, :cond_6

    :cond_4
    iput-boolean v2, p0, Landroid/support/constraint/ConstraintLayout$a;->R:Z

    iput-boolean v2, p0, Landroid/support/constraint/ConstraintLayout$a;->O:Z

    iput-boolean v2, p0, Landroid/support/constraint/ConstraintLayout$a;->P:Z

    iget-object v0, p0, Landroid/support/constraint/ConstraintLayout$a;->Z:Landroid/support/constraint/a/a/b;

    instance-of v0, v0, Landroid/support/constraint/a/a/d;

    if-nez v0, :cond_5

    new-instance v0, Landroid/support/constraint/a/a/d;

    invoke-direct {v0}, Landroid/support/constraint/a/a/d;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/ConstraintLayout$a;->Z:Landroid/support/constraint/a/a/b;

    :cond_5
    iget-object v0, p0, Landroid/support/constraint/ConstraintLayout$a;->Z:Landroid/support/constraint/a/a/b;

    check-cast v0, Landroid/support/constraint/a/a/d;

    iget v1, p0, Landroid/support/constraint/ConstraintLayout$a;->N:I

    invoke-virtual {v0, v1}, Landroid/support/constraint/a/a/d;->m(I)V

    :cond_6
    return-void
.end method

.method public resolveLayoutDirection(I)V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    const/4 v0, 0x1

    const/4 v2, -0x1

    invoke-super {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->resolveLayoutDirection(I)V

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->U:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->V:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->S:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->T:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->W:I

    iput v2, p0, Landroid/support/constraint/ConstraintLayout$a;->X:I

    iget v1, p0, Landroid/support/constraint/ConstraintLayout$a;->q:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->W:I

    iget v1, p0, Landroid/support/constraint/ConstraintLayout$a;->s:I

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->X:I

    iget v1, p0, Landroid/support/constraint/ConstraintLayout$a;->w:F

    iput v1, p0, Landroid/support/constraint/ConstraintLayout$a;->Y:F

    invoke-virtual {p0}, Landroid/support/constraint/ConstraintLayout$a;->getLayoutDirection()I

    move-result v1

    if-ne v0, v1, :cond_8

    :goto_0
    if-eqz v0, :cond_a

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->m:I

    if-eq v0, v2, :cond_9

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->m:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->U:I

    :cond_0
    :goto_1
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->o:I

    if-eq v0, v2, :cond_1

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->o:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->T:I

    :cond_1
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->p:I

    if-eq v0, v2, :cond_2

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->p:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->S:I

    :cond_2
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->u:I

    if-eq v0, v2, :cond_3

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->u:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->X:I

    :cond_3
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->v:I

    if-eq v0, v2, :cond_4

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->v:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->W:I

    :cond_4
    const/high16 v0, 0x3f800000    # 1.0f

    iget v1, p0, Landroid/support/constraint/ConstraintLayout$a;->w:F

    sub-float/2addr v0, v1

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->Y:F

    :cond_5
    :goto_2
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->o:I

    if-ne v0, v2, :cond_6

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->p:I

    if-ne v0, v2, :cond_6

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->f:I

    if-eq v0, v2, :cond_10

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->f:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->U:I

    :cond_6
    :goto_3
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->n:I

    if-ne v0, v2, :cond_7

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->m:I

    if-ne v0, v2, :cond_7

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->d:I

    if-eq v0, v2, :cond_11

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->d:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->S:I

    :cond_7
    :goto_4
    return-void

    :cond_8
    const/4 v0, 0x0

    goto :goto_0

    :cond_9
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->n:I

    if-eq v0, v2, :cond_0

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->n:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->V:I

    goto :goto_1

    :cond_a
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->m:I

    if-eq v0, v2, :cond_b

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->m:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->T:I

    :cond_b
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->n:I

    if-eq v0, v2, :cond_c

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->n:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->S:I

    :cond_c
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->o:I

    if-eq v0, v2, :cond_d

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->o:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->U:I

    :cond_d
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->p:I

    if-eq v0, v2, :cond_e

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->p:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->V:I

    :cond_e
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->u:I

    if-eq v0, v2, :cond_f

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->u:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->W:I

    :cond_f
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->v:I

    if-eq v0, v2, :cond_5

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->v:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->X:I

    goto :goto_2

    :cond_10
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->g:I

    if-eq v0, v2, :cond_6

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->g:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->V:I

    goto :goto_3

    :cond_11
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->e:I

    if-eq v0, v2, :cond_7

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$a;->e:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$a;->T:I

    goto :goto_4
.end method
