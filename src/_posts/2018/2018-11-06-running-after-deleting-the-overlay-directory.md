---
layout: post
title: Running Docker after deleting the /var/lib/docker/overlay2 directory
date: 2018-11-06 08:07:17 +0000
tags: docker
---

When my Linode wouldn't boot, I managed to get in via rescue mode, and I thought maybe the boot disk was full -- so I went looking for big files to delete.
More than half the disk was taken up by `/var/lib/docker/overlay2`.
The VM was already hosed, so trashing Docker wouldn't make it worse!
Thus:

```console
$ rm -rf /var/lib/docker/overlay2
$ mkdir -p /var/lib/docker/overlay2
```

Thanks to Linode support, I got the box up and running, but now trying to run any Docker commands fails with errors like:

```
No such file or directory: /var/lib/docker/overlay2/a37c8253bbefa7ea641a110a5e6e2f5efd7d403f89b3319ef97a8038c2db229b
```

All the image/container definitions live in this directory, but are indexed separately -- so Docker still thought it had a complete collection of images and containers.
When I asked it to run an image, it failed because it couldn't find the local image it thought it had.

Fix was to purge the index of local images and containers:

```console
$ docker rm $(docker ps -a -q)
$ docker rmi $(docker images -q)
```
