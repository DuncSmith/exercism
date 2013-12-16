package Bob;

use strict;
no warnings "experimental::lexical_subs";
use feature 'lexical_subs'; # requires Perl 5.18

my sub is_shouted; my sub is_question; my sub is_silence;
my sub contains_alpha; my sub is_upper_case;

sub hey
{
    my $message = shift;

    if (is_shouted($message))
    {
        'Woah, chill out!';
    }
    elsif (is_question($message))
    {
        'Sure.';
    }
    elsif (is_silence($message))
    {
        'Fine. Be that way!';
    }
    else
    {
        'Whatever.';
    }
}

sub is_shouted
{
    my $message = shift;

    contains_alpha($message) && is_upper_case($message);
};

sub is_question
{
    my $message = shift;

    $message =~ /\?$/;
};

sub is_silence
{
    my $message = shift;

    $message =~ /^\s*$/;
};

sub contains_alpha
{
    my $message = shift;

    $message =~ /[A-Z]/i;
};

sub is_upper_case
{
    my $message = shift;

    $message eq uc($message);
};

1;