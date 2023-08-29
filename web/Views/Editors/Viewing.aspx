<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Viewing
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Viewing</span>
    </h1>
    <p class="dscr">The viewing opening mode allows the user to view the document only without modifying its data. In order to enable this mode,
        the <a href="<%= Url.Action("config/editor") %>#mode">editorConfig.mode</a> parameter must be set to <b>view</b>.</p>
    <p>Starting from version 7.2, the <b>live viewer</b> is added to the text document, spreadsheet and presentation editors.
        To apply viewing modes, use the <a href="<%= Url.Action("config/editor") %>#coEditing">editorConfig.coEditing</a> parameter:</p>

    <ol>
        <li>
            <p>If the <em>mode</em> field is <em>fast</em> and the <em>change</em> field is <em>true</em>, then the live viewer is opened by default,
                but you can switch the mode to the common viewer and back without reloading the page.
                To do this, open the <b>File</b> tab, click <b>Advanced Settings...</b> and check/uncheck the <b>Show changes from other users</b> checkbox.
                This mode is enabled by default:</p>
            <pre>
{
    "editorConfig": {
        "coEditing": {
            "mode": "fast",
            "change": true
        },
        "mode": "view"
    },
    ...
}
</pre>
            <img class="screenshot-width-832" alt="Setting" src="<%= Url.Content("~/content/img/editor/show-changes-from-other-users.png") %>" />
            <p>In the live viewer, the cursors of the other users are displayed by configuring the <a href="<%= Url.Action("config/document/permissions") %>#userInfoGroups">document.permissions.userInfoGroups</a> parameter.</p>
            <img class="screenshot-width-832" alt="Live viewer" src="<%= Url.Content("~/content/img/editor/live-viewer.png") %>" />
            <p>The changes are displayed in the same way as in the editing mode.</p>
            <img class="screenshot-width-832" alt="Editor" src="<%= Url.Content("~/content/img/editor/editor.png") %>" />
        </li>
        <li>
            <p>If the <em>mode</em> field is <em>fast</em> and the <em>change</em> field is <em>false</em>, then the live viewer is opened by default, and you cannot switch the mode to the common viewer:</p>
            <pre>
{
    "editorConfig": {
        "coEditing": {
            "mode": "fast",
            "change": false
        }
    }
}      
</pre>
        </li>
        <li>
            <p>If the <em>mode</em> field is <em>strict</em> and the <em>change</em> field is <em>true</em>, then the common viewer is opened by default,
                but you can switch the mode to the live viewer in the <b>Advanced Settings...</b>:</p>
            <pre>
{
    "editorConfig": {
        "coEditing": {
            "mode": "strict",
            "change": true
        },
        "mode": "view"
    },
    ...
}
</pre>
        </li>
        <li>
            <p>If the <em>mode</em> field is <em>strict</em> and the <em>change</em> field is <em>false</em>, then the common viewer is opened by default, and you cannot switch the mode to the live viewer:</p>
            <pre>
{
    "editorConfig": {
        "coEditing": {
            "mode": "strict",
            "change": false
        },
        "mode": "view"
    },
    ...
}
</pre>
            <img class="screenshot-width-832" alt="Viewer" src="<%= Url.Content("~/content/img/editor/viewer.png") %>" />
        </li>
    </ol>

    <p>In the following cases, only the common viewer is used:</p>
    <ul>
        <li>in the <a href="<%= Url.Action("config/editor/embedded") %>">embedded mode</a>;</li>
        <li>for <a href="<%= Url.Action("wopi") %>">WOPI</a>;</li>
        <li>when opening the <em>pdf/djvu/xps</em> formats.</li>
    </ul>
    <note>Please note that the server connections for the live viewer are counted separately from the total number of simultaneous connections
        and limited with the <a href="<%= Url.Action("command/license") %>#license">connections_view</a> parameter in the license. For the open source version, this limit is 20. The live viewer is not available for the older licenses.</note>
    <p>The concept for working with viewing modes in the mobile editors is the same as for the web version.</p>
</asp:Content>
