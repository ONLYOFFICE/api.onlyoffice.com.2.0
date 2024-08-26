## Description

Connects the [Typograf](https://github.com/typograf/typograf) assistant to prepare text for publishing by correcting typographical errors. It helps automatically place non-breaking spaces, remove extra spaces, correct minor typos, insert correct quotes, replace hyphens with dashes, and much more.

Supported languages are listed [here](https://github.com/typograf/typograf/blob/dev/docs/LOCALES.en-US.md).

**Plugin type:** visual, non-system.

**Supported editors:** documents.

![Typograf](/assets/images/plugins/gifs/typograf.gif)

## Installation

Available by default in ONLYOFFICE Enterprise Edition and Community Edition (Docs + Workspace).

You can also download this plugin from the [ONLYOFFICE App Directory](https://www.onlyoffice.com/en/app-directory/typograph) and install it following the [desktop](../../Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md) or [cloud](../../Adding%20plugins/ONLYOFFICE%20Cloud/index.md) installation instructions.

## Usage

1. Open the **Plugins** tab and press **Typograf**.
2. Click on **Show Advanced Settings**. Choose the locale and the rules you want to apply to your text.
3. Select the text you want to correct.
4. Run the plugin with the **Correct text** button.

## Known issues

- When using the plugin in a document abstract with graphic objects, these objects (images, shapes, Text Arts, Text Boxes, tables, charts) are lost along with the text they contained.
- If you select the text inside a graphic object, the text will be removed from the object and inserted into the document in a corrected form.
- Graphic formulas are converted to strings.
- Drop caps, content controls, hyperlinks, underlays, footnotes, bookmarks, caption, tables of contents are removed.
- If at least a part of the text is split into columns, then the columns will be applied to the entire document.
- Breaks are not saved
- Changes suggested using *Track Changes* are not saved.
- If the plugin is used with the *Track Changes* mode on, the corrected text will be inserted as a suggested change.
- Comments are not saved, except for the comments to the whole document.
- Headers and footers remain unchanged if the entire document is selected.
- If header/footer content is selected, the graphic objects it contained will be lost.
- Line numbering is saved if it is applied to the entire document. If it is applied to a section, then it will be lost along with the section.
- When two or more paragraphs have been selected, an empty paragraph will be added after the corrected text.

## Plugin structure

Repository on GitHub: <https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/typograf>.

1. *config.json*, *index.html*, and *typograf.js*

2. Icons

3. The *translations* folder contains translations into Russian, Belarusian, Ukrainian, Bulgarian, Catalan, Danish, German, Spanish, Greek, Finnish, Hungarian, Latvian, Norwegian, Polish, Romanian, Slovak, Slovenian, Swedish, Italian, Dutch, and French.

4. Third-party services:

   - [jQuery](https://jquery.com) - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. License: [MIT License](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/typograf/licenses/jQuery.license).
   - [Select2](https://select2.org/) gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options. License: [MIT](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/typograf/licenses/Select2.license).
   - [Typograf](https://github.com/typograf/typograf) - screen typography for typesetting text. License: [MIT License](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/typograf/licenses/Typograf.license).

## Config

``` json
{
  "name": "Typograf",
  "nameLocale": {
    "fr": "Typograf",
    "es": "Typograf",
    "pt-BR": "Typograf",
    "de": "Typograf"
  },
  "guid": "asc.{55159EC6-C91A-4DDB-8E1E-558454666461}",
  "version": "1.0.1",

  "variations": [
    {
      "description": "Prepare your texts for publishing by correcting typography.",
      "descriptionLocale": {
        "fr": "Préparez vos textes pour la publication en corrigeant la typographie.",
        "es": "Prepare sus textos para la publicación corrigiendo la tipografía.",
        "pt-BR": "Prepare seus textos para publicação corrigindo a tipografia.",
        "de": "Bereiten Sie Ihre Texte für die Veröffentlichung vor, indem Sie Typografie korrigieren."
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
      "isViewer": false,
      "EditorsSupport": ["word", "slide", "cell"],

      "isVisual": true,
      "isModal": false,
      "isInsideMode": true,

      "initDataType": "text",
      "initData": "",

      "buttons": [],

      "initOnSelectionChanged": true,
      "store": {
        "background": {
          "light": "#00ACC7",
          "dark": "#00ACC7"
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
- executeMethod ("GetVersion")
- executeMethod ("PasteText")
- executeMethod ("ReplaceTextSmart")
- Asc.scope object
- info.editorType

## Support

If you want to request a feature or report a bug regarding this plugin, use the issues section on [GitHub](https://github.com/ONLYOFFICE/onlyoffice.github.io/issues).
