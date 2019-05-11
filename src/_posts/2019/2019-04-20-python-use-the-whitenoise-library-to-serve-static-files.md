---
layout: post
title: "Python: Use the whitenoise library to serve static files"
date: 2019-04-20 21:24:30 +0100
tags: python
---

[whitenoise] is a Python library for serving static files in a WSGI application.
When you create an instance of whitenoise, you pass it a folder, and it learns all the files in that folder.
If you save a new file in that folder, you need to tell whitenoise about it.

Here's a quick example, taken from the [whitenoise docs][wn_docs]:

```python
from whitenoise import WhiteNoise

from my_project import MyWSGIApp

application = MyWSGIApp()
application = WhiteNoise(application, root='/path/to/static/files')
application.add_files('/path/to/more/static/files', prefix='more-files/')
```

It gets unhappy if the size of a file changes underneath it, after the initial load.

Read more:

*   Whitenoise docs: <http://whitenoise.evans.io/en/stable/>

[whitenoise]: https://pypi.org/project/whitenoise/
[wn_docs]: http://whitenoise.evans.io/en/stable/#quickstart-for-other-wsgi-apps
