package Bob;

use v5.18; # required for 'lexical_subs'
use strict;
no warnings "experimental::lexical_subs";
use feature 'lexical_subs';

my sub is_shouted; my sub is_question; my sub is_silence;
my sub contains_alpha; my sub is_upper_case;

sub hey 
{ 
    my $message = shift;

    return 'Fine. Be that way!' if is_silence($message);
    return 'Whoa, chill out!' if is_shouted($message);
    return 'Sure.' if is_question($message);
    return 'Whatever.';
}

sub is_shouted 
{ 
    my $message = shift;

    is_words($message) && is_upper_case($message);
}

sub is_question
{
    shift =~ /\?$/;
}

sub is_silence
{
    shift =~ /^\s*$/;
}

sub is_words
{
    shift =~ /\p{Letter}/;
}

sub is_upper_case
{
    shift !~ /\p{Lowercase}/;
}

1;