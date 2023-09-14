<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <span class="hdr">PostMessage</span>
    </h1>

    <p class="dscr">
        <a href="https://docs.microsoft.com/en-us/microsoft-365/cloud-storage-partner-program/online/scenarios/postmessage" target="_blank">PostMessage</a> is the  <a href="https://html.spec.whatwg.org/multipage/web-messaging.html#posting-messages" target="_blank">HTML5 Web Messaging</a> protocol which allows exchanging messages in the browser between the iframe storage and ONLYOFFICE Docs. 
        It allows the online office frame to communicate with its parent host page.
    </p>

    <pre>
otherWindow.postMessage (msg, targetOrigin)
</pre>

    <div class="header-gray">Parameters</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
                <td>Type</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td id="msg" class="copy-link">msg</td>
                <td>The message data:
                    <ul>
                        <li>
                            <b>MessageId</b> - the message name,
                            <br />
                            <b>type</b>: string,
                            <br />
                            <b>example</b>: "App_LoadingStatus";
                        </li>
                        <li>
                            <b>SendTime</b> - the time the message was sent, expressed as milliseconds since midnight 1 January 1970 UTC,
                            <br />
                            <b>type</b>: integer,
                            <br />
                            <b>example</b>: 1329014075000;
                        </li>
                        <li>
                            <b>Values</b> - the message properties,
                            <br />
                            <b>type</b>: JSON object.
                        </li>
                    </ul>
                </td>
                <td>string or JSON object</td>
            </tr>
            <tr>
                <td id="targetOrigin" class="copy-link">targetOrigin</td>
                <td>
                    The <em>otherWindow</em> origin that must be for the event to be dispatched. 
                    It will be set to the <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#PostMessageOrigin">PostMessageOrigin</a> property provided in <em>CheckFileInfo</em>.
                    <br />
                    *<em>otherWindow</em> is a reference to another window that <em>msg</em> will be posted to.
                </td>
                <td>string</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <p>Here you can find the messages that are available for ONLYOFFICE Docs to send to the host page. The process of receiving messages by the online office will be available later.</p>
    <div class="header-gray">Available messages</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>MessageId</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td id="App_LoadingStatus" class="copy-link">App_LoadingStatus</td>
                <td>This message is posted after the online office application frame was loaded. 
                    Until the host receives this message, it must assume that the online office frame cannot react to any incoming messages except <a href="#Host_PostmessageReady">Host_PostmessageReady</a>.</td>
            </tr>
            <tr>
                <td id="Blur_Focus" class="copy-link">Blur_Focus</td>
                <td>This message is posted by the host to stop the online office application from aggressively grabbing focus.
                    Hosts should send this message whenever the host application UI is drawn over the online office frame so that the online office application does not interfere with the host UI behavior.
                    This message is used only for the edit modes. It does not affect view modes.</td>
            </tr>
            <tr>
                <td id="Edit_Notification" class="copy-link">Edit_Notification</td>
                <td>This message is posted when the user first makes an edit to a document, and every five minutes thereafter, if the user has made edits over the last five minutes. 
                    Hosts can use this message to gauge whether users are interacting with the online office. In co-authoring sessions, hosts cannot use the WOPI calls for this purpose.</td>
            </tr>
            <tr>
                <td id="File_Rename" class="copy-link">File_Rename</td>
                <td>This message is posted when the user renames the current file in the online office. The host can use this message to optionally update the UI, such as the page title.</td>
            </tr>
            <tr>
                <td id="Grab_Focus" class="copy-link">Grab_Focus</td>
                <td>This message is posted by the host to resume aggressively grabbing focus by the online office application.
                    Hosts should send this message whenever the host application UI that's drawn over the online office frame is closing. This lets the online office application resume functioning.
                    This message is used only for the edit modes. It does not affect view modes.</td>
            </tr>
            <tr>
                <td id="Host_PostmessageReady" class="copy-link">Host_PostmessageReady</td>
                <td>This message is posted by the host when it finishes loading. Then the online office frame receives <em>Host_PostmessageReady</em>,
                finishes loading, and sends the <a href="#App_LoadingStatus">App_LoadingStatus</a> message to the host page. After that, all the other PostMessage messages become available.</td>
            </tr>
            <tr>
                <td id="UI_Close" class="copy-link">UI_Close</td>
                <td>This message is posted when the online office application is closing, either due to an error or a user action.
                    To send this message, the <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#ClosePostMessage">ClosePostMessage</a> property in the <em>CheckFileInfo</em> response from the host must be set to <b>true</b>.
                    Otherwise, the online office will not send this message.</td>
            </tr>
            <tr>
                <td id="UI_Edit" class="copy-link">UI_Edit</td>
                <td>This message is posted when the user activates the <em>Edit</em> UI in the online office. This UI is only visible when using the view action.
                To send this message, the <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#EditModePostMessage">EditModePostMessage</a> property in the <em>CheckFileInfo</em> response from the host must be set to <b>true</b>.
                Otherwise, the online office will not send this message and will redirect the inner iframe to the edit action URL instead.</td>
            </tr>
            <tr>
                <td id="UI_FileVersions" class="copy-link">UI_FileVersions</td>
                <td>This message is posted when the user activates the <em>Previous Versions</em> UI in the online office. The host should use this message to trigger any custom file version history UI.
                To send this message, the <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#FileVersionPostMessage">FileVersionPostMessage</a> property in the <em>CheckFileInfo</em> response from the host must be set to <b>true</b>.
                Otherwise, the online office will not send this message.</td>
            </tr>
            <tr>
                <td id="UI_Sharing" class="copy-link">UI_Sharing</td>
                <td>This message is posted when the user activates the <em>Share</em> UI in the online office. The host should use this message to trigger any custom sharing UI.
                To send this message, the <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#FileSharingPostMessage">FileSharingPostMessage</a> property in the <em>CheckFileInfo</em> response from the host must be set to <b>true</b>.
                Otherwise, the online office will not send this message.</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Collabora specific</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>MessageId</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td id="Action_InsertGraphic" class="copy-link">Action_InsertGraphic</td>
                <td>This message is posted to download an image from the URL and insert it into the document.</td>
            </tr>
            <tr>
                <td id="UI_InsertGraphic" class="copy-link">UI_InsertGraphic</td>
                <td>This message is posted to display a user interface element (for example, a dialog) allowing the user to pick an image from the integration.
                The integration is supposed to provide a temporary URL that may be downloaded once, and return it back
                via the <a href="#Action_InsertGraphic">Action_InsertGraphic</a> message with <em>Values</em> set to the temporary URL.</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <note>Please note that the PostMessage messages have the higher priority than the <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#CloseUrl">CloseUrl</a>,
    <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#HostEditUrl">HostEditUrl</a>, <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#FileSharingUrl">FileSharingUrl</a>,
    <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#FileVersionUrl">FileVersionUrl</a> properties provided in <em>CheckFileInfo</em>.</note>
