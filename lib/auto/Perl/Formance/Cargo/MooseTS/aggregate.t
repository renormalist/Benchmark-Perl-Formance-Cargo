use Test::Aggregate::Nested;

my $tests = Test::Aggregate::Nested->new( {
                                           dirs => "foo",
                                           verbose => 2,
                                          } );
$tests->run;

