# Special cases TODO:
# "\"",      "\“",
# '\"',      '\”',
# "\"",      "\„",
# "｢",       "Q//",
# "Q//",     "｣",

my constant %default =
  "<<",      "\«",
  ">>",      "»",
  "\ *\ ",   "×",
  "\ /\ ",   "÷",
  "\ -\ ",   "−",
  "\ o\ ",   "∘",
  "=~=",     "≅",
  "\ pi\ ",  "π",
  "\ tau\ ", "τ",
  "\ e\ ",   "𝑒",
  "Inf ",    "∞",
  "...",     "…",
  "\ +\ ",   "⁺",
  "**0",     "⁰",
  "**1",     "¹",
  "**2",     "²",
  "**3",     "³",
  "**4",     "⁴",
  "**5",     "⁵",
  "**6",     "⁶",
  "**7",     "⁷",
  "**8",     "⁸",
  "**9",     "⁹",
  "set()",   "∅",
  "(elem)",  "∈",
  "!(elem)", "∉",
  "(cont)",  "∋",
  "!(cont)", "∌",
  "(==)",    "≡",
  "!(==)",   "≢",
  "(<=)",    "⊆",
  "!(<=)",   "⊈",
  "(<)",     "⊂",
  "!(<)",    "⊄",
  "(>=)",    "⊇",
  "!(>=)",   "⊉",
  "(>)",     "⊃",
  "!(>)",    "⊅",
  "(<+)",    "≼",
  "(>+)",    "≽",
  "(|)",     "∪",
  "(&)",     "∩",
  "(-)",     "∖",
  "(^)",     "⊖",
  "(.)",     "⊍",
  "(+)",     "⊎"
;

my sub convert-string(Str $source is rw, :%table = %default) is export {
    for %table.keys -> $ascii {
        $source.subst-mutate($ascii, %table{$ascii}, :g);
    }
}

my sub convert-file(Str $filename, Bool :$rewrite = False, Str :$new-path = "") is export {
    my Str $content = slurp $filename;
    convert-string($content);
    if $rewrite {
        spurt $filename, $content;
        say "$filename was converted.\n";
    }
    else {
        if $new-path {
            spurt $new-path, $content;
            say "$filename was converted and written to $new-path";
        }
        else {
            my @pieces = $filename.split('.'); # Splitting by extension, can be better.
            @pieces.splice(*-1, 0, "uni");
            my $path = @pieces.join('.');
            say $path;
            spurt $path, $content;
            say "$filename was converted and written to $path";
        }
    }
}

=begin pod

=head1 NAME

ASCII::To::Uni - convert operators in Raku source files from ASCII to Unicode

=head1 SYNOPSIS

=begin code :lang<raku>

use ASCII::To::Uni;

convert-file($filename);

=end code

=head1 DESCRIPTION

The C<ASCII::To::Uni> distribution provides a basic (and incomplete)
way to convert operators in your Raku-related source files from an
ASCII version to Unicode symbol version.

It doesn't support some operators and has some limitations.

=head1 SUBROUTINES

This distribution has two basic subroutines:

=head2 convert-file

The C<convert-file> subroutine takes a file name and by default point
s output to a new file with extension like C<file-name.uni.xtension>.

A different path can be set with the C<:new-path> named argument. It
can rewrite file if the named argument C<:rewrite> was specified with
a C<True> value. However, rewriting is not recommended, since this
distribution way still be buggy and can mess up your work.

=head2 convert-string

The C<convert-string> subroutine takes read-write string and converts
it accordingly to operator table.

=head2 HISTORY

This distribution started as C<Texas::To::Uni>, but since the use of
the term "Texas" has been deprecated in favor of "ASCII", it felt like
a good opportunity to change the name when reviving it as a Raku
Community module.  Note that the old name C<Texas::To::Uni> is still
available as a use target.

=head1 AUTHOR

Alexander Kiryuhin

=head1 COPYRIGHT AND LICENSE

Copyright 2016 - 2017 Alexander Kiryuhin

Copyright 2024 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
