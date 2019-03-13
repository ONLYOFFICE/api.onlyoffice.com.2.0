﻿<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Plugin installation
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Installing plugins to document editors</span>
    </h1>

    <p class="dscr">Plugins can be added to any editor versions: server and desktop.</p>

    <h2>Adding a plugin to the desktop editors</h2>

    <p>You need to take the plugin folder (it <b>must</b> contain the <a href="<%= Url.Action("config") %>">config.json</a>, <a href="<%= Url.Action("indexhtml") %>">index.html</a> and the <a href="<%= Url.Action("code") %>">pluginCode.js</a> files), archive it and change the file extension to <em>.plugin</em>. After that click the 
        <img alt="Plugin button" src="<%= Url.Content("~/content/img/plugins/plugin-button.png") %>" /> plugin button and select the <b>Manage Plugins</b> option. The plugin manager window will be opened:</p>
    <p><img alt="Plugin manager window" src="<%= Url.Content("~/content/img/plugins/plugin-manager.png") %>" /></p>
    <p>Use the <b>Add plugin button</b> to load your created plugin. It will be added immediately to the opened editors and all the editors you will open afterwards. To delete the selected plugins the 
        <img alt="Plugin manager window" src="<%= Url.Content("~/content/img/plugins/remove-plugin-button.png") %>" /> <b>Remove plugin</b> button is used.</p>


    <h2>Adding a plugin to the server editors</h2>

    <p>There are two ways to add the plugins to <b>ONLYOFFICE Document Server</b> installation:</p>

    <ol>
        <li><p>Put the folder with the plugin code to <b>ONLYOFFICE Document Server</b> folder depending on the operating system:</p>
            <div>For Linux - <em>/var/www/onlyoffice/documentserver/sdkjs-plugins/</em>.</div>
            <div>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\sdkjs-plugins\</em>.</div>
            <p>The plugins will be available to all the users users of <b>ONLYOFFICE Document Server</b>. No service restart is required.</p>

        </li>
        <li>
            <p>Or edit the <a href="<%= Url.Action("config/editor/plugins", "editors") %>">Document Server config</a> to add the following lines:</p>

            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "plugins": {
            "autostart": [
                "asc.{0616AE85-5DBE-4B6B-A0A9-455C4F1503AD}",
                "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}",
                ...
            ],
            "pluginsData": [
                "https://example.com/plugin1/config.json",
                "https://example.com/plugin2/config.json",
                ...
            ]
        },
        ...
    },
    ...
});
</pre>

            <p>Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed and the plugins are placed. See the <a href="<%= Url.Action("howitworks", "editors") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>

            <div class="note">If the plugins placed into the folder and the plugins specified in the config coincide, the latter will be used.</div>

            <p>See the <a href="<%= Url.Action("config/editor/plugins", "editors") %>">Document Server API</a> documentation for more information on where to find the config and what and how can be changed there.</p>
        </li>
    </ol>
    


    <h2>Uninstalling plugins from document editors</h2>

    <p>To remove the installed plugins the following actions need to be done:</p>

    <ul>
        <li>For the desktop editors - to delete the selected plugins use the <img alt="Plugin manager window" src="<%= Url.Content("~/content/img/plugins/remove-plugin-button.png") %>" /> <b>Remove plugin</b> button in the <b>Plugin manager</b>.</li>
        <li>For the server version - remove the plugin folder (or folders) or delete lines added to the <b>Document Server</b> configuration file, the plugins will become unavailable for all portal users at the editors next start.</li>
    </ul>
</asp:Content>
