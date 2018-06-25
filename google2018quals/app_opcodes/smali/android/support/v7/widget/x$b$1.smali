.class Landroid/support/v7/widget/x$b$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v7/widget/x$b;-><init>(Landroid/support/v7/widget/x;Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/support/v7/widget/x;

.field final synthetic b:Landroid/support/v7/widget/x$b;


# direct methods
.method constructor <init>(Landroid/support/v7/widget/x$b;Landroid/support/v7/widget/x;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v7/widget/x$b$1;->b:Landroid/support/v7/widget/x$b;

    iput-object p2, p0, Landroid/support/v7/widget/x$b$1;->a:Landroid/support/v7/widget/x;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/x$b$1;->b:Landroid/support/v7/widget/x$b;

    iget-object v0, v0, Landroid/support/v7/widget/x$b;->b:Landroid/support/v7/widget/x;

    invoke-virtual {v0, p3}, Landroid/support/v7/widget/x;->setSelection(I)V

    iget-object v0, p0, Landroid/support/v7/widget/x$b$1;->b:Landroid/support/v7/widget/x$b;

    iget-object v0, v0, Landroid/support/v7/widget/x$b;->b:Landroid/support/v7/widget/x;

    invoke-virtual {v0}, Landroid/support/v7/widget/x;->getOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/x$b$1;->b:Landroid/support/v7/widget/x$b;

    iget-object v0, v0, Landroid/support/v7/widget/x$b;->b:Landroid/support/v7/widget/x;

    iget-object v1, p0, Landroid/support/v7/widget/x$b$1;->b:Landroid/support/v7/widget/x$b;

    iget-object v1, v1, Landroid/support/v7/widget/x$b;->a:Landroid/widget/ListAdapter;

    invoke-interface {v1, p3}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v2

    invoke-virtual {v0, p2, p3, v2, v3}, Landroid/support/v7/widget/x;->performItemClick(Landroid/view/View;IJ)Z

    :cond_0
    iget-object v0, p0, Landroid/support/v7/widget/x$b$1;->b:Landroid/support/v7/widget/x$b;

    invoke-virtual {v0}, Landroid/support/v7/widget/x$b;->c()V

    return-void
.end method
