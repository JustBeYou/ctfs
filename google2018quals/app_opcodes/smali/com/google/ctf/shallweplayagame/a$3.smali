.class Lcom/google/ctf/shallweplayagame/a$3;
.super Landroid/animation/AnimatorListenerAdapter;


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

    iput-object p1, p0, Lcom/google/ctf/shallweplayagame/a$3;->a:Lcom/google/ctf/shallweplayagame/a;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    iget-object v0, p0, Lcom/google/ctf/shallweplayagame/a$3;->a:Lcom/google/ctf/shallweplayagame/a;

    iget-object v0, v0, Lcom/google/ctf/shallweplayagame/a;->c:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    :cond_0
    return-void
.end method
