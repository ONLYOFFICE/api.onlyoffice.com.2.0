---
order: -4
---

The configuration parameters describe the behavior and display options of the DocSpace elements.

## buttonColor

The selector button color.

Type: string

Example: "#5299E0"

## checkCSP

Specifies whether to check for the presence of CSP headers before initialization.

Type: boolean

Example: true

## destroyText

The text that will be inserted into the *div* tag when the [destroyFrame](../Methods/index.md#destroyframe) method is called.

Type: string

Example: ""

## disableActionButton

Specifies whether to disable the **Actions** button in the manager interface.

Type: boolean

Example: false

## downloadToEvent

Specifies whether to switch the SDK to the mode of working with download links through the [onDownload](../Events/index.md#ondownload) event.

Type: boolean

Example: false

## editorCustomization

The parameters to customize editors. The parameters from [this section](../../../../Docs/Docs%20API/Usage%20API/Config/Editor/Customization/index.md) are used.

Type: object

Example: {}

## editorGoBack

Specifies whether the **File Location** button is displayed in the editor.

Type: boolean

Example: true

## editorType

The editor mode display type ("embedded", "desktop").

Type: string

Example: "desktop"

## events

A list of DocSpace events that will be returned on certain actions within the SDK.

Type: object

Example:

``` ts
const events = {
  onSelectCallback: null,
  onCloseCallback: null,
  onAppReady: null,
  onAppError: null,
  onEditorCloseCallback: null,
  onAuthSuccess: null,
  onSignOut: null,
  onDownload: null,
}
```

## filter

The filter parameters that facilitate searching files in the DocSpace manager.

Type: object

Example:

``` ts
const filter = {
  count: 100,
  page: 1,
  search: "",
  sortorder: "descending",
  sortby: "DateAndTime",
  withSubfolders: false,
}
```

### filter.count

A number of files to be displayed.

Type: integer

Example: 100

### filter.page

A page number.

Type: integer

Example: 1

### filter.search

A query to search for files.

Type: string

Example: ""

### filter.sortorder

The sort order of files ("descending", "ascending").

Type: string

Example: "descending"

### filter.sortby

The parameter by which the files will be sorted ("DateAndTime", "AZ", "Type", "Size", "DateAndTimeCreation", "Author").

Type: string

Example: "DateAndTime"

### filter.withSubfolders

Specifies whether to exclude subfolders when searching for files.

Type: boolean

Example: false

## filterParam

The filter parameters that facilitate searching files in the selector mode. The possible values: *"ALL", "DOCX", "IMG", "GZ", "DOCXF", "XLSX", "BackupOnly"*.

Type: string

Example: "ALL"

## frameId

The frame SDK ID which is used to refer to the SDK instance.

Type: string

Example: "ds-frame"

## height

The frame SDK height measured in percent.

Type: string

Example: "100%"

## id

The element ID which will be used in the SDK initialization modes.

Type: string

Example: null

## infoPanelVisible

Specifies whether to display a button to show the info panel in the manager.

Type: boolean

Example: true

## locale

The language of the DocSpace user interface which is specified with the four letter language code.

Type: string

Example: null

## mode

The SDK [initialization mode](../Initialization%20Modes/index.md) ("manager", "file-selector", "room-selector", "editor", "viewer", "system").

Type: string

Example: "manager"

## name

The name of the object inserted into the page. It is used for messaging at the SDK level.

Type: string

Example: "frameDocSpace"

## requestToken

The request token that is used to open public rooms and files in public rooms.

Type: string

Example: null

## rootPath

The path to the frame SDK. Opens a list of rooms by default.

Type: string

Example: "/rooms/shared/"

## selectorType

The selector type that defines filters for elements in the selector mode. The possible values: *"roomsOnly", "userFolderOnly", "exceptPrivacyTrashArchiveFolders", "exceptSortedByTagsFolders"*.

Type: string

Example: "roomsOnly"

## showFilter

Specifies whether the interface filter is displayed in the DocSpace manager.

Type: boolean

Example: false

## showHeader

Specifies whether the interface header is displayed in the mobile view manager.

Type: boolean

Example: false

## showMenu

Specifies whether the interface menu is displayed in the DocSpace manager.

Type: boolean

Example: false

## showSelectorCancel

Specifies whether the **Cancel** button is displayed in the selector mode.

Type: boolean

Example: false

## showSelectorHeader

Specifies whether the interface header is displayed in the selector mode.

Type: boolean

Example: false

## showSettings

Specifies whether to display the **Manage displayed columns** button for configuring the table columns in the manager.

Type: boolean

Example: false

## showSignOut

Specifies whether the **Sign out** button is displayed.

Type: boolean

Example: true

## showTitle

Specifies whether the interface title is displayed in the DocSpace manager.

Type: boolean

Example: true

## src

The base URL to the DocSpace portal. It is used to generate links.

Type: string

Example: {PORTAL\_SRC}

## theme

The DocSpace user interface theme ("Base", "Dark", "System").

Type: string

Example: "Base"

## type

The platform type which is used by the browser and affects the parameters of the inserted object ("desktop", "mobile").

Type: string

Example: "desktop"

## viewAs

The way elements are arranged in the DocSpace manager ("row", "table", "tile").

Type: string

Example: "row"

## viewTableColumns

The column names that are displayed for the table in the manager.

Type: string

Example: "Name,Type,Tags"

## width

The frame SDK width measured in percent.

Type: string

Example: "100%"

## withBreadCrumbs

Specifies whether to display the breadcrumbs in the selector mode.

Type: boolean

Example: true

## withSearch

Specifies whether to display **Search** in the selector mode.

Type: boolean

Example: true

## withSubtitle

Specifies whether to display the filter parameters in the selector mode.

Type: boolean

Example: true

## Example

``` ts
const config = {
  buttonColor: "#5299E0",
  destroyText: "",
  checkCSP: true,
  disableActionButton: false,
  downloadToEvent: false,
  editorCustomization: {},
  editorGoBack: true,
  editorType: "desktop",
  events: {
    onSelectCallback: null,
    onCloseCallback: null,
    onAppReady: null,
    onAppError: null,
    onEditorCloseCallback: null,
    onAuthSuccess: null,
    onSignOut: null,
    onDownload: null,
  },
  filter: {
    count: 100,
    page: 1,
    search: "",
    sortorder: "descending",
    sortby: "DateAndTime",
    withSubfolders: false,
  },
  filterParam: "ALL",
  frameId: "ds-frame",
  height: "100%",
  id: null,
  infoPanelVisible: true,
  locale: null,
  mode: "manager",
  name: "frameDocSpace",
  requestToken: null,
  rootPath: "/rooms/shared/",
  selectorType: "exceptPrivacyTrashArchiveFolders",
  showFilter: false,
  showHeader: false,
  showMenu: false,
  showSelectorCancel: false,
  showSelectorHeader: false,
  showSettings: false,
  showSignOut: true,
  showTitle: true,
  src: {PORTAL_SRC},
  theme: "Base",
  type: "desktop",
  viewAs: "row",
  viewTableColumns: "Name,Type,Tags",
  width: "100%",
  withBreadCrumbs: true,
  withSearch: true,
  withSubtitle: true,
}
```
