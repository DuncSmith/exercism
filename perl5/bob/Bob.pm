package Bob;

use strict;

sub hey
{
    my $message = shift;

    if (is_shouted($message))
    {
        'Woah, chill out!';
    }
    elsif (is_question($message))
    {
        'Sure.'
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
}

sub contains_alpha
{
    my $message = shift;

    $message =~ /[A-Z]/i;
}

sub is_upper_case
{
    my $message = shift;

    $message eq uc($message);
}

sub is_question
{
    my $message = shift;

    ends_with($message, '?')
}

sub ends_with
{
    my $string = shift;
    my $sub_string = shift;

    substr($string, -1, length($sub_string)) eq $sub_string;
}

1;