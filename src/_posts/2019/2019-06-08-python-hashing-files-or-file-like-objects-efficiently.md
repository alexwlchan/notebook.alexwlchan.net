---
layout: post
title: "Python: hashing files or file-like objects efficiently"
date: 2019-06-08 09:07:13 +0100
tags: snippets python
---

Don't load the whole file into memory; load it a chunk at a time.
Snippet:

```python
import hashlib


def hash_file_ALGORITHM(f, block_size=65536):
    h = hashlib.HASHING_ALGORITHM()
    while True:
        buf = f.read(block_size)
        if not buf:
            break
        h.update(buf)
    return h
```
