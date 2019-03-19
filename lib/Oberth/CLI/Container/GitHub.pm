use Modern::Perl;
package Oberth::CLI::Container::GitHub;
# ABSTRACT: Container for GitHub

use Oberth::Manoeuvre::Common::Setup;

method commands() {
	return +{
		'service/github' => 'Oberth::CLI::Command::GitHub',
	};
}

1;
