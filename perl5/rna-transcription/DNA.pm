package DNA;

use v5.14; # required version for the /r option

sub to_rna
{
    shift =~ tr/T/U/r;
}

1;