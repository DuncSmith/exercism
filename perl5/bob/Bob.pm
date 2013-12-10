package Bob;

use strict;

sub hey
{
    my $message = shift;

    if (_is_shouted($message))
    {
        'Woah, chill out!';
    }
    elsif (_is_question($message))
    {
        'Sure.';
    }
    elsif (_is_silence($message))
    {
        'Fine. Be that way!';
    }
    else
    {
        'Whatever.';
    }
}

sub _is_shouted
{
    my $message = shift;

    _contains_alpha($message) && _is_upper_case($message);
}

sub _is_question
{
    my $message = shift;

    _ends_with($message, '?')
}

sub _is_silence
{
    my $message = shift;

    $message =~ /^\s*$/;
}

sub _contains_alpha
{
    my $message = shift;

    $message =~ /[A-Z]/i;
}

sub _is_upper_case
{
    my $message = shift;

    $message eq uc($message);
}

sub _ends_with
{
    my $string = shift;
    my $sub_string = shift;

    substr($string, -1, length($sub_string)) eq $sub_string;
}

1;