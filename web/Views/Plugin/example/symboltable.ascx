<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Symbol Table</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Inserts special symbols into the document.
</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents, spreadsheets, presentations.</p>

<img alt="SymbolTable" src="<%= Url.Content("~/content/img/plugins/gifs/symbol-table.gif") %>" />


<div class="header-gray">Installation</div>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/symboltable" target="_blank">GitHub</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>,
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Find the plugin on the <b>Plugins</b> tab.</li>
    <li>Choose any character you want to paste (you can enter its unicode Hex value by yourself). You can choose the characters range to quickly navigate through them.</li>
    <li>Choose the characters font.</li>
    <li>Press the <b>Insert</b> button.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/symboltable" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/symboltable</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>symboltable.js</em></li>
    <li>Icons</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish, Czech, and French.</li>
    <li><em>character.js</em> contains all the characters that the plugin supports.</li>
    <li>Third-party services:
        <ul>
            <li><a href="https://jquery.com" target="_blank">jQuery</a> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/symboltable/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><a href="https://select2.org/" target="_blank">Select2</a> gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options. License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/symboltable/licenses/Select2.license" target="_blank">MIT</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name": "Symbol Table",
    "nameLocale": {
        "fr": "Table des symboles",
        "es": "Tabla de si&#769;mbolos",
        "de": "Symboltabelle"
    },
    "guid": "asc.{03C18A8D-8E01-444A-86EB-EDDFA7773157}",
    "baseUrl": "",

    "variations": [
        {
            "description": "Symbol Table",
            "descriptionLocale": {
                "fr": "Table des symboles",
                "es": "Tabla de si&#769;mbolos",
                "de": "Symboltabelle"
            },
            "url": "index.html",

            "icons": [ "resources/img/icon.png", "resources/img/icon@2x.png", "resources/img/icon2.png", "resources/img/icon2@2x.png" ],
            "isViewer": false,
            "EditorsSupport": [ "word", "cell", "slide" ],

            "isVisual": true,
            "isModal": false,
            "isInsideMode": true,

            "initDataType": "html",
            "initData": "",

            "buttons": [
                {
                    "text": "Insert",
                    "primary": true,
                    "textLocale": {
                        "fr": "Inse&#769;rer",
                        "es": "Insertar",
                        "de": "Einf&#252;gen"
                    }
                },
                {
                    "text": "Cancel",
                    "primary": false,
                    "textLocale": {
                        "fr": "Annuler",
                        "es": "Cancelar",
                        "de": "Abbrechen"
                    }
                }
            ],

            "size": [ 600, 700 ]
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul class="columns-2">
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("events/onExternalMouseUp") %>">onExternalMouseUp</a></li>
    <li><a href="<%= Url.Action("events/onMethodReturn") %>">onMethodReturn</a></li>
    <li><a href="<%= Url.Action("events/onTranslate") %>">onTranslate</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/common/getfontlist") %>">executeMethod ("GetFontList")</a></li>
    <li><a href="<%= Url.Action("executemethod/common/pastehtml") %>">executeMethod ("PasteHtml")</a></li>
    <li><a href="<%= Url.Action("info") %>#editorType">info.editorType</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
