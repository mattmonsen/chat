package Chat;

use warnings;
use strict;

use feature 'say';

sub new {
    my ($class, $args) = @_;
    $args->{'messages'} ||= [];
    my $self = bless $args, $class;
    return $self;
}

sub create_message {
    my $self = shift;
    my $message = shift;
    push @{ $self->{'messages'} }, Message->new({ 'message' => $message });
}

sub assign {
    my $self = shift;
    my $user = shift || return;
    $self->{'assigned'} = $user;
    return 1;
}

sub assigned {
    my $self = shift;
    return $self->{'assigned'} ? 1 : 0;
}

sub to_string {
    my $self = shift;
    say '-------- CHAT BEGIN --------';
    say 'Assigned: ' . $self->{'assigned'} if $self->{'assigned'};
    say 'Customer: ' . $self->{'customer'};
    say 'IP:       ' . $self->{'ip'};
    say 'ID:       ' . $self->{'id'};
    say 'Messages: ' if $self->{'messages'};
    $_->to_string for @{ $self->{'messages'} };
    say '--------  CHAT END  --------';

}

1;
