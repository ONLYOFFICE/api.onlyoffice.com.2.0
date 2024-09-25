---
order: -4
---

Describes an item that will be embedded in the **More** item of the main button menu. It is available only inside a room (folder) and is not available for the room list.

<img alt="Main button item" src="/assets/images/docspace/main-button-plugin.png" width="400px">

## key

Defines the unique item identifier used by the service to recognize the item.

Type: string

Example: "draw-io-main-button-item"

## label

Defines the item display name.

Type: string

Example: "Draw.io"

## icon

Defines the item display icon. The icon image must be uploaded to the *assets* folder. Only the image name with the extension must be specified in this field. The required icon size is 16x16 px. Otherwise, it will be compressed to this size.

Type: string

Example: "drawio.png"

## onClick

Defines a function that takes the file/folder/room id as an argument. This function can be asynchronous.

Type: func

Example: `() => {}`

## usersType

Defines the types of users who will see the current item in the context menu. Currently the following user types are available: **owner**, **docSpaceAdmin**, **roomAdmin**, **collaborator**, **user**. If this parameter is not specified, then the current context menu item will be displayed for all user types.

Type: array of [UsersType](https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/enums/UsersType.ts)

Example: \[UsersType.owner, UsersType.docSpaceAdmin, UsersType.roomAdmin]

## devices

Defines the types of devices where the current item will be displayed in the context menu. At the moment the following device types are available: **mobile**, **tablet**, **desktop**. If this parameter is not specified, then the current context menu item will be displayed in any device types.

Type: array of [Devices](https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/enums/Devices.ts)

Example: \[Devices.desktop]

## items

Defines the main button items that are added to the current item as a drop-down list. In this case, the [onClick](#onclick) event does not work.

Type: array of IMainButtonItem

Example: \[createItem]

## Example

``` ts
import {type IMainButtonItem} from "@onlyoffice/docspace-plugin-sdk"

const createItem: IMainButtonItem = {
  key: "draw-io-main-button-item_create",
  label: "Create new",
  icon: "create-new.svg",
  onClick: (id: number) => {},
}

const mainButtonItem: IMainButtonItem = {
  key: "draw-io-main-button-item",
  label: "Draw.io",
  icon: "drawio.png",
  items: [createItem],
}
```
