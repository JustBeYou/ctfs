.class public Landroid/support/v4/a/i;
.super Landroid/support/v4/a/f;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/a/i$a;,
        Landroid/support/v4/a/i$b;
    }
.end annotation


# instance fields
.field final c:Landroid/os/Handler;

.field final d:Landroid/support/v4/a/k;

.field e:Z

.field f:Z

.field g:Z

.field h:Z

.field i:Z

.field j:I

.field k:Landroid/support/v4/g/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/g/l",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x1

    invoke-direct {p0}, Landroid/support/v4/a/f;-><init>()V

    new-instance v0, Landroid/support/v4/a/i$1;

    invoke-direct {v0, p0}, Landroid/support/v4/a/i$1;-><init>(Landroid/support/v4/a/i;)V

    iput-object v0, p0, Landroid/support/v4/a/i;->c:Landroid/os/Handler;

    new-instance v0, Landroid/support/v4/a/i$a;

    invoke-direct {v0, p0}, Landroid/support/v4/a/i$a;-><init>(Landroid/support/v4/a/i;)V

    invoke-static {v0}, Landroid/support/v4/a/k;->a(Landroid/support/v4/a/l;)Landroid/support/v4/a/k;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    iput-boolean v1, p0, Landroid/support/v4/a/i;->g:Z

    iput-boolean v1, p0, Landroid/support/v4/a/i;->h:Z

    return-void
.end method

.method private static a(Landroid/support/v4/a/m;Landroid/arch/lifecycle/b$b;)V
    .locals 3

    invoke-virtual {p0}, Landroid/support/v4/a/m;->b()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/a/h;

    if-eqz v0, :cond_0

    iget-object v2, v0, Landroid/support/v4/a/h;->U:Landroid/arch/lifecycle/d;

    invoke-virtual {v2, p1}, Landroid/arch/lifecycle/d;->a(Landroid/arch/lifecycle/b$b;)V

    invoke-virtual {v0}, Landroid/support/v4/a/h;->g()Landroid/support/v4/a/m;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/a/i;->a(Landroid/support/v4/a/m;Landroid/arch/lifecycle/b$b;)V

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public a()Landroid/arch/lifecycle/b;
    .locals 1

    invoke-super {p0}, Landroid/support/v4/a/f;->a()Landroid/arch/lifecycle/b;

    move-result-object v0

    return-object v0
.end method

.method final a(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/support/v4/a/k;->a(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public a(Landroid/support/v4/a/h;)V
    .locals 0

    return-void
.end method

.method a(Z)V
    .locals 2

    const/4 v1, 0x1

    iget-boolean v0, p0, Landroid/support/v4/a/i;->h:Z

    if-nez v0, :cond_1

    iput-boolean v1, p0, Landroid/support/v4/a/i;->h:Z

    iput-boolean p1, p0, Landroid/support/v4/a/i;->i:Z

    iget-object v0, p0, Landroid/support/v4/a/i;->c:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    invoke-virtual {p0}, Landroid/support/v4/a/i;->e()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-eqz p1, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->o()V

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0, v1}, Landroid/support/v4/a/k;->c(Z)V

    goto :goto_0
.end method

.method protected a(Landroid/view/View;Landroid/view/Menu;)Z
    .locals 1

    const/4 v0, 0x0

    invoke-super {p0, v0, p1, p2}, Landroid/support/v4/a/f;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method protected b()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->h()V

    return-void
.end method

.method public c()Ljava/lang/Object;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public d()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Landroid/support/v4/a/i;->invalidateOptionsMenu()V

    return-void
.end method

.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 2

    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v4/a/f;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "Local FragmentActivity "

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, " State:"

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v1, "mCreated="

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v1, p0, Landroid/support/v4/a/i;->e:Z

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Z)V

    const-string v1, "mResumed="

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v1, p0, Landroid/support/v4/a/i;->f:Z

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Z)V

    const-string v1, " mStopped="

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v1, p0, Landroid/support/v4/a/i;->g:Z

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Z)V

    const-string v1, " mReallyStopped="

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v1, p0, Landroid/support/v4/a/i;->h:Z

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Z)V

    iget-object v1, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v1, v0, p2, p3, p4}, Landroid/support/v4/a/k;->a(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->a()Landroid/support/v4/a/m;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/support/v4/a/m;->a(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    return-void
.end method

.method e()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    iget-boolean v1, p0, Landroid/support/v4/a/i;->i:Z

    invoke-virtual {v0, v1}, Landroid/support/v4/a/k;->c(Z)V

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->k()V

    return-void
.end method

.method public f()Landroid/support/v4/a/m;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->a()Landroid/support/v4/a/m;

    move-result-object v0

    return-object v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 4

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->b()V

    shr-int/lit8 v0, p1, 0x10

    if-eqz v0, :cond_2

    add-int/lit8 v1, v0, -0x1

    iget-object v0, p0, Landroid/support/v4/a/i;->k:Landroid/support/v4/g/l;

    invoke-virtual {v0, v1}, Landroid/support/v4/g/l;->a(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v2, p0, Landroid/support/v4/a/i;->k:Landroid/support/v4/g/l;

    invoke-virtual {v2, v1}, Landroid/support/v4/g/l;->c(I)V

    if-nez v0, :cond_0

    const-string v0, "FragmentActivity"

    const-string v1, "Activity result delivered for unknown Fragment."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v1, v0}, Landroid/support/v4/a/k;->a(Ljava/lang/String;)Landroid/support/v4/a/h;

    move-result-object v1

    if-nez v1, :cond_1

    const-string v1, "FragmentActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Activity result no fragment exists for who: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const v0, 0xffff

    and-int/2addr v0, p1

    invoke-virtual {v1, v0, p2, p3}, Landroid/support/v4/a/h;->a(IILandroid/content/Intent;)V

    goto :goto_0

    :cond_2
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/a/f;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0
.end method

.method public onBackPressed()V
    .locals 4

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->a()Landroid/support/v4/a/m;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/a/m;->c()Z

    move-result v1

    if-eqz v1, :cond_1

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x19

    if-gt v2, v3, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-nez v1, :cond_2

    invoke-virtual {v0}, Landroid/support/v4/a/m;->a()Z

    move-result v0

    if-nez v0, :cond_0

    :cond_2
    invoke-super {p0}, Landroid/support/v4/a/f;->onBackPressed()V

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/support/v4/a/f;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/k;->a(Landroid/content/res/Configuration;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0, v1}, Landroid/support/v4/a/k;->a(Landroid/support/v4/a/h;)V

    invoke-super {p0, p1}, Landroid/support/v4/a/f;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/support/v4/a/i;->getLastNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/a/i$b;

    if-eqz v0, :cond_0

    iget-object v3, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    iget-object v4, v0, Landroid/support/v4/a/i$b;->c:Landroid/support/v4/g/k;

    invoke-virtual {v3, v4}, Landroid/support/v4/a/k;->a(Landroid/support/v4/g/k;)V

    :cond_0
    if-eqz p1, :cond_2

    const-string v3, "android:support:fragments"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    iget-object v4, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    if-eqz v0, :cond_4

    iget-object v0, v0, Landroid/support/v4/a/i$b;->b:Landroid/support/v4/a/o;

    :goto_0
    invoke-virtual {v4, v3, v0}, Landroid/support/v4/a/k;->a(Landroid/os/Parcelable;Landroid/support/v4/a/o;)V

    const-string v0, "android:support:next_request_index"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "android:support:next_request_index"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/support/v4/a/i;->j:I

    const-string v0, "android:support:request_indicies"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v1

    const-string v0, "android:support:request_fragment_who"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    if-eqz v1, :cond_1

    if-eqz v3, :cond_1

    array-length v0, v1

    array-length v4, v3

    if-eq v0, v4, :cond_5

    :cond_1
    const-string v0, "FragmentActivity"

    const-string v1, "Invalid requestCode mapping in savedInstanceState."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    iget-object v0, p0, Landroid/support/v4/a/i;->k:Landroid/support/v4/g/l;

    if-nez v0, :cond_3

    new-instance v0, Landroid/support/v4/g/l;

    invoke-direct {v0}, Landroid/support/v4/g/l;-><init>()V

    iput-object v0, p0, Landroid/support/v4/a/i;->k:Landroid/support/v4/g/l;

    iput v2, p0, Landroid/support/v4/a/i;->j:I

    :cond_3
    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->e()V

    return-void

    :cond_4
    move-object v0, v1

    goto :goto_0

    :cond_5
    new-instance v0, Landroid/support/v4/g/l;

    array-length v4, v1

    invoke-direct {v0, v4}, Landroid/support/v4/g/l;-><init>(I)V

    iput-object v0, p0, Landroid/support/v4/a/i;->k:Landroid/support/v4/g/l;

    move v0, v2

    :goto_1
    array-length v4, v1

    if-ge v0, v4, :cond_2

    iget-object v4, p0, Landroid/support/v4/a/i;->k:Landroid/support/v4/g/l;

    aget v5, v1, v0

    aget-object v6, v3, v0

    invoke-virtual {v4, v5, v6}, Landroid/support/v4/g/l;->b(ILjava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public onCreatePanelMenu(ILandroid/view/Menu;)Z
    .locals 3

    if-nez p1, :cond_0

    invoke-super {p0, p1, p2}, Landroid/support/v4/a/f;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result v0

    iget-object v1, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {p0}, Landroid/support/v4/a/i;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v2

    invoke-virtual {v1, p2, v2}, Landroid/support/v4/a/k;->a(Landroid/view/Menu;Landroid/view/MenuInflater;)Z

    move-result v1

    or-int/2addr v0, v1

    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/support/v4/a/f;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result v0

    goto :goto_0
.end method

.method public bridge synthetic onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 1

    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v4/a/f;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 1

    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/a/f;->onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected onDestroy()V
    .locals 1

    invoke-super {p0}, Landroid/support/v4/a/f;->onDestroy()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v4/a/i;->a(Z)V

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->l()V

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->p()V

    return-void
.end method

.method public onLowMemory()V
    .locals 1

    invoke-super {p0}, Landroid/support/v4/a/f;->onLowMemory()V

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->m()V

    return-void
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .locals 1

    invoke-super {p0, p1, p2}, Landroid/support/v4/a/f;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    sparse-switch p1, :sswitch_data_0

    const/4 v0, 0x0

    goto :goto_0

    :sswitch_0
    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0, p2}, Landroid/support/v4/a/k;->a(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0

    :sswitch_1
    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0, p2}, Landroid/support/v4/a/k;->b(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x6 -> :sswitch_1
    .end sparse-switch
.end method

.method public onMultiWindowModeChanged(Z)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/k;->a(Z)V

    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/support/v4/a/f;->onNewIntent(Landroid/content/Intent;)V

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->b()V

    return-void
.end method

.method public onPanelClosed(ILandroid/view/Menu;)V
    .locals 1

    packed-switch p1, :pswitch_data_0

    :goto_0
    invoke-super {p0, p1, p2}, Landroid/support/v4/a/f;->onPanelClosed(ILandroid/view/Menu;)V

    return-void

    :pswitch_0
    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0, p2}, Landroid/support/v4/a/k;->b(Landroid/view/Menu;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method protected onPause()V
    .locals 2

    const/4 v1, 0x2

    invoke-super {p0}, Landroid/support/v4/a/f;->onPause()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/a/i;->f:Z

    iget-object v0, p0, Landroid/support/v4/a/i;->c:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/a/i;->c:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    invoke-virtual {p0}, Landroid/support/v4/a/i;->b()V

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->i()V

    return-void
.end method

.method public onPictureInPictureModeChanged(Z)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/k;->b(Z)V

    return-void
.end method

.method protected onPostResume()V
    .locals 2

    invoke-super {p0}, Landroid/support/v4/a/f;->onPostResume()V

    iget-object v0, p0, Landroid/support/v4/a/i;->c:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    invoke-virtual {p0}, Landroid/support/v4/a/i;->b()V

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->n()Z

    return-void
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .locals 2

    if-nez p1, :cond_0

    if-eqz p3, :cond_0

    invoke-virtual {p0, p2, p3}, Landroid/support/v4/a/i;->a(Landroid/view/View;Landroid/view/Menu;)Z

    move-result v0

    iget-object v1, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v1, p3}, Landroid/support/v4/a/k;->a(Landroid/view/Menu;)Z

    move-result v1

    or-int/2addr v0, v1

    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/a/f;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v0

    goto :goto_0
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 4

    const v3, 0xffff

    shr-int/lit8 v0, p1, 0x10

    and-int/2addr v0, v3

    if-eqz v0, :cond_0

    add-int/lit8 v1, v0, -0x1

    iget-object v0, p0, Landroid/support/v4/a/i;->k:Landroid/support/v4/g/l;

    invoke-virtual {v0, v1}, Landroid/support/v4/g/l;->a(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v2, p0, Landroid/support/v4/a/i;->k:Landroid/support/v4/g/l;

    invoke-virtual {v2, v1}, Landroid/support/v4/g/l;->c(I)V

    if-nez v0, :cond_1

    const-string v0, "FragmentActivity"

    const-string v1, "Activity result delivered for unknown Fragment."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v1, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v1, v0}, Landroid/support/v4/a/k;->a(Ljava/lang/String;)Landroid/support/v4/a/h;

    move-result-object v1

    if-nez v1, :cond_2

    const-string v1, "FragmentActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Activity result no fragment exists for who: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_2
    and-int v0, p1, v3

    invoke-virtual {v1, v0, p2, p3}, Landroid/support/v4/a/h;->a(I[Ljava/lang/String;[I)V

    goto :goto_0
.end method

.method protected onResume()V
    .locals 2

    invoke-super {p0}, Landroid/support/v4/a/f;->onResume()V

    iget-object v0, p0, Landroid/support/v4/a/i;->c:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/a/i;->f:Z

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->n()Z

    return-void
.end method

.method public final onRetainNonConfigurationInstance()Ljava/lang/Object;
    .locals 4

    iget-boolean v0, p0, Landroid/support/v4/a/i;->g:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/v4/a/i;->a(Z)V

    :cond_0
    invoke-virtual {p0}, Landroid/support/v4/a/i;->c()Ljava/lang/Object;

    move-result-object v1

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->d()Landroid/support/v4/a/o;

    move-result-object v2

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->r()Landroid/support/v4/g/k;

    move-result-object v3

    if-nez v2, :cond_1

    if-nez v3, :cond_1

    if-nez v1, :cond_1

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Landroid/support/v4/a/i$b;

    invoke-direct {v0}, Landroid/support/v4/a/i$b;-><init>()V

    iput-object v1, v0, Landroid/support/v4/a/i$b;->a:Ljava/lang/Object;

    iput-object v2, v0, Landroid/support/v4/a/i$b;->b:Landroid/support/v4/a/o;

    iput-object v3, v0, Landroid/support/v4/a/i$b;->c:Landroid/support/v4/g/k;

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 4

    invoke-super {p0, p1}, Landroid/support/v4/a/f;->onSaveInstanceState(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/support/v4/a/i;->f()Landroid/support/v4/a/m;

    move-result-object v0

    sget-object v1, Landroid/arch/lifecycle/b$b;->c:Landroid/arch/lifecycle/b$b;

    invoke-static {v0, v1}, Landroid/support/v4/a/i;->a(Landroid/support/v4/a/m;Landroid/arch/lifecycle/b$b;)V

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->c()Landroid/os/Parcelable;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "android:support:fragments"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/i;->k:Landroid/support/v4/g/l;

    invoke-virtual {v0}, Landroid/support/v4/g/l;->b()I

    move-result v0

    if-lez v0, :cond_2

    const-string v0, "android:support:next_request_index"

    iget v1, p0, Landroid/support/v4/a/i;->j:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object v0, p0, Landroid/support/v4/a/i;->k:Landroid/support/v4/g/l;

    invoke-virtual {v0}, Landroid/support/v4/g/l;->b()I

    move-result v0

    new-array v2, v0, [I

    iget-object v0, p0, Landroid/support/v4/a/i;->k:Landroid/support/v4/g/l;

    invoke-virtual {v0}, Landroid/support/v4/g/l;->b()I

    move-result v0

    new-array v3, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v0, p0, Landroid/support/v4/a/i;->k:Landroid/support/v4/g/l;

    invoke-virtual {v0}, Landroid/support/v4/g/l;->b()I

    move-result v0

    if-ge v1, v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/a/i;->k:Landroid/support/v4/g/l;

    invoke-virtual {v0, v1}, Landroid/support/v4/g/l;->d(I)I

    move-result v0

    aput v0, v2, v1

    iget-object v0, p0, Landroid/support/v4/a/i;->k:Landroid/support/v4/g/l;

    invoke-virtual {v0, v1}, Landroid/support/v4/g/l;->e(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    aput-object v0, v3, v1

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_1
    const-string v0, "android:support:request_indicies"

    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    const-string v0, "android:support:request_fragment_who"

    invoke-virtual {p1, v0, v3}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method protected onStart()V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, 0x0

    invoke-super {p0}, Landroid/support/v4/a/f;->onStart()V

    iput-boolean v0, p0, Landroid/support/v4/a/i;->g:Z

    iput-boolean v0, p0, Landroid/support/v4/a/i;->h:Z

    iget-object v0, p0, Landroid/support/v4/a/i;->c:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-boolean v0, p0, Landroid/support/v4/a/i;->e:Z

    if-nez v0, :cond_0

    iput-boolean v1, p0, Landroid/support/v4/a/i;->e:Z

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->f()V

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->b()V

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->n()Z

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->o()V

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->g()V

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->q()V

    return-void
.end method

.method public onStateNotSaved()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->b()V

    return-void
.end method

.method protected onStop()V
    .locals 3

    const/4 v2, 0x1

    invoke-super {p0}, Landroid/support/v4/a/f;->onStop()V

    iput-boolean v2, p0, Landroid/support/v4/a/i;->g:Z

    invoke-virtual {p0}, Landroid/support/v4/a/i;->f()Landroid/support/v4/a/m;

    move-result-object v0

    sget-object v1, Landroid/arch/lifecycle/b$b;->c:Landroid/arch/lifecycle/b$b;

    invoke-static {v0, v1}, Landroid/support/v4/a/i;->a(Landroid/support/v4/a/m;Landroid/arch/lifecycle/b$b;)V

    iget-object v0, p0, Landroid/support/v4/a/i;->c:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    iget-object v0, p0, Landroid/support/v4/a/i;->d:Landroid/support/v4/a/k;

    invoke-virtual {v0}, Landroid/support/v4/a/k;->j()V

    return-void
.end method

.method public startActivityForResult(Landroid/content/Intent;I)V
    .locals 1

    iget-boolean v0, p0, Landroid/support/v4/a/i;->b:Z

    if-nez v0, :cond_0

    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    invoke-static {p2}, Landroid/support/v4/a/i;->a(I)V

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/support/v4/a/f;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public bridge synthetic startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/a/f;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    return-void
.end method

.method public bridge synthetic startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;III)V
    .locals 0

    invoke-super/range {p0 .. p6}, Landroid/support/v4/a/f;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;III)V

    return-void
.end method

.method public bridge synthetic startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;IIILandroid/os/Bundle;)V
    .locals 0

    invoke-super/range {p0 .. p7}, Landroid/support/v4/a/f;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;IIILandroid/os/Bundle;)V

    return-void
.end method
