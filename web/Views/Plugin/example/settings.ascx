<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Settings</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Protects a document using a watermark.</p>
<p><b>Plugin type:</b> non-visual, system.</p>
<p><b>Supported editors:</b> documents, spreadsheets, presentations.</p>

<img alt="Settings" src="<%= Url.Content("~/content/img/plugins/gifs/settings.gif") %>" />


<div class="header-gray">Installation</div>
<p>Download this plugin from  <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/settings" target="_blank">GitHub</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>,
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>After adding the plugin to the editor, just reopen the document. A watermark will be displayed.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/settings" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/settings</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>code.js</em></li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name"       : "settings",
    "guid"       : "asc.{CF3A000F-C6B4-451D-AC0B-F3DDAB1880D2}",
    "baseUrl"    : "",
    "variations" : [
        {
            "description"         : "settings",
            "url"                 : "index.html",

            "isViewer"            : true,
            "EditorsSupport"      : [ "word", "cell", "slide" ],

            "isSystem"            : true,
            "isVisual"            : false,

            "initDataType"        : "none",
            "initData"            : "",

            "buttons"             : []
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul>
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executeMethod/common/setproperties") %>">executeMethod ("SetProperties")</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
