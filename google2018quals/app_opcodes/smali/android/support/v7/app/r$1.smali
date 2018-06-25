.class Landroid/support/v7/app/r$1;
.super Landroid/support/v4/h/t;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/app/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/support/v7/app/r;


# direct methods
.method constructor <init>(Landroid/support/v7/app/r;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v7/app/r$1;->a:Landroid/support/v7/app/r;

    invoke-direct {p0}, Landroid/support/v4/h/t;-><init>()V

    return-void
.end method


# virtual methods
.method public b(Landroid/view/View;)V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Landroid/support/v7/app/r$1;->a:Landroid/support/v7/app/r;

    iget-boolean v0, v0, Landroid/support/v7/app/r;->k:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/app/r$1;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->f:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/app/r$1;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->f:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    iget-object v0, p0, Landroid/support/v7/app/r$1;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->c:Landroid/support/v7/widget/ActionBarContainer;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/ActionBarContainer;->setTranslationY(F)V

    :cond_0
    iget-object v0, p0, Landroid/support/v7/app/r$1;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->c:Landroid/support/v7/widget/ActionBarContainer;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/ActionBarContainer;->setVisibility(I)V

    iget-object v0, p0, Landroid/support/v7/app/r$1;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->c:Landroid/support/v7/widget/ActionBarContainer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/ActionBarContainer;->setTransitioning(Z)V

    iget-object v0, p0, Landroid/support/v7/app/r$1;->a:Landroid/support/v7/app/r;

    const/4 v1, 0x0

    iput-object v1, v0, Landroid/support/v7/app/r;->n:Landroid/support/v7/view/h;

    iget-object v0, p0, Landroid/support/v7/app/r$1;->a:Landroid/support/v7/app/r;

    invoke-virtual {v0}, Landroid/support/v7/app/r;->h()V

    iget-object v0, p0, Landroid/support/v7/app/r$1;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->b:Landroid/support/v7/widget/ActionBarOverlayLayout;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v7/app/r$1;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->b:Landroid/support/v7/widget/ActionBarOverlayLayout;

    invoke-static {v0}, Landroid/support/v4/h/p;->g(Landroid/view/View;)V

    :cond_1
    return-void
.end method
