# --
# Modified version of the work: Copyright (C) 2019 Ligero, https://www.complemento.net.br/
# based on the original work of:
# Copyright (C) 2001-2018 OTRS AG, https://otrs.com/

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
    $Self->{DatabaseDSN}      = "DBI:Pg:dbname=$Self->{Database};host=$Self->{DatabaseHost}";
    $Self->{Home}             = dirname dirname __FILE__;
    $Self->{TestHTTPHostname} = 'localhost:5000';
    $Self->{TestDatabase}     = {
        DatabaseDSN  => "DBI:Pg:dbname=ligerotest;host=$Self->{DatabaseHost}",
        DatabaseUser => 'ligerotest',
        DatabasePw   => 'ligerotest',
    };
    return;
}

use parent qw(Kernel::Config::Defaults);

1;
