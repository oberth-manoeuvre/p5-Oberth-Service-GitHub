use Oberth::Manoeuvre::Common::Setup;
package Oberth::Block::Service::GitHub::Account;
# ABSTRACT: GitHub account

use Moo;
extends qw(Oberth::Manoeuvre::Account);
with 'DBIx::Class::InflateColumn::JSON2Object::Role::Storable';

has password => (
	is => 'rw',
);

has token => (
	is => 'rw',
);

1;
