<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Zotero</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Connects a Zotero account for adding references to the document in full accordance with the chosen style guides.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents.</p>
<p><b>Analogues:</b> <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/mendeley" target="_blank">Mendeley</a>, <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/easybib" target="_blank">EasyBib</a>.</p>

<img alt="Zotero" src="<%= Url.Content("~/content/img/plugins/gifs/zotero.gif") %>" />


<div class="header-gray">Installation</div>
<p>Available by default in ONLYOFFICE Enterprise Edition, Community Edition (Document Server + Community Server), and ONLYOFFICE cloud.</p>
<p>You can also download this plugin from the <a href="https://www.onlyoffice.com/en/app-directory/zotero" target="_blank">ONLYOFFICE App Directory</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a> installation instruction.</p>

<div class="header-gray">Connect ONLYOFFICE to Zotero account</div>
<ol>
    <li>Find the plugin on the <b>Plugins</b> tab.</li>
    <li>Log in to your Zotero account.</li>
    <li>Follow the <b>Zotero API settings</b> link from the plugin's window. If you are logged in, you'll be able to proceed.
    If you are not logged in, you'll see an error message. In this case, click <b>Log in</b> (top right corner of your screen).</li>
    <li>Press <b>Create new private key</b>.</li>
    <li>Fill in <b>Key Description</b>, make sure the <b>Allow library access</b> box is checked and press <b>Save Key</b>.</li>
    <li>Copy the newly created key, paste to the <b>API Key</b> field in the plugin's interface, and save it.</li>
</ol>


<div class="header-gray">Usage</div>

<ol>
    <li>Find the plugin on the <b>Plugins</b> tab.</li>
    <li>Find the necessary bibliography by author, title, or year.</li>
    <li>Select all the necessary sources.</li>
    <li>Choose the reference style from the <b>Style</b> pull-down menu.</li>
    <li>Click the <b>Insert Bibliography</b> button. The bibliography list will be inserted at the cursor position.</li>
</ol>

<div class="header-gray">Known issues</div>

<p>For CentOS users with SELinx enabled, after copying the src folder to sdkjs-plugins, plugins may not work due to the variable file security context. To restore the rights, use the following command:</p>
<pre>
sudo restorecon -Rv /var/www/onlyoffice/documentserver/sdkjs-plugins/
</pre>
<p>After that restart the services:</p>
<pre>
sudo supervisorctl restart ds:docservice
</pre>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/zotero" target="_blank">https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/zotero</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>code.js</em></li>
    <li>Icons</li>
    <li><em>plugin_style.css</em> are used to adjust the plugin style.</li>
    <li>The <em>translations</em> folder contains translations into Russian, German, Spanish, Czech, Italian, Japanese, Dutch, Portuguese, Chinese, and French.</li>
    <li><em>zotero.js</em> allows the user to get access to their Zotero account.</li>
    <li>Third-party services:
        <ul>
            <li><a href="https://github.com/github/fetch" target="_blank">fetch-polyfill</a> - a project that implements a subset of the standard Fetch specification, enough to make fetch a viable replacement for most uses of XMLHttpRequest in traditional web applications. License: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/zotero/licenses/fetch-polyfill.license" target="_blank">MIT</a></li>
            <li><a href="https://github.com/taylorhakes/promise-polyfill" target="_blank">promise-polyfill</a> - lightweight ES6 Promise polyfill for the browser and node. License:  <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/zotero/licenses/promise-polyfill.license" target="_blank">MIT</a>.</li>
            <li><a href="https://github.com/lifaon74/url-polyfill" target="_blank">url-polyfill</a> -  Polyfill URL and URLSearchParams to match last WHATWG specifications. License: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/zotero/licenses/url-polyfill.license" target="_blank">MIT</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name": "Zotero",
    "nameLocale": {
        "fr": "Zotero",
        "es": "Zotero",
        "de": "Zotero"
    },
    "guid" : "asc.{BFC5D5C6-89DE-4168-9565-ABD8D1E48711}",
	"version": "1.0.0",

    "variations" : [
        {
            "description": "Create bibliographies in the required style using Zotero service.",
            "descriptionLocale": {
                    "fr": "Cr&#233;ez des bibliographies dans le style n&#233;cessaire avec Zotero.",
                    "es": "Cree bibliograf&#237;as en el estilo requerido utilizando el servicio Zotero.",
                    "de": "Erstellen Sie Literaturverzeichnisse im gew&#252;nschten Stil mittels Zotero."
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
            "initDataType": "text",
            "initData": "",
            "isVisual": true,
            "isModal": false,
            "isInsideMode": true,
            "initOnSelectionChanged": false,
            "store": {
                "background": {
                    "light" : "#2D3037",
                    "dark" : "#2D3037"
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
    <li><a href="<%= Url.Action("events/onTranslate") %>">onTranslate</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/common/pastehtml") %>">executeMethod ("PasteHtml")</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/issues" target="_blank">GitHub</a>.</p>
