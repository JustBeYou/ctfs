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

The files of interest will be in the same path, but this time we see that their extension is `smali`. `smali` it's the intermediary format for Java `dex` (dalvik executables) files. A good reference for the opcodes is here http://pallergabor.uw.hu/androidblog/dalvik_opcodes.html
