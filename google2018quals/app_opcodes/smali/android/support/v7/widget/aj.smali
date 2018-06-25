.class public Landroid/support/v7/widget/aj;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/support/v7/view/menu/s;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/aj$c;,
        Landroid/support/v7/widget/aj$d;,
        Landroid/support/v7/widget/aj$e;,
        Landroid/support/v7/widget/aj$a;,
        Landroid/support/v7/widget/aj$b;
    }
.end annotation


# static fields
.field private static a:Ljava/lang/reflect/Method;

.field private static b:Ljava/lang/reflect/Method;

.field private static h:Ljava/lang/reflect/Method;


# instance fields
.field private A:Landroid/graphics/drawable/Drawable;

.field private B:Landroid/widget/AdapterView$OnItemClickListener;

.field private C:Landroid/widget/AdapterView$OnItemSelectedListener;

.field private final D:Landroid/support/v7/widget/aj$d;

.field private final E:Landroid/support/v7/widget/aj$c;

.field private final F:Landroid/support/v7/widget/aj$a;

.field private G:Ljava/lang/Runnable;

.field private final H:Landroid/graphics/Rect;

.field private I:Landroid/graphics/Rect;

.field private J:Z

.field c:Landroid/support/v7/widget/af;

.field d:I

.field final e:Landroid/support/v7/widget/aj$e;

.field final f:Landroid/os/Handler;

.field g:Landroid/widget/PopupWindow;

.field private i:Landroid/content/Context;

.field private j:Landroid/widget/ListAdapter;

.field private k:I

.field private l:I

.field private m:I

.field private n:I

.field private o:I

.field private p:Z

.field private q:Z

.field private r:Z

.field private s:Z

.field private t:I

.field private u:Z

.field private v:Z

.field private w:Landroid/view/View;

.field private x:I

.field private y:Landroid/database/DataSetObserver;

.field private z:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    :try_start_0
    const-class v0, Landroid/widget/PopupWindow;

    const-string v1, "setClipToScreenEnabled"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Landroid/support/v7/widget/aj;->a:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    :try_start_1
    const-class v0, Landroid/widget/PopupWindow;

    const-string v1, "getMaxAvailableHeight"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Landroid/view/View;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    const/4 v3, 0x2

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Landroid/support/v7/widget/aj;->b:Ljava/lang/reflect/Method;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    const-class v0, Landroid/widget/PopupWindow;

    const-string v1, "setEpicenterBounds"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Landroid/graphics/Rect;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Landroid/support/v7/widget/aj;->h:Ljava/lang/reflect/Method;
    :try_end_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_2

    :goto_2
    return-void

    :catch_0
    move-exception v0

    const-string v0, "ListPopupWindow"

    const-string v1, "Could not find method setClipToScreenEnabled() on PopupWindow. Oh well."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catch_1
    move-exception v0

    const-string v0, "ListPopupWindow"

    const-string v1, "Could not find method getMaxAvailableHeight(View, int, boolean) on PopupWindow. Oh well."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :catch_2
    move-exception v0

    const-string v0, "ListPopupWindow"

    const-string v1, "Could not find method setEpicenterBounds(Rect) on PopupWindow. Oh well."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v0, 0x0

    sget v1, Landroid/support/v7/a/a$a;->listPopupWindowStyle:I

    invoke-direct {p0, p1, v0, v1}, Landroid/support/v7/widget/aj;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/support/v7/widget/aj;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 4

    const/4 v0, -0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Landroid/support/v7/widget/aj;->k:I

    iput v0, p0, Landroid/support/v7/widget/aj;->l:I

    const/16 v0, 0x3ea

    iput v0, p0, Landroid/support/v7/widget/aj;->o:I

    iput-boolean v3, p0, Landroid/support/v7/widget/aj;->q:Z

    iput v2, p0, Landroid/support/v7/widget/aj;->t:I

    iput-boolean v2, p0, Landroid/support/v7/widget/aj;->u:Z

    iput-boolean v2, p0, Landroid/support/v7/widget/aj;->v:Z

    const v0, 0x7fffffff

    iput v0, p0, Landroid/support/v7/widget/aj;->d:I

    iput v2, p0, Landroid/support/v7/widget/aj;->x:I

    new-instance v0, Landroid/support/v7/widget/aj$e;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/aj$e;-><init>(Landroid/support/v7/widget/aj;)V

    iput-object v0, p0, Landroid/support/v7/widget/aj;->e:Landroid/support/v7/widget/aj$e;

    new-instance v0, Landroid/support/v7/widget/aj$d;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/aj$d;-><init>(Landroid/support/v7/widget/aj;)V

    iput-object v0, p0, Landroid/support/v7/widget/aj;->D:Landroid/support/v7/widget/aj$d;

    new-instance v0, Landroid/support/v7/widget/aj$c;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/aj$c;-><init>(Landroid/support/v7/widget/aj;)V

    iput-object v0, p0, Landroid/support/v7/widget/aj;->E:Landroid/support/v7/widget/aj$c;

    new-instance v0, Landroid/support/v7/widget/aj$a;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/aj$a;-><init>(Landroid/support/v7/widget/aj;)V

    iput-object v0, p0, Landroid/support/v7/widget/aj;->F:Landroid/support/v7/widget/aj$a;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/aj;->H:Landroid/graphics/Rect;

    iput-object p1, p0, Landroid/support/v7/widget/aj;->i:Landroid/content/Context;

    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Landroid/support/v7/widget/aj;->f:Landroid/os/Handler;

    sget-object v0, Landroid/support/v7/a/a$j;->ListPopupWindow:[I

    invoke-virtual {p1, p2, v0, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    sget v1, Landroid/support/v7/a/a$j;->ListPopupWindow_android_dropDownHorizontalOffset:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v1

    iput v1, p0, Landroid/support/v7/widget/aj;->m:I

    sget v1, Landroid/support/v7/a/a$j;->ListPopupWindow_android_dropDownVerticalOffset:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v1

    iput v1, p0, Landroid/support/v7/widget/aj;->n:I

    iget v1, p0, Landroid/support/v7/widget/aj;->n:I

    if-eqz v1, :cond_0

    iput-boolean v3, p0, Landroid/support/v7/widget/aj;->p:Z

    :cond_0
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    new-instance v0, Landroid/support/v7/widget/r;

    invoke-direct {v0, p1, p2, p3, p4}, Landroid/support/v7/widget/r;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iput-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0, v3}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    return-void
.end method

.method private a(Landroid/view/View;IZ)I
    .locals 5

    sget-object v0, Landroid/support/v7/widget/aj;->b:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    :try_start_0
    sget-object v0, Landroid/support/v7/widget/aj;->b:Ljava/lang/reflect/Method;

    iget-object v1, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    return v0

    :catch_0
    move-exception v0

    const-string v0, "ListPopupWindow"

    const-string v1, "Could not call getMaxAvailableHeightMethod(View, int, boolean) on PopupWindow. Using the public version."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1, p2}, Landroid/widget/PopupWindow;->getMaxAvailableHeight(Landroid/view/View;I)I

    move-result v0

    goto :goto_0
.end method

.method private b()V
    .locals 2

    iget-object v0, p0, Landroid/support/v7/widget/aj;->w:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/aj;->w:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Landroid/support/v7/widget/aj;->w:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method private c(Z)V
    .locals 5

    sget-object v0, Landroid/support/v7/widget/aj;->a:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    :try_start_0
    sget-object v0, Landroid/support/v7/widget/aj;->a:Ljava/lang/reflect/Method;

    iget-object v1, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "ListPopupWindow"

    const-string v1, "Could not call setClipToScreenEnabled() on PopupWindow. Oh well."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private f()I
    .locals 10

    const/high16 v9, 0x40000000    # 2.0f

    const/high16 v4, -0x80000000

    const/4 v3, -0x1

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    if-nez v0, :cond_5

    iget-object v5, p0, Landroid/support/v7/widget/aj;->i:Landroid/content/Context;

    new-instance v0, Landroid/support/v7/widget/aj$1;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/aj$1;-><init>(Landroid/support/v7/widget/aj;)V

    iput-object v0, p0, Landroid/support/v7/widget/aj;->G:Ljava/lang/Runnable;

    iget-boolean v0, p0, Landroid/support/v7/widget/aj;->J:Z

    if-nez v0, :cond_3

    move v0, v1

    :goto_0
    invoke-virtual {p0, v5, v0}, Landroid/support/v7/widget/aj;->a(Landroid/content/Context;Z)Landroid/support/v7/widget/af;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    iget-object v0, p0, Landroid/support/v7/widget/aj;->A:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    iget-object v6, p0, Landroid/support/v7/widget/aj;->A:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v6}, Landroid/support/v7/widget/af;->setSelector(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    iget-object v0, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    iget-object v6, p0, Landroid/support/v7/widget/aj;->j:Landroid/widget/ListAdapter;

    invoke-virtual {v0, v6}, Landroid/support/v7/widget/af;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v0, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    iget-object v6, p0, Landroid/support/v7/widget/aj;->B:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v0, v6}, Landroid/support/v7/widget/af;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v0, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/af;->setFocusable(Z)V

    iget-object v0, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/af;->setFocusableInTouchMode(Z)V

    iget-object v0, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    new-instance v6, Landroid/support/v7/widget/aj$2;

    invoke-direct {v6, p0}, Landroid/support/v7/widget/aj$2;-><init>(Landroid/support/v7/widget/aj;)V

    invoke-virtual {v0, v6}, Landroid/support/v7/widget/af;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    iget-object v0, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    iget-object v6, p0, Landroid/support/v7/widget/aj;->E:Landroid/support/v7/widget/aj$c;

    invoke-virtual {v0, v6}, Landroid/support/v7/widget/af;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    iget-object v0, p0, Landroid/support/v7/widget/aj;->C:Landroid/widget/AdapterView$OnItemSelectedListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    iget-object v6, p0, Landroid/support/v7/widget/aj;->C:Landroid/widget/AdapterView$OnItemSelectedListener;

    invoke-virtual {v0, v6}, Landroid/support/v7/widget/af;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    :cond_1
    iget-object v0, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    iget-object v7, p0, Landroid/support/v7/widget/aj;->w:Landroid/view/View;

    if-eqz v7, :cond_c

    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v6, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v5, v3, v2, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    iget v8, p0, Landroid/support/v7/widget/aj;->x:I

    packed-switch v8, :pswitch_data_0

    const-string v0, "ListPopupWindow"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Invalid hint position "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v8, p0, Landroid/support/v7/widget/aj;->x:I

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    iget v0, p0, Landroid/support/v7/widget/aj;->l:I

    if-ltz v0, :cond_4

    iget v0, p0, Landroid/support/v7/widget/aj;->l:I

    move v5, v0

    move v0, v4

    :goto_2
    invoke-static {v5, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-virtual {v7, v0, v2}, Landroid/view/View;->measure(II)V

    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    iget v7, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    add-int/2addr v5, v7

    iget v0, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v0, v5

    move-object v5, v6

    :goto_3
    iget-object v6, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v6, v5}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    move v6, v0

    :goto_4
    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_6

    iget-object v5, p0, Landroid/support/v7/widget/aj;->H:Landroid/graphics/Rect;

    invoke-virtual {v0, v5}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    iget-object v0, p0, Landroid/support/v7/widget/aj;->H:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    iget-object v5, p0, Landroid/support/v7/widget/aj;->H:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v0, v5

    iget-boolean v5, p0, Landroid/support/v7/widget/aj;->p:Z

    if-nez v5, :cond_a

    iget-object v5, p0, Landroid/support/v7/widget/aj;->H:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    neg-int v5, v5

    iput v5, p0, Landroid/support/v7/widget/aj;->n:I

    move v7, v0

    :goto_5
    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getInputMethodMode()I

    move-result v0

    const/4 v5, 0x2

    if-ne v0, v5, :cond_7

    :goto_6
    invoke-virtual {p0}, Landroid/support/v7/widget/aj;->i()Landroid/view/View;

    move-result-object v0

    iget v5, p0, Landroid/support/v7/widget/aj;->n:I

    invoke-direct {p0, v0, v5, v1}, Landroid/support/v7/widget/aj;->a(Landroid/view/View;IZ)I

    move-result v5

    iget-boolean v0, p0, Landroid/support/v7/widget/aj;->u:Z

    if-nez v0, :cond_2

    iget v0, p0, Landroid/support/v7/widget/aj;->k:I

    if-ne v0, v3, :cond_8

    :cond_2
    add-int v0, v5, v7

    :goto_7
    return v0

    :cond_3
    move v0, v2

    goto/16 :goto_0

    :pswitch_0
    invoke-virtual {v6, v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_1

    :pswitch_1
    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v6, v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1

    :cond_4
    move v0, v2

    move v5, v2

    goto :goto_2

    :cond_5
    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v5, p0, Landroid/support/v7/widget/aj;->w:Landroid/view/View;

    if-eqz v5, :cond_b

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    iget v6, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    add-int/2addr v5, v6

    iget v0, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v0, v5

    move v6, v0

    goto :goto_4

    :cond_6
    iget-object v0, p0, Landroid/support/v7/widget/aj;->H:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    move v7, v2

    goto :goto_5

    :cond_7
    move v1, v2

    goto :goto_6

    :cond_8
    iget v0, p0, Landroid/support/v7/widget/aj;->l:I

    packed-switch v0, :pswitch_data_1

    iget v0, p0, Landroid/support/v7/widget/aj;->l:I

    invoke-static {v0, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    :goto_8
    iget-object v0, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    sub-int v4, v5, v6

    move v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/support/v7/widget/af;->a(IIIII)I

    move-result v0

    if-lez v0, :cond_9

    iget-object v1, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    invoke-virtual {v1}, Landroid/support/v7/widget/af;->getPaddingTop()I

    move-result v1

    iget-object v2, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    invoke-virtual {v2}, Landroid/support/v7/widget/af;->getPaddingBottom()I

    move-result v2

    add-int/2addr v1, v2

    add-int/2addr v1, v7

    add-int/2addr v6, v1

    :cond_9
    add-int/2addr v0, v6

    goto :goto_7

    :pswitch_2
    iget-object v0, p0, Landroid/support/v7/widget/aj;->i:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v1, p0, Landroid/support/v7/widget/aj;->H:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    iget-object v8, p0, Landroid/support/v7/widget/aj;->H:Landroid/graphics/Rect;

    iget v8, v8, Landroid/graphics/Rect;->right:I

    add-int/2addr v1, v8

    sub-int/2addr v0, v1

    invoke-static {v0, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    goto :goto_8

    :pswitch_3
    iget-object v0, p0, Landroid/support/v7/widget/aj;->i:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v1, p0, Landroid/support/v7/widget/aj;->H:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    iget-object v4, p0, Landroid/support/v7/widget/aj;->H:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    add-int/2addr v1, v4

    sub-int/2addr v0, v1

    invoke-static {v0, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    goto :goto_8

    :cond_a
    move v7, v0

    goto/16 :goto_5

    :cond_b
    move v6, v2

    goto/16 :goto_4

    :cond_c
    move-object v5, v0

    move v0, v2

    goto/16 :goto_3

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch -0x2
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method a(Landroid/content/Context;Z)Landroid/support/v7/widget/af;
    .locals 1

    new-instance v0, Landroid/support/v7/widget/af;

    invoke-direct {v0, p1, p2}, Landroid/support/v7/widget/af;-><init>(Landroid/content/Context;Z)V

    return-object v0
.end method

.method public a()V
    .locals 8

    const/4 v3, 0x1

    const/4 v7, -0x2

    const/4 v1, 0x0

    const/4 v5, -0x1

    invoke-direct {p0}, Landroid/support/v7/widget/aj;->f()I

    move-result v2

    invoke-virtual {p0}, Landroid/support/v7/widget/aj;->n()Z

    move-result v6

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    iget v4, p0, Landroid/support/v7/widget/aj;->o:I

    invoke-static {v0, v4}, Landroid/support/v4/widget/i;->a(Landroid/widget/PopupWindow;I)V

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {p0}, Landroid/support/v7/widget/aj;->i()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/h/p;->m(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget v0, p0, Landroid/support/v7/widget/aj;->l:I

    if-ne v0, v5, :cond_4

    move v4, v5

    :goto_1
    iget v0, p0, Landroid/support/v7/widget/aj;->k:I

    if-ne v0, v5, :cond_a

    if-eqz v6, :cond_6

    :goto_2
    if-eqz v6, :cond_8

    iget-object v6, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    iget v0, p0, Landroid/support/v7/widget/aj;->l:I

    if-ne v0, v5, :cond_7

    move v0, v5

    :goto_3
    invoke-virtual {v6, v0}, Landroid/widget/PopupWindow;->setWidth(I)V

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setHeight(I)V

    move v6, v2

    :goto_4
    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    iget-boolean v2, p0, Landroid/support/v7/widget/aj;->v:Z

    if-nez v2, :cond_2

    iget-boolean v2, p0, Landroid/support/v7/widget/aj;->u:Z

    if-nez v2, :cond_2

    move v1, v3

    :cond_2
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {p0}, Landroid/support/v7/widget/aj;->i()Landroid/view/View;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/widget/aj;->m:I

    iget v3, p0, Landroid/support/v7/widget/aj;->n:I

    if-gez v4, :cond_3

    move v4, v5

    :cond_3
    if-gez v6, :cond_c

    :goto_5
    invoke-virtual/range {v0 .. v5}, Landroid/widget/PopupWindow;->update(Landroid/view/View;IIII)V

    goto :goto_0

    :cond_4
    iget v0, p0, Landroid/support/v7/widget/aj;->l:I

    if-ne v0, v7, :cond_5

    invoke-virtual {p0}, Landroid/support/v7/widget/aj;->i()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    move v4, v0

    goto :goto_1

    :cond_5
    iget v0, p0, Landroid/support/v7/widget/aj;->l:I

    move v4, v0

    goto :goto_1

    :cond_6
    move v2, v5

    goto :goto_2

    :cond_7
    move v0, v1

    goto :goto_3

    :cond_8
    iget-object v6, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    iget v0, p0, Landroid/support/v7/widget/aj;->l:I

    if-ne v0, v5, :cond_9

    move v0, v5

    :goto_6
    invoke-virtual {v6, v0}, Landroid/widget/PopupWindow;->setWidth(I)V

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0, v5}, Landroid/widget/PopupWindow;->setHeight(I)V

    move v6, v2

    goto :goto_4

    :cond_9
    move v0, v1

    goto :goto_6

    :cond_a
    iget v0, p0, Landroid/support/v7/widget/aj;->k:I

    if-ne v0, v7, :cond_b

    move v6, v2

    goto :goto_4

    :cond_b
    iget v0, p0, Landroid/support/v7/widget/aj;->k:I

    move v6, v0

    goto :goto_4

    :cond_c
    move v5, v6

    goto :goto_5

    :cond_d
    iget v0, p0, Landroid/support/v7/widget/aj;->l:I

    if-ne v0, v5, :cond_13

    move v0, v5

    :goto_7
    iget v4, p0, Landroid/support/v7/widget/aj;->k:I

    if-ne v4, v5, :cond_15

    move v2, v5

    :cond_e
    :goto_8
    iget-object v4, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v4, v0}, Landroid/widget/PopupWindow;->setWidth(I)V

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setHeight(I)V

    invoke-direct {p0, v3}, Landroid/support/v7/widget/aj;->c(Z)V

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    iget-boolean v2, p0, Landroid/support/v7/widget/aj;->v:Z

    if-nez v2, :cond_16

    iget-boolean v2, p0, Landroid/support/v7/widget/aj;->u:Z

    if-nez v2, :cond_16

    :goto_9
    invoke-virtual {v0, v3}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    iget-object v1, p0, Landroid/support/v7/widget/aj;->D:Landroid/support/v7/widget/aj$d;

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setTouchInterceptor(Landroid/view/View$OnTouchListener;)V

    iget-boolean v0, p0, Landroid/support/v7/widget/aj;->s:Z

    if-eqz v0, :cond_f

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    iget-boolean v1, p0, Landroid/support/v7/widget/aj;->r:Z

    invoke-static {v0, v1}, Landroid/support/v4/widget/i;->a(Landroid/widget/PopupWindow;Z)V

    :cond_f
    sget-object v0, Landroid/support/v7/widget/aj;->h:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_10

    :try_start_0
    sget-object v0, Landroid/support/v7/widget/aj;->h:Ljava/lang/reflect/Method;

    iget-object v1, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Landroid/support/v7/widget/aj;->I:Landroid/graphics/Rect;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_10
    :goto_a
    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {p0}, Landroid/support/v7/widget/aj;->i()Landroid/view/View;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/widget/aj;->m:I

    iget v3, p0, Landroid/support/v7/widget/aj;->n:I

    iget v4, p0, Landroid/support/v7/widget/aj;->t:I

    invoke-static {v0, v1, v2, v3, v4}, Landroid/support/v4/widget/i;->a(Landroid/widget/PopupWindow;Landroid/view/View;III)V

    iget-object v0, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    invoke-virtual {v0, v5}, Landroid/support/v7/widget/af;->setSelection(I)V

    iget-boolean v0, p0, Landroid/support/v7/widget/aj;->J:Z

    if-eqz v0, :cond_11

    iget-object v0, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    invoke-virtual {v0}, Landroid/support/v7/widget/af;->isInTouchMode()Z

    move-result v0

    if-eqz v0, :cond_12

    :cond_11
    invoke-virtual {p0}, Landroid/support/v7/widget/aj;->m()V

    :cond_12
    iget-boolean v0, p0, Landroid/support/v7/widget/aj;->J:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/aj;->f:Landroid/os/Handler;

    iget-object v1, p0, Landroid/support/v7/widget/aj;->F:Landroid/support/v7/widget/aj$a;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_0

    :cond_13
    iget v0, p0, Landroid/support/v7/widget/aj;->l:I

    if-ne v0, v7, :cond_14

    invoke-virtual {p0}, Landroid/support/v7/widget/aj;->i()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    goto :goto_7

    :cond_14
    iget v0, p0, Landroid/support/v7/widget/aj;->l:I

    goto/16 :goto_7

    :cond_15
    iget v4, p0, Landroid/support/v7/widget/aj;->k:I

    if-eq v4, v7, :cond_e

    iget v2, p0, Landroid/support/v7/widget/aj;->k:I

    goto/16 :goto_8

    :cond_16
    move v3, v1

    goto :goto_9

    :catch_0
    move-exception v0

    const-string v1, "ListPopupWindow"

    const-string v2, "Could not invoke setEpicenterBounds on PopupWindow"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_a
.end method

.method public a(I)V
    .locals 0

    iput p1, p0, Landroid/support/v7/widget/aj;->x:I

    return-void
.end method

.method public a(Landroid/graphics/Rect;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v7/widget/aj;->I:Landroid/graphics/Rect;

    return-void
.end method

.method public a(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public a(Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v7/widget/aj;->B:Landroid/widget/AdapterView$OnItemClickListener;

    return-void
.end method

.method public a(Landroid/widget/ListAdapter;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v7/widget/aj;->y:Landroid/database/DataSetObserver;

    if-nez v0, :cond_3

    new-instance v0, Landroid/support/v7/widget/aj$b;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/aj$b;-><init>(Landroid/support/v7/widget/aj;)V

    iput-object v0, p0, Landroid/support/v7/widget/aj;->y:Landroid/database/DataSetObserver;

    :cond_0
    :goto_0
    iput-object p1, p0, Landroid/support/v7/widget/aj;->j:Landroid/widget/ListAdapter;

    iget-object v0, p0, Landroid/support/v7/widget/aj;->j:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v7/widget/aj;->y:Landroid/database/DataSetObserver;

    invoke-interface {p1, v0}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    :cond_1
    iget-object v0, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    iget-object v1, p0, Landroid/support/v7/widget/aj;->j:Landroid/widget/ListAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/af;->setAdapter(Landroid/widget/ListAdapter;)V

    :cond_2
    return-void

    :cond_3
    iget-object v0, p0, Landroid/support/v7/widget/aj;->j:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/aj;->j:Landroid/widget/ListAdapter;

    iget-object v1, p0, Landroid/support/v7/widget/aj;->y:Landroid/database/DataSetObserver;

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    goto :goto_0
.end method

.method public a(Landroid/widget/PopupWindow$OnDismissListener;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    return-void
.end method

.method public a(Z)V
    .locals 1

    iput-boolean p1, p0, Landroid/support/v7/widget/aj;->J:Z

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    return-void
.end method

.method public b(I)V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    return-void
.end method

.method public b(Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v7/widget/aj;->z:Landroid/view/View;

    return-void
.end method

.method public b(Z)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/aj;->s:Z

    iput-boolean p1, p0, Landroid/support/v7/widget/aj;->r:Z

    return-void
.end method

.method public c()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    invoke-direct {p0}, Landroid/support/v7/widget/aj;->b()V

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    iput-object v1, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    iget-object v0, p0, Landroid/support/v7/widget/aj;->f:Landroid/os/Handler;

    iget-object v1, p0, Landroid/support/v7/widget/aj;->e:Landroid/support/v7/widget/aj$e;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method public c(I)V
    .locals 0

    iput p1, p0, Landroid/support/v7/widget/aj;->m:I

    return-void
.end method

.method public d(I)V
    .locals 1

    iput p1, p0, Landroid/support/v7/widget/aj;->n:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/aj;->p:Z

    return-void
.end method

.method public d()Z
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    return v0
.end method

.method public e()Landroid/widget/ListView;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    return-object v0
.end method

.method public e(I)V
    .locals 0

    iput p1, p0, Landroid/support/v7/widget/aj;->t:I

    return-void
.end method

.method public f(I)V
    .locals 0

    iput p1, p0, Landroid/support/v7/widget/aj;->l:I

    return-void
.end method

.method public g(I)V
    .locals 2

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Landroid/support/v7/widget/aj;->H:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    iget-object v0, p0, Landroid/support/v7/widget/aj;->H:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    iget-object v1, p0, Landroid/support/v7/widget/aj;->H:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->right:I

    add-int/2addr v0, v1

    add-int/2addr v0, p1

    iput v0, p0, Landroid/support/v7/widget/aj;->l:I

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/aj;->f(I)V

    goto :goto_0
.end method

.method public g()Z
    .locals 1

    iget-boolean v0, p0, Landroid/support/v7/widget/aj;->J:Z

    return v0
.end method

.method public h()Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public h(I)V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    return-void
.end method

.method public i()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/widget/aj;->z:Landroid/view/View;

    return-object v0
.end method

.method public i(I)V
    .locals 2

    iget-object v0, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    invoke-virtual {p0}, Landroid/support/v7/widget/aj;->d()Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/af;->setListSelectionHidden(Z)V

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/af;->setSelection(I)V

    invoke-virtual {v0}, Landroid/support/v7/widget/af;->getChoiceMode()I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/support/v7/widget/af;->setItemChecked(IZ)V

    :cond_0
    return-void
.end method

.method public j()I
    .locals 1

    iget v0, p0, Landroid/support/v7/widget/aj;->m:I

    return v0
.end method

.method public k()I
    .locals 1

    iget-boolean v0, p0, Landroid/support/v7/widget/aj;->p:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Landroid/support/v7/widget/aj;->n:I

    goto :goto_0
.end method

.method public l()I
    .locals 1

    iget v0, p0, Landroid/support/v7/widget/aj;->l:I

    return v0
.end method

.method public m()V
    .locals 2

    iget-object v0, p0, Landroid/support/v7/widget/aj;->c:Landroid/support/v7/widget/af;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/af;->setListSelectionHidden(Z)V

    invoke-virtual {v0}, Landroid/support/v7/widget/af;->requestLayout()V

    :cond_0
    return-void
.end method

.method public n()Z
    .locals 2

    iget-object v0, p0, Landroid/support/v7/widget/aj;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getInputMethodMode()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
