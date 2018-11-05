---
layout: post
title: Replacing .map.flatten with .flatMap
date: 2018-10-28 09:30:00 +0000
tags: scala
---

This is something IntelliJ whinges about.
I'm still not entirely sure what `flatMap` does, but here's an example which illustrates the change I made.

Before:

```scala
val listOfListOfNames: List[List[String]]

val people: List[People] =
  listOfListOfNames
    .map { names: List[String] =>
      val maybeFirst: Option[String] = getFirstName(names)
      maybeFirst.map { name => Person(name) }
    }
    .flatten
```

After:

```scala
val people: List[People] =
  listOfListOfNames
    .flatMap { names: List[String] =>
      val maybeFirst: Option[String] = getFirstName(names)
      maybeFirst.map { name => Person(name) }
    }
```
