use Orbital::Transfer::Common::Setup;
package Orbital::CLI::Command::Role::GitHubRepos;
# ABSTRACT: Gets GitHub repos from repo path

use Orbital::Transfer::Common::Setup;
use Moo::Role;

use Set::Scalar;
use Orbital::Payload::VCS::Git;
use Orbital::Payload::Serv::GitHub;
use Orbital::Payload::Serv::GitHub::Repo;
use List::Util::MaybeXS qw(first);

has github_repos => ( is => 'lazy' );

has github_repo_origin => ( is => 'lazy' );

method _build_github_repo_origin() {
	my $repo_path = $self->repo_path;

	my $vcs = Orbital::Payload::VCS::Git->new( directory => $repo_path );
	my $remotes = $vcs->remotes;
	my $origin = first { $_->name eq 'origin' } @$remotes;

	return Orbital::Payload::Serv::GitHub::Repo->new(
		uri => $origin->fetch,
	);
}

method _build_github_repos() {
	my $repo_path = $self->repo_path;

	my $vcs = Orbital::Payload::VCS::Git->new( directory => $repo_path );
	my $remotes = $vcs->remotes;
	my $remote_uris = Set::Scalar->new(
		map { $_->fetch } @$remotes
	);

	my @github;
	for my $remote (@$remote_uris) {
		push @github, Orbital::Payload::Serv::GitHub::Repo->new(
			uri => $remote,
		);
	}

	return \@github;
}

with qw(Orbital::CLI::Command::Role::Option::RepoPath);

1;
