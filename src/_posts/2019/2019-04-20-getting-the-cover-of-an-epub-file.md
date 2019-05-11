---
layout: post
title: "Getting the cover of an epub file"
date: 2019-04-20 21:24:30
tags: epub
---

The preview-generator library doesn't have support for epub files, so I have to create thumbnails for those separately.
The first step is to get the cover image of the book.

I found some useful code for doing this on GitHub: <https://github.com/marianosimone/epub-thumbnailer> (GPL)

The basic gist:

*   An epub is a zip file, so look inside the zipfile and assume the biggest image entry is the cover image
*   Poke around inside the `container.xml` inside the epub

The code in the GitHub repo is Python, but is fairly simple and could be ported to another language if necessary, licence allowing.
