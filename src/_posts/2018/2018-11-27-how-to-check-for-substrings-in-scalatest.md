---
layout: post
title: How to check for substrings in scalatest
date: 2018-11-27 11:13:02 +0000
tags: scala
---

I feel like I have to look this up on a regular basis, so here's a quick reminder of the assert pattern you use:

```scala
class StringTest extends FunSpec with Matchers {
  it("recognises substrings") {
    "foo bar baz" should include("foo")
    "foo bar baz" should include("bar")
    "foo bar baz" should include("baz")

    "foo bar baz" should not include("hello")
  }
}
```
