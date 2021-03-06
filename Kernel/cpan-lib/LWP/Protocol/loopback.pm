# Modified version of the work: Copyright (C) 2019 Ligero, https://www.complemento.net.br/
# based on the original work of:
# Copyright (C) 2001-2018 OTRS AG, https://otrs.com/
package LWP::Protocol::loopback;
$LWP::Protocol::loopback::VERSION = '6.26';
use strict;
require HTTP::Response;

use base qw(LWP::Protocol);

sub request {
    my($self, $request, $proxy, $arg, $size, $timeout) = @_;

    my $response = HTTP::Response->new(200, "OK");
    $response->content_type("message/http; msgtype=request");

    $response->header("Via", "loopback/1.0 $proxy")
	if $proxy;

    $response->header("X-Arg", $arg);
    $response->header("X-Read-Size", $size);
    $response->header("X-Timeout", $timeout);

    return $self->collect_once($arg, $response, $request->as_string);
}

1;
