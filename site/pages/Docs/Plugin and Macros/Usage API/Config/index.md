---
order: -8
---

The *config.json* file is plugin configuration file containing the information about the main plugin data needed to register the plugin in the editors.

- [baseUrl](#baseurl)
- [group](#group)
  - [group.name](#groupname)
  - [group.rank](#grouprank)
- [guid](#guid)
- [help](#help)
- [minVersion](#minversion)
- [name](#name)
- [nameLocale](#namelocale)
- [offered](#offered)
- [variations](#variations)
  - [variations.buttons](#variationsbuttons)
  - [variations.cryptoDisabledForExternalCloud](#variationscryptodisabledforexternalcloud)
  - [variations.cryptoDisabledForInternalCloud](#variationscryptodisabledforinternalcloud)
  - [variations.cryptoDisabledOnStart](#variationscryptodisabledonstart)
  - [variations.cryptoMode](#variationscryptomode)
  - [variations.description](#variationsdescription)
  - [variations.descriptionLocale](#variationsdescriptionlocale)
  - [variations.EditorsSupport](#variationseditorssupport)
  - [variations.events](#variationsevents)
  - [variations.icons](#variationsicons)
  - [variations.icons2](#variationsicons2)
  - [variations.initData](#variationsinitdata)
  - [variations.initDataType](#variationsinitdatatype)
  - [variations.initOnSelectionChanged](#variationsinitonselectionchanged)
  - [variations.isCustomWindow](#variationsiscustomwindow)
  - [variations.isDisplayedInViewer](#variationsisdisplayedinviewer)
  - [variations.isInsideMode](#variationsisinsidemode)
  - [variations.isModal](#variationsismodal)
  - [variations.isSystem](#variationsissystem)
  - [variations.isUpdateOleOnResize](#variationsisupdateoleonresize)
  - [variations.isViewer](#variationsisviewer)
  - [variations.isVisual](#variationsisvisual)
  - [variations.menu](#variationsmenu)
  - [variations.screens](#variationsscreens)
  - [variations.size](#variationssize)
  - [variations.store](#variationsstore)
  - [variations.store.background](#variationsstorebackground)
  - [variations.store.background.light](#variationsstorebackgroundlight)
  - [variations.store.background.dark](#variationsstorebackgrounddark)
  - [variations.store.categories](#variationsstorecategories)
  - [variations.store.icons](#variationsstoreicons)
  - [variations.store.icons.light](#variationsstoreiconslight)
  - [variations.store.icons.dark](#variationsstoreiconsdark)
  - [variations.store.screenshots](#variationsstorescreenshots)
  - [variations.type](#variationstype)
  - [variations.url](#variationsurl)
- [version](#version)
- [Example](#example)

## baseUrl

Path to the plugin. All the other paths are calculated relative to this path. In case the plugin is installed on the server, an additional parameter (path to the plugins) is added there. If *baseUrl == ""*, the path to all plugins will be used.

Type: string

Example: ""

## group

Plugin group that is separated from other plugins in the **Plugins** tab.

Type: object

Example:

``` json
{
  "name": "Macros",
  "rank": 2
} 
```

### group.name

The group name.

Type: string

Example: "Macros"

### group.rank

The group rank in the **Plugins** tab.

Type: number

Example: 2

## guid

Plugin identifier. It **must** be of the *asc.{UUID}* type.

Type: string

Example: "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}"

## help

Path to the plugin description page. If the parameter is specified, the *help* button is displayed in the plugin window. When the user clicks the button, he follows the link to the plugin description page.

Type: string

Example: ""

## minVersion

The minimum supported editors version.

Type: string

Example: "6.3.0"

## name

Plugin name which will be visible at the plugin toolbar.

Type: string

Example: "plugin name"

## nameLocale

Translations for the name field. The object keys are the two letter language codes (ru, de, it, etc.) and the values are the plugin name translation for each language.

Type: localeTranslate

Example: { "fr": "french plugin name" }

## offered

Plugin author who proposed the plugin for publication.

Type: string

Example: "John Smith"

## variations

Plugin variations, or subplugins, that are created inside the origin plugin. More information you can find [here](Plugin%20variations/index.md).

Type: array of objects

Example: 

``` json
[
  {
    "buttons": [
      { 
        "text": "Cancel",
        "primary": false,
        "isviewer": false,
        "textLocale": {
          "fr": "Annuler",
          "es": "Cancelar"
        }
      }
    ],
    "cryptoDisabledForExternalCloud": "true",
    "cryptoDisabledForInternalCloud": "true",
    "cryptoDisabledOnStart": "true",
    "cryptoMode": "1",
    "description": "plugin description",
    "descriptionLocale": {
      "fr": "french plugin description",
      "es": "spanish plugin description"
    },
    "EditorsSupport": ["word", "cell", "slide", "pdf"],
    "events": ["onClick"],
    "icons": ["icon.png", "icon@2x.png"],
    "icons2": [
      {
        "100%": {"normal": "icon.png"},
        "125%": {"normal": "icon@1.25.png"},
        "150%": {"normal": "icon@1.5x.png"},
        "175%": {"normal": "icon@1.75.png"},
        "200%": {"normal": "icon@2x.png"}
      },
      {
        "style": "dark"
      }
    ],
    "initData": "",
    "initDataType": "ole",
    "initOnSelectionChanged": true,
    "isCustomWindow": true,
    "isDisplayedInViewer": true,
    "isInsideMode": false,
    "isModal": true,
    "isSystem": false,
    "isUpdateOleOnResize": true,
    "isViewer": true,
    "isVisual": false,
    "menu": "right",
    "screens": ["resources/store/screenshots/screen_1.png"],
    "size": [600, 700],
    "store": {
      "background": {
        "light": "#F5F5F5",
        "dark": "#444444"
      },
      "categories": ["specAbilities", "work"],
      "icons": {
        "light": "resources/store/icons",
        "dark": "resources/store/icons"
      },
      "screenshots": ["resources/store/screenshots/screen_1.png"]
    },
    "type": "background",
    "url": "index.html"
  }
]
```

### variations.buttons

The list of skinnable plugin buttons used in the plugin interface (used for visual plugins with their own window only, i.e. *isVisual == true && isInsideMode == false*).

Type: array of Button

Example:

``` json
[
  {
    "text": "Cancel",
    "primary": false,
    "isviewer": false,
    "textLocale": {
      "fr": "Annuler",
      "es": "Cancelar"
    }
  }
]
```

### variations.cryptoDisabledForExternalCloud

Specifies if the encryption for the third-party clouds is disabled or not.

Type: string

Example: "true"

### variations.cryptoDisabledForInternalCloud

Specifies if the encryption for the ONLYOFFICE clouds is disabled or not.

Type: string

Example: "true"

### variations.cryptoDisabledOnStart

Specifies if the mode is reset on restart or not.

Type: string

Example: "true"

### variations.cryptoMode

The encryption plugin ID as there are several encryption plugins.

Type: string

Example: "1" 

### variations.description

The description, i.e. what describes your plugin the best way.

Type: string

Example: "plugin description"

### variations.descriptionLocale

Translations for the description field. The object keys are the two letter language codes (ru, de, it, etc.) and the values are the plugin description translation for each language.

Type: localeTranslate

Example:  { "fr": "french plugin description" }

### variations.EditorsSupport

The editors which the plugin is available for (**word**, **cell**, **slide**, or **pdf**).

Type: array of editorType

Example:  \["word"]

### variations.events

Plugin events.

Type: array of EventType

Example:  \["onClick"] 

### variations.icons

Plugin icon image files used in the editors.

Type: array of strings

Example:  \["icon.png"]

### variations.icons2

Scalable icons for plugin extensions. More information can be found [here](Plugin%20icons/index.md).

Type: array of objects

Example:  \[ { "100%": { "normal": "icon.png" } } ]

### variations.initData

Is usually equal to *""* - this is the data which is sent from the editor to the plugin at the plugin start (e.g. if *initDataType == "text"*, the plugin will receive the selected text when run). It may also be equal to *encryption* in the encryption plugins.

Type: string

Example:  ""

### variations.initDataType

The data type selected in the editor and sent to the plugin (**text**, **html**, **ole**, **desktop**, **desktop-external**, **sign**, or **none**).

Type: initDataType

Example:  "ole"

### variations.initOnSelectionChanged

Specifies if the plugin watches the text selection events in the editor window.

Type: boolean

Example:  true

### variations.isCustomWindow

Specifies if the plugin uses a custom window, without standard borders and buttons (used for modal plugins only).

Type: boolean

Example:  true

### variations.isDisplayedInViewer

Specifies if the plugin will be displayed in the viewer mode as well as in the editor mode (*isDisplayedInViewer == true*) or in the editor mode only (*isDisplayedInViewer == false*).

Type: boolean

Example:  true

### variations.isInsideMode

Specifies if the plugin must be displayed inside the editor panel instead of its own window.

Type: boolean

Example:  true

### variations.isModal

Specifies if the opened plugin window is modal (used for visual plugins only, and if *isInsideMode* is not true).

Type: boolean

Example:  true

### variations.isSystem

Specifies if the plugin is not displayed in the editor interface and is started in the background with the server (or desktop editors start) not interfering with the other plugins, so that they can work simultaneously.

Type: boolean

Example:  false

### variations.isUpdateOleOnResize

Specifies if an OLE object must be redrawn when resized in the editor using the vector object draw type or not (used for OLE objects only, i.e. *initDataType == "ole"*).

Type: boolean

Example:  true

### variations.isViewer

Specifies if the plugin is working when the document is available in the viewer mode only or not. The default value is **false**.

Type: boolean

Example:  false

### variations.isVisual

Specifies if the plugin is visual (will open a window for some action, or introduce some additions to the editor panel interface) or non-visual (will provide a button (or buttons) which is going to apply some transformations or manipulations to the document).

Type: boolean

Example:  true

### variations.menu

Specifies where the plugin will be placed (on the right or left panel).

Type: string

Example:  "right"

### variations.screens

Plugin screenshot image files used in the editors.

Type: array of strings

Example:  \["resources/store/screenshots/screen\_1.png"]

### variations.size

Plugin window size

Type: array of numbers

Example:  \[600]

### variations.store

Plugin display options in **ONLYOFFICE Plugin Marketplace**.

Type: object

Example:

``` json
{
  "background": {
    "light": "#F5F5F5",
    "dark": "#444444"
  },
  "categories": ["specAbilities", "work"],
  "icons": {
    "light": "resources/store/icons",
    "dark": "resources/store/icons"
  },
  "screenshots": ["resources/store/screenshots/screen_1.png"]
}
```

### variations.store.background

Background colors used for plugin icons in **ONLYOFFICE Plugin Marketplace**.

Type: object

Example:

``` json
{
  "light": "#F5F5F5",
  "dark": "#444444"
}
```

### variations.store.background.light

The background color used for the light theme plugin icon.

Type: string

Example: "#F5F5F5"

### variations.store.background.dark

The background color used for the dark theme plugin icon.

Type: string

Example: "#444444"

### variations.store.categories

Plugin categories in **ONLYOFFICE Plugin Marketplace**:

- "all" - All,
- "recommended" - Recommended,
- "devTools" - Developer tools,
- "work" - Work,
- "entertainment" - Entertainment,
- "communication" - Communication,
- "specAbilities" - Special abilities.

Type: array of strings

Example: \["specAbilities", "work"]

### variations.store.icons

Plugin icon image files used in **ONLYOFFICE Plugin Marketplace**.

Type: object

Example:

``` json
{
  "light": "resources/store/icons",
  "dark": "resources/store/icons"
}
```

### variations.store.icons.light

The path to the scalable plugin icons for the light theme.

Type: string

Example: "resources/store/icons"

### variations.store.icons.dark

The path to the scalable plugin icons for the dark theme.

Type: string

Example: "resources/store/icons"

### variations.store.screenshots

Images that are used for the plugin description in **ONLYOFFICE Plugin Marketplace**.

Type: array of strings

Example: \["resources/store/screenshots/screen\_1.png"]

### variations.type

Plugin [type](../../Get%20Started/Plugin%20types/index.md). The following values are available: **"system", "background", "window", "panel"**.

Type: string

Example: "background"

### variations.url

Plugin entry point, i.e. an HTML file which connects the *plugin.js* file (the base file needed for work with plugins) and launches the plugin code. See the [index.html](../../Usage%20API/index.html/index.md) section for the detailed information.

Type: string

Example: "index.html"

## version

The plugin version.

Type: string

Example: "1.0"

## Example

``` json
{
  "baseUrl": "",
  "group": {
    "name": "Macros",
    "rank": 2
  },
  "guid": "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}",
  "help": "",
  "minVersion": "6.3.0",
  "name": "plugin name",
  "nameLocale": {
    "fr": "french plugin name",
    "es": "spanish plugin name"
  },
  "offered": "John Smith",
  "variations": [
    {
      "buttons": [
        { 
          "text": "Cancel",
          "primary": false,
          "isviewer": false,
          "textLocale": {
            "fr": "Annuler",
            "es": "Cancelar"
          }
        }
      ],
      "cryptoDisabledForExternalCloud": "true",
      "cryptoDisabledForInternalCloud": "true",
      "cryptoDisabledOnStart": "true",
      "cryptoMode": "1",
      "description": "plugin description",
      "descriptionLocale": {
        "fr": "french plugin description",
        "es": "spanish plugin description"
      },
      "EditorsSupport": ["word", "cell", "slide", "pdf"],
      "events": ["onClick"],
      "icons": ["icon.png", "icon@2x.png"],
      "icons2": [
        {
          "100%": {"normal": "icon.png"},
          "125%": {"normal": "icon@1.25.png"},
          "150%": {"normal": "icon@1.5x.png"},
          "175%": {"normal": "icon@1.75.png"},
          "200%": {"normal": "icon@2x.png"}
        },
        {
          "style": "dark"
        }
      ],
      "initData": "",
      "initDataType": "ole",
      "initOnSelectionChanged": true,
      "isCustomWindow": true,
      "isDisplayedInViewer": true,
      "isInsideMode": false,
      "isModal": true,
      "isSystem": false,
      "isUpdateOleOnResize": true,
      "isViewer": true,
      "isVisual": false,
      "menu": "right",
      "screens": ["resources/store/screenshots/screen_1.png"],
      "size": [600, 700],
      "store": {
        "background": {
          "light": "#F5F5F5",
          "dark": "#444444"
        },
        "categories": ["specAbilities", "work"],
        "icons": {
          "light": "resources/store/icons",
          "dark": "resources/store/icons"
        },
        "screenshots": ["resources/store/screenshots/screen_1.png"]
      },
      "type": "background",
      "url": "index.html"
    }
  ],
  "version": "1.0"
}
```
