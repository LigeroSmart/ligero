// --
// Copyright (C) 2001-2018 LIGERO AG, https://ligero.com/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (GPL). If you
// did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
// --

"use strict";

var Core = Core || {};

// nofilter(TidyAll::Plugin::LIGERO::JavaScript::FileNameUnitTest)
Core.UnitTest = (function (Namespace) {

    QUnit.done(function () { //eslint-disable-line no-undef
        $('#qunit-testresult').addClass('complete');
    });

    return Namespace;
}(Core.UnitTest || {}));
