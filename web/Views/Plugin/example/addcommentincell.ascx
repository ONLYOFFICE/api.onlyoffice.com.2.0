<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Add comment in cell</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Adds comments to a cell of the spreadsheet.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> spreadsheets.</p>

<img alt="AddCommentInCell" src="<%= Url.Content("~/content/img/plugins/gifs/add-comment-in-cell.gif") %>" />


<div class="header-gray">Installation</div>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_add_comment_in_cell" target="_blank">GitHub</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>,
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Select the cell you want to comment on.</li>
    <li>Open the <b>Plugins</b> tab and press <b>Example add comment in cell</b>.</li>
    <li>Enter the comment text in the field and press the <b>Add comment</b> button.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_add_comment_in_cell" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_add_comment_in_cell</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>code.js</em></li>
    <li>Icons</li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name" : "Example add comment",
    "guid" : "asc.{89643394-0F74-4297-9E0B-541A67F1E98C}",

    "variations" : [
        {
            "description" : "Example add comment",
            "url"         : "index.html",

            "icons": [ "resources/light/icon.png", "resources/light/icon@2x.png" ],
            "icons2": [
                {
                    "style" : "light",
                    
                    "100%": {
                        "normal": "resources/light/icon.png"
                    },
                    "125%": {
                        "normal": "resources/light/icon@1.25x.png"
                    },
                    "150%": {
                        "normal": "resources/light/icon@1.5x.png"
                    },
                    "175%": {
                        "normal": "resources/light/icon@1.75x.png"
                    },
                    "200%": {
                        "normal": "resources/light/icon@2x.png"
                    }
                },
                {
                    "style" : "dark",
                    
                    "100%": {
                        "normal": "resources/dark/icon.png"
                    },
                    "125%": {
                        "normal": "resources/dark/icon@1.25x.png"
                    },
                    "150%": {
                        "normal": "resources/dark/icon@1.5x.png"
                    },
                    "175%": {
                        "normal": "resources/dark/icon@1.75x.png"
                    },
                    "200%": {
                        "normal": "resources/dark/icon@2x.png"
                    }
                }
            ],
            "isViewer"        : false,
            "EditorsSupport"  : ["cell"],

            "isVisual"        : true,
            "isModal"         : false,
            "isInsideMode"    : true,

            "initDataType"    : "none",
            "initData"        : "",

            "buttons"         : []
 
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
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
