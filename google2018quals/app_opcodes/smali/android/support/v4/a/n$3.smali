.class Landroid/support/v4/a/n$3;
.super Landroid/animation/AnimatorListenerAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/a/n;->a(Landroid/support/v4/a/h;Landroid/support/v4/a/n$c;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/view/ViewGroup;

.field final synthetic b:Landroid/view/View;

.field final synthetic c:Landroid/support/v4/a/h;

.field final synthetic d:Landroid/support/v4/a/n;


# direct methods
.method constructor <init>(Landroid/support/v4/a/n;Landroid/view/ViewGroup;Landroid/view/View;Landroid/support/v4/a/h;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/a/n$3;->d:Landroid/support/v4/a/n;

    iput-object p2, p0, Landroid/support/v4/a/n$3;->a:Landroid/view/ViewGroup;

    iput-object p3, p0, Landroid/support/v4/a/n$3;->b:Landroid/view/View;

    iput-object p4, p0, Landroid/support/v4/a/n$3;->c:Landroid/support/v4/a/h;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 6

    const/4 v3, 0x0

    iget-object v0, p0, Landroid/support/v4/a/n$3;->a:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/n$3;->a:Landroid/view/ViewGroup;

    iget-object v1, p0, Landroid/support/v4/a/n$3;->b:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/n$3;->c:Landroid/support/v4/a/h;

    invoke-virtual {v0}, Landroid/support/v4/a/h;->S()Landroid/animation/Animator;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/a/n$3;->c:Landroid/support/v4/a/h;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/a/h;->a(Landroid/animation/Animator;)V

    iget-object v0, p0, Landroid/support/v4/a/n$3;->d:Landroid/support/v4/a/n;

    iget-object v1, p0, Landroid/support/v4/a/n$3;->c:Landroid/support/v4/a/h;

    iget-object v2, p0, Landroid/support/v4/a/n$3;->c:Landroid/support/v4/a/h;

    invoke-virtual {v2}, Landroid/support/v4/a/h;->T()I

    move-result v2

    move v4, v3

    move v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/support/v4/a/n;->a(Landroid/support/v4/a/h;IIIZ)V

    :cond_1
    return-void
.end method
