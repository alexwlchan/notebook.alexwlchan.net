---
layout: post
title: "Solving 'S3: AccessDenied' when calling PutObject with the s3:PutObject permission"
date: 2019-06-04 19:53:51 +0100
tags: aws aws:s3 aws:iam
---

Have you tried adding `s3:PutObjectAcl` to your IAM policy document? See <https://github.com/aws/aws-cli/issues/813>
