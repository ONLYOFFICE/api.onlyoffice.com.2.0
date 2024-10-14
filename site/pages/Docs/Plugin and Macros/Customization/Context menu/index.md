---
order: -5
---

The plugin can be accessed via the context menu.

![Context menu item](/assets/images/plugins/context-menu-item.png)

## Creating a context menu item

1. Subscibe to the **onContextMenuShow** event which is called when the context menu has been shown.

   > If a plugin is listening for this event, it must call the **AddContextMenuItem** method (synchronously or not), because the editor waits for responses from all plugins before filling the context menu.

   Parameters:

   | Name      | Type                                      | Description                                                |
   | --------- | ----------------------------------------- | ---------------------------------------------------------- |
   | *options* | [ContextMenuOptions](#contextmenuoptions) | Defines the information of the selected context menu item. |

   Example:

   ``` ts
   Asc.plugin.attachEvent("onContextMenuShow", (options) => {
     const items = {
       guid: window.Asc.plugin.guid,
       items: [
         {
           id: "onNameClick",
           text: "Name",
           items: [],
         },
       ],
     }

     this.executeMethod("AddContextMenuItem", [items])
   })
   ```

   ### ContextMenuOptions

   Defines the context menu options.

   Type: object

   Properties:

   | Name         | Type                                | Description                                                     |
   | ------------ | ----------------------------------- | --------------------------------------------------------------- |
   | *Type*       | [ContextMenuType](#contextmenutype) | The context menu type.                                          |
   | *header*     | boolean                             | Specifies whether the context menu is opened inside the header. |
   | *footer*     | boolean                             | Specifies whether the context menu is opened inside the footer. |
   | *headerArea* | boolean                             | Specifies whether the context menu is opened over the header.   |
   | *footerArea* | boolean                             | Specifies whether the context menu is opened over the footer.   |

   ### ContextMenuType

   The context menu type:

   - **None** - not used,
   - **Target** - nothing is selected,
   - **Selection** - text is selected,
   - **Image** - image is selected,
   - **Shape** - shape is selected,
   - **OleObject** - OLE object is selected.

   Depending on the selection type, different context menu items can be added.

   Type: "None" | "Target" | "Selection" | "Image" | "Shape" | "OleObject"

2. Specify the **AddContextMenuItem** method to add a button to the context menu if necessary.

   Parameters:

   | Name    | Type                                        | Description                                 |
   | ------- | ------------------------------------------- | ------------------------------------------- |
   | *items* | Array.<[ContextMenuItem](#contextmenuitem)> | An array containing the context menu items. |

   Returns: This method doesn't return any data.

   ### ContextMenuItem

   The context menu item.

   Type: object

   Properties:

   | Name       | Type                     | Description                                                                                 |
   | ---------- | ------------------------ | ------------------------------------------------------------------------------------------- |
   | *id*       | string                   | The item ID.                                                                                |
   | *text*     | string                   | The item caption.                                                                           |
   | *data*     | string                   | The item data (this data will be sent to the click event callback).                         |
   | *disabled* | boolean                  | Specifies whether the current item is disabled or not.                                      |
   | *icons*    | string                   | The item icons (see the plugins [config](../../Structure/Manifest/index.md) documentation). |
   | *items*    | Array.\<ContextMenuItem> | An array containing the context menu items for the current item.                            |

   Example:

   ``` ts
   Asc.plugin.attachEvent("onContextMenuShow", (options) => {
     const items = {
       guid: window.Asc.plugin.guid,
       items: [
         {
           id: "onNameClick",
           text: "Name",
           items: [],
         },
       ],
     }

     this.executeMethod("AddContextMenuItem", [items])
   })
   ```

## Updating a context menu item

To update the context menu item, specify the **UpdateContextMenuItem** method.

Parameters:

| Name    | Type                                        | Description                                                      |
| ------- | ------------------------------------------- | ---------------------------------------------------------------- |
| *items* | Array.<[ContextMenuItem](#contextmenuitem)> | An array containing the context menu items for the current item. |

Returns: This method doesn't return any data.

Example:

``` ts
Asc.plugin.attachEvent("onContextMenuShow", (options) => {
  const items = {
    guid: window.Asc.plugin.guid,
    items: [
      {
        id: "onNameClick",
        text: "New name",
        items: [],
      },
    ],
  }

  this.executeMethod("UpdateContextMenuItem", [items])
})
```

## Clicking a context menu item

1. [Subscibe](../../Interacting%20with%20editors/Overview/How%20to%20attach%20events/index.md) to the **onContextMenuClick** event which is called when the context menu button has been clicked.

   Parameters:

   | Name | Type   | Description  |
   | ---- | ------ | ------------ |
   | *id* | string | The item ID. |

   Example:

   ``` ts
   window.Asc.plugin.event_onContextMenuClick = (id) => {
     const pluginObj = window.Asc.plugin
     const itemId = id
     const itemData = undefined
     const itemPos = itemId.indexOf("_oo_sep_")
     if (itemPos !== -1) {
       const itemData = itemId.slice(itemPos + 8)
       const itemId = itemId.slice(0, itemPos)
     }

     if (pluginObj.contextMenuEvents && pluginObj.contextMenuEvents[itemId]) {
       pluginObj.contextMenuEvents[itemId].call(pluginObj, itemData)
     }
   }
   ```

2. Specify the **attachContextMenuClickEvent** to add an event listener, a function that will be called whenever the specified button is clicked in the context menu and triggers an event. For each context menu button, you can specify a separate event listener by its ID.

   Parameters:

   | Name     | Type     | Description         |
   | -------- | -------- | ------------------- |
   | *id*     | string   | The event name.     |
   | *action* | function | The event listener. |

   Returns: This method doesn't return any data.

   Example:

   ``` ts
   Asc.plugin.attachContextMenuClickEvent("onNameClick", (data) => {
     console.log(data)
   })
   ```

For example, you can create your own spellchecker. In this case, the context menu items with words will have the same ID and the same event listener. And the necessary word will be defined with the data from the **attachContextMenuClickEvent** method.
