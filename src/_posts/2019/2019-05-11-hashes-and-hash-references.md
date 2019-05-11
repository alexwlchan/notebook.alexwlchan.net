---
layout: post
title: "Perl: Hashes and hash references"
date: 2019-05-11 21:37:24 +0100
tags: perl
---

Working in [the Dreamwidth codebase][s2_pm]:

```perl
sub sitescheme_secs_to_iso {
    my ( $secs, %opts ) = @_;

    ...

    # if opts has a true tz key, get the remote user's timezone if possible
    if ( $opts{tz} ) {
```

It wasn't clear to me what the difference is between `%opts` and `$opts` is.

I asked in Discord and [momijizukamori] explained that swapping `%opts` to `$opts` changes it from a hash to a hash reference.
You can only access the values of a hash reference as `$hash{key}`, and changing it to `$hash->{key}` should fix it.

[s2_pm]: https://github.com/dreamwidth/dw-free/blob/fa394ce0e47ea83d5b5d0db994de324b049a9ccb/cgi-bin/LJ/S2.pm#L2640-L2656
[momijizukamori]: https://momijizukamori.dreamwidth.org/
