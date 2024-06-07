<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>
<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%= ((DBEvent)Model).Name %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% var ev = (DBEvent)Model; %>

    <h1>
        <a href="<%= Request.Path.Substring(0, Request.Path.LastIndexOf('/')) %>" class="up"></a>
       <span class="hdr"><%= ev.Name %></span>
    </h1>            

    <h4 class="header-gray" id="<%= ev.Name %>">
        <%= ev.Name %>
    </h4>

    <% if (ev.See != null) { %>
        <div class="details">
            <span><%= ev.See %></span>
        </div>
    <% } %>

    <span id="dscr" class="dscr">
        <%= ev.Description %>
    </span>

    <h2>Parameters:</h2>
    <% if (ev.Params != null && ev.Params.Any()) { %>
    <div id="eventParams">
    <% var hasOptional = ev.Params.Any(m => m.Optional); %>
        <table class="table">
            <thead>
                <tr class="tablerow">
                    <td>Name</td>
                    <td>Type</td>
                    <td>Description</td>
                </tr>
            </thead>
            <tbody>
                <% foreach(var p in ev.Params) { %>
                    <tr class="tablerow">
                        <td><em><%= p.Name %></em></td>
                        <td>
                            <em><%= DocBuilderDocumentation.Instance.ParamTypeToHtml(p) %></em>
                        </td>
                        <td><%= p.Description %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </div>
    <% } else { %>
    <div id="eventParams">
        <p>This event doesn't have any parameters.</p>
    </div>
    <% } %>

    <% if (ev.Example != null) { %>
        <% if (!string.IsNullOrEmpty(ev.Example.Script)) { %>
            <h2>Example</h2>
            <div class="button copy-code">Copy code</div>
<pre><%= ev.Example.Script %></pre>

    <h2>Resulting document</h2>

    <script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>

    <div id="editorSpace">
        <div id="placeholder"></div>
    </div>

    <script type="text/javascript">
        <%
            var ext = "docx";
            switch (ev.Module)
            {
                case "cell":
                    ext = "xlsx";
                    break;
                case "slide":
                    ext = "pptx";
                    break;
            }

            var documentType = ev.Module;
            if (documentType == "form") documentType = "word";
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
                                    IntegrationMode = "embed",
                                    ToolbarHideFileName = true,
                                    ToolbarNoTabs = true
                                }
                        },
                    Height = "550px",
                    Width = "100%"
                }) %>;

        var onDocumentReady = function () {
            window.connector = docEditor.createConnector();

            (new Function(
                "connector.callCommand(" +
                    "function() {" +
                        "<%= Regex.Replace(ev.Example.Script.Replace("\\", "\\\\").Replace("\"", "\\\"").Replace("builder.CreateFile", "").Replace("builder.SaveFile", "").Replace("builder.CloseFile()", ""), "\\r*\\n", "") %>" +
                    "}" +
                ");"
            ))();
        };

        config.events = {
            onDocumentReady: onDocumentReady,
        };

        window.docEditor = new DocsAPI.DocEditor("placeholder", config);
    </script>
        <% } %>
    <% } %>

</asp:Content>
