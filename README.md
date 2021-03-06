# Alt::FFI::libffi [![Build Status](https://secure.travis-ci.org/Perl5-FFI/Alt-FFI-libffi.png)](http://travis-ci.org/Perl5-FFI/Alt-FFI-libffi)

Perl Foreign Function interface based on libffi

# DESCRIPTION

**NOTE** This distribution was originally an experiment to see if the legacy FFI module (which
was originally written using ffcall) could be rewritten to use libffi via [FFI::Platypus](https://metacpan.org/pod/FFI::Platypus).
It worked well enough that as of Alt-FFI-libffi 0.09 and FFI 1.14 these two distributions were
merged using the Alt-FFI-libffi implementation.  Further development will proceed in the [FFI](https://metacpan.org/pod/FFI)
repository.

This distribution provides an alternative implementation of [FFI](https://metacpan.org/pod/FFI) that uses [FFI::Platypus](https://metacpan.org/pod/FFI::Platypus) which
in turn uses `libffi` as the underlying implementation instead of `ffcall`.  This may be useful,
as the underlying implementation of the original [FFI](https://metacpan.org/pod/FFI) is `ffcall` and is no longer supported and
is not actively developed.

# ABSTRACT

    env PERL_ALT_INSTALL=OVERWRITE cpanm Alt::FFI::libffi

# CAVEATS

The connecting code is all pure perl, and not especially fast.  You will likely get
better performance porting your code to [FFI::Platypus](https://metacpan.org/pod/FFI::Platypus).  When using the `attach` feature
of [FFI::Platypus](https://metacpan.org/pod/FFI::Platypus), it will likely be faster than the original [FFI](https://metacpan.org/pod/FFI) implementation.

# SEE ALSO

- [Alt](https://metacpan.org/pod/Alt)
- [FFI](https://metacpan.org/pod/FFI)
- [FFI::Platypus](https://metacpan.org/pod/FFI::Platypus)

# AUTHOR

Original author: Paul Moore <gustav@morpheus.demon.co.uk>

Current maintainer: Graham Ollis <plicease@cpan.org>

Contributors:

Anatoly Vorobey <avorobey@pobox.com>

Gaal Yahas <gaal@forum2.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2016-2018 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
