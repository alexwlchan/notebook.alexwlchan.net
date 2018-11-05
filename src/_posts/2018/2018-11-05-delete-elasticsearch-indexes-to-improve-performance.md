---
layout: post
title: Delete Elasticsearch indexes to improve performance
date: 2018-11-05 10:15:19 +0000
tags: elasticsearch
---

If your Elasticsearch cluster is having performance problems (visible through requests timing out under load), and against the limits of CPU and memory, try deleting unused indexes.
We had a cluster with ~70 indexes, and deleting a bunch of indexes we weren't using made a noticeable difference.

Before:

![](/images/elasticsearch-before.png)

After:

![](/images/elasticsearch-after.png)

(Screenshots from the Performance tab of the Elastic Cloud console.)
