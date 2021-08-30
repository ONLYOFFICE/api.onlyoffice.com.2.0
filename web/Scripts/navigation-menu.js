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


$(function () {

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min)) + min;
    }
    if ($("div.ham_menu").length) {
        $(".ham_menu").on("click", function () {

            if ($(".pushy-left").hasClass("pushy-submenu-closed")) {
                $(".pushy-left")
                    .removeClass('pushy-submenu-closed')
                    .addClass('pushy-submenu-open');
                $(".site-overlay").removeClass('hidden');
                if ($(".layout-side").hasClass("open-menu")) {
                    $(".layout-side").removeClass("open-menu");
                }
            } else {
                $(".pushy-left")
                    .addClass('pushy-submenu-closed')
                    .removeClass('pushy-submenu-open');
                $(".site-overlay").addClass('hidden');
            }
        });
    }

    $(".site-overlay").on("click", function () {
        $(".pushy-left")
            .addClass('pushy-submenu-closed')
            .removeClass('pushy-submenu-open');
        $(".site-overlay").addClass('hidden');
        $(".layout-side").removeClass("open-menu");
    })

    $('header').mouseleave(function () {
        mouseleaveCloseMenu();
    });
    $('nav > div > ul > li > div').mouseleave(function () {
        mouseleaveCloseMenu();
    });

    $('body')
        .on("click", "a.nav_2nd_menu_link", function () {
            if (window.innerWidth < '1024') {
                $('.pushy-link').trigger('click');
                $('body').removeClass('pushy-open-left');
                var href = $(this).attr('href');
                highlightMenuItem(href);
            } else {
                mouseleaveCloseMenu();
                var href = $(this).attr('href');
                highlightMenuItem(href);
            }
        });
    $('.pushy.pushy-left').click(function () {
        if ($('.menuitem.active').length > 0) {
            $(".pushy-submenu")
                .addClass('pushy-submenu-closed')
                .removeClass('pushy-submenu-open');
            if (window.innerWidth < '1024') {
                var submenuOpen = $('.pushy-submenu.pushy-submenu-open');
                if (submenuOpen != null) {
                    $('.pushy-submenu').css('display', 'block');
                } else {
                    $('.pushy-submenu').show();
                }
            }
        }
    });
    $('.menuitem')
        .click(function () {
            var menuitem = $(this);
            if (window.innerWidth < '1024') {
                if ($($(this)[0].parentNode).hasClass('pushy-submenu-closed')) {
                    $('.pushy-submenu').hide();
                    $($(this)[0].parentNode).show();
                } else {
                    $('.pushy-submenu').show();
                }
            } else {
                $('ul.akkordeon li > a').addClass('active');
                $('ul.akkordeon li > div').show();

                $('.top_border').removeClass('top_border');

                setTimeout(function () {
                    menuitem.next().addClass('top_border');
                }, 100);

            }
        })
        .hover(function (event) {
            if (window.innerWidth >= '1024') {
                var menuitem = $(this);
                if (!menuitem.hasClass('active')) {
                    menuitem.click();
                }
            }
        });
    $('.navitem_description').click(function () { return false; })
    var mobileMenu = function () {
        $('ul.akkordeon > li > a').removeClass('active');
        $('ul.akkordeon > li > div').hide();
        $('ul.akkordeon > li > a').unbind('click');
        $('ul.akkordeon > li > a').click(function (event) {
            if (!$(this).hasClass('active')) {
                $('ul.akkordeon > li > a').removeClass('active').next('div').slideUp();
                $(this).addClass('active');
                $(this).next('div').slideDown(200);
            } else {
                $(this).removeClass('active').next('div').slideUp();
            }
            event.stopPropagation();
        });
    };
    var desktopMenu = function () {
        $('ul.akkordeon > li > a').unbind('click');
        $('ul.akkordeon > li > a').addClass('active');
        $('ul.akkordeon > li > div').show();
    };
    var mouseleaveCloseMenu = function () {
        if (window.innerWidth > '1024') {
            $('.menuitem.active').click();
            if (!$('#LanguageSelector').hasClass('open')) $('#fshare-collapsed').show();
        }
    };
    function highlightMenuItem(href) {
        var anc = href ? href.split("#")[1] : window.location.hash.replace("#", "");

        $('ul.navitem_2nd_menu li a.nav_2nd_menu_link').removeClass('redirect');
    }
    $(document).ready(function () {
        highlightMenuItem();
        if (window.innerWidth >= '1024') {
            desktopMenu();
        } else {
            mobileMenu();
        }
    });
    $(window).resize(function () {
        if (window.innerWidth >= '1024') {
            $('.pushy-submenu').css('display', 'inline-block');
            desktopMenu();
        } else {
            $(".mobile_no_link").removeAttr("href");
            mobileMenu();
            var submenuOpen = $('.pushy-submenu.pushy-submenu-open');
            if (submenuOpen != null) {
                $('.pushy-submenu').css('display', 'block');
                submenuOpen.click();
            } else {
                $('.pushy-submenu').show();
            }
        }
    });
});
