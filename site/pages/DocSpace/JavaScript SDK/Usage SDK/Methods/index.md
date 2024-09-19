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

| Parameter | Description                                            | Type             | Presence |
| --------- | ------------------------------------------------------ | ---------------- | -------- |
| roomId    | Defines the ID of a room where the tags will be added. | string           | required |
| tags      | Defines a list of tags to be added.                    | array of strings | required |

## createFile

Creates a file with the specified parameters.

  ``` ts
  docSpace.createFile(folderId, title, templateId, formId)
  ```

| Parameter  | Description                                                       | Type   | Presence |
| ---------- | ----------------------------------------------------------------- | ------ | -------- |
| folderId   | Defines the ID of a folder where a file will be created.          | string | required |
| title      | Defines the file title.                                           | string | required |
| templateId | Defines the ID of a template which will be used to create a file. | string | optional |
| formId     | Defines the ID of a form which will be used to create a file.     | string | optional |

## createFolder

Creates a folder with the specified parameters.

  ``` ts
  docSpace.createFolder(parentFolderId, title)
  ```

| Parameter      | Description                                                       | Type   | Presence |
| -------------- | ----------------------------------------------------------------- | ------ | -------- |
| parentFolderId | Defines the ID of a parent folder where a folder will be created. | string | required |
| title          | Defines the folder title.                                         | string | required |

## createHash

Generates the hash string based on the specified hash settings.

  ``` ts
  docSpace.createHash(password, hashSettings)
  ```

| Parameter               | Description                                                                                                   | Type    | Presence |
| ----------------------- | ------------------------------------------------------------------------------------------------------------- | ------- | -------- |
| password                | Defines a password to the DocSpace account.                                                                   | string  | required |
| hashSettings            | Defines the hash settings for generating the hash string.                                                     | object  | required |
| hashSettings.size       | Defines the hash size.                                                                                        | integer | required |
| hashSettings.salt       | Defines the hash salt - a randomly generated set of characters that is added to a password before hashing it. | string  | required |
| hashSettings.iterations | Defines a number of hash iterations.                                                                          | integer | required |

## createRoom

Creates a room with the specified parameters.

  ``` ts
  docSpace.createRoom(title, type)
  ```

| Parameter | Description                                          | Type   | Presence |
| --------- | ---------------------------------------------------- | ------ | -------- |
| title     | Defines the room title.                              | string | required |
| type      | Defines the room type ("CustomRoom", "EditingRoom"). | string | required |

## createTag

Creates a tag with the specified name.

  ``` ts
  docSpace.createTag(name)
  ```

| Parameter | Description           | Type   | Presence |
| --------- | --------------------- | ------ | -------- |
| name      | Defines the tag name. | string | required |

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

| Parameter | Description                                                                                                                       | Type   | Presence |
| --------- | --------------------------------------------------------------------------------------------------------------------------------- | ------ | -------- |
| filter    | The room [filter parameters](https://github.com/ONLYOFFICE/DocSpace-client/blob/master/packages/shared/api/rooms/filter.js#L183). | object | required |

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

| Parameter | Description                                                                                                    | Type   | Presence |
| --------- | -------------------------------------------------------------------------------------------------------------- | ------ | -------- |
| config    | Defines the configuration parameters which describe the behavior and display options of the DocSpace elements. | object | required |

## initFileSelector

Initializes the SDK frame in the "file-selector" mode.

  ``` ts
  docSpace.initFileSelector(config)
  ```

| Parameter | Description                                                                                                    | Type   | Presence |
| --------- | -------------------------------------------------------------------------------------------------------------- | ------ | -------- |
| config    | Defines the configuration parameters which describe the behavior and display options of the DocSpace elements. | object | required |

## initFrame

Initializes the SDK frame dispaying the DocSpace page.

  ``` ts
  docSpace.initFrame(config)
  ```

| Parameter | Description                                                                                                    | Type   | Presence |
| --------- | -------------------------------------------------------------------------------------------------------------- | ------ | -------- |
| config    | Defines the configuration parameters which describe the behavior and display options of the DocSpace elements. | object | required |

## initManager

Initializes the SDK frame in the "manager" mode.

  ``` ts
  docSpace.initManager(config)
  ```

| Parameter | Description                                                                                                    | Type   | Presence |
| --------- | -------------------------------------------------------------------------------------------------------------- | ------ | -------- |
| config    | Defines the configuration parameters which describe the behavior and display options of the DocSpace elements. | object | required |

## initRoomSelector

Initializes the SDK frame in the "room-selector" mode.

  ``` ts
  docSpace.initRoomSelector(config)
  ```

| Parameter | Description                                                                                                    | Type   | Presence |
| --------- | -------------------------------------------------------------------------------------------------------------- | ------ | -------- |
| config    | Defines the configuration parameters which describe the behavior and display options of the DocSpace elements. | object | required |

## initSystem

Initializes the SDK frame in the "system" mode to call system methods. This lightweight frame displays a blank page with the loader.

  ``` ts
  docSpace.initSystem(config)
  ```

| Parameter | Description                                                                                                    | Type   | Presence |
| --------- | -------------------------------------------------------------------------------------------------------------- | ------ | -------- |
| config    | Defines the configuration parameters which describe the behavior and display options of the DocSpace elements. | object | required |

## initViewer

Initializes the SDK frame in the "viewer" mode.

  ``` ts
  docSpace.initViewer(config)
  ```

| Parameter | Description                                                                                                    | Type   | Presence |
| --------- | -------------------------------------------------------------------------------------------------------------- | ------ | -------- |
| config    | Defines the configuration parameters which describe the behavior and display options of the DocSpace elements. | object | required |

## login

Logs in to the DocSpace account using the specified email and password hash.

  ``` ts
  docSpace.login(email, passwordHash)
  ```

| Parameter    | Description                     | Type   | Presence |
| ------------ | ------------------------------- | ------ | -------- |
| email        | Defines the user email address. | string | required |
| passwordHash | Defines a password hash.        | string | required |

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

| Parameter | Description                                                                          | Type   | Presence |
| --------- | ------------------------------------------------------------------------------------ | ------ | -------- |
| type      | Defines the DocSpace modal window type ("CreateFile", "CreateFolder", "CreateRoom"). | string | required |

## removeTagsFromRoom

Removes the specified tags from the room with the specified ID.

  ``` ts
  docSpace.removeTagsFromRoom(roomId, tags)
  ```

| Parameter | Description                                              | Type             | Presence |
| --------- | -------------------------------------------------------- | ---------------- | -------- |
| roomId    | Defines the ID of a room where the tags will be removed. | string           | required |
| tags      | Defines a list of tags to be removed.                    | array of strings | required |

## setConfig

Sets the specified config for the current SDK entity.

  ``` ts
  docSpace.setConfig(config)
  ```

| Parameter | Description                                                                                                    | Type   | Presence |
| --------- | -------------------------------------------------------------------------------------------------------------- | ------ | -------- |
| config    | Defines the configuration parameters which describe the behavior and display options of the DocSpace elements. | object | required |

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

| Parameter | Description                                                                             | Type   | Presence |
| --------- | --------------------------------------------------------------------------------------- | ------ | -------- |
| type      | Defines the way elements are arranged in the DocSpace manager ("row", "table", "tile"). | string | required |
