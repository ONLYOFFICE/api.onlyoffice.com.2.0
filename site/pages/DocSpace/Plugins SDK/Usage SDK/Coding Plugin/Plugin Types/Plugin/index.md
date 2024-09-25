---
order: -9
---

The default plugin.

**Interface**: IPlugin.

This interface must be used in each plugin because the plugin [status](#status) is required to embed the plugin in the portal.

## Variables

### status

Stores the plugin status (**active** or **hide**).

Type: [PluginStatus](https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/enums/Plugins.ts)

Example: "active"

### onLoadCallback

Stores callback which will be executed when uploading the plugin to the portal.

Type: func

## Methods and their description

### updateStatus

Update the plugin status.

Parameters:

| Name   | Type                                                                                               | Example  | Description                                           |
| ------ | -------------------------------------------------------------------------------------------------- | -------- | ----------------------------------------------------- |
| status | [PluginStatus](https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/enums/Plugins.ts) | "active" | Defines a new plugin status (**active** or **hide**). |

### getStatus

Get the plugin status.

### setOnLoadCallback

Sets the [onLoadCallback](#onloadcallback) variable to the plugin.

Parameters:

| Name     | Type | Example  | Description                                                                      |
| -------- | ---- | -------- | -------------------------------------------------------------------------------- |
| callback | fucn | callback | Defines callback which will be executed when uploading the plugin to the portal. |

## Example

``` ts
import {type IPlugin, PluginStatus} from "@onlyoffice/docspace-plugin-sdk"

class Plugin implements IPlugin {
  status: PluginStatus = PluginStatus.active
  onLoadCallback = async () => {}

  updateStatus = (status: PluginStatus) => {
    this.status = status
  }

  getStatus = () => {
    return this.status
  }

  setOnLoadCallback = (callback: () => Promise<void>) => {
    this.onLoadCallback = callback
  }
}
```
