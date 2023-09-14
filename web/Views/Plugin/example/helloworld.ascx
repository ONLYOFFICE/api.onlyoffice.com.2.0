<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Hello World</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Inserts the <em>Hello world!</em> phrase when the user presses the button.</p>
<p><b>Plugin type:</b> non-visual, non-system.</p>
<p><b>Supported editors:</b> documents.</p>

<img alt="HelloWorld" src="<%= Url.Content("~/content/img/plugins/gifs/hello-world.gif") %>" />


<div class="header-gray">Installation</div>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/helloworld" target="_blank">GitHub</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>,
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Find the plugin on the <b>Plugins</b> tab.</li>
    <li>Click the <b>hello world</b> button.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/helloworld" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/helloworld</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>helloworld.js</em></li>
    <li>Icons</li>
    <li><em>index_about.html</em> for the plugin <b>About</b> window</li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name"       : "hello world",
    "guid"       : "asc.{0616AE85-5DBE-4B6B-A0A9-455C4F1503AD}",
    "baseUrl"    : "",
    "variations" : [
        {
            "description"         : "hello world",
            "url"                 : "index.html",

            "icons"               : ["resources/img/icon.png", "resources/img/icon@2x.png"],
            "isViewer"            : false,
            "EditorsSupport"      : ["word"],

            "isVisual"            : false,

            "initDataType"        : "none",
            "initData"            : "",

            "buttons"             : []
        },
        {
            "description"         : "About",
            "url"                 : "index_about.html",

            "icons"               : ["resources/img/icon.png", "resources/img/icon@2x.png"],
            "isViewer"            : false,
            "EditorsSupport"      : ["word"],

            "isVisual"            : true,
            "isModal"             : true,
            "isInsideMode"        : false,

            "initDataType"        : "none",
            "initData"            : "",

            "buttons"         : [
                {
                    "text": "Ok",
                    "primary": true
                }
            ],

            "size" : [392, 147]
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul>
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("callcommand") %>">callCommand</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("scope") %>">Asc.scope object</a></li>
    <li><a href="<%= Url.Action("info") %>#recalculate">info.recalculate</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
