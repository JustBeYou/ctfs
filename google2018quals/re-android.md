Shall we play a game?
===

The challenge is pretty straightforward, but a write-up could be appreciated by some too, so let's go. We have an APK file and a simple description: "Win the game 1,000,000 times to get the flag.". 

OK, so we should run this app somehow, the simplest it to install it on an Android phone, but maybe you haven't one (Google it's up upset on you now :disappointed:), so I will list some other possibilities:
* Bluestacks/Genymotion Emulator
* QEMU-arm
* Shashlik
* ARC Welder on Google Chrome

Some of them could be true pain to configure on some systems. In my case I have a Genymotion Emulator configured and an Android phone. 

NOTE: On most devices/emulators we will need to sign the APK in order to install it. We can use ZipSigner from Google Play or generate manually a key and sign with something like jarsigner or apktool.

![](images/1.png)

So, we have a Tic-Tac-Toe game and we need to win it 1 million times. If you are a pro player I think you could give it a try, but let's have a different approach here. Probably there is some counter for won games, we could modify the app to increase it by a big number and win in only one round.

Hoping that there are no obfuscation techniques or anything like that, let's try to get the source code using a great online Java decompiler I like to use: http://www.javadecompilers.com/apk . After exploring a little bit, we see that the interesting things for us are in  `app/com/google/ctf/shallweplayagame/`:
```bash
[littlewho@sweetHome google2018quals]$ ls app/com/google/ctf/shallweplayagame/
C0644N.java  C0649a.java  C0652b.java  GameActivity.java
[littlewho@sweetHome google2018quals]$
```

`GameActivity.java` seems to be the most obvious place where all the events happen. Here, we see in the method `public void onClick(View view)` checks for X won, draw or O won. The method that is called when X win, it's the following (I added few comments to explain things):
```java
    void m3215n() {
        // empty the board
        for (int i = 0; i < 3; i++) {
            for (int i2 = 0; i2 < 3; i2++) {
                this.f2327l[i2][i].m3222a(C0648a.EMPTY, 25);
            }
        }
        // play the animations
        m3212k();

        // our wins counter
        this.f2330o++;
        // some strange calculations on the flag probably
        Object _ = C0644N.m3217_(Integer.valueOf(2), C0644N.f2338e, Integer.valueOf(2));
        C0644N.m3217_(Integer.valueOf(2), C0644N.f2339f, _, this.f2332q);
        this.f2332q = (byte[]) C0644N.m3217_(Integer.valueOf(2), C0644N.f2340g, _);
        if (this.f2330o == 1000000) {
            m3214m(); // show the flag
            return;
        }
        // update the score table
        ((TextView) findViewById(R.id.score)).setText(String.format("%d / %d", new Object[]{Integer.valueOf(this.f2330o), Integer.valueOf(1000000)}));
    }
```

I think that if we simply modify the wins counter by 1 million, we've got the flag. But we can't just modify this code and recompile, we'll need to use apktool to decompile to Java opcodes, change the opcode and build again.
```
[littlewho@sweetHome google2018quals]$ apktool d app.apk -o app_opcodes
I: Using Apktool 2.3.3 on app.apk
I: Loading resource table...
I: Decoding AndroidManifest.xml with resources...
S: WARNING: Could not write to (/home/littlewho/.local/share/apktool/framework), using /tmp instead...
S: Please be aware this is a volatile directory and frameworks could go missing, please utilize --frame-path if the default storage directory is unavailable
I: Loading resource table from file: /tmp/1.apk
I: Regular manifest package...
I: Decoding file-resources...
I: Decoding values */* XMLs...
I: Baksmaling classes.dex...
I: Copying assets and libs...
I: Copying unknown files...
I: Copying original files...
```

The files of interest will be almost in the same path (`app_opcodes/smali/com/google/ctf/shallweplayagame`), but this time we see that their extension is `smali`. `smali` it's the intermediary format for Java `dex` (dalvik executables) files. A good reference for the opcodes is here http://pallergabor.uw.hu/androidblog/dalvik_opcodes.html

`onClick` method is still here, but it look a lot more different. If we take a close look, we can see the same elements, conditions:
```
902| if-eqz v0, :cond_0
889| if-eqz v0, :cond_1
...
944| if-eqz v1, :cond_4
...
```
method calls and variables (you won't see variables as usual, instead it uses `vXX` registers to manipulate instances addresses, values and so on):
```
896|    iget-object v0, p0, Lcom/google/ctf/shallweplayagame/GameActivity;->m:Ljava/util/Queue; // get an object refernce into the v0 register
897|
898|    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z // call the method isEmpty on it
899|
900|    move-result v0 // get the result
...
```

If we take a look at the Java source code, we see that after the third condition we have a call to the method that increment the winning conter, so it should be the third condition in the `smali` too.
```
931| invoke-virtual {p0}, Lcom/google/ctf/shallweplayagame/GameActivity;->n()V // p0 is the first parameter of current method, in this case, 'this' reference
```
And looking at this method, we see the value `0xf4240` stored as a constant and that's 1 million in decimal, so we are in the right place.
```
.method n()V
    .locals 10

    const v9, 0xf4240

    const/4 v8, 0x1

    const/4 v7, 0x3

    const/4 v1, 0x0

    const/4 v6, 0x2

    move v2, v1
    ...
```
After those declarations, we have the code for the first two nested loops:
```
    :goto_0
    if-ge v2, v7, :cond_1

    move v0, v1

    :goto_1
    if-ge v0, v7, :cond_0

    iget-object v3, p0, Lcom/google/ctf/shallweplayagame/GameActivity;->l:[[Lcom/google/ctf/shallweplayagame/a;

    aget-object v3, v3, v0

    aget-object v3, v3, v2

    sget-object v4, Lcom/google/ctf/shallweplayagame/a$a;->a:Lcom/google/ctf/shallweplayagame/a$a;

    const/16 v5, 0x19

    invoke-virtual {v3, v4, v5}, Lcom/google/ctf/shallweplayagame/a;->a(Lcom/google/ctf/shallweplayagame/a$a;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0
```
Then, the magic begins:
```
    :cond_1
    // play animations, sounds, etc
    invoke-virtual {p0}, Lcom/google/ctf/shallweplayagame/GameActivity;->k()V

    // get the reference to the winning counter and increase its value by 1
    iget v0, p0, Lcom/google/ctf/shallweplayagame/GameActivity;->o:I

    add-int/lit8 v0, v0, 0x1

    ... some strange calculations on the flag I think ...

    // get the reference again
    iget v0, p0, Lcom/google/ctf/shallweplayagame/GameActivity;->o:I

    // compare the counter with v9 (1 million constant)
    if-ne v0, v9, :cond_2

    // call the method that display the flag
    invoke-virtual {p0}, Lcom/google/ctf/shallweplayagame/GameActivity;->m()V
```

