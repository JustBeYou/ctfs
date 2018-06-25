.class Landroid/support/v7/widget/aj$c;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/aj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "c"
.end annotation


# instance fields
.field final synthetic a:Landroid/support/v7/widget/aj;


# direct methods
.method constructor <init>(Landroid/support/v7/widget/aj;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v7/widget/aj$c;->a:Landroid/support/v7/widget/aj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 0

    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 2

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/aj$c;->a:Landroid/support/v7/widget/aj;

    invoke-virtual {v0}, Landroid/support/v7/widget/aj;->n()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/aj$c;->a:Landroid/support/v7/widget/aj;

    iget-object v0, v0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/aj$c;->a:Landroid/support/v7/widget/aj;

    iget-object v0, v0, Landroid/support/v7/widget/aj;->f:Landroid/os/Handler;

    iget-object v1, p0, Landroid/support/v7/widget/aj$c;->a:Landroid/support/v7/widget/aj;

    iget-object v1, v1, Landroid/support/v7/widget/aj;->e:Landroid/support/v7/widget/aj$e;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Landroid/support/v7/widget/aj$c;->a:Landroid/support/v7/widget/aj;

    iget-object v0, v0, Landroid/support/v7/widget/aj;->e:Landroid/support/v7/widget/aj$e;

    invoke-virtual {v0}, Landroid/support/v7/widget/aj$e;->run()V

    :cond_0
    return-void
.end method
