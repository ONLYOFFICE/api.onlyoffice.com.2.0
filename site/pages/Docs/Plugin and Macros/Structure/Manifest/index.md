---
order: -5
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

Path to the plugin. All other paths are calculated relative to this path. If *baseUrl == ""*, the path to the plugin in the default *sdkjs-plugins* folder will be used.

Type: string

Example: ""

## group

Plugin group that is separated from other plugins in the **Plugins** tab. The first group usually includes the **Plugin Manager** and **Background plugins**, if they exist. The second group is for **Macros**. Other plugins are placed after them in the third group. You can add as many groups as you need. If this parameter is omitted, the plugin will be added to the last group.

Type: object

Example:

``` json
{
  "name": "group name",
  "rank": 2
} 
```

### group.name

The group name.

Type: string

Example: "group name"

### group.rank

The group rank in the **Plugins** tab, an integer starting from 1.

Type: number

Example: 2

![Plugin groups](/assets/images/plugins/plugin-groups.png)

## guid

Plugin identifier. It **must** be of the *asc.{UUID}* type.

Type: string

Example: "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}"

## help

Path to the plugin help page. If the parameter is specified, the *help* button is displayed in the plugin window. When the user clicks the button, he follows the link to the plugin help page.

Type: string

Example: "url_to_help_page"

![Plugin help](/assets/images/plugins/plugin-help.png)

## minVersion

The minimum editor version which supports the current plugin.

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

Plugin variations, or subplugins, that are created inside the origin plugin. More information you can find [here](Variations/index.md).

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
    "icons": "url_to_icon",
    "initData": "",
    "initDataType": "ole",
    "initOnSelectionChanged": true,
    "isCustomWindow": true,
    "isDisplayedInViewer": true,
    "isUpdateOleOnResize": true,
    "isViewer": true,
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

The list of skinnable plugin buttons used in the plugin interface. This parameter is used only for plugin windows and panels, i.e. when the [type](#variationstype) parameter is *window*, *panel*, or *panelRight*.

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

![Plugin buttons](/assets/images/plugins/plugin-buttons.png)

### variations.cryptoDisabledForExternalCloud

Specifies whether the encryption for the third-party clouds is disabled.

Type: string

Example: "true"

### variations.cryptoDisabledForInternalCloud

Specifies whether the encryption for the local files is disabled.

Type: string

Example: "true"

### variations.cryptoDisabledOnStart

Specifies whether the encryption is disabled upon startup.

Type: string

Example: "true"

![Encryption disabled](/assets/images/plugins/encryption-disabled.png)

### variations.cryptoMode

The encryption mode. The available values:

- **0** - none (encryption is disabled);
- **1** - simple;
- **2** - advanced.

Type: string

Example: "1" 

### variations.description

The description, i.e. what describes your plugin the best way. It will be displayed in the **ONLYOFFICE Plugin Marketplace**.

Type: string

Example: "plugin description"

![Plugin description](/assets/images/plugins/plugin-description.png)

### variations.descriptionLocale

Translations for the description field. The object keys are the two letter language codes (fr, de, it, etc.) and the values are the plugin description translation for each language.

Type: localeTranslate

Example:  { "fr": "french plugin description" }

### variations.EditorsSupport

The editors which the plugin is available for (**word**, **cell**, **slide**, or **pdf**).

Type: array of editorType

Example:  \["word"]

### variations.events

Plugin events which are used in the current plugin code. Find out how to subscribe to events [here](../../Interacting%20with%20editors/Overview/How%20to%20attach%20events/index.md).

Type: array of EventType

Example:  \["onClick"] 

### variations.icons

URL to the plugin icon image file. This URL allows setting your own rules for theme (name, type), styles (normal, hover, active), and scaling. More information can be found [here](../Icons/index.md).

Type: string

Example:  "url_to_icon"

### variations.icons2

Deprecated. Scalable icons for plugin extensions. More information can be found [here](../Icons/index.md).

Type: array of objects

Example:  \[ { "100%": { "normal": "icon.png" } } ]

### variations.initData

The data which is sent from the editor to the plugin at the plugin start. This parameter is usually equal to *""*. If *initDataType == "text"*, the plugin will receive the selected text upon launch. It may also be equal to *encryption* in the encryption plugins.

Type: string

Example:  "text"

![Init data](/assets/images/plugins/init-data.png)

### variations.initDataType

The data type selected in the editor and sent to the plugin (**text**, **html**, **ole**, **desktop**, **desktop-external**, **sign**, or **none**).

Type: initDataType

Example:  "ole"

### variations.initOnSelectionChanged

Specifies if the plugin watches the text selection events in the editor window. This parameter is set to **true** when the plugin works with the selected text and its output changes when the selection changes. For example, the **Translator** plugin displays the translation of the selected text.

Type: boolean

Example:  true

### variations.isCustomWindow

Specifies if the plugin uses a custom window, without standard borders and buttons (used only when *type == "window"*).

Type: boolean

Example:  true

### variations.isDisplayedInViewer

Specifies if the plugin will be displayed in the viewer mode as well as in the editor mode (*isDisplayedInViewer == true*) or in the editor mode only (*isDisplayedInViewer == false*).

Type: boolean

Example:  true

### variations.isInsideMode

Deprecated. Please use the [type](#variationstype) parameter instead. Specifies if the plugin must be displayed inside the editor panel instead of its own window.

Type: boolean

Example:  true

### variations.isModal

Deprecated. Please use the [type](#variationstype) parameter instead. Specifies if the opened plugin window is modal (used for visual plugins only, and if *isInsideMode* is not **true**).

Type: boolean

Example:  true

### variations.isSystem

Deprecated. Please use the [type](#variationstype) parameter instead. Specifies if the plugin is not displayed in the editor interface and is started in the background with the server (or desktop editors start) not interfering with other plugins, so that they can work simultaneously. Such a plugin cannot be disabled in the editor window.

Type: boolean

Example:  false

### variations.isUpdateOleOnResize

Specifies if an OLE object must be redrawn when resized in the editor using the vector object drawing type or not (used for OLE objects only, i.e. *initDataType == "ole"*).

Type: boolean

Example:  true

### variations.isViewer

Specifies if the plugin is working when the document is available in the viewer mode only or not. The default value is **false**.

Type: boolean

Example:  false

### variations.isVisual

Deprecated. Please use the [type](#variationstype) parameter instead. Specifies if the plugin is visual (will open a window for some action, or introduce some additions to the editor panel interface) or non-visual (will provide a button (or buttons) which is going to apply some transformations or manipulations to the document).

Type: boolean

Example:  true

### variations.menu

Deprecated. Please use the [type](#variationstype) parameter instead. Specifies where the plugin will be placed (on the right or left panel).

Type: string

Example:  "right"

### variations.screens

Deprecated. Please use the [variations.store.screenshots](#variationsstorescreenshots) parameter instead. Plugin screenshot image files used in the **ONLYOFFICE Plugin Marketplace** for the plugin description.

Type: array of strings

Example:  \["resources/store/screenshots/screen\_1.png"]

### variations.size

Plugin window size measured in pixels. This parameter is only used when *type == "window"*.

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

![Light icon](/assets/images/plugins/icon-light.png)

### variations.store.background.dark

The background color used for the dark theme plugin icon.

Type: string

Example: "#444444"

![Dark icon](/assets/images/plugins/icon-dark.png)

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

![Plugin categories](/assets/images/plugins/plugin-categories.png)

### variations.store.icons

Paths to the plugin icon image files used in the **ONLYOFFICE Plugin Marketplace**.

Type: object

Example:

``` json
{
  "light": "resources/store/icons",
  "dark": "resources/store/icons"
}
```

### variations.store.icons.light

The path to the scalable plugin icons for the light theme. Name the icon files of different scales in the following way:

- 100% - `icon.png`
- 125% - `icon@1.25.png`
- 150% - `icon@1.5x.png`
- 175% - `icon@1.75.png`
- 200% - `icon@2x.png`

Type: string

Example: "resources/store/icons"

### variations.store.icons.dark

The path to the scalable plugin icons for the dark theme. Name the icon files of different scales in the following way:

- 100% - `icon.png`
- 125% - `icon@1.25.png`
- 150% - `icon@1.5x.png`
- 175% - `icon@1.75.png`
- 200% - `icon@2x.png`

Type: string

Example: "resources/store/icons"

### variations.store.screenshots

Images that are used for the plugin description in the **ONLYOFFICE Plugin Marketplace**.

Type: array of strings

Example: \["resources/store/screenshots/screen\_1.png"]

![Plugin screenshots](/assets/images/plugins/plugin-screenshots.png)

### variations.type

Plugin [type](../Manifest/Types/index.md). The following values are available:

- **"system"**. The system plugin is not displayed in the editor interface and is started in the background with the server (or desktop editors start) not interfering with other plugins, so that they can work simultaneously. Such a plugin cannot be disabled in the editor window.
- **"background"**. The background plugin runs continuously once started. Its state (enabled / disabled) persists between sessions. To access background plugins, click the **Background Plugins** button on the top toolbar.
- **"window"**. A plugin that operates as a standalone window upon launch.
- **"panel"**. A plugin that opens in the left-side panel.
- **"panelRight"**. A plugin that opens in the right-side panel.
- **"unvisible"**. A plugin that is invisible upon launch.

Please note that a plugin of any type can create windows and tabs during its work.

Type: string

Example: "background"

### variations.url

Plugin entry point, i.e. an HTML file which connects the *plugin.js* file (the base file needed for work with plugins) and launches the plugin code. See the [index.html](../Entry%20point/index.md) section for the detailed information.

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
    "name": "group name",
    "rank": 2
  },
  "guid": "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}",
  "help": "url_to_help_page",
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
      "icons": "url_to_icon",
      "initData": "",
      "initDataType": "ole",
      "initOnSelectionChanged": true,
      "isCustomWindow": true,
      "isDisplayedInViewer": true,
      "isUpdateOleOnResize": true,
      "isViewer": true,
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
