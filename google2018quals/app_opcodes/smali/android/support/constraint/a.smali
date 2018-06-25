.class public Landroid/support/constraint/a;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/constraint/a$a;
    }
.end annotation


# static fields
.field private static final a:[I

.field private static c:Landroid/util/SparseIntArray;


# instance fields
.field private b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Landroid/support/constraint/a$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/4 v4, 0x3

    const/16 v3, 0x3c

    new-array v0, v4, [I

    fill-array-data v0, :array_0

    sput-object v0, Landroid/support/constraint/a;->a:[I

    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    sput-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintLeft_toLeftOf:I

    const/16 v2, 0x19

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintLeft_toRightOf:I

    const/16 v2, 0x1a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintRight_toLeftOf:I

    const/16 v2, 0x1d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintRight_toRightOf:I

    const/16 v2, 0x1e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintTop_toTopOf:I

    const/16 v2, 0x24

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintTop_toBottomOf:I

    const/16 v2, 0x23

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintBottom_toTopOf:I

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintBottom_toBottomOf:I

    invoke-virtual {v0, v1, v4}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintBaseline_toBaselineOf:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_editor_absoluteX:I

    const/4 v2, 0x6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_editor_absoluteY:I

    const/4 v2, 0x7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintGuide_begin:I

    const/16 v2, 0x11

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintGuide_end:I

    const/16 v2, 0x12

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintGuide_percent:I

    const/16 v2, 0x13

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_orientation:I

    const/16 v2, 0x1b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintStart_toEndOf:I

    const/16 v2, 0x20

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintStart_toStartOf:I

    const/16 v2, 0x21

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintEnd_toStartOf:I

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintEnd_toEndOf:I

    const/16 v2, 0x9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_goneMarginLeft:I

    const/16 v2, 0xd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_goneMarginTop:I

    const/16 v2, 0x10

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_goneMarginRight:I

    const/16 v2, 0xe

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_goneMarginBottom:I

    const/16 v2, 0xb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_goneMarginStart:I

    const/16 v2, 0xf

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_goneMarginEnd:I

    const/16 v2, 0xc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintVertical_weight:I

    const/16 v2, 0x28

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintHorizontal_weight:I

    const/16 v2, 0x27

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintHorizontal_chainStyle:I

    const/16 v2, 0x29

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintVertical_chainStyle:I

    const/16 v2, 0x2a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintHorizontal_bias:I

    const/16 v2, 0x14

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintVertical_bias:I

    const/16 v2, 0x25

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintDimensionRatio:I

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintLeft_creator:I

    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintTop_creator:I

    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintRight_creator:I

    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintBottom_creator:I

    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintBaseline_creator:I

    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_layout_marginLeft:I

    const/16 v2, 0x18

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_layout_marginRight:I

    const/16 v2, 0x1c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_layout_marginStart:I

    const/16 v2, 0x1f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_layout_marginEnd:I

    const/16 v2, 0x8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_layout_marginTop:I

    const/16 v2, 0x22

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_layout_marginBottom:I

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_layout_width:I

    const/16 v2, 0x17

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_layout_height:I

    const/16 v2, 0x15

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_visibility:I

    const/16 v2, 0x16

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_alpha:I

    const/16 v2, 0x2b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_elevation:I

    const/16 v2, 0x2c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_rotationX:I

    const/16 v2, 0x2d

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_rotationY:I

    const/16 v2, 0x2e

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_scaleX:I

    const/16 v2, 0x2f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_scaleY:I

    const/16 v2, 0x30

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_transformPivotX:I

    const/16 v2, 0x31

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_transformPivotY:I

    const/16 v2, 0x32

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_translationX:I

    const/16 v2, 0x33

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_translationY:I

    const/16 v2, 0x34

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_translationZ:I

    const/16 v2, 0x35

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintWidth_default:I

    const/16 v2, 0x36

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintHeight_default:I

    const/16 v2, 0x37

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintWidth_max:I

    const/16 v2, 0x38

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintHeight_max:I

    const/16 v2, 0x39

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintWidth_min:I

    const/16 v2, 0x3a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_layout_constraintHeight_min:I

    const/16 v2, 0x3b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    sget-object v0, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/c$a;->ConstraintSet_android_id:I

    const/16 v2, 0x26

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    return-void

    :array_0
    .array-data 4
        0x0
        0x4
        0x8
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/a;->b:Ljava/util/HashMap;

    return-void
.end method

.method private static a(Landroid/content/res/TypedArray;II)I
    .locals 2

    const/4 v1, -0x1

    invoke-virtual {p0, p1, p2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    if-ne v0, v1, :cond_0

    invoke-virtual {p0, p1, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    :cond_0
    return v0
.end method

.method private a(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/support/constraint/a$a;
    .locals 2

    new-instance v0, Landroid/support/constraint/a$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/support/constraint/a$a;-><init>(Landroid/support/constraint/a$1;)V

    sget-object v1, Landroid/support/constraint/c$a;->ConstraintSet:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Landroid/support/constraint/a;->a(Landroid/support/constraint/a$a;Landroid/content/res/TypedArray;)V

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    return-object v0
.end method

.method private a(Landroid/support/constraint/a$a;Landroid/content/res/TypedArray;)V
    .locals 6

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v2

    sget-object v3, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseIntArray;->get(I)I

    move-result v3

    packed-switch v3, :pswitch_data_0

    :pswitch_0
    const-string v3, "ConstraintSet"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown attribute 0x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "   "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    invoke-virtual {v5, v2}, Landroid/util/SparseIntArray;->get(I)I

    move-result v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :pswitch_1
    iget v3, p1, Landroid/support/constraint/a$a;->h:I

    invoke-static {p2, v2, v3}, Landroid/support/constraint/a;->a(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->h:I

    goto :goto_1

    :pswitch_2
    iget v3, p1, Landroid/support/constraint/a$a;->i:I

    invoke-static {p2, v2, v3}, Landroid/support/constraint/a;->a(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->i:I

    goto :goto_1

    :pswitch_3
    iget v3, p1, Landroid/support/constraint/a$a;->j:I

    invoke-static {p2, v2, v3}, Landroid/support/constraint/a;->a(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->j:I

    goto :goto_1

    :pswitch_4
    iget v3, p1, Landroid/support/constraint/a$a;->k:I

    invoke-static {p2, v2, v3}, Landroid/support/constraint/a;->a(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->k:I

    goto :goto_1

    :pswitch_5
    iget v3, p1, Landroid/support/constraint/a$a;->l:I

    invoke-static {p2, v2, v3}, Landroid/support/constraint/a;->a(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->l:I

    goto :goto_1

    :pswitch_6
    iget v3, p1, Landroid/support/constraint/a$a;->m:I

    invoke-static {p2, v2, v3}, Landroid/support/constraint/a;->a(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->m:I

    goto :goto_1

    :pswitch_7
    iget v3, p1, Landroid/support/constraint/a$a;->n:I

    invoke-static {p2, v2, v3}, Landroid/support/constraint/a;->a(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->n:I

    goto :goto_1

    :pswitch_8
    iget v3, p1, Landroid/support/constraint/a$a;->o:I

    invoke-static {p2, v2, v3}, Landroid/support/constraint/a;->a(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->o:I

    goto :goto_1

    :pswitch_9
    iget v3, p1, Landroid/support/constraint/a$a;->p:I

    invoke-static {p2, v2, v3}, Landroid/support/constraint/a;->a(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->p:I

    goto :goto_1

    :pswitch_a
    iget v3, p1, Landroid/support/constraint/a$a;->x:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->x:I

    goto :goto_1

    :pswitch_b
    iget v3, p1, Landroid/support/constraint/a$a;->y:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->y:I

    goto :goto_1

    :pswitch_c
    iget v3, p1, Landroid/support/constraint/a$a;->e:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->e:I

    goto :goto_1

    :pswitch_d
    iget v3, p1, Landroid/support/constraint/a$a;->f:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->f:I

    goto :goto_1

    :pswitch_e
    iget v3, p1, Landroid/support/constraint/a$a;->g:F

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->g:F

    goto :goto_1

    :pswitch_f
    iget v3, p1, Landroid/support/constraint/a$a;->z:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->z:I

    goto/16 :goto_1

    :pswitch_10
    iget v3, p1, Landroid/support/constraint/a$a;->q:I

    invoke-static {p2, v2, v3}, Landroid/support/constraint/a;->a(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->q:I

    goto/16 :goto_1

    :pswitch_11
    iget v3, p1, Landroid/support/constraint/a$a;->r:I

    invoke-static {p2, v2, v3}, Landroid/support/constraint/a;->a(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->r:I

    goto/16 :goto_1

    :pswitch_12
    iget v3, p1, Landroid/support/constraint/a$a;->s:I

    invoke-static {p2, v2, v3}, Landroid/support/constraint/a;->a(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->s:I

    goto/16 :goto_1

    :pswitch_13
    iget v3, p1, Landroid/support/constraint/a$a;->t:I

    invoke-static {p2, v2, v3}, Landroid/support/constraint/a;->a(Landroid/content/res/TypedArray;II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->n:I

    goto/16 :goto_1

    :pswitch_14
    iget v3, p1, Landroid/support/constraint/a$a;->H:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->H:I

    goto/16 :goto_1

    :pswitch_15
    iget v3, p1, Landroid/support/constraint/a$a;->I:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->I:I

    goto/16 :goto_1

    :pswitch_16
    iget v3, p1, Landroid/support/constraint/a$a;->J:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->J:I

    goto/16 :goto_1

    :pswitch_17
    iget v3, p1, Landroid/support/constraint/a$a;->K:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->K:I

    goto/16 :goto_1

    :pswitch_18
    iget v3, p1, Landroid/support/constraint/a$a;->M:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->M:I

    goto/16 :goto_1

    :pswitch_19
    iget v3, p1, Landroid/support/constraint/a$a;->L:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->L:I

    goto/16 :goto_1

    :pswitch_1a
    iget v3, p1, Landroid/support/constraint/a$a;->u:F

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->u:F

    goto/16 :goto_1

    :pswitch_1b
    iget v3, p1, Landroid/support/constraint/a$a;->v:F

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->v:F

    goto/16 :goto_1

    :pswitch_1c
    iget v3, p1, Landroid/support/constraint/a$a;->A:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->A:I

    goto/16 :goto_1

    :pswitch_1d
    iget v3, p1, Landroid/support/constraint/a$a;->B:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->B:I

    goto/16 :goto_1

    :pswitch_1e
    iget v3, p1, Landroid/support/constraint/a$a;->F:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->F:I

    goto/16 :goto_1

    :pswitch_1f
    iget v3, p1, Landroid/support/constraint/a$a;->E:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->E:I

    goto/16 :goto_1

    :pswitch_20
    iget v3, p1, Landroid/support/constraint/a$a;->C:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->C:I

    goto/16 :goto_1

    :pswitch_21
    iget v3, p1, Landroid/support/constraint/a$a;->D:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->D:I

    goto/16 :goto_1

    :pswitch_22
    iget v3, p1, Landroid/support/constraint/a$a;->b:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->b:I

    goto/16 :goto_1

    :pswitch_23
    iget v3, p1, Landroid/support/constraint/a$a;->c:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->c:I

    goto/16 :goto_1

    :pswitch_24
    iget v3, p1, Landroid/support/constraint/a$a;->G:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->G:I

    sget-object v2, Landroid/support/constraint/a;->a:[I

    iget v3, p1, Landroid/support/constraint/a$a;->G:I

    aget v2, v2, v3

    iput v2, p1, Landroid/support/constraint/a$a;->G:I

    goto/16 :goto_1

    :pswitch_25
    iget v3, p1, Landroid/support/constraint/a$a;->R:F

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->R:F

    goto/16 :goto_1

    :pswitch_26
    const/4 v3, 0x1

    iput-boolean v3, p1, Landroid/support/constraint/a$a;->S:Z

    iget v3, p1, Landroid/support/constraint/a$a;->T:F

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->T:F

    goto/16 :goto_1

    :pswitch_27
    iget v3, p1, Landroid/support/constraint/a$a;->U:F

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->U:F

    goto/16 :goto_1

    :pswitch_28
    iget v3, p1, Landroid/support/constraint/a$a;->V:F

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->V:F

    goto/16 :goto_1

    :pswitch_29
    iget v3, p1, Landroid/support/constraint/a$a;->W:F

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->W:F

    goto/16 :goto_1

    :pswitch_2a
    iget v3, p1, Landroid/support/constraint/a$a;->X:F

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->X:F

    goto/16 :goto_1

    :pswitch_2b
    iget v3, p1, Landroid/support/constraint/a$a;->Y:F

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->Y:F

    goto/16 :goto_1

    :pswitch_2c
    iget v3, p1, Landroid/support/constraint/a$a;->Z:F

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->Z:F

    goto/16 :goto_1

    :pswitch_2d
    iget v3, p1, Landroid/support/constraint/a$a;->aa:F

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->aa:F

    goto/16 :goto_1

    :pswitch_2e
    iget v3, p1, Landroid/support/constraint/a$a;->ab:F

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->ab:F

    goto/16 :goto_1

    :pswitch_2f
    iget v3, p1, Landroid/support/constraint/a$a;->ac:F

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->ac:F

    goto/16 :goto_1

    :pswitch_30
    iget v3, p1, Landroid/support/constraint/a$a;->N:F

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->N:F

    goto/16 :goto_1

    :pswitch_31
    iget v3, p1, Landroid/support/constraint/a$a;->O:F

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->O:F

    goto/16 :goto_1

    :pswitch_32
    iget v3, p1, Landroid/support/constraint/a$a;->Q:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->Q:I

    goto/16 :goto_1

    :pswitch_33
    iget v3, p1, Landroid/support/constraint/a$a;->P:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->P:I

    goto/16 :goto_1

    :pswitch_34
    iget v3, p1, Landroid/support/constraint/a$a;->d:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p1, Landroid/support/constraint/a$a;->d:I

    goto/16 :goto_1

    :pswitch_35
    invoke-virtual {p2, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Landroid/support/constraint/a$a;->w:Ljava/lang/String;

    goto/16 :goto_1

    :pswitch_36
    const-string v3, "ConstraintSet"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unused attribute 0x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "   "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Landroid/support/constraint/a;->c:Landroid/util/SparseIntArray;

    invoke-virtual {v5, v2}, Landroid/util/SparseIntArray;->get(I)I

    move-result v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    :cond_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_21
        :pswitch_8
        :pswitch_7
        :pswitch_35
        :pswitch_a
        :pswitch_b
        :pswitch_1f
        :pswitch_13
        :pswitch_12
        :pswitch_17
        :pswitch_19
        :pswitch_14
        :pswitch_16
        :pswitch_18
        :pswitch_15
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_1a
        :pswitch_23
        :pswitch_24
        :pswitch_22
        :pswitch_1c
        :pswitch_1
        :pswitch_2
        :pswitch_f
        :pswitch_1d
        :pswitch_3
        :pswitch_4
        :pswitch_1e
        :pswitch_10
        :pswitch_11
        :pswitch_20
        :pswitch_6
        :pswitch_5
        :pswitch_1b
        :pswitch_34
        :pswitch_31
        :pswitch_30
        :pswitch_33
        :pswitch_32
        :pswitch_25
        :pswitch_26
        :pswitch_27
        :pswitch_28
        :pswitch_29
        :pswitch_2a
        :pswitch_2b
        :pswitch_2c
        :pswitch_2d
        :pswitch_2e
        :pswitch_2f
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_36
    .end packed-switch
.end method


# virtual methods
.method public a(Landroid/content/Context;I)V
    .locals 5

    const/4 v4, 0x1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v1

    :try_start_0
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    :goto_0
    if-eq v0, v4, :cond_0

    packed-switch v0, :pswitch_data_0

    :goto_1
    :pswitch_0
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    goto :goto_0

    :pswitch_1
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    :cond_0
    :goto_2
    return-void

    :pswitch_2
    :try_start_1
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v2

    invoke-direct {p0, p1, v2}, Landroid/support/constraint/a;->a(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/support/constraint/a$a;

    move-result-object v2

    const-string v3, "Guideline"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, v2, Landroid/support/constraint/a$a;->a:Z

    :cond_1
    iget-object v0, p0, Landroid/support/constraint/a;->b:Ljava/util/HashMap;

    iget v3, v2, Landroid/support/constraint/a$a;->d:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method a(Landroid/support/constraint/ConstraintLayout;)V
    .locals 7

    invoke-virtual {p1}, Landroid/support/constraint/ConstraintLayout;->getChildCount()I

    move-result v3

    new-instance v4, Ljava/util/HashSet;

    iget-object v0, p0, Landroid/support/constraint/a;->b:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    const/4 v0, 0x0

    move v2, v0

    :goto_0
    if-ge v2, v3, :cond_1

    invoke-virtual {p1, v2}, Landroid/support/constraint/ConstraintLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Landroid/support/constraint/a;->b:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Landroid/support/constraint/a;->b:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/a$a;

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/constraint/ConstraintLayout$a;

    invoke-virtual {v0, v1}, Landroid/support/constraint/a$a;->a(Landroid/support/constraint/ConstraintLayout$a;)V

    invoke-virtual {v5, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget v1, v0, Landroid/support/constraint/a$a;->G:I

    invoke-virtual {v5, v1}, Landroid/view/View;->setVisibility(I)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x11

    if-lt v1, v6, :cond_0

    iget v1, v0, Landroid/support/constraint/a$a;->R:F

    invoke-virtual {v5, v1}, Landroid/view/View;->setAlpha(F)V

    iget v1, v0, Landroid/support/constraint/a$a;->U:F

    invoke-virtual {v5, v1}, Landroid/view/View;->setRotationX(F)V

    iget v1, v0, Landroid/support/constraint/a$a;->V:F

    invoke-virtual {v5, v1}, Landroid/view/View;->setRotationY(F)V

    iget v1, v0, Landroid/support/constraint/a$a;->W:F

    invoke-virtual {v5, v1}, Landroid/view/View;->setScaleX(F)V

    iget v1, v0, Landroid/support/constraint/a$a;->X:F

    invoke-virtual {v5, v1}, Landroid/view/View;->setScaleY(F)V

    iget v1, v0, Landroid/support/constraint/a$a;->Y:F

    invoke-virtual {v5, v1}, Landroid/view/View;->setPivotX(F)V

    iget v1, v0, Landroid/support/constraint/a$a;->Z:F

    invoke-virtual {v5, v1}, Landroid/view/View;->setPivotY(F)V

    iget v1, v0, Landroid/support/constraint/a$a;->aa:F

    invoke-virtual {v5, v1}, Landroid/view/View;->setTranslationX(F)V

    iget v1, v0, Landroid/support/constraint/a$a;->ab:F

    invoke-virtual {v5, v1}, Landroid/view/View;->setTranslationY(F)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x15

    if-lt v1, v6, :cond_0

    iget v1, v0, Landroid/support/constraint/a$a;->ac:F

    invoke-virtual {v5, v1}, Landroid/view/View;->setTranslationZ(F)V

    iget-boolean v1, v0, Landroid/support/constraint/a$a;->S:Z

    if-eqz v1, :cond_0

    iget v0, v0, Landroid/support/constraint/a$a;->T:F

    invoke-virtual {v5, v0}, Landroid/view/View;->setElevation(F)V

    :cond_0
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto/16 :goto_0

    :cond_1
    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iget-object v1, p0, Landroid/support/constraint/a;->b:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/constraint/a$a;

    iget-boolean v3, v1, Landroid/support/constraint/a$a;->a:Z

    if-eqz v3, :cond_2

    new-instance v3, Landroid/support/constraint/b;

    invoke-virtual {p1}, Landroid/support/constraint/ConstraintLayout;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/support/constraint/b;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v3, v0}, Landroid/support/constraint/b;->setId(I)V

    invoke-virtual {p1}, Landroid/support/constraint/ConstraintLayout;->b()Landroid/support/constraint/ConstraintLayout$a;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/support/constraint/a$a;->a(Landroid/support/constraint/ConstraintLayout$a;)V

    invoke-virtual {p1, v3, v0}, Landroid/support/constraint/ConstraintLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1

    :cond_3
    return-void
.end method
