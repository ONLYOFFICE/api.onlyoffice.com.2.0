## Description

Connects the [Google Translate API](https://cloud.google.com/translate?hl=ru) for translating the selected text into other languages.

**Plugin type:** visual, non-system.

**Supported editors:** documents, spreadsheets, presentations.

**Analogues:** [Apertium](https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/apertium), [DeepL](https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/deepl).

![Translator](/assets/images/plugins/gifs/translator.gif)

## Installation

Available by default in the cloud, on-premises and desktop versions of ONLYOFFICE editors.

You can remove it following the [desktop](../../Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md), [on-premises](../../Adding%20plugins/ONLYOFFICE%20Docs%20on-premises/index.md), or [cloud](../../Adding%20plugins/ONLYOFFICE%20Cloud/index.md) installation instructions.

The plugin guid: {7327FC95-16DA-41D9-9AF2-0E7F449F6800}.

## Usage

1. Select the text you want to translate.
2. Open the **Plugins** tab and press **Translator**.
3. Select the necessary language. The translation will be displayed in the plugin window immediately.

## Plugin structure

Repository on GitHub: <https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/translator>.

1. *config.json*, *index.html*, and *translate.js*

2. Icons

3. The *translations* folder contains translations into Russian, German, Spanish, Czech, and French.

4. *index\_widget.html* specifies the translator widget

5. Third-party services:

   - [jQuery](https://jquery.com) - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. License: [MIT License](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/translator/licenses/jQuery.license).
   - [Select2](https://select2.org/) gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options. License: [MIT](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/translator/licenses/Select2.license).
   - [Google Translate API](https://cloud.google.com/translate?hl=ru) enables translation between languages. License: [MIT License](https://github.com/matheuss/google-translate-api/blob/master/LICENSE).

## Config

``` json
{
  "name": "Translator",
  "nameLocale": {
    "fr": "Traducteur",
    "es": "Traductor",
    "pt-BR": "Tradutor",
    "de": "Übersetzer"
  },
  "guid": "asc.{7327FC95-16DA-41D9-9AF2-0E7F449F6800}",
  "version": "1.0.6",

  "variations": [
    {
      "description": "Translate the selected text into other languages with Google Translate.",
      "descriptionLocale": {
        "fr": "Traduisez le texte sélectionné dans d'autres langues avec Google Translate.",
        "es": "Traduzca el texto seleccionado a otros idiomas con el Traductor de Google.",
        "pt-BR": "Traduza o texto selecionado para outros idiomas com o Google Translate.",
        "de": "Übersetzen Sie den ausgewählten Text in andere Sprachen mit Google Translate."
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
      "screens": ["resources/store/screen_1.png"],
      "isViewer": true,
      "EditorsSupport": ["word", "cell", "slide", "pdf"],
      "isVisual": true,
      "isModal": false,
      "isInsideMode": true,
      "initDataType": "text",
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
        "categories": ["specAbilities"]
      }
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
- executeMethod ("GetVersion")
- executeMethod ("GetSelectedText")
- executeMethod ("GetSelectionType")
- executeMethod ("PasteText")
- Asc.scope object
- info.editorType

## Support

If you want to request a feature or report a bug regarding this plugin, use the issues section on [GitHub](https://github.com/ONLYOFFICE/onlyoffice.github.io/issues).
