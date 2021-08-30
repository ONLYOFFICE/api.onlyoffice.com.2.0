<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">CBR</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Connects <a href="https://fixer.io/" target="_blank">Fixer API</a> for inserting the current and historical foreign exchange (forex) rates into the document.</p>
<p><b>Plugin type:</b> non-visual, non-system.</p>
<p><b>Supported editors:</b> spreadsheets.</p>

<img alt="CBR" src="<%= Url.Content("~/content/img/plugins/gifs/cbr.gif") %>" />


<div class="header-gray">Installation</div>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/cbr" target="_blank">GitHub</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>,
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Select the cell.</li>
    <li>Open the <b>Plugins</b> tab and press <b>cbr</b>.</li>
    <li>The current and historical exchange rates will be inserted below, starting from the selected cell.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/cbr" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/cbr</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em> and <em>code.js</em></li>
    <li>Icons</li>
    <li>Third-party services:
        <ul>
            <li><b>jQuery</b> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development (<a href="https://jquery.com" target="_blank">https://jquery.com</a>). License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/develop/cbr/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><b>jQuery UI</b> - a curated set of user interface interactions, effects, widgets, and themes built on top of the jQuery JavaScript Library. Whether you're building highly interactive web applications or you just need to add a date picker to a form control, jQuery UI is the perfect choice (<a href="https://jqueryui.com" target="_blank">https://jqueryui.com</a>). License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/develop/cbr/licenses/jQuery.license" target="_blank">MIT</a>.</li>
            <li><b>Fixer</b> is a free API for current and historical foreign exchange rates published by the European Central Bank (<a href="https://fixer.io/" target="_blank">https://fixer.io/</a>). License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/develop/cbr/licenses/Fixer.license" target="_blank">MIT License</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name" : "cbr",
    "guid" : "asc.{5F9D4EB4-AF61-46EF-AE25-46C96E75E1DD}",

    "variations" : [
        {
            "description" : "cbr",
            "url"         : "index.html",

            "icons"           : ["resources/img/icon.png", "resources/img/icon@2x.png"],

            "isViewer"        : false,
            "EditorsSupport"  : ["cell"],

            "isVisual"        : false,
            "isModal"         : false,
            "isInsideMode"    : false,

            "initDataType"    : "none",
            "initData"        : "",

            "isUpdateOleOnResize" : false,

            "buttons" : []
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/cbr/cbr.js" target="_blank">here</a>.</p>
<ul>
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("info/recalculate") %>">info.recalculate</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
