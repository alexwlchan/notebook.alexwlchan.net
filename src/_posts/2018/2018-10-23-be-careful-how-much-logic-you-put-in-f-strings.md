---
layout: post
title: Be careful how much logic you put in f-strings
date: 2018-10-23 09:12:00 +0000
tags: python
---

As witnessed here:

![](/images/overzealous-f-strings.png)

I'd been trying to lowercase the ".JPG" file extension, but I got the `.lower()` outside the braces.
The f-string was sufficiently complex for me not to notice -- next time, handle that separately.
