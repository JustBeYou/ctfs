.class final Landroid/support/v4/f/b$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/support/v4/f/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/f/b;->a(Landroid/content/Context;Landroid/support/v4/f/a;Landroid/widget/TextView;III)Landroid/graphics/Typeface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/support/v4/f/c$a",
        "<",
        "Landroid/graphics/Typeface;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/ref/WeakReference;

.field final synthetic b:Landroid/widget/TextView;

.field final synthetic c:I


# direct methods
.method constructor <init>(Ljava/lang/ref/WeakReference;Landroid/widget/TextView;I)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/f/b$2;->a:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Landroid/support/v4/f/b$2;->b:Landroid/widget/TextView;

    iput p3, p0, Landroid/support/v4/f/b$2;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Typeface;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/f/b$2;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/f/b$2;->b:Landroid/widget/TextView;

    iget v1, p0, Landroid/support/v4/f/b$2;->c:I

    invoke-virtual {v0, p1, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    :cond_0
    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/graphics/Typeface;

    invoke-virtual {p0, p1}, Landroid/support/v4/f/b$2;->a(Landroid/graphics/Typeface;)V

    return-void
.end method
