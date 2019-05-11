---
layout: post
title: "JavaScript: Edit the URL in the window without reloading the page"
date: 2019-04-20 21:24:30 +0100
tags: javascript
---

Yes, that's possible:

```javascript
window.history.pushState({path: newUrl }, "", newUrl);
```

You can also use `replaceState`, which overwrites the current history entry.
(I can't spot the difference in behaviour in Safari.)
