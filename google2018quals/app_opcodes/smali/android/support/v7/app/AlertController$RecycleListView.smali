.class public Landroid/support/v7/app/AlertController$RecycleListView;
.super Landroid/widget/ListView;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/app/AlertController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RecycleListView"
.end annotation


# instance fields
.field private final a:I

.field private final b:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/app/AlertController$RecycleListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    const/4 v2, -0x1

    invoke-direct {p0, p1, p2}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    sget-object v0, Landroid/support/v7/a/a$j;->RecycleListView:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    sget v1, Landroid/support/v7/a/a$j;->RecycleListView_paddingBottomNoButtons:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v1

    iput v1, p0, Landroid/support/v7/app/AlertController$RecycleListView;->b:I

    sget v1, Landroid/support/v7/a/a$j;->RecycleListView_paddingTopNoTitle:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/app/AlertController$RecycleListView;->a:I

    return-void
.end method


# virtual methods
.method public a(ZZ)V
    .locals 4

    if-eqz p2, :cond_0

    if-nez p1, :cond_1

    :cond_0
    invoke-virtual {p0}, Landroid/support/v7/app/AlertController$RecycleListView;->getPaddingLeft()I

    move-result v2

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Landroid/support/v7/app/AlertController$RecycleListView;->getPaddingTop()I

    move-result v0

    :goto_0
    invoke-virtual {p0}, Landroid/support/v7/app/AlertController$RecycleListView;->getPaddingRight()I

    move-result v3

    if-eqz p2, :cond_3

    invoke-virtual {p0}, Landroid/support/v7/app/AlertController$RecycleListView;->getPaddingBottom()I

    move-result v1

    :goto_1
    invoke-virtual {p0, v2, v0, v3, v1}, Landroid/support/v7/app/AlertController$RecycleListView;->setPadding(IIII)V

    :cond_1
    return-void

    :cond_2
    iget v0, p0, Landroid/support/v7/app/AlertController$RecycleListView;->a:I

    goto :goto_0

    :cond_3
    iget v1, p0, Landroid/support/v7/app/AlertController$RecycleListView;->b:I

    goto :goto_1
.end method
