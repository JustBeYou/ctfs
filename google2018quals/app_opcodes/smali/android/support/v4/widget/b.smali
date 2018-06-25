.class public final Landroid/support/v4/widget/b;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/widget/b$b;,
        Landroid/support/v4/widget/b$a;,
        Landroid/support/v4/widget/b$c;
    }
.end annotation


# static fields
.field private static final a:Landroid/support/v4/widget/b$c;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    new-instance v0, Landroid/support/v4/widget/b$b;

    invoke-direct {v0}, Landroid/support/v4/widget/b$b;-><init>()V

    sput-object v0, Landroid/support/v4/widget/b;->a:Landroid/support/v4/widget/b$c;

    :goto_0
    return-void

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_1

    new-instance v0, Landroid/support/v4/widget/b$a;

    invoke-direct {v0}, Landroid/support/v4/widget/b$a;-><init>()V

    sput-object v0, Landroid/support/v4/widget/b;->a:Landroid/support/v4/widget/b$c;

    goto :goto_0

    :cond_1
    new-instance v0, Landroid/support/v4/widget/b$c;

    invoke-direct {v0}, Landroid/support/v4/widget/b$c;-><init>()V

    sput-object v0, Landroid/support/v4/widget/b;->a:Landroid/support/v4/widget/b$c;

    goto :goto_0
.end method

.method public static a(Landroid/widget/CompoundButton;)Landroid/graphics/drawable/Drawable;
    .locals 1

    sget-object v0, Landroid/support/v4/widget/b;->a:Landroid/support/v4/widget/b$c;

    invoke-virtual {v0, p0}, Landroid/support/v4/widget/b$c;->a(Landroid/widget/CompoundButton;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public static a(Landroid/widget/CompoundButton;Landroid/content/res/ColorStateList;)V
    .locals 1

    sget-object v0, Landroid/support/v4/widget/b;->a:Landroid/support/v4/widget/b$c;

    invoke-virtual {v0, p0, p1}, Landroid/support/v4/widget/b$c;->a(Landroid/widget/CompoundButton;Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public static a(Landroid/widget/CompoundButton;Landroid/graphics/PorterDuff$Mode;)V
    .locals 1

    sget-object v0, Landroid/support/v4/widget/b;->a:Landroid/support/v4/widget/b$c;

    invoke-virtual {v0, p0, p1}, Landroid/support/v4/widget/b$c;->a(Landroid/widget/CompoundButton;Landroid/graphics/PorterDuff$Mode;)V

    return-void
.end method
