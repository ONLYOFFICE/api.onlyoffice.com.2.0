﻿<%@  Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Try now
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Try now</span>
    </h1>

    <h2>Search for methods and create a document</h2>
    <p>You can search for the desired method to use its script in the text area below. Or, in case you have a script of your own, use the button under the text area to upload it. You can select the necessary editor.</p>

    <div>
        <ul class="doc-builder-file-types top-nav">
            <li class="<%= Request["type"] != "cell" && Request["type"] != "slide" ? "active" : "" %>">
                <a href="<%= Url.Action("try") %>">Document Editor</a>
            </li>
            <li class="<%= Request["type"] == "cell" ? "active" : "" %>">
                <a href="<%= Url.Action("try") %>?type=cell">Spreadsheet Editor</a>
            </li>
            <li class="<%= Request["type"] == "slide" ? "active" : "" %>">
                <a href="<%= Url.Action("try") %>?type=slide">Presentation Editor</a>
            </li>
        </ul>
    </div>

    <div class="search-box" id="doc-builder-search-box">
        <div class="search-input">
            <a class="btn"></a>
            <input type="text" name="queryBuilder">
        </div>
        <ul class="builder-search-results"></ul>
    </div>

    <textarea id="builderScript" name="builderScript" data-easy="true" class="docbuilder-script" spellcheck="false"></textarea>

    <ul class="list-buttons doc-builder-list-buttons">
        <li>
            <a id="startButton" class="button red">Start script</a>
        </li>
        <li>
            <a id="clearButton" class="button">Clear</a>
        </li>
        <li>
            <a id="builderFileLink" class="button">Upload script</a>
            <input type="file" id="builderFile" />
        </li>
    </ul>

    <h2>Resulting document</h2>

    <div id="editorSpace">
        <div id="placeholder"></div>
    </div>

    <script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>
    <script type="text/javascript">

        $(".builder-search-results").hide();

        <%
            var documentType = "word";
            var ext = "docx";
            if (Request["type"] == "cell")
            {
                documentType = "cell";
                ext = "xlsx";
            }
            else if (Request["type"] == "slide")
            {
                documentType = "slide";
                ext = "pptx";
            }
        %>

        var documentType = "<%= documentType %>";
        var methodNames = [];
        var sections = <%= Newtonsoft.Json.JsonConvert.SerializeObject(DocBuilderDocumentation.GetModule(documentType)) %>;

        for (var section in sections) {
            for (var md in sections[section].methods) {
                var method = sections[section].methods[md];
                //todo:
                var desc = method.description;
                if (desc.includes("<note>")) {
                    desc = desc.substring(0, desc.indexOf("<note>") - 1) + "</p>";
                }
                if (desc.includes("<ul>")) {
                    desc = desc.substring(0, desc.indexOf("<ul>") - 1) + "</p>";
                }
                methodNames.push({
                    memberof: method.memberof,
                    name: method.name,
                    desc: desc.replace(".", "")
                });
            }
        }

        <% var defaultMethod = DocBuilderDocumentation.GetMethod(documentType, "api", "save"); %>
        $("#builderScript").val("<%= Regex.Replace(defaultMethod.Example.Script.Replace("\"", "\\\""), "\\n", "") %>".replaceAll(";", ";\n"));

        var postScript = function () {
            var removeMethod = {
                docx: "Api.GetDocument().RemoveAllElements();",
                xlsx: "Api.AddSheet(\"Sheet 1\");sheets = Api.GetSheets(); for (shInd = 0; shInd < sheets.length - 1; shInd++){ sheets[shInd].Delete(); }",
                pptx: "var oPresentation = Api.GetPresentation(); var nSlidesCount = oPresentation.GetSlidesCount(); for(var nSlideIdx = nSlidesCount - 1; nSlideIdx > -1; --nSlideIdx) { oPresentation.GetSlideByIndex(nSlideIdx).Delete(); } oPresentation.AddSlide(Api.CreateSlide());"
            };
            var script = removeMethod["<%= ext %>"] + $("#builderScript").val().replaceAll("\\", "").replaceAll("builder.CreateFile", "").replaceAll("\n", "");

            document.getElementsByName("frameEditor")[0].contentWindow.postMessage(JSON.stringify({
                guid : "asc.{A8705DEE-7544-4C33-B3D5-168406D92F72}",
                type : "onExternalPluginMessage",
                data : {
                    type: "executeCommand",
                    text: script
                }
            }), "<%= ConfigurationManager.AppSettings["editor_url"] ?? "*" %>");
        };

        window.addEventListener("message", function (message) {
            if (message && message.data == "externallistenerReady") {
                postScript();
                $("#startButton").click(postScript);
            }
        }, false);

        $("#clearButton").click(function () {
            $("#builderScript").val("");
        });

        var config = <%= Config.Serialize(
            new Config {
                Document = new Config.DocumentConfig
                    {
                        FileType = ext,
                        Key = "apiwh" + Guid.NewGuid(),
                        Title = "Example Title." + ext,
                        Url = ConfigurationManager.AppSettings["storage_demo_url"] + "new." + ext 
                    },
                DocumentType = documentType,
                EditorConfig = new Config.EditorConfigConfiguration
                    {
                        CallbackUrl = Url.Action("callback", "editors", null, Request.Url.Scheme),
                        Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                            {
                                Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                    {
                                        Request = false
                                    },
                                CompactHeader = true,
                                CompactToolbar = true,
                                Feedback = new Config.EditorConfigConfiguration.CustomizationConfig.FeedbackConfig
                                    {
                                        Visible = true
                                    },
                                HideRightMenu = true,
                                HideRulers = true,
                                ToolbarHideFileName = true,
                                ToolbarNoTabs = true
                            },
                        Plugins = new Config.EditorConfigConfiguration.PluginsConfig
                            {
                                PluginsData = new List<string>
                                    {
                                        new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/externallistener/config.json"), Query = ""}.ToString()
                                    }
                            }
                    },
                Height = "550px",
                Width = "100%"
            }) %>;

        window.docEditor = new DocsAPI.DocEditor("placeholder", config);
    </script>

</asp:Content>
