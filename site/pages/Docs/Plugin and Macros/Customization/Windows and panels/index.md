---
order: -3
---

Plugins can be represented as modal windows or panels.

![Modal window](/assets/images/plugins/plugin-window.png)

<img alt="Plugin left panel" src="/assets/images/plugins/plugin-left-panel.png" width="300px">

You can run multiple panel plugins at the same time. For each plugin, a separate button will appear on the left or right toolbar.

## Creating a window

To create a modal window / panel for the plugin:

1. In the [plugin code](../../Interacting%20with%20editors/Overview/index.md) file, specify the modal window / panel settings that are similar to [variations](../../Structure/Manifest/index.md#variations) in the plugin config.

   Parameters:

   | Name                     | Type            | Example                                                                                                            | Description                                                                                                                                                                                                                                                               |
   | ------------------------ | --------------- | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
   | *variations*             | object          |                                                                                                                    | The modal window / panel settings.                                                                                                                                                                                                                                        |
   | *variations.url*         | string          | "settings.html"                                                                                                    | The modal window / panel entry point, i.e. an HTML file which connects the *plugin.js* file (the base file needed for work with plugins) and launches the plugin code. See the [index.html](../../Structure/Entry%20point/index.md) section for the detailed information. |
   | *variations.description* | string          | "Description"                                                                                                      | The description for the modal window / panel.                                                                                                                                                                                                                             |
   | *variations.type*        | string          | "window"                                                                                                           | The plugin [type](../../Structure/Manifest/index.md#variationstype). Use the **"window"** value for modal windows, **"panel"** for left panels and **"panelRight"** for right panels.                                                                                     |
   | *variations.size*        | Array.\<number> | [343, 122]                                                                                                         | The modal window size. This parameter is used only for modal windows.                                                                                                                                                                                                     |
   | *variations.buttons*     | Array.\<Button> | [ { "text": "Cancel", "primary": false, "isviewer": false, "textLocale": { "fr": "Annuler", "es": "Cancelar" } } ] | The list of skinnable plugin buttons used in the modal windows. This parameter is used only for modal windows.                                                                                                                                                            |

   Example:

   ``` ts
   function getFullUrl(name) {
     const location = window.location
     const start = location.pathname.lastIndexOf("/") + 1
     const file = location.pathname.slice(start)
     return location.href.replace(file, name)
   }

   const variation = {
     url: getFullUrl("settings.html"),
     description: "Description",
     type: "window",
     size: [343, 122],
     buttons: [
       {
         text: "Save",
         primary: true,
         textLocale: {
           fr: "Enregistrer",
           es: "Guardar",
           de: "Speichern",
           cs: "Uložit",
           zh: "保存",
         },
       },
     ],
   }
   ```

2. Define a new plugin window / panel in the plugin code file:

   ```ts
   const newWindow = new window.Asc.PluginWindow()
   ```

3. Specify the window / panel appearance in the [index.html](../../Structure/Entry%20point/index.md) file.

## Showing a window

To show the plugin modal window / panel in the editor, use the **show** method.

Parameters:

| Name        | Type      | Description                        |
| ----------- | --------- | ---------------------------------- |
| *variation* | variation | The modal window / panel settings. |

Returns: This method doesn't return any data.

Example:

``` ts
newWindow.show(variation)
```

You can also use the **ShowWindow** method of *window.Asc.plugin.executeMethod*.

Parameters:

| Name        | Type      | Description                        |
| ----------- | --------- | ---------------------------------- |
| *frameId*   | string    | The frame ID.                      |
| *variation* | variation | The modal window / panel settings. |

Returns: This method doesn't return any data.

Example:

``` ts
const variation = {
  url: location.href.replace(file, "modal.html"),
  description: window.Asc.plugin.tr("Warning"),
  isVisual: true,
  isModal: true,
  EditorsSupport: ["word", "cell", "slide"],
  size: [350, 100],
  buttons: [
    {
      text: window.Asc.plugin.tr("Yes"),
      primary: true,
    },
    {
      text: window.Asc.plugin.tr("No"),
      primary: false,
    },
  ],
}
window.Asc.plugin.executeMethod("ShowWindow", ["iframe_asc.{BE5CBF95-C0AD-4842-B157-AC40FEDD9841}", variation])
```

## Activating a window

To activate (move forward) the plugin window / panel, use the **ActivateWindow** method of *window.Asc.plugin.executeMethod*.

Parameters:

| Name      | Type   | Description   |
| --------- | ------ | ------------- |
| *frameId* | string | The frame ID. |

Returns: This method doesn't return any data.

Example:

``` ts
window.Asc.plugin.executeMethod("ActivateWindow", ["iframe_asc.{BE5CBF95-C0AD-4842-B157-AC40FEDD9841}"])
```

## Interacting with a window

- You can send an event to the plugin when the mouse button is moved inside the plugin iframe by using the **MouseMoveWindow** method of *window.Asc.plugin.executeMethod*.

Parameters:

| Name      | Type   | Description       |
| --------- | ------ | ----------------- |
| *frameId* | string | The frame ID.     |
| *x*       | number | The X coordinate. |
| *y*       | number | The Y coordinate. |

Returns: This method doesn't return any data.

Example:

``` ts
window.Asc.plugin.executeMethod("MouseMoveWindow", ["iframe_asc.{BE5CBF95-C0AD-4842-B157-AC40FEDD9841}", 70, 40])
```

- You can send an event to the plugin when the mouse button is released inside the plugin iframe by using the **MouseUpWindow** method of *window.Asc.plugin.executeMethod*.

Parameters:

| Name      | Type   | Description       |
| --------- | ------ | ----------------- |
| *frameId* | string | The frame ID.     |
| *x*       | number | The X coordinate. |
| *y*       | number | The Y coordinate. |

Returns: This method doesn't return any data.

Example:

``` ts
window.Asc.plugin.executeMethod("MouseUpWindow", ["iframe_asc.{BE5CBF95-C0AD-4842-B157-AC40FEDD9841}", 70, 40])
```

- You can resize the plugin modal window by using the **ResizeWindow** method of *window.Asc.plugin.executeMethod*.

Parameters:

| Name      | Type   | Description             |
| --------- | ------ | ----------------------- |
| *frameId* | string | The frame ID.           |
| *size*    | number | The frame size.         |
| *minSize* | number | The frame minimum size. |
| *maxSize* | number | The frame maximum size. |

Returns: This method doesn't return any data.

Example:

``` ts
window.Asc.plugin.executeMethod("ResizeWindow", ["iframe_asc.{BE5CBF95-C0AD-4842-B157-AC40FEDD9841}", 392, 392, 392])
```

You can also use the **resizeWindow** method to change the window size updating the minimum / maximum sizes.

Parameters:

| Name     | Type   | Description                |
| -------- | ------ | -------------------------- |
| *width*  | number | The window width.          |
| *height* | number | The window height.         |
| *minW*   | number | The window minimum width.  |
| *minH*   | number | The window minimum height. |
| *maxW*   | number | The window maximum width.  |
| *maxH*   | number | The window maximum height. |

Returns: This method doesn't return any data.

Example:

``` ts
window.Asc.plugin.init = () => {
  this.resizeWindow(392, 147, 392, 147, 392, 147)
}
```

- You can send a message to the modal window / panel by using the **command** method.

Parameters:

| Name          | Type   | Description                                                      |
| ------------- | ------ | ---------------------------------------------------------------- |
| *messageName* | string | The message name.                                                |
| *data*        | string | The message data (this data will be sent to the event callback). |

Returns: This method doesn't return any data.

Example:

``` ts
newWindow.command("messageName", "data")
```

- You can send a message to the plugin from the modal window / panel by using the **sendToPlugin** method in the window / panel code.

Parameters:

| Name   | Type   | Description     |
| ------ | ------ | --------------- |
| *name* | string | The event name. |
| *data* | object | The event data. |

Returns: Type boolean

Example:

``` ts
Asc.plugin.sendToPlugin("onWindowMessage", {type: "onWindowReady"})
```

- You can send a message to the plugin modal window / panel by using the **SendToWindow** method of *window.Asc.plugin.executeMethod*.

Parameters:

| Name       | Type   | Description     |
| ---------- | ------ | --------------- |
| *windowID* | string | The frame ID.   |
| *name*     | string | The event name. |
| *data*     | object | The event data. |

Returns: This method doesn't return any data.

Example:

``` ts
window.Asc.plugin.executeMethod("SendToWindow", ["iframe_asc.{BE5CBF95-C0AD-4842-B157-AC40FEDD9841}", "onWindowMessage", {config: oConfig}])
```

- You can subscribe to the messages from the plugin by using the **attachEvent** method in the window / panel code.

Parameters:

| Name     | Type     | Description         |
| -------- | -------- | ------------------- |
| *id*     | string   | The event name.     |
| *action* | function | The event listener. |

Returns: This method doesn't return any data.

Example:

``` ts
Asc.plugin.attachEvent("messageName", (message) => {
  console.log(message)
})
```

## Closing a window

To close the plugin window / panel, use the **CloseWindow** method of *window.Asc.plugin.executeMethod*.

Parameters:

| Name      | Type   | Description   |
| --------- | ------ | ------------- |
| *frameId* | string | The frame ID. |

Returns: This method doesn't return any data.

Example:

``` ts
window.Asc.plugin.button = (id, windowId) => {
  if (!modalWindow) {
    return
  }

  if (windowId) {
    switch (id) {
    default:
      window.Asc.plugin.executeMethod("CloseWindow", [windowId])
    }
  }
}
```
