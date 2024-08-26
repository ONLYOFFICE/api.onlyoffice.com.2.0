## Description

Gets the document content as HTML code, modifies it, and pastes back to the document.

**Plugin type:** visual, non-system.

**Supported editors:** documents, spreadsheets, presentations.

**Analogue:** [Doc2md](https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/doc2md).

![GetAndPasteHTML](/assets/images/plugins/gifs/get-and-paste-html.gif)

## Installation

Available by default in ONLYOFFICE Enterprise Edition and Community Edition (Docs + Workspace).

You can also download this plugin from the [ONLYOFFICE App Directory](https://www.onlyoffice.com/en/app-directory/html) and install it following the [desktop](../../Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md) or [cloud](../../Adding%20plugins/ONLYOFFICE%20Cloud/index.md) installation instructions.

## Usage

1. Select the necessary content.
2. Open the **Plugins** tab and press **Get and past html**.
3. The *HTML* code of the selected content will be automatically displayed in the plugin window. You can modify this code or write your own one.
4. To paste the modified or your own HTML code into the document, press the **Paste into document** button.

## Plugin structure

Repository on GitHub: <https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/html>.

1. *config.json*, *index.html*, and *code.js*

2. Icons

3. The *translations* folder which contains translations into Russian, German, Spanish, Czech, and French.

4. Third-party service:

   - [CodeMirror](https://codemirror.net/)- versatile text editor implemented in JavaScript for the browser. License: [MIT License](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/html/licenses/codemirror.license).
   - [prettier.js](https://github.com/prettier/prettier) - an opinionated code formatter. License: [MIT License](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/html/licenses/prettier.license).

## Config

``` json
{
  "name": "HTML",
  "nameLocale": {
    "fr": "HTML",
    "es": "HTML",
    "pt-BR": "HTML",
    "de": "HTML"
  },
  "guid": "asc.{E581C417-3C80-4BC2-B42D-502850FDC1E7}",
  "version": "1.0.3",

  "variations": [
    {
      "description": "Get your document content as HTML code, modify it, and paste back to the document.",
      "descriptionLocale": {
        "fr": "Obtenez le contenu de votre document sous forme de code HTML, modifiez-le et collez-le dans le document.",
        "es": "Obtenga el contenido de su documento como código HTML, modifíquelo y péguelo de nuevo en el documento.",
        "pt-BR": "Obtenha o conteúdo do seu documento como código HTML, modifique-o e cole-o novamente no documento.",
        "de": "Erhalten Sie den Inhalt Ihres Dokuments als HTML-Code, modifizieren und fügen Sie ihn wieder ins Dokument ein."
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
      "isViewer": true,
      "EditorsSupport": ["word", "cell", "slide", "pdf"],
      "isVisual": true,
      "isModal": false,
      "isInsideMode": true,
      "initDataType": "html",
      "initOnSelectionChanged": true,
      "store": {
        "background": {
          "light": "#F5F5F5",
          "dark": "#444444"
        },
        "screenshots": [
          "resources/store/screenshots/screen_1.png",
          "resources/store/screenshots/screen_2.png"
        ],
        "icons": {
          "light": "resources/store/icons",
          "dark": "resources/store/icons"
        },
        "categories": ["specAbilities", "work", "devTools"]
      }
    }
  ]
}
```

## Methods and events

- button
- init
- onTranslate
- executeMethod ("PasteHtml")

## Support

If you want to request a feature or report a bug regarding this plugin, use the issues section on [GitHub](https://github.com/ONLYOFFICE/onlyoffice.github.io/issues).
