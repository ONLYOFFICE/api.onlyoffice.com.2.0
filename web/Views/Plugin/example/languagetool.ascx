<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Language tool</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Connects the <a href="https://languagetool.org/" target="_blank">LanguageTool</a> assistant, multilingual grammar, and style checker to check the text for grammar, style, and spell errors.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents, spreadsheets, presentations.</p>
<p><b>Analogue:</b> <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/glavred" target="_blank">Glavred</a>, <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/grammalecte" target="_blank">Grammalecte</a>.</p>

<img alt="LanguageTool" src="<%= Url.Content("~/content/img/plugins/gifs/language-tool.gif") %>" />


<div class="header-gray">Installation</div>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/languagetool" target="_blank">GitHub</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>,
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Open the <b>Plugins</b> tab and press <b>Languagetool</b>.</li>
    <li>Select the necessary text or write it in the plugin window.</li>
    <li>The language is detected automatically, but you can also change it manually.</li>
    <li>Press the <b>Check</b> button.</li>
    <li>You will receive information about the stylistic and grammatical mistakes and tips for correcting them.</li>
    <li>To replace the selected text in your document with the corrected text from the field, click <b>Replace</b>.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/languagetool" target="_blank">https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/languagetool</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>langTool.js</em></li>
    <li>Icons</li>
    <li><em>index_about.html</em> for the plugin <b>About</b> window</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish, Czech, Italian, Japanese, Dutch, Portuguese, Chinese, and French.</li>
    <li><em>plugin_style.css</em> is used to adjust the plugin style.</li>
    <li>Third-party services:
        <ul>
            <li><a href="https://jquery.com" target="_blank">jQuery</a> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. License: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/languagetool/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><a href="https://select2.org/" target="_blank">Select2</a> gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options. License: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/languagetool/licenses/Select2.license" target="_blank">MIT</a>.</li>
            <li><a href="https://languagetool.org/" target="_blank">Languagetool</a> is a multilingual grammar and style checker. License: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/languagetool/licenses/Languagetool's.license" target="_blank">GNU LESSER GENERAL PUBLIC LICENSE</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name": "LanguageTool",
	 "nameLocale": {
        "fr": "LanguageTool",
        "es": "LanguageTool",
        "de": "LanguageTool"
    },
    "guid": "asc.{7CDB02C9-A0BF-4B56-9A1A-71C860B8498F}",
    "version": "1.0.0",

    "variations": [
        {
            "description": "Improve spelling, grammar, and style in your texts.",
			"descriptionLocale": {
                "fr": "Am&#233;liorez l'orthographe, la grammaire et le style de vos textes.",
                "es": "Mejore la ortograf&#237;a, la gram&#225;tica y el estilo de sus textos.",
                "de": "Verbessern Sie Rechtschreibung, Grammatik und Stil in Ihren Texten."
            },
            "url": "index.html",

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
            "isViewer": true,
            "EditorsSupport": [ "word", "cell", "slide" ],

            "isVisual": true,
            "isModal": true,
            "isInsideMode": true,

            "initDataType": "text",
            "initData": "",

            "buttons": [],

            "initOnSelectionChanged": true,

            "store": {
                "background": {
                    "light" : "#357EE5",
                    "dark" : "#357EE5"
                },
                "screenshots" : ["resources/store/screenshots/screen_1.png"],
                "icons"       : {
                    "light" : "resources/store/icons",
                    "dark"  : "resources/store/icons"
                }
            }
        },
        {
            "description": "About",
            "descriptionLocale": {
                "fr": "&#192; propos",
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

<ul class="columns-2">
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("events/onExternalMouseUp") %>">onExternalMouseUp</a></li>
    <li><a href="<%= Url.Action("events/onTranslate") %>">onTranslate</a></li>
    <li><a href="<%= Url.Action("callcommand") %>">callCommand</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/common/getselectedtext") %>">executeMethod ("GetSelectedText")</a></li>
    <li><a href="<%= Url.Action("executemethod/common/getselectiontype") %>">executeMethod ("GetSelectionType")</a></li>
    <li><a href="<%= Url.Action("executemethod/common/getversion") %>">executeMethod ("GetVersion")</a></li>
    <li><a href="<%= Url.Action("executemethod/common/pastetext") %>">executeMethod ("PasteText")</a></li>
    <li><a href="<%= Url.Action("scope") %>">Asc.scope object</a></li>
    <li><a href="<%= Url.Action("info") %>#editorType">info.editorType</a></li>
    <li><a href="<%= Url.Action("info") %>#recalculate">info.recalculate</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/issues" target="_blank">GitHub</a>.</p>
