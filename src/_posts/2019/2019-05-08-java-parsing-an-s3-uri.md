---
layout: post
title: "Java: parsing an S3 URI"
date: 2019-05-08 12:00:23 +0100
tags: java scala aws
---

```java
import java.net.URI

val loc = new URI("s3://bucket-name/path/to/key.txt")

println(loc.getScheme)  // "s3"
println(loc.getHost)    // "bucket-name"
println(loc.getPath)    // "path/to/key.txt"
```
