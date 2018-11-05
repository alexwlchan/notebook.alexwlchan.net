---
layout: post
title: Using xargs for parallel processing
date: 2018-10-24 08:55:00 +0000
tags: shell
---

If you have a file full of arguments (`inputs.txt`), and a script that takes a single ID as an argument (`process_single_id.py`), you can run the script in parallel with `xargs`:

```shell
$ xargs -P 84 -I '{}' python process_single_id.py '{}' < inputs.txt
```

Customise the number of parallel processes with the `-P` flag.

You'll want to experiment with the number of processes you run -- although 84 was about the limit of my laptop's CPU, it caused more errors in the Tandem Vault/S3 APIs, so the overall throughput was actually less.

(I discovered this during the Miro migration project in October 2018.)

