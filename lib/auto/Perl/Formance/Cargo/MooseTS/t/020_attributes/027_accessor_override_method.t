#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

BEGIN {
    eval "use Test::Output;";
    plan skip_all => "Test::Output is required for this test" if $@;
}

{
    package Foo;
    use Moose;

    sub get_a { }
    sub set_b { }
    sub has_c { }
    sub clear_d { }
    sub e { }
}

my $foo_meta = Foo->meta;
stderr_like(sub { $foo_meta->add_attribute(a => (reader => 'get_a')) },
            qr/^You are overwriting a locally defined method \(get_a\) with an accessor/, 'reader overriding gives proper warning');
stderr_like(sub { $foo_meta->add_attribute(b => (writer => 'set_b')) },
            qr/^You are overwriting a locally defined method \(set_b\) with an accessor/, 'writer overriding gives proper warning');
stderr_like(sub { $foo_meta->add_attribute(c => (predicate => 'has_c')) },
            qr/^You are overwriting a locally defined method \(has_c\) with an accessor/, 'predicate overriding gives proper warning');
stderr_like(sub { $foo_meta->add_attribute(d => (clearer => 'clear_d')) },
            qr/^You are overwriting a locally defined method \(clear_d\) with an accessor/, 'clearer overriding gives proper warning');
stderr_like(sub { $foo_meta->add_attribute(e => (is => 'rw')) },
            qr/^You are overwriting a locally defined method \(e\) with an accessor/, 'accessor overriding gives proper warning');

done_testing;
