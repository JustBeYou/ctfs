.class public abstract Landroid/support/v7/view/menu/b;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/support/v7/view/menu/o;


# instance fields
.field protected a:Landroid/content/Context;

.field protected b:Landroid/content/Context;

.field protected c:Landroid/support/v7/view/menu/h;

.field protected d:Landroid/view/LayoutInflater;

.field protected e:Landroid/view/LayoutInflater;

.field protected f:Landroid/support/v7/view/menu/p;

.field private g:Landroid/support/v7/view/menu/o$a;

.field private h:I

.field private i:I

.field private j:I


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/v7/view/menu/b;->a:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/view/menu/b;->d:Landroid/view/LayoutInflater;

    iput p2, p0, Landroid/support/v7/view/menu/b;->h:I

    iput p3, p0, Landroid/support/v7/view/menu/b;->i:I

    return-void
.end method


# virtual methods
.method public a()Landroid/support/v7/view/menu/o$a;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/view/menu/b;->g:Landroid/support/v7/view/menu/o$a;

    return-object v0
.end method

.method public a(Landroid/view/ViewGroup;)Landroid/support/v7/view/menu/p;
    .locals 3

    iget-object v0, p0, Landroid/support/v7/view/menu/b;->f:Landroid/support/v7/view/menu/p;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/view/menu/b;->d:Landroid/view/LayoutInflater;

    iget v1, p0, Landroid/support/v7/view/menu/b;->h:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/view/menu/p;

    iput-object v0, p0, Landroid/support/v7/view/menu/b;->f:Landroid/support/v7/view/menu/p;

    iget-object v0, p0, Landroid/support/v7/view/menu/b;->f:Landroid/support/v7/view/menu/p;

    iget-object v1, p0, Landroid/support/v7/view/menu/b;->c:Landroid/support/v7/view/menu/h;

    invoke-interface {v0, v1}, Landroid/support/v7/view/menu/p;->a(Landroid/support/v7/view/menu/h;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/v7/view/menu/b;->b(Z)V

    :cond_0
    iget-object v0, p0, Landroid/support/v7/view/menu/b;->f:Landroid/support/v7/view/menu/p;

    return-object v0
.end method

.method public a(Landroid/support/v7/view/menu/j;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    instance-of v0, p2, Landroid/support/v7/view/menu/p$a;

    if-eqz v0, :cond_0

    check-cast p2, Landroid/support/v7/view/menu/p$a;

    move-object v0, p2

    :goto_0
    invoke-virtual {p0, p1, v0}, Landroid/support/v7/view/menu/b;->a(Landroid/support/v7/view/menu/j;Landroid/support/v7/view/menu/p$a;)V

    check-cast v0, Landroid/view/View;

    return-object v0

    :cond_0
    invoke-virtual {p0, p3}, Landroid/support/v7/view/menu/b;->b(Landroid/view/ViewGroup;)Landroid/support/v7/view/menu/p$a;

    move-result-object v0

    goto :goto_0
.end method

.method public a(I)V
    .locals 0

    iput p1, p0, Landroid/support/v7/view/menu/b;->j:I

    return-void
.end method

.method public a(Landroid/content/Context;Landroid/support/v7/view/menu/h;)V
    .locals 1

    iput-object p1, p0, Landroid/support/v7/view/menu/b;->b:Landroid/content/Context;

    iget-object v0, p0, Landroid/support/v7/view/menu/b;->b:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/view/menu/b;->e:Landroid/view/LayoutInflater;

    iput-object p2, p0, Landroid/support/v7/view/menu/b;->c:Landroid/support/v7/view/menu/h;

    return-void
.end method

.method public a(Landroid/support/v7/view/menu/h;Z)V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/view/menu/b;->g:Landroid/support/v7/view/menu/o$a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/view/menu/b;->g:Landroid/support/v7/view/menu/o$a;

    invoke-interface {v0, p1, p2}, Landroid/support/v7/view/menu/o$a;->a(Landroid/support/v7/view/menu/h;Z)V

    :cond_0
    return-void
.end method

.method public abstract a(Landroid/support/v7/view/menu/j;Landroid/support/v7/view/menu/p$a;)V
.end method

.method public a(Landroid/support/v7/view/menu/o$a;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v7/view/menu/b;->g:Landroid/support/v7/view/menu/o$a;

    return-void
.end method

.method protected a(Landroid/view/View;I)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_0
    iget-object v0, p0, Landroid/support/v7/view/menu/b;->f:Landroid/support/v7/view/menu/p;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    return-void
.end method

.method public a(ILandroid/support/v7/view/menu/j;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public a(Landroid/support/v7/view/menu/h;Landroid/support/v7/view/menu/j;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public a(Landroid/support/v7/view/menu/u;)Z
    .locals 1

    iget-object v0, p0, Landroid/support/v7/view/menu/b;->g:Landroid/support/v7/view/menu/o$a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/view/menu/b;->g:Landroid/support/v7/view/menu/o$a;

    invoke-interface {v0, p1}, Landroid/support/v7/view/menu/o$a;->a(Landroid/support/v7/view/menu/h;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected a(Landroid/view/ViewGroup;I)Z
    .locals 1

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->removeViewAt(I)V

    const/4 v0, 0x1

    return v0
.end method

.method public b(Landroid/view/ViewGroup;)Landroid/support/v7/view/menu/p$a;
    .locals 3

    iget-object v0, p0, Landroid/support/v7/view/menu/b;->d:Landroid/view/LayoutInflater;

    iget v1, p0, Landroid/support/v7/view/menu/b;->i:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/view/menu/p$a;

    return-object v0
.end method

.method public b(Z)V
    .locals 10

    const/4 v5, 0x0

    iget-object v0, p0, Landroid/support/v7/view/menu/b;->f:Landroid/support/v7/view/menu/p;

    check-cast v0, Landroid/view/ViewGroup;

    if-nez v0, :cond_1

    :cond_0
    return-void

    :cond_1
    iget-object v1, p0, Landroid/support/v7/view/menu/b;->c:Landroid/support/v7/view/menu/h;

    if-eqz v1, :cond_7

    iget-object v1, p0, Landroid/support/v7/view/menu/b;->c:Landroid/support/v7/view/menu/h;

    invoke-virtual {v1}, Landroid/support/v7/view/menu/h;->j()V

    iget-object v1, p0, Landroid/support/v7/view/menu/b;->c:Landroid/support/v7/view/menu/h;

    invoke-virtual {v1}, Landroid/support/v7/view/menu/h;->i()Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v8

    move v6, v5

    move v4, v5

    :goto_0
    if-ge v6, v8, :cond_5

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/view/menu/j;

    invoke-virtual {p0, v4, v1}, Landroid/support/v7/view/menu/b;->a(ILandroid/support/v7/view/menu/j;)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    instance-of v2, v3, Landroid/support/v7/view/menu/p$a;

    if-eqz v2, :cond_4

    move-object v2, v3

    check-cast v2, Landroid/support/v7/view/menu/p$a;

    invoke-interface {v2}, Landroid/support/v7/view/menu/p$a;->getItemData()Landroid/support/v7/view/menu/j;

    move-result-object v2

    :goto_1
    invoke-virtual {p0, v1, v3, v0}, Landroid/support/v7/view/menu/b;->a(Landroid/support/v7/view/menu/j;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v9

    if-eq v1, v2, :cond_2

    invoke-virtual {v9, v5}, Landroid/view/View;->setPressed(Z)V

    invoke-virtual {v9}, Landroid/view/View;->jumpDrawablesToCurrentState()V

    :cond_2
    if-eq v9, v3, :cond_3

    invoke-virtual {p0, v9, v4}, Landroid/support/v7/view/menu/b;->a(Landroid/view/View;I)V

    :cond_3
    add-int/lit8 v1, v4, 0x1

    :goto_2
    add-int/lit8 v2, v6, 0x1

    move v6, v2

    move v4, v1

    goto :goto_0

    :cond_4
    const/4 v2, 0x0

    goto :goto_1

    :cond_5
    :goto_3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v4, v1, :cond_0

    invoke-virtual {p0, v0, v4}, Landroid/support/v7/view/menu/b;->a(Landroid/view/ViewGroup;I)Z

    move-result v1

    if-nez v1, :cond_5

    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    :cond_6
    move v1, v4

    goto :goto_2

    :cond_7
    move v4, v5

    goto :goto_3
.end method

.method public b()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public b(Landroid/support/v7/view/menu/h;Landroid/support/v7/view/menu/j;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
