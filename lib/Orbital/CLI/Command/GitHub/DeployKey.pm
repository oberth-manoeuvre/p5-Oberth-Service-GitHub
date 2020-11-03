use Orbital::Transfer::Common::Setup;
package Orbital::CLI::Command::GitHub::DeployKey;
# ABSTRACT: A command for handling repo deploy keys

use Moo;
use CLI::Osprey;

subcommand 'add' => 'Orbital::CLI::Command::GitHub::DeployKey::Add';

subcommand 'list' => method() {
	my $github = $self->github_repos;
	my $first_repo = $github->[0];
	chomp( my $token = `git config --get github.token` );

	my $keys_data = Pithub->new( token => $token )
		->repos->keys->list(
			user => $first_repo->namespace,
			repo => $first_repo->name
		);
	say "Keys for: @{[ $first_repo->_github_slug ]}";
	use Data::Dumper; print Dumper $keys_data->content;
};

with qw(Orbital::CLI::Command::Role::GitHubRepos);

1;
