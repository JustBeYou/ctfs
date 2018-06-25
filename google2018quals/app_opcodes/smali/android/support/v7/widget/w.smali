.class Landroid/support/v7/widget/w;
.super Landroid/support/v7/widget/s;


# instance fields
.field private final a:Landroid/widget/SeekBar;

.field private b:Landroid/graphics/drawable/Drawable;

.field private c:Landroid/content/res/ColorStateList;

.field private d:Landroid/graphics/PorterDuff$Mode;

.field private e:Z

.field private f:Z


# direct methods
.method constructor <init>(Landroid/widget/SeekBar;)V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, 0x0

    invoke-direct {p0, p1}, Landroid/support/v7/widget/s;-><init>(Landroid/widget/ProgressBar;)V

    iput-object v1, p0, Landroid/support/v7/widget/w;->c:Landroid/content/res/ColorStateList;

    iput-object v1, p0, Landroid/support/v7/widget/w;->d:Landroid/graphics/PorterDuff$Mode;

    iput-boolean v0, p0, Landroid/support/v7/widget/w;->e:Z

    iput-boolean v0, p0, Landroid/support/v7/widget/w;->f:Z

    iput-object p1, p0, Landroid/support/v7/widget/w;->a:Landroid/widget/SeekBar;

    return-void
.end method

.method private d()V
    .locals 2

    iget-object v0, p0, Landroid/support/v7/widget/w;->b:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Landroid/support/v7/widget/w;->e:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Landroid/support/v7/widget/w;->f:Z

    if-eqz v0, :cond_3

    :cond_0
    iget-object v0, p0, Landroid/support/v7/widget/w;->b:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/c/a/a;->f(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/w;->b:Landroid/graphics/drawable/Drawable;

    iget-boolean v0, p0, Landroid/support/v7/widget/w;->e:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v7/widget/w;->b:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Landroid/support/v7/widget/w;->c:Landroid/content/res/ColorStateList;

    invoke-static {v0, v1}, Landroid/support/v4/c/a/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    :cond_1
    iget-boolean v0, p0, Landroid/support/v7/widget/w;->f:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v7/widget/w;->b:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Landroid/support/v7/widget/w;->d:Landroid/graphics/PorterDuff$Mode;

    invoke-static {v0, v1}, Landroid/support/v4/c/a/a;->a(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    :cond_2
    iget-object v0, p0, Landroid/support/v7/widget/w;->b:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/support/v7/widget/w;->b:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Landroid/support/v7/widget/w;->a:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    :cond_3
    return-void
.end method


# virtual methods
.method a(Landroid/graphics/Canvas;)V
    .locals 6

    const/4 v0, 0x1

    iget-object v1, p0, Landroid/support/v7/widget/w;->b:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_3

    iget-object v1, p0, Landroid/support/v7/widget/w;->a:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getMax()I

    move-result v2

    if-le v2, v0, :cond_3

    iget-object v1, p0, Landroid/support/v7/widget/w;->b:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    iget-object v3, p0, Landroid/support/v7/widget/w;->b:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    if-ltz v1, :cond_1

    div-int/lit8 v1, v1, 0x2

    :goto_0
    if-ltz v3, :cond_0

    div-int/lit8 v0, v3, 0x2

    :cond_0
    iget-object v3, p0, Landroid/support/v7/widget/w;->b:Landroid/graphics/drawable/Drawable;

    neg-int v4, v1

    neg-int v5, v0

    invoke-virtual {v3, v4, v5, v1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v0, p0, Landroid/support/v7/widget/w;->a:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getWidth()I

    move-result v0

    iget-object v1, p0, Landroid/support/v7/widget/w;->a:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    iget-object v1, p0, Landroid/support/v7/widget/w;->a:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    int-to-float v1, v2

    div-float v1, v0, v1

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v3

    iget-object v0, p0, Landroid/support/v7/widget/w;->a:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getPaddingLeft()I

    move-result v0

    int-to-float v0, v0

    iget-object v4, p0, Landroid/support/v7/widget/w;->a:Landroid/widget/SeekBar;

    invoke-virtual {v4}, Landroid/widget/SeekBar;->getHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    invoke-virtual {p1, v0, v4}, Landroid/graphics/Canvas;->translate(FF)V

    const/4 v0, 0x0

    :goto_1
    if-gt v0, v2, :cond_2

    iget-object v4, p0, Landroid/support/v7/widget/w;->b:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    const/4 v4, 0x0

    invoke-virtual {p1, v1, v4}, Landroid/graphics/Canvas;->translate(FF)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    move v1, v0

    goto :goto_0

    :cond_2
    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_3
    return-void
.end method

.method a(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v7/widget/w;->b:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/w;->b:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_0
    iput-object p1, p0, Landroid/support/v7/widget/w;->b:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_2

    iget-object v0, p0, Landroid/support/v7/widget/w;->a:Landroid/widget/SeekBar;

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object v0, p0, Landroid/support/v7/widget/w;->a:Landroid/widget/SeekBar;

    invoke-static {v0}, Landroid/support/v4/h/p;->b(Landroid/view/View;)I

    move-result v0

    invoke-static {p1, v0}, Landroid/support/v4/c/a/a;->b(Landroid/graphics/drawable/Drawable;I)Z

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v7/widget/w;->a:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getDrawableState()[I

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    :cond_1
    invoke-direct {p0}, Landroid/support/v7/widget/w;->d()V

    :cond_2
    iget-object v0, p0, Landroid/support/v7/widget/w;->a:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->invalidate()V

    return-void
.end method

.method a(Landroid/util/AttributeSet;I)V
    .locals 4

    const/4 v3, 0x1

    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/s;->a(Landroid/util/AttributeSet;I)V

    iget-object v0, p0, Landroid/support/v7/widget/w;->a:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Landroid/support/v7/a/a$j;->AppCompatSeekBar:[I

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, p2, v2}, Landroid/support/v7/widget/aw;->a(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/widget/aw;

    move-result-object v0

    sget v1, Landroid/support/v7/a/a$j;->AppCompatSeekBar_android_thumb:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/aw;->b(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v2, p0, Landroid/support/v7/widget/w;->a:Landroid/widget/SeekBar;

    invoke-virtual {v2, v1}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    sget v1, Landroid/support/v7/a/a$j;->AppCompatSeekBar_tickMark:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/aw;->a(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/w;->a(Landroid/graphics/drawable/Drawable;)V

    sget v1, Landroid/support/v7/a/a$j;->AppCompatSeekBar_tickMarkTintMode:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/aw;->g(I)Z

    move-result v1

    if-eqz v1, :cond_1

    sget v1, Landroid/support/v7/a/a$j;->AppCompatSeekBar_tickMarkTintMode:I

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/aw;->a(II)I

    move-result v1

    iget-object v2, p0, Landroid/support/v7/widget/w;->d:Landroid/graphics/PorterDuff$Mode;

    invoke-static {v1, v2}, Landroid/support/v7/widget/ae;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/widget/w;->d:Landroid/graphics/PorterDuff$Mode;

    iput-boolean v3, p0, Landroid/support/v7/widget/w;->f:Z

    :cond_1
    sget v1, Landroid/support/v7/a/a$j;->AppCompatSeekBar_tickMarkTint:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/aw;->g(I)Z

    move-result v1

    if-eqz v1, :cond_2

    sget v1, Landroid/support/v7/a/a$j;->AppCompatSeekBar_tickMarkTint:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/aw;->e(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/widget/w;->c:Landroid/content/res/ColorStateList;

    iput-boolean v3, p0, Landroid/support/v7/widget/w;->e:Z

    :cond_2
    invoke-virtual {v0}, Landroid/support/v7/widget/aw;->a()V

    invoke-direct {p0}, Landroid/support/v7/widget/w;->d()V

    return-void
.end method

.method b()V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/w;->b:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/w;->b:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    :cond_0
    return-void
.end method

.method c()V
    .locals 2

    iget-object v0, p0, Landroid/support/v7/widget/w;->b:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/support/v7/widget/w;->a:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/support/v7/widget/w;->a:Landroid/widget/SeekBar;

    invoke-virtual {v1, v0}, Landroid/widget/SeekBar;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method
