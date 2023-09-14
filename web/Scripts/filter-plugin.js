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


$(function () {

    var currentFilter = null;
    var $plugins = $(".plugin-block").children();
    var $filterItems = $(".filter-item");

    $("#filter-plugin").on("click", toggleFilterButton)
    $("#back-drop").on("click", closeFilter)

    $(".filter-item").on("click", function () {
        toggleFilterButton();
        var selectedFilter = $(this).attr('id')

        if ( selectedFilter === currentFilter) {
            currentFilter = null;
            showAll();
            highlightSelectedFilter();
            return
        } else {
            currentFilter = selectedFilter
            highlightSelectedFilter();
        }
        showAll();
        for (var plugin of $plugins) {
            var data = plugin.dataset.types
            if (!data) {
                $(plugin).addClass("hidden")
                continue
            } 

            var types = plugin.dataset.types.split(",")

            let showPlugin = false

            for (var type of types) {
                if (type === currentFilter) {
                    showPlugin = true
                    break
                }
            }

            if (!showPlugin) {
                $(plugin).addClass("hidden")
            }
        }
    })

    function showAll() {
        for (var plugin of $plugins) {
            $(plugin).removeClass("hidden")
        }
    }

    function highlightSelectedFilter() {

        for (var item of $filterItems) {
            var itemId = $(item).attr('id')

            if (itemId === currentFilter) {
                $(item).addClass("selected")
            } else {
                $(item).removeClass("selected")
            }
        }
    }

    function closeFilter() {
        $(".filter-selector").removeClass("show");
    }

    function toggleFilterButton() {
        if ($(".filter-selector").hasClass("show")) {
            $(".filter-selector").removeClass("show");
        }
        else {
            $(".filter-selector").addClass("show");
        }
    }
});


$(function () {
    $("#filter-button").on("click", function () {
        if ($(".filter-selector").hasClass("show")) {
            $(".img-plugin").addClass("rotate");
        }
        else {
            $(".img-plugin").removeClass("rotate");
        }
    })
});


