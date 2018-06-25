.class final Landroid/support/v7/view/menu/t;
.super Landroid/support/v7/view/menu/m;

# interfaces
.implements Landroid/support/v7/view/menu/o;
.implements Landroid/view/View$OnKeyListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Landroid/widget/PopupWindow$OnDismissListener;


# instance fields
.field final a:Landroid/support/v7/widget/am;

.field b:Landroid/view/View;

.field private final c:Landroid/content/Context;

.field private final d:Landroid/support/v7/view/menu/h;

.field private final e:Landroid/support/v7/view/menu/g;

.field private final f:Z

.field private final g:I

.field private final h:I

.field private final i:I

.field private final j:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private final k:Landroid/view/View$OnAttachStateChangeListener;

.field private l:Landroid/widget/PopupWindow$OnDismissListener;

.field private m:Landroid/view/View;

.field private n:Landroid/support/v7/view/menu/o$a;

.field private o:Landroid/view/ViewTreeObserver;

.field private p:Z

.field private q:Z

.field private r:I

.field private s:I

.field private t:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/support/v7/view/menu/h;Landroid/view/View;IIZ)V
    .locals 5

    invoke-direct {p0}, Landroid/support/v7/view/menu/m;-><init>()V

    new-instance v0, Landroid/support/v7/view/menu/t$1;

    invoke-direct {v0, p0}, Landroid/support/v7/view/menu/t$1;-><init>(Landroid/support/v7/view/menu/t;)V

    iput-object v0, p0, Landroid/support/v7/view/menu/t;->j:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    new-instance v0, Landroid/support/v7/view/menu/t$2;

    invoke-direct {v0, p0}, Landroid/support/v7/view/menu/t$2;-><init>(Landroid/support/v7/view/menu/t;)V

    iput-object v0, p0, Landroid/support/v7/view/menu/t;->k:Landroid/view/View$OnAttachStateChangeListener;

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/view/menu/t;->s:I

    iput-object p1, p0, Landroid/support/v7/view/menu/t;->c:Landroid/content/Context;

    iput-object p2, p0, Landroid/support/v7/view/menu/t;->d:Landroid/support/v7/view/menu/h;

    iput-boolean p6, p0, Landroid/support/v7/view/menu/t;->f:Z

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    new-instance v1, Landroid/support/v7/view/menu/g;

    iget-boolean v2, p0, Landroid/support/v7/view/menu/t;->f:Z

    invoke-direct {v1, p2, v0, v2}, Landroid/support/v7/view/menu/g;-><init>(Landroid/support/v7/view/menu/h;Landroid/view/LayoutInflater;Z)V

    iput-object v1, p0, Landroid/support/v7/view/menu/t;->e:Landroid/support/v7/view/menu/g;

    iput p4, p0, Landroid/support/v7/view/menu/t;->h:I

    iput p5, p0, Landroid/support/v7/view/menu/t;->i:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/lit8 v1, v1, 0x2

    sget v2, Landroid/support/v7/a/a$d;->abc_config_prefDialogWidth:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/view/menu/t;->g:I

    iput-object p3, p0, Landroid/support/v7/view/menu/t;->m:Landroid/view/View;

    new-instance v0, Landroid/support/v7/widget/am;

    iget-object v1, p0, Landroid/support/v7/view/menu/t;->c:Landroid/content/Context;

    const/4 v2, 0x0

    iget v3, p0, Landroid/support/v7/view/menu/t;->h:I

    iget v4, p0, Landroid/support/v7/view/menu/t;->i:I

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/support/v7/widget/am;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iput-object v0, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    invoke-virtual {p2, p0, p1}, Landroid/support/v7/view/menu/h;->a(Landroid/support/v7/view/menu/o;Landroid/content/Context;)V

    return-void
.end method

.method static synthetic a(Landroid/support/v7/view/menu/t;)Landroid/view/ViewTreeObserver;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->o:Landroid/view/ViewTreeObserver;

    return-object v0
.end method

.method static synthetic a(Landroid/support/v7/view/menu/t;Landroid/view/ViewTreeObserver;)Landroid/view/ViewTreeObserver;
    .locals 0

    iput-object p1, p0, Landroid/support/v7/view/menu/t;->o:Landroid/view/ViewTreeObserver;

    return-object p1
.end method

.method static synthetic b(Landroid/support/v7/view/menu/t;)Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->j:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    return-object v0
.end method

.method private h()Z
    .locals 7

    const/4 v6, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {p0}, Landroid/support/v7/view/menu/t;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return v2

    :cond_0
    iget-boolean v0, p0, Landroid/support/v7/view/menu/t;->p:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->m:Landroid/view/View;

    if-nez v0, :cond_2

    :cond_1
    move v2, v3

    goto :goto_0

    :cond_2
    iget-object v0, p0, Landroid/support/v7/view/menu/t;->m:Landroid/view/View;

    iput-object v0, p0, Landroid/support/v7/view/menu/t;->b:Landroid/view/View;

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    invoke-virtual {v0, p0}, Landroid/support/v7/widget/am;->a(Landroid/widget/PopupWindow$OnDismissListener;)V

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    invoke-virtual {v0, p0}, Landroid/support/v7/widget/am;->a(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/am;->a(Z)V

    iget-object v1, p0, Landroid/support/v7/view/menu/t;->b:Landroid/view/View;

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->o:Landroid/view/ViewTreeObserver;

    if-nez v0, :cond_7

    move v0, v2

    :goto_1
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v4

    iput-object v4, p0, Landroid/support/v7/view/menu/t;->o:Landroid/view/ViewTreeObserver;

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->o:Landroid/view/ViewTreeObserver;

    iget-object v4, p0, Landroid/support/v7/view/menu/t;->j:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v4}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_3
    iget-object v0, p0, Landroid/support/v7/view/menu/t;->k:Landroid/view/View$OnAttachStateChangeListener;

    invoke-virtual {v1, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/am;->b(Landroid/view/View;)V

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    iget v1, p0, Landroid/support/v7/view/menu/t;->s:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/am;->e(I)V

    iget-boolean v0, p0, Landroid/support/v7/view/menu/t;->q:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->e:Landroid/support/v7/view/menu/g;

    iget-object v1, p0, Landroid/support/v7/view/menu/t;->c:Landroid/content/Context;

    iget v4, p0, Landroid/support/v7/view/menu/t;->g:I

    invoke-static {v0, v6, v1, v4}, Landroid/support/v7/view/menu/t;->a(Landroid/widget/ListAdapter;Landroid/view/ViewGroup;Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Landroid/support/v7/view/menu/t;->r:I

    iput-boolean v2, p0, Landroid/support/v7/view/menu/t;->q:Z

    :cond_4
    iget-object v0, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    iget v1, p0, Landroid/support/v7/view/menu/t;->r:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/am;->g(I)V

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/am;->h(I)V

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    invoke-virtual {p0}, Landroid/support/v7/view/menu/t;->g()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/am;->a(Landroid/graphics/Rect;)V

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    invoke-virtual {v0}, Landroid/support/v7/widget/am;->a()V

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    invoke-virtual {v0}, Landroid/support/v7/widget/am;->e()Landroid/widget/ListView;

    move-result-object v4

    invoke-virtual {v4, p0}, Landroid/widget/ListView;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    iget-boolean v0, p0, Landroid/support/v7/view/menu/t;->t:Z

    if-eqz v0, :cond_6

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->d:Landroid/support/v7/view/menu/h;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/h;->m()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->c:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Landroid/support/v7/a/a$g;->abc_popup_menu_header_item_layout:I

    invoke-virtual {v0, v1, v4, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    const v1, 0x1020016

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    if-eqz v1, :cond_5

    iget-object v5, p0, Landroid/support/v7/view/menu/t;->d:Landroid/support/v7/view/menu/h;

    invoke-virtual {v5}, Landroid/support/v7/view/menu/h;->m()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_5
    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->setEnabled(Z)V

    invoke-virtual {v4, v0, v6, v3}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    :cond_6
    iget-object v0, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    iget-object v1, p0, Landroid/support/v7/view/menu/t;->e:Landroid/support/v7/view/menu/g;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/am;->a(Landroid/widget/ListAdapter;)V

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    invoke-virtual {v0}, Landroid/support/v7/widget/am;->a()V

    goto/16 :goto_0

    :cond_7
    move v0, v3

    goto/16 :goto_1
.end method


# virtual methods
.method public a()V
    .locals 2

    invoke-direct {p0}, Landroid/support/v7/view/menu/t;->h()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "StandardMenuPopup cannot be used without an anchor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method

.method public a(I)V
    .locals 0

    iput p1, p0, Landroid/support/v7/view/menu/t;->s:I

    return-void
.end method

.method public a(Landroid/support/v7/view/menu/h;)V
    .locals 0

    return-void
.end method

.method public a(Landroid/support/v7/view/menu/h;Z)V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->d:Landroid/support/v7/view/menu/h;

    if-eq p1, v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Landroid/support/v7/view/menu/t;->c()V

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->n:Landroid/support/v7/view/menu/o$a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->n:Landroid/support/v7/view/menu/o$a;

    invoke-interface {v0, p1, p2}, Landroid/support/v7/view/menu/o$a;->a(Landroid/support/v7/view/menu/h;Z)V

    goto :goto_0
.end method

.method public a(Landroid/support/v7/view/menu/o$a;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v7/view/menu/t;->n:Landroid/support/v7/view/menu/o$a;

    return-void
.end method

.method public a(Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v7/view/menu/t;->m:Landroid/view/View;

    return-void
.end method

.method public a(Landroid/widget/PopupWindow$OnDismissListener;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v7/view/menu/t;->l:Landroid/widget/PopupWindow$OnDismissListener;

    return-void
.end method

.method public a(Z)V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->e:Landroid/support/v7/view/menu/g;

    invoke-virtual {v0, p1}, Landroid/support/v7/view/menu/g;->a(Z)V

    return-void
.end method

.method public a(Landroid/support/v7/view/menu/u;)Z
    .locals 8

    const/4 v7, 0x0

    invoke-virtual {p1}, Landroid/support/v7/view/menu/u;->hasVisibleItems()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Landroid/support/v7/view/menu/n;

    iget-object v1, p0, Landroid/support/v7/view/menu/t;->c:Landroid/content/Context;

    iget-object v3, p0, Landroid/support/v7/view/menu/t;->b:Landroid/view/View;

    iget-boolean v4, p0, Landroid/support/v7/view/menu/t;->f:Z

    iget v5, p0, Landroid/support/v7/view/menu/t;->h:I

    iget v6, p0, Landroid/support/v7/view/menu/t;->i:I

    move-object v2, p1

    invoke-direct/range {v0 .. v6}, Landroid/support/v7/view/menu/n;-><init>(Landroid/content/Context;Landroid/support/v7/view/menu/h;Landroid/view/View;ZII)V

    iget-object v1, p0, Landroid/support/v7/view/menu/t;->n:Landroid/support/v7/view/menu/o$a;

    invoke-virtual {v0, v1}, Landroid/support/v7/view/menu/n;->a(Landroid/support/v7/view/menu/o$a;)V

    invoke-static {p1}, Landroid/support/v7/view/menu/m;->b(Landroid/support/v7/view/menu/h;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/view/menu/n;->a(Z)V

    iget v1, p0, Landroid/support/v7/view/menu/t;->s:I

    invoke-virtual {v0, v1}, Landroid/support/v7/view/menu/n;->a(I)V

    iget-object v1, p0, Landroid/support/v7/view/menu/t;->l:Landroid/widget/PopupWindow$OnDismissListener;

    invoke-virtual {v0, v1}, Landroid/support/v7/view/menu/n;->a(Landroid/widget/PopupWindow$OnDismissListener;)V

    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/v7/view/menu/t;->l:Landroid/widget/PopupWindow$OnDismissListener;

    iget-object v1, p0, Landroid/support/v7/view/menu/t;->d:Landroid/support/v7/view/menu/h;

    invoke-virtual {v1, v7}, Landroid/support/v7/view/menu/h;->a(Z)V

    iget-object v1, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    invoke-virtual {v1}, Landroid/support/v7/widget/am;->j()I

    move-result v1

    iget-object v2, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    invoke-virtual {v2}, Landroid/support/v7/widget/am;->k()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/view/menu/n;->a(II)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->n:Landroid/support/v7/view/menu/o$a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->n:Landroid/support/v7/view/menu/o$a;

    invoke-interface {v0, p1}, Landroid/support/v7/view/menu/o$a;->a(Landroid/support/v7/view/menu/h;)Z

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    move v0, v7

    goto :goto_0
.end method

.method public b(I)V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/am;->c(I)V

    return-void
.end method

.method public b(Z)V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/view/menu/t;->q:Z

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->e:Landroid/support/v7/view/menu/g;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->e:Landroid/support/v7/view/menu/g;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/g;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method public b()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public c()V
    .locals 1

    invoke-virtual {p0}, Landroid/support/v7/view/menu/t;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    invoke-virtual {v0}, Landroid/support/v7/widget/am;->c()V

    :cond_0
    return-void
.end method

.method public c(I)V
    .locals 1

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/am;->d(I)V

    return-void
.end method

.method public c(Z)V
    .locals 0

    iput-boolean p1, p0, Landroid/support/v7/view/menu/t;->t:Z

    return-void
.end method

.method public d()Z
    .locals 1

    iget-boolean v0, p0, Landroid/support/v7/view/menu/t;->p:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    invoke-virtual {v0}, Landroid/support/v7/widget/am;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public e()Landroid/widget/ListView;
    .locals 1

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->a:Landroid/support/v7/widget/am;

    invoke-virtual {v0}, Landroid/support/v7/widget/am;->e()Landroid/widget/ListView;

    move-result-object v0

    return-object v0
.end method

.method public onDismiss()V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/view/menu/t;->p:Z

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->d:Landroid/support/v7/view/menu/h;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/h;->close()V

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->o:Landroid/view/ViewTreeObserver;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->o:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->b:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/view/menu/t;->o:Landroid/view/ViewTreeObserver;

    :cond_0
    iget-object v0, p0, Landroid/support/v7/view/menu/t;->o:Landroid/view/ViewTreeObserver;

    iget-object v1, p0, Landroid/support/v7/view/menu/t;->j:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/view/menu/t;->o:Landroid/view/ViewTreeObserver;

    :cond_1
    iget-object v0, p0, Landroid/support/v7/view/menu/t;->b:Landroid/view/View;

    iget-object v1, p0, Landroid/support/v7/view/menu/t;->k:Landroid/view/View$OnAttachStateChangeListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->l:Landroid/widget/PopupWindow$OnDismissListener;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v7/view/menu/t;->l:Landroid/widget/PopupWindow$OnDismissListener;

    invoke-interface {v0}, Landroid/widget/PopupWindow$OnDismissListener;->onDismiss()V

    :cond_2
    return-void
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 2

    const/4 v0, 0x1

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-ne v1, v0, :cond_0

    const/16 v1, 0x52

    if-ne p2, v1, :cond_0

    invoke-virtual {p0}, Landroid/support/v7/view/menu/t;->c()V

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
