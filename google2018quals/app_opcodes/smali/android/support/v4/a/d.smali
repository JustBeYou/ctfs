.class final Landroid/support/v4/a/d;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Landroid/support/v4/a/d;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final a:[I

.field final b:I

.field final c:I

.field final d:Ljava/lang/String;

.field final e:I

.field final f:I

.field final g:Ljava/lang/CharSequence;

.field final h:I

.field final i:Ljava/lang/CharSequence;

.field final j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final l:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/support/v4/a/d$1;

    invoke-direct {v0}, Landroid/support/v4/a/d$1;-><init>()V

    sput-object v0, Landroid/support/v4/a/d;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/a/d;->a:[I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/support/v4/a/d;->b:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/support/v4/a/d;->c:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/a/d;->d:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/support/v4/a/d;->e:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/support/v4/a/d;->f:I

    sget-object v0, Landroid/text/TextUtils;->CHAR_SEQUENCE_CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    iput-object v0, p0, Landroid/support/v4/a/d;->g:Ljava/lang/CharSequence;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/support/v4/a/d;->h:I

    sget-object v0, Landroid/text/TextUtils;->CHAR_SEQUENCE_CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    iput-object v0, p0, Landroid/support/v4/a/d;->i:Ljava/lang/CharSequence;

    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/a/d;->j:Ljava/util/ArrayList;

    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/a/d;->k:Ljava/util/ArrayList;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Landroid/support/v4/a/d;->l:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Landroid/support/v4/a/c;)V
    .locals 7

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v1, p1, Landroid/support/v4/a/c;->c:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    mul-int/lit8 v1, v3, 0x6

    new-array v1, v1, [I

    iput-object v1, p0, Landroid/support/v4/a/d;->a:[I

    iget-boolean v1, p1, Landroid/support/v4/a/c;->j:Z

    if-nez v1, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not on back stack"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    move v2, v0

    move v1, v0

    :goto_0
    if-ge v2, v3, :cond_2

    iget-object v0, p1, Landroid/support/v4/a/c;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/a/c$a;

    iget-object v4, p0, Landroid/support/v4/a/d;->a:[I

    add-int/lit8 v5, v1, 0x1

    iget v6, v0, Landroid/support/v4/a/c$a;->a:I

    aput v6, v4, v1

    iget-object v4, p0, Landroid/support/v4/a/d;->a:[I

    add-int/lit8 v6, v5, 0x1

    iget-object v1, v0, Landroid/support/v4/a/c$a;->b:Landroid/support/v4/a/h;

    if-eqz v1, :cond_1

    iget-object v1, v0, Landroid/support/v4/a/c$a;->b:Landroid/support/v4/a/h;

    iget v1, v1, Landroid/support/v4/a/h;->e:I

    :goto_1
    aput v1, v4, v5

    iget-object v1, p0, Landroid/support/v4/a/d;->a:[I

    add-int/lit8 v4, v6, 0x1

    iget v5, v0, Landroid/support/v4/a/c$a;->c:I

    aput v5, v1, v6

    iget-object v1, p0, Landroid/support/v4/a/d;->a:[I

    add-int/lit8 v5, v4, 0x1

    iget v6, v0, Landroid/support/v4/a/c$a;->d:I

    aput v6, v1, v4

    iget-object v1, p0, Landroid/support/v4/a/d;->a:[I

    add-int/lit8 v4, v5, 0x1

    iget v6, v0, Landroid/support/v4/a/c$a;->e:I

    aput v6, v1, v5

    iget-object v5, p0, Landroid/support/v4/a/d;->a:[I

    add-int/lit8 v1, v4, 0x1

    iget v0, v0, Landroid/support/v4/a/c$a;->f:I

    aput v0, v5, v4

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_1
    const/4 v1, -0x1

    goto :goto_1

    :cond_2
    iget v0, p1, Landroid/support/v4/a/c;->h:I

    iput v0, p0, Landroid/support/v4/a/d;->b:I

    iget v0, p1, Landroid/support/v4/a/c;->i:I

    iput v0, p0, Landroid/support/v4/a/d;->c:I

    iget-object v0, p1, Landroid/support/v4/a/c;->l:Ljava/lang/String;

    iput-object v0, p0, Landroid/support/v4/a/d;->d:Ljava/lang/String;

    iget v0, p1, Landroid/support/v4/a/c;->n:I

    iput v0, p0, Landroid/support/v4/a/d;->e:I

    iget v0, p1, Landroid/support/v4/a/c;->o:I

    iput v0, p0, Landroid/support/v4/a/d;->f:I

    iget-object v0, p1, Landroid/support/v4/a/c;->p:Ljava/lang/CharSequence;

    iput-object v0, p0, Landroid/support/v4/a/d;->g:Ljava/lang/CharSequence;

    iget v0, p1, Landroid/support/v4/a/c;->q:I

    iput v0, p0, Landroid/support/v4/a/d;->h:I

    iget-object v0, p1, Landroid/support/v4/a/c;->r:Ljava/lang/CharSequence;

    iput-object v0, p0, Landroid/support/v4/a/d;->i:Ljava/lang/CharSequence;

    iget-object v0, p1, Landroid/support/v4/a/c;->s:Ljava/util/ArrayList;

    iput-object v0, p0, Landroid/support/v4/a/d;->j:Ljava/util/ArrayList;

    iget-object v0, p1, Landroid/support/v4/a/c;->t:Ljava/util/ArrayList;

    iput-object v0, p0, Landroid/support/v4/a/d;->k:Ljava/util/ArrayList;

    iget-boolean v0, p1, Landroid/support/v4/a/c;->u:Z

    iput-boolean v0, p0, Landroid/support/v4/a/d;->l:Z

    return-void
.end method


# virtual methods
.method public a(Landroid/support/v4/a/n;)Landroid/support/v4/a/c;
    .locals 8

    const/4 v7, 0x1

    const/4 v0, 0x0

    new-instance v3, Landroid/support/v4/a/c;

    invoke-direct {v3, p1}, Landroid/support/v4/a/c;-><init>(Landroid/support/v4/a/n;)V

    move v1, v0

    :goto_0
    iget-object v2, p0, Landroid/support/v4/a/d;->a:[I

    array-length v2, v2

    if-ge v0, v2, :cond_2

    new-instance v4, Landroid/support/v4/a/c$a;

    invoke-direct {v4}, Landroid/support/v4/a/c$a;-><init>()V

    iget-object v2, p0, Landroid/support/v4/a/d;->a:[I

    add-int/lit8 v5, v0, 0x1

    aget v0, v2, v0

    iput v0, v4, Landroid/support/v4/a/c$a;->a:I

    sget-boolean v0, Landroid/support/v4/a/n;->a:Z

    if-eqz v0, :cond_0

    const-string v0, "FragmentManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Instantiate "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v6, " op #"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v6, " base fragment #"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v6, p0, Landroid/support/v4/a/d;->a:[I

    aget v6, v6, v5

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Landroid/support/v4/a/d;->a:[I

    add-int/lit8 v2, v5, 0x1

    aget v0, v0, v5

    if-ltz v0, :cond_1

    iget-object v5, p1, Landroid/support/v4/a/n;->f:Landroid/util/SparseArray;

    invoke-virtual {v5, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/a/h;

    iput-object v0, v4, Landroid/support/v4/a/c$a;->b:Landroid/support/v4/a/h;

    :goto_1
    iget-object v0, p0, Landroid/support/v4/a/d;->a:[I

    add-int/lit8 v5, v2, 0x1

    aget v0, v0, v2

    iput v0, v4, Landroid/support/v4/a/c$a;->c:I

    iget-object v0, p0, Landroid/support/v4/a/d;->a:[I

    add-int/lit8 v2, v5, 0x1

    aget v0, v0, v5

    iput v0, v4, Landroid/support/v4/a/c$a;->d:I

    iget-object v0, p0, Landroid/support/v4/a/d;->a:[I

    add-int/lit8 v5, v2, 0x1

    aget v0, v0, v2

    iput v0, v4, Landroid/support/v4/a/c$a;->e:I

    iget-object v0, p0, Landroid/support/v4/a/d;->a:[I

    add-int/lit8 v2, v5, 0x1

    aget v0, v0, v5

    iput v0, v4, Landroid/support/v4/a/c$a;->f:I

    iget v0, v4, Landroid/support/v4/a/c$a;->c:I

    iput v0, v3, Landroid/support/v4/a/c;->d:I

    iget v0, v4, Landroid/support/v4/a/c$a;->d:I

    iput v0, v3, Landroid/support/v4/a/c;->e:I

    iget v0, v4, Landroid/support/v4/a/c$a;->e:I

    iput v0, v3, Landroid/support/v4/a/c;->f:I

    iget v0, v4, Landroid/support/v4/a/c$a;->f:I

    iput v0, v3, Landroid/support/v4/a/c;->g:I

    invoke-virtual {v3, v4}, Landroid/support/v4/a/c;->a(Landroid/support/v4/a/c$a;)V

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    move v0, v2

    goto/16 :goto_0

    :cond_1
    const/4 v0, 0x0

    iput-object v0, v4, Landroid/support/v4/a/c$a;->b:Landroid/support/v4/a/h;

    goto :goto_1

    :cond_2
    iget v0, p0, Landroid/support/v4/a/d;->b:I

    iput v0, v3, Landroid/support/v4/a/c;->h:I

    iget v0, p0, Landroid/support/v4/a/d;->c:I

    iput v0, v3, Landroid/support/v4/a/c;->i:I

    iget-object v0, p0, Landroid/support/v4/a/d;->d:Ljava/lang/String;

    iput-object v0, v3, Landroid/support/v4/a/c;->l:Ljava/lang/String;

    iget v0, p0, Landroid/support/v4/a/d;->e:I

    iput v0, v3, Landroid/support/v4/a/c;->n:I

    iput-boolean v7, v3, Landroid/support/v4/a/c;->j:Z

    iget v0, p0, Landroid/support/v4/a/d;->f:I

    iput v0, v3, Landroid/support/v4/a/c;->o:I

    iget-object v0, p0, Landroid/support/v4/a/d;->g:Ljava/lang/CharSequence;

    iput-object v0, v3, Landroid/support/v4/a/c;->p:Ljava/lang/CharSequence;

    iget v0, p0, Landroid/support/v4/a/d;->h:I

    iput v0, v3, Landroid/support/v4/a/c;->q:I

    iget-object v0, p0, Landroid/support/v4/a/d;->i:Ljava/lang/CharSequence;

    iput-object v0, v3, Landroid/support/v4/a/c;->r:Ljava/lang/CharSequence;

    iget-object v0, p0, Landroid/support/v4/a/d;->j:Ljava/util/ArrayList;

    iput-object v0, v3, Landroid/support/v4/a/c;->s:Ljava/util/ArrayList;

    iget-object v0, p0, Landroid/support/v4/a/d;->k:Ljava/util/ArrayList;

    iput-object v0, v3, Landroid/support/v4/a/c;->t:Ljava/util/ArrayList;

    iget-boolean v0, p0, Landroid/support/v4/a/d;->l:Z

    iput-boolean v0, v3, Landroid/support/v4/a/c;->u:Z

    invoke-virtual {v3, v7}, Landroid/support/v4/a/c;->a(I)V

    return-object v3
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    const/4 v0, 0x0

    iget-object v1, p0, Landroid/support/v4/a/d;->a:[I

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeIntArray([I)V

    iget v1, p0, Landroid/support/v4/a/d;->b:I

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    iget v1, p0, Landroid/support/v4/a/d;->c:I

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v1, p0, Landroid/support/v4/a/d;->d:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget v1, p0, Landroid/support/v4/a/d;->e:I

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    iget v1, p0, Landroid/support/v4/a/d;->f:I

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v1, p0, Landroid/support/v4/a/d;->g:Ljava/lang/CharSequence;

    invoke-static {v1, p1, v0}, Landroid/text/TextUtils;->writeToParcel(Ljava/lang/CharSequence;Landroid/os/Parcel;I)V

    iget v1, p0, Landroid/support/v4/a/d;->h:I

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v1, p0, Landroid/support/v4/a/d;->i:Ljava/lang/CharSequence;

    invoke-static {v1, p1, v0}, Landroid/text/TextUtils;->writeToParcel(Ljava/lang/CharSequence;Landroid/os/Parcel;I)V

    iget-object v1, p0, Landroid/support/v4/a/d;->j:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    iget-object v1, p0, Landroid/support/v4/a/d;->k:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    iget-boolean v1, p0, Landroid/support/v4/a/d;->l:Z

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
