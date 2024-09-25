---
order: -2
---

Describes an item that allows the plugin to control clicking on the specified file type. It does not work with the files that already have some actions.

## extension

Defines the file extension. If several plugins have the same extension, the last plugin from this list is taken.

Type: string

Example: ".drawio"

## onClick

Defines a function that takes the *File* object with the file data as an argument. This function can be asynchronous. It will be executed when the user clicks on a file with the required extension.

Type: func

Example: `async (item: File) => {}`

## usersType

Defines the types of users who will see the current item in the context menu. Currently the following user types are available: **owner**, **docSpaceAdmin**, **roomAdmin**, **collaborator**, **user**. If this parameter is not specified, then the current context menu item will be displayed for all user types.

Type: array of [UsersType](https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/enums/UsersType.ts)

Example: \[UsersType.owner, UsersType.docSpaceAdmin, UsersType.roomAdmin]

## devices

Defines the types of devices where the current item will be displayed in the context menu. At the moment the following device types are available: **mobile**, **tablet**, **desktop**. If this parameter is not specified, then the current context menu item will be displayed in any device types.

Type: array of [Devices](https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/enums/Devices.ts)

Example: \[Devices.desktop]

## fileTypeName

Defines a file type which is displayed in the list (for example, Document/Folder).

Type: string

Example: "Diagram"

## fileRowIcon

Defines a file icon which is displayed in the table format. The preferred icon size is 32x32 px.

Type: string

Example: "drawio-32.svg"

## fileTileIcon

Defines a file icon which is displayed in the tile format. The preferred icon size is 96x96 px.

Type: string

Example: "drawio-96.svg"

## Example

``` ts
import {type File, type IFileItem} from "@onlyoffice/docspace-plugin-sdk"

export const drawIoItem: IFileItem = {
  extension: ".drawio",
  fileTypeName: "Diagram",
  fileRowIcon: "drawio-32.svg",
  fileTileIcon: "drawio-96.svg",
  onClick: async (item: File) => {},
}
```
