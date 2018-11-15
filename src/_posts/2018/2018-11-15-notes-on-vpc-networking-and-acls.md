---
layout: post
title: Notes on AWS networking and ACLs
date: 2018-11-15 13:05:46 +0000
tags: aws networking
---

Some brief notes from a whiteboard session with RK.

![](/images/vpc_networking.png)

An availability zone is assigned a CIDR block (here `120.0.0.0/16`).

The AZ has a default route table and ACL (access control list), which let everything through.

Within the AZ, you create subnets.
There are ACLs attached to the subnets, and route table entries on the subnets.
(This lets you keep public and private subnets separate, and have different routes to the public Internet.)

The route table has the VPC CIDR, and the Internet gateway (or a NAT Gateway for private subnets).

ACL rules take precedence over security rules.
They have to be stateless -- only for inbound traffic or only for outbound traffic.

**Don't play with ACL and route table entries!  That way lies unplanned outages.**
