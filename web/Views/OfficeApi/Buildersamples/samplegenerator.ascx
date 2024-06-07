<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>
<script type="text/javascript">

    <%
    var documentType = this.Attributes["documentType"];
    var ext = this.Attributes["ext"];
    var zoom = 100;
    var templateUrl = ConfigurationManager.AppSettings["storage_demo_url"] + "new." + ext;
    var useTemplateFile = false;
    var runScript = true;
    var docTitle = "Sample";

    if (this.Attributes["docTitle"] != null)
    {
        docTitle = this.Attributes["docTitle"];
    }
    if (this.Attributes["zoom"] != null)
    {
        zoom = Int32.Parse(this.Attributes["zoom"]);
    }
    if (this.Attributes["template"] != null)
    {
        templateUrl = new System.UriBuilder(Request.Url.AbsoluteUri)
            {
                Path = "/app_data/docbuilder/sample-files/" + this.Attributes["template"] + "." + ext
            }.ToString();
        useTemplateFile = true;
    }
    if (this.Attributes["runScript"] == "false")
    {
        runScript = false;
    }

    %>
    var runScript = "<%=runScript %>";
    var useTemplateFile = "<%= useTemplateFile %>";
    var documentType = "<%= documentType %>";
    var methodNames = [];
    var sections = <%= Newtonsoft.Json.JsonConvert.SerializeObject(DocBuilderDocumentation.Instance.GetModule(documentType)) %>;

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

    var postScript = function () {
        var removeMethod = {
            docx: "Api.GetDocument().RemoveAllElements(); Api.GetDocument().GetFinalSection().RemoveFooter('default'); Api.GetDocument().GetFinalSection().RemoveHeader('default');",
            xlsx: "Api.AddSheet(\"Sheet\"); var sheets = Api.GetSheets(); for (var shInd = 0; shInd < sheets.length - 1; shInd++){ sheets[shInd].Delete(); }; Api.GetActiveSheet().SetName(\"Sheet1\");",
            pptx: "var oPresentation = Api.GetPresentation(); var nSlidesCount = oPresentation.GetSlidesCount(); for(var nSlideIdx = nSlidesCount - 1; nSlideIdx > -1; --nSlideIdx) { oPresentation.GetSlideByIndex(nSlideIdx).Delete(); } oPresentation.AddSlide(Api.CreateSlide());"
        };
        if (useTemplateFile == "True") {
            removeMethod = {
                docx: "",
                xlsx: "",
                pptx: ""
            };
        }
        var script = removeMethod["<%= ext %>"] +
            $("#builderScript").val().replaceAll("builder.OpenFile", "").replaceAll("builder.CreateFile", "").replaceAll("builder.SaveFile", "").replaceAll("builder.CloseFile()", "").replaceAll("\n", "");

        (new Function(
            "connector.callCommand(" +
                "function() {" +
                    script +
                "}" +
            ");"
        ))();
    };

    var onDocumentReady = function () {
        window.connector = docEditor.createConnector();
        if (runScript == "True") {
            postScript();
        }
    };

    $("#startButton").click(postScript);
    $("#clearButton").click(function () {
        $("#builderScript").val("");
    });

    var config = <%= Config.Serialize(
            new Config {
                Document = new Config.DocumentConfig
                {
                    FileType = ext,
                    Key = "apiwh" + Guid.NewGuid(),
                    Permissions = new Config.DocumentConfig.PermissionsConfig(),
                    Title = "Sample Title." + ext,
                    Url = templateUrl
                },
                DocumentType = documentType,
                EditorConfig = new Config.EditorConfigConfiguration
                {
                    CallbackUrl = Url.Action("callback", "editors", null, Request.Url.Scheme),
                    Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                    {
                        Autosave = false,
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
                        IntegrationMode = "embed",
                        ToolbarHideFileName = true,
                        ToolbarNoTabs = true,
                        Zoom = zoom
                    }
                },
                Height = "550px",
                Width = "100%"
            }) %>;

    config.events = {
        onDocumentReady: onDocumentReady,
    };

    window.docEditor = new DocsAPI.DocEditor("placeholder", config);
</script>
