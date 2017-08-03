package Number::Phone::Formatter::EPP;

# ABSTRACT: An EPP formatter for Number::Phone

use strict;
use warnings;

=method format

This is the only method.  It takes an L<E.123|http://www.itu.int/rec/T-REC-E.123> international format string as its
only argument and reformats it in EPP (L<RFC 5733|https://tools.ietf.org/html/rfc5733>) format.  For example:

 +44 20 8771 2924 -> +44.2087712924
 +1 212 334 0611  -> +1.2123340611

=cut

sub format {
    my ($class, $number) = @_;

    my ($code, $subscriber) = split /\s+/, $number, 2;

    $code =~ s/\D+//g;
    $subscriber =~ s/\D+//g;

    return "+${code}.${subscriber}";
}

1;

=head1 DESCRIPTION

This is a formatter that will format an L<E.123|http://www.itu.int/rec/T-REC-E.123> formatted number (from
L<Number::Phone>) as an EPP phone number.

=head1 SEE ALSO

L<RFC 5733|https://tools.ietf.org/html/rfc5733>

=cut
