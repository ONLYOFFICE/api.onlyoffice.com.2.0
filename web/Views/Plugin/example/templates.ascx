<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Templates</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Inserts document templates generated by the Document Builder script.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents.</p>

<img alt="Templates" src="<%= Url.Content("~/content/img/plugins/gifs/templates.gif") %>" />


<div class="header-gray">Installation</div>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/templates" target="_blank">GitHub</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>,
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Find the plugin on the <b>Plugins</b> tab.</li>
    <li>Choose any document template you want to set and click it.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/templates" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/templates</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>templates.js</em></li>
    <li>Icons</li>
    <li>The <em>templates</em> folder contains document templates.</li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name" : "Document Templates",
    "guid" : "asc.{94DF0B57-299D-4F68-AF6F-9A6BB53F3031}",

    "variations" : [
        {
            "description" : "templates",
            "url"         : "index.html",

            "icons"           : ["resources/img/icon.png", "resources/img/icon@2x.png"],
            "isViewer"        : false,
            "EditorsSupport"  : ["word"],

            "isVisual"        : true,
            "isModal"         : false,
            "isInsideMode"    : true,

            "initDataType"    : "none",
            "initData"        : "",

            "buttons"        : [ ]
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul>
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("events/onExternalMouseUp") %>">onExternalMouseUp</a></li>
    <li><a href="<%= Url.Action("callmodule") %>">callModule</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("info") %>#recalculate">info.recalculate</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
