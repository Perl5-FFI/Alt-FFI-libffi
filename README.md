# FFI [![Build Status](https://secure.travis-ci.org/Perl5-FFI/FFI.png)](http://travis-ci.org/Perl5-FFI/FFI)

Perl Foreign Function Interface based on libffi

# SYNOPSIS

    # for a more portable interface see FFI::Library
    $clib_file = ($^O eq "MSWin32") ? "MSVCRT40.DLL" : "-lc";
    $clib = DynaLoader::dl_findfile($clib_file);
    $strlen = DynaLoader::dl_find_symbol($clib, "strlen");
    $n = FFI::call($strlen, "cIp", $my_string);
    DynaLoader::dl_free_file($clib);

# DESCRIPTION

**NOTE**: Newer and better maintained FFI modules such as [FFI::Platypus](https://metacpan.org/pod/FFI::Platypus)
provide more functionality and so it is strongly recommend that you use
one of them for new projects and even consider migrating to one of
them for existing projects.

This module provides a low-level foreign function interface to Perl. It 
allows the calling of any function for which the user can supply an 
address and calling signature. Furthermore, it provides a method of 
encapsulating Perl subroutines as callback functions whose addresses can 
be passed to C code.

# FUNCTIONS

## call

    my $ret = FFI::call($address, $signature, @arguments);

Call the function at the given `$address` with the given `$signature`>
(see below) and the given `@arguments`.

## callback

    my $address = FFI::callback($signature, \&subref);

Creates a c callback that will call a Perl subref.

# FUNCTION SIGNATURES

Function interfaces are defined by _signatures_. A function's signature 
is a string which specifies the function's return type, argument types 
and calling convention. The first character of the string is the 
function's calling convention. This is one of

    s   The standard calling convention for dynamically linked functions
    c   The calling convention used by C functions

Note that on many platforms, these two calling conventions may be 
identical. On the Windows platform, the `s` code corresponds to the 
`stdcall` calling convention, which is used for most dynamic link 
libraries.  The `c` code corresponds to the `cdecl` calling 
convention, which is used for C functions, such as those in the C 
runtime library.

The remaining characters of the string are the return type of the 
function, followed by the argument types, in left-to-right order. Valid 
values are based on the codes used for the [pack](https://metacpan.org/pod/pack) function, namely

    c   A signed char value.
    C   An unsigned char value.
    s   A signed short value.
    S   An unsigned short value.
    i   A signed integer value.
    I   An unsigned integer value.
    l   A signed long value.
    L   An unsigned long value.
    f   A single-precision float.
    d   A double-precision float.
    p   A pointer to a Perl scalar.
    o   A opaque pointer, ie, an address.
    v   No value (only valid as a return type).

Note that all of the above codes refer to "native" format values.

The `p` code as an argument type simply passes the address of the Perl 
value's memory to the foreign function. It is the caller's 
responsibility to be sure that the called function does not overwrite 
memory outside that allocated by Perl.

The `p` code as a return type treats the returned value as a 
null-terminated string, and passes it back to Perl as such. There is 
currently no support for functions which return pointers to structures, 
or to other blocks of memory which do not contain strings, nor for 
functions which return memory which the caller must free.

To pass pointers to strings, use the `p` code. Perl ensures that 
strings are null-terminated for you. To pass pointers to structures, use 
[pack](https://metacpan.org/pod/pack). To pass an arbitrary block of memory, use something like the 
following:

    $buf = ' ' x 100;
    # Use $buf via a 'p' parameter as a 100-byte memory block

At the present time, there is no direct support for passing pointers to 
'native' types (like int). To work around this, use `$buf = pack('i', 
12);` to put an integer into a block of memory, then use the `p` 
pointer type, and obtain any returned value using `$n = unpack('i', 
$buf);` In the future, better support may be added (but remember that 
this is intended as a low-level interface!)

# SUPPORT

Please open any support tickets with this project's GitHub repository 
here:

[https://github.com/plicease/FFI/issues](https://github.com/plicease/FFI/issues)

# SEE ALSO

- [FFI::Library](https://metacpan.org/pod/FFI::Library)

    Higher level interface to libraries using this module.

- [FFI::CheckLib](https://metacpan.org/pod/FFI::CheckLib)

    Portable functions for finding libraries.

- [FFI::Platypus](https://metacpan.org/pod/FFI::Platypus)

    Platypus is another FFI interface based on libffi.  It has a more 
    extensive feature set, and libffi has a less restrictive license.

# AUTHOR

Original author: Paul Moore <gustav@morpheus.demon.co.uk>

Current maintainer: Graham Ollis <plicease@cpan.org>

Contributors:

Anatoly Vorobey <avorobey@pobox.com>

Gaal Yahas <gaal@forum2.org>

Mitchell Charity <mcharity@vendian.org>

Reini Urban <<RURBAN@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2016-2018 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
