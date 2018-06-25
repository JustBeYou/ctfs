.class public Landroid/support/v4/a/k;
.super Ljava/lang/Object;


# instance fields
.field private final a:Landroid/support/v4/a/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/a/l",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Landroid/support/v4/a/l;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/a/l",
            "<*>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    return-void
.end method

.method public static final a(Landroid/support/v4/a/l;)Landroid/support/v4/a/k;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/a/l",
            "<*>;)",
            "Landroid/support/v4/a/k;"
        }
    .end annotation

    new-instance v0, Landroid/support/v4/a/k;

    invoke-direct {v0, p0}, Landroid/support/v4/a/k;-><init>(Landroid/support/v4/a/l;)V

    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/String;)Landroid/support/v4/a/h;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/n;->b(Ljava/lang/String;)Landroid/support/v4/a/h;

    move-result-object v0

    return-object v0
.end method

.method public a()Landroid/support/v4/a/m;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    invoke-virtual {v0}, Landroid/support/v4/a/l;->i()Landroid/support/v4/a/n;

    move-result-object v0

    return-object v0
.end method

.method public a(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/support/v4/a/n;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public a(Landroid/content/res/Configuration;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/n;->a(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public a(Landroid/os/Parcelable;Landroid/support/v4/a/o;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/a/n;->a(Landroid/os/Parcelable;Landroid/support/v4/a/o;)V

    return-void
.end method

.method public a(Landroid/support/v4/a/h;)V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    iget-object v1, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v2, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    invoke-virtual {v0, v1, v2, p1}, Landroid/support/v4/a/n;->a(Landroid/support/v4/a/l;Landroid/support/v4/a/j;Landroid/support/v4/a/h;)V

    return-void
.end method

.method public a(Landroid/support/v4/g/k;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/g/k",
            "<",
            "Ljava/lang/String;",
            "Landroid/support/v4/a/u;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/l;->a(Landroid/support/v4/g/k;)V

    return-void
.end method

.method public a(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/support/v4/a/l;->b(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    return-void
.end method

.method public a(Z)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/n;->a(Z)V

    return-void
.end method

.method public a(Landroid/view/Menu;)Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/n;->a(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method public a(Landroid/view/Menu;Landroid/view/MenuInflater;)Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/a/n;->a(Landroid/view/Menu;Landroid/view/MenuInflater;)Z

    move-result v0

    return v0
.end method

.method public a(Landroid/view/MenuItem;)Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/n;->a(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public b()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->k()V

    return-void
.end method

.method public b(Landroid/view/Menu;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/n;->b(Landroid/view/Menu;)V

    return-void
.end method

.method public b(Z)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/n;->b(Z)V

    return-void
.end method

.method public b(Landroid/view/MenuItem;)Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/n;->b(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public c()Landroid/os/Parcelable;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->j()Landroid/os/Parcelable;

    move-result-object v0

    return-object v0
.end method

.method public c(Z)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    invoke-virtual {v0, p1}, Landroid/support/v4/a/l;->a(Z)V

    return-void
.end method

.method public d()Landroid/support/v4/a/o;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->h()Landroid/support/v4/a/o;

    move-result-object v0

    return-object v0
.end method

.method public e()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->l()V

    return-void
.end method

.method public f()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->m()V

    return-void
.end method

.method public g()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->n()V

    return-void
.end method

.method public h()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->o()V

    return-void
.end method

.method public i()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->p()V

    return-void
.end method

.method public j()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->q()V

    return-void
.end method

.method public k()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->r()V

    return-void
.end method

.method public l()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->t()V

    return-void
.end method

.method public m()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->u()V

    return-void
.end method

.method public n()Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    iget-object v0, v0, Landroid/support/v4/a/l;->d:Landroid/support/v4/a/n;

    invoke-virtual {v0}, Landroid/support/v4/a/n;->e()Z

    move-result v0

    return v0
.end method

.method public o()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    invoke-virtual {v0}, Landroid/support/v4/a/l;->k()V

    return-void
.end method

.method public p()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    invoke-virtual {v0}, Landroid/support/v4/a/l;->l()V

    return-void
.end method

.method public q()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    invoke-virtual {v0}, Landroid/support/v4/a/l;->m()V

    return-void
.end method

.method public r()Landroid/support/v4/g/k;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/support/v4/g/k",
            "<",
            "Ljava/lang/String;",
            "Landroid/support/v4/a/u;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/a/k;->a:Landroid/support/v4/a/l;

    invoke-virtual {v0}, Landroid/support/v4/a/l;->n()Landroid/support/v4/g/k;

    move-result-object v0

    return-object v0
.end method
