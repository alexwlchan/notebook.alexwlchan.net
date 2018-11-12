---
layout: post
title: Failing to find an implicit ObjectStore when it wants an ExecutionContext
date: 2018-11-12 15:49:07 +0000
tags: scala wellcome
---

I was getting a complaint about being unable to find an implicit ObjectStore when running some Goobi reader tests:

```
GoobiReaderFeatureTest.scala:75: could not find implicit value for parameter objectStore: uk.ac.wellcome.storage.ObjectStore[java.io.InputStream]

        withTypeVHS[InputStream, GoobiRecordMetadata, R](bucket, table) { vhs =>
                                                                        ^
```

I have no idea why that was the error message, but to save future head-scratching, this was the import I needed to add before it compiled:

```scala
import scala.concurrent.ExecutionContext.Implicits.global
```
