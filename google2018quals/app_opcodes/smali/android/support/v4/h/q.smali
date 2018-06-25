.class public final Landroid/support/v4/h/q;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/h/q$b;,
        Landroid/support/v4/h/q$a;,
        Landroid/support/v4/h/q$c;
    }
.end annotation


# static fields
.field static final a:Landroid/support/v4/h/q$c;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    new-instance v0, Landroid/support/v4/h/q$b;

    invoke-direct {v0}, Landroid/support/v4/h/q$b;-><init>()V

    sput-object v0, Landroid/support/v4/h/q;->a:Landroid/support/v4/h/q$c;

    :goto_0
    return-void

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_1

    new-instance v0, Landroid/support/v4/h/q$a;

    invoke-direct {v0}, Landroid/support/v4/h/q$a;-><init>()V

    sput-object v0, Landroid/support/v4/h/q;->a:Landroid/support/v4/h/q$c;

    goto :goto_0

    :cond_1
    new-instance v0, Landroid/support/v4/h/q$c;

    invoke-direct {v0}, Landroid/support/v4/h/q$c;-><init>()V

    sput-object v0, Landroid/support/v4/h/q;->a:Landroid/support/v4/h/q$c;

    goto :goto_0
.end method

.method public static a(Landroid/view/ViewParent;Landroid/view/View;I)V
    .locals 1

    instance-of v0, p0, Landroid/support/v4/h/l;

    if-eqz v0, :cond_1

    check-cast p0, Landroid/support/v4/h/l;

    invoke-interface {p0, p1, p2}, Landroid/support/v4/h/l;->a(Landroid/view/View;I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-nez p2, :cond_0

    sget-object v0, Landroid/support/v4/h/q;->a:Landroid/support/v4/h/q$c;

    invoke-virtual {v0, p0, p1}, Landroid/support/v4/h/q$c;->a(Landroid/view/ViewParent;Landroid/view/View;)V

    goto :goto_0
.end method

.method public static a(Landroid/view/ViewParent;Landroid/view/View;IIIII)V
    .locals 7

    instance-of v0, p0, Landroid/support/v4/h/l;

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Landroid/support/v4/h/l;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-interface/range {v0 .. v6}, Landroid/support/v4/h/l;->a(Landroid/view/View;IIIII)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-nez p6, :cond_0

    sget-object v0, Landroid/support/v4/h/q;->a:Landroid/support/v4/h/q$c;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v0 .. v6}, Landroid/support/v4/h/q$c;->a(Landroid/view/ViewParent;Landroid/view/View;IIII)V

    goto :goto_0
.end method

.method public static a(Landroid/view/ViewParent;Landroid/view/View;II[II)V
    .locals 6

    instance-of v0, p0, Landroid/support/v4/h/l;

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Landroid/support/v4/h/l;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Landroid/support/v4/h/l;->a(Landroid/view/View;II[II)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-nez p5, :cond_0

    sget-object v0, Landroid/support/v4/h/q;->a:Landroid/support/v4/h/q$c;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Landroid/support/v4/h/q$c;->a(Landroid/view/ViewParent;Landroid/view/View;II[I)V

    goto :goto_0
.end method

.method public static a(Landroid/view/ViewParent;Landroid/view/View;FF)Z
    .locals 1

    sget-object v0, Landroid/support/v4/h/q;->a:Landroid/support/v4/h/q$c;

    invoke-virtual {v0, p0, p1, p2, p3}, Landroid/support/v4/h/q$c;->a(Landroid/view/ViewParent;Landroid/view/View;FF)Z

    move-result v0

    return v0
.end method

.method public static a(Landroid/view/ViewParent;Landroid/view/View;FFZ)Z
    .locals 6

    sget-object v0, Landroid/support/v4/h/q;->a:Landroid/support/v4/h/q$c;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Landroid/support/v4/h/q$c;->a(Landroid/view/ViewParent;Landroid/view/View;FFZ)Z

    move-result v0

    return v0
.end method

.method public static a(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;II)Z
    .locals 1

    instance-of v0, p0, Landroid/support/v4/h/l;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/support/v4/h/l;

    invoke-interface {p0, p1, p2, p3, p4}, Landroid/support/v4/h/l;->a(Landroid/view/View;Landroid/view/View;II)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    if-nez p4, :cond_1

    sget-object v0, Landroid/support/v4/h/q;->a:Landroid/support/v4/h/q$c;

    invoke-virtual {v0, p0, p1, p2, p3}, Landroid/support/v4/h/q$c;->a(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;I)Z

    move-result v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static b(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;II)V
    .locals 1

    instance-of v0, p0, Landroid/support/v4/h/l;

    if-eqz v0, :cond_1

    check-cast p0, Landroid/support/v4/h/l;

    invoke-interface {p0, p1, p2, p3, p4}, Landroid/support/v4/h/l;->b(Landroid/view/View;Landroid/view/View;II)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-nez p4, :cond_0

    sget-object v0, Landroid/support/v4/h/q;->a:Landroid/support/v4/h/q$c;

    invoke-virtual {v0, p0, p1, p2, p3}, Landroid/support/v4/h/q$c;->b(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;I)V

    goto :goto_0
.end method
