---
layout: post
title: Add a consistent border around an image
date: 2018-11-15 13:04:03 +0000
tags: imagemagick
---

This command removes all the empty whitespace around an image, then adds a consistent border to what's left:

```shell
convert \
  -trim "$FILENAME" \
  -bordercolor white -border 50x50 \
  "$OUTFILE"
```

Useful for making diagrams and so on.
