.class public Landroid/arch/a/a/b;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/arch/a/a/b$c;,
        Landroid/arch/a/a/b$d;,
        Landroid/arch/a/a/b$b;,
        Landroid/arch/a/a/b$a;,
        Landroid/arch/a/a/b$e;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Ljava/util/Map$Entry",
        "<TK;TV;>;>;"
    }
.end annotation


# instance fields
.field private a:Landroid/arch/a/a/b$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/arch/a/a/b$c",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private b:Landroid/arch/a/a/b$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/arch/a/a/b$c",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private c:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Ljava/lang/Object",
            "<TK;TV;>;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private d:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Landroid/arch/a/a/b;->c:Ljava/util/WeakHashMap;

    const/4 v0, 0x0

    iput v0, p0, Landroid/arch/a/a/b;->d:I

    return-void
.end method

.method static synthetic a(Landroid/arch/a/a/b;)Landroid/arch/a/a/b$c;
    .locals 1

    iget-object v0, p0, Landroid/arch/a/a/b;->a:Landroid/arch/a/a/b$c;

    return-object v0
.end method


# virtual methods
.method public a()I
    .locals 1

    iget v0, p0, Landroid/arch/a/a/b;->d:I

    return v0
.end method

.method public b()Ljava/util/Iterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    new-instance v0, Landroid/arch/a/a/b$b;

    iget-object v1, p0, Landroid/arch/a/a/b;->b:Landroid/arch/a/a/b$c;

    iget-object v2, p0, Landroid/arch/a/a/b;->a:Landroid/arch/a/a/b$c;

    invoke-direct {v0, v1, v2}, Landroid/arch/a/a/b$b;-><init>(Landroid/arch/a/a/b$c;Landroid/arch/a/a/b$c;)V

    iget-object v1, p0, Landroid/arch/a/a/b;->c:Ljava/util/WeakHashMap;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public c()Landroid/arch/a/a/b$d;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/arch/a/a/b",
            "<TK;TV;>.d;"
        }
    .end annotation

    new-instance v0, Landroid/arch/a/a/b$d;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroid/arch/a/a/b$d;-><init>(Landroid/arch/a/a/b;Landroid/arch/a/a/b$1;)V

    iget-object v1, p0, Landroid/arch/a/a/b;->c:Ljava/util/WeakHashMap;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public d()Ljava/util/Map$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, Landroid/arch/a/a/b;->a:Landroid/arch/a/a/b$c;

    return-object v0
.end method

.method public e()Ljava/util/Map$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, Landroid/arch/a/a/b;->b:Landroid/arch/a/a/b$c;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p1, p0, :cond_1

    move v2, v1

    :cond_0
    :goto_0
    return v2

    :cond_1
    instance-of v0, p1, Landroid/arch/a/a/b;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/arch/a/a/b;

    invoke-virtual {p0}, Landroid/arch/a/a/b;->a()I

    move-result v0

    invoke-virtual {p1}, Landroid/arch/a/a/b;->a()I

    move-result v3

    if-ne v0, v3, :cond_0

    invoke-virtual {p0}, Landroid/arch/a/a/b;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-virtual {p1}, Landroid/arch/a/a/b;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    if-nez v0, :cond_3

    if-nez v5, :cond_0

    :cond_3
    if-eqz v0, :cond_2

    invoke-interface {v0, v5}, Ljava/util/Map$Entry;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_5

    move v0, v1

    :goto_1
    move v2, v0

    goto :goto_0

    :cond_5
    move v0, v2

    goto :goto_1
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    new-instance v0, Landroid/arch/a/a/b$a;

    iget-object v1, p0, Landroid/arch/a/a/b;->a:Landroid/arch/a/a/b$c;

    iget-object v2, p0, Landroid/arch/a/a/b;->b:Landroid/arch/a/a/b$c;

    invoke-direct {v0, v1, v2}, Landroid/arch/a/a/b$a;-><init>(Landroid/arch/a/a/b$c;Landroid/arch/a/a/b$c;)V

    iget-object v1, p0, Landroid/arch/a/a/b;->c:Ljava/util/WeakHashMap;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "["

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/arch/a/a/b;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ", "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_1
    const-string v0, "]"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
