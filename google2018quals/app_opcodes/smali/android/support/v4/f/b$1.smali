.class final Landroid/support/v4/f/b$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


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
        "Ljava/util/concurrent/Callable",
        "<",
        "Landroid/graphics/Typeface;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Landroid/support/v4/f/a;

.field final synthetic c:I

.field final synthetic d:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/support/v4/f/a;ILjava/lang/String;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/f/b$1;->a:Landroid/content/Context;

    iput-object p2, p0, Landroid/support/v4/f/b$1;->b:Landroid/support/v4/f/a;

    iput p3, p0, Landroid/support/v4/f/b$1;->c:I

    iput-object p4, p0, Landroid/support/v4/f/b$1;->d:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()Landroid/graphics/Typeface;
    .locals 3

    iget-object v0, p0, Landroid/support/v4/f/b$1;->a:Landroid/content/Context;

    iget-object v1, p0, Landroid/support/v4/f/b$1;->b:Landroid/support/v4/f/a;

    iget v2, p0, Landroid/support/v4/f/b$1;->c:I

    invoke-static {v0, v1, v2}, Landroid/support/v4/f/b;->a(Landroid/content/Context;Landroid/support/v4/f/a;I)Landroid/graphics/Typeface;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/support/v4/f/b;->a()Landroid/support/v4/g/g;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v4/f/b$1;->d:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Landroid/support/v4/g/g;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method public synthetic call()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Landroid/support/v4/f/b$1;->a()Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0
.end method
