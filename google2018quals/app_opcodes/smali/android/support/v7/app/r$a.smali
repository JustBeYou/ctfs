.class public Landroid/support/v7/app/r$a;
.super Landroid/support/v7/view/b;

# interfaces
.implements Landroid/support/v7/view/menu/h$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/app/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Landroid/support/v7/app/r;

.field private final b:Landroid/content/Context;

.field private final c:Landroid/support/v7/view/menu/h;

.field private d:Landroid/support/v7/view/b$a;

.field private e:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/support/v7/app/r;Landroid/content/Context;Landroid/support/v7/view/b$a;)V
    .locals 2

    iput-object p1, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    invoke-direct {p0}, Landroid/support/v7/view/b;-><init>()V

    iput-object p2, p0, Landroid/support/v7/app/r$a;->b:Landroid/content/Context;

    iput-object p3, p0, Landroid/support/v7/app/r$a;->d:Landroid/support/v7/view/b$a;

    new-instance v0, Landroid/support/v7/view/menu/h;

    invoke-direct {v0, p2}, Landroid/support/v7/view/menu/h;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/view/menu/h;->a(I)Landroid/support/v7/view/menu/h;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/app/r$a;->c:Landroid/support/v7/view/menu/h;

    iget-object v0, p0, Landroid/support/v7/app/r$a;->c:Landroid/support/v7/view/menu/h;

    invoke-virtual {v0, p0}, Landroid/support/v7/view/menu/h;->a(Landroid/support/v7/view/menu/h$a;)V

    return-void
.end method


# virtual methods
.method public a()Landroid/view/MenuInflater;
    .locals 2

    new-instance v0, Landroid/support/v7/view/g;

    iget-object v1, p0, Landroid/support/v7/app/r$a;->b:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/support/v7/view/g;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public a(I)V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/app/r$a;->b(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public a(Landroid/support/v7/view/menu/h;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/app/r$a;->d:Landroid/support/v7/view/b$a;

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/support/v7/app/r$a;->d()V

    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->e:Landroid/support/v7/widget/ActionBarContextView;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionBarContextView;->a()Z

    goto :goto_0
.end method

.method public a(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->e:Landroid/support/v7/widget/ActionBarContextView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/ActionBarContextView;->setCustomView(Landroid/view/View;)V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroid/support/v7/app/r$a;->e:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public a(Ljava/lang/CharSequence;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->e:Landroid/support/v7/widget/ActionBarContextView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/ActionBarContextView;->setSubtitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public a(Z)V
    .locals 1

    invoke-super {p0, p1}, Landroid/support/v7/view/b;->a(Z)V

    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->e:Landroid/support/v7/widget/ActionBarContextView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/ActionBarContextView;->setTitleOptional(Z)V

    return-void
.end method

.method public a(Landroid/support/v7/view/menu/h;Landroid/view/MenuItem;)Z
    .locals 1

    iget-object v0, p0, Landroid/support/v7/app/r$a;->d:Landroid/support/v7/view/b$a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/app/r$a;->d:Landroid/support/v7/view/b$a;

    invoke-interface {v0, p0, p2}, Landroid/support/v7/view/b$a;->a(Landroid/support/v7/view/b;Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public b()Landroid/view/Menu;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/app/r$a;->c:Landroid/support/v7/view/menu/h;

    return-object v0
.end method

.method public b(I)V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/app/r$a;->a(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public b(Ljava/lang/CharSequence;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->e:Landroid/support/v7/widget/ActionBarContextView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/ActionBarContextView;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public c()V
    .locals 4

    const/4 v3, 0x0

    const/4 v2, 0x0

    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->h:Landroid/support/v7/app/r$a;

    if-eq v0, p0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iget-boolean v0, v0, Landroid/support/v7/app/r;->l:Z

    iget-object v1, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iget-boolean v1, v1, Landroid/support/v7/app/r;->m:Z

    invoke-static {v0, v1, v2}, Landroid/support/v7/app/r;->a(ZZZ)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iput-object p0, v0, Landroid/support/v7/app/r;->i:Landroid/support/v7/view/b;

    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iget-object v1, p0, Landroid/support/v7/app/r$a;->d:Landroid/support/v7/view/b$a;

    iput-object v1, v0, Landroid/support/v7/app/r;->j:Landroid/support/v7/view/b$a;

    :goto_1
    iput-object v3, p0, Landroid/support/v7/app/r$a;->d:Landroid/support/v7/view/b$a;

    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    invoke-virtual {v0, v2}, Landroid/support/v7/app/r;->j(Z)V

    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->e:Landroid/support/v7/widget/ActionBarContextView;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionBarContextView;->b()V

    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->d:Landroid/support/v7/widget/ad;

    invoke-interface {v0}, Landroid/support/v7/widget/ad;->a()Landroid/view/ViewGroup;

    move-result-object v0

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->sendAccessibilityEvent(I)V

    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->b:Landroid/support/v7/widget/ActionBarOverlayLayout;

    iget-object v1, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iget-boolean v1, v1, Landroid/support/v7/app/r;->o:Z

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/ActionBarOverlayLayout;->setHideOnContentScrollEnabled(Z)V

    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iput-object v3, v0, Landroid/support/v7/app/r;->h:Landroid/support/v7/app/r$a;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Landroid/support/v7/app/r$a;->d:Landroid/support/v7/view/b$a;

    invoke-interface {v0, p0}, Landroid/support/v7/view/b$a;->a(Landroid/support/v7/view/b;)V

    goto :goto_1
.end method

.method public d()V
    .locals 2

    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->h:Landroid/support/v7/app/r$a;

    if-eq v0, p0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Landroid/support/v7/app/r$a;->c:Landroid/support/v7/view/menu/h;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/h;->g()V

    :try_start_0
    iget-object v0, p0, Landroid/support/v7/app/r$a;->d:Landroid/support/v7/view/b$a;

    iget-object v1, p0, Landroid/support/v7/app/r$a;->c:Landroid/support/v7/view/menu/h;

    invoke-interface {v0, p0, v1}, Landroid/support/v7/view/b$a;->b(Landroid/support/v7/view/b;Landroid/view/Menu;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Landroid/support/v7/app/r$a;->c:Landroid/support/v7/view/menu/h;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/h;->h()V

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Landroid/support/v7/app/r$a;->c:Landroid/support/v7/view/menu/h;

    invoke-virtual {v1}, Landroid/support/v7/view/menu/h;->h()V

    throw v0
.end method

.method public e()Z
    .locals 2

    iget-object v0, p0, Landroid/support/v7/app/r$a;->c:Landroid/support/v7/view/menu/h;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/h;->g()V

    :try_start_0
    iget-object v0, p0, Landroid/support/v7/app/r$a;->d:Landroid/support/v7/view/b$a;

    iget-object v1, p0, Landroid/support/v7/app/r$a;->c:Landroid/support/v7/view/menu/h;

    invoke-interface {v0, p0, v1}, Landroid/support/v7/view/b$a;->a(Landroid/support/v7/view/b;Landroid/view/Menu;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    iget-object v1, p0, Landroid/support/v7/app/r$a;->c:Landroid/support/v7/view/menu/h;

    invoke-virtual {v1}, Landroid/support/v7/view/menu/h;->h()V

    return v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Landroid/support/v7/app/r$a;->c:Landroid/support/v7/view/menu/h;

    invoke-virtual {v1}, Landroid/support/v7/view/menu/h;->h()V

    throw v0
.end method

.method public f()Ljava/lang/CharSequence;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->e:Landroid/support/v7/widget/ActionBarContextView;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionBarContextView;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public g()Ljava/lang/CharSequence;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->e:Landroid/support/v7/widget/ActionBarContextView;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionBarContextView;->getSubtitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public h()Z
    .locals 1

    iget-object v0, p0, Landroid/support/v7/app/r$a;->a:Landroid/support/v7/app/r;

    iget-object v0, v0, Landroid/support/v7/app/r;->e:Landroid/support/v7/widget/ActionBarContextView;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionBarContextView;->d()Z

    move-result v0

    return v0
.end method

.method public i()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/app/r$a;->e:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/app/r$a;->e:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
