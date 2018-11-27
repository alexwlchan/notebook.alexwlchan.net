---
layout: post
title: Beware the order of inheritance in Scala
date: 2018-07-17 23:27:06 +0100
tags: scala
---

Context:

We used to have a monorepo, but build times led us to remove the storage library and ship it separately. I’m migrating the repo to use the external lib, and exactly one of the tests is throwing a NullPointerException for an unknown reason.

Cue much cursing and debugging…

The lesson here is “the order in which you extend traits may be significant”. Commit message reproduced below.

---

[platform#c546f2a](https://github.com/wellcometrust/platform/pull/2428/commits/c546f2ad17c33df83b45184ca23c389ee3dc58f4)

Why inheritance is evil, ingestor edition

This test was throwing a NullPointerException when run with the new
storage library, which is pretty annoying and unhelpful.  The exception
came from the `eventually` block that checks if the Elasticsearch
container has started, which hadn't changed.  Hmm.

I removed all the test cases, and it wasn't anything to do with them.
Then I started removing the traits we extend from (I'd call them mixins
in Python, but I don't know what they're called in Scala).  The only
difference came when I removed both `Messaging` and `S3`, which makes
more sense because at least the `S3` trait has changed.

Digging another level down, note that the `S3` trait has the
`ExtendedPatience` trait, which sets some patience configuration for
`eventually` blocks.  If you remove that, the problem goes away.

And then it hits me.

When we removed the storage library, we created a second copy of
`ExtendedPatience` -- and the two are somehow treading on each other's
toes, and throwing this (unhelpful) error.  Even though they contain
identical configuration.

This isn't the only test that has both instances of `ExtendedPatience`,
so what's different?

Hmm, the order in which the traits are extended is different... and
therein lies the bug.

I hate computers.
