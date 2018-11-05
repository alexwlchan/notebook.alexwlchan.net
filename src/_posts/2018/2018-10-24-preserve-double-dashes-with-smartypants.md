---
layout: post
title: Preserve double dashes with Smartypants
date: 2018-10-24 21:51:00 +0000
tags: markdown smartypants
---

If you want to write a double dash (`--`) in a Markdown document, and not have Smartypants turn it into an en dash (`–`), add a [zero-width space](https://en.wikipedia.org/wiki/Zero-width_space) to the command:

```
-&#8203;-force-with-lease
--force-with-lease
```

Compare:

> -&#8203;-force-with-lease <br>
> --force-with-lease
