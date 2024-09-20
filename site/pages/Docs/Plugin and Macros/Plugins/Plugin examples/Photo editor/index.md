## Description

Connects the [Toast UI Image Editor](https://ui.toast.com/tui-image-editor) for editing images right in the document: cropping, resizing, applying effects, etc.

**Plugin type:** visual, non-system.

**Supported editors:** documents, spreadsheets, presentations.

![PhotoEditor](/assets/images/plugins/gifs/photo-editor.gif)

## Installation

Available by default in the cloud, on-premises and desktop versions of ONLYOFFICE editors.

You can remove it following the [desktop](../../Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md), [on-premises](../../Adding%20plugins/ONLYOFFICE%20Docs%20on-premises/index.md), or [cloud](../../Adding%20plugins/ONLYOFFICE%20Cloud/index.md) installation instructions.

The plugin guid: {07FD8DFA-DFE0-4089-AL24-0730933CC80A}.

## Usage

1. Select an image in your document.
2. Find the plugin on the **Plugins** tab.
3. Below the image, you will find different settings for editing.
4. After setting all the parameters up, press the **OK** button.

## Plugin structure

Repository on GitHub: <https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/photoeditor>.

1. *config.json*, *index.html*, and *photoeditor.js*

2. Icons

3. The *translations* folder contains translations into Russian, German, Spanish, Czech, and French.

4. *index\_about.html* for the plugin **About** window

5. *black-theme.css*, *black-theme.js*, *white-theme.css* and *white-theme.js* are used to adjust the dark or light plugin theme

6. Third-party services:

   - [jQuery](https://jquery.com) - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. License: [MIT License](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/photoeditor/licenses/jQuery.license).
   - [Toast UI Image Editor](https://ui.toast.com/tui-image-editor) is a full featured image editor that uses HTML5 Canvas. It's easy to use and provides powerful filters. License: [MIT License](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/photoeditor/licenses/Tui.license).

## Config

``` json
{
  "name": "Photo Editor",
  "nameLocale": {
    "fr": "Photo Editor",
    "es": "Editor de Fotos",
    "pt-BR": "Editor de foto",
    "de": "Foto-Editor"
  },
  "guid": "asc.{07FD8DFA-DFE0-4089-AL24-0730933CC80A}",
  "version": "1.0.1",
  "baseUrl": "",

  "variations": [
    {
      "description": "Edit images, screenshots, and photos right in your documents: crop, resize, apply effects.",
      "descriptionLocale": {
        "fr": "Modifiez des images, des captures d'écran et des photos directement dans vos documents: coupez, ajustez, appliquez des effets.",
        "es": "Edite imágenes, capturas de pantalla y fotos directamente en sus documentos: recorte, cambie el tamaño y aplique efectos.",
        "pt-BR": "Edite imagens, capturas de tela e fotos diretamente em seus documentos: corte, redimensione e aplique efeitos.",
        "de": "Bearbeiten Sie Bilder, Screenshots und Fotos direkt in Dokumenten: Zuschneiden, Größe ändern, Effekte anwenden."
      },
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
      "EditorsSupport": ["word", "cell", "slide"],

      "isVisual": true,
      "isModal": true,
      "isInsideMode": false,

      "initDataType": "html",
      "initData": "",

      "buttons": [
        {
          "text": "Ok",
          "primary": true
        },
        {
          "text": "Cancel",
          "primary": false,
          "isViewer": false,
          "textLocale": {
            "fr": "Annuler",
            "es": "Cancelar",
            "de": "Abbrechen"
          }
        }
      ],

      "size": [10000, 10000],
      "store": {
        "background": {
          "light": "linear-gradient(180deg, #FF8E3D 0%, #FF6F3D 100%)",
          "dark": "linear-gradient(180deg, #FF8E3D 0%, #FF6F3D 100%)"
        },
        "screenshots": [
          "resources/store/screenshots/screen_1.png",
          "resources/store/screenshots/screen_2.png"
        ],
        "icons": {
          "light": "resources/store/icons",
          "dark": "resources/store/icons"
        },
        "categories": ["specAbilities", "work", "recommended"]
      }
    },
    {
      "description": "About",
      "descriptionLocale": {
        "fr": "À propos",
        "es": "Sobre programa",
        "de": "Über"
      },
      "url": "index_about.html",

      "icons": ["resources/img/icon.png", "resources/img/icon@2x.png", "resources/img/icon2.png", "resources/img/icon2@2x.png"],
      "isViewer": false,
      "EditorsSupport": ["word", "cell", "slide"],

      "isVisual": true,
      "isModal": true,
      "isInsideMode": false,

      "initDataType": "none",
      "initData": "",

      "size": [392, 147]
    }
  ]
}
```

## Methods and events

- button
- init
- onTranslate
- callCommand
- executeMethod ("GetImageDataFromSelection")
- executeMethod ("GerVersion")
- executeMethod ("PutImageDataToSelection")
- resizeWindow
- Asc.scope object
- info.editorType

## Support

If you want to request a feature or report a bug regarding this plugin, use the issues section on [GitHub](https://github.com/ONLYOFFICE/onlyoffice.github.io/issues).
