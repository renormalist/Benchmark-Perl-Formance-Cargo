#! /usr/bin/env perl

use Test::Aggregate;

#DB::enable_profile();

my $tests = Test::Aggregate->new
    ({
      dirs => 't/',
     });

$tests->run;
