use Orbital::Transfer::Common::Setup;
package Orbital::Payload::Serv::GitHub::Account;
# ABSTRACT: GitHub account

use Moo;
extends qw(Orbital::Transfer::Account);
with 'DBIx::Class::InflateColumn::JSON2Object::Role::Storable';

has password => (
	is => 'rw',
);

has token => (
	is => 'rw',
);

1;
