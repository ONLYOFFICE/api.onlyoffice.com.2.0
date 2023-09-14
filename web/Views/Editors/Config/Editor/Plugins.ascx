<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/editor") %>"></a>
    <span class="hdr">Plugins</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">The plugins section allows to connect the special add-ons to your Document Server installation which will help you add additional features to document editors.</p>

<div class="header-gray">Parameters</div>
<div id="mobile-content"></div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="autostart" class="copy-link">autostart</td>
            <td>Defines the array of the identifiers (as entered in <a href="<%= Url.Action("config", "plugin") %>#guid">config.json</a>) for the plugins, which will automatically start when the editor opens, and the order the plugins will run one-by-one.</td>
            <td>array of string</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td id="pluginsData" class="copy-link">pluginsData</td>
            <td>Defines the array of absolute URLs to the plugin configuration files (<a href="<%= Url.Action("config", "plugin") %>">config.json</a>).</td>
            <td>array of string</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td id="url" class="copy-link">url</td>
            <td>
                Defines the absolute URL to the directory where the plugins are stored.
                Deprecated since version 4.3, please use the absolute URLs in <a href="#pluginsData">pluginsData</a> field.
            </td>
            <td>string</td>
            <td>"https://example.com/plugins/"</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/plugins.png") %>" alt="" />
            </td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
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
<p>
    Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed and the plugins are placed.
    See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
</p>

<p>
    If you have any further questions, please contact us at
    <a href="mailto:integration@onlyoffice.com" onclick="if(window.ga){window.ga('send','event','mailto');}return true;">integration@onlyoffice.com</a>.
</p>

