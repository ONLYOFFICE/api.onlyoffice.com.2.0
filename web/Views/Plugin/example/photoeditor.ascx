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

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/photoeditor" target="_blank">https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/photoeditor</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>photoeditor.js</em></li>
    <li>Icons</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish, Czech, and French.</li>
    <li><em>index_about.html</em> for the plugin <b>About</b> window</li>
    <li><em>black-theme.css</em>, <em>black-theme.js</em>, <em>white-theme.css</em> and <em>white-theme.js</em> are used to adjust the dark or light plugin theme</li>
    <li>Third-party services:
        <ul>
            <li><a href="https://jquery.com" target="_blank">jQuery</a> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. License: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/photoeditor/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><a href="https://ui.toast.com/tui-image-editor" target="_blank">Toast UI Image Editor</a> is a full featured image editor that uses HTML5 Canvas. It's easy to use and provides powerful filters.  License: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/photoeditor/licenses/Tui.license" target="_blank">MIT License</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name": "Photo Editor",
    "nameLocale": {
        "fr": "Photo Editor",
        "es": "Editor de Fotos",
        "de": "Foto-Editor"
    },
    "guid": "asc.{07FD8DFA-DFE0-4089-AL24-0730933CC80A}",
    "version": "1.0.1",
    "baseUrl": "",

    "variations": [
        {
            "description": "Edit images, screenshots, and photos right in your documents: crop, resize, apply effects.",
            "descriptionLocale": {
                "fr": "Modifiez des images, des captures d'&#233;cran et des photos directement dans vos documents: coupez, ajustez, appliquez des effets.",
                "es": "Edite im&#225;genes, capturas de pantalla y fotos directamente en sus documentos: recorte, cambie el tama&#241;o y aplique efectos.",
                "de": "Bearbeiten Sie Bilder, Screenshots und Fotos direkt in Dokumenten: Zuschneiden, Gr&#246;&#223;e &#228;ndern, Effekte anwenden."
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
            "EditorsSupport": [ "word", "cell", "slide" ],

            "isVisual": true,
            "isModal": true,
            "isInsideMode": false,

            "initDataType": "html",
            "initData": "",

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
                        "fr": "Annuler",
                        "es": "Cancelar",
                        "de": "Abbrechen"
                    }
                }
            ],

            "size": [ 10000, 10000 ],
            "store": {
                "background": {
                    "light" : "linear-gradient(180deg, #FF8E3D 0%, #FF6F3D 100%)",
                    "dark" : "linear-gradient(180deg, #FF8E3D 0%, #FF6F3D 100%)"
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
            "EditorsSupport": [ "word", "cell", "slide" ],

            "isVisual": true,
            "isModal": true,
            "isInsideMode": false,

            "initDataType": "none",
            "initData": "",

            "size": [ 392, 147 ]
        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul class="columns-2">
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("events/onTranslate") %>">onTranslate</a></li>
    <li><a href="<%= Url.Action("callcommand") %>">callCommand</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/common/getimagedatafromselection") %>">executeMethod ("GetImageDataFromSelection")</a></li>
    <li><a href="<%= Url.Action("executemethod/common/getversion") %>">executeMethod ("GerVersion")</a></li>
    <li><a href="<%= Url.Action("executemethod/common/putimagedatatoselection") %>">executeMethod ("PutImageDataToSelection")</a></li>
    <li><a href="<%= Url.Action("resizewindow") %>">resizeWindow</a></li>
    <li><a href="<%= Url.Action("scope") %>">Asc.scope object</a></li>
    <li><a href="<%= Url.Action("info") %>#editorType">info.editorType</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/issues" target="_blank">GitHub</a>.</p>
