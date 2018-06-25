.class public final Landroid/support/v4/h/g;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/h/g$a;,
        Landroid/support/v4/h/g$b;,
        Landroid/support/v4/h/g$c;
    }
.end annotation


# static fields
.field static final a:Landroid/support/v4/h/g$c;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    new-instance v0, Landroid/support/v4/h/g$a;

    invoke-direct {v0}, Landroid/support/v4/h/g$a;-><init>()V

    sput-object v0, Landroid/support/v4/h/g;->a:Landroid/support/v4/h/g$c;

    :goto_0
    return-void

    :cond_0
    new-instance v0, Landroid/support/v4/h/g$b;

    invoke-direct {v0}, Landroid/support/v4/h/g$b;-><init>()V

    sput-object v0, Landroid/support/v4/h/g;->a:Landroid/support/v4/h/g$c;

    goto :goto_0
.end method

.method public static a(Landroid/view/MenuItem;Landroid/support/v4/h/c;)Landroid/view/MenuItem;
    .locals 2

    instance-of v0, p0, Landroid/support/v4/d/a/b;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/support/v4/d/a/b;

    invoke-interface {p0, p1}, Landroid/support/v4/d/a/b;->a(Landroid/support/v4/h/c;)Landroid/support/v4/d/a/b;

    move-result-object p0

    :goto_0
    return-object p0

    :cond_0
    const-string v0, "MenuItemCompat"

    const-string v1, "setActionProvider: item does not implement SupportMenuItem; ignoring"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static a(Landroid/view/MenuItem;CI)V
    .locals 1

    instance-of v0, p0, Landroid/support/v4/d/a/b;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/support/v4/d/a/b;

    invoke-interface {p0, p1, p2}, Landroid/support/v4/d/a/b;->setNumericShortcut(CI)Landroid/view/MenuItem;

    :goto_0
    return-void

    :cond_0
    sget-object v0, Landroid/support/v4/h/g;->a:Landroid/support/v4/h/g$c;

    invoke-interface {v0, p0, p1, p2}, Landroid/support/v4/h/g$c;->b(Landroid/view/MenuItem;CI)V

    goto :goto_0
.end method

.method public static a(Landroid/view/MenuItem;Landroid/content/res/ColorStateList;)V
    .locals 1

    instance-of v0, p0, Landroid/support/v4/d/a/b;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/support/v4/d/a/b;

    invoke-interface {p0, p1}, Landroid/support/v4/d/a/b;->setIconTintList(Landroid/content/res/ColorStateList;)Landroid/view/MenuItem;

    :goto_0
    return-void

    :cond_0
    sget-object v0, Landroid/support/v4/h/g;->a:Landroid/support/v4/h/g$c;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/h/g$c;->a(Landroid/view/MenuItem;Landroid/content/res/ColorStateList;)V

    goto :goto_0
.end method

.method public static a(Landroid/view/MenuItem;Landroid/graphics/PorterDuff$Mode;)V
    .locals 1

    instance-of v0, p0, Landroid/support/v4/d/a/b;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/support/v4/d/a/b;

    invoke-interface {p0, p1}, Landroid/support/v4/d/a/b;->setIconTintMode(Landroid/graphics/PorterDuff$Mode;)Landroid/view/MenuItem;

    :goto_0
    return-void

    :cond_0
    sget-object v0, Landroid/support/v4/h/g;->a:Landroid/support/v4/h/g$c;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/h/g$c;->a(Landroid/view/MenuItem;Landroid/graphics/PorterDuff$Mode;)V

    goto :goto_0
.end method

.method public static a(Landroid/view/MenuItem;Ljava/lang/CharSequence;)V
    .locals 1

    instance-of v0, p0, Landroid/support/v4/d/a/b;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/support/v4/d/a/b;

    invoke-interface {p0, p1}, Landroid/support/v4/d/a/b;->a(Ljava/lang/CharSequence;)Landroid/support/v4/d/a/b;

    :goto_0
    return-void

    :cond_0
    sget-object v0, Landroid/support/v4/h/g;->a:Landroid/support/v4/h/g$c;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/h/g$c;->a(Landroid/view/MenuItem;Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public static b(Landroid/view/MenuItem;CI)V
    .locals 1

    instance-of v0, p0, Landroid/support/v4/d/a/b;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/support/v4/d/a/b;

    invoke-interface {p0, p1, p2}, Landroid/support/v4/d/a/b;->setAlphabeticShortcut(CI)Landroid/view/MenuItem;

    :goto_0
    return-void

    :cond_0
    sget-object v0, Landroid/support/v4/h/g;->a:Landroid/support/v4/h/g$c;

    invoke-interface {v0, p0, p1, p2}, Landroid/support/v4/h/g$c;->a(Landroid/view/MenuItem;CI)V

    goto :goto_0
.end method

.method public static b(Landroid/view/MenuItem;Ljava/lang/CharSequence;)V
    .locals 1

    instance-of v0, p0, Landroid/support/v4/d/a/b;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/support/v4/d/a/b;

    invoke-interface {p0, p1}, Landroid/support/v4/d/a/b;->b(Ljava/lang/CharSequence;)Landroid/support/v4/d/a/b;

    :goto_0
    return-void

    :cond_0
    sget-object v0, Landroid/support/v4/h/g;->a:Landroid/support/v4/h/g$c;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/h/g$c;->b(Landroid/view/MenuItem;Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
