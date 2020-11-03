use Orbital::Transfer::Common::Setup;
package Orbital::CLI::Command::GitHub::DeployKey;
# ABSTRACT: A command for handling repo deploy keys

use Moo;
use CLI::Osprey;

subcommand 'add' => sub {
	...
};

subcommand 'list' => sub {
	...
};

with qw(Orbital::CLI::Command::Role::GitHubRepos);

1;
