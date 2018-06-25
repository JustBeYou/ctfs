.class Landroid/support/v7/app/k$5$1;
.super Landroid/support/v4/h/t;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v7/app/k$5;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/support/v7/app/k$5;


# direct methods
.method constructor <init>(Landroid/support/v7/app/k$5;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v7/app/k$5$1;->a:Landroid/support/v7/app/k$5;

    invoke-direct {p0}, Landroid/support/v4/h/t;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v7/app/k$5$1;->a:Landroid/support/v7/app/k$5;

    iget-object v0, v0, Landroid/support/v7/app/k$5;->a:Landroid/support/v7/app/k;

    iget-object v0, v0, Landroid/support/v7/app/k;->n:Landroid/support/v7/widget/ActionBarContextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/ActionBarContextView;->setVisibility(I)V

    return-void
.end method

.method public b(Landroid/view/View;)V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Landroid/support/v7/app/k$5$1;->a:Landroid/support/v7/app/k$5;

    iget-object v0, v0, Landroid/support/v7/app/k$5;->a:Landroid/support/v7/app/k;

    iget-object v0, v0, Landroid/support/v7/app/k;->n:Landroid/support/v7/widget/ActionBarContextView;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/ActionBarContextView;->setAlpha(F)V

    iget-object v0, p0, Landroid/support/v7/app/k$5$1;->a:Landroid/support/v7/app/k$5;

    iget-object v0, v0, Landroid/support/v7/app/k$5;->a:Landroid/support/v7/app/k;

    iget-object v0, v0, Landroid/support/v7/app/k;->q:Landroid/support/v4/h/r;

    invoke-virtual {v0, v2}, Landroid/support/v4/h/r;->a(Landroid/support/v4/h/s;)Landroid/support/v4/h/r;

    iget-object v0, p0, Landroid/support/v7/app/k$5$1;->a:Landroid/support/v7/app/k$5;

    iget-object v0, v0, Landroid/support/v7/app/k$5;->a:Landroid/support/v7/app/k;

    iput-object v2, v0, Landroid/support/v7/app/k;->q:Landroid/support/v4/h/r;

    return-void
.end method
