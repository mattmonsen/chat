package Message;

use strict;
use warnings;

use feature 'say';

sub new {
    my ($class, $args) = @_;
    my $self = bless $args, $class;
    return $self;
}

sub to_string {
    my $self = shift;
    say $self->{'message'};
}

1;
