---
layout: post
title: Running as root inside a Docker container
date: 2018-11-14 18:02:55 +0000
tags: docker
---

If you need to get a root shell inside a Docker container, and the default user isn't root and `sudo` isn't available, you can use the `--user=0` flag:

```console
$ docker exec --user 0 --interactive --tty CONTAINER sh
$ docker exec -u 0 -it CONTAINER sh
```

Discovered when trying to install packages inside a container, but we didn't have sudo or apt-get privileges, and sudo wasn't installed.
