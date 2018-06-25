.class Landroid/support/v4/c/a/a$b;
.super Landroid/support/v4/c/a/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/c/a/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "b"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/support/v4/c/a/a$a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/drawable/Drawable;Z)V
    .locals 0

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/Drawable;->setAutoMirrored(Z)V

    return-void
.end method

.method public b(Landroid/graphics/drawable/Drawable;)Z
    .locals 1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isAutoMirrored()Z

    move-result v0

    return v0
.end method

.method public c(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 1

    instance-of v0, p1, Landroid/support/v4/c/a/f;

    if-nez v0, :cond_0

    new-instance v0, Landroid/support/v4/c/a/d;

    invoke-direct {v0, p1}, Landroid/support/v4/c/a/d;-><init>(Landroid/graphics/drawable/Drawable;)V

    move-object p1, v0

    :cond_0
    return-object p1
.end method

.method public d(Landroid/graphics/drawable/Drawable;)I
    .locals 1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    move-result v0

    return v0
.end method
