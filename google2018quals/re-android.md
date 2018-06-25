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

Hoping that there are no obfuscation techniques or anything like that, let's try to get the source code using a great online Java decompiler I like to use: http://www.javadecompilers.com/apk
