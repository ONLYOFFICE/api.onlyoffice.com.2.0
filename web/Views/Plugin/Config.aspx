<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    config.json
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">config.json</span>
    </h1>

    <div class="header-gray">Description</div>
    <p class="dscr">The <em>config.json</em> file is plugin configuration file containing the information about the main plugin data needed to register the plugin in the editors.</p>
    
    <nav class="content">
        <ul class="columns-4" style="list-style: none;">
            <li><a href="#baseUrl">baseUrl</a></li>
            <li><a href="#guid">guid</a></li>
            <li><a href="#minVersion">minVersion</a></li>
            <li><a href="#help">help</a></li>
            <li><a href="#name">name</a></li>
            <li><a href="#nameLocale">nameLocale</a></li>
            <li><a href="#variations">variations</a></li>
            <li><a href="#buttons">buttons</a></li>
            <li><a href="#description">description</a></li>
            <li><a href="#descriptionLocale">descriptionLocale</a></li>
            <li><a href="#EditorsSupport">EditorsSupport</a></li>
            <li><a href="#icons">icons</a></li>
            <li><a href="#initData">initData</a></li>
            <li><a href="#initDataType">initDataType</a></li>
            <li><a href="#initOnSelectionChanged">initOnSelectionChanged</a></li>
            <li><a href="#cryptoMode">cryptoMode</a></li>
            <li><a href="#isDisplayedInViewer">isDisplayedInViewer</a></li>
            <li><a href="#isInsideMode">isInsideMode</a></li>
            <li><a href="#isModal">isModal</a></li>
            <li><a href="#isSystem">isSystem</a></li>
            <li><a href="#isUpdateOleOnResize">isUpdateOleOnResize</a></li>
            <li><a href="#isViewer">isViewer</a></li>
            <li><a href="#isVisual">isVisual</a></li>
            <li><a href="#url">url</a></li>
            <li><a href="#size">size</a></li>
            <li><a href="#events">events</a></li>
            <li><a href="#cryptoDisabledForInternalCloud">cryptoDisabledForInternalCloud</a></li>
            <li><a href="#cryptoDisabledForExternalCloud">cryptoDisabledForExternalCloud</a></li>
            <li><a href="#cryptoDisabledOnStart">cryptoDisabledOnStart</a></li>
        </ul>
    </nav>
    
    <div class="header-gray">Parameters</div>
    <table class="table">
        <colgroup>
            <col style="width: 220px;" />
            <col />
            <col style="width: 100px;" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
                <td>Type</td>
                <td>Example</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td id="baseUrl" class="copy-link">baseUrl</td>
                <td>Path to the plugin. All the other paths are calculated relative to this path. In case the plugin is installed on the server, an additional parameter (path to the plugins) is added there. If <em>baseUrl == ""</em> the path to all plugins will be used.</td>
                <td>string</td>
                <td>""</td>
            </tr>
            <tr class="tablerow">
                <td id="guid" class="copy-link">guid</td>
                <td>Plugin identifier. It <b>must</b> be of the <em>asc.{UUID}</em> type.</td>
                <td>string</td>
                <td>"asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}"</td>
            </tr>
            <tr class="tablerow">
                <td id="minVersion" class="copy-link">minVersion</td>
                <td>The minimum supported editors version.</td>
                <td>string</td>
                <td>"6.3.0"</td>
            </tr>
            <tr class="tablerow">
                <td id="help" class="copy-link">help</td>
                <td>Path to the plugin description page. If the parameter is specified, the <em>help</em> button is displayed in the plugin window. When the user clicks the button, he follows the link to the plugin description page.</td>
                <td>string</td>
                <td>""</td>
            </tr>
            <tr class="tablerow">
                <td id="name" class="copy-link">name</td>
                <td>Plugin name which will be visible at the plugin toolbar.</td>
                <td>string</td>
                <td>"plugin name"</td>
            </tr>
            <tr class="tablerow">
                <td id="nameLocale" class="copy-link">nameLocale</td>
                <td>Translations for the name field. The object keys are the two letter language codes (ru, de, it, etc.) and the values are the plugin name translation for each language.</td>
                <td>object</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="variations" class="copy-link">variations</td>
                <td>Plugin variations, or subplugins, that are created inside the origin plugin. More information you can find <a href="<%= Url.Action("variations") %>">here</a>.</td>
                <td>array of object</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="buttons" class="copy-link">variations.buttons</td>
                <td>
                    The list of skinnable plugin buttons used in the plugin interface (used for visual plugins with their own window only, i.e. <em>isVisual == true &amp;&amp; isInsideMode == false</em>). 
                    The button object can have the folowing parameters:
                    <ul>
                        <li>
                            <b>text</b> - the label which is displayed on the button,
                            <br />
                            <b>type</b>: string,
                            <br />
                            <b>example</b>: "Cancel";
                        </li>
                        <li>
                            <b>primary</b> - defines if the button is primary or not. The primary flag affects the button skin only,
                            <br />
                            <b>type</b>: boolean,
                            <br />
                            <b>example</b>: true;
                        </li>
                        <li>
                            <b>isViewer</b> - defines if the button is shown in the viewer mode only or not,
                            <br />
                            <b>type</b>: boolean,
                            <br />
                            <b>example</b>: false;
                        </li>
                        <li>
                            <b>textLocale</b> - translations for the text field. The object keys are the two letter language codes (ru, de, it, etc.) and the values are the button label translation for each language,
                            <br />
                            <b>type</b>: object
                        </li>
                    </ul>
                </td>
                <td>array of object</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="description" class="copy-link">variations.description</td>
                <td>The description, i.e. what describes your plugin the best way.</td>
                <td>string</td>
                <td>"plugin description"</td>
            </tr>
            <tr class="tablerow">
                <td id="descriptionLocale" class="copy-link">variations.descriptionLocale</td>
                <td>Translations for the description field. The object keys are the two letter language codes (ru, de, it, etc.) and the values are the plugin description translation for each language.</td>
                <td>object</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="EditorsSupport" class="copy-link">variations.EditorsSupport</td>
                <td>The editors which the plugin is available for (<b>word</b> - text document editor, <b>cell</b> - spreadsheet editor, <b>slide</b> - presentation editor).</td>
                <td>array of string</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="icons" class="copy-link">variations.icons</td>
                <td>
                    Plugin icon image files used in the editors. More information you can find <a href="<%= Url.Action("icons") %>">here</a>.
                </td>
                <td>array of string</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="initData" class="copy-link">variations.initData</td>
                <td>Is usually equal to <em>""</em> - this is the data which is sent from the editor to the plugin at the plugin start (e.g. if <em>initDataType == "text"</em>, the plugin will receive the selected text when run). It may also be equal to <em>encryption</em> in the encryption plugins.</td>
                <td>string</td>
                <td>""</td>
            </tr>
            <tr class="tablerow">
                <td id="initDataType" class="copy-link">variations.initDataType</td>
                <td>The data type selected in the editor and sent to the plugin: <b>text</b> - the text data, <b>html</b> - HTML formatted code, <b>ole</b> - OLE object data, <b>desktop</b> - the desktop editor data, <b>destop-external</b> - the main page data of the desktop app (system messages), <b>none</b> - no data will be send to the plugin from the editor.</td>
                <td>string</td>
                <td>"ole"</td>
            </tr>
            <tr class="tablerow">
                <td id="initOnSelectionChanged" class="copy-link">variations.initOnSelectionChanged</td>
                <td>Specifies if the plugin watches the text selection events in the editor window.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td id="cryptoMode" class="copy-link">variations.cryptoMode</td>
                <td>The encryption plugin ID as there are several encryption plugins.</td>
                <td>string</td>
                <td>"1"</td>
            </tr>
            <tr class="tablerow">
                <td id="isDisplayedInViewer" class="copy-link">variations.isDisplayedInViewer</td>
                <td>Specifies if the plugin will be displayed in the viewer mode as well as in the editor mode (<em>isDisplayedInViewer == true</em>) or in the editor mode only (<em>isDisplayedInViewer == false</em>).</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td id="isInsideMode" class="copy-link">variations.isInsideMode</td>
                <td>Specifies if the plugin must be displayed inside the editor panel instead of its own window (used for visual non-modal plugins only). The following rule must be observed at all times: <em>isModal != isInsideMode</em>.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td id="isModal" class="copy-link">variations.isModal</td>
                <td>Specifies if the opened plugin window is modal (used for visual plugins only, and if <em>isInsideMode</em> is not true).</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td id="isSystem" class="copy-link">variations.isSystem</td>
                <td>Specifies if the plugin is not displayed in the editor interface and is started in the background with the server (or desktop editors start) not interfering with the other plugins, so that they can work simultaneously.</td>
                <td>boolean</td>
                <td>false</td>
            </tr>
            <tr class="tablerow">
                <td id="isUpdateOleOnResize" class="copy-link">variations.isUpdateOleOnResize</td>
                <td>Specifies if an OLE object must be redrawn when resized in the editor using the vector object draw type or not (used for OLE objects only, i.e. <em>initDataType == "ole"</em>).</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td id="isViewer" class="copy-link">variations.isViewer</td>
                <td>Specifies if the plugin is available when the document is opened in the viewer mode only or not. The default value is <b>false</b>.</td>
                <td>boolean</td>
                <td>false</td>
            </tr>
            <tr class="tablerow">
                <td id="isVisual" class="copy-link">variations.isVisual</td>
                <td>Specifies if the plugin is visual (will open a window for some action, or introduce some additions to the editor panel interface) or non-visual (will provide a button (or buttons) which is going to apply some transformations or manipulations to the document).</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td id="url" class="copy-link">variations.url</td>
                <td>
                    Plugin entry point, i.e. an HTML file which connects the <em>plugin.js</em> file (the base file needed for work with plugins) and launches the plugin code.
                    See the <a href="<%= Url.Action("indexhtml") %>">index.html</a> section for the detailed information.
                </td>
                <td>string</td>
                <td>"index.html"</td>
            </tr>
            <tr class="tablerow">
                <td id="size" class="copy-link">variations.size</td>
                <td>
                    Plugin window size.
                </td>
                <td>array of integer</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="events" class="copy-link">variations.events</td>
                <td>
                    Plugin events.
                </td>
                <td>array of string</td>
                <td></td>
            </tr>
            <tr class="tablerow">
                <td id="cryptoDisabledForInternalCloud" class="copy-link">variations.cryptoDisabledForInternalCloud</td>
                <td>
                    Specifies if the encryption for the ONLYOFFICE clouds is disabled or not.
                </td>
                <td>string</td>
                <td>"true"</td>
            </tr>
            <tr class="tablerow">
                <td id="cryptoDisabledForExternalCloud" class="copy-link">variations.cryptoDisabledForExternalCloud</td>
                <td>
                    Specifies if the encryption for the third-party clouds is disabled or not.
                </td>
                <td>string</td>
                <td>"true"</td>
            </tr>
            <tr class="tablerow">
                <td id="cryptoDisabledOnStart" class="copy-link">variations.cryptoDisabledOnStart</td>
                <td>
                    Specifies if the mode is reset on restart or not.
                </td>
                <td>string</td>
                <td>"true"</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">Example</div>
    <pre>{
        "baseUrl": "",
        "guid": "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}",
        "minVersion": "6.3.0",
        "help": "",
        "name": "plugin name",
        "nameLocale": {
            "fr": "french plugin name",
            "es": "spanish plugin name"
        },
        "variations": [
            {
                "buttons": [
                    { 
                        "text": "Cancel",
                        "primary": false,
                        "isviewer": false,
                        "textLocale": {
                            "fr": "Annuler",
                            "es": "Cancelar"
                        }
                    }
                ],
                "description": "plugin description",
                "descriptionLocale": {
                    "fr": "french plugin description",
                    "es": "spanish plugin description"
                },
                "EditorsSupport": ["word", "cell", "slide"],
                "icons": [
                    {
                        "100%": { "normal": "icon.png" },
                        "150%": { "normal": "icon@1.5x.png" },
                        "200%": { "normal": "icon@2x.png" }
                    },
                    {
                        "style" : "dark"
                    }
                ],
                "initData": "",
                "initDataType": "ole",
                "initOnSelectionChanged": true,
                "cryptoMode": "1",
                "isDisplayedInViewer": true,
                "isInsideMode": false,
                "isModal": true,
                "isSystem": false,
                "isUpdateOleOnResize": true,
                "isViewer": true,
                "isVisual": false,
                "url": "index.html",
                "size": [600, 700],
                "events": ["onClick"],
                "cryptoDisabledForInternalCloud": "true",
                "cryptoDisabledForExternalCloud": "true",
                "cryptoDisabledOnStart": "true"
            }
        ]
    };</pre>

</asp:Content>
