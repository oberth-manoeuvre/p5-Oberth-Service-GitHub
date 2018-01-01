package Oberth::Service::GitHub;
# ABSTRACT: Interface to GitHub

use strict;
use warnings;

use LWP::UserAgent;
use HTTP::Request;
use Net::Netrc;
use List::AllUtils qw(first);
use JSON::MaybeXS;
use Oberth::Common::Error;

sub _get_github_user_pass {
	my $mach = first { defined }
		map { Net::Netrc->lookup($_) }
		qw(github.com api.github.com);
	if( $mach ) {
		my ($user, $pass) = $mach->lpa;
		return (
			username => $user,
			password => $pass,
		);
	} elsif ($ENV{GITHUB_USER} && $ENV{GITHUB_PASSWORD}) {
		return (
			username => $ENV{GITHUB_USER},
			password => $ENV{GITHUB_PASSWORD},
		);
	}
}

sub get_token {
	my ($self) = @_;
	my @cred = $self->_get_github_user_pass;
	if( @cred ) {
		return $self->create_token( @cred );
	}
}

sub create_token {
	my ($self, %opt) = @_;

	my $username = $opt{username};
	my $password = $opt{password};

	my $parameters = {
		scopes   => ["repo", "read:org"],
		note     => "Oberth",
		note_url => "https://github.com/oberth-manoeuvre",
	};

	my $ua = LWP::UserAgent->new;

	my $request = HTTP::Request->new(POST => 'https://api.github.com/authorizations');
	$request->authorization_basic($username, $password);
	$request->content(encode_json($parameters));

	my $response = $ua->request($request);

	my $response_content = decode_json($response->decoded_content);

	if ($response_content->{token} ) {
		return $response_content->{token};
	}
	else {
		Oberth::Common::Error::Authorization->throw(
			   $response_content->{message}
			|| "Unspecified error",
		);
	}
}

1;
