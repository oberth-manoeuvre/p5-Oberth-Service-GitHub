use Orbital::Transfer::Common::Setup;
package Orbital::CLI::Command::GitHub;
# ABSTRACT: A command for GitHub

use Orbital::Transfer::Common::Setup;
use Moo;
use CLI::Osprey;

subcommand 'issue-count' => 'Orbital::CLI::Command::GitHub::IssueCount';

subcommand 'user-repos' => 'Orbital::CLI::Command::GitHub::UserRepos';

subcommand 'deploy-key' => 'Orbital::CLI::Command::GitHub::DeployKey';

subcommand 'actions' => 'Orbital::CLI::Command::GitHub::Actions';

sub create_token_interactive {
	my ($self) = @_;
	local $| = 1;
	print "Username: ";
	chomp(my $username = <>);
	print "Password: ";
	chomp(my $password = <>);
	print "\n\n";

	exit unless $username && $password;
	$self->create_token( username => $username, password => $password );
}

subcommand login => method() {
	$self->create_token_interactive;
};

1;
