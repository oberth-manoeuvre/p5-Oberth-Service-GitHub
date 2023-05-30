use Orbital::Transfer::Common::Setup;
package Orbital::CLI::Command::GitHub::UserRepos;
# ABSTRACT: A command to list the user repos

use Orbital::Transfer::Common::Setup;
use Moo;
use CLI::Osprey on_demand => 1;
use Orbital::Payload::Serv::GitHub::User;

method run(@) {
	my $token = `git config --get github.token`;
	chomp $token;
	my $user = Orbital::Payload::Serv::GitHub::User->new( github_token => $token );
	use Pry; pry();#DEBUG
	...
}

1;
