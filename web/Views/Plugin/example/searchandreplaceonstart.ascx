<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Search and replace on start</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Searches for and replaces text in the document when it is reopened.</p>
<p><b>Plugin type:</b> non-visual, system.</p>
<p><b>Supported editors:</b> documents.</p>

<img alt="SearchAndReplaceOnStart" src="<%= Url.Content("~/content/img/plugins/gifs/search-and-replace-on-start.gif") %>" />


<div class="header-gray">Installation</div>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/searchAndReplaceOnStart" target="_blank">GitHub</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>,
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Enter any text into the document (for this example it is <em>ONLYOFFICE</em>).</li>
    <li>In the plugin code enter the replacement text in <b>replaceString</b> parameter.</li>
    <li>Reopen the document.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/searchAndReplaceOnStart" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/searchAndReplaceOnStart</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em> and <em>code.js</em></li>
    <li>Icons</li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name"       : "searchAndReplaceOnStart",
    "guid"       : "asc.{C820F3CC-1248-4CA2-8D0F-D7EFD44DE09C}",
    "baseUrl"    : "",
    "variations" : [
        {
            "description"         : "searchAndReplaceOnStart",
            "url"                 : "index.html",

            "icons"               : ["resources/img/icon.png", "resources/img/icon@2x.png"],
            "isViewer"            : true,
            "EditorsSupport"      : [ "word" ],

            "isSystem"            : true,
            "isVisual"            : false,
            "isModal"             : false,
            "isInsideMode"        : false,

            "initDataType"        : "none",
            "initData"            : "",

            "buttons"             : [],

            "events"              : ["onDocumentContentReady"]
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/searchAndReplaceOnStart/code.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onDocumentContentReady">onDocumentContentReady</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/searchandreplace") %>">executeMethod ("SearchAndReplace")</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
