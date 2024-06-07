<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>
<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%= ((DBEntry)Model).Name %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% var section = (DBEntry)Model; %>

    <h1>
       <span class="hdr"><%= section.Name %></span>
    </h1>

    <h4 class="header-gray" id="<%= section.Name %>">new <%= section.Name %>(<%= section.Params != null ? string.Join(", ", section.Params.Select(p => p.Name)) : "" %>)</h4> 

    <span id="dscr" class="dscr">
        <%= section.Description %>
    </span>

    <% if (section.Params != null && section.Params.Any()) { %>
    <h2>Parameters:</h2>
    <table class="table table-classlist">
        <thead>
            <tr class="tablerow">
                <td class="table-classlist-name">Name</td>
                <td>Type</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <% foreach(var p in section.Params) { %>
                <tr class="tablerow">
                    <td><em><%= p.Name %></em></td>
                    <td><%= DocBuilderDocumentation.Instance.ParamTypeToHtml(p) %></td>
                    <td><%= p.Description %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
    <div class="mobile-content"></div>
    <% } %>

    <% if (section.Properties != null && section.Properties.Any()) { %>
    <h2>Properties</h2>
    <table class="table table-classlist">
        <thead>
            <tr class="tablerow">
                <td class="table-classlist-name">Name</td>
                <td>Type</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <% foreach(var p in section.Properties) { %>
                <tr class="tablerow">
                    <td><em><%= p.Name %></em></td>
                    <td><%= p.Type %></td>
                    <td><%= p.Description %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
    <div class="mobile-content"></div>
    <% } %>

    <h2>Methods</h2>
    <table class="table table-classlist">
        <thead>
            <tr class="tablerow">
                <td class="table-classlist-name">Name</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <% foreach (var method in section.Methods) { %>
                <tr class="tablerow">
                    <td><a href="<%= method.Value.Path %>"><%= method.Key %></a></td>
                    <td><%= method.Value.Description %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <% if (section.Events != null && section.Events.Any()) { %>
    <h2>Events</h2>
    <table class="table table-classlist">
        <thead>
            <tr class="tablerow">
                <td class="table-classlist-name">Name</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <% foreach(var ev in section.Events) { %>
                <tr class="tablerow">
                    <td><a href="<%= ev.Value.Path %>"><%= ev.Key %></a></td>
                    <td><%= ev.Value.Description %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
    <div class="mobile-content"></div>
    <% } %>

    <% if (section.Example != null) { %>
        <% if (!string.IsNullOrEmpty(section.Example.Script)) { %>
                <h2>Example</h2>
                <div class="button copy-code">Copy code</div>
<pre><%= section.Example.Script %></pre>

    <h2>Resulting document</h2>

    <script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>

    <div id="editorSpace">
        <div id="placeholder"></div>
    </div>

    <script type="text/javascript">
        <%
            var ext = "docx";
            switch (section.Module)
            {
                case "cell":
                    ext = "xlsx";
                    break;
                case "slide":
                    ext = "pptx";
                    break;
            }

            var documentType = section.Module;
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
                    "function () {" +
                        "<%= Regex.Replace(section.Example.Script.Replace("\\", "\\\\").Replace("\"", "\\\"").Replace("builder.CreateFile", "").Replace("builder.SaveFile", "").Replace("builder.CloseFile()", ""), @"\r\n|\n", "") %>" +
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
