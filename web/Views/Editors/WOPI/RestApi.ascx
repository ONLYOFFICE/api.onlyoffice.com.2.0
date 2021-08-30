<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <a class="up" href="<%= Url.Action("wopi/") %>"></a>
        <span class="hdr">WOPI REST API</span>
    </h1>

    <p class="dscr">
        <b>WOPI REST API</b> specifies a set of operations that enables a client to access and change files stored on a server.
    </p>
    <p>ONLYOFFICE Docs uses the following WOPI operations:</p>
    <ul>
        <li><a href="#CheckFileInfo">CheckFileInfo</a></li>
        <li><a href="#Lock">Lock</a></li>
        <li><a href="#RenameFile">RenameFile</a></li>
        <li><a href="#Unlock">Unlock</a></li>
        <li><a href="#GetFile">GetFile</a></li>
        <li><a href="#PutFile">PutFile</a></li>
    </ul>


    <h2 id="CheckFileInfo" class="copy-link">CheckFileInfo</h2>

    <p>Returns information about the file properties, access rights and editor settings.</p>

    <div class="header-gray">Required response properties</div>
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
            <tr>
                <td id="BaseFileName" class="copy-link">BaseFileName</td>
                <td>A file name without a path that is displayed in the user interface (UI) and determines the file extension.</td>
                <td>string</td>
                <td>"Example File Name.docx"</td>
            </tr>
            <tr>
                <td id="UserId" class="copy-link">UserId</td>
                <td>A unique user identifier that is specified by the WOPI server.</td>
                <td>string</td>
                <td>"uid-1"</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">Breadcrumb properties</div>
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
            <tr>
                <td id="BreadcrumbBrandName" class="copy-link">BreadcrumbBrandName</td>
                <td>A name that the WOPI client displays to the user to indicate the brand name of the WOPI server.</td>
                <td>string</td>
                <td>"Example Brand Name"</td>
            </tr>
            <tr>
                <td id="BreadcrumbBrandUrl" class="copy-link">BreadcrumbBrandUrl</td>
                <td>URL to a web page that the WOPI client navigates to when the user clicks the UI displaying <a href="#BreadcrumbBrandName">BreadcrumbBrandName</a>.</td>
                <td>string</td>
                <td>"https://example.com/url-to-breadcrumb-brand-page.com"</td>
            </tr>
            <tr>
                <td id="BreadcrumbDocName" class="copy-link">BreadcrumbDocName</td>
                <td>A file name that the WOPI client displays to the user. If this parameter is not specified, then the <a href="#BaseFileName">BaseFileName</a> parameter is used.</td>
                <td>string</td>
                <td>"Example Breadcrumb File Name.docx"</td>
            </tr>
            <tr>
                <td id="BreadcrumbFolderName" class="copy-link">BreadcrumbFolderName</td>
                <td>A name that the WOPI client displays to the user that indicates the name of the folder that contains the file.</td>
                <td>string</td>
                <td>"Example Folder Name"</td>
            </tr>
            <tr>
                <td id="BreadcrumbFolderUrl" class="copy-link">BreadcrumbFolderUrl</td>
                <td>URL to a web page that the WOPI client navigates to when the user clicks the UI displaying <a href="#BreadcrumbFolderName">BreadcrumbFolderName</a>.</td>
                <td>string</td>
                <td>"https://example.com/url-to-breadcrumb-brand-folder"</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">PostMessage properties</div>
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
            <tr>
                <td id="ClosePostMessage" class="copy-link">ClosePostMessage</td>
                <td>Specifies if the WOPI client should notify the WOPI server in case the user closes the rendering or editing client currently using this file. 
                    The host expects to receive the <a href="<%= Url.Action("wopi/postmessage") %>#UI_Close">UI_Close</a> PostMessage when the <em>Close</em> UI in the online office is activated.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="EditModePostMessage" class="copy-link">EditModePostMessage</td>
                <td>Specifies if the WOPI client should notify the WOPI server in case the user tries to edit a file. 
                    The host expects to receive the <a href="<%= Url.Action("wopi/postmessage") %>#UI_Edit">UI_Edit</a> PostMessage when the <em>Edit</em> UI in the online office is activated.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="EditNotificationPostMessage" class="copy-link">EditNotificationPostMessage</td>
                <td>Specifies if the WOPI client should notify the WOPI server  in case the user tries to edit a file. 
                    The host expects to receive the <a href="<%= Url.Action("wopi/postmessage") %>#Edit_Notification">Edit_Notification</a> PostMessage.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="FileSharingPostMessage" class="copy-link">FileSharingPostMessage</td>
                <td>Specifies if the WOPI client should notify the WOPI server in case the user tries to share a file. 
                    The host expects to receive the <a href="<%= Url.Action("wopi/postmessage") %>#UI_Sharing">UI_Sharing</a> PostMessage when the <em>Share</em> UI in the online office is activated.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="FileVersionPostMessage" class="copy-link">FileVersionPostMessage</td>
                <td>Specifies if the WOPI client will notify the WOPI server in case the user tries to navigate to the previous file version. 
                    The host expects to receive the <a href="<%= Url.Action("wopi/postmessage") %>#UI_FileVersions">UI_FileVersions</a> PostMessage when the <em>Previous Versions</em> UI in the online office is activated.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="PostMessageOrigin" class="copy-link">PostMessageOrigin</td>
                <td>A domain that the WOPI client must use as the <a href="<%= Url.Action("wopi/postmessage") %>#targetOrigin">targetOrigin</a> parameter when sending messages as described in <a href="https://html.spec.whatwg.org/multipage/" target="_blank">[W3C-HTML5WEBMSG]</a>.</td>
                <td>string</td>
                <td>"https://exampledomain.com"</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">File URL properties</div>
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
            <tr>
                <td id="CloseURL" class="copy-link">CloseURL</td>
                <td>URL to a web page that the implementer deems useful to the user in case the user closes the rendering or editing client currently using this file.</td>
                <td>string</td>
                <td>"https://example.com/url-to-close-page.com"</td>
            </tr>
            <tr>
                <td id="FileSharingUrl" class="copy-link">FileSharingUrl</td>
                <td>URL to the location that allows the user to share a file.</td>
                <td>string</td>
                <td>"https://example.com/url-to-sharing-page.com"</td>
            </tr>
            <tr>
                <td id="FileVersionUrl" class="copy-link">FileVersionUrl</td>
                <td>URL to the location that allows the user to view the previous file version.</td>
                <td>string</td>
                <td>"https://example.com/url-to-previous-version-page.com"</td>
            </tr>
            <tr>
                <td id="HostEditUrl" class="copy-link">HostEditUrl</td>
                <td>URL to a web page where a file can be edited using the WOPI client.</td>
                <td>string</td>
                <td>"https://example.com/url-to-host-page.com"</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">Other miscellaneous properties</div>
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
            <tr>
                <td id="DisablePrint" class="copy-link">DisablePrint</td>
                <td>Specifies if the WOPI client must disable any print functionality under its control.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="FileExtension" class="copy-link">FileExtension</td>
                <td>A file extension which must begin with a ".".</td>
                <td>string</td>
                <td>".docx"</td>
            </tr>
            <tr>
                <td id="FileNameMaxLength" class="copy-link">FileNameMaxLength</td>
                <td>The maximum length of a file name, including the file extension, supported by the WOPI server.</td>
                <td>integer</td>
                <td>20</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">User metadata properties</div>
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
            <tr>
                <td id="IsAnonymousUser" class="copy-link">IsAnonymousUser</td>
                <td>Specifies if the user is anonymous.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="UserFriendlyName" class="copy-link">UserFriendlyName</td>
                <td>A user name. If it is undefined, the WOPI client may be configured to use a placeholder string in some scenarios, or to show no name at all.</td>
                <td>string</td>
                <td>"John Smith"</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">User permissions properties</div>
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
            <tr>
                <td id="ReadOnly" class="copy-link">ReadOnly</td>
                <td>Specifies if a file cannot be changed by the current user.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="UserCanRename" class="copy-link">UserCanRename</td>
                <td>Specifies if the user has permissions to rename a file.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="UserCanReview" class="copy-link">UserCanReview</td>
                <td>Specifies if the user has permissions to review a file.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="UserCanWrite" class="copy-link">UserCanWrite</td>
                <td>Specifies if the user has permissions to edit a file.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">WOPI host capabilities properties</div>
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
            <tr>
                <td id="SupportsRename" class="copy-link">SupportsRename</td>
                <td>Specifies if the WOPI server supports the renaming permission.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="SupportsReviewing" class="copy-link">SupportsReviewing</td>
                <td>Specifies if the WOPI server supports the review permission.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">Nextcloud/Collabora/Seafile properties</div>
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
            <tr>
                <td id="HidePrintOption" class="copy-link">HidePrintOption</td>
                <td>Specifies if the WOPI server hides the print option from the file menu bar in the UI.</td>
                <td>boolean</td>
                <td>false</td>
            </tr>
        </tbody>
    </table>


    <h2 id="Lock" class="copy-link">Lock</h2>

    <p>Locks file editing.</p>


    <h2 id="RenameFile" class="copy-link">RenameFile</h2>

    <p>Renames a file.</p>


    <h2 id="Unlock" class="copy-link">Unlock</h2>

    <p>Allows for file editing.</p>


    <h2 id="GetFile" class="copy-link">GetFile</h2>

    <p>Requests a message to retrieve a file for the <em>HTTP://server/&lt;...&gt;/wopi*/files/&lt;id&gt;/contents</em> operation.</p>


    <h2 id="PutFile" class="copy-link">PutFile</h2>

    <p>Requests a message to update a file for the <em>HTTP://server/&lt;...&gt;/wopi*/files/&lt;id&gt;/contents</em> operation.</p>
