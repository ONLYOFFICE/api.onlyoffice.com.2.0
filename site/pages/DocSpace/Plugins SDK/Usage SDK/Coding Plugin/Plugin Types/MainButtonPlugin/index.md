---
order: -4
---

The plugin that is embedded in the main button.

**Interface**: IMainButtonPlugin.

## Variables

### mainButtonItems

Stores a collection of elements where the keys are the *key* parameters from the [MainButtonItem](../../Plugin%20Items/MainButtonItem/index.md) objects. A list for embedding into the main button menu is generated based on this collection.

Type: collection of IMainButtonItem

## Methods and their description

### addMainButtonItem

Add a new main button item.

Parameters:

| Name            | Type            | Example | Description                 |
| --------------- | --------------- | ------- | --------------------------- |
| mainButtonItems | IMainButtonItem |         | Defines a main button item. |

### getMainButtonItems

Get all the main button items.

### updateMainButtonItem

Update the main button item.

Parameters:

| Name            | Type            | Example | Description                     |
| --------------- | --------------- | ------- | ------------------------------- |
| mainButtonItems | IMainButtonItem |         | Defines a new main button item. |

## Example

``` ts
import {type IMainButtonItem, type IMainButtonPlugin} from "@onlyoffice/docspace-plugin-sdk"

class Plugin implements IMainButtonPlugin {
  mainButtonItems = new Map<string, IMainButtonItem>()

  addMainButtonItem = (item: IMainButtonItem): void => {
    this.mainButtonItems.set(item.key, item)
  }

  getMainButtonItems = (): Map<string, IMainButtonItem> => {
    return this.mainButtonItems
  }

  updateMainButtonItem = (item: IMainButtonItem): void => {
    this.mainButtonItems.set(item.key, item)
  }
}
```
