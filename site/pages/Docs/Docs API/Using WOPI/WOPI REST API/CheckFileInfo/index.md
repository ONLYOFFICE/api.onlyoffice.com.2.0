`GET /wopi/files/(file_id)`

Returns information about the file properties, access rights and editor settings.

## Parameters

| Name     | Description                        | Type   |
| -------- | ---------------------------------- | ------ |
| file\_id | The file ID that must be URL safe. | string |

## Query parameters

| Name          | Description                                                                            | Type   |
| ------------- | -------------------------------------------------------------------------------------- | ------ |
| access\_token | An access token that the host will use to determine whether the request is authorized. | string |

## Request headers

| Name                  | Description                                                       | Type   | Presence |
| --------------------- | ----------------------------------------------------------------- | ------ | -------- |
| X-WOPI-SessionContext | Session context if it is provided on the initial WOPI action URL. | string | optional |

## Required response properties

### BaseFileName

A file name without a path that is displayed in the user interface (UI) and determines the file extension.

Type: string

Example: "Example File Name.docx"

### Version

The current version of the file based on the server file version schema. Every time the document is edited and saved, the version must be changed. The version values must never repeat for a given file.

Type: string

Example: "Khirz6zTPdfd7"

## Breadcrumb properties

### BreadcrumbBrandName

A name that the WOPI client displays to the user to indicate the brand name of the WOPI server.

Type: string

Example: "Example Brand Name"

### BreadcrumbBrandUrl

URL to a web page that the WOPI client navigates to when the user clicks the UI displaying [BreadcrumbBrandName](#breadcrumbbrandname).

Type: string

Example: `https://example.com/url-to-breadcrumb-brand-page.com`

### BreadcrumbDocName

A file name that the WOPI client displays to the user. If this parameter is not specified, then the [BaseFileName](#basefilename) parameter is used.

Type: string

Example: "Example Breadcrumb File Name.docx"

### BreadcrumbFolderName

A name that the WOPI client displays to the user that indicates the name of the folder that contains the file.

Type: string

Example: "Example Folder Name" 

### BreadcrumbFolderUrl

URL to a web page that the WOPI client navigates to when the user clicks the UI displaying [BreadcrumbFolderName](#breadcrumbfoldername).

Type: string

Example: `https://example.com/url-to-breadcrumb-brand-folder`

## PostMessage properties

### ClosePostMessage

Specifies if the WOPI client should notify the WOPI server in case the user closes the rendering or editing client currently using this file. The host expects to receive the [UI\_Close](../../PostMessage/index.md#ui_close) PostMessage when the *Close* UI in the online office is activated.

Type: boolean

Example: true

### EditModePostMessage

Specifies if the WOPI client should notify the WOPI server in case the user tries to edit a file. The host expects to receive the [UI\_Edit](../../PostMessage/index.md#ui_edit) PostMessage when the *Edit* UI in the online office is activated.

Type: boolean

Example: true

### EditNotificationPostMessage

Specifies if the WOPI client should notify the WOPI server in case the user tries to edit a file. The host expects to receive the [Edit\_Notification](../../PostMessage/index.md#edit_notification) PostMessage.

Type: boolean

Example: true

### FileSharingPostMessage

Specifies if the WOPI client should notify the WOPI server in case the user tries to share a file. The host expects to receive the [UI\_Sharing](../../PostMessage/index.md#ui_sharing) PostMessage when the *Share* UI in the online office is activated.

Type: boolean

Example: true

### FileVersionPostMessage

Specifies if the WOPI client will notify the WOPI server in case the user tries to navigate to the previous file version. The host expects to receive the [UI\_FileVersions](../../PostMessage/index.md#ui_fileversions) PostMessage when the *Previous Versions* UI in the online office is activated.

Type: boolean

Example: true

### PostMessageOrigin

A domain that the WOPI client must use as the [targetOrigin](../../PostMessage/index.md#targetorigin) parameter when sending messages as described in [\[W3C-HTML5WEBMSG\]](https://html.spec.whatwg.org/multipage/web-messaging.html#posting-messages).

Type: string

Example: `https://exampledomain.com`

## File URL properties

### CloseUrl

URL to a web page that the implementer deems useful to the user in case the user closes the rendering or editing client currently using this file.

Type: string

Example: `https://example.com/url-to-close-page.com`

### FileSharingUrl

URL to the location that allows the user to share a file.

Type: string

Example: `https://example.com/url-to-sharing-page.com`

### FileVersionUrl

URL to the location that allows the user to view the previous file version.

Type: string

Example: `https://example.com/url-to-previous-version-page.com`

### HostEditUrl

URL to a web page where a file can be edited using the WOPI client.

Type: string

Example: `https://example.com/url-to-host-page.com`

## Other miscellaneous properties

### CopyPasteRestrictions

Specifies if the WOPI client must disable the **Copy and Paste** functionality within the application. By default, all **Copy and Paste** functionality is enabled, i.e. the setting has no effect. Possible property values:

- **BlockAll** - the **Copy and Paste** functionality is completely disabled within the application;
- **CurrentDocumentOnly** - the **Copy and Paste** functionality is enabled but content can only be copied and pasted within the file currently open in the application.

Type: string

Example: "BlockAll"

### DisablePrint

Specifies if the WOPI client must disable any print functionality under its control.

Type: boolean

Example: true

### FileExtension

A file extension which must begin with a ".".

Type: string

Example: ".docx"

### FileNameMaxLength

The maximum length of a file name, including the file extension, supported by the WOPI server.

Type: integer

Example: 20

### LastModifiedTime

The last time when the file was modified. This time must always be a UTC time, and must be formatted in ISO 8601 round-trip format. This property can be specified as an alternative to the [Version](#version) property.

Type: string

Example: "2009-06-15T13:45:30.0000000Z"

## User metadata properties

### IsAnonymousUser

Specifies if the user is anonymous.

Type: boolean

Example: true

### UserFriendlyName

A user name. If it is undefined, the WOPI client may be configured to use a placeholder string in some scenarios, or to show no name at all.

Type: string

Example: "John Smith"

### UserId

A unique user identifier that is specified by the WOPI server.

Type: string

Example: "uid-1"

## User permissions properties

### ReadOnly

Specifies if a file cannot be changed by the current user.

Type: boolean

Example: true

### UserCanNotWriteRelative

Specifies if the user has permissions to create new files on the WOPI server or not. The **true** value means that the [PutRelativeFile](../PutRelativeFile/index.md) execution will fail for this user on the current file. By default, this parameter is **false** and the *PutRelativeFile* operation is executed.

Type: boolean

Example: false

### UserCanRename

Specifies if the user has permissions to rename a file.

Type: boolean

Example: true

### UserCanReview

Specifies if the user has permissions to review a file.

Type: boolean

Example: true

### UserCanWrite

Specifies if the user has permissions to edit a file.

Type: boolean

Example: true

## WOPI host capabilities properties

### SupportsLocks

Specifies if the WOPI server supports the [Lock](../Lock/index.md), [Unlock](../Unlock/index.md), and [RefreshLock](../RefreshLock/index.md) operations.

Type: boolean

Example: true

### SupportsRename

Specifies if the WOPI server supports the renaming permission.

Type: boolean

Example: true

### SupportsReviewing

Specifies if the WOPI server supports the review permission.

Type: boolean

Example: true

### SupportsUpdate

Specifies if the WOPI server supports the [PutFile](../PutFile/index.md) and [PutRelativeFile](../PutRelativeFile/index.md) operations.

Type: boolean

Example: true

## Nextcloud/Collabora/Seafile properties

### EnableInsertRemoteImage

Specifies whether to enable the menu entry and toolbar item which call the [UI\_InsertGraphic](../../PostMessage/index.md#ui_insertgraphic) message. This property is used to display a user interface element (for example, a dialog) allowing the user to pick an image from the integration. The integration is supposed to provide a temporary URL that may be downloaded once, and return it back via the [Action\_InsertGraphic](../../PostMessage/index.md#action_insertgraphic) message with *Values* set to the temporary URL.

Type: boolean

Example: true

### HidePrintOption

Specifies if the WOPI server hides the print option from the file menu bar in the UI.

Type: boolean

Example: false
