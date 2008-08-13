#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Perl::Formance::Cargo' );
}

diag( "Testing Perl::Formance::Cargo $Perl::Formance::Cargo::VERSION, Perl $], $^X" );
