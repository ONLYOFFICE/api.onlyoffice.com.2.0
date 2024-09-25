## Description

Connects [Big Huge Thesaurus](https://words.bighugelabs.com/) to search for word synonyms and antonyms.

**Plugin type:** visual, non-system.

**Supported editors:** documents, spreadsheets, presentations.

![Thesaurus](/assets/images/plugins/gifs/thesaurus.gif)

## Installation

Available by default in the cloud, on-premises and desktop versions of ONLYOFFICE editors.

You can remove it following the [desktop](../../Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md), [on-premises](../../Adding%20plugins/ONLYOFFICE%20Docs%20on-premises/index.md), or [cloud](../../Adding%20plugins/ONLYOFFICE%20Cloud/index.md) installation instructions.

The plugin guid: {BE5CBF95-C0AD-4842-B157-AC40FEDD9840}.

## Usage

1. Open the **Plugins** tab and press **Thesaurus**.
2. Select the necessary word. The list of synonyms and antonyms will be displayed automatically in the plugin window.
3. Choose a suitable synonym or antonym and click it.
4. The chosen synonym or antonym replaces the selected word in the text.

## Plugin structure

Repository on GitHub: <https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/thesaurus>.

1. *config.json*, *index.html*, and *synonim.js*

2. Icons

3. The *translations* folder contains translations into Russian, German, Spanish, Czech, and French.

4. *plugin style.css* is used to bring the plugin to the specific style.

5. Third-party services:

   - [jQuery](https://jquery.com) - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. License: [MIT License](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/thesaurus/licenses/jQuery.license).
   - [Big Huge Thesaurus](https://words.bighugelabs.com/) - the developer-friendly API for getting synonyms and antonyms for your apps and websites. License: [Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0).

## Config

``` json
{
  "name": "Thesaurus",
  "nameLocale": {
    "fr": "Thésaurus",
    "es": "Tesauro",
    "pt-BR": "Thesaurus",
    "de": "Thesaurus"
  },
  "guid": "asc.{BE5CBF95-C0AD-4842-B157-AC40FEDD9840}",
  "version": "1.0.2",

  "variations": [
    {
      "description": "Search for synonyms and antonyms of a word and replace it with the selected one.",
      "descriptionLocale": {
        "fr": "Recherchez les synonymes et les antonymes d'un mot et remplacez-le par le mot sélectionné.",
        "es": "Busque sinónimos y antónimos de una palabra y sustitúyala por la seleccionada.",
        "pt-BR": "Pesquise sinônimos e antônimos de uma palavra e substitua pela selecionada.",
        "de": "Finden Sie Synonyme und Antonyme eines Wortes und ersetzen Sie es durch die ausgewählte Variante."
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
      "initDataType": "text",
      "initOnSelectionChanged": true,
      "store": {
        "background": {
          "light": "#F44725",
          "dark": "#F44725"
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
- onExternalMouseUp
- onTranslate
- executeMethod ("GetSelectedText")
- executeMethod ("PasteText")

## Support

If you want to request a feature or report a bug regarding this plugin, use the issues section on [GitHub](https://github.com/ONLYOFFICE/onlyoffice.github.io/issues).
