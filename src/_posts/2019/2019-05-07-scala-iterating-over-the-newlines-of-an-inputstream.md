---
layout: post
title: "Scala: Iterating over the newlines of an InputStream"
date: 2019-05-07 17:38:01 +0100
tags:
---

```scala
import java.io.{BufferedReader, InputStream, InputStreamReader}

val is = new InputStream(…)

val bufferedReader = new BufferedReader(new InputStreamReader(is))

Iterator
  .continually(bufferedReader.readLine())
  .takeWhile { _ != null }
  .foreach { line => println(line) }
```
