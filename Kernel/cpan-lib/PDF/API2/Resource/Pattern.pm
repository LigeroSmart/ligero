# Modified version of the work: Copyright (C) 2019 Ligero, https://www.complemento.net.br/
# based on the original work of:
# Copyright (C) 2001-2018 OTRS AG, https://otrs.com/
package PDF::API2::Resource::Pattern;

use base 'PDF::API2::Resource';

use strict;
use warnings;

our $VERSION = '2.033'; # VERSION

sub new {
    my ($class, $pdf, $name) = @_;
    my $self = $class->SUPER::new($pdf, $name);

    $self->type('Pattern');

    return $self;
}

1;
