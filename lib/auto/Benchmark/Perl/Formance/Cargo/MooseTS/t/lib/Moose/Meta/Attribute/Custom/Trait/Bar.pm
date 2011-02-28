package # hide from indexer
  Moose::Meta::Attribute::Custom::Trait::Bar;

sub register_implementation { 'My::Trait::Bar' }


package # hide from indexer
  My::Trait::Bar;

use Moose::Role;

1;
