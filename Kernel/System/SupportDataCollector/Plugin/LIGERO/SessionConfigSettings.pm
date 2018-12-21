# --
# Copyright (C) 2001-2018 LIGERO AG, https://ligero.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::SupportDataCollector::Plugin::LIGERO::SessionConfigSettings;

use strict;
use warnings;

use parent qw(Kernel::System::SupportDataCollector::PluginBase);

use Kernel::Language qw(Translatable);

our @ObjectDependencies = (
    'Kernel::Config',
);

sub GetDisplayPath {
    return Translatable('LIGERO') . '/' . Translatable('Session Config Settings');
}

sub Run {
    my $Self = shift;

    my @Settings = qw(
        SessionMaxTime
        SessionMaxIdleTime
        AgentSessionLimitPriorWarning
        AgentSessionLimit
        AgentSessionPerUserLimit
        CustomerSessionLimit
        CustomerSessionPerUserLimit
    );

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    for my $Setting (@Settings) {

        my $ConfigValue = $ConfigObject->Get($Setting);

        my $Message;

        $Self->AddResultInformation(
            Identifier => $Setting,
            Label      => $Setting,
            Value      => $ConfigValue,
        );
    }

    return $Self->GetResults();
}

1;
