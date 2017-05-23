package Oberth::Issue::GitHub;


use strict;
use warnings;

use Moo;

extends 'Oberth::Issue';

has _github_content => ( is => 'ro' );
has repo => ( is => 'ro', weak_ref => 1 );

sub BUILDARGS {
	my ($klass, $content, %opt) = @_;
	+{
		project => $opt{repo},
		title => $content->{title},
		description => $content->{body},
		state => $content->{state},
		number => $content->{number},
		_github_content => $content,
	};
}

1;
