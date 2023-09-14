<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Chess</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Inserts a Chess Board object into the document editor. The object makes it possible to edit and save the chess position in the <em>FEN</em> format.</p>
<p><b>Plugin type:</b> visual, OLE object, non-system.</p>
<p><b>Supported editors:</b> documents, spreadsheets, presentations.</p>

<img alt="Chess" src="<%= Url.Content("~/content/img/plugins/gifs/chess.gif") %>" />


<div class="header-gray">Installation</div>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/chess" target="_blank">GitHub</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>,
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Open the <b>Plugins</b> tab and press <b>Chess</b>.</li>
    <li>A chessboard window will appear on the screen and you can play chess.</li>
    <li>To interrupt the game, press the <b>Ok</b> button. The game preview in form of an image will appear in your document with all the changes saved. Click it to continue the game. </li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/chess" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/chess</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>chess.js</em></li>
    <li>Icons</li>
    <li><em>index_about.html</em> for the plugin <b>About</b> window</li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name" : "chess(fen)",
    "guid" : "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}",

    "variations" : [
        {
            "description" : "chess",
            "url"         : "index.html",

            "icons"           : ["resources/icon.png", "resources/icon@2x.png"],
            "isViewer"        : true,
            "EditorsSupport"  : ["word", "cell", "slide"],

            "isVisual"        : true,
            "isModal"         : true,
            "isInsideMode"    : false,

            "initDataType"    : "ole",
            "initData"        : "",

            "isUpdateOleOnResize" : true,

            "buttons"         : [ { "text": "Ok", "primary": true },
                                { "text": "Cancel", "primary": false } ]
        },
        {
            "description" : "About",
            "url"         : "index_about.html",

            "icons"           : ["resources/icon.png", "resources/icon@2x.png"],
            "isViewer"        : true,
            "EditorsSupport"  : ["word", "cell", "slide"],

            "isVisual"        : true,
            "isModal"         : true,
            "isInsideMode"    : false,

            "initDataType"    : "none",
            "initData"        : "",

            "buttons"         : [ { "text": "Ok", "primary": true } ],

            "size" : [392, 147]
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul class="columns-2">
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("events/onexternalmouseup") %>">onExternalMouseUp</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/common/addoleobject") %>">executeMethod ("AddOleObject")</a></li>
    <li><a href="<%= Url.Action("executemethod/common/editoleobject") %>">executeMethod ("EditOleObject")</a></li>
    <li><a href="<%= Url.Action("info") %>#data">info.data</a></li>
    <li><a href="<%= Url.Action("info") %>#guid">info.guid</a></li>
    <li><a href="<%= Url.Action("info") %>#height">info.height</a></li>
    <li><a href="<%= Url.Action("info") %>#imgSrc">info.imgSrc</a></li>
    <li><a href="<%= Url.Action("info") %>#mmToPx">info.mmToPx</a></li>
    <li><a href="<%= Url.Action("info") %>#objectId">info.objectId</a></li>
    <li><a href="<%= Url.Action("info") %>#resize">info.resize</a></li>
    <li><a href="<%= Url.Action("info") %>#width">info.width</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
