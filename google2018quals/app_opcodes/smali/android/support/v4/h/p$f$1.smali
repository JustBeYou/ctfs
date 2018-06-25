.class Landroid/support/v4/h/p$f$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/h/p$f;->a(Landroid/view/View;Landroid/support/v4/h/n;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/support/v4/h/n;

.field final synthetic b:Landroid/support/v4/h/p$f;


# direct methods
.method constructor <init>(Landroid/support/v4/h/p$f;Landroid/support/v4/h/n;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/h/p$f$1;->b:Landroid/support/v4/h/p$f;

    iput-object p2, p0, Landroid/support/v4/h/p$f$1;->a:Landroid/support/v4/h/n;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 2

    invoke-static {p2}, Landroid/support/v4/h/v;->a(Ljava/lang/Object;)Landroid/support/v4/h/v;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/h/p$f$1;->a:Landroid/support/v4/h/n;

    invoke-interface {v1, p1, v0}, Landroid/support/v4/h/n;->a(Landroid/view/View;Landroid/support/v4/h/v;)Landroid/support/v4/h/v;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/h/v;->a(Landroid/support/v4/h/v;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowInsets;

    return-object v0
.end method
