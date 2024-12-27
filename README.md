[![Actions Status](https://github.com/raku-community-modules/ASCII-To-Uni/actions/workflows/linux.yml/badge.svg)](https://github.com/raku-community-modules/ASCII-To-Uni/actions) [![Actions Status](https://github.com/raku-community-modules/ASCII-To-Uni/actions/workflows/macos.yml/badge.svg)](https://github.com/raku-community-modules/ASCII-To-Uni/actions) [![Actions Status](https://github.com/raku-community-modules/ASCII-To-Uni/actions/workflows/windows.yml/badge.svg)](https://github.com/raku-community-modules/ASCII-To-Uni/actions)

NAME
====

ASCII::To::Uni - blah blah blah

SYNOPSIS
========

```raku
use ASCII::To::Uni;

convert-file($filename);
```

DESCRIPTION
===========

The `ASCII::To::Uni` distribution provides a basic (and incomplete) way to convert operators in your Raku-related source files from an ASCII version to Unicode symbol version.

It doesn't support some operators and has some limitations.

SUBROUTINES
===========

This distribution has two basic subroutines:

convert-file
------------

The `convert-file` subroutine takes a file name and by default point s output to a new file with extension like `file-name.uni.xtension`.

A different path can be set with the `:new-path` named argument. It can rewrite file if the named argument `:rewrite` was specified with a `True` value. However, rewriting is not recommended, since this distribution way still be buggy and can mess up your work.

convert-string
--------------

The `convert-string` subroutine takes read-write string and converts it accordingly to operator table.

AUTHOR
======

Alexander Kiryuhin

COPYRIGHT AND LICENSE
=====================

Copyright 2016 - 2017 Alexander Kiryuhin

Copyright 2024 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

