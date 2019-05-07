---
layout: post
title: "Scala: Convert a string to an InputStream"
date: 2019-05-07 17:36:43 +0100
tags: scala snippets
---

```scala
import org.apache.commons.io.IOUtils

def toInputStream(s: String): InputStream =
  IOUtils.toInputStream(s, "UTF-8")
```
