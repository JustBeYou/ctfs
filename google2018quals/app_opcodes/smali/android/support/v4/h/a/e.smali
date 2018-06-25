.class public Landroid/support/v4/h/a/e;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/h/a/e$b;,
        Landroid/support/v4/h/a/e$a;,
        Landroid/support/v4/h/a/e$c;
    }
.end annotation


# static fields
.field private static final a:Landroid/support/v4/h/a/e$c;


# instance fields
.field private final b:Landroid/view/accessibility/AccessibilityRecord;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    new-instance v0, Landroid/support/v4/h/a/e$b;

    invoke-direct {v0}, Landroid/support/v4/h/a/e$b;-><init>()V

    sput-object v0, Landroid/support/v4/h/a/e;->a:Landroid/support/v4/h/a/e$c;

    :goto_0
    return-void

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xf

    if-lt v0, v1, :cond_1

    new-instance v0, Landroid/support/v4/h/a/e$a;

    invoke-direct {v0}, Landroid/support/v4/h/a/e$a;-><init>()V

    sput-object v0, Landroid/support/v4/h/a/e;->a:Landroid/support/v4/h/a/e$c;

    goto :goto_0

    :cond_1
    new-instance v0, Landroid/support/v4/h/a/e$c;

    invoke-direct {v0}, Landroid/support/v4/h/a/e$c;-><init>()V

    sput-object v0, Landroid/support/v4/h/a/e;->a:Landroid/support/v4/h/a/e$c;

    goto :goto_0
.end method

.method public static a(Landroid/view/accessibility/AccessibilityRecord;I)V
    .locals 1

    sget-object v0, Landroid/support/v4/h/a/e;->a:Landroid/support/v4/h/a/e$c;

    invoke-virtual {v0, p0, p1}, Landroid/support/v4/h/a/e$c;->a(Landroid/view/accessibility/AccessibilityRecord;I)V

    return-void
.end method

.method public static b(Landroid/view/accessibility/AccessibilityRecord;I)V
    .locals 1

    sget-object v0, Landroid/support/v4/h/a/e;->a:Landroid/support/v4/h/a/e$c;

    invoke-virtual {v0, p0, p1}, Landroid/support/v4/h/a/e$c;->b(Landroid/view/accessibility/AccessibilityRecord;I)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p0, p1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    if-nez p1, :cond_2

    move v0, v1

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_3

    move v0, v1

    goto :goto_0

    :cond_3
    check-cast p1, Landroid/support/v4/h/a/e;

    iget-object v2, p0, Landroid/support/v4/h/a/e;->b:Landroid/view/accessibility/AccessibilityRecord;

    if-nez v2, :cond_4

    iget-object v2, p1, Landroid/support/v4/h/a/e;->b:Landroid/view/accessibility/AccessibilityRecord;

    if-eqz v2, :cond_0

    move v0, v1

    goto :goto_0

    :cond_4
    iget-object v2, p0, Landroid/support/v4/h/a/e;->b:Landroid/view/accessibility/AccessibilityRecord;

    iget-object v3, p1, Landroid/support/v4/h/a/e;->b:Landroid/view/accessibility/AccessibilityRecord;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/h/a/e;->b:Landroid/view/accessibility/AccessibilityRecord;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/h/a/e;->b:Landroid/view/accessibility/AccessibilityRecord;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0
.end method
