## Description

Connects the [LanguageTool](https://languagetool.org/) assistant, multilingual grammar, and style checker to check the text for grammar, style, and spell errors.

**Plugin type:** visual, non-system.

**Supported editors:** documents, spreadsheets, presentations.

**Analogue:** [Glavred](https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/glavred), [Grammalecte](https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/grammalecte).

![LanguageTool](/assets/images/plugins/gifs/language-tool.gif)

## Installation

Download this plugin from [GitHub](https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/languagetool) and install it following the [desktop](../../Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md), [on-premises](../../Adding%20plugins/ONLYOFFICE%20Docs%20on-premises/index.md), or [cloud](../../Adding%20plugins/ONLYOFFICE%20Cloud/index.md) installation instructions.

## Usage

1. Open the **Plugins** tab and press **Languagetool**.
2. Select the necessary text or write it in the plugin window.
3. The language is detected automatically, but you can also change it manually.
4. Press the **Check** button.
5. You will receive information about the stylistic and grammatical mistakes and tips for correcting them.
6. To replace the selected text in your document with the corrected text from the field, click **Replace**.

## Plugin structure

Repository on GitHub: <https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/languagetool>.

1. *config.json*, *index.html*, and *langTool.js*

2. Icons

3. *index\_about.html* for the plugin **About** window

4. The *translations* folder contains translations into Russian, German, Spanish, Czech, Italian, Japanese, Dutch, Portuguese, Chinese, and French.

5. *plugin\_style.css* is used to adjust the plugin style.

6. Third-party services:

   - [jQuery](https://jquery.com) - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. License: [MIT License](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/languagetool/licenses/jQuery.license).
   - [Select2](https://select2.org/) gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options. License: [MIT](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/languagetool/licenses/Select2.license).
   - [Languagetool](https://languagetool.org/) is a multilingual grammar and style checker. License: [GNU LESSER GENERAL PUBLIC LICENSE](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/languagetool/licenses/Languagetool's.license).

## Config

``` json
{
  "name": "LanguageTool",
  "nameLocale": {
    "fr": "LanguageTool",
    "es": "LanguageTool",
    "pt-BR": "LanguageTool",
    "de": "LanguageTool"
  },
  "guid": "asc.{7CDB02C9-A0BF-4B56-9A1A-71C860B8498F}",
  "version": "1.0.3",

  "variations": [
    {
      "description": "Improve spelling, grammar, and style in your texts.",
      "descriptionLocale": {
        "fr": "Améliorez l'orthographe, la grammaire et le style de vos textes.",
        "es": "Mejore la ortografía, la gramática y el estilo de sus textos.",
        "pt-BR": "Melhore a ortografia, a gramática e o estilo dos seus textos.",
        "de": "Verbessern Sie Rechtschreibung, Grammatik und Stil in Ihren Texten."
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
      "isModal": true,
      "isInsideMode": true,

      "initDataType": "text",
      "initData": "",

      "buttons": [],

      "initOnSelectionChanged": true,

      "store": {
        "background": {
          "light": "#357EE5",
          "dark": "#357EE5"
        },
        "screenshots": [
          "resources/store/screenshots/screen_1.png",
          "resources/store/screenshots/screen_2.png",
          "resources/store/screenshots/screen_3.png"
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

      "icons": ["resources/img/icon.png", "resources/img/icon@2x.png"],
      "isViewer": true,
      "EditorsSupport": ["word", "cell", "slide"],

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
- onExternalMouseUp
- onTranslate
- callCommand
- executeMethod ("GetSelectedText")
- executeMethod ("GetSelectionType")
- executeMethod ("GetVersion")
- executeMethod ("PasteText")
- Asc.scope object
- info.editorType
- info.recalculate

## Support

If you want to request a feature or report a bug regarding this plugin, use the issues section on [GitHub](https://github.com/ONLYOFFICE/onlyoffice.github.io/issues).
