---
layout: post
title: "Python: Include the filename, Content-Type and Content-Length in a requests upload"
date: 2019-04-20 21:24:30 +0100
tags: python
---

When you upload a file through an HTML form:

```html
<form action="/upload" method="post" enctype="multipart/form-data">
  <input name="file" type="file">
  ...
</form>
```

it gets sent to the server with a filename, content-type and content-length (along with the contents, of course).

You can pass optional content-type and filename when uploading a file with requests by passing a 2-tuple or 3-tuple in the `files` list.
Two examples:

```python
import requests

requests.post(
    "/upload",
    files={"file": ("mydocument.pdf", open("mydocument.pdf", "rb"))},
)

requests.post(
    "/upload",
    files={"file": ("mydocument.pdf", open("mydocument.pdf", "rb"), "application/pdf")},
)
```

Relevant docs: <https://2.python-requests.org/en/master/api/#requests.request>
