.class Landroid/support/v7/widget/ak$a;
.super Landroid/support/v7/c/a/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/ak;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private a:Z


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/support/v7/c/a/a;-><init>(Landroid/graphics/drawable/Drawable;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/ak$a;->a:Z

    return-void
.end method


# virtual methods
.method a(Z)V
    .locals 0

    iput-boolean p1, p0, Landroid/support/v7/widget/ak$a;->a:Z

    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    iget-boolean v0, p0, Landroid/support/v7/widget/ak$a;->a:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Landroid/support/v7/c/a/a;->draw(Landroid/graphics/Canvas;)V

    :cond_0
    return-void
.end method

.method public setHotspot(FF)V
    .locals 1

    iget-boolean v0, p0, Landroid/support/v7/widget/ak$a;->a:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1, p2}, Landroid/support/v7/c/a/a;->setHotspot(FF)V

    :cond_0
    return-void
.end method

.method public setHotspotBounds(IIII)V
    .locals 1

    iget-boolean v0, p0, Landroid/support/v7/widget/ak$a;->a:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v7/c/a/a;->setHotspotBounds(IIII)V

    :cond_0
    return-void
.end method

.method public setState([I)Z
    .locals 1

    iget-boolean v0, p0, Landroid/support/v7/widget/ak$a;->a:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Landroid/support/v7/c/a/a;->setState([I)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setVisible(ZZ)Z
    .locals 1

    iget-boolean v0, p0, Landroid/support/v7/widget/ak$a;->a:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1, p2}, Landroid/support/v7/c/a/a;->setVisible(ZZ)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
