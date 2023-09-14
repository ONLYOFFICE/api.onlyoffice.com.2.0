<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>
<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Events
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% var section = (DBEntry)Model; %>
    <h1>
        <span class="hdr">Events</span>
    </h1>

    <p class="dscr">The events section allows to change all the functions pertaining to the events.</p>
    <note>Please note that to use events in your plugin code, you must subscribe to them first by specifying each event in the <a href="<%= Url.Action("config") %>#events">events</a> parameter of the plugin config.</note>

    <h2>Events and their description:</h2>
    <table class="table table-classlist">
        <thead>
            <tr class="tablerow">
                <td class="table-classlist-name">Name</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <% foreach (var evt in section.Events) { %>
                <tr class="tablerow">
                    <td><a href="<%= Url.Action(string.Format("events/{0}", evt.Key.ToLower())) %>"><%= evt.Key %></a></td>
                    <td><%= evt.Value.Description %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
    <div class="mobile-content"></div>



</asp:Content>
