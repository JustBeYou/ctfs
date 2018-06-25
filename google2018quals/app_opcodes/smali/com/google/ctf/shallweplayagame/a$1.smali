.class Lcom/google/ctf/shallweplayagame/a$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/ctf/shallweplayagame/a;->a(Ljava/lang/String;I)Landroid/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/google/ctf/shallweplayagame/a;


# direct methods
.method constructor <init>(Lcom/google/ctf/shallweplayagame/a;)V
    .locals 0

    iput-object p1, p0, Lcom/google/ctf/shallweplayagame/a$1;->a:Lcom/google/ctf/shallweplayagame/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    iget-object v1, p0, Lcom/google/ctf/shallweplayagame/a$1;->a:Lcom/google/ctf/shallweplayagame/a;

    iget-object v1, v1, Lcom/google/ctf/shallweplayagame/a;->e:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setScaleX(F)V

    iget-object v1, p0, Lcom/google/ctf/shallweplayagame/a$1;->a:Lcom/google/ctf/shallweplayagame/a;

    iget-object v1, v1, Lcom/google/ctf/shallweplayagame/a;->e:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setScaleY(F)V

    return-void
.end method
