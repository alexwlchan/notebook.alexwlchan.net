---
layout: post
title: Using nginx as a proxy for dynamic hosts
date: 2018-11-15 13:09:22 +0000
tags: nginx networking
---

If you're using nginx as a proxy for a backend service, beware that nginx may only resolve the IP address once -- and if the backend moves, you have problems.

You can do dynamic variables in nginx (apparently), give backend services a static IP address, or move the problem elsewhere.
In practice we did this by running nginx+backend in the same ECS task definition, so we can use the proxy name and not worry about the networking ourselves.
