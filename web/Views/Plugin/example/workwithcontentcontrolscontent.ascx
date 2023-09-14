<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Work with content controls content</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Inserts the content of one content control into another.</p>
<p><b>Plugin type:</b> non-visual, non-system.</p>
<p><b>Supported editors:</b> documents.</p>

<img alt="WorkWithContentControlsContent" src="<%= Url.Content("~/content/img/plugins/gifs/work-with-content-controls-content.gif") %>" />


<div class="header-gray">Installation</div>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_work_with_content_controls_content" target="_blank">GitHub</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>,
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Add two content controls to the document. One of them should have tag 11 and the other - tag 14 (these tags are used in the plugin code as an example but you can change them).</li>
    <li>Open the <b>Plugins</b> tab and press <b>Example  work with content controls content</b>.</li>
    <li>The content from the content control with tag 11 will be inserted into the content control with tag 14.
</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_work_with_content_controls_content" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_work_with_content_controls_content</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>code.js</em></li>
    <li>Icons</li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name" : "Example work with content controls content",
    "guid" : "asc.{C9945AC2-8275-4F9B-92E4-CA1104D7305B}",

    "variations" : [
        {
            "description" : "Example work with content controls content",
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
            "EditorsSupport"  : ["word"],

            "isVisual"        : false,

            "initDataType"    : "text",
            "initData"        : "",

            "buttons"         : [],

            "initOnSelectionChanged" : true
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul class="columns-2">
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/text/getallcontentcontrols") %>">executeMethod ("GetAllContentControls")</a></li>
    <li><a href="<%= Url.Action("executemethod/common/pastetext") %>">executeMethod ("PasteText")</a></li>
    <li><a href="<%= Url.Action("executemethod/text/selectcontentcontrol") %>">executeMethod ("SelectContentControl")</a></li>
    <li><a href="<%= Url.Action("scope") %>">Asc.scope object</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
