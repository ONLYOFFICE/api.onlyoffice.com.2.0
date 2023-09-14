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
            &rarr; { <%= DocPluginsDocumentation.Instance.ReturnTypeToHtml(method) %> }
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
                            <em><%= DocPluginsDocumentation.Instance.ParamTypeToHtml(p) %></em>
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
            <%= DocPluginsDocumentation.Instance.ReturnTypeToHtml(method) %>
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
        <% } %>
    <% } %>

</asp:Content>
