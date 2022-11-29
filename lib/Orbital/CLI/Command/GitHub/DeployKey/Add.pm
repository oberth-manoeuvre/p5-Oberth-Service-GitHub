use Orbital::Transfer::Common::Setup;
package Orbital::CLI::Command::GitHub::DeployKey::Add;
# ABSTRACT: Add repo deploy key

use Orbital::Transfer::Common::Setup;
use Moo;
use CLI::Osprey;

option deploy_key_path => (
	is => 'ro',
	format => 's',
	required => 1,
);

method run(@) {
	my $github = $self->github_repos;
	my $first_repo = $github->[0];

}

with qw(Orbital::CLI::Command::Role::GitHubRepos);

1;
