`GET /wopi/files/(file_id)`

The *CheckFileInfo* operation must be implemented for all WOPI actions. This operation returns information about a file, a user's permissions on that file, and general information about the capabilities that the WOPI host has on the file. Also, some CheckFileInfo properties can influence the appearance and behavior of WOPI clients.

## Parameters

| Name     | Type   | Description                                                         |
| -------- | ------ | ------------------------------------------------------------------- |
| file\_id | string | The ID of a file managed by the host. This string must be URL safe. |

## Query parameters

| Name          | Type   | Description                                                                        |
| ------------- | ------ | ---------------------------------------------------------------------------------- |
| access\_token | string | An access token that the host uses to determine whether the request is authorized. |

## Request headers

| Name                  | Type   | Presence | Description                                                       |
| --------------------- | ------ | -------- | ----------------------------------------------------------------- |
| X-WOPI-SessionContext | string | optional | Session context if it is provided on the initial WOPI action URL. |

## Required response properties

> Please note that the default value for any response string value is the empty string.

### BaseFileName

A name of the file, including extension, without a path. Used for display in user interface (UI), and determining the extension of the file.

Type: string

Example: "Example File Name.docx"

### Version

The current version of the file based on the server's file version schema. This value must change when the file changes, and version values must never repeat for a given file.

Type: string

Example: "Khirz6zTPdfd7"

## Breadcrumb properties

### BreadcrumbBrandName

The brand name of the host.

Type: string

Example: "Example Brand Name"

### BreadcrumbBrandUrl

A URI to a web page that the WOPI client should navigate to when the user clicks on UI that displays [BreadcrumbBrandName](#breadcrumbbrandname).

Type: string

Example: `https://example.com/url-to-breadcrumb-brand-page.com`

### BreadcrumbDocName

A file name that the WOPI client displays to the user. If this parameter is not specified, then the [BaseFileName](#basefilename) parameter is used.

Type: string

Example: "Example Breadcrumb File Name.docx"

### BreadcrumbFolderName

The name of the container that contains the file.

Type: string

Example: "Example Folder Name" 

### BreadcrumbFolderUrl

A URI to a web page that the WOPI client should navigate to when the user clicks on UI that displays [BreadcrumbFolderName](#breadcrumbfoldername).

Type: string

Example: `https://example.com/url-to-breadcrumb-brand-folder`

## PostMessage properties

### ClosePostMessage

Specifies if the host expects to receive the [UI\_Close](../../PostMessage/index.md#ui_close) PostMessage when the **Close** UI in the online office is activated.

Type: boolean

Example: true

### EditModePostMessage

Specifies if the host expects to receive the [UI\_Edit](../../PostMessage/index.md#ui_edit) PostMessage when the *Edit* UI in the online office is activated. If this property is not set to *true*, the online office navigates the inner iframe URL to an edit action URL when the *Edit* UI is activated.

Type: boolean

Example: true

### EditNotificationPostMessage

Specifies if the host expects to receive the [Edit\_Notification](../../PostMessage/index.md#edit_notification) PostMessage.

Type: boolean

Example: true

### FileSharingPostMessage

Specifies if the host expects to receive the [UI\_Sharing](../../PostMessage/index.md#ui_sharing) PostMessage when the *Share* UI in the online office is activated.

Type: boolean

Example: true

### FileVersionPostMessage

Specifies if the host expects to receive the [UI\_FileVersions](../../PostMessage/index.md#ui_fileversions) PostMessage when the *Previous Versions* UI in the online office is activated.

Type: boolean

Example: true

### PostMessageOrigin

A domain that the [host page](../../Host%20page/index.md) is sending and receiving PostMessages to and from. The online office only sends outgoing PostMessages to this domain, and only listens to PostMessages from this domain.

Type: string

Example: `https://exampledomain.com`

## File URL properties

### CloseUrl

A URI to a web page that the WOPI client should navigate to when the application closes, or in the event of an unrecoverable error.

Type: string

Example: `https://example.com/url-to-close-page.com`

### FileSharingUrl

A URI to a location that allows the user to share the file.

Type: string

Example: `https://example.com/url-to-sharing-page.com`

### FileVersionUrl

A URI to a location that lets the user view the version history for the file.

Type: string

Example: `https://example.com/url-to-previous-version-page.com`

### HostEditUrl

A URI to a host page that loads the edit WOPI action.

Type: string

Example: `https://example.com/url-to-host-page.com`

## Other miscellaneous properties

### CopyPasteRestrictions

Specifies if the WOPI client should disable the **Copy and Paste** functionality within the application. By default, all **Copy and Paste** functionality is enabled, i.e. the setting has no effect. Possible property values:

- **BlockAll** - the **Copy and Paste** functionality is completely disabled within the application;
- **CurrentDocumentOnly** - the **Copy and Paste** functionality is enabled but content can only be copied and pasted within the file currently open in the application.

Type: string

Example: "BlockAll"

### DisablePrint

Specifies if the WOPI client should disable all print functionality.

Type: boolean

Example: true

### FileExtension

A file extension which must begin with a ".". If provided, WOPI clients will use this value as the file extension. Otherwise the extension will be parsed from the [BaseFileName](#basefilename).

Type: string

Example: ".docx"

### FileNameMaxLength

The maximum length for file names that the WOPI host supports, excluding the file extension. The default value is 250. Note that WOPI clients will use this default value if the property is omitted or if it is explicitly set to 0.

Type: integer

Example: 20

### LastModifiedTime

The last time that the file was modified. This time must always be a UTC time, and must be formatted in ISO 8601 round-trip format. This property can be specified as an alternative to the [Version](#version) property.

Type: string

Example: "2009-06-15T13:45:30.0000000Z"

## User metadata properties

### IsAnonymousUser

Specifies if the user is authenticated with the host or not. Hosts should always set this to *true* for unauthenticated users, so that clients are aware that the user is anonymous.

Type: boolean

Example: true

### UserFriendlyName

The name of the user, suitable for displaying in UI.

Type: string

Example: "John Smith"

### UserId

A value uniquely identifying the user currently accessing the file.

Type: string

Example: "uid-1"

## User permissions properties

### ReadOnly

Specifies if a file cannot be changed by the current user.

Type: boolean

Example: true

### UserCanNotWriteRelative

Specifies if the user has sufficient permission to create new files on the WOPI server. The **true** value means that the [PutRelativeFile](../PutRelativeFile/index.md) execution will fail for this user on the current file. By default, this parameter is **false** and the *PutRelativeFile* operation is executed.

Type: boolean

Example: false

### UserCanRename

Specifies if the user has permissions to rename the current file.

Type: boolean

Example: true

### UserCanReview

Specifies if the user has permissions to review the current file.

Type: boolean

Example: true

### UserCanWrite

Specifies if the user has permissions to alter the file.

Type: boolean

Example: true

## WOPI host capabilities properties

### SupportsLocks

Specifies if the host supports the [Lock](../Lock/index.md), [Unlock](../Unlock/index.md), and [RefreshLock](../RefreshLock/index.md) operations.

Type: boolean

Example: true

### SupportsRename

Specifies if the WOPI server supports the renaming permission.

Type: boolean

Example: true

### SupportsReviewing

Specifies if the host supports the review permission.

Type: boolean

Example: true

### SupportsUpdate

Specifies if the host supports the [PutFile](../PutFile/index.md) and [PutRelativeFile](../PutRelativeFile/index.md) operations.

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
