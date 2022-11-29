use Orbital::Transfer::Common::Setup;
package Orbital::CLI::Container::GitHub;
# ABSTRACT: Container for GitHub

method commands() {
	return +{
		'service/github' => 'Orbital::CLI::Command::GitHub',
	};
}

1;
