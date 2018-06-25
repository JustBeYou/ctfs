.class public Lcom/google/ctf/shallweplayagame/a;
.super Landroid/widget/RelativeLayout;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/ctf/shallweplayagame/a$a;
    }
.end annotation


# static fields
.field static final a:Ljava/lang/String;


# instance fields
.field b:Landroid/content/Context;

.field c:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Landroid/animation/AnimatorSet;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/google/ctf/shallweplayagame/a$a;

.field e:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/lang/String;

    const/16 v1, 0x2622

    invoke-static {v1}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    sput-object v0, Lcom/google/ctf/shallweplayagame/a;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/Queue;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Queue",
            "<",
            "Landroid/animation/AnimatorSet;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/google/ctf/shallweplayagame/a;->b:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/ctf/shallweplayagame/a;->c:Ljava/util/Queue;

    sget-object v0, Lcom/google/ctf/shallweplayagame/a$a;->a:Lcom/google/ctf/shallweplayagame/a$a;

    iput-object v0, p0, Lcom/google/ctf/shallweplayagame/a;->d:Lcom/google/ctf/shallweplayagame/a$a;

    invoke-direct {p0}, Lcom/google/ctf/shallweplayagame/a;->b()V

    invoke-direct {p0}, Lcom/google/ctf/shallweplayagame/a;->c()V

    return-void
.end method

.method private a(I)I
    .locals 3

    iget-object v0, p0, Lcom/google/ctf/shallweplayagame/a;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x1

    int-to-float v2, p1

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    invoke-static {v1, v2, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method private a(Ljava/lang/String;I)Landroid/animation/AnimatorSet;
    .locals 7

    const/4 v6, 0x2

    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    new-instance v1, Lcom/google/ctf/shallweplayagame/a$1;

    invoke-direct {v1, p0}, Lcom/google/ctf/shallweplayagame/a$1;-><init>(Lcom/google/ctf/shallweplayagame/a;)V

    new-array v2, v6, [F

    fill-array-data v2, :array_0

    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v2

    int-to-long v4, p2

    invoke-virtual {v2, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    invoke-virtual {v2, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v3, Lcom/google/ctf/shallweplayagame/a$2;

    invoke-direct {v3, p0, p1}, Lcom/google/ctf/shallweplayagame/a$2;-><init>(Lcom/google/ctf/shallweplayagame/a;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    new-array v3, v6, [F

    fill-array-data v3, :array_1

    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v3

    int-to-long v4, p2

    invoke-virtual {v3, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    invoke-virtual {v3, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v1, Lcom/google/ctf/shallweplayagame/a$3;

    invoke-direct {v1, p0}, Lcom/google/ctf/shallweplayagame/a$3;-><init>(Lcom/google/ctf/shallweplayagame/a;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    return-object v0

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private b()V
    .locals 3

    const/4 v2, 0x5

    invoke-direct {p0, v2}, Lcom/google/ctf/shallweplayagame/a;->a(I)I

    move-result v0

    invoke-direct {p0, v2}, Lcom/google/ctf/shallweplayagame/a;->a(I)I

    move-result v1

    invoke-virtual {p0, v0, v1, v0, v1}, Lcom/google/ctf/shallweplayagame/a;->setPadding(IIII)V

    const/16 v0, 0x64

    invoke-direct {p0, v0}, Lcom/google/ctf/shallweplayagame/a;->a(I)I

    move-result v0

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v0, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-direct {p0, v2}, Lcom/google/ctf/shallweplayagame/a;->a(I)I

    move-result v0

    invoke-virtual {v1, v0, v0, v0, v0}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {p0, v1}, Lcom/google/ctf/shallweplayagame/a;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/google/ctf/shallweplayagame/a;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060054

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/ctf/shallweplayagame/a;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method private c()V
    .locals 3

    const/4 v2, -0x2

    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/google/ctf/shallweplayagame/a;->b:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/ctf/shallweplayagame/a;->e:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/google/ctf/shallweplayagame/a;->e:Landroid/widget/TextView;

    sget-object v1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    iget-object v0, p0, Lcom/google/ctf/shallweplayagame/a;->e:Landroid/widget/TextView;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/google/ctf/shallweplayagame/a;->e:Landroid/widget/TextView;

    const/16 v1, 0x14

    invoke-direct {p0, v1}, Lcom/google/ctf/shallweplayagame/a;->a(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iget-object v1, p0, Lcom/google/ctf/shallweplayagame/a;->e:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/google/ctf/shallweplayagame/a;->e:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v0, p0, Lcom/google/ctf/shallweplayagame/a;->e:Landroid/widget/TextView;

    const-string v1, " "

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/google/ctf/shallweplayagame/a;->e:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Lcom/google/ctf/shallweplayagame/a;->addView(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/ctf/shallweplayagame/a$a;I)V
    .locals 2

    iput-object p1, p0, Lcom/google/ctf/shallweplayagame/a;->d:Lcom/google/ctf/shallweplayagame/a$a;

    sget-object v0, Lcom/google/ctf/shallweplayagame/a$a;->a:Lcom/google/ctf/shallweplayagame/a$a;

    if-ne p1, v0, :cond_0

    const-string v0, " "

    :goto_0
    iget-object v1, p0, Lcom/google/ctf/shallweplayagame/a;->c:Ljava/util/Queue;

    invoke-direct {p0, v0, p2}, Lcom/google/ctf/shallweplayagame/a;->a(Ljava/lang/String;I)Landroid/animation/AnimatorSet;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    return-void

    :cond_0
    sget-object v0, Lcom/google/ctf/shallweplayagame/a$a;->b:Lcom/google/ctf/shallweplayagame/a$a;

    if-ne p1, v0, :cond_1

    const-string v0, "X"

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/google/ctf/shallweplayagame/a$a;->c:Lcom/google/ctf/shallweplayagame/a$a;

    if-ne p1, v0, :cond_2

    const-string v0, "O"

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/google/ctf/shallweplayagame/a;->a:Ljava/lang/String;

    goto :goto_0
.end method

.method public a()Z
    .locals 2

    iget-object v0, p0, Lcom/google/ctf/shallweplayagame/a;->d:Lcom/google/ctf/shallweplayagame/a$a;

    sget-object v1, Lcom/google/ctf/shallweplayagame/a$a;->a:Lcom/google/ctf/shallweplayagame/a$a;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setValue(Lcom/google/ctf/shallweplayagame/a$a;)V
    .locals 1

    const/16 v0, 0x64

    invoke-virtual {p0, p1, v0}, Lcom/google/ctf/shallweplayagame/a;->a(Lcom/google/ctf/shallweplayagame/a$a;I)V

    return-void
.end method
