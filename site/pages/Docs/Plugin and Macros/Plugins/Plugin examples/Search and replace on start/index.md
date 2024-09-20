## Description

Searches for and replaces text in the document when it is reopened.

**Plugin type:** non-visual, system.

**Supported editors:** documents.

![SearchAndReplaceOnStart](/assets/images/plugins/gifs/search-and-replace-on-start.gif)

## Installation

Download this plugin from [GitHub](https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/searchAndReplaceOnStart) and install it following the [desktop](../../Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md), [on-premises](../../Adding%20plugins/ONLYOFFICE%20Docs%20on-premises/index.md), or [cloud](../../Adding%20plugins/ONLYOFFICE%20Cloud/index.md) installation instructions.

## Usage

1. Enter any text into the document (in this example, it is *ONLYOFFICE*).
2. In the plugin code, enter the replacement text in **replaceString** parameter.
3. Reopen the document.

## Plugin structure

Repository on GitHub: <https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/searchAndReplaceOnStart>.

1. *config.json*, *index.html*, and *code.js*

## Config

``` json
{
  "name": "searchAndReplaceOnStart",
  "guid": "asc.{C820F3CC-1248-4CA2-8D0F-D7EFD44DE09C}",
  "baseUrl": "",
  "variations": [
    {
      "description": "searchAndReplaceOnStart",
      "url": "index.html",

      "isViewer": true,
      "EditorsSupport": ["word"],

      "isSystem": true,
      "isVisual": false,

      "initDataType": "none",
      "initData": "",

      "buttons": [],

      "events": ["onDocumentContentReady"]
    }
  ]
}
```

## Methods and events

- button
- init
- onDocumentContentReady
- executeMethod ("SearchAndReplace")

## Support

If you want to request a feature or report a bug regarding this plugin, use the issues section on [GitHub](https://github.com/ONLYOFFICE/sdkjs-plugins/issues).
