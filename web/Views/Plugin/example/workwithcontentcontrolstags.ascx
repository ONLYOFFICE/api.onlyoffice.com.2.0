<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Work with content controls tags</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Gets the list of content controls tags.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents.</p>

<img alt="WorkWithContentControlsTags" src="<%= Url.Content("~/content/img/plugins/gifs/work-with-content-controls-tags.gif") %>" />


<div class="header-gray">Installation</div>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_work_with_content_controls_tags" target="_blank">GitHub</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>,
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Add some content controls to the document. Set any tags for them</li>
    <li>Open the <b>Plugins</b> tab and press <b>Example work with content controls tags</b>.</li>
    <li>In the plugin window, you can see all the content controls tags. Press the <b>Refresh list</b> button to update the list.</li>
    <li>Press the <b>Test paste for document</b> button to paste text into the document (where the text cursor is located).</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_work_with_content_controls_tags" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/develop/example_work_with_content_controls_tags</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>code.js</em></li>
    <li>Icons</li>
    <li>Third-party service:
        <ul>
            <li><a href="https://jquery.com" target="_blank">jQuery</a> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/example_work_with_content_controls_tags/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name" : "Example work with content controls tags",
    "guid" : "asc.{C36DDFB5-08F0-4A68-B829-5FB1F7D49331}",

    "variations" : [
        {
            "description" : "Example work with content controls tags",
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

            "isVisual"        : true,
            "isModal"         : false,
            "isInsideMode"    : true,

            "initDataType"    : "none",
            "initData"        : "",

            "buttons"         : [],

            "initOnSelectionChanged" : false
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul class="columns-2">
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("events/onMethodReturn") %>">onMethodReturn</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/text/getallcontentcontrols") %>">executeMethod ("GetAllContentControls")</a></li>
    <li><a href="<%= Url.Action("executemethod/common/pastetext") %>">executeMethod ("PasteText")</a></li>
    <li><a href="<%= Url.Action("executemethod/text/selectcontentcontrol") %>">executeMethod ("SelectContentControl")</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
