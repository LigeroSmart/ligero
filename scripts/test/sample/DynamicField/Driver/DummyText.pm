# --
# Copyright (C) 2001-2018 OTRS AG, https://ligero.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package scripts::test::sample::DynamicField::Driver::DummyText;

use strict;
use warnings;

sub DummyFunction1 {
    my ( $Self, %Param ) = @_;
    return 1;
}

1;
