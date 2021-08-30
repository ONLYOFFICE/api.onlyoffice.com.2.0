<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Photo Editor</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Connects the <a href="https://ui.toast.com/tui-image-editor" target="_blank">Toast UI Image Editor</a> for editing images right in the document: cropping, resizing, applying effects, etc.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents, spreadsheets, presentations.</p>

<img alt="PhotoEditor" src="<%= Url.Content("~/content/img/plugins/gifs/photo-editor.gif") %>" />


<div class="header-gray">Installation</div>
<p>Available by default in the cloud, on-premises and desktop versions of ONLYOFFICE editors.</p>
<p>You can remove it following the <a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>" target="_blank">on-premises</a>, or <a href="<%= Url.Action("installation/cloud") %>" target="_blank">cloud</a> installation instructions.
<p>The plugin guid: {07FD8DFA-DFE0-4089-AL24-0730933CC80A}.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Select an image in your document.</li>
    <li>Find the plugin on the <b>Plugins</b> tab.</li>
    <li>Below the image, you will find different settings for editing.</li>
    <li>After setting all the parameters up, press the <b>OK</b> button.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/plugin-photoeditor" target="_blank">https://github.com/ONLYOFFICE/plugin-photoeditor</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em> and <em>code.js</em></li>
    <li>Icons</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish, Czech and French.</li>
    <li><em>index_about.html</em> for the plugin <b>About</b> window</li>
    <li>Third-party services:
        <ul>
            <li><b>jQuery</b> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development (<a href="https://jquery.com" target="_blank">https://jquery.com</a>). License: <a href="https://github.com/ONLYOFFICE/plugin-photoeditor/blob/master/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><b>Toast UI Image Editor</b> is a full featured image editor that uses HTML5 Canvas. It's easy to use and provides powerful filters (<a href="https://ui.toast.com/tui-image-editor" target="_blank">https://ui.toast.com/tui-image-editor</a>).  License: <a href="https://github.com/ONLYOFFICE/plugin-photoeditor/blob/master/licenses/Tui.license" target="_blank">MIT License</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name": "Photo Editor",
    "nameLocale": {
        "ru": "&#1060;&#1086;&#1090;&#1086;&#1088;&#1077;&#1076;&#1072;&#1082;&#1090;&#1086;&#1088;",
        "fr": "Photo Editor",
        "es": "Editor de Fotos",
        "de": "Foto-Editor"
    },
    "guid": "asc.{07FD8DFA-DFE0-4089-AL24-0730933CC80A}",
    "baseUrl": "",

    "variations": [
        {
            "description": "Photo Editor",
            "descriptionLocale": {
                "ru": "&#1060;&#1086;&#1090;&#1086;&#1088;&#1077;&#1076;&#1072;&#1082;&#1090;&#1086;&#1088;",
                "fr": "Photo Editor",
                "es": "Editor de Fotos",
                "de": "Foto-Editor"
            },
            "url": "index.html",

            "icons": [ "icon.png", "icon@2x.png", "icon2.png", "icon2@2x.png" ],
            "isViewer": false,
            "EditorsSupport": [ "word", "cell", "slide" ],

            "isVisual": true,
            "isModal": true,
            "isInsideMode": false,

            "initDataType": "html",
            "initData": "",

            "isUpdateOleOnResize": false,

            "buttons": [
                {
                    "text": "Ok",
                    "primary": true
                },
                {
                    "text": "Cancel",
                    "primary": false,
                    "isViewer": false,
                    "textLocale": {
                        "ru": "&#1054;&#1090;&#1084;&#1077;&#1085;&#1072;",
                        "fr": "Annuler",
                        "es": "Cancelar",
                        "de": "Abbrechen"
                    }
                }
            ],

            "size": [ 10000, 10000 ]
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

            "icons": [ "icon.png", "icon@2x.png", "icon2.png", "icon2@2x.png" ],
            "isViewer": false,
            "EditorsSupport": [ "word", "cell", "slide" ],

            "isVisual": true,
            "isModal": true,
            "isInsideMode": false,

            "initDataType": "none",
            "initData": "",

            "isUpdateOleOnResize": false,

            "size": [ 392, 147 ]
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<p>The main plugin code is located <a href="https://github.com/ONLYOFFICE/plugin-photoeditor/blob/master/scripts/photoeditor.js" target="_blank">here</a>.</p>
<ul class="columns-2">
    <li><a href="<%= Url.Action("events") %>#button">button</a></li>
    <li><a href="<%= Url.Action("events") %>#init">init</a></li>
    <li><a href="<%= Url.Action("events") %>#onTranslate">onTranslate</a></li>
    <li><a href="<%= Url.Action("callcommand") %>">callCommand</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("resizewindow") %>">resizeWindow</a></li>
    <li><a href="<%= Url.Action("scope") %>">Asc.scope object</a></li>
    <li><a href="<%= Url.Action("info") %>#editorType">info.editorType</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
