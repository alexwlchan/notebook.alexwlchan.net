---
layout: post
title: "DynamoDB: Getting the latest version of a range key associated with a hash key"
date: 2019-05-15 20:25:24 +0100
tags: aws aws:dynamodb java scala
---

I have yet to come up with a way to describe this that isn't completely horrible; this DynamoDB query with the document client will get you the lowest/highest range key row associated with a particular hash key value

```scala
val querySpec = new QuerySpec()
  .withHashKey(hashKeyName, hashKeyValue)
  .withConsistentRead(true)
  .withScanIndexForward(lowestValueFirst)
  .withMaxResultSize(1)
```

A query returns results ordered by range key -- the trick is making sure results arrive in the right order.

See also:

*   [DynamoHashKeyLookup.scala @ cc3b434](https://github.com/wellcometrust/scala-storage/blob/cc3b434c5cfeb264f14e7da0504dbf796a528141/storage/src/main/scala/uk/ac/wellcome/storage/dynamo/DynamoHashKeyLookup.scala) (MIT)
