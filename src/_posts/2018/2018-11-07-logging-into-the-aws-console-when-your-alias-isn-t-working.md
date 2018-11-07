---
layout: post
title: Logging into the AWS Console when your alias isn't working
date: 2018-11-07 10:47:58 +0000
tags: aws
---

Trying to log into the AWS Console today, and we all saw this error:

<img src="/images/cant-login-to-aws.png" style="width: 402px;">

Meep!
Had our account been compromised?
(Spoiler: no.)

Our IAM accounts were all working through the CLI, and we eventually tracked down the root credentials -- and then discovered that the IAM account alias had changed.
No longer was the account alias *wellcomedigitalplatform*, instead it was *otherthing*.

Two ways we could have worked around this:

1.  Logging in with the account ID (7600...) instead of the account alias.
    This always works, whether or not you have an alias set.

2.  Used the AWS CLI to discover the current aliases (if any):

    ```console
    $ aws iam list-account-aliases
    {
        "AccountAliases": [
            "wellcomedigitalplatform"
        ]
    }

    $ aws iam list-account-aliases
    {
        "AccountAliases": []
    }
    ```