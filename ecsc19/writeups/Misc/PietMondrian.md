# ECSC 2019
**Author: Feraru Mihail - mihailferaru2000@gmail.com - littlewho**

## Piet Mondrian (100): Misc

### Proof of flag
```
ECSC{e647c19e4fc7838bf764abbdcb0c1f08adca163cdadfb889bee5201fc4397e 5d}
```

### Summary
The image was hidding another 3 PNG files. Piet is referring to an esolang. The source code is encoded into images.

### Proof of solving
Binwalk output:
```
DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
0             0x0             JPEG image data, EXIF standard
12            0xC             TIFF image data, big-endian, offset of first image directory: 8
678           0x2A6           Copyright string: "Copyright (c) 1998 Hewlett-Packard Company"
11115         0x2B6B          Copyright string: "Copyright (c) 1998 Hewlett-Packard Company"
19274         0x4B4A          Unix path: /www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmlns:xmpMM="http
22957         0x59AD          Copyright string: "Copyright (c) 1998 Hewlett-Packard Company"
345743        0x5468F         PNG image, 820 x 820, 8-bit colormap, non-interlaced
346832        0x54AD0         Zlib compressed data, best compression
1020129       0xF90E1         PNG image, 860 x 860, 8-bit colormap, non-interlaced
1021218       0xF9522         Zlib compressed data, best compression
1761760       0x1AE1E0        PNG image, 880 x 880, 8-bit colormap, non-interlaced
1762849       0x1AE621        Zlib compressed data, best compression
```
I executed each "script" here: https://www.bertnase.de/npiet/npiet-execute.php
