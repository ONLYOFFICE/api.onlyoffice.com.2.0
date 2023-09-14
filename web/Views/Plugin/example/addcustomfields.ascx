<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Add custom fields</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Inserts custom fields into the document.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents.</p>

<img alt="AddCustomFields" src="<%= Url.Content("~/content/img/plugins/gifs/add-custom-fields.gif") %>" />


<div class="header-gray">Installation</div>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_customfields_add" target="_blank">GitHub</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>,
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Open the <b>Plugins</b> tab and press <b>Example add custom fields</b>.</li>
    <li>To add a <b>simple field</b>, type your question and its label in the necessary fields and press the <b>Add simple field</b> button</li>
    <li>To add a <b>drop down field</b>, type your question and its label in the necessary fields and add answer options. To add an answer option, type it in the <b>Type your item</b> field and press the <b>Add</b> button. Repeat it if you need more options. To remove any answer option, select it in the combo box and press the <b>Remove</b> button. When the field is ready, press the <b>Add drop down field</b> button.</li>
    <li>The field will be added in the current text cursor position.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_customfields_add" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_customfields_add</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>code.js</em></li>
    <li>Icons</li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name" : "Example add custom fields",
    "guid" : "asc.{4E2B5030-E1BE-41FA-BEE3-7E9BE7B5BFCF}",

    "variations" : [
        {
            "description" : "Example add custom fields",
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

            "buttons"         : []
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul>
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("events/onMethodReturn") %>">onMethodReturn</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/text/addcontentcontrol") %>">executeMethod ("AddContentControl")</a></li>
    <li><a href="<%= Url.Action("executemethod/text/insertandreplacecontentcontrols") %>">executeMethod ("InsertAndReplaceContentControls")</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
