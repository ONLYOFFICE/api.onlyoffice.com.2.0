## Description

Tracks the events of calling the context menu and clicking on its items. It also tracks the cursor position changes.

**Plugin type:** non-visual, non-system.

**Supported editors:** documents.

![Context menu and events](/assets/images/plugins/gifs/context-menu-and-events.gif)

## Installation

Copy the code below and save it in the *config.json*, *index.html*, and *code.js* files respectively. Download the *resources* folder with icons from [this plugin](https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_customfields_add/resources). Put all the files and the folder into the plugin folder and install it following the [desktop](../../Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md), [on-premises](../../Adding%20plugins/ONLYOFFICE%20Docs%20on-premises/index.md), or [cloud](../../Adding%20plugins/ONLYOFFICE%20Cloud/index.md) installation instructions.

## Usage

1. Open the **Plugins** tab and press **ContextMenu and Events**.
2. Place a cursor anywhere in the document, press the right mouse button, and go to **Item 1 -> Subitem 2**. The *clicked: onClickItem1Sub2* message will be inserted at the cursor position.
3. Select any text in the document, press the right mouse button, and click **Item 3**. The *clicked: onClickItem3* message will be inserted in place of the selected text.
4. Select any shape or image in the document, press the right mouse button, and click **Item 4**. The *clicked: onClickItem4* message will appear in the console.
5. Change the cursor position. The *event: onTargetPositionChanged* message will appear in the console.

## Plugin structure

1. *config.json*, *index.html*, and *code.js*
2. Icons

## Config

``` json
{
  "name": "ContextMenu and Events",
  "guid": "asc.{B617C899-03AA-476F-8D2C-1B7272489CBC}",

  "variations": [
    {
      "description": "example context menu and events",
      "url": "index.html",

      "icons": ["resources/light/icon.png", "resources/light/icon@2x.png"],
      "icons2": [
        {
          "style": "light",
                    
          "100%": {
            "normal": "resources/light/icon.png"
          },
          "125%": {
            "normal": "resources/light/icon@1.25x.png"
          },
          "150%": {
            "normal": "resources/light/icon@1.5x.png"
          },
          "175%": {
            "normal": "resources/light/icon@1.75x.png"
          },
          "200%": {
            "normal": "resources/light/icon@2x.png"
          }
        },
        {
          "style": "dark",
                    
          "100%": {
            "normal": "resources/dark/icon.png"
          },
          "125%": {
            "normal": "resources/dark/icon@1.25x.png"
          },
          "150%": {
            "normal": "resources/dark/icon@1.5x.png"
          },
          "175%": {
            "normal": "resources/dark/icon@1.75x.png"
          },
          "200%": {
            "normal": "resources/dark/icon@2x.png"
          }
        }
      ],
      "isViewer": false,
      "EditorsSupport": ["word"],

      "isVisual": false,
      "isModal": false,
      "isInsideMode": false,
      "isSystem": false,

      "initDataType": "none",
      "initData": "",

      "buttons": [],

      "events": [
        "onContextMenuShow",
        "onTargetPositionChanged"
      ]
    }
  ]
}
```

## index.html

``` html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>example context menu and events</title>
        <script type="text/javascript" src="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.js"></script>    
        <script src="scripts/code.js"></script>
    </head>
    <body>
    </body>
</html>
```

## Plugin code

``` ts
console.log("work")
window.Asc.plugin.init = function init() {}
window.Asc.plugin.button = function button(id) {
  this.executeCommand("close", "")
}
window.Asc.plugin.event_onContextMenuShow = function event_onContextMenuShow(options) {
  switch (options.type) {
  case "Target":

    this.executeMethod("AddContextMenuItem", [{
      guid: this.guid,
      items: [
        {
          id: "onClickItem1",
          text: {en: "Item 1", de: "Menü 1"},
          items: [
            {
              id: "onClickItem1Sub1",
              text: {en: "Subitem 1", de: "Untermenü 1"},
              disabled: true,
            },
            {
              id: "onClickItem1Sub2",
              text: {en: "Subitem 2", de: "Untermenü 2"},
              separator: true,
            },
          ],
        },
        {
          id: "onClickItem2",
          text: {en: "Item 2", de: "Menü 2"},
        },
      ],
    }])
    break

  case "Selection":

    this.executeMethod("AddContextMenuItem", [{
      guid: this.guid,
      items: [
        {
          id: "onClickItem3",
          text: {en: "Item 3", de: "Menü 3"},
        },
      ],
    }])
    break

  case "Image":
  case "Shape":

    this.executeMethod("AddContextMenuItem", [{
      guid: this.guid,
      items: [
        {
          id: "onClickItem4",
          text: {en: "Item 4", de: "Menü 4"},
        },
      ],
    }])
    break

  default:
    break
  }
}
window.Asc.plugin.attachContextMenuClickEvent("onClickItem1Sub1", () => {
  window.Asc.plugin.executeMethod("InputText", ["clicked: onClickItem1Sub1"])
})
window.Asc.plugin.attachContextMenuClickEvent("onClickItem1Sub2", () => {
  window.Asc.plugin.executeMethod("InputText", ["clicked: onClickItem1Sub2"])
})
window.Asc.plugin.attachContextMenuClickEvent("onClickItem2", () => {
  window.Asc.plugin.executeMethod("InputText", ["clicked: onClickItem2"])
})
window.Asc.plugin.attachContextMenuClickEvent("onClickItem3", () => {
  window.Asc.plugin.executeMethod("InputText", ["clicked: onClickItem3"])
})
window.Asc.plugin.attachContextMenuClickEvent("onClickItem4", () => {
  console.log("clicked: onClickItem4")
})
window.Asc.plugin.event_onTargetPositionChanged = function event_onTargetPositionChanged() {
  console.log("event: onTargetPositionChanged")
}
```

## Methods and events

- button
- init
- onTargetPositionChanged
- attachContextMenuClickEvent
- executeMethod ("AddContextMenuItem")
- executeMethod ("InputText")

## Support

If you want to request a feature or report a bug regarding this plugin, use the issues section on [GitHub](https://github.com/ONLYOFFICE/sdkjs-plugins/issues).
