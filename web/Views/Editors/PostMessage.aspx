<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    PostMessage
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">PostMessage</span>
    </h1>

    <p class="dscr">
        PostMessage is the  <a href="https://www.w3.org/TR/2011/WD-webmessaging-20110317/" target="_blank">HTML5 Web Messaging</a> protocol which allows exchanging messages in the browser between the iframe storage and ONLYOFFICE Docs. 
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
                <td>msg</td>
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
                            <b>type</b>: long,
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
                <td>targetOrigin</td>
                <td>
                    The <em>otherWindow</em> origin that must be for the event to be dispatched. 
                    It will be set to the <a href="<%= Url.Action("restapi") %>#PostMessageOrigin">PostMessageOrigin</a> property provided in <a href="<%= Url.Action("restapi") %>#CheckFileInfo">CheckFileInfo</a>.
                    <br />
                    *<em>otherWindow</em> is a reference to another window that msg will be posted to.
                </td>
                <td>string</td>
            </tr>
        </tbody>
    </table>

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
                <td>This message is posted after online office application frame were loaded. 
                    Until the host receives this message, it must assume that online office frame cannot react to any incoming messages except <em>Host_PostmessageReady</em>.</td>
            </tr>
            <tr>
                <td id="Edit_Notification" class="copy-link">Edit_Notification</td>
                <td>This message is posted when the user first makes an edit to a document, and every five minutes thereafter, if the user has made edits in the last five minutes. 
                    Hosts can use this message to gauge whether users are interacting with online office. In co-authoring sessions, hosts cannot use the WOPI calls for this purpose.</td>
            </tr>
            <tr>
                <td id="File_Rename" class="copy-link">File_Rename</td>
                <td>This message is posted when the user renames the current file in online office. The host can use this message to optionally update the UI, such as the page title.</td>
            </tr>
            <tr>
                <td id="UI_Close" class="copy-link">UI_Close</td>
                <td>This message is posted when online office application are closing, either due to an error or a user action. 
                    Typically, the URL specified in the <a href="<%= Url.Action("restapi") %>#CloseURL">CloseURL</a> property in the <a href="<%= Url.Action("restapi") %>#CheckFileInfo">CheckFileInfo</a> response is displayed. 
                    However, hosts can intercept this message instead and navigate in an appropriate way.</td>
            </tr>
            <tr>
                <td id="UI_Edit" class="copy-link">UI_Edit</td>
                <td>This message is posted when the user activates the <em>Edit</em> UI in online office. This UI is only visible when using the view action.</td>
            </tr>
            <tr>
                <td id="UI_FileVersions" class="copy-link">UI_FileVersions</td>
                <td>This message is posted when the user activates the <em>Previous Versions</em> UI in online office. The host should use this message to trigger any custom file version history UI.</td>
            </tr>
            <tr>
                <td id="UI_Sharing" class="copy-link">UI_Sharing</td>
                <td>This message is posted when the user activates the <em>Share</em> UI in online office. The host should use this message to trigger any custom sharing UI.</td>
            </tr>
        </tbody>
    </table>

</asp:Content>
