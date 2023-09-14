<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Highlight code</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Connects the <a href="https://highlightjs.org/" target="_blank">highlight.js library</a> for highlighting code syntax with the necessary language, style, and background color.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents, spreadsheets, presentations.</p>

<img alt="HighlightCode" src="<%= Url.Content("~/content/img/plugins/gifs/highlight-code.gif") %>" />


<div class="header-gray">Installation</div>
<p>Available by default in the cloud, on-premises and desktop versions of ONLYOFFICE editors.</p>
<p>You can remove it following the <a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>" target="_blank">on-premises</a>, or <a href="<%= Url.Action("installation/cloud") %>" target="_blank">cloud</a> installation instructions.
<p>The plugin guid: {BE5CBF95-C0AD-4842-B157-AC40FEDD9841}.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Find the plugin in the <b>Plugins</b> tab.</li>
    <li>Paste the code into the plugin window.</li>
    <li>The language is detected automatically, but you can change it. You can also customize the code display style, tabs, and background color.</li>
    <li>Click the <b>Ok</b> button to paste the code into the document.</li>
</ol>


<div class="header-gray">Known issues</div>

<ul>
    <li><b>Supported languages</b>: Apache, Access Log, Bash, Shell, MATLAB, Erlang, JavaScript, Ruby, Prolog, Swift, SQL, Java, HTTP, Fortran, Perl, XML, CPP, JSON, C Sharp, NGINX, BASIC, Markdown, CSS, Python, Objective-C, PHP, Delphi, Go, Kotlin, Rust, Shell, TypeScript.</li>
    <li><b>Supported styles</b>: Googlecode, GitHub, GitHub Gist, Android Studio, Visual Studio, Visual Studio 2015, Idea, Qtcreator Dark, Qtcreator Light, XCode, Fortran, Foundation, XML 1, XML 2.</li>
</ul>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/highlightcode" target="_blank">https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/highlightcode</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>code.js</em></li>
    <li>Icons</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish, Czech, and French.</li>
    <li><em>plugin_style.css</em> and <em>scrollable_div.js</em> are used to adjust the plugin style.</li>
    <li>Third-party service:
    <ul>
        <li><a href="https://highlightjs.org/" target="_blank">Highlight.js library</a> - a syntax highlighter written in JavaScript. License: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/highlightcode/licenses/Highlight.license" target="_blank">BSD 3-Clause</a>.</li>
        <li><a href="http://bgrins.github.io/spectrum/" target="_blank">Spectrum.js</a> - a JavaScript colorpicker plugin that uses the jQuery framework. License: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/highlightcode/licenses/spectrum.license" target="_blank">MIT License</a>.</li>
        <li><a href="https://jquery.com" target="_blank">jQuery</a> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. License: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/highlightcode/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
        <li><a href="https://select2.org/" target="_blank">Select2</a> gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options. License:  <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/highlightcode/licenses/Select2.license" target="_blank">MIT</a>.</li>
        <li><a href="https://github.com/beautify-web/js-beautify" target="_blank">js-beautify.js</a> - the code formatting library (CSS, HTML, JavaScript). License:  <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/highlightcode/licenses/js-beautify.license" target="_blank">MIT</a>.</li>
        <li><a href="https://github.com/prettier/prettier" target="_blank">prettier.js</a> - an opinionated code formatter. License:  <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/highlightcode/licenses/prettier.license" target="_blank">MIT</a>.</li>
        <li><a href="https://github.com/prettier/plugin-php" target="_blank">prettier-plugin-php.js</a> - a plugin that adds the PHP language support to Prettier. License:  <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/highlightcode/licenses/prettier%40plugin-php.license" target="_blank">MIT</a>.</li>
        <li><a href="https://github.com/chrisbottin/xml-formatter" target="_blank">xml-formatter.js</a> converts XML into a human readable format (pretty print) while respecting the <em>xml:space</em> attribute. License:  <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/highlightcode/licenses/xml-formatter.license" target="_blank">MIT</a>.</li>
    </ul>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "guid": "asc.{BE5CBF95-C0AD-4842-B157-AC40FEDD9841}",
    "name": "Highlight code",
    "nameLocale": {
        "de": "Code hervorheben",
        "es": "Resaltar el c&#243;digo",
        "fr": "Code en surbrillance"
    },
    "variations": [
        {
            "EditorsSupport": [
                "word",
                "cell",
                "slide"
            ],
            "buttons": [
                {
                    "primary": true,
                    "text": "Ok"
                },
                {
                    "primary": false,
                    "text": "Cancel",
                    "textLocale": {
                        "de": "Abbrechen",
                        "es": "Cancelar",
                        "fr": "Annuler"
                    }
                }
            ],
            "description": "Highlight syntax of the code selecting the necessary language, style, and background color.",
            "descriptionLocale": {
                "de": "Heben Sie die Codesyntax hervor, indem Sie die gew&#252;nschte Sprache, den Stil und die Hintergrundfarbe ausw&#228;hlen.",
                "es": "Resalte la sintaxis del c&#243;digo seleccionando el idioma, el estilo y el color de fondo necesarios.",
                "fr": "Mettez en &#233;vidence la syntaxe du code en s&#233;lectionnant la langue, le style et la couleur de l'arri&#232;re-plan."
            },
            "icons": [
                "resources/light/icon.png",
                "resources/light/icon@2x.png"
            ],
            "icons2": [
                {
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
                    },
                    "style": "light"
                },
                {
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
                    },
                    "style": "dark"
                }
            ],
            "initData": "",
            "initDataType": "html",
            "initOnSelectionChanged": true,
            "isInsideMode": false,
            "isModal": true,
            "isViewer": false,
            "isVisual": true,
            "url": "index.html",
            "store": {
                "background": {
                    "light" : "#282C33",
                    "dark" : "#282C33"
                },
                "screenshots" : ["resources/store/screenshots/screen_1.png"],
                "icons"       : {
                    "light" : "resources/store/icons",
                    "dark"  : "resources/store/icons"
                } 
            }
        }
    ],
    "version": "1.0.0"
}
</pre>


<div class="header-gray">Methods and events</div>

<ul class="columns-2">
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("events/onExternalMouseUp") %>">onExternalMouseUp</a></li>
    <li><a href="<%= Url.Action("events/onTranslate") %>">onTranslate</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/common/pastehtml") %>">executeMethod ("PasteHtml")</a></li>
    <li><a href="<%= Url.Action("loadmodule") %>">loadModule</a></li>
    <li><a href="<%= Url.Action("resizewindow") %>">resizeWindow</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/issues" target="_blank">GitHub</a>.</p>
