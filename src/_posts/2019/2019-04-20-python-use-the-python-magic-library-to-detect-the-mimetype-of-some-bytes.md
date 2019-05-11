---
layout: post
title: "Python: Use the python-magic library to detect the mimetype of some bytes"
date: 2019-04-20 21:24:30 +0100
tags: python
---

[python-magic] is a library for detecting the mimetype of some bytes.
A simple example:

```python
import magic

assert isinstance(data, bytes)
guessed_mimetype = magic.from_buffer(data, mime=True)
```

[python-magic]: https://pypi.org/project/python-magic/
