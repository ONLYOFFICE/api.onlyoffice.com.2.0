## Description

Adds a clippy assistant to the document editor.

**Plugin type:** visual, non-system.

**Supported editors:** documents, spreadsheets, presentations.

![Clippy](/assets/images/plugins/gifs/clippy.gif)

## Installation

Download this plugin from [GitHub](https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/clippy) and install it following the [desktop](../../Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md), [on-premises](../../Adding%20plugins/ONLYOFFICE%20Docs%20on-premises/index.md), or [cloud](../../Adding%20plugins/ONLYOFFICE%20Cloud/index.md) installation instructions.

## Usage

1. Find the plugin in the **Plugins** tab.
2. Select any assistant from the drop down list.
3. Click the assistant to start a random animation.

## Plugin structure

Repository on GitHub: <https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/clippy>.

1. *config.json*, *index.html*, and *code.js*

2. Icons

3. *index\_about.html* for the plugin **About** window

4. Third-party services:

   - [jQuery](https://jquery.com) - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. License: [MIT License](https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/clippy/licenses/jQuery.license).
   - [clippy.js](https://www.smore.com/clippy-js) is a full Javascript implementation of Microsoft Agent (AKA Clippy and friends), ready to be embedded in any website. License: [MIT License](https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/clippy/licenses/clippy.license).

## Config

``` json
{
  "name": "Clippy",
  "guid": "asc.{5C521CB8-FD20-4CA3-83D7-1EEB8F4DC759}",

  "variations": [
    {
      "description": "Clippy",
      "url": "index.html",

      "icons": ["resources/img/icon.png", "resources/img/icon@2x.png"],
      "isViewer": true,
      "EditorsSupport": ["word", "slide", "cell"],

      "isVisual": true,
      "isModal": false,
      "isInsideMode": true,

      "initDataType": "none",
      "initData": "",

      "buttons": []
    },
    {
      "description": "About",
      "url": "index_about.html",

      "icons": ["resources/img/icon.png", "resources/img/icon@2x.png"],
      "isViewer": false,
      "EditorsSupport": ["word", "slide", "cell"],

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

      "size": [400, 50]
    }
  ]
}
```

## Methods and events

- button
- init

## Support

If you want to request a feature or report a bug regarding this plugin, use the issues section on [GitHub](https://github.com/ONLYOFFICE/sdkjs-plugins/issues).
