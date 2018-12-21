# --
# Copyright (C) 2001-2018 LIGERO AG, https://ligero.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Config;    ## no critic

use strict;
use warnings;
use utf8;

use File::Basename;

sub Load {
    my $Self = shift;

    $Self->{DatabaseHost}     = '127.0.0.1';
    $Self->{Database}         = 'ligero';
    $Self->{DatabaseUser}     = 'ligero';
    $Self->{DatabasePw}       = 'ligero';
    $Self->{DatabaseDSN}      = "DBI:mysql:database=$Self->{Database};host=$Self->{DatabaseHost};";
    $Self->{Home}             = dirname dirname __FILE__;
    $Self->{TestHTTPHostname} = 'localhost:5000';
    $Self->{TestDatabase}     = {
        DatabaseDSN  => "DBI:mysql:database=ligerotest;host=$Self->{DatabaseHost}",
        DatabaseUser => 'ligerotest',
        DatabasePw   => 'ligerotest',
    };
    return;
}

use parent qw(Kernel::Config::Defaults);

1;
