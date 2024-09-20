## Description

Connects [youtube iframe\_api](https://developers.google.com/youtube/iframe_api_reference) for embedding YouTube videos into documents as OLE objects and managing them by adjusting their size, rotating, and changing position.

**Plugin type:** visual, OLE object, non-system.

**Supported editors:** documents, spreadsheets, presentations.

![Youtube](/assets/images/plugins/gifs/youtube.gif)

## Installation

Available by default in the cloud, on-premises and desktop versions of ONLYOFFICE editors.

You can remove it following the [desktop](../../Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md), [on-premises](../../Adding%20plugins/ONLYOFFICE%20Docs%20on-premises/index.md), or [cloud](../../Adding%20plugins/ONLYOFFICE%20Cloud/index.md) installation instructions.

The plugin guid: {38E022EA-AD92-45FC-B22B-49DF39746DB4}.

## Usage

1. Find the plugin on the **Plugins** tab.
2. Insert the YouTube video URL you want to embed into the form and click the **OK** button.
3. The video preview in the form of an image will appear in your document. Click it to play the video.

## Plugin structure

Repository on GitHub: <https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/youtube>.

1. *config.json*, *index.html*, and *youtube.js*

2. Icons

3. The *translations* folder contains translations into Russian, German, Spanish, Czech, and French.

4. Third-party service:

   - [Youtube iframe\_api](https://developers.google.com/youtube/iframe_api_reference) lets the user embed a YouTube video player on the website and control the player using JavaScript. License: [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0).

## Config

``` json
{
  "name": "YouTube",
  "nameLocale": {
    "fr": "YouTube",
    "es": "YouTube",
    "pt-BR": "YouTube",
    "de": "YouTube"
  },
  "guid": "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}",
  "version": "1.0.4",

  "variations": [
    {
      "description": "Easily embed YouTube videos into your documents.",
      "descriptionLocale": {
        "fr": "Insérez facilement des vidéos YouTube dans vos documents.",
        "es": "Inserte fácilmente vídeos de YouTube en sus documentos.",
        "pt-BR": "Incorpore facilmente vídeos do YouTube em seus documentos.",
        "de": "Betten Sie ganz einfach YouTube-Videos in Ihre Dokumente ein."
      },
      "url": "index.html",

      "icons": ["resources/img/icon.png", "resources/img/icon@2x.png"],
      "icons2": [
        {
          "100%": {"normal": "resources/img/icon.png"},
          "125%": {"normal": "resources/img/icon@1.25x.png"},
          "150%": {"normal": "resources/img/icon@1.5x.png"},
          "175%": {"normal": "resources/img/icon@1.75x.png"},
          "200%": {"normal": "resources/img/icon@2x.png"}
        }
      ],
      "isViewer": true,
      "isDisplayedInViewer": false,
      "EditorsSupport": ["word", "cell", "slide"],
      "isVisual": true,
      "isModal": true,
      "isInsideMode": false,
      "initDataType": "ole",
      "isUpdateOleOnResize": false,

      "buttons": [
        {
          "text": "Ok",
          "primary": true,
          "isViewer": false
        },
        {
          "text": "Cancel",
          "primary": false,
          "isViewer": true,
          "textLocale": {
            "fr": "Annuler",
            "es": "Cancelar",
            "de": "Abbrechen"
          }
        }
      ],

      "size": [350, 90],
      "store": {
        "background": {
          "light": "#ED3323",
          "dark": "#ED3323"
        },
        "screenshots": [
          "resources/store/screenshots/screen_1.png",
          "resources/store/screenshots/screen_2.png"
        ],
        "icons": {
          "light": "resources/store/icons",
          "dark": "resources/store/icons"
        },
        "categories": ["specAbilities", "entertainment", "recommended"]
      }
    }
  ]
}
```

## Methods and events

- button
- init
- onTranslate
- executeMethod ("AddOleObject")
- executeMethod ("EditOleObject")
- resizeWindow
- info.data
- info.guid
- info.height
- info.imgSrc
- info.mmToPx
- info.objectId
- info.resize
- info.width

## Supports

If you want to request a feature or report a bug regarding this plugin, use the issues section on [GitHub](https://github.com/ONLYOFFICE/onlyoffice.github.io/issues).
