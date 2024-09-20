## Description

Counts paragraphs, words, and characters with or without spaces in the selected part of the document.

> The following elements are not included in the word count:
>
> - footnotes/endnotes;
> - numbers from numbered lists;
> - page numbers.

**Plugin type:** visual, non-system.

**Supported editors:** documents.

![CountWordsAndCharacters](/assets/images/plugins/gifs/count-words-and-characters.gif)

## Installation

Available by default in ONLYOFFICE Enterprise Edition and Community Edition (Docs + Workspace).

You can also download this plugin from the [ONLYOFFICE App Directory](https://www.onlyoffice.com/en/app-directory/word-counter) and install it following the [desktop](../../Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md) or [cloud](../../Adding%20plugins/ONLYOFFICE%20Cloud/index.md) installation instructions.

## Usage

1. Select the text.
2. Open the **Plugins** tab and press **Count words and characters**.
3. Calculations will be displayed in the plugin window automatically.

## Plugin structure

Repository on GitHub: <https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/wordscounter>.

1. *config.json*, *index.html*, and *code.js*
2. Icons
3. The *translations* folder contains translations into Russian, German, Spanish, Czech, and French.

## Config

``` json
{
  "name": "Word counter",
  "nameLocale": {
    "fr": "Compteur de mots",
    "es": "Recuento de palabras",
    "pt-BR": "Word counter",
    "de": "Wortanzahl"
  },
  "guid": "asc.{584EEEE8-DBF5-45C3-A4CA-F52177C82754}",
  "version": "1.0.1",

  "variations": [
    {
      "description": "Count words, characters (with/without spaces), and paragraphs in the selected part of your document.",
      "descriptionLocale": {
        "fr": "Comptez les mots, les caractères (avec/sans espaces) et les paragraphes dans la partie sélectionnée de votre document.",
        "es": "Cuente las palabras, los caracteres (con/sin espacios) y los párrafos en la parte seleccionada de su documento.",
        "pt-BR": "Conte palavras, caracteres (com/sem espaços) e parágrafos na parte selecionada do seu documento.",
        "de": "Zählen Sie Wörter, Zeichen (mit/ohne Leerzeichen) und Absätze im ausgewählten Teil Ihres Dokuments."
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
      "EditorsSupport": ["word", "pdf"],
      "isVisual": true,
      "isModal": false,
      "isInsideMode": true,
      "initDataType": "text",
      "initOnSelectionChanged": true,
      "events": ["onTargetPositionChanged"],
      "store": {
        "background": {
          "light": "linear-gradient(180deg, #FF8E3D 0%, #FF6F3D 100%)",
          "dark": "linear-gradient(180deg, #FF8E3D 0%, #FF6F3D 100%)"
        },
        "screenshots": ["resources/store/screenshots/screen_1.png"],
        "icons": {
          "light": "resources/store/icons",
          "dark": "resources/store/icons"
        },
        "categories": ["specAbilities"]
      }
    }
  ]
}
```

## Methods and events

- button
- init
- onTargetPositionChanged
- onTranslate

## Support

If you want to request a feature or report a bug regarding this plugin, use the issues section on [GitHub](https://github.com/ONLYOFFICE/onlyoffice.github.io/issues).
