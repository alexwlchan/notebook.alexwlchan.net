---
layout: post
title: Be careful of assembling partial databases with concurrency
date: 2018-11-05 16:30:20 +0000
tags: concurrency miro-migration
---

This bit me during the Miro migration.

A brief reminder of the setup: I had an "inventory" of destinations for each of the images.
When I ran a script to move an image, it wrote a "partial inventory" update, which could be reassembled into the proper inventory later.
In practice, these are all JSON files on disk.

![](/images/partial_inventory.png)

Remembering to run the reassembly script was tedious, so I had the "smart" idea of writing the partial file and then automatically triggering the inventory script.

But because the main JSON file can't be updated concurrently, this promptly exploded.
Don't do that!
