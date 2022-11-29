use Orbital::Transfer::Common::Setup;
package Orbital::CLI::Command::GitHub::Actions;
# ABSTRACT: A command for working with GitHub Actions

use Moo;
use CLI::Osprey;
use YAML;
use URI::Encode qw(uri_encode);

subcommand 'list-workflows' => method() {
	print join("\n", @{ $self->get_workflows }), "\n";
};

method get_workflows() {
	my @yaml_files = $self->repo_path->child('.github', 'workflows')->children( qr/\.ya?ml$/ );
	[ map {
		my $data = YAML::LoadFile( $_ );
		$data->{name};
	} @yaml_files ];
}

subcommand 'workflow-badge-markdown' => method() {
	my $workflow_name = shift @ARGV;
	die "No workflow name given" unless $workflow_name;

	my $encoded_wf_name = uri_encode($workflow_name);
	my $enc_q = uri_encode('"');
	my $repo_url = $self->github_repo_origin->github_https_web_uri;

	# <https://docs.github.com/en/free-pro-team@latest/actions/managing-workflow-runs/adding-a-workflow-status-badge>
	# ![CI]($repo_url/workflows/$encoded_wf_name/badge.svg?branch=$branch_name)
	my $markdown = <<~EOF;
	[![$workflow_name]($repo_url/workflows/$encoded_wf_name/badge.svg)]($repo_url/actions?query=workflow:${enc_q}${encoded_wf_name}${enc_q})
	EOF

	print $markdown;
};

with qw(Orbital::CLI::Command::Role::GitHubRepos);

1;
