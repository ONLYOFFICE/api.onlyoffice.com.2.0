<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Thesaurus</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Connects <a href="https://words.bighugelabs.com/" target="_blank">Big Huge Thesaurus</a> to search for word synonyms and antonyms.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents, spreadsheets, presentations.</p>

<img alt="Thesaurus" src="<%= Url.Content("~/content/img/plugins/gifs/thesaurus.gif") %>" />


<div class="header-gray">Installation</div>
<p>Available by default in the cloud, on-premises and desktop versions of ONLYOFFICE editors.</p>
<p>You can remove it following the <a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>" target="_blank">on-premises</a>, or <a href="<%= Url.Action("installation/cloud") %>" target="_blank">cloud</a> installation instructions.
<p>The plugin guid: {BE5CBF95-C0AD-4842-B157-AC40FEDD9840}.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Open the <b>Plugins</b> tab and press <b>Thesaurus</b>.</li>
    <li>Select the necessary word. The list of synonyms and antonyms will be displayed automatically in the plugin window.</li>
    <li>Choose a suitable synonym or antonym and click it.</li>
    <li>The chosen synonym or antonym replaces the selected word in the text.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/thesaurus" target="_blank">https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/thesaurus</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>synonim.js</em></li>
    <li>Icons</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish, Czech, and French.</li>
    <li><em>plugin style.css</em> is used to bring the plugin to the specific style.
    <li>Third-party services:
        <ul>
            <li><a href="https://jquery.com" target="_blank">jQuery</a> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. License: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/thesaurus/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><a href="https://words.bighugelabs.com/" target="_blank">Big Huge Thesaurus</a> - the developer-friendly API for getting synonyms and antonyms for your apps and websites. License: <a href="https://www.apache.org/licenses/LICENSE-2.0" target="_blank">Apache 2.0 License</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name": "Thesaurus",
    "nameLocale": {
        "fr": "Th&#233;saurus",
        "es": "Tesauro",
        "de": "Thesaurus"
    },
    "guid": "asc.{BE5CBF95-C0AD-4842-B157-AC40FEDD9840}",
    "version": "1.0.0",

    "variations": [
        {
            "description": "Search for synonyms and antonyms of a word and replace it with the selected one.",
            "descriptionLocale": {
                "fr": "Recherchez les synonymes et les antonymes d'un mot et remplacez-le par le mot s&#233;lectionn&#233;.",
                "es": "Busque sin&#243;nimos y ant&#243;nimos de una palabra y sustit&#250;yala por la seleccionada.",
                "de": "Finden Sie Synonyme und Antonyme eines Wortes und ersetzen Sie es durch die ausgew&#228;hlte Variante."
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
            "isModal": false,
            "isInsideMode": true,
            "initDataType": "text",
            "initOnSelectionChanged": true,
            "store": {
                "background": {
                    "light": "#F44725",
                    "dark": "#F44725"
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

<ul>
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("events/onExternalMouseUp") %>">onExternalMouseUp</a></li>
    <li><a href="<%= Url.Action("events/onTranslate") %>">onTranslate</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/common/getselectedtext") %>">executeMethod ("GetSelectedText")</a></li>
    <li><a href="<%= Url.Action("executemethod/common/pastetext") %>">executeMethod ("PasteText")</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/issues" target="_blank">GitHub</a>.</p>
