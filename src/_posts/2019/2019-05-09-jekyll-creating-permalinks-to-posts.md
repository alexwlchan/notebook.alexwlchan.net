---
layout: post
title: "Jekyll: creating permalinks to posts"
date: 2019-05-09 12:39:53 +0100
tags: jekyll
---

It's a bit buried in the Jekyll docs, but you can use the `post_url` tag to generate permalink URLs to posts:

```
{% raw %}{% post_url 2019-05-09-jekyll-creating-permalinks-to-posts %}{% endraw %}
```

If you get this warning:

> Deprecation: A call to {% raw %}{% post_url 2019-05-09-java-conditional-updates-in-dynamodb %}{% endraw %} did not match a post using the new matching method of checking name (path-date-slug) equality. Please make sure that you change this tag to match the post's name exactly.

It's because I put each year of posts in a separate folder.
You need to prefix the year to get the "path" part, like so:

```
{% raw %}{% post_url 2019/2019-05-09-jekyll-creating-permalinks-to-posts %}{% endraw %}
```

References:

-   [Tags Filters/Linking to posts](https://jekyllrb.com/docs/liquid/tags/#linking-to-posts) in the Jekyll docs
