#!/usr/bin/perl -w

use strict;
use Test::More 'no_plan';
use Test::Exception;
$| = 1;



# =begin testing SETUP
BEGIN {
    eval 'use Test::Output;';
    if ($@) {
        diag 'Test::Output is required for this test';
        ok(1);
        exit 0;
    }
}



# =begin testing SETUP
{

  package MooseX::Debugging;

  use Moose::Exporter;

  Moose::Exporter->setup_import_methods(
      base_class_roles => ['MooseX::Debugging::Role::Object'],
  );

  package MooseX::Debugging::Role::Object;

  use Moose::Role;

  after 'BUILDALL' => sub {
      my $self = shift;

      warn "Made a new " . ( ref $self ) . " object\n";
  };
}



# =begin testing
{
{
    package Debugged;

    use Moose;
    MooseX::Debugging->import;
}

stderr_is(
    sub { Debugged->new },
    "Made a new Debugged object\n",
    'got expected output from debugging role'
);
}




1;
