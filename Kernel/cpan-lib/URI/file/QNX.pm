# Modified version of the work: Copyright (C) 2019 Ligero, https://www.complemento.net.br/
# based on the original work of:
# Copyright (C) 2001-2018 OTRS AG, https://otrs.com/
package URI::file::QNX;

use strict;
use warnings;

use parent 'URI::file::Unix';

our $VERSION = '1.71';
$VERSION = eval $VERSION;

sub _file_extract_path
{
    my($class, $path) = @_;
    # tidy path
    $path =~ s,(.)//+,$1/,g; # ^// is correct
    $path =~ s,(/\.)+/,/,g;
    $path = "./$path" if $path =~ m,^[^:/]+:,,; # look like "scheme:"
    $path;
}

1;
