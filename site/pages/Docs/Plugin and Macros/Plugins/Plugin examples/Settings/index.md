## Description

Protects a document using a watermark.

**Plugin type:** non-visual, system.

**Supported editors:** documents, spreadsheets, presentations.

![Settings](/assets/images/plugins/gifs/settings.gif)

## Installation

Download this plugin from [GitHub](https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/settings) and install it following the [desktop](../../Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md), [on-premises](../../Adding%20plugins/ONLYOFFICE%20Docs%20on-premises/index.md), or [cloud](../../Adding%20plugins/ONLYOFFICE%20Cloud/index.md) installation instructions.

## Usage

1. After adding the plugin to the editor, just reopen the document. A watermark will be displayed.

## Plugin structure

Repository on GitHub: <https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/settings>.

1. *config.json*, *index.html*, and *code.js*

## Config

``` json
{
  "name": "settings",
  "guid": "asc.{CF3A000F-C6B4-451D-AC0B-F3DDAB1880D2}",
  "baseUrl": "",
  "variations": [
    {
      "description": "settings",
      "url": "index.html",

      "isViewer": true,
      "EditorsSupport": ["word", "cell", "slide"],

      "isSystem": true,
      "isVisual": false,

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
- executeMethod ("SetProperties")

## Support

If you want to request a feature or report a bug regarding this plugin, use the issues section on [GitHub](https://github.com/ONLYOFFICE/sdkjs-plugins/issues).
