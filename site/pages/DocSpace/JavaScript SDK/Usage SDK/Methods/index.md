---
order: -2
---

After initializing SDK, you will get an object that can be used to call the methods:

``` ts
const docSpace = DocSpace.SDK.initManager({config})
```

- [addTagsToRoom](#addtagstoroom)
- [createFile](#createfile)
- [createFolder](#createfolder)
- [createHash](#createhash)
- [createRoom](#createroom)
- [createTag](#createtag)
- [destroyFrame](#destroyframe)
- [getConfig](#getconfig)
- [getFiles](#getfiles)
- [getFolderInfo](#getfolderinfo)
- [getFolders](#getfolders)
- [getHashSettings](#gethashsettings)
- [getList](#getlist)
- [getRooms](#getrooms)
- [getSelection](#getselection)
- [getUserInfo](#getuserinfo)
- [initEditor](#initeditor)
- [initFileSelector](#initfileselector)
- [initFrame](#initframe)
- [initManager](#initmanager)
- [initRoomSelector](#initroomselector)
- [initSystem](#initsystem)
- [initViewer](#initviewer)
- [login](#login)
- [logout](#logout)
- [openModal](#openmodal)
- [removeTagsFromRoom](#removetagsfromroom)
- [setConfig](#setconfig)
- [setIsLoaded](#setisloaded)
- [setListView](#setlistview)

## addTagsToRoom

Adds the specified tags to the room with the specified ID.

  ``` ts
  docSpace.addTagsToRoom(roomId, tags)
  ```

| Parameter | Type             | Presence | Description                                            |
| --------- | ---------------- | -------- | ------------------------------------------------------ |
| roomId    | string           | required | Defines the ID of a room where the tags will be added. |
| tags      | array of strings | required | Defines a list of tags to be added.                    |

## createFile

Creates a file with the specified parameters.

  ``` ts
  docSpace.createFile(folderId, title, templateId, formId)
  ```

| Parameter  | Type   | Presence | Description                                                       |
| ---------- | ------ | -------- | ----------------------------------------------------------------- |
| folderId   | string | required | Defines the ID of a folder where a file will be created.          |
| title      | string | required | Defines the file title.                                           |
| templateId | string | optional | Defines the ID of a template which will be used to create a file. |
| formId     | string | optional | Defines the ID of a form which will be used to create a file.     |

## createFolder

Creates a folder with the specified parameters.

  ``` ts
  docSpace.createFolder(parentFolderId, title)
  ```

| Parameter      | Type   | Presence | Description                                                       |
| -------------- | ------ | -------- | ----------------------------------------------------------------- |
| parentFolderId | string | required | Defines the ID of a parent folder where a folder will be created. |
| title          | string | required | Defines the folder title.                                         |

## createHash

Generates the hash string based on the specified hash settings.

  ``` ts
  docSpace.createHash(password, hashSettings)
  ```

| Parameter               | Type    | Presence | Description                                                                                                   |
| ----------------------- | ------- | -------- | ------------------------------------------------------------------------------------------------------------- |
| password                | string  | required | Defines a password to the DocSpace account.                                                                   |
| hashSettings            | object  | required | Defines the hash settings for generating the hash string.                                                     |
| hashSettings.size       | integer | required | Defines the hash size.                                                                                        |
| hashSettings.salt       | string  | required | Defines the hash salt - a randomly generated set of characters that is added to a password before hashing it. |
| hashSettings.iterations | integer | required | Defines a number of hash iterations.                                                                          |

## createRoom

Creates a room with the specified parameters.

  ``` ts
  docSpace.createRoom(title, type)
  ```

| Parameter | Type   | Presence | Description                                          |
| --------- | ------ | -------- | ---------------------------------------------------- |
| title     | string | required | Defines the room title.                              |
| type      | string | required | Defines the room type ("CustomRoom", "EditingRoom"). |

## createTag

Creates a tag with the specified name.

  ``` ts
  docSpace.createTag(name)
  ```

| Parameter | Type   | Presence | Description           |
| --------- | ------ | -------- | --------------------- |
| name      | string | required | Defines the tag name. |

## destroyFrame

Destroys the SDK frame, replacing it with the element passed to [destroyText](../Config/index.md#destroytext).

  ``` ts
  docSpace.destroyFrame()
  ```

## getConfig

Returns the SDK config.

  ``` ts
  docSpace.getConfig()
  ```

## getFiles

Returns the information about all files in the SDK frame.

  ``` ts
  docSpace.getFiles()
  ```

## getFolderInfo

Returns the information about the current directory opened in the SDK frame.

  ``` ts 
  docSpace.getFolderInfo()
  ```

## getFolders

Returns the information about all the folders in the SDK frame.

  ``` ts
  docSpace.getFolders()
  ```

## getHashSettings

Returns the DocSpace hash settings for generating a password hash.

  ``` ts
  docSpace.getHashSettings()
  ```

## getList

Returns the information about all files and folders in the SDK frame.

  ``` ts
  docSpace.getList()
  ```

## getRooms

Returns the information about rooms according to the specified filter parameters.

  ``` ts
  docSpace.getRooms(filter)
  ```

| Parameter | Type   | Presence | Description                                                                                                                       |
| --------- | ------ | -------- | --------------------------------------------------------------------------------------------------------------------------------- |
| filter    | object | required | The room [filter parameters](https://github.com/ONLYOFFICE/DocSpace-client/blob/master/packages/shared/api/rooms/filter.js#L183). |

## getSelection

Returns the information about the selected elements in the SDK frame.

  ``` ts
  docSpace.getSelection()
  ```

## getUserInfo

Returns the information about the current DocSpace user or null if there are no authorized users.

  ``` ts
  docSpace.getUserInfo()
  ```

## initEditor

Initializes the SDK frame in the "editor" mode.

  ``` ts
  docSpace.initEditor(config)
  ```

| Parameter | Type   | Presence | Description                                                                                                    |
| --------- | ------ | -------- | -------------------------------------------------------------------------------------------------------------- |
| config    | object | required | Defines the configuration parameters which describe the behavior and display options of the DocSpace elements. |

## initFileSelector

Initializes the SDK frame in the "file-selector" mode.

  ``` ts
  docSpace.initFileSelector(config)
  ```

| Parameter | Type   | Presence | Description                                                                                                    |
| --------- | ------ | -------- | -------------------------------------------------------------------------------------------------------------- |
| config    | object | required | Defines the configuration parameters which describe the behavior and display options of the DocSpace elements. |

## initFrame

Initializes the SDK frame dispaying the DocSpace page.

  ``` ts
  docSpace.initFrame(config)
  ```

| Parameter | Type   | Presence | Description                                                                                                    |
| --------- | ------ | -------- | -------------------------------------------------------------------------------------------------------------- |
| config    | object | required | Defines the configuration parameters which describe the behavior and display options of the DocSpace elements. |

## initManager

Initializes the SDK frame in the "manager" mode.

  ``` ts
  docSpace.initManager(config)
  ```

| Parameter | Type   | Presence | Description                                                                                                    |
| --------- | ------ | -------- | -------------------------------------------------------------------------------------------------------------- |
| config    | object | required | Defines the configuration parameters which describe the behavior and display options of the DocSpace elements. |

## initRoomSelector

Initializes the SDK frame in the "room-selector" mode.

  ``` ts
  docSpace.initRoomSelector(config)
  ```

| Parameter | Type   | Presence | Description                                                                                                    |
| --------- | ------ | -------- | -------------------------------------------------------------------------------------------------------------- |
| config    | object | required | Defines the configuration parameters which describe the behavior and display options of the DocSpace elements. |

## initSystem

Initializes the SDK frame in the "system" mode to call system methods. This lightweight frame displays a blank page with the loader.

  ``` ts
  docSpace.initSystem(config)
  ```

| Parameter | Type   | Presence | Description                                                                                                    |
| --------- | ------ | -------- | -------------------------------------------------------------------------------------------------------------- |
| config    | object | required | Defines the configuration parameters which describe the behavior and display options of the DocSpace elements. |

## initViewer

Initializes the SDK frame in the "viewer" mode.

  ``` ts
  docSpace.initViewer(config)
  ```

| Parameter | Type   | Presence | Description                                                                                                    |
| --------- | ------ | -------- | -------------------------------------------------------------------------------------------------------------- |
| config    | object | required | Defines the configuration parameters which describe the behavior and display options of the DocSpace elements. |

## login

Logs in to the DocSpace account using the specified email and password hash.

  ``` ts
  docSpace.login(email, passwordHash)
  ```

| Parameter    | Type   | Presence | Description                     |
| ------------ | ------ | -------- | ------------------------------- |
| email        | string | required | Defines the user email address. |
| passwordHash | string | required | Defines a password hash.        |

## logout

Logs out from the DocSpace account of the current user.

  ``` ts
  docSpace.logout()
  ```

## openModal

Opens the DocSpace modal window of the specified type.

  ``` ts
  docSpace.openModal(type)
  ```

| Parameter | Type   | Presence | Description                                                                          |
| --------- | ------ | -------- | ------------------------------------------------------------------------------------ |
| type      | string | required | Defines the DocSpace modal window type ("CreateFile", "CreateFolder", "CreateRoom"). |

## removeTagsFromRoom

Removes the specified tags from the room with the specified ID.

  ``` ts
  docSpace.removeTagsFromRoom(roomId, tags)
  ```

| Parameter | Type             | Presence | Description                                              |
| --------- | ---------------- | -------- | -------------------------------------------------------- |
| roomId    | string           | required | Defines the ID of a room where the tags will be removed. |
| tags      | array of strings | required | Defines a list of tags to be removed.                    |

## setConfig

Sets the specified config for the current SDK entity.

  ``` ts
  docSpace.setConfig(config)
  ```

| Parameter | Type   | Presence | Description                                                                                                    |
| --------- | ------ | -------- | -------------------------------------------------------------------------------------------------------------- |
| config    | object | required | Defines the configuration parameters which describe the behavior and display options of the DocSpace elements. |

## setIsLoaded

Disables the loader in the SDK window.

  ``` ts
  docSpace.setIsLoaded()
  ```

## setListView

Sets the display of entity lists according to the specified type.

  ``` ts
  docSpace.setListView(type)
  ```

| Parameter | Type   | Presence | Description                                                                             |
| --------- | ------ | -------- | --------------------------------------------------------------------------------------- |
| type      | string | required | Defines the way elements are arranged in the DocSpace manager ("row", "table", "tile"). |
