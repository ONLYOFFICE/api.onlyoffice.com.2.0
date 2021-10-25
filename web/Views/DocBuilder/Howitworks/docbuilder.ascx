<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Document builder</span>
</h1>

<h2>Generate a document from the script below, edit it or upload your own script</h2>
<p>Use the script in the textarea below as is to generate the document or you edit it in the textarea window. Or, in case you have a script of your own, use the button under the textarea to upload it.</p>

<textarea id="builderScript" name="builderScript" class="builder-code">
builder.CreateFile("docx");
oDocument = Api.GetDocument();
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("ONLYOFFICE Document Builder");
Api.AddComment(oParagraph, "ONLYOFFICE for developers", "Jane");
builder.SaveFile("docx", "AddComment.docx");
builder.CloseFile();
</textarea>

<p>
    <button id="startButton" class="button">Start script</button>
    <a id="builderFileLink" class="button">Upload your own script</a>
    <input type="file" id="builderFile" />
</p>
<h2>Resulting document</h2>

<div id="editorSpace">
    <div id="placeholder"></div>
</div>

<h2>Want to learn how it works?</h2>
<p><a href="<%= Url.Action("gettingstarted") %>">Get started here</a> and find out the main principles of <b>ONLYOFFICE Document Builder</b> work, or read the <a href="<%= Url.Action("integrationapi") %>">Integration API</a>, <a href="<%= Url.Action("textdocumentapi") %>">Text document API</a>, <a href="<%= Url.Action("spreadsheetapi") %>">Spreadsheet API</a> or <a href="<%= Url.Action("presentationapi") %>">Presentation API</a> articles to find out how to automate your document creation using <b>ONLYOFFICE Document Builder</b>.</p>

<h2>Get help</h2>

<p>If you have any questions or feature requests about ONLYOFFICE Document Builder, please visit <a href="https://github.com/ONLYOFFICE/DocumentBuilder/issues" target="_blank">GitHub</a>.</p>
<p>You can also ask our developers on <a href="https://forum.onlyoffice.com/c/document-builder/37" target="_blank">ONLYOFFICE forum</a> (registration required).</p>

<script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>
<script type="text/javascript">
            var config = <%= Config.Serialize(
            new Config
                {
                    Document = new Config.DocumentConfig
                        {
                            FileType = "docx",
                            Key = "apiwh" + Guid.NewGuid(),
                            Title = "Example Title.docx",
                            Url = ConfigurationManager.AppSettings["storage_demo_url"] + "new.docx" 
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
                
        let postScript = function (newDoc) {
            let script = (newDoc ? "" : "Api.GetDocument().RemoveAllElements();") + document.getElementById("builderScript").value.replaceAll("\\", "").replaceAll("builder.CreateFile", "").replaceAll("\n", "");
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
                  postScript(true);             
                  document.getElementById("startButton").addEventListener("click", function (event) {
                      postScript(false);
                  }, false);                  
              }
        }, false);

        window.docEditor = new DocsAPI.DocEditor("placeholder", config);
</script>