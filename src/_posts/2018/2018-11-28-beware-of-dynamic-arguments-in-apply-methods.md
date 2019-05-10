---
layout: post
title: "Scala: Beware of dynamic arguments in apply() methods"
date: 2018-11-28 13:41:00 +0000
tags: scala
---

Here's a minimal of a case class we had in the platform:

```scala
import java.time.Instant

case class Modifiable(
  createdDate: Instant = Instant.now,
  lastModifiedDate: Instant = Instant.now
)
```

We had a test that created an instance of `Modifiable`, then asserted that the creation
and last modified date were the same -- and normally that's fine.

But occasionally there'd be a delay, and you'd get a new instance of `Modifiable` that had a different created and last modified date.
The fix:

```scala
case object Modifiable {
  def apply(createdDate: Instant = Instant.now): Modifiable =
    Modifiable(
      createdDate = createdDate,
      lastModifiedDate = createdDate
    )
}
```
