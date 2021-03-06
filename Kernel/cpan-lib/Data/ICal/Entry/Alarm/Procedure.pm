# Modified version of the work: Copyright (C) 2019 Ligero, https://www.complemento.net.br/
# based on the original work of:
# Copyright (C) 2001-2018 OTRS AG, https://otrs.com/
use warnings;
use strict;

package Data::ICal::Entry::Alarm::Procedure;

use base qw/Data::ICal::Entry::Alarm/;

=head1 NAME

Data::ICal::Entry::Alarm::Procedure - Represents a procedure-call alarm in an iCalendar file

=head1 SYNOPSIS

    my $valarm = Data::ICal::Entry::Alarm::Procedure->new();
    $valarm->add_properties(
        attach => [ "ftp://host.com/novo-procs/felizano.exe", { fmttype => "application/binary" } ],
        # Dat*e*::ICal is not a typo here
        trigger   => [ Date::ICal->new( epoch => ... )->ical, { value => 'DATE-TIME' } ],
    );

    $vevent->add_entry($valarm);

=head1 DESCRIPTION

A L<Data::ICal::Entry::Alarm::Procedure> object represents an alarm
that calls a procedure (in some application-defined way), which is
attached to a todo item or event in an iCalendar file.  (Note that the
iCalendar RFC refers to entries as "components".)  It is a subclass of
L<Data::ICal::Entry::Alarm> and accepts all of its methods.

=head1 METHODS

=cut

=head2 new

Creates a new L<Data::ICal::Entry::Alarm::Procedure> object; sets its
C<ACTION> property to C<PROCEDURE>.

=cut

sub new {
    my $class = shift;
    my $self  = $class->SUPER::new(@_);
    $self->add_property( action => "PROCEDURE" );
    return $self;
}

=head2 optional_unique_properties

In addition to C<duration> and C<repeat> (see
L<Data::ICal::Entry::Alarm/optional_unique_properties>), procedure-call
alarms may also specify a value for C<description>.

=cut

sub optional_unique_properties {
    return (
        shift->SUPER::optional_unique_properties,
        "description",
    );
}

=head2 mandatory_unique_properties

In addition to C<action> and C<trigger> (see
L<Data::ICal::Entry::Alarm/mandatory_unique_properties>), procedure-call
alarms must also specify a value for C<attach>.

=cut

sub mandatory_unique_properties {
    return (
        shift->SUPER::mandatory_unique_properties,
        "attach",
    );
}

=head1 AUTHOR

Best Practical Solutions, LLC E<lt>modules@bestpractical.comE<gt>

=head1 LICENCE AND COPYRIGHT

Copyright (c) 2005 - 2015, Best Practical Solutions, LLC.  All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

=cut

1;
