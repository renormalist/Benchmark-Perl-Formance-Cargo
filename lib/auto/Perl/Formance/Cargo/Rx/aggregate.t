use Test::Aggregate::Nested;

my $tests = Test::Aggregate::Nested->new( {
                                           dirs => "t",
                                           verbose => 2,
                                          } );
$tests->run;

