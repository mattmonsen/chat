#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper qw(Dumper);
use FindBin;
use lib "$FindBin::Bin/../lib";

use Test::More;
use feature 'say';

require_ok('Chat');
require_ok('Queue');
require_ok('Message');

my $queue = Queue->new;

is($queue->size(), 0, 'queue is empty');

$queue->create_chat({ id => 1, customer => 'Bob', ip => '127.0.0.1' });

is($queue->size(), 1, 'queue has chat loaded');

my $chat = $queue->assign_chat({ user => 'fish' });
$chat->create_message('This is a fun chat program');
$chat->create_message('yes it is');
$chat->create_message('bacon');
$chat->create_message('derp');

isa_ok($chat, 'Chat');

$queue->create_chat({ id => 2, customer => 'Joe', ip => '10.10.10.10' });

is($queue->size(), 2, 'queue has 2 chats');

$queue->to_string;

done_testing();
