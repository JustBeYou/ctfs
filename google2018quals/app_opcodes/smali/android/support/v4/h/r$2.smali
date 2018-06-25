.class Landroid/support/v4/h/r$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/h/r;->a(Landroid/support/v4/h/u;)Landroid/support/v4/h/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/support/v4/h/u;

.field final synthetic b:Landroid/view/View;

.field final synthetic c:Landroid/support/v4/h/r;


# direct methods
.method constructor <init>(Landroid/support/v4/h/r;Landroid/support/v4/h/u;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/h/r$2;->c:Landroid/support/v4/h/r;

    iput-object p2, p0, Landroid/support/v4/h/r$2;->a:Landroid/support/v4/h/u;

    iput-object p3, p0, Landroid/support/v4/h/r$2;->b:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/h/r$2;->a:Landroid/support/v4/h/u;

    iget-object v1, p0, Landroid/support/v4/h/r$2;->b:Landroid/view/View;

    invoke-interface {v0, v1}, Landroid/support/v4/h/u;->a(Landroid/view/View;)V

    return-void
.end method
