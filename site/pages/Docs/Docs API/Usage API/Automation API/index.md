---
order: -2
---

**Connector** is a class that allows editing text documents, spreadsheets, presentations, and fillable forms from an external source. The examples of using Automation API can be found [here](../../Get%20Started/External%20access%20to%20the%20document%20editing/index.md).

To create the connector, use the [createConnector](../Methods/index.md#createconnector) method of the **document editor** object:

``` ts
const connector = docEditor.createConnector()
```

> Please note that the connector is available only for **ONLYOFFICE Developer Edition**.
>
> This class is an additional feature which is available at extra cost. If you have any questions, please contact our sales team at <sales@onlyoffice.com>.

The connector has the same interface as plugins. Below you can find methods that are available for this class.

- [addContextMenuItem](#addcontextmenuitem) - add an item to the context menu.
- [addToolbarMenuItem](#addtoolbarmenuitem) - add an item to the toolbar menu.
- [attachEvent](#attachevent) - add an event listener.
- [callCommand](#callcommand) - send the data back to the editor.
- [connect](#connect) - connect the connector to the editor.
- [createWindow](#createwindow) - create the connector modal window to display the additional information inside the editor.
- [detachEvent](#detachevent) - remove an event listener.
- [disconnect](#disconnect) - disconnect the connector from the editor.
- [executeMethod](#executemethod) - execute certain editor methods using the connector.
- [updateContextMenuItem](#updatecontextmenuitem) - update an item in the context menu with the specified items.

## addContextMenuItem

The function called to add an item to the context menu. The process of working with the context menu is the same as for [plugins](../../../Plugin%20and%20Macros/Customization/Context%20menu/index.md) except for the *onClick* method, which is used instead of subscribing by ID.

Parameters:

| Name  | Type                                        | Description                                           |
| ----- | ------------------------------------------- | ----------------------------------------------------- |
| items | Array.<[ContextMenuItem](#contextmenuitem)> | An array containing the context menu item parameters. |

### ContextMenuItem

| Name       | Type                     | Description                                                                                                                |
| ---------- | ------------------------ | -------------------------------------------------------------------------------------------------------------------------- |
| *id*       | string                   | The item ID.                                                                                                               |
| *text*     | string                   | The item caption.                                                                                                          |
| *data*     | string                   | The item data (this data will be sent to the click event callback).                                                        |
| *disabled* | boolean                  | Specifies if the current item is disabled or not.                                                                          |
| *icons*    | string                   | The item icons (see the plugins [config](../../../Plugin%20and%20Macros/Structure/Manifest/index.md#icons) documentation). |
| *onClick*  | function                 | The click event callback.                                                                                                  |
| *items*    | Array.\<ContextMenuItem> | An array containing the context menu items for the current item.                                                           |

Example:

``` ts
connector.attachEvent("onContextMenuShow", (options) => {
  connector.addContextMenuItem([{
    text: "mainItem",
    onClick: () => {
      console.log("[CONTEXTMENUCLICK] menuSubItem1")
    },
  }])
})
```

## addToolbarMenuItem

The function called to add an item to the toolbar menu. The process of working with the toolbar menu is the same as for [plugins](../../../Plugin%20and%20Macros/Customization/Toolbar/index.md) except for the *onClick* method, which is used instead of subscribing by ID.

Parameters:

| Name  | Type                                        | Description                            |
| ----- | ------------------------------------------- | -------------------------------------- |
| items | [ToolbarMenuMainItem](#toolbarmenumainitem) | The toolbar main menu item parameters. |

### ToolbarMenuMainItem

| Name | Type                                      | Description                                                     |
| ---- | ----------------------------------------- | --------------------------------------------------------------- |
| guid | string                                    | The plugin guid.                                                |
| tabs | Array.<[ToolbarMenuTab](#toolbarmenutab)> | An array containing the toolbar menu tabs for the current item. |

### ToolbarMenuTab

| Name  | Type                                        | Description                                                     |
| ----- | ------------------------------------------- | --------------------------------------------------------------- |
| id    | string                                      | The tab ID.                                                     |
| text  | string                                      | The tab text.                                                   |
| items | Array.<[ToolbarMenuItem](#toolbarmenuitem)> | An array containing the toolbar menu items for the current tab. |

### ToolbarMenuItem

| Name             | Type                                        | Description                                                                                                                              |
| ---------------- | ------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| *id*             | string                                      | The item ID.                                                                                                                             |
| *type*           | [ToolbarMenuItemType](#toolbarmenuitemtype) | The item type.                                                                                                                           |
| *text*           | string                                      | The item caption. If this field is "", the toolbar button is displayed only with an icon, without a caption.                             |
| *hint*           | string                                      | The item hint.                                                                                                                           |
| *icons*          | string                                      | object                                                                                                                                   | The item icons (see the plugins [config](../../../Plugin%20and%20Macros/Structure/Manifest/index.md#variationsicons) documentation). |
| *disabled*       | boolean                                     | Specifies whether the current item is locked.                                                                                            |
| *enableToggle*   | boolean                                     | Specifies whether the toolbar menu item (when *"split == false"*) or its top part (when *"split == true"*) can be toggled.               |
| *lockInViewMode* | boolean                                     | Specifies whether the toolbar menu item is automatically locked in the view modes (when previewing, viewing forms, disconnecting, etc.). |
| *separator*      | boolean                                     | Specifies whether a separator is used between the toolbar menu items.                                                                    |
| *split*          | boolean                                     | Specifies whether the toolbar menu item is split into two parts and includes the drop-down menu.                                         |
| onClick          | function                                    | The click event callback.                                                                                                                |
| *items*          | Array.\<ToolbarMenuItem>                    | An array containing the context menu items for the current item.                                                                         |

### ToolbarMenuItemType

The toolbar menu item type. The *button* and *big-button* values are the same and can be equally used to specify the toolbar button.

Type: "button" | "big-button"

Example:

``` ts
connector.addToolbarMenuItem({
  tabs: [
    {
      text: "Connector",
      items: [
        {
          id: "toolConnector1",
          type: "button",
          text: "Meaning",
          hint: "Meaning",
          lockInViewMode: true,
          icons: "./icon.svg",
          items: [
            {
              id: "toolC1",
              text: "Text",
              data: "Hello",
              onClick: (data) => {
                console.log(`[TOOLBARMENUCLICK]: ${data}`)
              },
            },
          ],
        },
      ],
    },
  ],
})
```

## attachEvent

The function called to add an event listener, a function that will be called whenever the specified event is delivered to the target. The list of all the available events is the same as for the plugins.

Parameters:

| Name     | Type     | Description         |
| -------- | -------- | ------------------- |
| name     | string   | The event name.     |
| callback | function | The event listener. |

Example:

``` ts
connector.attachEvent("onChangeContentControl", (obj) => {
  console.log(`[EVENT] onChangeContentControl: ${JSON.stringify(obj)}`)
})
```

## callCommand

The function called to send the data back to the editor. It allows the connector to send structured data that can be inserted into the resulting document file (formatted paragraphs, tables, text parts, and separate words, etc.).

> **ONLYOFFICE Document Builder** commands can be only used to create content and insert it into the document editor (using the *Api.GetDocument().InsertContent(...))*. This limitation exists due to the co-editing feature in the online editors.

Parameters:

| Name     | Type     | Description                                                                                                                                                                                                                                                                                                                                                                      |
| -------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| command  | function | Defines the command written in JavaScript which purpose is to form structured data which can be inserted into the resulting document file (formatted paragraphs, tables, text parts, and separate words, etc.). Then the data is sent to the editors. The command must be compatible with [Office JavaScript API](../../../Office%20API/Get%20Started/Overview/index.md) syntax. |
| callback | function | The result that the method returns. It is an optional parameter.                                                                                                                                                                                                                                                                                                                 |
| isNoCalc | boolean  | Defines whether the document will be recalculated or not. The **true** value is used to recalculate the document after executing the function in the *command* parameter. The **false** value will not recalculate the document (use it only when your edits surely will not require document recalculation). The default value is **false**.                                    |

This method is executed in its context isolated from other JavaScript data. If some parameters or other data need to be passed to this method, use Asc.scope object.

Example:

``` ts
connector.callCommand(() => {
  const oDocument = Api.GetDocument()
  const oParagraph = Api.CreateParagraph()
  oParagraph.AddText("Hello")
  oDocument.InsertContent([oParagraph])
}, () => {
  console.log("[COMMAND] Callback command")
})
```

## connect

The function called to connect the connector to the editor.

> Please note that this method should only be called if you have disconnected the connector with the [disconnect](#disconnect) method and need to connect it to the editor again. When creating a connector, you do not need to use the *connect* method, as it is called automatically along with the [createConnector](../Methods/index.md#createconnector) method.

Example:

``` ts
connector.connect()
```

## createWindow

The function called to create the [connector modal window](#connector-window) to display the additional information inside the editor.

Example:

``` ts
const testConnectorWindow = connector.createWindow()
```

## detachEvent

The function called to remove an event listener.

Parameters:

| Name | Type   | Description     |
| ---- | ------ | --------------- |
| name | string | The event name. |

Example:

``` ts
connector.detachEvent("onChangeContentControl")
```

## disconnect

The function called to disconnect the connector from the editor.

Example:

``` ts
connector.disconnect()
```

## executeMethod

The function called to execute certain editor methods using the connector. The full list of these methods is the same as for the plugins.

Parameters:

| Name     | Type     | Description                                                      |
| -------- | -------- | ---------------------------------------------------------------- |
| name     | string   | The name of the specific method that must be executed.           |
| args     | array    | The arguments that the method in use has (if it has any).        |
| callback | function | The result that the method returns. It is an optional parameter. |

Example:

``` ts
connector.executeMethod("GetCurrentWord", [], (word) => {
  console.log(`[METHOD] GetCurrentWord: ${word}`)
})
```

## updateContextMenuItem

The function called to update an item in the context menu with the specified items.

Parameters:

| Name  | Type                                         | Description                                           |
| ----- | -------------------------------------------- | ----------------------------------------------------- |
| items | array of [ContextMenuItem](#contextmenuitem) | An array containing the context menu item parameters. |

### ContextMenuItem

| Name     | Type                     | Description                                                                                                                |
| -------- | ------------------------ | -------------------------------------------------------------------------------------------------------------------------- |
| id       | string                   | The item ID.                                                                                                               |
| text     | string                   | The item text.                                                                                                             |
| data     | string                   | The item data (this data will be sent to the click event callback).                                                        |
| disabled | boolean                  | Specifies if the current item is disabled or not.                                                                          |
| icons    | string                   | The item icons (see the plugins [config](../../../Plugin%20and%20Macros/Structure/Manifest/index.md#icons) documentation). |
| items    | array of ContextMenuItem | An array containing the context menu items for the current item.                                                           |

Example:

``` ts
const items = [
  {
    id: "onConvert",
    text: "Convert to Markdown or HTML",
  },
]

connector.updateContextMenuItem(items)
```

## Connector window

Connector window is a class that represents the connector window. To create it, use the [createWindow](#createwindow) method of the connector object.

Below you can find methods that are available for this class.

### attachEvent

The function called to add an event listener to the modal window frame. This function will be called whenever the specified event is delivered to the target. The list of all the available events is the same as for the plugins. It can be found [here](../../../Plugin%20and%20Macros/Interacting%20with%20editors/Events/index.md).

Parameters:

| Name   | Type     | Description         |
| ------ | -------- | ------------------- |
| id     | string   | The event name.     |
| action | function | The event listener. |

Example:

``` ts
testConnectorWindow.attachEvent("onWindowMessage", (message) => {
  console.log(`panel message: ${message}`)
})
```

### dispatchEvent

The function called to send an event to the modal window frame. The list of all the available events is the same as for the plugins. It can be found [here](../../../Plugin%20and%20Macros/Interacting%20with%20editors/Events/index.md).

Parameters:

| Name | Type            | Description     |
| ---- | --------------- | --------------- |
| name | string          | The event name. |
| data | string / object | The event data. |

Example:

``` ts
testConnectorWindow.dispatchEvent("messageName", {
  prop: "value",
})
```

### show

The function called to show a modal window inside the editor.

Parameters:

| Name     | Type   | Description                                                                                                                                      |
| -------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| settings | object | The modal window parameters that are the same as for plugin [variations](../../../Plugin%20and%20Macros/Structure/Manifest/index.md#variations). |

Example:

``` ts
testConnectorWindow.show({
  url: "./window/panel.html",
  description: "Panel example!",
  type: "panel",
  buttons: [],
  icons: "./icon.svg",
})
```

In the connector window code, you can also use the following methods:

### attachEvent

The function called to subscribe to the messages from the plugin.

Parameters:

| Name     | Type     | Description         |
| -------- | -------- | ------------------- |
| *id*     | string   | The event name.     |
| *action* | function | The event listener. |

Returns: This method doesn't return any data.

Example:

``` ts
window.Asc.plugin.attachEvent("messageName", (message) => {
  console.log(message)
})
```

### sendToPlugin

The function called to send a message to the editor from the modal window.

Parameters:

| Name | Type   | Description     |
| ---- | ------ | --------------- |
| name | string | The event name. |
| data | object | The event data. |

Example:

``` ts
window.Asc.plugin.sendToPlugin("onWindowMessage", {type: "onWindowReady"})
```
