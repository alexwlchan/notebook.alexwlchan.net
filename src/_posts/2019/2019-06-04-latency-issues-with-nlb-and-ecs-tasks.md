---
layout: post
title: "Latency issues with NLB and ECS tasks"
date: 2019-06-04 19:52:55 +0100
tags: aws
---

If the number of ECS tasks is less than the number of AZs served by an NLB, you get latent issues.

See [Register Targets with your Target Group](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/target-group-register-targets.html):

> You register your targets with one or more target groups. Each target group must have at least one registered target in each Availability Zone that is enabled for the load balancer. You can register targets by instance ID or by IP address.
