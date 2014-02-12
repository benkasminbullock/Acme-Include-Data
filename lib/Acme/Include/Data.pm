=encoding UTF-8

=head1 NAME

Acme::Include::Data - it's easy to include data with a CPAN module

=head1 SYNOPSIS

    use Acme::Include::Data;

=head1 DESCRIPTION

This is a demonstration module which demonstrates how to include a
data file with a Perl module and how to read it in at run time.

=head1 FUNCTIONS

=head2 yes_it_works

This is a function for testing the module.

=head1 SEE ALSO

Please see L<this blog post|http://www.lemoda.net/perl/data-in-distro/> for more explanation.

=head1 LICENCE

You can use, redistribute, and modify this under the same
terms as Perl itself.

=cut
package Acme::Include::Data;
require Exporter;
@ISA = qw(Exporter);
@EXPORT_OK = qw/yes_it_works/;
%EXPORT_TAGS = (
    all => \@EXPORT_OK,
);
use warnings;
use strict;
use Carp;
our $VERSION = 0.04;


my $data = __FILE__;
$data =~ s/Data\.pm$/this-is-a-data-file.txt/;

open my $in, "<", $data or die $!;
my $text = '';
while (<$in>) {
    $text .= $_;
}

sub yes_it_works
{
    return $text;
}

1;
