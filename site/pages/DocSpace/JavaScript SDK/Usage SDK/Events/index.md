---
order: -3
---

When initializing the SDK frame, a number of events can be passed to the configuration, which will be executed at the appropriate moment:

- [onAppError](#onapperror)
- [onAppReady](#onappready)
- [onAuthSuccess](#onauthsuccess)
- [onCloseCallback](#onclosecallback)
- [onDownload](#ondownload)
- [onEditorCloseCallback](#oneditorclosecallback)
- [onSelectCallback](#onselectcallback)
- [onSignOut](#onsignout)

## onAppError

The function called when SDK is initialized with an error. This error is returned during the initialization.

Example:

  ``` ts
  function onAppError() {
    console.log("ONLYOFFICE DocSpace reports an error")
  }
  
  const docSpace = DocSpace.SDK.initManager({
    events: {
      onAppError,
    },
  })
  ```

## onAppReady

The function called when SDK is initialized successfully.

Example:

  ``` ts
  function onAppReady() {
    console.log("ONLYOFFICE DocSpace is ready")
  }
  
  const docSpace = DocSpace.SDK.initManager({
    events: {
      onAppReady,
    },
  })
  ```

## onAuthSuccess

The function called upon successful authorization.

Example:

  ``` ts
  function onAuthSuccess() {
    console.log("The authorization is successful.")
  }
  
  const docSpace = DocSpace.SDK.initManager({
    events: {
      "onAuthSuccess ": onAuthSuccess,
    },
  })
  ```

## onCloseCallback

The function called only in the [room-selector](../Initialization%20Modes/Room%20Selector/index.md) and [file-selector](../Initialization%20Modes/File%20Selector/index.md) modes when the room or file selector is closed or the selection is canceled.

Example:

  ``` ts
  function onCloseCallback() {
    console.log("The room selector is closed.")
  }
  
  const docSpace = DocSpace.SDK.initRoomSelector({
    events: {
      onCloseCallback,
    },
  })
  ```

## onDownload

The function called when firing events to download items from the manager. It returns a link to the download object. This event is called only when the [downloadToEvent](../Config/index.md#downloadtoevent) parameter is specified in the config.

Example:

  ``` ts
  function onDownload() {
    console.log("The 'New document' file has been downloaded.")
  }
  
  const docSpace = DocSpace.SDK.initManager({
    events: {
      onDownload,
    },
  })
  ```

## onEditorCloseCallback

The function called when the document editor is closed.

Example:

  ``` ts
  function onEditorCloseCallback() {
    console.log("The document editor is closed.")
  }
  
  const docSpace = DocSpace.SDK.initEditor({
    events: {
      onEditorCloseCallback,
    },
  })
  ```

## onSelectCallback

The function called only in the [room-selector](../Initialization%20Modes/Room%20Selector/index.md) and [file-selector](../Initialization%20Modes/File%20Selector/index.md) modes when a room or file is selected.

Example:

  ``` ts
  function onSelectCallback() {
    console.log("The 'New room' room was selected.")
  }
  
  const docSpace = DocSpace.SDK.initRoomSelector({
    events: {
      onSelectCallback,
    },
  })
  ```

The information about the selected item is returned:

  ``` json
  {
    "icon": "https://example.com/url-to-example-image.svg",
    "id": 34,
    "isSelected": false,
    "label": "roomName"
  }
  ```

where **example.com** is the name of the server with the ONLYOFFICE DocSpace installed.

| Parameter  | Type    | Presence | Description                                          |
| ---------- | ------- | -------- | ---------------------------------------------------- |
| icon       | string  | required | Defines the URL to the room/file icon.               |
| id         | integer | required | Defines the room/file ID.                            |
| isSelected | boolean | required | Specifies whether the current room/file is selected. |
| label      | string  | required | Defines the room/file label.                         |

## onSignOut

The function called when logging out of the user account.

Example:

  ``` ts
  function onSignOut() {
    console.log("The user is logging out of the DocSpace account.")
  }
  
  const docSpace = DocSpace.SDK.initManager({
    events: {
      "onSignOut ": onSignOut,
    },
  })
  ```
