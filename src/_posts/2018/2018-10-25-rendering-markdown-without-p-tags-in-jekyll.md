---
layout: post
title: "Rendering Markdown without &lt;p&gt; tags in Jekyll"
date: 2018-10-25 07:54:00 +0000
tags: markdown jekyll
---

The `markdownify` filter can render Markdown as HTML:

```html
{% raw %}{{ page.title | markdownify }}{% endraw %}
```

That adds `<p>` tags to the output.
If you're in a context where that's undesirable (for example, a heading), add two `remove` filters afterwards:

```html
{% raw %}{{ page.title | markdownify | remove: '<p>' | remove: '</p>' }}{% endraw %}
```

(via [jekyll/jekyll#3571](https://github.com/jekyll/jekyll/issues/3571#issuecomment-372061718))
