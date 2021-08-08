package Orbital::Payload::Serv::GitHub::User;

use Modern::Perl;
use Moo;
use Pithub;

with qw(Orbital::Payload::Serv::GitHub::PithubRole);

has user => ( is => 'ro', required => 0 );

sub repos {
	my ($self) = @_;
	return $self->_pithub_client
		->repos(
			token => $self->github_token, # TODO what if this user does not have a token?
			auto_pagination => 1,
			)
		->list(
			#user => $self->user, # using authenticated
			params => { type => 'all' },
			options => $self->_pithub_options,
			);
}

1;
