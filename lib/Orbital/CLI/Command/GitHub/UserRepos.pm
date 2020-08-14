use Orbital::Transfer::Common::Setup;
package Orbital::CLI::Command::GitHub::UserRepos;
# ABSTRACT: A command to list the user repos

use Moo;
use CLI::Osprey;
use Orbital::Payload::Service::GitHub::User;

method run(@) {
	my $token = `git config --get github.token`;
	chomp $token;
	my $user = Orbital::Payload::Service::GitHub::User->new( github_token => $token );
	use Pry; pry();#DEBUG
	...
}

1;
