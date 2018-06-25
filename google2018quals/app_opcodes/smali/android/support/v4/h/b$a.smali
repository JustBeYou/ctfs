.class Landroid/support/v4/h/b$a;
.super Landroid/support/v4/h/b$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/h/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/support/v4/h/b$b;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View$AccessibilityDelegate;Landroid/view/View;)Landroid/support/v4/h/a/b;
    .locals 2

    invoke-virtual {p1, p2}, Landroid/view/View$AccessibilityDelegate;->getAccessibilityNodeProvider(Landroid/view/View;)Landroid/view/accessibility/AccessibilityNodeProvider;

    move-result-object v1

    if-eqz v1, :cond_0

    new-instance v0, Landroid/support/v4/h/a/b;

    invoke-direct {v0, v1}, Landroid/support/v4/h/a/b;-><init>(Ljava/lang/Object;)V

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public a(Landroid/support/v4/h/b;)Landroid/view/View$AccessibilityDelegate;
    .locals 1

    new-instance v0, Landroid/support/v4/h/b$a$1;

    invoke-direct {v0, p0, p1}, Landroid/support/v4/h/b$a$1;-><init>(Landroid/support/v4/h/b$a;Landroid/support/v4/h/b;)V

    return-object v0
.end method

.method public a(Landroid/view/View$AccessibilityDelegate;Landroid/view/View;ILandroid/os/Bundle;)Z
    .locals 1

    invoke-virtual {p1, p2, p3, p4}, Landroid/view/View$AccessibilityDelegate;->performAccessibilityAction(Landroid/view/View;ILandroid/os/Bundle;)Z

    move-result v0

    return v0
.end method
