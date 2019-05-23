---
layout: post
title: "Sort by extname/basename/dirname to reduce the size of compressed streams"
date: 2019-05-23 07:17:33 +0100
tags: compression git
---

Chris Dickson on Twitter:

> I got to use a trick I learned from git today: if you're going to throw a directory full of files into a compressed stream, wait, take a second,
>
> sort those files by extname -> basename -> dirname first so files that are likely to be similar end up next to each other
>
> I just decreased the size of my compressed stream by 10% using this one weird trick
