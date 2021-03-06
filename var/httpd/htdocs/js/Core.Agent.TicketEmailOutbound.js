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

/**
 * @namespace Core.Agent.TicketEmailOutbound
 * @memberof Core.Agent
 * @author LIGERO AG
 * @description
 *      This namespace contains special module functions for TicketEmailOutbound.
 */
Core.Agent.TicketEmailOutbound = (function (TargetNS) {

    /**
     * @name Init
     * @memberof Core.Agent.TicketEmailOutbound
     * @function
     * @description
     *      This function initializes the module functionality.
     */
    TargetNS.Init = function () {

        var ArticleComposeOptions = Core.Config.Get('ArticleComposeOptions'),
            DynamicFieldNames = Core.Config.Get('DynamicFieldNames');

        // remove customers
        $('.CustomerTicketRemove').on('click', function () {
            Core.Agent.CustomerSearch.RemoveCustomerTicket($(this));
            return false;
        });

        // set a template
        $('#StandardTemplateID').on('change', function () {
            Core.Agent.TicketAction.ConfirmTemplateOverwrite('RichText', $(this), function () {
                Core.AJAX.FormUpdate($('#Compose'), 'AJAXUpdateTemplate', 'StandardTemplateID', ['RichTextField']);
            });
            return false;
        });

        // update dynamic fields in form
        $('#ComposeStateID').on('change', function () {
            Core.AJAX.FormUpdate($('#Compose'), 'AJAXUpdate', 'ComposeStateID', DynamicFieldNames);
        });

        // change article compose options
        if (typeof ArticleComposeOptions !== 'undefined') {
            $.each(ArticleComposeOptions, function (Key, Value) {
                $('#'+Value.Name).on('change', function () {
                    Core.AJAX.FormUpdate($('#Compose'), 'AJAXUpdate', Value.Name, Value.Fields);
                });
            });
        }

        // initialize the ticket action popup
        Core.Agent.TicketAction.Init();

    };

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;
}(Core.Agent.TicketEmailOutbound || {}));
