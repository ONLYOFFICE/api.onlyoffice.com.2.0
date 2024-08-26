---
order: -1
---

Describes an item that allows the plugin to respond to the built-in DocSpace events (creating a room/file, etc.). Each event can have several listeners. When the event is activated, the dialog cannot be hooked.

## key

Defines the unique item identifier used by the service to recognize the item.

Type: string

Example: "event-listener-item"

## eventType

Defines the event type which will be executed. Presently the following events are available: **CREATE, RENAME, ROOM_CREATE, ROOM_EDIT, CHANGE_COLUMN, CHANGE_USER_TYPE, CREATE_PLUGIN_FILE**.

Type: [Events](https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/enums/Events.ts)

Example: Events.CREATE

## eventHandler

Defines a function that will be executed when the event is triggered. This function can be asynchronous. After the event is executed, only updating the items or displaying toast is possible, other actions are blocked.

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

## Example

``` ts
import {Events, type IEventListenerItem} from "@onlyoffice/docspace-plugin-sdk"

const eventItem: IEventListenerItem = {
  key: "event-listener-item",
  eventType: Events.CREATE,
  eventHandler: () => {},
}
```
