---
layout: post
title: Beware of NullPointerException when using 'val' in abstract traits
date: 2018-11-06 13:37:57 +0000
tags: scala
---

A simplified version of the code I was using is below:

```scala
class NotifierApp() extends WellcomeApp {
  val configModule = new Configurable { }
}

trait WellcomeApp {
  val configModule: Configurable
  val injector: Injector = Guice.createInjector(configModule)
}
```

Whenever I tried to run it, the code threw a NullPointerException while creating the Guice injector.
Why?

I think it's because `injector` was being evaluated when the trait was created, and before the new value of `configModule` had been set in `NotifierApp`.
Thus `injector` is nil, and that blows up the injector.
Changing this to use "def" instead of "val" seemed to fix the bug.

For more context, see [wellcometrust/platform#2971](https://github.com/wellcometrust/platform/pull/2971).
