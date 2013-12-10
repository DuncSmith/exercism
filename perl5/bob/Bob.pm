package Bob;

use strict;

my ($is_shouted, $is_question, $is_silence);
my ($contains_alpha, $is_upper_case, $ends_with);

sub hey
{
    my $message = shift;

    if ($is_shouted->($message))
    {
        'Woah, chill out!';
    }
    elsif ($is_question->($message))
    {
        'Sure.';
    }
    elsif ($is_silence->($message))
    {
        'Fine. Be that way!';
    }
    else
    {
        'Whatever.';
    }
}

$is_shouted = sub
{
    my $message = shift;

    $contains_alpha->($message) && $is_upper_case->($message);
};

$is_question = sub
{
    my $message = shift;

    $message =~ /\?$/;
};

$is_silence = sub
{
    my $message = shift;

    $message =~ /^\s*$/;
};

$contains_alpha = sub
{
    my $message = shift;

    $message =~ /[A-Z]/i;
};

$is_upper_case = sub
{
    my $message = shift;

    $message eq uc($message);
};

1;