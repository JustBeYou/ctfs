.class public Landroid/support/v4/a/aa;
.super Landroid/app/Activity;

# interfaces
.implements Landroid/arch/lifecycle/c;


# instance fields
.field private a:Landroid/support/v4/g/k;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/g/k",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private b:Landroid/arch/lifecycle/d;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    new-instance v0, Landroid/support/v4/g/k;

    invoke-direct {v0}, Landroid/support/v4/g/k;-><init>()V

    iput-object v0, p0, Landroid/support/v4/a/aa;->a:Landroid/support/v4/g/k;

    new-instance v0, Landroid/arch/lifecycle/d;

    invoke-direct {v0, p0}, Landroid/arch/lifecycle/d;-><init>(Landroid/arch/lifecycle/c;)V

    iput-object v0, p0, Landroid/support/v4/a/aa;->b:Landroid/arch/lifecycle/d;

    return-void
.end method


# virtual methods
.method public a()Landroid/arch/lifecycle/b;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/a/aa;->b:Landroid/arch/lifecycle/d;

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Landroid/arch/lifecycle/g;->a(Landroid/app/Activity;)V

    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/a/aa;->b:Landroid/arch/lifecycle/d;

    sget-object v1, Landroid/arch/lifecycle/b$b;->c:Landroid/arch/lifecycle/b$b;

    invoke-virtual {v0, v1}, Landroid/arch/lifecycle/d;->a(Landroid/arch/lifecycle/b$b;)V

    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method
