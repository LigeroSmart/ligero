// --
// Copyright (C) 2001-2018 LIGERO AG, https://ligero.com/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (GPL). If you
// did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
// --

"use strict";

var Core = Core || {};
Core.Agent = Core.Agent || {};
Core.Agent.Admin = Core.Agent.Admin || {};

/**
 * @namespace Core.Agent.Admin.Role
 * @memberof Core.Agent.Admin
 * @author LIGERO AG
 * @description
 *      This namespace contains the special function for AdminRole module.
 */
 Core.Agent.Admin.Role = (function (TargetNS) {

    /*
    * @name Init
    * @memberof Core.Agent.Admin.Role
    * @function
    * @description
    *      This function initializes table filter.
    */
    TargetNS.Init = function () {
        Core.UI.Table.InitTableFilter($('#FilterRoles'), $('#Roles'));
    };

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;
}(Core.Agent.Admin.Role || {}));
