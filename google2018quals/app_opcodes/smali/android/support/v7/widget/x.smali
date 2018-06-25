.class public Landroid/support/v7/widget/x;
.super Landroid/widget/Spinner;

# interfaces
.implements Landroid/support/v4/h/o;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/x$b;,
        Landroid/support/v7/widget/x$a;
    }
.end annotation


# static fields
.field private static final a:[I


# instance fields
.field private final b:Landroid/support/v7/widget/g;

.field private final c:Landroid/content/Context;

.field private d:Landroid/support/v7/widget/ah;

.field private e:Landroid/widget/SpinnerAdapter;

.field private final f:Z

.field private g:Landroid/support/v7/widget/x$b;

.field private h:I

.field private final i:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10102f1

    aput v2, v0, v1

    sput-object v0, Landroid/support/v7/widget/x;->a:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    sget v0, Landroid/support/v7/a/a$a;->spinnerStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/x;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, -0x1

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/support/v7/widget/x;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/widget/x;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILandroid/content/res/Resources$Theme;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILandroid/content/res/Resources$Theme;)V
    .locals 8

    const/4 v1, 0x0

    const/4 v3, 0x1

    const/4 v7, 0x0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/x;->i:Landroid/graphics/Rect;

    sget-object v0, Landroid/support/v7/a/a$j;->Spinner:[I

    invoke-static {p1, p2, v0, p3, v7}, Landroid/support/v7/widget/aw;->a(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/widget/aw;

    move-result-object v4

    new-instance v0, Landroid/support/v7/widget/g;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/g;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Landroid/support/v7/widget/x;->b:Landroid/support/v7/widget/g;

    if-eqz p5, :cond_5

    new-instance v0, Landroid/support/v7/view/d;

    invoke-direct {v0, p1, p5}, Landroid/support/v7/view/d;-><init>(Landroid/content/Context;Landroid/content/res/Resources$Theme;)V

    iput-object v0, p0, Landroid/support/v7/widget/x;->c:Landroid/content/Context;

    :goto_0
    iget-object v0, p0, Landroid/support/v7/widget/x;->c:Landroid/content/Context;

    if-eqz v0, :cond_2

    const/4 v0, -0x1

    if-ne p4, v0, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v0, v2, :cond_9

    :try_start_0
    sget-object v0, Landroid/support/v7/widget/x;->a:[I

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v0, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {v2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    const/4 v5, 0x0

    invoke-virtual {v2, v0, v5}, Landroid/content/res/TypedArray;->getInt(II)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result p4

    :cond_0
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    :cond_1
    :goto_1
    if-ne p4, v3, :cond_2

    new-instance v0, Landroid/support/v7/widget/x$b;

    iget-object v2, p0, Landroid/support/v7/widget/x;->c:Landroid/content/Context;

    invoke-direct {v0, p0, v2, p2, p3}, Landroid/support/v7/widget/x$b;-><init>(Landroid/support/v7/widget/x;Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iget-object v2, p0, Landroid/support/v7/widget/x;->c:Landroid/content/Context;

    sget-object v5, Landroid/support/v7/a/a$j;->Spinner:[I

    invoke-static {v2, p2, v5, p3, v7}, Landroid/support/v7/widget/aw;->a(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/widget/aw;

    move-result-object v2

    sget v5, Landroid/support/v7/a/a$j;->Spinner_android_dropDownWidth:I

    const/4 v6, -0x2

    invoke-virtual {v2, v5, v6}, Landroid/support/v7/widget/aw;->f(II)I

    move-result v5

    iput v5, p0, Landroid/support/v7/widget/x;->h:I

    sget v5, Landroid/support/v7/a/a$j;->Spinner_android_popupBackground:I

    invoke-virtual {v2, v5}, Landroid/support/v7/widget/aw;->a(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/support/v7/widget/x$b;->a(Landroid/graphics/drawable/Drawable;)V

    sget v5, Landroid/support/v7/a/a$j;->Spinner_android_prompt:I

    invoke-virtual {v4, v5}, Landroid/support/v7/widget/aw;->d(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/support/v7/widget/x$b;->a(Ljava/lang/CharSequence;)V

    invoke-virtual {v2}, Landroid/support/v7/widget/aw;->a()V

    iput-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    new-instance v2, Landroid/support/v7/widget/x$1;

    invoke-direct {v2, p0, p0, v0}, Landroid/support/v7/widget/x$1;-><init>(Landroid/support/v7/widget/x;Landroid/view/View;Landroid/support/v7/widget/x$b;)V

    iput-object v2, p0, Landroid/support/v7/widget/x;->d:Landroid/support/v7/widget/ah;

    :cond_2
    sget v0, Landroid/support/v7/a/a$j;->Spinner_android_entries:I

    invoke-virtual {v4, v0}, Landroid/support/v7/widget/aw;->f(I)[Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_3

    new-instance v2, Landroid/widget/ArrayAdapter;

    const v5, 0x1090008

    invoke-direct {v2, p1, v5, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    sget v0, Landroid/support/v7/a/a$g;->support_simple_spinner_dropdown_item:I

    invoke-virtual {v2, v0}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/x;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    :cond_3
    invoke-virtual {v4}, Landroid/support/v7/widget/aw;->a()V

    iput-boolean v3, p0, Landroid/support/v7/widget/x;->f:Z

    iget-object v0, p0, Landroid/support/v7/widget/x;->e:Landroid/widget/SpinnerAdapter;

    if-eqz v0, :cond_4

    iget-object v0, p0, Landroid/support/v7/widget/x;->e:Landroid/widget/SpinnerAdapter;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/x;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    iput-object v1, p0, Landroid/support/v7/widget/x;->e:Landroid/widget/SpinnerAdapter;

    :cond_4
    iget-object v0, p0, Landroid/support/v7/widget/x;->b:Landroid/support/v7/widget/g;

    invoke-virtual {v0, p2, p3}, Landroid/support/v7/widget/g;->a(Landroid/util/AttributeSet;I)V

    return-void

    :cond_5
    sget v0, Landroid/support/v7/a/a$j;->Spinner_popupTheme:I

    invoke-virtual {v4, v0, v7}, Landroid/support/v7/widget/aw;->g(II)I

    move-result v0

    if-eqz v0, :cond_6

    new-instance v2, Landroid/support/v7/view/d;

    invoke-direct {v2, p1, v0}, Landroid/support/v7/view/d;-><init>(Landroid/content/Context;I)V

    iput-object v2, p0, Landroid/support/v7/widget/x;->c:Landroid/content/Context;

    goto/16 :goto_0

    :cond_6
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-ge v0, v2, :cond_7

    move-object v0, p1

    :goto_2
    iput-object v0, p0, Landroid/support/v7/widget/x;->c:Landroid/content/Context;

    goto/16 :goto_0

    :cond_7
    move-object v0, v1

    goto :goto_2

    :catch_0
    move-exception v0

    move-object v2, v1

    :goto_3
    :try_start_2
    const-string v5, "AppCompatSpinner"

    const-string v6, "Could not read android:spinnerMode"

    invoke-static {v5, v6, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    goto/16 :goto_1

    :catchall_0
    move-exception v0

    move-object v2, v1

    :goto_4
    if-eqz v2, :cond_8

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    :cond_8
    throw v0

    :cond_9
    move p4, v3

    goto/16 :goto_1

    :catchall_1
    move-exception v0

    goto :goto_4

    :catch_1
    move-exception v0

    goto :goto_3
.end method

.method static synthetic a(Landroid/support/v7/widget/x;)Landroid/support/v7/widget/x$b;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    return-object v0
.end method

.method static synthetic b(Landroid/support/v7/widget/x;)Landroid/graphics/Rect;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/x;->i:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic c(Landroid/support/v7/widget/x;)I
    .locals 1

    iget v0, p0, Landroid/support/v7/widget/x;->h:I

    return v0
.end method


# virtual methods
.method a(Landroid/widget/SpinnerAdapter;Landroid/graphics/drawable/Drawable;)I
    .locals 10

    const/4 v2, 0x0

    const/4 v9, -0x2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Landroid/support/v7/widget/x;->getMeasuredWidth()I

    move-result v1

    invoke-static {v1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    invoke-virtual {p0}, Landroid/support/v7/widget/x;->getMeasuredHeight()I

    move-result v1

    invoke-static {v1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    invoke-virtual {p0}, Landroid/support/v7/widget/x;->getSelectedItemPosition()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-interface {p1}, Landroid/widget/SpinnerAdapter;->getCount()I

    move-result v3

    add-int/lit8 v4, v1, 0xf

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v8

    sub-int v3, v8, v1

    rsub-int/lit8 v3, v3, 0xf

    sub-int/2addr v1, v3

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    move v5, v1

    move-object v3, v2

    move v4, v0

    move v1, v0

    :goto_1
    if-ge v5, v8, :cond_2

    invoke-interface {p1, v5}, Landroid/widget/SpinnerAdapter;->getItemViewType(I)I

    move-result v0

    if-eq v0, v1, :cond_4

    move-object v1, v2

    :goto_2
    invoke-interface {p1, v5, v1, p0}, Landroid/widget/SpinnerAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    if-nez v1, :cond_1

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v9, v9}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1
    invoke-virtual {v3, v6, v7}, Landroid/view/View;->measure(II)V

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v4

    add-int/lit8 v1, v5, 0x1

    move v5, v1

    move v1, v0

    goto :goto_1

    :cond_2
    if-eqz p2, :cond_3

    iget-object v0, p0, Landroid/support/v7/widget/x;->i:Landroid/graphics/Rect;

    invoke-virtual {p2, v0}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    iget-object v0, p0, Landroid/support/v7/widget/x;->i:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    iget-object v1, p0, Landroid/support/v7/widget/x;->i:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->right:I

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    goto :goto_0

    :cond_3
    move v0, v4

    goto :goto_0

    :cond_4
    move v0, v1

    move-object v1, v3

    goto :goto_2
.end method

.method protected drawableStateChanged()V
    .locals 1

    invoke-super {p0}, Landroid/widget/Spinner;->drawableStateChanged()V

    iget-object v0, p0, Landroid/support/v7/widget/x;->b:Landroid/support/v7/widget/g;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/x;->b:Landroid/support/v7/widget/g;

    invoke-virtual {v0}, Landroid/support/v7/widget/g;->c()V

    :cond_0
    return-void
.end method

.method public getDropDownHorizontalOffset()I
    .locals 2

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    invoke-virtual {v0}, Landroid/support/v7/widget/x$b;->j()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_1

    invoke-super {p0}, Landroid/widget/Spinner;->getDropDownHorizontalOffset()I

    move-result v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDropDownVerticalOffset()I
    .locals 2

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    invoke-virtual {v0}, Landroid/support/v7/widget/x$b;->k()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_1

    invoke-super {p0}, Landroid/widget/Spinner;->getDropDownVerticalOffset()I

    move-result v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDropDownWidth()I
    .locals 2

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    if-eqz v0, :cond_0

    iget v0, p0, Landroid/support/v7/widget/x;->h:I

    :goto_0
    return v0

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_1

    invoke-super {p0}, Landroid/widget/Spinner;->getDropDownWidth()I

    move-result v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getPopupBackground()Landroid/graphics/drawable/Drawable;
    .locals 2

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    invoke-virtual {v0}, Landroid/support/v7/widget/x$b;->h()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_1

    invoke-super {p0}, Landroid/widget/Spinner;->getPopupBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getPopupContext()Landroid/content/Context;
    .locals 2

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/x;->c:Landroid/content/Context;

    :goto_0
    return-object v0

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_1

    invoke-super {p0}, Landroid/widget/Spinner;->getPopupContext()Landroid/content/Context;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getPrompt()Ljava/lang/CharSequence;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    invoke-virtual {v0}, Landroid/support/v7/widget/x$b;->b()Ljava/lang/CharSequence;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Landroid/widget/Spinner;->getPrompt()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_0
.end method

.method public getSupportBackgroundTintList()Landroid/content/res/ColorStateList;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/x;->b:Landroid/support/v7/widget/g;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/x;->b:Landroid/support/v7/widget/g;

    invoke-virtual {v0}, Landroid/support/v7/widget/g;->a()Landroid/content/res/ColorStateList;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSupportBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/x;->b:Landroid/support/v7/widget/g;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/x;->b:Landroid/support/v7/widget/g;

    invoke-virtual {v0}, Landroid/support/v7/widget/g;->b()Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    invoke-super {p0}, Landroid/widget/Spinner;->onDetachedFromWindow()V

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    invoke-virtual {v0}, Landroid/support/v7/widget/x$b;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    invoke-virtual {v0}, Landroid/support/v7/widget/x$b;->c()V

    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 3

    invoke-super {p0, p1, p2}, Landroid/widget/Spinner;->onMeasure(II)V

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    if-eqz v0, :cond_0

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    const/high16 v1, -0x80000000

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Landroid/support/v7/widget/x;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v7/widget/x;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v1

    invoke-virtual {p0}, Landroid/support/v7/widget/x;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Landroid/support/v7/widget/x;->a(Landroid/widget/SpinnerAdapter;Landroid/graphics/drawable/Drawable;)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v7/widget/x;->getMeasuredHeight()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/widget/x;->setMeasuredDimension(II)V

    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/x;->d:Landroid/support/v7/widget/ah;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/x;->d:Landroid/support/v7/widget/ah;

    invoke-virtual {v0, p0, p1}, Landroid/support/v7/widget/ah;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Landroid/widget/Spinner;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public performClick()Z
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    invoke-virtual {v0}, Landroid/support/v7/widget/x$b;->d()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    invoke-virtual {v0}, Landroid/support/v7/widget/x$b;->a()V

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    invoke-super {p0}, Landroid/widget/Spinner;->performClick()Z

    move-result v0

    goto :goto_0
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0

    check-cast p1, Landroid/widget/SpinnerAdapter;

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/x;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/SpinnerAdapter;)V
    .locals 3

    iget-boolean v0, p0, Landroid/support/v7/widget/x;->f:Z

    if-nez v0, :cond_1

    iput-object p1, p0, Landroid/support/v7/widget/x;->e:Landroid/widget/SpinnerAdapter;

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-super {p0, p1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/x;->c:Landroid/content/Context;

    if-nez v0, :cond_2

    invoke-virtual {p0}, Landroid/support/v7/widget/x;->getContext()Landroid/content/Context;

    move-result-object v0

    :goto_1
    iget-object v1, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    new-instance v2, Landroid/support/v7/widget/x$a;

    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    invoke-direct {v2, p1, v0}, Landroid/support/v7/widget/x$a;-><init>(Landroid/widget/SpinnerAdapter;Landroid/content/res/Resources$Theme;)V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/x$b;->a(Landroid/widget/ListAdapter;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Landroid/support/v7/widget/x;->c:Landroid/content/Context;

    goto :goto_1
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/widget/Spinner;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Landroid/support/v7/widget/x;->b:Landroid/support/v7/widget/g;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/x;->b:Landroid/support/v7/widget/g;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/g;->a(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method

.method public setBackgroundResource(I)V
    .locals 1

    invoke-super {p0, p1}, Landroid/widget/Spinner;->setBackgroundResource(I)V

    iget-object v0, p0, Landroid/support/v7/widget/x;->b:Landroid/support/v7/widget/g;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/x;->b:Landroid/support/v7/widget/g;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/g;->a(I)V

    :cond_0
    return-void
.end method

.method public setDropDownHorizontalOffset(I)V
    .locals 2

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/x$b;->c(I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    invoke-super {p0, p1}, Landroid/widget/Spinner;->setDropDownHorizontalOffset(I)V

    goto :goto_0
.end method

.method public setDropDownVerticalOffset(I)V
    .locals 2

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/x$b;->d(I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    invoke-super {p0, p1}, Landroid/widget/Spinner;->setDropDownVerticalOffset(I)V

    goto :goto_0
.end method

.method public setDropDownWidth(I)V
    .locals 2

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    if-eqz v0, :cond_1

    iput p1, p0, Landroid/support/v7/widget/x;->h:I

    :cond_0
    :goto_0
    return-void

    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    invoke-super {p0, p1}, Landroid/widget/Spinner;->setDropDownWidth(I)V

    goto :goto_0
.end method

.method public setPopupBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/x$b;->a(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    invoke-super {p0, p1}, Landroid/widget/Spinner;->setPopupBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method public setPopupBackgroundResource(I)V
    .locals 1

    invoke-virtual {p0}, Landroid/support/v7/widget/x;->getPopupContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v7/b/a/b;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/x;->setPopupBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setPrompt(Ljava/lang/CharSequence;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/x;->g:Landroid/support/v7/widget/x$b;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/x$b;->a(Ljava/lang/CharSequence;)V

    :goto_0
    return-void

    :cond_0
    invoke-super {p0, p1}, Landroid/widget/Spinner;->setPrompt(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public setSupportBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/x;->b:Landroid/support/v7/widget/g;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/x;->b:Landroid/support/v7/widget/g;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/g;->a(Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method

.method public setSupportBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/x;->b:Landroid/support/v7/widget/g;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/x;->b:Landroid/support/v7/widget/g;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/g;->a(Landroid/graphics/PorterDuff$Mode;)V

    :cond_0
    return-void
.end method
