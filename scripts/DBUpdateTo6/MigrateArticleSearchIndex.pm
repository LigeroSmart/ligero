# --
# Modified version of the work: Copyright (C) 2019 Ligero, https://www.complemento.net.br/
# based on the original work of:
# Copyright (C) 2001-2018 OTRS AG, https://otrs.com/

# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package scripts::DBUpdateTo6::MigrateArticleSearchIndex;    ## no critic

use strict;
use warnings;

use parent qw(scripts::DBUpdateTo6::Base);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Main',
    'Kernel::System::SysConfig',
);

=head1 NAME

scripts::DBUpdateTo6::MigrateArticleSearchIndex - Migrate article search index module.

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    my $Home     = $Kernel::OM->Get('Kernel::Config')->Get('Home');
    my $FilePath = "$Home/Kernel/Config/Backups/ZZZAutoLIGERO5.pm";
    my $Verbose  = $Param{CommandlineOptions}->{Verbose} || 0;

    if ( !-f $FilePath ) {
        print "    Could not find Kernel/Config/Backups/ZZZAutoLIGERO5.pm, skipping...\n" if $Verbose;
        return 1;
    }

    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');

    my %LIGERO5Config;
    $Kernel::OM->Get('Kernel::System::Main')->Require(
        'Kernel::Config::Backups::ZZZAutoLIGERO5'
    );
    Kernel::Config::Backups::ZZZAutoLIGERO5->Load( \%LIGERO5Config );

    if ( $LIGERO5Config{'Ticket::SearchIndexModule'} ) {
        my $Success = $Self->SettingUpdate(
            Name           => 'Ticket::SearchIndexModule',
            IsValid        => 1,
            EffectiveValue => 'Kernel::System::Ticket::ArticleSearchIndex::DB',
            Verbose        => $Verbose,
        );
        if ( !$Success ) {
            print "\n    Error:Unable to migrate Ticket::SearchIndexModule.\n\n";
            return;
        }

        # Turn off filtering of stop words if previous article search index module was set to RuntimeDB. Effectively,
        #   this will mimic old search behavior.
        if ( $LIGERO5Config{'Ticket::SearchIndexModule'} eq 'Kernel::System::Ticket::ArticleSearchIndex::RuntimeDB' ) {
            $Success = $Self->SettingUpdate(
                Name           => 'Ticket::SearchIndex::ForceUnfilteredStorage',
                IsValid        => 1,
                EffectiveValue => 1,
                Verbose        => $Verbose,
            );
            if ( !$Success ) {
                print "\n    Error: Unable to migrate Ticket::SearchIndex::ForceUnfilteredStorage.\n\n";
                return;
            }
        }
    }

    return 1;
}

1;

=head1 TERMS AND CONDITIONS

This software is part of the LIGERO project (L<https://ligero.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see L<https://www.gnu.org/licenses/gpl-3.0.txt>.

=cut
