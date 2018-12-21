# --
# Copyright (C) 2001-2018 LIGERO AG, https://ligero.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

## no critic (Modules::RequireExplicitPackage)
use strict;
use warnings;
use utf8;

use Kernel::System::VariableCheck qw(:all);

use vars (qw($Self));

$Kernel::OM->Get('Kernel::Config')->Set(
    Key   => 'Version',
    Value => '5.0.21',
);

my @InstalledITSM5017 = (
    {
        Name    => 'ImportExport',
        Version => '5.0.17',
    },
    {
        Name    => 'GeneralCatalog',
        Version => '5.0.17',
    },
    {
        Name    => 'ITSMChangeManagement',
        Version => '5.0.17',
    },
    {
        Name    => 'ITSMConfigurationManagement',
        Version => '5.0.17',
    },
    {
        Name    => 'ITSMCore',
        Version => '5.0.17',
    },
    {
        Name    => 'ITSMIncidentProblemManagement',
        Version => '5.0.17',
    },
    {
        Name    => 'ITSMServiceLevelManagement',
        Version => '5.0.17',
    },
);

my @OnlineITSM5021 = (
    {
        Name    => 'ImportExport',
        Version => '5.0.21',
    },
    {
        Name    => 'GeneralCatalog',
        Version => '5.0.21',
    },
    {
        Name            => 'ITSMChangeManagement',
        Version         => '5.0.21',
        PackageRequired => [
            {
                Version => '5.0.21',
                Content => 'ITSMCore',
            },
        ],
    },
    {
        Name            => 'ITSMConfigurationManagement',
        Version         => '5.0.21',
        PackageRequired => [
            {
                Version => '5.0.21',
                Content => 'ITSMCore',
            },
        ],
    },
    {
        Name            => 'ITSMCore',
        Version         => '5.0.21',
        PackageRequired => [
            {
                Version => '5.0.21',
                Content => 'GeneralCatalog',
            },
        ],
    },
    {
        Name            => 'ITSMIncidentProblemManagement',
        Version         => '5.0.21',
        PackageRequired => [
            {
                Version => '5.0.21',
                Content => 'ITSMCore',
            },
        ],
    },
    {
        Name            => 'ITSMServiceLevelManagement',
        Version         => '5.0.21',
        PackageRequired => [
            {
                Version => '5.0.21',
                Content => 'ITSMCore',
            },
        ],
    },
);

my @InstalledPublic501 = (
    {
        Name    => 'FAQ',
        Version => '5.0.1',
    },
    {
        Name    => 'Fred',
        Version => '5.0.1',
    },
    {
        Name    => 'LIGEROAppointmentCalendar',
        Version => '5.0.1',
    },
    {
        Name    => 'LIGEROCloneDB',
        Version => '5.0.1',
    },
    {
        Name    => 'LIGEROCodePolicy',
        Version => '5.0.1',
    },
    {
        Name    => 'LIGEROMasterSlave',
        Version => '5.0.1',
    },
    {
        Name    => 'Survey',
        Version => '5.0.1',
    },
    {
        Name    => 'SystemMonitoring',
        Version => '5.0.1',
    },
    {
        Name    => 'TimeAccounting',
        Version => '5.0.1',
    }
);

my @OnlinePublic502 = (
    {
        Name    => 'FAQ',
        Version => '5.0.2',
    },
    {
        Name    => 'Fred',
        Version => '5.0.2'
    },
    {
        Name    => 'LIGEROAppointmentCalendar',
        Version => '5.0.2',
    },
    {
        Name    => 'LIGEROCloneDB',
        Version => '5.0.2',
    },
    {
        Name    => 'LIGEROCodePolicy',
        Version => '5.0.2',
    },
    {
        Name    => 'LIGEROMasterSlave',
        Version => '5.0.2',
    },
    {
        Name    => 'Survey',
        Version => '5.0.2',
    },
    {
        Name    => 'SystemMonitoring',
        Version => '5.0.2',
    },
    {
        Name    => 'TimeAccounting',
        Version => '5.0.2',
    }
);

my @Tests = (
    {
        Name    => 'No Params',
        Config  => {},
        Success => 0,
    },
    {
        Name   => 'Missing InstalledPackages',
        Config => {
            OnlinePackages => [
                {
                    Name    => 'ImportExport',
                    Version => '5.0.21',
                },
            ],
        },
        Success => 0,
    },
    {
        Name   => 'Missing OnlinePackages',
        Config => {
            InstalledPackages => [
                {
                    Name    => 'ImportExport',
                    Version => '5.0.17',
                },
            ],
        },
        Success => 0,
    },
    {
        Name   => 'Wrong InstalledPackages',
        Config => {
            InstalledPackages => '',
            OnlinePackages    => [
                {
                    Name    => 'ImportExport',
                    Version => '5.0.21',
                },
            ],
        },
        Success => 0,
    },
    {
        Name   => 'Wrong OnlinePackages',
        Config => {
            InstalledPackages => [
                {
                    Name    => 'ImportExport',
                    Version => '5.0.17',
                },
            ],
            OnlinePackages => '',
        },
        Success => 0,
    },
    {
        Name   => 'LIGEROBusiness only',
        Config => {
            InstalledPackages => [],
            OnlinePackages    => [],
        },
        LIGEROBusinessOptions => {
            LIGEROBusinessIsInstalled  => 1,
            LIGEROBusinessIsUpdateable => 1,
        },
        Success        => 1,
        ExpectedResult => {
            InstallOrder => {
                LIGEROBusiness => 9999,
            },
            Failed => {},
        },
    },
    {
        Name   => 'ITSM 5.0.17 to 5.0.21',
        Config => {
            InstalledPackages => \@InstalledITSM5017,
            OnlinePackages    => \@OnlineITSM5021,
        },
        Success        => 1,
        ExpectedResult => {
            InstallOrder => {
                ImportExport                  => 1,
                GeneralCatalog                => 6,
                ITSMChangeManagement          => 1,
                ITSMConfigurationManagement   => 1,
                ITSMCore                      => 5,
                ITSMIncidentProblemManagement => 1,
                ITSMServiceLevelManagement    => 1,
            },
            Failed => {},
        },
    },
    {
        Name   => 'ITSM 5.0.17 to 5.0.21 W/LIGEROBusiness',
        Config => {
            InstalledPackages => \@InstalledITSM5017,
            OnlinePackages    => \@OnlineITSM5021,
        },
        LIGEROBusinessOptions => {
            LIGEROBusinessIsInstalled  => 1,
            LIGEROBusinessIsUpdateable => 1,
        },
        Success        => 1,
        ExpectedResult => {
            InstallOrder => {
                ImportExport                  => 1,
                GeneralCatalog                => 6,
                ITSMChangeManagement          => 1,
                ITSMConfigurationManagement   => 1,
                ITSMCore                      => 5,
                ITSMIncidentProblemManagement => 1,
                ITSMServiceLevelManagement    => 1,
                LIGEROBusiness                  => 9999,
            },
            Failed => {},
        },
    },
    {
        Name   => 'Public 5.0.1 to 5.0.2',
        Config => {
            InstalledPackages => \@InstalledPublic501,
            OnlinePackages    => \@OnlinePublic502,
        },
        Success        => 1,
        ExpectedResult => {
            InstallOrder => {
                FAQ                     => 1,
                Fred                    => 1,
                LIGEROAppointmentCalendar => 1,
                LIGEROCloneDB             => 1,
                LIGEROCodePolicy          => 1,
                LIGEROMasterSlave         => 1,
                Survey                  => 1,
                SystemMonitoring        => 1,
                TimeAccounting          => 1,
            },
            Failed => {},
        },
    },
    {
        Name   => 'LIGEROGenericInterfaceITSMConfigurationManagement',
        Config => {
            InstalledPackages => [
                @InstalledITSM5017,
                (
                    {
                        Name    => 'LIGEROGenericInterfaceITSMConfigurationManagement',
                        Version => '5.0.1',
                    },
                ),
            ],
            OnlinePackages => [
                @OnlineITSM5021,
                (
                    {
                        Name            => 'LIGEROGenericInterfaceITSMConfigurationManagement',
                        Version         => '5.0.21',
                        PackageRequired => [
                            {
                                Version => '5.0.21',
                                Content => 'ITSMConfigurationManagement',
                            },
                        ],
                    },
                ),

            ],
        },
        Success        => 1,
        ExpectedResult => {
            InstallOrder => {
                ImportExport                                    => 1,
                GeneralCatalog                                  => 7,
                ITSMChangeManagement                            => 1,
                ITSMConfigurationManagement                     => 2,
                ITSMCore                                        => 6,
                ITSMIncidentProblemManagement                   => 1,
                ITSMServiceLevelManagement                      => 1,
                LIGEROGenericInterfaceITSMConfigurationManagement => 1,
            },
            Failed => {},
        },
    },

    {
        Name   => 'LIGEROITSMConfigItemReference',
        Config => {
            InstalledPackages => [
                @InstalledITSM5017,
                (
                    {
                        Name    => 'LIGEROITSMConfigItemReference',
                        Version => '5.0.1',
                    },
                ),
            ],
            OnlinePackages => [
                @OnlineITSM5021,
                (
                    {
                        Name            => 'LIGEROITSMConfigItemReference',
                        Version         => '5.0.21',
                        PackageRequired => [
                            {
                                Version => '5.0.20',
                                Content => 'ITSMConfigurationManagement',
                            },
                            {
                                Version => '5.0.19',
                                Content => 'ImportExport',
                            },

                        ],
                    },
                ),

            ],
        },
        Success        => 1,
        ExpectedResult => {
            InstallOrder => {
                ImportExport                  => 2,
                GeneralCatalog                => 7,
                ITSMChangeManagement          => 1,
                ITSMConfigurationManagement   => 2,
                ITSMCore                      => 6,
                ITSMIncidentProblemManagement => 1,
                ITSMServiceLevelManagement    => 1,
                LIGEROITSMConfigItemReference   => 1,
            },
            Failed => {},
        },
    },

    {
        Name   => 'Not Found',
        Config => {
            InstalledPackages => [
                @InstalledITSM5017,
                (
                    {
                        Name    => 'LIGEROGenericInterfaceITSMConfigurationManagement',
                        Version => '5.0.1',
                    },
                ),
            ],
            OnlinePackages => \@OnlineITSM5021,
        },
        Success        => 1,
        ExpectedResult => {
            InstallOrder => {
                ImportExport                  => 1,
                GeneralCatalog                => 6,
                ITSMChangeManagement          => 1,
                ITSMConfigurationManagement   => 1,
                ITSMCore                      => 5,
                ITSMIncidentProblemManagement => 1,
                ITSMServiceLevelManagement    => 1,
            },
            Failed => {
                NotFound => {
                    LIGEROGenericInterfaceITSMConfigurationManagement => 1
                },
            },
        },
    },
    {
        Name   => 'WrongVersion',
        Config => {
            InstalledPackages => [
                @InstalledITSM5017,
                (
                    {
                        Name    => 'Test',
                        Version => '5.0.21',
                    },
                ),
            ],
            OnlinePackages => [
                @OnlineITSM5021,
                (
                    {
                        Name    => 'Test',
                        Version => '5.0.20',
                    },
                ),
            ],
        },
        Success        => 1,
        ExpectedResult => {
            InstallOrder => {
                ImportExport                  => 1,
                GeneralCatalog                => 6,
                ITSMChangeManagement          => 1,
                ITSMConfigurationManagement   => 1,
                ITSMCore                      => 5,
                ITSMIncidentProblemManagement => 1,
                ITSMServiceLevelManagement    => 1,
            },
            Failed => {
                WrongVersion => {
                    Test => 1,
                },
            },
        },
    },

    {
        Name   => 'WrongVersion Dependency',
        Config => {
            InstalledPackages => [
                @InstalledITSM5017,
                (
                    {
                        Name    => 'Test',
                        Version => '5.0.1',
                    },
                ),
            ],
            OnlinePackages => [
                @OnlineITSM5021,
                (
                    {
                        Name            => 'Test',
                        Version         => '5.0.21',
                        PackageRequired => [
                            {
                                Version => '5.0.22',
                                Content => 'ITSMConfigurationManagement',
                            },
                        ],
                    },
                ),
            ],
        },
        Success        => 1,
        ExpectedResult => {
            InstallOrder => {
                ImportExport                  => 1,
                GeneralCatalog                => 6,
                ITSMChangeManagement          => 1,
                ITSMConfigurationManagement   => 1,
                ITSMCore                      => 5,
                ITSMIncidentProblemManagement => 1,
                ITSMServiceLevelManagement    => 1,
            },
            Failed => {
                DependencyFail => {
                    Test => 1,
                },
                WrongVersion => {
                    ITSMConfigurationManagement => 1,
                },
            },
        },
    },
    {
        Name   => 'NotFound Dependency',
        Config => {
            InstalledPackages => [
                @InstalledITSM5017,
                (
                    {
                        Name    => 'Test',
                        Version => '5.0.1',
                    },
                ),
            ],
            OnlinePackages => [
                @OnlineITSM5021,
                (
                    {
                        Name            => 'Test',
                        Version         => '5.0.21',
                        PackageRequired => [
                            {
                                Version => '5.0.22',
                                Content => 'Test2',
                            },
                        ],
                    },
                ),

            ],
        },
        Success        => 1,
        ExpectedResult => {
            InstallOrder => {
                ImportExport                  => 1,
                GeneralCatalog                => 6,
                ITSMChangeManagement          => 1,
                ITSMConfigurationManagement   => 1,
                ITSMCore                      => 5,
                ITSMIncidentProblemManagement => 1,
                ITSMServiceLevelManagement    => 1,
            },
            Failed => {
                DependencyFail => {
                    Test => 1,
                },
                NotFound => {
                    Test2 => 1,
                },
            },
        },
    },
    {
        Name   => 'Cyclic Dependency',
        Config => {
            InstalledPackages => [
                @InstalledITSM5017,
                (
                    {
                        Name    => 'Test',
                        Version => '5.0.1',
                    },
                    {
                        Name    => 'Test2',
                        Version => '5.0.1',
                    },
                ),
            ],
            OnlinePackages => [
                @OnlineITSM5021,
                (
                    {
                        Name            => 'Test',
                        Version         => '5.0.21',
                        PackageRequired => [
                            {
                                Version => '5.0.21',
                                Content => 'Test2',
                            },
                        ],
                    },
                    {
                        Name            => 'Test2',
                        Version         => '5.0.21',
                        PackageRequired => [
                            {
                                Version => '5.0.21',
                                Content => 'Test',
                            },
                        ],
                    },
                ),
            ],
        },
        Success        => 1,
        ExpectedResult => {
            InstallOrder => {
                ImportExport                  => 1,
                GeneralCatalog                => 6,
                ITSMChangeManagement          => 1,
                ITSMConfigurationManagement   => 1,
                ITSMCore                      => 5,
                ITSMIncidentProblemManagement => 1,
                ITSMServiceLevelManagement    => 1,
            },
            Failed => {
                DependencyFail => {
                    Test  => 1,
                    Test2 => 1,
                },
                Cyclic => {
                    Test  => 1,
                    Test2 => 1,
                },
            },
        },
    },
);

TEST:
for my $Test (@Tests) {

    $Kernel::OM->ObjectsDiscard(
        Objects => [ 'Kernel::System::LIGEROBusiness', 'Kernel::System::Package' ],
    );

    $Test->{LIGEROBusinessOptions}->{LIGEROBusinessIsInstalled}  // 0;
    $Test->{LIGEROBusinessOptions}->{LIGEROBusinessIsUpdateable} // 0;

    no warnings 'once';    ## no critic
    local *Kernel::System::LIGEROBusiness::LIGEROBusinessIsInstalled = sub {
        if ( $Test->{LIGEROBusinessOptions}->{LIGEROBusinessIsInstalled} ) {
            return 1;
        }
        return 0;
    };
    local *Kernel::System::LIGEROBusiness::LIGEROBusinessIsUpdateable = sub {
        if ( $Test->{LIGEROBusinessOptions}->{LIGEROBusinessIsUpdateable} ) {
            return 1;
        }
        return 0;
    };
    use warnings;

    my $LIGEROBusinessObject = $Kernel::OM->Get('Kernel::System::LIGEROBusiness');
    my $PackageObject      = $Kernel::OM->Get('Kernel::System::Package');

    my %Result = $PackageObject->PackageInstallOrderListGet( %{ $Test->{Config} } );

    if ( !$Test->{Success} ) {
        $Self->IsDeeply(
            \%Result,
            {},
            "$Test->{Name} - PackageInstallOrderListGet()",
        );
        next TEST;
    }

    $Self->IsDeeply(
        \%Result,
        $Test->{ExpectedResult},
        "$Test->{Name} - PackageInstallOrderListGet()",
    );

}
continue {
    $Kernel::OM->ObjectsDiscard(
        Objects => [ 'Kernel::System::LIGEROBusiness', 'Kernel::System::Package' ],
    );
}

1;
