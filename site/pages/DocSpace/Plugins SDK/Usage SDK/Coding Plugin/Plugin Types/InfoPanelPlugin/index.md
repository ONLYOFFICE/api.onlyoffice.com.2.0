---
order: -5
---

The plugin that is embedded as a separate tab in the file info panel.

**Interface**: IInfoPanelPlugin.

## Variables

### infoPanelItems

Stores a collection of elements where the keys are the key parameters from the [InfoPanelItem](../../Plugin%20Items/InfoPanelItem/index.md) objects. A list for embedding into the info panel is generated based on this collection.

Type: collection of IInfoPanelItem

## Methods and their description

### addInfoPanelItem

Add a new info panel item.

Parameters:

| Name          | Type           | Example | Description                 |
| ------------- | -------------- | ------- | --------------------------- |
| infoPanelItem | IInfoPanelItem |         | Defines an info panel item. |

### getInfoPanelItems

Get all the info panel items.

### updateInfoPanelItem

Update the info panel item.

Parameters:

| Name          | Type           | Example | Description                    |
| ------------- | -------------- | ------- | ------------------------------ |
| infoPanelItem | IInfoPanelItem |         | Defines a new info panel item. |

## Example

``` ts
import {type IInfoPanelItem, type IInfoPanelPlugin} from "@onlyoffice/docspace-plugin-sdk"

class Plugin implements IInfoPanelPlugin {
  infoPanelItems = new Map<string, IInfoPanelItem>()

  addInfoPanelItem = (item: IInfoPanelItem): void => {
    this.infoPanelItems.set(item.key, item)
  }

  getInfoPanelItems = (): Map<string, IInfoPanelItem> => {
    return this.infoPanelItems
  }

  updateInfoPanelItem = (item: IInfoPanelItem): void => {
    this.infoPanelItems.set(item.key, item)
  }
}
```
