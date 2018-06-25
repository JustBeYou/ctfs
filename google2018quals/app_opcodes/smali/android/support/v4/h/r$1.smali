.class Landroid/support/v4/h/r$1;
.super Landroid/animation/AnimatorListenerAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/h/r;->a(Landroid/view/View;Landroid/support/v4/h/s;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/support/v4/h/s;

.field final synthetic b:Landroid/view/View;

.field final synthetic c:Landroid/support/v4/h/r;


# direct methods
.method constructor <init>(Landroid/support/v4/h/r;Landroid/support/v4/h/s;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/h/r$1;->c:Landroid/support/v4/h/r;

    iput-object p2, p0, Landroid/support/v4/h/r$1;->a:Landroid/support/v4/h/s;

    iput-object p3, p0, Landroid/support/v4/h/r$1;->b:Landroid/view/View;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/h/r$1;->a:Landroid/support/v4/h/s;

    iget-object v1, p0, Landroid/support/v4/h/r$1;->b:Landroid/view/View;

    invoke-interface {v0, v1}, Landroid/support/v4/h/s;->c(Landroid/view/View;)V

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/h/r$1;->a:Landroid/support/v4/h/s;

    iget-object v1, p0, Landroid/support/v4/h/r$1;->b:Landroid/view/View;

    invoke-interface {v0, v1}, Landroid/support/v4/h/s;->b(Landroid/view/View;)V

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/h/r$1;->a:Landroid/support/v4/h/s;

    iget-object v1, p0, Landroid/support/v4/h/r$1;->b:Landroid/view/View;

    invoke-interface {v0, v1}, Landroid/support/v4/h/s;->a(Landroid/view/View;)V

    return-void
.end method
