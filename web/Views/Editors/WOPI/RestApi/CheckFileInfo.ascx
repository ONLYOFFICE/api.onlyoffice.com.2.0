<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <a class="up" href="<%= Url.Action("wopi/restapi") %>"></a>
        <span class="hdr">CheckFileInfo</span>
    </h1>

    <div class="header-gray"><b>GET /wopi/files/<i>(file_id)</i></b></div>
    <p class="dscr">Returns information about the file properties, access rights and editor settings.</p>

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
                <td>file_id</td>
                <td>The file ID that must be URL safe.</td>
                <td>string</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Query parameters</div>
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
                <td>access_token</td>
                <td>An access token that the host will use to determine whether the request is authorized.</td>
                <td>string</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Request headers</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
            <col class="table-example" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
                <td>Type</td>
                <td>Presence</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>X-WOPI-SessionContext</td>
                <td>Session context if it is provided on the initial WOPI action URL.</td>
                <td>string</td>
                <td>optional</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

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
                <td id="Version" class="copy-link">Version</td>
                <td>The current version of the file based on the server file version schema. Every time the document is edited and saved, the version must be changed.
                The version values must never repeat for a given file.</td>
                <td>string</td>
                <td>"Khirz6zTPdfd7"</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

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
    <div class="mobile-content"></div>

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
                <td>A domain that the WOPI client must use as the <a href="<%= Url.Action("wopi/postmessage") %>#targetOrigin">targetOrigin</a> parameter when sending messages as described in <a href="https://html.spec.whatwg.org/multipage/web-messaging.html#posting-messages" target="_blank">[W3C-HTML5WEBMSG]</a>.</td>
                <td>string</td>
                <td>"https://exampledomain.com"</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

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
                <td id="CloseUrl" class="copy-link">CloseUrl</td>
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
    <div class="mobile-content"></div>

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
                <td id="CopyPasteRestrictions" class="copy-link">CopyPasteRestrictions</td>
                <td>Specifies if the WOPI client must disable the <b>Copy and Paste</b> functionality within the application.
                    By default, all <b>Copy and Paste</b> functionality is enabled, i.e. the setting has no effect. Possible property values:
                    <ul>
                        <li><b>BlockAll</b> - the <b>Copy and Paste</b> functionality is completely disabled within the application;</li>
                        <li><b>CurrentDocumentOnly</b> - the <b>Copy and Paste</b> functionality is enabled but content can only be copied and pasted within the file currently open in the application.</li>
                    </ul>
                </td>
                <td>string</td>
                <td>"BlockAll"</td>
            </tr>
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
            <tr>
                <td id="LastModifiedTime" class="copy-link">LastModifiedTime</td>
                <td>The last time when the file was modified. This time must always be a UTC time, and must be formatted in ISO 8601 round-trip format.
                This property can be specified as an alternative to the <a href="#Version">Version</a> property.</td>
                <td>string</td>
                <td>"2009-06-15T13:45:30.0000000Z"</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

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
            <tr>
                <td id="UserId" class="copy-link">UserId</td>
                <td>A unique user identifier that is specified by the WOPI server.</td>
                <td>string</td>
                <td>"uid-1"</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

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
                <td id="UserCanNotWriteRelative" class="copy-link">UserCanNotWriteRelative</td>
                <td>Specifies if the user has permissions to create new files on the WOPI server or not.
                The <b>true</b> value means that the <a href="<%= Url.Action("wopi/restapi/putrelativefile") %>">PutRelativeFile</a> execution will fail for this user on the current file.
                By default, this parameter is <b>false</b> and the <em>PutRelativeFile</em> operation is executed.</td>
                <td>boolean</td>
                <td>false</td>
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
    <div class="mobile-content"></div>

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
                <td id="SupportsLocks" class="copy-link">SupportsLocks</td>
                <td>Specifies if the WOPI server supports the <a href="<%= Url.Action("wopi/restapi/lock") %>">Lock</a>, <a href="<%= Url.Action("wopi/restapi/unlock") %>">Unlock</a>,
                and <a href="<%= Url.Action("wopi/restapi/refreshlock") %>">RefreshLock</a> operations.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
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
            <tr>
                <td id="SupportsUpdate" class="copy-link">SupportsUpdate</td>
                <td>Specifies if the WOPI server supports the <a href="<%= Url.Action("wopi/restapi/putfile") %>">PutFile</a> and <a href="<%= Url.Action("wopi/restapi/putrelativefile") %>">PutRelativeFile</a> operations.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

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
                <td id="EnableInsertRemoteImage" class="copy-link">EnableInsertRemoteImage</td>
                <td>Specifies whether to enable the menu entry and toolbar item which call the <a href="<%= Url.Action("wopi/postmessage") %>#UI_InsertGraphic">UI_InsertGraphic</a> message.
                This property is used to display a user interface element (for example, a dialog) allowing the user to pick an image from the integration.
                The integration is supposed to provide a temporary URL that may be downloaded once, and return it back
                via the <a href="<%= Url.Action("wopi/postmessage") %>#Action_InsertGraphic">Action_InsertGraphic</a> message with <em>Values</em> set to the temporary URL.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="HidePrintOption" class="copy-link">HidePrintOption</td>
                <td>Specifies if the WOPI server hides the print option from the file menu bar in the UI.</td>
                <td>boolean</td>
                <td>false</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>
