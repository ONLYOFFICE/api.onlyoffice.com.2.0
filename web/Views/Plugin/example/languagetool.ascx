<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Language tool</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Connects the <a href="https://languagetool.org/" target="_blank">LanguageTool</a> assistant to check the text for grammar, style and spell errors.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents, spreadsheets, presentations.</p>
<p><b>Analogue:</b> <a href="https://github.com/ONLYOFFICE/plugin-glavred" target="_blank">Glavred</a>, <a href="https://github.com/ONLYOFFICE/plugin-grammalecte" target="_blank">Grammalecte</a>.</p>

<img alt="LanguageTool" src="<%= Url.Content("~/content/img/plugins/gifs/language-tool.gif") %>" />


<div class="header-gray">Installation</div>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/plugin-languagetool/tree/master" target="_blank">GitHub</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>,
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Open the <b>Plugins</b> tab and press <b>Languagetool</b>.</li>
    <li>Select the necessary text or write it in the plugin window.</li>
    <li>The language is detected automatically, but you can also change it manually.</li>
    <li>Press the <b>Check</b> button.</li>
    <li>You will receive information about the stylistic and grammatical mistakes and tips for correcting them.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-languagetool/tree/master" target="_blank">https://github.com/ONLYOFFICE/plugin-languagetool/tree/master</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em> and <em>code.js</em></li>
    <li>Icons</li>
    <li><em>index_about.html</em> for the plugin <b>About</b> window</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish and French.</li>
    <li><em>plugin_style.css</em> is used to adjust the plugin style.</li>
    <li>Third-party services:
        <ul>
            <li><b>jQuery</b> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development (<a href="https://jquery.com" target="_blank">https://jquery.com</a>). License: <a href="https://github.com/ONLYOFFICE/plugin-languagetool/blob/develop/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><b>Select2</b> gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options (<a href="https://select2.org/" target="_blank">https://select2.org/</a>). License: <a href="https://github.com/ONLYOFFICE/plugin-languagetool/blob/develop/licenses/Select2.license" target="_blank">MIT</a>.</li>
            <li><b>Languagetool</b> is a multilingual grammar and style checker (<a href="https://languagetool.org/" target="_blank">https://languagetool.org/</a>). License: <a href="https://github.com/ONLYOFFICE/plugin-languagetool/blob/develop/licenses/Languagetool's.license" target="_blank">GNU LESSER GENERAL PUBLIC LICENSE</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name": "LanguageTool",
    "guid": "asc.{7CDB02C9-A0BF-4B56-9A1A-71C860B8498F}",
    "version": "1.0",

    "variations": [
        {
            "description": "LanguageTool",
            "url": "index.html",

            "icons": [ "resources/img/icon.png", "resources/img/icon@2x.png", "resources/img/icon.png", "resources/img/icon@2x.png" ],
            "isViewer": true,
            "EditorsSupport": [ "word", "cell", "slide" ],

            "isVisual": true,
            "isModal": true,
            "isInsideMode": true,

            "initDataType": "text",
            "initData": "",

            "isUpdateOleOnResize": false,

            "buttons": [],

            "initOnSelectionChanged": true
        },
        {
            "description": "About",
            "descriptionLocale": {
                "ru": "&#1057;&#1087;&#1088;&#1072;&#1074;&#1082;&#1072;",
                "fr": "A&#768; propos",
                "es": "Sobre programa",
                "de": "&#220;ber"
            },
            "url": "index_about.html",

            "icons": [ "resources/img/icon.png", "resources/img/icon@2x.png", "resources/img/icon.png", "resources/img/icon@2x.png" ],
            "isViewer": false,
            "EditorsSupport": [ "word", "cell", "slide" ],

            "isVisual": true,
            "isModal": true,
            "isInsideMode": false,

            "initDataType": "none",
            "initData": "",

            "isUpdateOleOnResize": false,

            "buttons": [
                {
                    "text": "Ok",
                    "primary": true
                }
            ],

            "size": [ 400, 50 ]
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/plugin-languagetool/blob/develop/scripts/langTool.js" target="_blank">here</a>.</p>
<ul class="columns-2">
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onExternalMouseUp">onExternalMouseUp</a></li>
    <li><a href="<%= Url.Action("events") %>#onTranslate">onTranslate</a></li>
    <li><a href="<%= Url.Action("callcommand") %>">callCommand</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/pastetext") %>">executeMethod ("PasteText")</a></li>
    <li><a href="<%= Url.Action("scope") %>">Asc.scope object</a></li>
    <li><a href="<%= Url.Action("info") %>#recalculate">info.recalculate</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
