use Oberth::Manoeuvre::Common::Setup;
package Oberth::CLI::Command::GitHub::UserRepos;
# ABSTRACT: A command to list the user repos

use Moo;
use CLI::Osprey;
use Oberth::Block::Service::GitHub::User;

method run(@) {
	my $token = `git config --get github.token`;
	chomp $token;
	my $user = Oberth::Block::Service::GitHub::User->new( github_token => $token );
	use Pry; pry();#DEBUG
	...
}

1;
