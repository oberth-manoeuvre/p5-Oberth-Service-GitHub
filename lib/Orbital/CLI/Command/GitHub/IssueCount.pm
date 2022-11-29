use Orbital::Transfer::Common::Setup;
package Orbital::CLI::Command::GitHub::IssueCount;
# ABSTRACT: A command to list the number of GitHub issues for a repository

use Orbital::Transfer::Common::Setup;
use Moo;
use CLI::Osprey;

method run(@) {
	my $github = $self->github_repos;
	my %github_to_issues = map {
		( $_->github_https_web_uri => $_->number_of_open_issues ),
	} @$github;
	use DDP; p %github_to_issues;
}

with qw(Orbital::CLI::Command::Role::GitHubRepos);

1;
