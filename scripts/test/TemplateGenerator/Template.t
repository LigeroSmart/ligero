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
use vars (qw($Self));

# get config object
my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

# disable rich text editor
my $Success = $ConfigObject->Set(
    Key   => 'Frontend::RichText',
    Value => 0,
);
$Self->True(
    $Success,
    "Disable RichText with true",
);

# set Default Language
$Success = $ConfigObject->Set(
    Key   => 'DefaultLanguage',
    Value => 'en',
);
$Self->True(
    $Success,
    "Set default language to English",
);

# get helper object
$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase  => 1,
        UseTmpArticleDir => 1,
    },
);
my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

# get ticket object
my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

# create test ticket
my $TicketNumber = $TicketObject->TicketCreateNumber();
my $TicketID     = $TicketObject->TicketCreate(
    TN           => $TicketNumber,
    Title        => 'UnitTest ticket',
    Queue        => 'Raw',
    Lock         => 'unlock',
    Priority     => '3 normal',
    State        => 'open',
    CustomerID   => '12345',
    CustomerUser => 'test@localunittest.com',
    OwnerID      => 1,
    UserID       => 1,
);
$Self->True(
    $TicketID,
    "Ticket is created - TicketID $TicketID",
);

my @Tests = (
    {
        Name           => 'Test supported tag - <LIGERO_CONFIG_ScriptAlias>',
        TemplateText   => 'Thank you for your email. <LIGERO_CONFIG_ScriptAlias>',
        ExpectedResult => 'Thank you for your email. ' . $ConfigObject->Get('ScriptAlias'),
        ,
    },
    {
        Name           => 'Test unsupported tags',
        TemplateText   => 'Test: <LIGERO_AGENT_SUBJECT> <LIGERO_AGENT_BODY> <LIGERO_CUSTOMER_BODY> <LIGERO_CUSTOMER_SUBJECT>',
        ExpectedResult => 'Test: - - - -',
    },
    {
        Name => 'Test supported tags - <LIGERO_TICKET_*> without TicketID',
        TemplateText =>
            'Options of the ticket data (e. g. <LIGERO_TICKET_TicketNumber>, <LIGERO_TICKET_TicketID>, <LIGERO_TICKET_Queue>)',
        ExpectedResult => 'Options of the ticket data (e. g. -, -, -)',
    },
    {
        Name => 'Test supported tags - <LIGERO_TICKET_*>  with TicketID',
        TemplateText =>
            'Options of the ticket data (e. g. <LIGERO_TICKET_TicketNumber>, <LIGERO_TICKET_TicketID>, <LIGERO_TICKET_Queue>, <LIGERO_TICKET_State>)',
        ExpectedResult => "Options of the ticket data (e. g. $TicketNumber, $TicketID, Raw, open)",
        TicketID       => $TicketID,
    },
);

# get needed objects
my $StandardTemplateObject  = $Kernel::OM->Get('Kernel::System::StandardTemplate');
my $TemplateGeneratorObject = $Kernel::OM->Get('Kernel::System::TemplateGenerator');

for my $Test (@Tests) {

    # create standard template
    my $TemplateID = $StandardTemplateObject->StandardTemplateAdd(
        Name         => $Helper->GetRandomID() . '-StandardTemplate',
        Template     => $Test->{TemplateText},
        ContentType  => 'text/plain; charset=utf-8',
        TemplateType => 'Answer',
        ValidID      => 1,
        UserID       => 1,
    );
    $Self->True(
        $TemplateID,
        "StandardTemplate is created - ID $TemplateID",
    );

    my $Template = $TemplateGeneratorObject->Template(
        TemplateID => $TemplateID,
        TicketID   => $Test->{TicketID} // '',
        UserID     => 1,
    );

    # check template text
    $Self->Is(
        $Template,
        $Test->{ExpectedResult},
        $Test->{Name},
    );

}

# Cleanup is done by RestoreDatabase.

1;
