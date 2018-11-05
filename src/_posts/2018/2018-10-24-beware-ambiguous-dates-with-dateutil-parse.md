---
layout: post
title: Beware ambiguous dates with dateutil.parse
date: 2018-10-24 09:01:00 +0000
tags: python datetime-handling
---

The [dateutil module](https://pypi.org/project/python-dateutil/) is useful for parsing ambiguous dates, but you want to be careful parsing lists -- it defaults to American "month-first" style dates.
Compare:

```python
import dateutil.parser as dp

dates = ["1/2/2018", "11/2/2018", "21/2/2018"]

for date_str in dates:
    print(dp.parse(date_str))

# 2018-01-02 00:00:00
# 2018-11-02 00:00:00
# 2018-02-21 00:00:00

for date_str in dates:
    print(dp.parse(date_str, dayfirst=True))

# 2018-02-01 00:00:00
# 2018-02-11 00:00:00
# 2018-02-21 00:00:00
```

If you don't pass the `dayfirst=True`, it makes a guess at what seems sensible, and only uses the British format if it's unambiguous.
This can cause unexpected results!
