---
layout: post
title: "Is Apache using threaded MPMs or pre-fork?"
date: 2019-05-12 08:56:13 +0100
tags: apache dreamwidth
---

As part of setting up [a Dreamwidth installation](http://wiki.dreamwidth.net/notes/Dreamwidth_Scratch_Installation#Configure_Apache_2), you have to check if Apache is using threaded MPMs or pre-fork.

Even from the linked page, it wasn't clear to me how to work out which it was using.
Poking around on Stack Overflow let me to this solution:

```console
# apache2ctl -t -D DUMP_MODULES | grep mpm_
mpm_event_module (shared)
```

This is using threaded MPMs; you'd see a different module if it was using pre-fork.
