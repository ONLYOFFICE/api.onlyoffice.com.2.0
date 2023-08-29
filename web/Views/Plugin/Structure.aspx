<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Plugin structure
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Plugin structure</span>
    </h1>

    <p>Each plugin for the server version is a folder with files. To use the plugins with the <a href="<%= Url.Action("plugins", "desktop") %>">desktop version</a>, you need to pack these files into a single zip archive file (see the <a href="<%= Url.Action("installation/") %>">Adding plugins</a> section for more information on how to add plugins to the editors).</p>

    <p>The plugin folder must contain three files required for the plugin to work:</p>

    <ul>
        <li>
            <a href="<%= Url.Action("config") %>">config.json</a> - plugin configuration file containing the information about the main plugin data needed to register the plugin in the editors.
        </li>
        <li>
            <a href="<%= Url.Action("indexhtml") %>">index.html</a> - plugin entry point, connecting the <em>config.json</em> and <em>plugin.js</em> (the base file needed for work with plugins) files.
        </li>
        <li>
            <a href="<%= Url.Action("code") %>">plugin code (.js file)</a> - the plugin code file itself containing the JavaScript code of the plugin you want to connect to the editors.
        </li>
    </ul>

    <p>The plugin folder can also contain other files such as plugin icons, styles, translations, readme, third-party services, etc. More information can be found <a href="<%= Url.Action("gettingstarted") %>">here</a>.</p>

    </br >
    <img class="screenshot-width-832" alt="Structure" src="<%= Url.Content("~/content/img/plugins/plugins-structure.png") %>" />
</asp:Content>
