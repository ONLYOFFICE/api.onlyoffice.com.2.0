<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">YouTube</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Connects <a href="https://developers.google.com/youtube/iframe_api_reference" target="_blank">youtube iframe_api</a> for embedding YouTube videos into documents as OLE objects and managing them by adjusting their size, rotating, and changing position.</p>
<p><b>Plugin type:</b> visual, OLE object, non-system.</p>
<p><b>Supported editors:</b> documents, spreadsheets, presentations.</p>

<img alt="Youtube" src="<%= Url.Content("~/content/img/plugins/gifs/youtube.gif") %>" />


<h2>Installation</h2>
<p>Available by default in the cloud, on-premises and desktop versions of ONLYOFFICE editors.</p>
<p>You can remove it following the <a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>" target="_blank">on-premises</a>, or <a href="<%= Url.Action("installation/cloud") %>" target="_blank">cloud</a> installation instructions.
<p>The plugin guid: {38E022EA-AD92-45FC-B22B-49DF39746DB4}.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Find the plugin on the <b>Plugins</b> tab.</li>
    <li>Insert the YouTube video URL you want to embed into the form and click the <b>OK</b> button.</li>
    <li>The video preview in the form of an image will appear in your document. Click it to play the video.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/youtube" target="_blank">https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/youtube</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>youtube.js</em></li>
    <li>Icons</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish, Czech, and French.</li>
    <li>Third-party service:
        <ul>
            <li><a href="https://developers.google.com/youtube/iframe_api_reference" target="_blank">Youtube iframe_api</a> lets the user embed a YouTube video player on the website and control the player using JavaScript. License: <a href="https://www.apache.org/licenses/LICENSE-2.0" target="_blank">Apache License 2.0</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name": "YouTube",
    "nameLocale": {
        "fr": "YouTube",
        "es": "YouTube",
        "de": "YouTube"
    },
    "guid": "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}",
    "version": "1.0.2",

    "variations": [
        {
            "description": "Easily embed YouTube videos into your documents.",
            "descriptionLocale": {
                "fr": "Ins&#233;rez facilement des vid&#233;os YouTube dans vos documents.",
                "es": "Inserte f&#225;cilmente v&#237;deos de YouTube en sus documentos.",
                "de": "Betten Sie ganz einfach YouTube-Videos in Ihre Dokumente ein."
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
            "isViewer": true,
            "isDisplayedInViewer": false,
            "EditorsSupport": [ "word", "cell", "slide" ],
            "isVisual": true,
            "isModal": true,
            "isInsideMode": false,
            "initDataType": "ole",
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
                        "fr": "Annuler",
                        "es": "Cancelar",
                        "de": "Abbrechen"
                    }
                }
            ],

            "size": [ 350, 90 ],
            "store": {
                "background": {
                    "light" : "#ED3323",
                    "dark" : "#ED3323"
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
    <li><a href="<%= Url.Action("events/onTranslate") %>">onTranslate</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/common/addoleobject") %>">executeMethod ("AddOleObject")</a></li>
    <li><a href="<%= Url.Action("executemethod/common/editoleobject") %>">executeMethod ("EditOleObject")</a></li>
    <li><a href="<%= Url.Action("resizewindow") %>">resizeWindow</a></li>
    <li><a href="<%= Url.Action("info") %>#data">info.data</a></li>
    <li><a href="<%= Url.Action("info") %>#guid">info.guid</a></li>
    <li><a href="<%= Url.Action("info") %>#height">info.height</a></li>
    <li><a href="<%= Url.Action("info") %>#imgSrc">info.imgSrc</a></li>
    <li><a href="<%= Url.Action("info") %>#mmToPx">info.mmToPx</a></li>
    <li><a href="<%= Url.Action("info") %>#objectId">info.objectId</a></li>
    <li><a href="<%= Url.Action("info") %>#resize">info.resize</a></li>
    <li><a href="<%= Url.Action("info") %>#width">info.width</a></li>
</ul>


<div class="header-gray">Supports</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/issues" target="_blank">GitHub</a>.</p>
