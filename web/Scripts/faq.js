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


$(document).ready(function () {
    $(".qa-question-link").on("click", function () {
        var index = $(this).parents(".qa-questions .qa-block-question").index();
        $($(this).parents(".qa-blocks").find(".qa-block .qa-block-question").removeClass("selected")[index]).addClass("selected");
        $($(this).parents(".qa-blocks").find(".qa-block .qa-block-answer").fadeOut()[index]).fadeIn();
    });

    $(".faq_block dt").on("click", function () {
        var i = 0;
        $(this).toggleClass("expanded_node").siblings("dd").slideToggle("fast");

        $.each($(".faq_block dt"), function () {
            if ($(this).attr("class") == "expanded_node") {
                i = 1;
            }
        });
        if (i == 1) {
            $(".fq_expand").hide();
            $(".fq_collapse").show();
        } else {
            $(".fq_collapse").hide();
            $(".fq_expand").show();
        }
    });

    var current = window.location.href.split("#")[1];
    $.each($("dl"), function () {
        if (current == null || current == "undefined") {
            $(".faq_block:first-of-type dt").addClass("expanded_node");
            $(".faq_block:first-of-type dd").show();
        } else if (current == $(this).attr("id")) {
            $(this).children("dt").addClass("expanded_node").siblings("dd").show();
        }
    });

    $(".fq_expand").on("click", function () {
        $("dt").removeClass("expanded_node").addClass("expanded_node");
        $("dd").slideDown("fast");
        $(this).hide();
        $(".fq_collapse").show();
    });

    $(".fq_collapse").on("click", function () {
        $("dt").removeClass("expanded_node");
        $("dd").slideUp("fast");
        $(this).hide();
        $(".fq_expand").show();
    });

    var allowedYes = '<p>allowed</p>',
        allowedNo = '<p>not allowed</p>',
        noDownloadButton = 'Document downloading is not allowed and the <b>Download</b> button is not displayed.',
        yesDownloadButton = 'Document downloading is allowed and the <b>Download</b> button is visible.',
        noEditButton = 'Document editing is disabled and the button which allows to switch to editing is hidden.',
        yesEditButton = 'Document editing is disabled but the button which allows to switch to editing is displayed.',
        noPrintButton = 'Document printing is not allowed and the <b>Print</b> button is not displayed.',
        yesPrintButton = 'Document printing is allowed and the <b>Print</b> button is visible.',
        noCommentingView = 'Document commenting is not allowed in <b>View</b> mode, comments can be viewed only.',
        noFillingView = 'Filling forms in the document is not allowed in <b>View</b> mode.',
        noReviewView = 'Document review is not allowed in <b>View</b> mode.',
        noCommentingEditingEdit = 'Document commenting is not allowed, comments can be viewed only.',
        yesCommentingEdit = 'Document commenting is enabled.',
        yesFillingEdit = 'Filling forms in the document is allowed.',
        noFillingEdit = 'Filling forms in the document is disabled.',
        yesFillingOnlyEdit = 'Filling forms only mode is enabled.',
        yesReviewEdit = 'Review mode is enabled (form filling is also available).',
        noReviewEdit = 'Review mode is disabled.';

    function toggler() {
        if ($('#download .paramTrue').hasClass('active_param')) {
            $('#downloading .resultPermission').removeClass('notallowed').addClass('allowed').html(allowedYes);
            $('#downloading .resultNote').html(yesDownloadButton);
        } else {
            $('#downloading .resultPermission').removeClass('allowed').addClass('notallowed').html(allowedNo);
            $('#downloading .resultNote').html(noDownloadButton);
        }

        if ($('#print .paramTrue').hasClass('active_param')) {
            $('#printing .resultPermission').removeClass('notallowed').addClass('allowed').html(allowedYes);
            $('#printing .resultNote').html(yesPrintButton)
        } else {
            $('#printing .resultPermission').removeClass('allowed').addClass('notallowed').html(allowedNo);
            $('#printing .resultNote').html(noPrintButton);
        }

        // mode=view
        if ($('#mode .paramView').hasClass('active_param')) {
            $('#commenting .resultPermission, #formFilling .resultPermission, #reviewing .resultPermission, #editing .resultPermission').removeClass('allowed').addClass('notallowed').html(allowedNo);
            $('#commenting .resultNote').html(noCommentingView);
            $('#formFilling .resultNote').html(noFillingView);
            $('#reviewing .resultNote').html(noReviewView);
            // mode=view, edit=true
            if ($('#edit .paramTrue').hasClass('active_param')) {
                $('#editing .resultNote').html(yesEditButton);
            }
                // mode=view, edit=false
            else {
                $('#editing .resultNote').html(noEditButton);
            }
        }
            // mode=edit
        else {
            // mode=edit, edit=true
            if ($('#edit .paramTrue').hasClass('active_param')) {
                $('#editing .resultPermission, #formFilling .resultPermission').addClass('allowed').removeClass('notallowed').html(allowedYes);
                $('#editing .resultNote').html('Document editing is allowed.');
                $('#formFilling .resultNote').html(yesFillingEdit);
                //commenting modes
                //mode=edit, edit=true, comment=true
                if ($('#comment .paramTrue').hasClass('active_param')) {
                    $('#commenting .resultPermission').addClass('allowed').removeClass('notallowed').html(allowedYes);
                    $('#commenting .resultNote').html(yesCommentingEdit);
                }
                    //mode=edit, edit=true, comment=false
                else {
                    $('#commenting .resultPermission').removeClass('allowed').addClass('notallowed').html(allowedNo);
                    $('#commenting .resultNote').html(noCommentingEditingEdit);
                }
                //reviewing modes
                // mode=edit, edit=true, review=true
                if ($('#review .paramTrue').hasClass('active_param')) {
                    $('#reviewing .resultPermission').removeClass('notallowed').addClass('allowed').html(allowedYes);
                    $('#reviewing .resultNote').html(yesReviewEdit);
                }
                    // mode=edit, edit=true, review=false
                else {
                    $('#reviewing .resultPermission').removeClass('allowed').addClass('notallowed').html(allowedNo);
                    $('#reviewing .resultNote').html(noReviewEdit);
                }
            }
                // mode=edit, edit=false
            else {
                $('#editing .resultPermission').addClass('notallowed').removeClass('allowed').html(allowedNo);
                $('#editing .resultNote').html('Document editing is disabled.');
                //reviewing modes
                // mode=edit, edit=false, review=true
                if ($('#review .paramTrue').hasClass('active_param')) {
                    $('#reviewing .resultPermission').removeClass('notallowed').addClass('allowed').html(allowedYes);
                    $('#reviewing .resultNote').html(yesReviewEdit);
                }
                    // mode=edit, edit=false, review=false
                else {
                    $('#reviewing .resultPermission').removeClass('allowed').addClass('notallowed').html(allowedNo);
                    $('#reviewing .resultNote').html(noReviewEdit);
                }
                //form filling modes
                // mode=edit, edit=false, fillForms=true or review=true
                if ($('#fillForms .paramTrue').hasClass('active_param') || $('#review .paramTrue').hasClass('active_param')) {
                    $('#formFilling .resultPermission').addClass('allowed').removeClass('notallowed').html(allowedYes);
                    $('#formFilling .resultNote').html(yesFillingEdit);
                }
                    // mode=edit, edit=false, fillForms=true, review=false
                else if ($('#fillForms .paramTrue').hasClass('active_param') && $('#review .paramTrue').hasClass('inactive_param')) {
                    $('#formFilling .resultPermission').addClass('allowed').removeClass('notallowed').html(allowedYes);
                    $('#formFilling .resultNote').html(yesFillingOnlyEdit);
                }
                    // mode=edit, edit=false, fillForms=false, review=false
                else {
                    $('#formFilling .resultPermission').removeClass('allowed').addClass('notallowed').html(allowedNo);
                    $('#formFilling .resultNote').html(noFillingEdit);
                }
                //commenting modes
                // mode=edit, edit=false, comment=false/true, fillForms=true, review=false
                if ($('#fillForms .paramTrue').hasClass('active_param') && $('#review .paramTrue').hasClass('inactive_param')) {
                    $('#commenting .resultPermission').removeClass('allowed').addClass('notallowed').html(allowedNo);
                    $('#commenting .resultNote').html(noCommentingEditingEdit);
                }
                    // mode=edit, edit=false, comment=true, review=true
                else if ($('#comment .paramTrue').hasClass('active_param') && $('#review .paramTrue').hasClass('active_param')) {
                    $('#commenting .resultPermission').removeClass('notallowed').addClass('allowed').html(allowedYes);
                    $('#commenting .resultNote').html(yesCommentingEdit);
                }
                    // mode=edit, edit=false, comment=true
                else if ($('#comment .paramTrue').hasClass('active_param')) {
                    $('#commenting .resultPermission').removeClass('notallowed').addClass('allowed').html(allowedYes);
                    $('#commenting .resultNote').html(yesCommentingEdit);
                }
                    // mode=edit, edit=false, comment=false
                else {
                    $('#commenting .resultPermission').removeClass('allowed').addClass('notallowed').html(allowedNo);
                    $('#commenting .resultNote').html(noCommentingEditingEdit);
                }
            }
        }
    }

    $("#parameters td").on('click', function () {
        $(this).parents('.parameters_permissions tr').find('td').removeClass('active_param').addClass('inactive_param');
        $(this).removeClass('inactive_param').addClass('active_param');
        toggler();
    });

    toggler();
});