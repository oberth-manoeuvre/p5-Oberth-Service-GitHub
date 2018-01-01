use Oberth::Common::Setup;
package Oberth::Account::GitHub;
# ABSTRACT: GitHub account

use Moo;
extends qw(Oberth::Account);
with 'DBIx::Class::InflateColumn::JSON2Object::Role::Storable';

has password => (
	is => 'rw',
);

has token => (
	is => 'rw',
);

1;
