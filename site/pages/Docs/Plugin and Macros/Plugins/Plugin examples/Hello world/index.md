## Description

Inserts the *Hello world!* phrase when the user presses the button.

**Plugin type:** non-visual, non-system.

**Supported editors:** documents.

![HelloWorld](/assets/images/plugins/gifs/hello-world.gif)

## Installation

Download this plugin from [GitHub](https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/helloworld) and install it following the [desktop](../../Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md), [on-premises](../../Adding%20plugins/ONLYOFFICE%20Docs%20on-premises/index.md), or [cloud](../../Adding%20plugins/ONLYOFFICE%20Cloud/index.md) installation instructions.

## Usage

1. Find the plugin on the **Plugins** tab.
2. Click the **hello world** button.

## Plugin structure

Repository on GitHub: <https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/helloworld>.

1. *config.json*, *index.html*, and *helloworld.js*
2. Icons
3. *index\_about.html* for the plugin **About** window

## Config

``` json
{
  "name": "hello world",
  "guid": "asc.{0616AE85-5DBE-4B6B-A0A9-455C4F1503AD}",
  "baseUrl": "",
  "variations": [
    {
      "description": "hello world",
      "url": "index.html",

      "icons": ["resources/img/icon.png", "resources/img/icon@2x.png"],
      "isViewer": false,
      "EditorsSupport": ["word"],

      "isVisual": false,

      "initDataType": "none",
      "initData": "",

      "buttons": []
    },
    {
      "description": "About",
      "url": "index_about.html",

      "icons": ["resources/img/icon.png", "resources/img/icon@2x.png"],
      "isViewer": false,
      "EditorsSupport": ["word"],

      "isVisual": true,
      "isModal": true,
      "isInsideMode": false,

      "initDataType": "none",
      "initData": "",

      "buttons": [
        {
          "text": "Ok",
          "primary": true
        }
      ],

      "size": [392, 147]
    }
  ]
}
```

## Methods and events

- button
- init
- callCommand
- Asc.scope object
- info.recalculate

## Support

If you want to request a feature or report a bug regarding this plugin, use the issues section on [GitHub](https://github.com/ONLYOFFICE/sdkjs-plugins/issues).
