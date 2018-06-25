.class Landroid/support/v4/a/i$a;
.super Landroid/support/v4/a/l;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/a/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/a/l",
        "<",
        "Landroid/support/v4/a/i;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Landroid/support/v4/a/i;


# direct methods
.method public constructor <init>(Landroid/support/v4/a/i;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/a/i$a;->a:Landroid/support/v4/a/i;

    invoke-direct {p0, p1}, Landroid/support/v4/a/l;-><init>(Landroid/support/v4/a/i;)V

    return-void
.end method


# virtual methods
.method public a(I)Landroid/view/View;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/i$a;->a:Landroid/support/v4/a/i;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/i;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/i$a;->a:Landroid/support/v4/a/i;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/support/v4/a/i;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    return-void
.end method

.method public a()Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/i$a;->a:Landroid/support/v4/a/i;

    invoke-virtual {v0}, Landroid/support/v4/a/i;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public a(Landroid/support/v4/a/h;)Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/i$a;->a:Landroid/support/v4/a/i;

    invoke-virtual {v0}, Landroid/support/v4/a/i;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public b()Landroid/view/LayoutInflater;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/a/i$a;->a:Landroid/support/v4/a/i;

    invoke-virtual {v0}, Landroid/support/v4/a/i;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/a/i$a;->a:Landroid/support/v4/a/i;

    invoke-virtual {v0, v1}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    return-object v0
.end method

.method public b(Landroid/support/v4/a/h;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/i$a;->a:Landroid/support/v4/a/i;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/i;->a(Landroid/support/v4/a/h;)V

    return-void
.end method

.method public c()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/i$a;->a:Landroid/support/v4/a/i;

    invoke-virtual {v0}, Landroid/support/v4/a/i;->d()V

    return-void
.end method

.method public d()Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/i$a;->a:Landroid/support/v4/a/i;

    invoke-virtual {v0}, Landroid/support/v4/a/i;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public e()I
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/i$a;->a:Landroid/support/v4/a/i;

    invoke-virtual {v0}, Landroid/support/v4/a/i;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    goto :goto_0
.end method
