/*
 *
 * (c) Copyright Ascensio System SIA 2023
 *
 * This program is freeware. You can redistribute it and/or modify it under the terms of the GNU 
 * General Public License (GPL) version 3 as published by the Free Software Foundation (https://www.gnu.org/copyleft/gpl.html). 
 * In accordance with Section 7(a) of the GNU GPL its Section 15 shall be amended to the effect that 
 * Ascensio System SIA expressly excludes the warranty of non-infringement of any third-party rights.
 *
 * THIS PROGRAM IS DISTRIBUTED WITHOUT ANY WARRANTY; WITHOUT EVEN THE IMPLIED WARRANTY OF MERCHANTABILITY OR
 * FITNESS FOR A PARTICULAR PURPOSE. For more details, see GNU GPL at https://www.gnu.org/copyleft/gpl.html
 *
 * You can contact Ascensio System SIA by email at sales@onlyoffice.com
 *
 * The interactive user interfaces in modified source and object code versions of ONLYOFFICE must display 
 * Appropriate Legal Notices, as required under Section 5 of the GNU GPL version 3.
 *
 * Pursuant to Section 7 § 3(b) of the GNU GPL you must retain the original ONLYOFFICE logo which contains 
 * relevant author attributions when distributing the software. If the display of the logo in its graphic 
 * form is not reasonably feasible for technical reasons, you must include the words "Powered by ONLYOFFICE" 
 * in every copy of the program you distribute. 
 * Pursuant to Section 7 § 3(e) we decline to grant you any rights under trademark law for use of our trademarks.
 *
*/


$(document).ready(function() {
    var $items = $("#nav-all-menu-items").children()

    var heading = "";

    if ($items && $items.length > 0) {
        var selectedItem = $items.filter((i) => {
            return $($items[i]).hasClass("active")
        })

        if (selectedItem) {
            var link = selectedItem.children()
            heading = $(link).text()
        }
    }

    if (heading) {
        $("#variable-heading").text(heading)
    }
})

$(function () {
    $("#header-button").on("click", function () {
        if ($(".pushy").hasClass("pushy-submenu-open")) {
            $(".arrow-header").addClass("rotate");
        }
        else {
            $(".arrow-header").removeClass("rotate");
        }
    })
});

$(function () {
    $("#menu-button").on("click", function () {
        if ($(".layout-side").hasClass("open-menu")) {
            $(".layout-side").removeClass("open-menu");
            $(".site-overlay").addClass('hidden');
            $("body").removeClass("hidden-body");
        }
        else {
            $(".layout-side").addClass("open-menu");
            $(".site-overlay").removeClass('hidden');
            $(".pushy-left")
                .addClass('pushy-submenu-closed')
                .removeClass('pushy-submenu-open');
            $("body").addClass("hidden-body");
        }
    })
});

$(function () {
    $(".site-overlay").on("click", function () {
        if ($(".site-overlay").hasClass("hidden")) {
        $("body").removeClass("hidden-body");
        }
        else {
         $("body").addClass("hidden-body");
        }
    })
});