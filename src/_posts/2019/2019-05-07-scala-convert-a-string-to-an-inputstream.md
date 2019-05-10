---
layout: post
title: "Scala: Convert a string to an InputStream and back"
date: 2019-05-07 17:36:43 +0100
tags: scala snippets
---

String to stream:

```scala
import java.io.InputStream

import org.apache.commons.io.IOUtils

def toInputStream(s: String): InputStream =
  IOUtils.toInputStream(s, "UTF-8")
```

Stream to string:

```scala
import java.io.InputStream

import scala.io.Source

def fromInputStream(is: InputStream): String =
  Source.fromInputStream(is).mkString
```
