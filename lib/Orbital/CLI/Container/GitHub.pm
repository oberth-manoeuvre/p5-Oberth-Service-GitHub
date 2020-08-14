use Modern::Perl;
package Orbital::CLI::Container::GitHub;
# ABSTRACT: Container for GitHub

use Orbital::Transfer::Common::Setup;

method commands() {
	return +{
		'service/github' => 'Orbital::CLI::Command::GitHub',
	};
}

1;
