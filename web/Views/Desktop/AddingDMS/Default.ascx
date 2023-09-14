<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Adding a DMS provider</span>
</h1>


<p>
    ONLYOFFICE Desktop Editors allows users to access the documents from the cloud and collaborate on them with their teammates. 
    In this case, an Internet connection is required. 
    Currently, users can connect the application to ONLYOFFICE Workspace (SaaS or on-premises), Nextcloud, ownCloud or Seafile, but you can extend this list adding your own DMS.
</p>
<p>
    Follow the steps below to add your own document management system (DMS) to the connection list:
</p>

<h2>Step 1</h2>

<p>Create a folder using the DMS provider as a name (e.g. <em>onlyoffice</em>) in the <em>providers</em> directory. 
    The path to the folder depends on the operating system you use:</p>
<ul style="list-style: none;">
    <li>For Linux - <em>/opt/onlyoffice/desktopeditors/providers/</em></li>
    <li>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DesktopEditors\providers\</em></li>
    <li>For Mac OS - <em>/Applications/ONLYOFFICE.app/Contents/Resources/providers/</em></li>
</ul>

<h2>Step 2</h2>

<p>Create a <em>config.json</em> file to specify the integration parameters.</p>

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
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
            <td id="provider" class="copy-link">provider</td>
            <td>
                Defines the provider id used to refer to the desktop app in the JavaScript commands.
            </td>
            <td>string</td>
            <td>"onlyoffice"</td>
        </tr>
        <tr class="tablerow">
            <td id="name" class="copy-link">name</td>
            <td>
                Defines the name displayed in the provider choice section when adding a cloud.
            </td>
            <td>string</td>
            <td>"ONLYOFFICE"</td>
        </tr>
        <tr class="tablerow">
            <td id="check" class="copy-link">check</td>
            <td>
                <p>Defines parameters for checking portal availability:</p>
                <ul>
                    <li>
                        <p><b>url</b> - the URL used in the request,</p>
                        <p><b>type</b>: string,</p>
                        <p><b>example</b>: "status";</p>
                    </li>
                    <li>
                        <p><b>headers</b> - the headers added to the <em>ajax</em> request,</p>
                        <p><b>type</b>: object,</p>
                        <p><b>example</b>: {"OCS-APIREQUEST": true}.</p>
                    </li>
                </ul>
                <p>A <em>GET</em> request is sent, after which <em>HTTP_STATUS_CODE = 200</em> is expected. The response must be returned in the JSON format.</p>
            </td>
            <td>object</td>
            <td>{
    "url": "status",
    "headers": {
        "X-CUSTOM-HEADER": true
    }
}</td>
        </tr>
        <tr class="tablerow">
            <td id="entryPage" class="copy-link">entryPage</td>
            <td>Defines the URL to connect the provider. It is used instead of the provider address and allows the desktop app not to send the <a href="#check">check</a> request.</td>
            <td>string</td>
            <td>"https://url-to-connect-provider.com"</td>
        </tr>
        <tr class="tablerow">
            <td id="extraLogout" class="copy-link">extraLogout</td>
            <td>Defines the URL to log out from the cloud. It is used instead of the provider address.</td>
            <td>string or array of strings</td>
            <td>"https://url-for-logout.com"</td>
        </tr>
        <tr>
            <td id="editorPage" class="copy-link">editorPage</td>
            <td>
                <p>Defines the relative URL that indicates that the type of the opening file is a document.</p>
            </td>
            <td>string</td>
            <td>"/apps/onlyoffice/"</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">You can use regular expressions for this parameter. For example, <em>"regex:\/lib\/(?:[\w-]{32,})\/file\/"</em>.</div>
            </td>
        </tr>
        <tr class="tablerow">
            <td id="startPage" class="copy-link">startPage</td>
            <td>Defines the relative URL added to the entered IP or domain when creating a new connection.</td>
            <td>string</td>
            <td>"/"</td>
        </tr>
        <tr class="tablerow">
            <td id="icons" class="copy-link">icons</td>
            <td>
                <p>Defines the icons for portals:</p>
                <ul>
                    <li>
                        <p><b>connectionsList</b> - the path to the icon for the connection list,</p>
                        <p><b>type</b>: string,</p>
                        <p><b>example</b>: "./assets/listicon.svg";</p>
                    </li>
                    <li>
                        <p><b>buttonLogo </b> - the path to the icon for the provider button on the connection page when the portal list is empty,</p>
                        <p><b>type</b>: string,</p>
                        <p><b>example</b>: "./assets/buttonlogo.svg".</p>
                    </li>
                </ul>
                <p>You can add icons for each UI theme type (light and dark) by specifying the <em>themeLight</em> and <em>themeDark</em> objects with the corresponding icons.</p>
            </td>
            <td>object</td>
            <td>{
    "themeLight": {
        "connectionsList": "./assets/listicon.svg",
        "buttonLogo": "./assets/buttonlogo.svg"
    }
}</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>
{
    "provider": "onlyoffice",
    "name" : "ONLYOFFICE",
    "check": {
        "url": "status",
        "headers": {
            "X-CUSTOM-HEADER": true
        }
    },
    "entryPage" : "https://url-to-connect-provider.com",
    "extraLogout" : "https://url-for-logout.com",
    "editorPage" : "/apps/onlyoffice/",
    "startPage" : "/",
    "icons" : {
        "themeLight": {
            "connectionsList": "./assets/listicon.svg",
            "buttonLogo": "./assets/buttonlogo.svg"
        },
        "themeDark": {
            "connectionsList": "./assets/listicon_dark.svg",
            "buttonLogo": "./assets/buttonlogo_dark.svg"
        }
    }
}
</pre>


<h2>Step 3</h2>

<p>Create two icons for the application page and put to the folder specified in the <em>config.json</em> file:</p>
<ol>
    <li>
        <p>The icon for the connection list. The required icon size is 36x36:</p>
        <img class="screenshot max-width-832" alt="Connection list" src="<%= Url.Content("~/content/img/desktop/connection_list.png") %>" />
    </li>
    <li>
        <p>The icon for the provider button on the connection page when the <b>Connected clouds</b> list is empty. The required icon size is 148x38:</p>
        <img class="screenshot max-width-832" alt="Provider button" src="<%= Url.Content("~/content/img/desktop/provider_button.png") %>" />
    </li>
</ol>
<p>Supported image formats are <em>.png</em>, <em>.jpeg</em>, <em>.svg</em>. 
    We recommend using a <em>.svg</em> file for correct display on HiDPI monitors with a 200% scale in the system.</p>
<p>You can also add icons for each UI theme type (light and dark). In this case, create four icons (two for each theme) and add all of the to the <em>config.json</em> file.</p>


<h2>Step 4</h2>

<p>Launch ONLYOFFICE Desktop Editors or restart it if needed and switch to the <b>Connected clouds</b> section to check if the connection works correctly.</p>
