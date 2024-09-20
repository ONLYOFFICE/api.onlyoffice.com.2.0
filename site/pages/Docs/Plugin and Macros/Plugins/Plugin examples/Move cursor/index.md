## Description

Moves the text cursor to the document start/end.

**Plugin type:** visual, non-system.

**Supported editors:** documents.

![MoveCursor](/assets/images/plugins/gifs/move-cursor.gif)

## Installation

Download this plugin from [GitHub](https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_move_cursor) and install it following the [desktop](../../Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md), [on-premises](../../Adding%20plugins/ONLYOFFICE%20Docs%20on-premises/index.md), or [cloud](../../Adding%20plugins/ONLYOFFICE%20Cloud/index.md) installation instructions.

## Usage

1. Open the **Plugins** tab and press **Example move cursor**.
2. Press the **Start** button to move the text cursor to the document beginning.
3. Press the **End** button to move the text cursor to the document end.

## Plugin structure

Repository on GitHub: <https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_move_cursor>.

1. *config.json*, *index.html*, and *code.js*
2. Icons

## Config

``` json
{
  "name": "Example move cursor",
  "guid": "asc.{EF5735E0-69A7-4D4A-9ABE-F58FD70F488D}",

  "variations": [
    {
      "description": "Example move cursor",
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

      "isVisual": true,
      "isModal": false,
      "isInsideMode": true,

      "initDataType": "none",
      "initData": "",

      "buttons": []

    }
  ]
}
```

## Methods and events

- button
- init
- executeMethod ("MoveCursorToStart")
- executeMethod ("MoveCursorToEnd")

## Support

If you want to request a feature or report a bug regarding this plugin, use the issues section on [GitHub](https://github.com/ONLYOFFICE/sdkjs-plugins/issues).
