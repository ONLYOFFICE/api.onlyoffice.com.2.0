<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<h1>
    <a class="up" href="<%= Url.Action("events/") %>"></a>
    <span class="hdr">onWorksheetChange</span>
</h1>

<p>The function called when the specified range of the current worksheet is changed.</p>

<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>range</em></td>
            <td><a href="<%= Url.Action(string.Format("spreadsheetapi/apirange")) %>">ApiRange</a></td>
            <td>Defines the modified range of the current worksheet.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<note>Please note that this event is not called for the undo/redo operations.</note>

<% var script = "builder.CreateFile(\"xlsx\");\nvar oWorksheet = Api.GetActiveSheet();\nvar oRange = oWorksheet.GetRange(\"A1\");\noRange.SetValue(\"1\");\nApi.attachEvent(\"onWorksheetChange\", function(oRange){\n    console.log(\"onWorksheetChange\");\n    console.log(oRange.GetAddress());\n});\nbuilder.SaveFile(\"xlsx\", \"onWorksheetChange.xlsx\");\nbuilder.CloseFile();"; %>
<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>
builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oRange = oWorksheet.GetRange("A1");
oRange.SetValue("1");
Api.attachEvent("onWorksheetChange", function(oRange){
    console.log("onWorksheetChange");
    console.log(oRange.GetAddress());
});
builder.SaveFile("xlsx", "onWorksheetChange.xlsx");
builder.CloseFile();
</pre>

<h2>Resulting document</h2>

<script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>

<div id="editorSpace">
    <div id="placeholder"></div>
</div>

<script type="text/javascript">
    <%
        var ext = "xlsx";

        var documentType = "cell";
    %>

    var config = <%= Config.Serialize(
        new Config
            {
                Document = new Config.DocumentConfig
                    {
                        FileType = ext,
                        Key = "apiwh" + Guid.NewGuid(),
                        Permissions = new Config.DocumentConfig.PermissionsConfig(),
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
                        Plugins = new Config.EditorConfigConfiguration.PluginsConfig()
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

    window.addEventListener("message", function (message) {
        if (message && message.data == "externallistenerReady") {
            document.getElementsByName("frameEditor")[0].contentWindow.postMessage(JSON.stringify({
                guid : "asc.{A8705DEE-7544-4C33-B3D5-168406D92F72}",
                type : "onExternalPluginMessage",
                data : {
                    type: "executeCommand",
                    text: "<%= Regex.Replace(script.Replace("\"", "\\\"").Replace("builder.CreateFile", "").Replace("builder.SaveFile", "").Replace("builder.CloseFile()", ""), "\\r*\\n", "") %>"
                }
            }), "<%= ConfigurationManager.AppSettings["editor_url"] ?? "*" %>");
        }
    }, false);

    window.docEditor = new DocsAPI.DocEditor("placeholder", config);
</script>
