---
layout: post
title: "Scala: Named capturing groups in a regex"
date: 2019-05-07 17:37:38 +0100
tags: scala snippets
---

```scala
import scala.util.matching.Regex

val r: Regex = new Regex("([a-z]*) ([0-9]*)", "name", "number")

val m = r.findFirstMatchIn("lexie 25").get

println(m.group("name"))  	// "lexie"
println(m.group("number"))  // 25
```
