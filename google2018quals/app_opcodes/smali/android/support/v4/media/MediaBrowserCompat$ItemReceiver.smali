.class Landroid/support/v4/media/MediaBrowserCompat$ItemReceiver;
.super Landroid/support/v4/e/b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaBrowserCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ItemReceiver"
.end annotation


# instance fields
.field private final d:Ljava/lang/String;

.field private final e:Landroid/support/v4/media/MediaBrowserCompat$b;


# virtual methods
.method protected a(ILandroid/os/Bundle;)V
    .locals 2

    if-eqz p2, :cond_0

    const-class v0, Landroid/support/v4/media/MediaBrowserCompat;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    :cond_0
    if-nez p1, :cond_1

    if-eqz p2, :cond_1

    const-string v0, "media_item"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$ItemReceiver;->e:Landroid/support/v4/media/MediaBrowserCompat$b;

    iget-object v1, p0, Landroid/support/v4/media/MediaBrowserCompat$ItemReceiver;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/support/v4/media/MediaBrowserCompat$b;->a(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_2
    const-string v0, "media_item"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    if-eqz v0, :cond_3

    instance-of v1, v0, Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    if-eqz v1, :cond_4

    :cond_3
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowserCompat$ItemReceiver;->e:Landroid/support/v4/media/MediaBrowserCompat$b;

    check-cast v0, Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    invoke-virtual {v1, v0}, Landroid/support/v4/media/MediaBrowserCompat$b;->a(Landroid/support/v4/media/MediaBrowserCompat$MediaItem;)V

    goto :goto_0

    :cond_4
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$ItemReceiver;->e:Landroid/support/v4/media/MediaBrowserCompat$b;

    iget-object v1, p0, Landroid/support/v4/media/MediaBrowserCompat$ItemReceiver;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/support/v4/media/MediaBrowserCompat$b;->a(Ljava/lang/String;)V

    goto :goto_0
.end method
