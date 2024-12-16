---
order: -4
---

Plugins can be placed on the toolbar: create their own tabs and fill them, add buttons to the standard tabs.

![Toolbar item](/assets/images/plugins/toolbar-plugins.png)

## Creating a toolbar item

1. Specify the **AddToolbarMenuItem** method to add an item to the toolbar menu if necessary.

   Parameters:

   | Name    | Type                                                | Description                                      |
   | ------- | --------------------------------------------------- | ------------------------------------------------ |
   | *items* | Array.<[ToolbarMenuMainItem](#toolbarmenumainitem)> | An array containing the main toolbar menu items. |

   Returns: This method doesn't return any data.

   Example:

   ``` ts
   Asc.plugin.executeMethod("AddToolbarMenuItem", [{
     guid: Asc.plugin.guid,
     tabs: [
       {
         id: "my_tab",
         text: "MYTAB",
         items: [
           {
             id: "idButton1",
             type: "big-button",
             text: "Test item",
             hint: "test hint",
             data: "test_data",
             lockInViewMode: false,
             icons: "resources/%theme-type%(light|dark)/icon%state%(normal)%scale%(default|*).%extension%(png|svg)",
             items: [],
           },
         ],
       },
     ],
   }])
   ```

   ### ToolbarMenuMainItem

   The main toolbar menu item.

   Type: object

   Properties:

   | Name   | Type                                      | Description                                                     |
   | ------ | ----------------------------------------- | --------------------------------------------------------------- |
   | *guid* | string                                    | The plugin guid.                                                |
   | *tabs* | Array.<[ToolbarMenuTab](#toolbarmenutab)> | An array containing the toolbar menu tabs for the current item. |

   Example:

   ``` ts
   const oToolbarMenuMainItem = {
     guid: "asc.{9DC93CDB-B576-4F0C-B55E-FCC9C48DD007}",
     tabs: [oToolbarMenuTab],
   }
   ```

   ### ToolbarMenuTab

   The toolbar menu tab.

   Type: object

   Properties:

   | Name    | Type                                        | Description                                                                                  |
   | ------- | ------------------------------------------- | -------------------------------------------------------------------------------------------- |
   | *id*    | string                                      | The tab ID. The list of standard toolbar IDs is provided [below](#standard-toolbar-tab-ids). |
   | *text*  | string                                      | The tab text.                                                                                |
   | *items* | Array.<[ToolbarMenuItem](#toolbarmenuitem)> | An array containing the toolbar menu items for the current tab.                              |

   Example:

   ``` ts
   const oToolbarMenuTab = {
     id: "ChatGPT",
     text: "AI Assistant",
     items: [oToolbarMenuItem],
   }
   ```

   ### ToolbarMenuItem

   The toolbar menu item.

   Type: object

   Properties:

   | Name             | Type                                        | Description                                                                                                                              |
   | ---------------- | ------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
   | *id*             | string                                      | The item ID.                                                                                                                             |
   | *type*           | [ToolbarMenuItemType](#toolbarmenuitemtype) | The item type.                                                                                                                           |
   | *text*           | string                                      | The item caption. If this field is "", the toolbar button is displayed only with an icon, without a caption.                             |
   | *hint*           | string                                      | The item hint.                                                                                                                           |
   | *icons*          | string / object                             | The item icons (see the plugins [config](../../Structure/Manifest/index.md#variationsicons) documentation).                              |
   | *disabled*       | boolean                                     | Specifies whether the current item is locked.                                                                                            |
   | *enableToggle*   | boolean                                     | Specifies whether the toolbar menu item (when *"split == false"*) or its top part (when *"split == true"*) can be toggled.               |
   | *lockInViewMode* | boolean                                     | Specifies whether the toolbar menu item is automatically locked in the view modes (when previewing, viewing forms, disconnecting, etc.). |
   | *separator*      | boolean                                     | Specifies whether a separator is used between the toolbar menu items.                                                                    |
   | *split*          | boolean                                     | Specifies whether the toolbar menu item is split into two parts and includes the drop-down menu.                                         |
   | *items*          | Array.\<ToolbarMenuItem>                    | An array containing the context menu items for the current item.                                                                         |

   Example:

   ``` ts
   const oToolbarMenuItem = {
     id: "MeaningItem",
     type: "button",
     text: "Meaning",
     hint: "Meaning",
     icons: "resources/%theme-name%(classic|dark)/%theme-type%(light|dark)/icon%state%(normal|hover)%scale%(default|*).%extension%(png|svg)",
     disabled: false,
     enableToggle: false,
     lockInViewMode: false,
     separator: true,
     split: true,
     items: [
       {
         id: "onMeaningT",
         text: "Explain text in comment",
       },
       {
         id: "onFixSpelling",
         text: "Fix spelling & grammar",
       },
       {
         id: "onMakeLonger",
         text: "Make longer",
       },
       {
         id: "onMakeShorter",
         text: "Make shorter",
       },
     ],
   }
   ```

   ### ToolbarMenuItemType

   The toolbar menu item type. The *button* and *big-button* values are the same and can be equally used to specify the toolbar button.

   Type: "button" | "big-button"

   ### Standard toolbar tab IDs

   #### Document editor

   | Tab ID  | Tab name                   |
   | ------- | -------------------------- |
   | home    | Home                       |
   | ins     | Insert                     |
   | draw    | Draw                       |
   | layout  | Layout                     |
   | links   | References                 |
   | forms   | Forms (only for pdf forms) |
   | review  | Collaboration              |
   | protect | Protection                 |
   | view    | View                       |
   | plugins | Plugins                    |

   #### Spreadsheet editor

   | Tab ID  | Tab name                                          |
   | ------- | ------------------------------------------------- |
   | home    | Home                                              |
   | ins     | Insert                                            |
   | draw    | Draw                                              |
   | layout  | Layout                                            |
   | formula | Formula                                           |
   | data    | Data                                              |
   | pivot   | Pivot Table (when a cursor is in the pivot table) |
   | review  | Collaboration                                     |
   | protect | Protection                                        |
   | view    | View                                              |
   | plugins | Plugins                                           |

   #### Presentation editor

   | Tab ID  | Tab name      |
   | ------- | ------------- |
   | home    | Home          |
   | ins     | Insert        |
   | draw    | Draw          |
   | transit | Transitions   |
   | review  | Collaboration |
   | view    | View          |
   | plugins | Plugins       |

   #### PDF editor

   | Tab ID  | Tab name |
   | ------- | -------- |
   | home    | Home     |
   | ins     | Insert   |
   | comment | Comment  |
   | view    | View     |
   | plugins | Plugins  |

   ### Samples

   #### Sample 1

   A regular button.
    
   ``` json
   {
     "text": "caption",
     "split": false,
     "enableToggle": false
   }
   ```

   ![Regular button](/assets/images/plugins/regular-button.png)

   #### Sample 2

   A button that is split into two parts: the top part of the button can be toggled separately from the bottom part, that includes a drop-down menu.
    
   ``` json
   {
     "text": "caption",
     "split": true,
     "enableToggle": true,
     "items": []
   }
   ```

   ![Split and toggled button](/assets/images/plugins/split-toggle-button.png)

   #### Sample 3

   A button that is split into two parts, each part can be clicked separately, the bottom part of the item includes a drop-down menu.
    
   ``` json
   {
     "text": "caption",
     "split": true,
     "enableToggle": true,
     "items": []
   }
   ```

   ![Split button](/assets/images/plugins/split-button.png)

   #### Sample 4

   A button with a drop-down menu which opens when the button is clicked.
    
   ``` json
   {
     "text": "caption",
     "split": false,
     "enableToggle": false,
     "items": []
   }
   ```

   ![Button with menu](/assets/images/plugins/button-with-menu.png)

   #### Sample 5

   A button that can be toggled.
    
   ``` json
   {
     "text": "caption",
     "split": false,
     "enableToggle": true
   }
   ```

   ![Toggled button](/assets/images/plugins/toggled-button.png)

2. [Subscibe](../../Interacting%20with%20editors/Overview/How%20to%20attach%20events/index.md) to the **onToolbarMenuClick** event which is called when the toolbar menu button has been clicked.

   Parameters:

   | Name | Type   | Description  |
   | ---- | ------ | ------------ |
   | *id* | string | The item ID. |

   Example:

   <!-- eslint-skip -->
   
   ``` ts
   window.Asc.plugin.event_onToolbarMenuClick = (id) => {
     this._onCustomMenuClick("toolbarMenuEvents", id)
   }
   ```

## Clicking a toolbar item

Specify the **attachToolbarMenuClickEvent** to add an event listener, a function that will be called whenever the specified button is clicked in the toolbar menu and triggers  an event. For each toolbar menu button, you can specify a separate event listener by its ID.

Parameters:

| Name     | Type     | Description         |
| -------- | -------- | ------------------- |
| *id*     | string   | The event name.     |
| *action* | function | The event listener. |

Returns: This method doesn't return any data.

Example:

``` ts
plugin.attachToolbarMenuClickEvent("my_tab", (data) => {
  console.log(data)
})
```
