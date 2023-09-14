<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Load custom fields</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Loads custom fields from the document.</p>
<p class="note">
The fields should be already added to the document with the <a href="<%= Url.Action("example/addcustomfields") %>">Example add custom fields</a> plugin.
</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents.</p>

<img alt="LoadCustomFields" src="<%= Url.Content("~/content/img/plugins/gifs/load-custom-fields.gif") %>" />


<div class="header-gray">Installation</div>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_customfields_load" target="_blank">GitHub</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>,
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Open the <b>Plugins</b> tab and press <b>Example load custom fields</b>.</li>
    <li>To answer a <b>simple question</b>, type your answer in the <b>type here...</b> field.</li>
    <li>To answer a <b>question with drop down variants</b>, select one option.</li>
    <li>Press the <b>Next</b> button to go to the next question or the <b>Back</b> button to go back to the previous one.</li>
    <li>When all the questions are answered, the plugin will be automatically closed. Your answers will appear in the document.</li>
</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_customfields_load" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_customfields_load</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>code.js</em></li>
    <li>Icons</li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name" : "Example loading custom fields",
    "guid" : "asc.{E5A81B17-C871-4C4B-A90A-62D3A7EC0751}",

    "variations" : [
        {
            "description" : "Example loading custom fields",
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
            "isViewer"        : true,
            "EditorsSupport"  : ["word"],

            "isVisual"        : true,
            "isModal"         : true,
            "isInsideMode"    : false,

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
    <li><a href="<%= Url.Action("executemethod/text/getallcontentcontrols") %>">executeMethod ("GetAllContentControls")</a></li>
    <li><a href="<%= Url.Action("executemethod/text/insertandreplacecontentcontrols") %>">executeMethod ("InsertAndReplaceContentControls")</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
