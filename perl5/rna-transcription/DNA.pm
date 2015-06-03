package DNA;

use v5.14; # required version for the /r option

sub to_rna
{
    shift =~ tr/GCTA/CGAU/r;
}

1;