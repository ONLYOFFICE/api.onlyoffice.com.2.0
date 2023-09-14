<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Speech</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Converts the selected text into speech. The plugin uses <a href="https://richtr.github.io/guessLanguage.js/" target="_blank">guessLanguage</a>
to recognize the language and the  <a href="https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis" target="_blank">SpeechSynthesis</a> interface
of the <a href="https://developer.mozilla.org/en-US/docs/Web/API/Web_Speech_API" target="_blank">Web Speech API</a>.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents.</p>

<img alt="Speech" src="<%= Url.Content("~/content/img/plugins/gifs/speech.gif") %>" />


<div class="header-gray">Installation</div>
<p>Available by default in ONLYOFFICE Enterprise Edition and Community Edition (Document Server + Community Server), and ONLYOFFICE cloud.</p>
<p>You can also download this plugin from the <a href="https://www.onlyoffice.com/en/app-directory/speech" target="_blank">ONLYOFFICE App Directory</a>.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Select the necessary text.</li>
    <li>Open the plugin settings to select the language for the voiceover (the default setting is auto-recognition mode).</li>
    <li>Open the <b>Plugins</b> tab and press <b>Speech</b>.</li>
    <li>The text will be read out loud.</li>
</ol>

<div class="header-gray">Known issues</div>

<ol>
    <li>Some browsers, e.g. Mozzila, Opera, can only use pre-installed languages on your system for speech generation. So to use new languages, you need to add them to your system.</li>
    <li>The plugin doesn't work on Safari 15.3 (17612.4.9.1.8). Problem fixed on Safari 15.4 (17614.1.7.7).</li>
</ol>

<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/speech" target="_blank">https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/speech</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>speech.js</em></li>
    <li>Icons</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish, Czech, Italian, Japanese, Dutch, Portuguese, Chinese, and French.</li>
    <li><em>settings.html</em> specifies a window with the plugin settings</li>
    <li>Third-party services:
        <ul>
            <li><a href="https://richtr.github.io/guessLanguage.js/" target="_blank">GuessLanguage</a> is a natural language detection library based on trigram statistical analysis. This library is written in JavaScript and works equally well when run in either browser or Node.js. License: <a href="https://www.gnu.org/licenses/lgpl-3.0.html" target="_blank">GNU LGPL</a>.</li>
            <li><a href="https://jquery.com" target="_blank">jQuery</a> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. License: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/speech/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><a href="https://select2.org/" target="_blank">Select2</a> gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options. License: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/speech/licenses/Select2.license" target="_blank">MIT</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name": "Speech",
    "nameLocale": {
        "cs": "&#344;e&#269;",
        "de": "Rede",
        "es": "Habla",
        "fr": "Parole",
        "it": "Discorso",
        "ja": "&#12473;&#12500;&#12540;&#12481;",
        "nl": "Spraak",
        "pt": "Discurso",
        "zh": "&#35762;&#35805;"
    },
    "guid": "asc.{D71C2EF0-F15B-47C7-80E9-86D671F9C595}",
    "version" : "2.0.0",

    "variations": [
        {
            "description": "Convert the selected text into speech.",
            "descriptionLocale": {
                "fr": "Convertissez le texte s&#233;lectionn&#233; en parole.",
                "es": "Convierta el texto seleccionado en voz.",
                "de": "Konvertieren Sie den ausgew&#228;hlten Text in die Rede."
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
            "EditorsSupport": [ "word" ],
            "isVisual": false,
            "initDataType": "text",

            "buttons": [],
            "store": {
                "background": {
                    "light": "#444444",
                    "dark": "#444444"
                },
                "screenshots" : ["resources/store/screenshots/screen_1.png"],
                "icons"       : {
                    "light" : "resources/store/icons",
                    "dark"  : "resources/store/icons"
                }
            }
        },
        {
            "description": "Settings",
            "descriptionLocale": {
                "cs": "Nastaven&#237;",
                "de": "Einstellungen",
                "es": "Configuraci&#243;n",
                "fr": "Param&#232;tres",
                "it": "Impostazioni",
                "ja": "&#35373;&#23450;",
                "nl": "Instellingen",
                "pt": "Defini&#231;&#245;es",
                "zh": "&#35774;&#32622;"
                
            },
            "url": "settings.html",

            "icons": [ "resources/img/icon.png", "resources/img/icon@2x.png", "resources/img/icon2.png", "resources/img/icon2@2x.png" ],
            "isViewer": false,
            "EditorsSupport": [ "word" ],
            "isVisual": true,
            "isModal": true,
            "isInsideMode": false,
            "initDataType": "none",

            "buttons": [
                {
                    "text": "Ok",
                    "primary": true
                }
            ],

            "size": [ 300, 150 ]
        }
    ]
}
</pre>

<div class="header-gray">Methods and events</div>

<ul>
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/issues" target="_blank">GitHub</a>.</p>
