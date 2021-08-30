/*
 *
 * (c) Copyright Ascensio System Limited 2021
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


$(document).ready(function () {

    var $docsBlocks = $(".docs_block");
    $docsBlocks.each(function (i, block) {
        var $firstCol = $("#body-block .ip_main_part.col_1");
        var $secondCol = $("#body-block .ip_main_part.col_2");

        if ($firstCol.height() <= $secondCol.height()) {
            $(block).appendTo($firstCol);
        } else {
            $(block).appendTo($secondCol);
        }
    });

});

$(document).ready(function () {

    var $firstProductsCol = $(".ip_main_part.col_1").children()
    var $secondProductsCol = $(".ip_main_part.col_2").children()

    $firstProductsCol.each(function (i, product) {
        var $firstCol = $(product).find(".api_products.col_1");
        var $secondCol = $(product).find(".api_products.col_2");
        var $linkBlocks = $(product).find(".api_users_block").children();

        $linkBlocks.each(function (i, block) {
            if ($firstCol.height() <= $secondCol.height()) {
                $(block).clone().appendTo($firstCol);
            } else {
                $(block).clone().appendTo($secondCol);
            }
        })
    })

    $secondProductsCol.each(function (i, product) {
        var $firstCol = $(product).find(".api_products.col_1");
        var $secondCol = $(product).find(".api_products.col_2");
        var $linkBlocks = $(product).find(".api_users_block").children();

        $linkBlocks.each(function (i, block) {
            if ($firstCol.height() <= $secondCol.height()) {
                $(block).clone().appendTo($firstCol);
            } else {
                $(block).clone().appendTo($secondCol);
            }
        })
    })

    $(".api_col_wrapper").addClass("showing");

    /*var $docsBlocks = $("#api_product_links");
    $docsBlocks.children().each(function (i, block) {
        var $firstCol = $("#product_links_wrapper .api_products.col_1");
        var $secondCol = $("#product_links_wrapper .api_products.col_2");
           
        if ($firstCol.height() <= $secondCol.height()) {
            $(block).appendTo($firstCol);
        } else {
            $(block).appendTo($secondCol);
        }
    });*/

});