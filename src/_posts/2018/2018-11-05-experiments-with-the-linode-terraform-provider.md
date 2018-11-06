---
layout: post
title: Experiments with the Linode Terraform provider
date: 2018-11-05 21:23:17 +0000
tags: linode terraform
---

The docs don't yet have a list of instance types/regions (see [terraform-providers/terraform-provider-linode#7](https://github.com/terraform-providers/terraform-provider-linode/issues/7)); this is what I've managed to work out by guessing:

*   The London, UK is `eu-west`
*   The Linode 1GB plan is `g6-nanode-1`
*   The Linode 2GB plan is `g6-standard-1`

I'm hoping they'll add more to the docs at some point, but those are the values most useful to me for now.
