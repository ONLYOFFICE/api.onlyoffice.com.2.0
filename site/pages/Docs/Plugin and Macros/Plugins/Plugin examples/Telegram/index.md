## Description

Connects the Telegram application for instant messaging within the ONLYOFFICE editors.

> The plugin has no access to the camera and microphone, so you will be unable to record voice and video messages. Also, it does not work in the incognito mode.

**Plugin type:** visual, non-system.

**Supported editors:** documents, spreadsheets, presentations.

**Analogues:** [Rainbow](https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/rainbow), [Jitsi](https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/jitsi).

![Telegram](/assets/images/plugins/gifs/telegram.gif)

## Installation

Available by default in ONLYOFFICE Enterprise Edition and Community Edition (Docs + Workspace).

You can also download this plugin from the [ONLYOFFICE App Directory](https://www.onlyoffice.com/en/app-directory/telegram) and install it following the [desktop](../../Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md) or [cloud](../../Adding%20plugins/ONLYOFFICE%20Cloud/index.md) installation instructions.

## Usage

1. Find the plugin on the **Plugins** tab.
2. Log in to your Telegram account.

By default, this plugin uses *https\://evgeny-nadymov.github.io/telegram-react/*. If you need to change it, open the *index.html* file and insert the new URL in the **iframe src** field.

## Plugin structure

Repository on GitHub: <https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/telegram>.

1. *config.json*, *index.html*, and *code.js*

2. Icons

3. Third-party service:

   - [Telegram-react application](https://github.com/evgeny-nadymov/telegram-react) - the application which uses the ReactJS JavaScript framework and TDLib (Telegram Database library) compiled to WebAssembly. License: [GNU General Public License](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/telegram/licenses/telegram-react.license).

## Config

``` json
{
  "name": "Telegram",
  "nameLocale": {
    "fr": "Telegram",
    "es": "Telegram",
    "pt-BR": "Telegram",
    "de": "Telegram"
  },
  "guid": "asc.{E5773A43-F9B3-4E81-81D9-CE0A132470E7}",
  "version": "1.0.2",

  "variations": [
    {
      "description": "Chat with co-authors in real time using integrated Telegram client.",
      "descriptionLocale": {
        "fr": "Chattez avec vos co-auteurs en temps réel grâce au client Telegram intégré.",
        "es": "Chatee con los coautores en tiempo real utilizando el cliente integrado de Telegram.",
        "pt-BR": "Converse com coautores em tempo real usando o cliente Telegram integrado.",
        "de": "Unterhalten Sie sich mit Mitautoren in Echtzeit über den integrierten Telegram-Client."
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
      "EditorsSupport": ["word", "cell", "slide", "pdf"],
      "isVisual": true,
      "isModal": false,
      "isInsideMode": true,
      "initDataType": "none",
      "store": {
        "background": {
          "light": "#26A8DE",
          "dark": "#26A8DE"
        },
        "screenshots": ["resources/store/screenshots/screen_1.png"],
        "icons": {
          "light": "resources/store/icons",
          "dark": "resources/store/icons"
        },
        "categories": ["specAbilities", "communication", "entertainment"]
      }
    }
  ]
}
```

## Methods and events

- button
- init
- onExternalMouseUp

## Support

If you want to request a feature or report a bug regarding this plugin, use the issues section on [GitHub](https://github.com/ONLYOFFICE/onlyoffice.github.io/issues).
