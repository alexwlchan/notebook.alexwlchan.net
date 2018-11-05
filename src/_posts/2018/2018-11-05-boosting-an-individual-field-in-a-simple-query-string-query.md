---
layout: post
title: Boosting an individual field in a Simple Query String query
date: 2018-11-05 16:12:23 +0000
tags: elasticsearch
---

By default, a Simple Query String query will search all fields (`*`).

If you want to preserve that behaviour but just boost a couple of fields beyond the rest, the following query seems to do it:

```json
{
  "query": {
    "simple_query_string": {
      "fields": ["description^10", "title^5", ".*"],
      "query": "legs",
      "default_operator": "and"
    }
  }
}
```
