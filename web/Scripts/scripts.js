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


$(function() {
    function displayModalPanel (obj, width, height, top, position) {
        try {
            width = parseInt(width || 0);
            height = parseInt(height || 0);
            left = parseInt(-width / 2);
            top = parseInt(top || -height / 2);
            position = position || "fixed";
            $.blockUI({
                message: $(obj),
                css: {
                    left: '50%',
                    top: '50%',
                    opacity: '1',
                    border: 'none',
                    padding: '0px',
                    width: width > 0 ? width + 'px' : 'auto',
                    height: height > 0 ? height + 'px' : 'auto',
                    cursor: 'default',
                    textAlign: 'left',
                    position: position,
                    'margin-left': left + 'px',
                    'margin-top': top + 'px',
                    'background-color': 'Transparent'
                },

                overlayCSS: {
                    backgroundColor: '#eee',
                    cursor: 'default',
                    opacity: '0.6'
                },

                focusInput: true,
                baseZ: 666,

                fadeIn: 0,
                fadeOut: 0,
                onBlock: function () {
                    var $blockUI = $(obj).parents('div.blockUI:first'), blockUI = $blockUI.removeClass('blockMsg').addClass('blockDialog').get(0), cssText = '';
                    if ($.browser.msie && $.browser.version < 9 && $blockUI.length !== 0) {
                        var prefix = ' ', cssText = prefix + blockUI.style.cssText, startPos = cssText.toLowerCase().indexOf(prefix + 'filter:'), endPos = cssText.indexOf(';', startPos);
                        if (startPos !== -1) {
                            if (endPos !== -1) {
                                blockUI.style.cssText = [cssText.substring(prefix.length, startPos), cssText.substring(endPos + 1)].join('');
                            } else {
                                blockUI.style.cssText = cssText.substring(prefix.length, startPos);
                            }
                        }
                    }
                }
            });
        } catch (e) {
        }
    }

    $(".button-popap-try").click(function () {
        $("#trySourceCodeDialog .popap-container>div").hide();
        var codeId = $(this).attr("data-code");
        $("#" + codeId).show();
        
        displayModalPanel("#trySourceCodeDialog", 825, 650, 0, "absolute");
    });
    
    $(".button-popap-open").click(function () {
        $("#containerDialog .popap-container>div").hide();
        var codeId = $(this).attr("data-body");
        $("#" + codeId).show();

        displayModalPanel("#containerDialog", 800, 650, 0);
    });

    $(".video-link").click(function () {
        var poapDialog = $(this).find(".popap-dialog");

        displayModalPanel(poapDialog, 680, 500, 0, "absolute");
    });

    $("body").on("click", ".button-close, .blockOverlay", $.unblockUI);

    $(document).keyup(function (event) {
        if (!$('.blockUI').is(':visible'))
            return;

        var code;
        if (!e) var e = event;
        if (e.keyCode) code = e.keyCode;
        else if (e.which) code = e.which;

        if (code == 27) {
            $.unblockUI();
        }
    });

    $(".search-box .btn").click(function () {
        $(this).parent().submit();
    });

    $(".search-box input").bind("change paste keyup", function () {
        $(this).val() ? $(this).parent().children(".search-clear").show() : $(this).parent().children(".search-clear").hide();
    });

    $(".search-box .search-clear").click(function () {
        $(this).parent().children("input").val("");
        $(this).hide();
    });

    $("#doc-builder-search-box input").bind("change paste keyup", function () {
        var searchBox = this;
        if (!!$(searchBox).val()) {
            $(".builder-search-results").empty();
            methodNames.forEach(function (methodItem) {
                var searchItem = methodItem.memberof + " " + methodItem.name + " " + methodItem.desc;
                if (searchItem.toLowerCase().includes($(searchBox).val().toLowerCase())) {
                    var elem = document.createElement("li");
                    elem.innerHTML = "<p>" + methodItem.memberof + "." + methodItem.name + " — </p>" + methodItem.desc.replace(".", "");
                    elem.setAttribute("data-section", methodItem.memberof);
                    elem.setAttribute("data-method", methodItem.name);
                    $(".builder-search-results").append(elem);
                }
            });
        }
        $(".builder-search-results").toggle($(".builder-search-results")[0].innerHTML != "");
    });

    $(document).bind("mouseup", function(e) {
        var builderSearch = $(e.target).closest(".builder-search-results");
        if (!builderSearch.length) {
            $(".builder-search-results").hide();
        } else if (builderSearch) {
            var methodItem = $(e.target.closest("li"));

            $(".builder-search-results").hide();
            $("#doc-builder-search-box input").val("");

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "");
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.send(JSON.stringify( {module: documentType, section: methodItem.data("section").toLowerCase(), method: methodItem.data("method").toLowerCase()}));

            xhr.onload = function () {
                var script = xhr.responseText;
                script = "\n\n" + script.substring(script.indexOf(";") + 2, script.length);

                $("#builderScript").val(function () {
                    return this.value.substring(0, this.value.indexOf("builder.SaveFile") - 1) + script;
                });
            };
        }
    });

    $(".side-nav").treeview({
        collapsed: true,
        animated: "medium",
        unique: false,
        persist: "location"
    });

    $("pre").each(function (i, block) {
        hljs.highlightBlock(block);
    });


    $("#builderFileLink").on("click", function (e) {
        e.preventDefault();
        $("#builderFile").click();
    });

    $("#builderFile").on("change", function (e) {
        var input = e.target;

        var reader = new FileReader();
        reader.onload = function () {
            var text = reader.result;

            var scriptMaxLength = 10000;
            var createFunction = "builder.CreateFile";
            var saveFunction = "builder.SaveFile";
            var easy = $("#builderScript").data("easy");

            if (text.length == 0
                || text.length >= scriptMaxLength
                || text.indexOf(createFunction) == -1 && !easy
                || text.indexOf(saveFunction) == -1 && !easy) {
                $("#builderScript").val("Invalid script");
                return;
            }

            $("#builderScript").val(text);
        };
        reader.readAsText(input.files[0]);
    });

    new Clipboard(".copy-link", {
        text: function (obj) {
            var current = location.href;
            if (current.indexOf("#") > 0) {
                current = current.substring(0, Math.max(current.indexOf("#")));
            }

            var href = $(obj).attr("href");
            if (!href) {
                var id = $(obj).attr("id");
                if (!id) {
                    id = $(obj).closest("[id]").attr("id");
                }
                location.hash = id;

                href = current + "#" + id;
            } else if (href.indexOf("#") == 0) {
                location.hash = href;

                href = current + href;
            }
            return href;
        }
    }).on("success",
        function () {
            //alert("Link was copied to clipboard");
        });


    var clipboard = new Clipboard(".copy-code", {
        target: function () {
            return $("pre:visible")[0];
        }
    });
});

var valueOfRenderedBlocks = 0;

function getHeadParams(thead) {
    var paramsList = thead.find("td");
    if (!paramsList || !paramsList.length) return false

    var params = [];

    for (var param of paramsList) {
        params.push(param.innerText);
    }

    return params
}

function createContentItem(content, headParams, index, mobileBlock) {
    $(mobileBlock).append(`<div class="${" contentItem index" + valueOfRenderedBlocks + "-" + index}" ></div >`)

    for (var i = 0; i < content.length; i++) {
        if (!content[i].innerHTML) continue;
        $(`.contentItem.index${valueOfRenderedBlocks}-${index}`).append(`
        <div class="itemRow">
            <span class="param">${headParams[i]}: </span>
            <span class="value">${content[i].innerHTML}</span>
        </div>`)
    }

    valueOfRenderedBlocks++
}

function createMobileContent(tbody, headParams, mobileBlock) {
    var contentList = tbody.children("tr");

    if (!contentList || !contentList.length) return false

    contentList.map((i) => {
        createContentItem($(contentList[i]).children("td"), headParams, i, mobileBlock);
    })
}

function renderMobileContent(tables) {
    if (!tables.length) return

    for (var table of tables) {
        var mobileBlock = $(table).next(".mobile-content")
        if (!mobileBlock.length) return

        var headParams = getHeadParams($(table).children("thead"))
        if (!headParams) return;

        createMobileContent($(table).children("tbody"), headParams, mobileBlock)
    }
}

$(document).ready(function () {
    $(".spoiler_heading").on("click", function () {
        $(this).next(".spoiler_code").slideToggle("fast");
    });

    var $tables = $(".table");
    if ($tables.length) renderMobileContent($tables);
});
