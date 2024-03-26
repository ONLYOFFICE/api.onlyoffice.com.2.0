﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Config</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">The config base section allows to change the platform type used, document display size (width and height) and type of the document opened.</p>

<div class="header-gray">Example</div>
<div>
    <div id="controlFields">
        <div id="info" class="control-panel">
            <div class="line input_line" style="margin-top: 0px">
                <label for="config_documentType">Document Type</label>
                <select class="select" id="config_documentType" name="config_documentType">
                    <option disabled>word</option>
                    <option value="word" selected>word</option>
                    <option value="cell">cell</option>
                    <option value="slide">slide</option>
                    <option value="pdf">pdf</option>
                </select>
            </div>
            <div class="line input_line">
                <label for="config_type">Type</label>
                <select class="select" id="config_type" name="config_type">
                    <option disabled>desktop</option>
                    <option value="desktop" selected>desktop</option>
                    <option value="mobile">mobile </option>
                </select>
            </div>
            <div class="line input_line">
                <label for="config_height">Height</label>
                <input type="text" id="config_height" name="config_height" value="550px">
            </div>
            <div class="line input_line" style="margin-bottom: 0;">
                <label for="config_width">Width</label>
                <input type="text" id="config_width" name="config_width" value="100%">
            </div>
        </div>
    </div>
    <div id="configPreHolder" style="display: flex; margin-top: 18px;">
        <div>
            <div id="configHeader" class="configHeader">
                <div class="preContentType">
                    <span style="font-family: monospace">Config.js</span>
                </div>
                <div>
                    <div class="tooltip">
                        <div class="copyConfig">
                            <img alt="Copy" src="<%= Url.Content("~/content/img/copy-content.svg") %>" />
                            <span id="tooltiptext-hover" style="display: inline;" class="tooltiptext">When you copy, you get the HTML code for the whole example.</span>
                            <span id="tooltiptext-click" style="display: none;" class="tooltiptext">HTML copied.</span>
                        </div>
                    </div>
                </div>
            </div>
            <pre id="configPre"></pre>
        </div>  
    </div>
</div>

<div id="editorSpace">
    <div style="min-width: 832px; min-height: 550px;" id="placeholder"></div>
</div>

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td id="documentType" class="copy-link">documentType</td>
            <td>Defines the document type to be opened:
                <ul>
                    <li><b>word</b> - text document (<em>.doc, .docm, .docx, .docxf, .dot, .dotm, .dotx, .epub, .fb2, .fodt, .htm, .html, .mht, .mhtml, .odt, .oform, .ott, .rtf, .stw, .sxw, .txt, .wps, .wpt, .xml</em>),</li>
                    <li><b>cell</b> - spreadsheet (<em>.csv, .et, .ett, .fods, .ods, .ots, .sxc, .xls, .xlsb, .xlsm, .xlsx, .xlt, .xltm, .xltx, .xml</em>),</li>
                    <li><b>slide</b> - presentation (<em>.dps, .dpt, .fodp, .odp, .otp, .pot, .potm, .potx, .pps, .ppsm, .ppsx, .ppt, .pptm, .pptx, .sxi</em>),</li>
                    <li><b>pdf</b> - portable document format (<em>djvu, oxps, pdf, xps</em>).</li>
                </ul>
            </td>
            <td>string</td>
            <td>"cell"</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">
                    <b>text</b>, <b>spreadsheet</b> and <b>presentation</b> values are deprecated since version 6.1.
                    Please use new values instead.
                </div>
            </td>
        </tr>
        <tr class="tablerow">
            <td id="height" class="copy-link">height</td>
            <td>Defines the document height (<b>100%</b> by default) in the browser window.</td>
            <td>string</td>
            <td>"100%"</td>
        </tr>
        <tr class="tablerow">
            <td id="token" class="copy-link">token</td>
            <td>Defines the encrypted signature added to the <b>Document Server</b> config in the form of a <a href="<%= Url.Action("signature/browser") %>#config">token</a>.</td>
            <td>string</td>
            <td>"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.LwimMJA3puF3ioGeS-tfczR3370GXBZMIL-bdpu4hOU"</td>
        </tr>
        <tr class="tablerow">
            <td id="type" class="copy-link">type</td>
            <td>
                Defines the platform type used to access the document.
                Can be:
                <em>optimized to access the document from a desktop or laptop computer</em> - <b>desktop</b>,
                <em>optimized to access the document from a tablet or a smartphone</em> - <b>mobile</b>,
                <em>specifically formed to be easily embedded into a web page</em> - <b>embedded</b>.
                The default value is <b>"desktop"</b>.
            </td>
            <td>string</td>
            <td>"desktop"</td>
        </tr>
        <tr class="tablerow">
            <td id="width" class="copy-link">width</td>
            <td>Defines the document width (<b>100%</b> by default) in the browser window.</td>
            <td>string</td>
            <td>"100%"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>
<script type="text/javascript">
    handleSelects();

    var { config, copy } = deepCopyConfig(<%= Config.Serialize(
        new Config {
            Document = new Config.DocumentConfig
                {
                    FileType = "docx",
                    Key = "apiwh" + Guid.NewGuid(),
                    Permissions = new Config.DocumentConfig.PermissionsConfig(),
                    Title = "Example Title",
                    Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo." + "docx",
                    Info = new Config.DocumentConfig.InfoConfig()
                },
            DocumentType = "word",
            EditorConfig = new Config.EditorConfigConfiguration
                {
                    CallbackUrl = Url.Action("callback", "editors", null, Request.Url.Scheme),
                    Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                        {
                            Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                {
                                    Request = false
                                },
                            Feedback = new Config.EditorConfigConfiguration.CustomizationConfig.FeedbackConfig
                                {
                                    Visible = true
                                },
                            IntegrationMode = "embed",
                    }
                },
            Height = "550px",
            Width = "100%"
        }) %>);
    var config_word = config;
    var config_word_copy = copy;

    var { config, copy } = deepCopyConfig(<%= Config.Serialize(
        new Config {
            Document = new Config.DocumentConfig
                {
                    FileType = "xlsx",
                    Key = "apiwh" + Guid.NewGuid(),
                    Permissions = new Config.DocumentConfig.PermissionsConfig(),
                    Title = "Example Title",
                    Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo." + "xlsx",
                    Info = new Config.DocumentConfig.InfoConfig()
                },
            DocumentType = "cell",
            EditorConfig = new Config.EditorConfigConfiguration
                {
                    CallbackUrl = Url.Action("callback", "editors", null, Request.Url.Scheme),
                    Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                        {
                            Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                {
                                    Request = false
                                },
                            Feedback = new Config.EditorConfigConfiguration.CustomizationConfig.FeedbackConfig
                                {
                                    Visible = true
                                },
                            IntegrationMode = "embed",
                    }
                },
            Height = "550px",
            Width = "100%"
        }) %>);
    var config_cell = config;
    var config_cell_copy = copy;

    var { config, copy } = deepCopyConfig(<%= Config.Serialize(
        new Config {
            Document = new Config.DocumentConfig
                {
                    FileType = "pptx",
                    Key = "apiwh" + Guid.NewGuid(),
                    Permissions = new Config.DocumentConfig.PermissionsConfig(),
                    Title = "Example Title",
                    Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo." + "pptx",
                    Info = new Config.DocumentConfig.InfoConfig()
                },
            DocumentType = "slide",
            EditorConfig = new Config.EditorConfigConfiguration
                {
                    CallbackUrl = Url.Action("callback", "editors", null, Request.Url.Scheme),
                    Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                        {
                            Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                {
                                    Request = false
                                },
                            Feedback = new Config.EditorConfigConfiguration.CustomizationConfig.FeedbackConfig
                                {
                                    Visible = true
                                },
                            IntegrationMode = "embed",
                    }
                },
            Height = "550px",
            Width = "100%"
        }) %>);
    var config_slide = config;
    var config_slide_copy = copy;

    var { config, copy } = deepCopyConfig(<%= Config.Serialize(
    new Config {
        Document = new Config.DocumentConfig
            {
                FileType = "pdf",
                Key = "apiwh" + Guid.NewGuid(),
                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                Title = "Example Title",
                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo." + "pdf",
                Info = new Config.DocumentConfig.InfoConfig()
            },
        DocumentType = "pdf",
        EditorConfig = new Config.EditorConfigConfiguration
            {
                CallbackUrl = Url.Action("callback", "editors", null, Request.Url.Scheme),
                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                    {
                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                            {
                                Request = false
                            },
                        Feedback = new Config.EditorConfigConfiguration.CustomizationConfig.FeedbackConfig
                            {
                                Visible = true
                            },
                        IntegrationMode = "embed",
                }
            },
        Height = "550px",
        Width = "100%"
    }) %>);
    var config_pdf = config;
    var config_pdf_copy = copy;

    const deepCopies = {
        word: config_word_copy,
        cell: config_cell_copy,
        slide: config_slide_copy,
        pdf: config_pdf_copy
    }

    window.docEditor = new DocsAPI.DocEditor("placeholder", config_word);
</script>

<script>

    var editor_url = "<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>";

    $(".copyConfig").click(function () {
        var currentConfigName = getFieldValue("config_documentType").replaceAll(`"`, "");
        var json = JSON.stringify(deepCopies[currentConfigName], null, '\t');
        var html = createConfigHTML(editor_url, json);
        copyConfigToClipboard(html);
    })
    $(".tooltip").mouseleave(copyConfigMouseLeave);
</script>

<script>
    $(document).ready(function () {
        resizeCodeInput();
        updateConfig();
    });

    $("#controlFields").find("input,select").change(function () {
        updateConfig();
    });

    function showHideConfigObject(e) {
        var hidden = document.getElementById(`holder_${e.target.id}`).hidden;
        document.getElementById(`holder_${e.target.id}`).hidden = !hidden;
        resizeCodeInput();
    }

    function updateConfig() {
        var config_str = `{
            "documentType": ${getFieldValue("config_documentType")},
            "type": ${getFieldValue("config_type")},
            "height": ${getFieldValue("config_height")},
            "width": ${getFieldValue("config_width")}     
        }`;
        config_string =
            `var docEditor = new DocsAPI.DocEditor("placeholder", {
    ${config_str}
    ...
});
`;
        var config_object = JSON.parse(config_str);
        var config = config_word;
        if (config_object.documentType == "cell") {
            config = config_cell;
        } else if (config_object.documentType == "slide") {
            config = config_slide;
        } else if (config_object.documentType == "pdf") {
            config = config_pdf;
        }

        config.documentType = config_object.documentType;
        config.type = config_object.type;
        config.height = config_object.height;
        config.width = config_object.width;

        deepCopies[config_object.documentType].documentType = config_object.documentType;
        deepCopies[config_object.documentType].type = config_object.type;
        deepCopies[config_object.documentType].height = config_object.height;
        deepCopies[config_object.documentType].width = config_object.width;

        window.docEditor.destroyEditor();
        window.docEditor = new DocsAPI.DocEditor("placeholder", config);
        var pre = document.getElementById("configPre");
        pre.innerHTML = config_string;
        hljs.highlightBlock(pre);
        console.log(config_word_copy);
    }
</script>