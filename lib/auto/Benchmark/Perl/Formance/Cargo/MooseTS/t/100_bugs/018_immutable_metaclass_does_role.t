#!/usr/bin/perl

use strict;
use warnings;

use Test::More;
use Test::Exception;


BEGIN {
    package MyRole;
    use Moose::Role;

    requires 'foo';

    package MyMetaclass;
    use Moose qw(extends with);
    extends 'Moose::Meta::Class';
       with 'MyRole';

    sub foo { 'i am foo' }
}

{
    package MyClass;
    use metaclass ('MyMetaclass');
    use Moose;
}

my $mc = MyMetaclass->initialize('MyClass');
isa_ok($mc, 'MyMetaclass');

ok($mc->meta->does_role('MyRole'), '... the metaclass does the role');

is(MyClass->meta, $mc, '... these metas are the same thing');
is(MyClass->meta->meta, $mc->meta, '... these meta-metas are the same thing');

my $a = MyClass->new;
ok( $a->meta->meta->does_role('MyRole'), 'metaclass does MyRole' );
is( $a->meta->foo, 'i am foo', '... foo method returns expected value' );
ok( MyClass->meta->meta->does_role('MyRole'), 'metaclass does MyRole' );
is( MyClass->meta->foo, 'i am foo', '... foo method returns expected value' );

lives_ok {
    MyClass->meta->make_immutable;
} '... make MyClass immutable okay';

is(MyClass->meta, $mc, '... these metas are still the same thing');
is(MyClass->meta->meta, $mc->meta, '... these meta-metas are the same thing');

ok( $a->meta->meta->does_role('MyRole'), 'metaclass does MyRole' );
is( $a->meta->foo, 'i am foo', '... foo method returns expected value' );
ok( MyClass->meta->meta->does_role('MyRole'), 'metaclass does MyRole' );
is( MyClass->meta->foo, 'i am foo', '... foo method returns expected value' );

lives_ok {
    MyClass->meta->make_mutable;
} '... make MyClass mutable okay';

is(MyClass->meta, $mc, '... these metas are still the same thing');
is(MyClass->meta->meta, $mc->meta, '... these meta-metas are the same thing');

ok( $a->meta->meta->does_role('MyRole'), 'metaclass does MyRole' );
is( $a->meta->foo, 'i am foo', '... foo method returns expected value' );
ok( MyClass->meta->meta->does_role('MyRole'), 'metaclass does MyRole' );
is( MyClass->meta->foo, 'i am foo', '... foo method returns expected value' );

lives_ok {
    MyMetaclass->meta->make_immutable;
} '... make MyClass immutable okay';

is(MyClass->meta, $mc, '... these metas are still the same thing');
is(MyClass->meta->meta, $mc->meta, '... these meta-metas are the same thing');

ok( $a->meta->meta->does_role('MyRole'), 'metaclass does MyRole' );
is( $a->meta->foo, 'i am foo', '... foo method returns expected value' );
ok( MyClass->meta->meta->does_role('MyRole'), 'metaclass does MyRole' );
is( MyClass->meta->foo, 'i am foo', '... foo method returns expected value' );

lives_ok {
    MyClass->meta->make_immutable;
} '... make MyClass immutable okay';

is(MyClass->meta, $mc, '... these metas are still the same thing');
is(MyClass->meta->meta, $mc->meta, '... these meta-metas are the same thing');

ok( $a->meta->meta->does_role('MyRole'), 'metaclass does MyRole' );
is( $a->meta->foo, 'i am foo', '... foo method returns expected value' );
ok( MyClass->meta->meta->does_role('MyRole'), 'metaclass does MyRole' );
is( MyClass->meta->foo, 'i am foo', '... foo method returns expected value' );

done_testing;
