<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>
<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Simple types
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% var globals = (SortedDictionary<string, DBGlobal>)Model; %>
    <h1>
        <span class="hdr">Simple types</span>
    </h1>

    <% foreach(var type in globals) { %>
        <div class="global-type-definitions">
            <span class="anchor-position" id="<%= type.Key %>">&nbsp;</span>
            <h4 class="header-gray copy-link" id="<%= type.Key %>"><%= type.Key %></h4>
            <p><%= type.Value.Description %></p>

            <div class="global-list">
            <h5>Type:</h5>
            <ul>
                <li>
                    <%= DocBuilderDocumentation.Instance.TypesToHtml(type.Value.Types, type.Value.Module) %>
                </li>
            </ul>
                <% if (type.Value.Properties != null && type.Value.Properties.Any()) { %>
                    <h5>Properties:</h5>
                    <table class="table table-classlist">
                        <thead>
                            <tr class="tablerow">
                                <td class="table-classlist-name">Name</td>
                                <td>Type</td>
                                <td>Description</td>
                            </tr>
                        </thead>
                        <tbody>
                            <% foreach(var p in type.Value.Properties) { %>
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
            </div>

            <% if (!string.IsNullOrEmpty(type.Value.Script)) { %>
                <h2>Example</h2>
                <div class="button copy-code">Copy code</div>
<pre><%= type.Value.Script %></pre>
            <% } %>
        </div>
    <% } %>
</asp:Content>
