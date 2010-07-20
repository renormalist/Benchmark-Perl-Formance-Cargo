##############################################################################
#      $URL: http://perlcritic.tigris.org/svn/perlcritic/trunk/distributions/Perl-Critic/lib/Perl/Critic/Policy/InputOutput/ProhibitInteractiveTest.pm $
#     $Date: 2010-06-22 16:14:07 -0400 (Tue, 22 Jun 2010) $
#   $Author: clonezone $
# $Revision: 3843 $
##############################################################################

package # hide from indexer
  Perl::Critic::Policy::InputOutput::ProhibitInteractiveTest;

use 5.006001;
use strict;
use warnings;
use Readonly;

use Perl::Critic::Utils qw{ :severities };
use base 'Perl::Critic::Policy';

our $VERSION = '1.108';

#-----------------------------------------------------------------------------

Readonly::Scalar my $DESC => q{Use IO::Interactive::is_interactive() instead of -t};
Readonly::Scalar my $EXPL => [ 218 ];

#-----------------------------------------------------------------------------

sub supported_parameters { return ()                     }
sub default_severity     { return $SEVERITY_HIGHEST      }
sub default_themes       { return qw( core pbp bugs )    }
sub applies_to           { return 'PPI::Token::Operator' }

#-----------------------------------------------------------------------------

sub violates {
    my ($self, $elem, $doc) = @_;
    return if $elem ne '-t';
    return $self->violation( $DESC, $EXPL, $elem );
}

1;

#-----------------------------------------------------------------------------

__END__

=pod

=head1 NAME

Perl::Critic::Policy::InputOutput::ProhibitInteractiveTest - Use prompt() instead of -t.

=head1 AFFILIATION

This Policy is part of the core L<Perl::Critic|Perl::Critic>
distribution.


=head1 DESCRIPTION

The C<-t> operator is fragile and complicated.  When you are testing
whether C<STDIN> is interactive, It's much more robust to use
well-tested CPAN modules like L<IO::Interactive|IO::Interactive>.


=head1 CONFIGURATION

This Policy is not configurable except for the standard options.


=head1 AUTHOR

Chris Dolan <cdolan@cpan.org>

=head1 COPYRIGHT

Copyright (c) 2006-2010 Chris Dolan.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 78
#   indent-tabs-mode: nil
#   c-indentation-style: bsd
# End:
# ex: set ts=8 sts=4 sw=4 tw=78 ft=perl expandtab shiftround :
