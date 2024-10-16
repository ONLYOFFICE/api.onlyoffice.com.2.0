---
order: -5
---

*api.js* allows you to initialize the SDK in the following modes:

- [manager](Manager/index.md) - displays a list of entities depending on the specified *rootPath*;
- [room-selector](Room%20Selector/index.md) - opens the room selector;
- [file-selector](File%20Selector/index.md) - opens the file selector;
- [editor](Editor/index.md) - allows you to open the SDK as a document editor for editing by specifying the *id* parameter for a file;
- [viewer](Viewer/index.md) - allows you to open the SDK as a document editor for viewing by specifying the *id* parameter for a file;
- [system](System/index.md) - calls the system methods.

To simplify working with modes, the SDK has methods that do not require you to specify the appropriate mode:

## DocSpace.SDK

| Name                                                     | Description                                            |
| -------------------------------------------------------- | ------------------------------------------------------ |
| [initManager](../Methods/index.md#initmanager)           | Initializes the SDK frame in the "manager" mode.       |
| [initRoomSelector](../Methods/index.md#initroomselector) | Initializes the SDK frame in the "room-selector" mode. |
| [initFileSelector](../Methods/index.md#initfileselector) | Initializes the SDK frame in the "file-selector" mode. |
| [initEditor](../Methods/index.md#initeditor)             | Initializes the SDK frame in the "editor" mode.        |
| [initViewer](../Methods/index.md#initviewer)             | Initializes the SDK frame in the "viewer" mode.        |
| [initSystem](../Methods/index.md#initsystem)             | Initializes the SDK frame in the "system" mode.        |
