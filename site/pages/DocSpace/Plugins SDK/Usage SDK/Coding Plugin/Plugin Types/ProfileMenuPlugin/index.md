---
order: -3
---

The plugin that is embedded in the profile menu.

**Interface**: IProfileMenuPlugin.

## Variables

### profileMenuItems

Stores a collection of elements where the keys are the *key* parameters from the [ProfileMenuItem](../../Plugin%20Items/ProfileMenuItem/index.md) objects. A list for embedding into the profile menu is generated based on this collection.

Type: collection of IProfileMenuItem

## Methods and their description

### addProfileMenuItem

Add a new profile menu item.

Parameters:

| Name             | Type             | Example | Description                  |
| ---------------- | ---------------- | ------- | ---------------------------- |
| profileMenuItems | IProfileMenuItem |         | Defines a profile menu item. |

### getProfileMenuItems

Get all the profile menu items.

### updateProfileMenuItem

Update the profile menu item.

Parameters:

| Name             | Type             | Example | Description                      |
| ---------------- | ---------------- | ------- | -------------------------------- |
| profileMenuItems | IProfileMenuItem |         | Defines a new profile menu item. |

## Example

``` ts
import {type IProfileMenuItemIProfileMenuPlugin, type IProfileMenuPlugin} from "@onlyoffice/docspace-plugin-sdk"

class Plugin implements IProfileMenuPlugin {
  profileMenuItems = new Map<string, IProfileMenuItem>()

  addProfileMenuItem = (item: IProfileMenuItem): void => {
    this.profileMenuItems.set(item.key, item)
  }

  getProfileMenuItems = (): Map<string, IProfileMenuItem> => {
    return this.profileMenuItems
  }

  updateProfileMenuItem = (item: IProfileMenuItem): void => {
    this.profileMenuItems.set(item.key, item)
  }
}
```
