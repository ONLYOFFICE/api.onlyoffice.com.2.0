<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">OCR</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Connects the <a href="https://tesseract.projectnaptha.com/" target="_blank">TesseractJS-Core library</a> for extracting text from an image (<em>.png</em> <em>.jpg</em>) and inserting it into the document. OCR supports more than 60 languages.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents, spreadsheets, presentations.</p>

<img alt="OCR" src="<%= Url.Content("~/content/img/plugins/gifs/ocr.gif") %>" />


<div class="header-gray">Installation</div>
<p>Available by default in the cloud, on-premises and desktop versions of ONLYOFFICE editors.</p>
<p>You can remove it following the <a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>" target="_blank">on-premises</a>, or <a href="<%= Url.Action("installation/cloud") %>" target="_blank">cloud</a> installation instructions.
<p>The plugin guid: {440EBF13-9B19-4BD8-8621-05200E58140B}.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Find the plugin on the <b>Plugins</b> tab.</li>
    <li>Click the <b>Load File</b> button and select an image.</li>
    <li>Choose the recognition language from the <b>Choose Language</b> pull-down menu.</li>
    <li>Click the <b>Recognize</b> button. The text will appear to the right of the picture.</li>
    <li>Click the <b>Insert text</b> button and the text will be inserted into the document at the text cursor position.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/ocr" target="_blank">https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/ocr</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>ocr.js</em></li>
    <li>Icons</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish, Czech, and French.</li>
    <li><em>index_about.html</em> for the plugin <b>About</b> window</li>
    <li>Third-party services:
        <ul>
            <li><a href="https://jquery.com" target="_blank">jQuery</a> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. License: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/ocr/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><a href="https://select2.org/" target="_blank">Select2</a> gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options. License: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/ocr/licenses/Select2.license" target="_blank">MIT</a>.</li>
            <li><a href="https://tesseract.projectnaptha.com/" target="_blank">TesseractJS-Core</a> is a pure Javascript port of the popularTesseract OCR engine. This library supportsmore than 100 languages, automatic textorientation and script detection, a simple interface for reading paragraph, word, and characterbounding boxes. License: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/ocr/licenses/Tesseract.license" target="_blank">Apache License</a>, version 2.0.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name": "OCR",
    "nameLocale": {
        "fr": "Reconnaissance optique de caract&#232;res",
        "es": "Reconocimiento &#243;ptico de caracteres",
        "de": "OCR"
    },
    "guid": "asc.{440EBF13-9B19-4BD8-8621-05200E58140B}",
    "version": "1.0.0",

    "variations": [
        {
            "description": "Recognize text from pictures and screenshots and insert it into your documents.",
            "descriptionLocale": {
                "fr": "Reconnaissez le texte des images et des captures d'&#233;cran et ins&#233;rez-le dans vos documents.",
                "es": "Reconozca el texto de im&#225;genes y capturas de pantalla e ins&#233;rtelo en sus documentos.",
                "de": "Erkennen Sie Text auf Bildern und Screenshots und f&#252;gen Sie ihn in Ihre Dokumente ein."
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

            "isViewer": false,
            "EditorsSupport": [ "word" ],
            "isVisual": true,
            "isModal": true,
            "isInsideMode": false,
            "initDataType": "none",

            "buttons": [
                {
                    "text": "Insert Text",
                    "primary": true,
                    "textLocale": {
                        "fr": "Ins&#233;rer le texte",
                        "es": "Insertar texto",
                        "de": "Text einf&#252;gen"
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

            "size": [ 592, 100 ],
            "store": {
                "background": {
                    "light" : "#444444",
                    "dark" : "#444444"
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

            "size": [ 392, 147 ]
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul>
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("events/onTranslate") %>">onTranslate</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("resizewindow") %>">resizeWindow</a></li>
    <li><a href="<%= Url.Action("info") %>#recalculate">info.recalculate</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/issues" target="_blank">GitHub</a>.</p>
