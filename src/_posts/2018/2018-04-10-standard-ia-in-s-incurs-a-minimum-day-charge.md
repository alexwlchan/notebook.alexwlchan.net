---
layout: post
title: Standard IA in S3 incurs a minimum 30 day charge
date: 2018-04-10 08:52:00 +0000
tags: aws aws:s3
---

From the [S3 pricing page](https://aws.amazon.com/s3/pricing/):

> S3 Standard-Infrequent Access and S3 One Zone-Infrequent Access Storage are charged for a minimum storage duration of 30 days. Objects that are deleted, overwritten, or transitioned to a different storage class before 30 days will incur the normal usage charge plus a pro-rated request charge for the remainder of the 30 day minimum.

This means it's less suitable for objects that are frequently replaced or deleted.

(Context was the S3 bucket saving snapshots for the Catalogue API.)
