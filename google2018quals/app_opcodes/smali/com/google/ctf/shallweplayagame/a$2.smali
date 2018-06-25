.class Lcom/google/ctf/shallweplayagame/a$2;
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
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcom/google/ctf/shallweplayagame/a;


# direct methods
.method constructor <init>(Lcom/google/ctf/shallweplayagame/a;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/ctf/shallweplayagame/a$2;->b:Lcom/google/ctf/shallweplayagame/a;

    iput-object p2, p0, Lcom/google/ctf/shallweplayagame/a$2;->a:Ljava/lang/String;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    iget-object v0, p0, Lcom/google/ctf/shallweplayagame/a$2;->b:Lcom/google/ctf/shallweplayagame/a;

    iget-object v0, v0, Lcom/google/ctf/shallweplayagame/a;->e:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/google/ctf/shallweplayagame/a$2;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/google/ctf/shallweplayagame/a$2;->a:Ljava/lang/String;

    sget-object v1, Lcom/google/ctf/shallweplayagame/a;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/google/ctf/shallweplayagame/b;->b()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/google/ctf/shallweplayagame/a$2;->a:Ljava/lang/String;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/google/ctf/shallweplayagame/b;->a()V

    goto :goto_0
.end method
