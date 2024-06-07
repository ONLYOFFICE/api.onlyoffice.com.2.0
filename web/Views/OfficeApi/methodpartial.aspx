<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>
<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%= ((DBMethod)Model).Name %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% var method = (DBMethod)Model; %>

    <h1>
        <a href="<%= Request.Path.Substring(0, Request.Path.LastIndexOf('/')) %>" class="up"></a>
       <span class="hdr"><%= method.Name %></span>
    </h1>            

    <h4 class="header-gray" id="<%= method.Name %>">
        <%= method.Name %>(<%= method.Params != null ? string.Join(", ", method.Params.Select(p => p.Optional ? string.Format("[{0}]", p.Name) : p.Name)) : "" %>)
        <% if (method.Returns != null && method.Returns.Any())
           { %>
            &rarr; { <%= DocBuilderDocumentation.Instance.ReturnTypeToHtml(method) %> }
        <% } %>
    </h4>

    <% if (method.See != null) { %>
        <div class="details">
            <span><%= method.See %></span>
        </div>
    <% } %>

    <% if (method.Inherits != null) { %>
        <div class="details">
            <span><%= method.Inherits %></span>
        </div>
    <% } %>

    <span id="dscr" class="dscr">
        <%= method.Description %>
    </span>

    <h2>Parameters:</h2>
    <% if (method.Params != null && method.Params.Any()) { %>
    <div id="methodParams">
    <% var hasOptional = method.Params.Any(m => m.Optional); %>
        <table class="table">
            <thead>
                <tr class="tablerow">
                    <td>Name</td>
                    <td>Type</td>
                    <% if (hasOptional) { %>
                        <td>Default</td>
                    <% } %>
                    <td>Description</td>
                </tr>
            </thead>
            <tbody>
                <% foreach(var p in method.Params) { %>
                    <tr class="tablerow">
                        <td><em><%= p.Name %></em></td>
                        <td>
                            <em><%= DocBuilderDocumentation.Instance.ParamTypeToHtml(p) %></em>
                        </td>
                        <% if (hasOptional) { %>
                            <td><%= p.DefaultValue == null ? (p.Optional ? "null" : "") : p.DefaultValue %></td>
                        <% } %>
                        <td><%= p.Description %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </div>
    <% } else { %>
    <div id="methodParams">
        <p>This method doesn't have any parameters.</p>
    </div>
    <% } %>


    <h2>Returns:</h2>
    <% if (method.Returns != null && method.Returns.Any()) { %>
    <dl class="param-type">
        <dt>Type</dt>
        <dd>
            <%= DocBuilderDocumentation.Instance.ReturnTypeToHtml(method) %>
        </dd>
    </dl>
    <% } else { %>
    <dl class="param-type">
        <dd>
            This method doesn't return any data.
        </dd>
    </dl>
    <% } %>

    <% if (method.Example != null) { %>
        <% if (!string.IsNullOrEmpty(method.Example.Script)) { %>
                <h2>Example</h2>
                <div class="button copy-code">Copy code</div>
<pre><%= method.Example.Script %></pre>

    <h2>Resulting document</h2>

    <script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>

    <div id="editorSpace">
        <div id="placeholder"></div>
    </div>

    <script type="text/javascript">
        <%
            var ext = "docx";
            switch (method.Module)
            {
                case "cell":
                    ext = "xlsx";
                    break;
                case "slide":
                    ext = "pptx";
                    break;
            }

            var documentType = method.Module;
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
                        "<%= Regex.Replace(method.Example.Script.Replace("\\", "\\\\").Replace("\"", "\\\"").Replace("builder.CreateFile", "").Replace("builder.SaveFile", "").Replace("builder.CloseFile()", ""), "\\r*\\n", "") %>" +
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
