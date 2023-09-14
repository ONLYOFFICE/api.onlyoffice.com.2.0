<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Translator</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Connects the <a href="https://cloud.google.com/translate?hl=ru" target="_blank">Google Translate API</a> for translating the selected text into other languages.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents, spreadsheets, presentations.</p>
<p><b>Analogues:</b> <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/apertium" target="_blank">Apertium</a>, <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/deepl" target="_blank">DeepL</a>.</p>

<img alt="Translator" src="<%= Url.Content("~/content/img/plugins/gifs/translator.gif") %>" />


<div class="header-gray">Installation</div>
<p>Available by default in the cloud, on-premises and desktop versions of ONLYOFFICE editors.</p>
<p>You can remove it following the <a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>" target="_blank">on-premises</a>, or <a href="<%= Url.Action("installation/cloud") %>" target="_blank">cloud</a> installation instructions.
<p>The plugin guid: {7327FC95-16DA-41D9-9AF2-0E7F449F6800}.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Select the text you want to translate.</li>
    <li>Open the <b>Plugins</b> tab and press <b>Translator</b>.</li>
    <li>Select the necessary language. The translation will be displayed in the plugin window immediately.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/translator" target="_blank">https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/translator</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>translate.js</em></li>
    <li>Icons</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish, Czech, and French.</li>
    <li><em>index_widget.html</em> specifies the translator widget</li>
    <li>Third-party services:
        <ul>
            <li><a href="https://jquery.com" target="_blank">jQuery</a> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. License: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/translator/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><a href="https://select2.org/" target="_blank">Select2</a> gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options. License: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/translator/licenses/Select2.license" target="_blank">MIT</a>.</li>
            <li><a href="https://cloud.google.com/translate?hl=ru" target="_blank">Google Translate API</a> enables translation between languages. License: <a href="https://github.com/matheuss/google-translate-api/blob/master/LICENSE" target="_blank">MIT License</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name": "Translator",
    "nameLocale": {
        "fr": "Traducteur",
        "es": "Traductor",
        "de": "&#220;bersetzer"
    },
    "guid": "asc.{7327FC95-16DA-41D9-9AF2-0E7F449F6800}",
    "version": "1.0.1",

    "variations": [
        {
            "description": "Translate the selected text into other languages with Google Translate.",
            "descriptionLocale": {
                "fr": "Traduisez le texte s&#233;lectionn&#233; dans d'autres langues avec Google Translate.",
                "es": "Traduzca el texto seleccionado a otros idiomas con el Traductor de Google.",
                "de": "&#220;bersetzen Sie den ausgew&#228;hlten Text in andere Sprachen mit Google Translate."
            },
            "url": "index.html",

            "icons": [ "resources/img/icon.png", "resources/img/icon@2x.png" ],
            "icons2": [
                {
                    "100%": { "normal": "resources/img/icon.png" },
                    "125%": { "normal": "resources/img/icon@1.25x.png" },
                    "150%": { "normal": "resources/img/icon@1.5x.png" },
                    "175%": { "normal": "resources/img/icon@1.75x.png" },
                    "200%": { "normal": "resources/img/icon@2x.png" }
                }
            ],
            "screens": ["resources/store/screen_1.png"],
            "isViewer": true,
            "EditorsSupport": [ "word", "cell", "slide" ],
            "isVisual": true,
            "isModal": false,
            "isInsideMode": true,
            "initDataType": "text",
            "initOnSelectionChanged": true,
            "store": {
                "background": {
                    "light": "#F5F5F5",
                    "dark": "#444444"
                },
                "screenshots" : ["resources/store/screenshots/screen_1.png"],
                "icons"       : {
                    "light" : "resources/store/icons",
                    "dark"  : "resources/store/icons"
                }
            }
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul class="columns-2">
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("events/onExternalMouseUp") %>">onExternalMouseUp</a></li>
    <li><a href="<%= Url.Action("events/onTranslate") %>">onTranslate</a></li>
    <li><a href="<%= Url.Action("callcommand") %>">callCommand</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/common/getversion") %>">executeMethod ("GetVersion")</a></li>
    <li><a href="<%= Url.Action("executemethod/common/getselectedtext") %>">executeMethod ("GetSelectedText")</a></li>
    <li><a href="<%= Url.Action("executemethod/common/getselectiontype") %>">executeMethod ("GetSelectionType")</a></li>
    <li><a href="<%= Url.Action("executemethod/common/pastetext") %>">executeMethod ("PasteText")</a></li>
    <li><a href="<%= Url.Action("scope") %>">Asc.scope object</a></li>
    <li><a href="<%= Url.Action("info") %>#editorType">info.editorType</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/issues" target="_blank">GitHub</a>.</p>
