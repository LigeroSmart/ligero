# --
# Modified version of the work: Copyright (C) 2019 Ligero, https://www.complemento.net.br/
# based on the original work of:
# Copyright (C) 2001-2018 OTRS AG, https://otrs.com/

# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::SupportDataCollector::Plugin::LIGERO::ArticlesPerCommunicationChannel;

use strict;
use warnings;

use parent qw(Kernel::System::SupportDataCollector::PluginBase);

use Kernel::Language qw(Translatable);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::CommunicationChannel',
    'Kernel::System::DB',
);

sub GetDisplayPath {
    return Translatable('LIGERO') . '/' . Translatable('Articles Per Communication Channel');
}

sub Run {
    my $Self = shift;

    my @Channels = $Kernel::OM->Get('Kernel::System::CommunicationChannel')->ChannelList();

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    for my $Channel (@Channels) {
        $DBObject->Prepare(
            SQL  => 'SELECT count(*) FROM article WHERE communication_channel_id = ?',
            Bind => [ \$Channel->{ChannelID} ],
        );
        my $Count;
        while ( my @Row = $DBObject->FetchrowArray() ) {
            $Count = $Row[0];
        }
        $Self->AddResultInformation(
            Identifier => $Channel->{ChannelName},
            Label      => $Channel->{DisplayName},
            Value      => $Count,
        );
    }

    return $Self->GetResults();
}

1;
