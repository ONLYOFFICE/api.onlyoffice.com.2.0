## Description

Converts the selected text into speech. The plugin uses [guessLanguage](https://richtr.github.io/guessLanguage.js/) to recognize the language and the [SpeechSynthesis](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis) interface of the [Web Speech API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Speech_API).

**Plugin type:** visual, non-system.

**Supported editors:** documents.

![Speech](/assets/images/plugins/gifs/speech.gif)

## Installation

Available by default in ONLYOFFICE Enterprise Edition and Community Edition (Docs + Workspace), and ONLYOFFICE cloud.

You can also download this plugin from the [ONLYOFFICE App Directory](https://www.onlyoffice.com/en/app-directory/speech).

## Usage

1. Select the necessary text.
2. Open the plugin settings to select the language for the voiceover (the default setting is auto-recognition mode).
3. Open the **Plugins** tab and press **Speech**.
4. The text will be read out loud.

## Known issues

1. Some browsers, e.g. Mozzila, Opera, can only use pre-installed languages on your system for speech generation. So to use new languages, you need to add them to your system.
2. The plugin doesn't work on Safari 15.3 (17612.4.9.1.8). Problem fixed on Safari 15.4 (17614.1.7.7).

## Plugin structure

Repository on GitHub: <https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/speech>.

1. *config.json*, *index.html*, and *speech.js*

2. Icons

3. The *translations* folder contains translations into Russian, German, Spanish, Czech, Italian, Japanese, Dutch, Portuguese, Chinese, and French.

4. *settings.html* specifies a window with the plugin settings

5. Third-party services:

   - [GuessLanguage](https://richtr.github.io/guessLanguage.js/) is a natural language detection library based on trigram statistical analysis. This library is written in JavaScript and works equally well when run in either browser or Node.js. License: [GNU LGPL](https://www.gnu.org/licenses/lgpl-3.0.html).
   - [jQuery](https://jquery.com) - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. License: [MIT License](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/speech/licenses/jQuery.license).
   - [Select2](https://select2.org/) gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options. License: [MIT](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/speech/licenses/Select2.license).

## Config

``` json
{
  "name": "Speech",
  "nameLocale": {
    "cs": "Řeč",
    "de": "Rede",
    "es": "Habla",
    "pt-BR": "Fala",
    "fr": "Parole",
    "it": "Discorso",
    "ja": "スピーチ",
    "nl": "Spraak",
    "pt": "Discurso",
    "zh": "讲话"
  },
  "guid": "asc.{D71C2EF0-F15B-47C7-80E9-86D671F9C595}",
  "version": "2.0.1",

  "variations": [
    {
      "description": "Convert the selected text into speech.",
      "descriptionLocale": {
        "fr": "Convertissez le texte sélectionné en parole.",
        "it": "Converti il testo selezionato in voce parlata.",
        "ja": "選択したテキストを音声に変換します。",
        "es": "Convierta el texto seleccionado en voz.",
        "pt-BR": "Converta o texto selecionado em fala.",
        "de": "Konvertieren Sie den ausgewählten Text in die Rede.",
        "zh": "朗读所选的文本。"
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
      "isVisual": false,
      "initDataType": "text",

      "buttons": [],
      "store": {
        "background": {
          "light": "#444444",
          "dark": "#444444"
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
        "categories": ["specAbilities"]
      }
    },
    {
      "description": "Settings",
      "descriptionLocale": {
        "cs": "Nastavení",
        "de": "Einstellungen",
        "es": "Configuración",
        "fr": "Paramètres",
        "it": "Impostazioni",
        "ja": "設定",
        "nl": "Instellingen",
        "pt": "Definições",
        "zh": "设置"
                
      },
      "url": "settings.html",

      "icons": ["resources/img/icon.png", "resources/img/icon@2x.png", "resources/img/icon2.png", "resources/img/icon2@2x.png"],
      "isViewer": true,
      "EditorsSupport": ["word", "pdf"],
      "isVisual": true,
      "isModal": true,
      "isInsideMode": false,
      "initDataType": "none",

      "buttons": [
        {
          "text": "Ok",
          "primary": true
        }
      ],

      "size": [300, 150]
    }
  ]
}
```

## Methods and events

- buttons
- init

## Support

If you want to request a feature or report a bug regarding this plugin, use the issues section on [GitHub](https://github.com/ONLYOFFICE/onlyoffice.github.io/issues).
