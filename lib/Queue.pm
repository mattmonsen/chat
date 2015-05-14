package Queue;

use warnings;
use strict;

use Data::Dumper;
use feature 'say';

sub new {
    my ($class, $args) = @_;
    $args->{'chats'} ||= [];
    my $self = bless $args, $class;
    return $self;
}

sub size {
    my $self = shift;
    return scalar @{ $self->{'chats'} };
}

sub create_chat {
    my $self = shift;
    my $args = shift;
    push @{ $self->{'chats'} }, Chat->new( $args );
    return 1;
}

sub assign_chat {
    my $self = shift;
    my $args = shift;
    my $chat = $self->_get_next_open_chat;
    my $user = $args->{'user'};
    return unless $chat;
    $chat->assign($user);
    return $chat;
}

sub _get_next_open_chat {
    my $self = shift;
    my $chats = $self->{'chats'};
    foreach my $chat (@$chats) {
        next if $chat->assigned;
        return $chat;
    }
    return;
}

sub to_string {
    my $self = shift;
    say '--------- QUEUE BEGIN ----------';
    foreach my $chat (@{ $self->{'chats'} }) {
        $chat->to_string;
    }
    say '---------  QUEUE END  ----------';
}

1;
