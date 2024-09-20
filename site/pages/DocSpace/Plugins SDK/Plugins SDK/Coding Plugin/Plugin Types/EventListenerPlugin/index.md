---
order: -2
---

The plugin that is given the access to the portal events.

**Interface**: IEventListenerPlugin.

## Variables

### eventListenerItems

Stores a collection of elements where the keys are the *key* parameters from the [EventListenerItem](../../Plugin%20Items/EventListenerItem/index.md) objects. A list of event listeners is generated based on this collection.

Type: collection of IEventListenerItem

## Methods and their description

### addEventListenerItem

Add a new event listener item.

Parameters:

| Name               | Description                     | Type               | Example |
| ------------------ | ------------------------------- | ------------------ | ------- |
| eventListenerItems | Defines an event listener item. | IEventListenerItem |         |

## getEventListenerItems

Get all the event listener items.

## Example

``` ts
import {type IEventListenerItem, type IEventListenerPlugin} from "@onlyoffice/docspace-plugin-sdk"

class Plugin implements IEventListenerPlugin {
  eventListenerItems = new Map<string, IEventListenerItem>()

  addEventListenerItem = (item: IEventListenerItem): void => {
    this.eventListenerItems.set(item.key, item)
  }

  getEventListenerItems = (): Map<string, IEventListenerItem> => {
    return this.eventListenerItems
  }
}
```
