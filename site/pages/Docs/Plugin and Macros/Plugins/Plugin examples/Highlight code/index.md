## Description

Connects the [highlight.js library](https://highlightjs.org/) for highlighting code syntax with the necessary language, style, and background color.

**Plugin type:** visual, non-system.

**Supported editors:** documents, spreadsheets, presentations.

![HighlightCode](/assets/images/plugins/gifs/highlight-code.gif)

## Installation

Available by default in the cloud, on-premises and desktop versions of ONLYOFFICE editors.

You can remove it following the [desktop](../../Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md), [on-premises](../../Adding%20plugins/ONLYOFFICE%20Docs%20on-premises/index.md), or [cloud](../../Adding%20plugins/ONLYOFFICE%20Cloud/index.md) installation instructions.

The plugin guid: {BE5CBF95-C0AD-4842-B157-AC40FEDD9841}.

## Usage

1. Find the plugin in the **Plugins** tab.
2. Paste the code into the plugin window.
3. The language is detected automatically, but you can change it. You can also customize the code display style, tabs, and background color.
4. Click the **Ok** button to paste the code into the document.

## Known issues

- **Supported languages**: Apache, Access Log, Bash, Shell, MATLAB, Erlang, JavaScript, Ruby, Prolog, Swift, SQL, Java, HTTP, Fortran, Perl, XML, CPP, JSON, C Sharp, NGINX, BASIC, Markdown, CSS, Python, Objective-C, PHP, Delphi, Go, Kotlin, Rust, Shell, TypeScript.
- **Supported styles**: Googlecode, GitHub, GitHub Gist, Android Studio, Visual Studio, Visual Studio 2015, Idea, Qtcreator Dark, Qtcreator Light, XCode, Fortran, Foundation, XML 1, XML 2.

## Plugin structure

Repository on GitHub: <https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/highlightcode>.

1. *config.json*, *index.html*, and *code.js*

2. Icons

3. The *translations* folder contains translations into Russian, German, Spanish, Czech, and French.

4. *plugin\_style.css* and *scrollable\_div.js* are used to adjust the plugin style.

5. Third-party service:

   - [Highlight.js library](https://highlightjs.org/) - a syntax highlighter written in JavaScript. License: [BSD 3-Clause](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/highlightcode/licenses/Highlight.license).
   - [Spectrum.js](http://bgrins.github.io/spectrum/) - a JavaScript colorpicker plugin that uses the jQuery framework. License: [MIT License](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/highlightcode/licenses/spectrum.license).
   - [jQuery](https://jquery.com) - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. License: [MIT License](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/highlightcode/licenses/jQuery.license).
   - [Select2](https://select2.org/) gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options. License: [MIT](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/highlightcode/licenses/Select2.license).
   - [js-beautify.js](https://github.com/beautify-web/js-beautify) - the code formatting library (CSS, HTML, JavaScript). License: [MIT](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/highlightcode/licenses/js-beautify.license).
   - [prettier.js](https://github.com/prettier/prettier) - an opinionated code formatter. License: [MIT](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/highlightcode/licenses/prettier.license).
   - [prettier-plugin-php.js](https://github.com/prettier/plugin-php) - a plugin that adds the PHP language support to Prettier. License: [MIT](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/highlightcode/licenses/prettier%40plugin-php.license).
   - [xml-formatter.js](https://github.com/chrisbottin/xml-formatter) converts XML into a human readable format (pretty print) while respecting the *xml:space* attribute. License: [MIT](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/highlightcode/licenses/xml-formatter.license).

## Config

``` json
{
  "guid": "asc.{BE5CBF95-C0AD-4842-B157-AC40FEDD9841}",
  "name": "Highlight code",
  "nameLocale": {
    "de": "Code hervorheben",
    "es": "Resaltar el código",
    "pt-BR": "Highlight code",
    "fr": "Code en surbrillance"
  },
  "version": "1.0.2",
  "variations": [
    {
      "EditorsSupport": [
        "word",
        "cell",
        "slide"
      ],
      "buttons": [
        {
          "primary": true,
          "text": "Ok"
        },
        {
          "primary": false,
          "text": "Cancel",
          "textLocale": {
            "de": "Abbrechen",
            "es": "Cancelar",
            "fr": "Annuler"
          }
        }
      ],
      "description": "Highlight syntax of the code selecting the necessary language, style, and background color.",
      "descriptionLocale": {
        "de": "Heben Sie die Codesyntax hervor, indem Sie die gewünschte Sprache, den Stil und die Hintergrundfarbe auswählen.",
        "es": "Resalte la sintaxis del código seleccionando el idioma, el estilo y el color de fondo necesarios.",
        "pt-BR": "Destaque a sintaxe do código selecionando o idioma, estilo e cor de fundo necessários.",
        "fr": "Mettez en évidence la syntaxe du code en sélectionnant la langue, le style et la couleur de l'arrière-plan."
      },
      "icons": [
        "resources/light/icon.png",
        "resources/light/icon@2x.png"
      ],
      "icons2": [
        {
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
          },
          "style": "light"
        },
        {
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
          },
          "style": "dark"
        }
      ],
      "initData": "",
      "initDataType": "html",
      "initOnSelectionChanged": true,
      "isInsideMode": false,
      "isModal": true,
      "isViewer": false,
      "isVisual": true,
      "url": "index.html",
      "store": {
        "background": {
          "light": "#282C33",
          "dark": "#282C33"
        },
        "screenshots": [
          "resources/store/screenshots/screen_1.png",
          "resources/store/screenshots/screen_2.png",
          "resources/store/screenshots/screen_3.png",
          "resources/store/screenshots/screen_4.png"
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
- onExternalMouseUp
- onTranslate
- executeMethod ("PasteHtml")
- loadModule
- resizeWindow

## Support

If you want to request a feature or report a bug regarding this plugin, use the issues section on [GitHub](https://github.com/ONLYOFFICE/onlyoffice.github.io/issues).
