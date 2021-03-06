package Alt::FFI::libffi;

use strict;
use warnings;

# ABSTRACT: Perl Foreign Function interface based on libffi
# VERSION

=head1 ABSTRACT

 env PERL_ALT_INSTALL=OVERWRITE cpanm Alt::FFI::libffi

=head1 DESCRIPTION

B<NOTE> This distribution was originally an experiment to see if the legacy FFI module (which
was originally written using ffcall) could be rewritten to use libffi via L<FFI::Platypus>.
It worked well enough that as of Alt-FFI-libffi 0.09 and FFI 1.14 these two distributions were
merged using the Alt-FFI-libffi implementation.  Further development will proceed in the L<FFI>
repository.

This distribution provides an alternative implementation of L<FFI> that uses L<FFI::Platypus> which
in turn uses C<libffi> as the underlying implementation instead of C<ffcall>.  This may be useful,
as the underlying implementation of the original L<FFI> is C<ffcall> and is no longer supported and
is not actively developed.

=head1 CAVEATS

The connecting code is all pure perl, and not especially fast.  You will likely get
better performance porting your code to L<FFI::Platypus>.  When using the C<attach> feature
of L<FFI::Platypus>, it will likely be faster than the original L<FFI> implementation.

=head1 SEE ALSO

=over 4

=item L<Alt>

=item L<FFI>

=item L<FFI::Platypus>

=back

=cut

1;
