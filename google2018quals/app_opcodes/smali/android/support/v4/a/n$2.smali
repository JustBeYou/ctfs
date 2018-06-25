.class Landroid/support/v4/a/n$2;
.super Landroid/support/v4/a/n$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/a/n;->a(Landroid/support/v4/a/h;Landroid/support/v4/a/n$c;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/support/v4/a/h;

.field final synthetic b:Landroid/support/v4/a/n;


# direct methods
.method constructor <init>(Landroid/support/v4/a/n;Landroid/view/animation/Animation$AnimationListener;Landroid/support/v4/a/h;)V
    .locals 1

    iput-object p1, p0, Landroid/support/v4/a/n$2;->b:Landroid/support/v4/a/n;

    iput-object p3, p0, Landroid/support/v4/a/n$2;->a:Landroid/support/v4/a/h;

    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Landroid/support/v4/a/n$b;-><init>(Landroid/view/animation/Animation$AnimationListener;Landroid/support/v4/a/n$1;)V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 6

    const/4 v3, 0x0

    invoke-super {p0, p1}, Landroid/support/v4/a/n$b;->onAnimationEnd(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Landroid/support/v4/a/n$2;->a:Landroid/support/v4/a/h;

    invoke-virtual {v0}, Landroid/support/v4/a/h;->R()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/n$2;->a:Landroid/support/v4/a/h;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/a/h;->a(Landroid/view/View;)V

    iget-object v0, p0, Landroid/support/v4/a/n$2;->b:Landroid/support/v4/a/n;

    iget-object v1, p0, Landroid/support/v4/a/n$2;->a:Landroid/support/v4/a/h;

    iget-object v2, p0, Landroid/support/v4/a/n$2;->a:Landroid/support/v4/a/h;

    invoke-virtual {v2}, Landroid/support/v4/a/h;->T()I

    move-result v2

    move v4, v3

    move v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/support/v4/a/n;->a(Landroid/support/v4/a/h;IIIZ)V

    :cond_0
    return-void
.end method
