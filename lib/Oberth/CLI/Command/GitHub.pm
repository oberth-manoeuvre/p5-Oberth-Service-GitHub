use Oberth::Manoeuvre::Common::Setup;
package Oberth::CLI::Command::GitHub;
# ABSTRACT: A command for GitHub

use Moo;
use CLI::Osprey;

subcommand 'issue-count' => 'Oberth::CLI::Command::GitHub::IssueCount';

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
