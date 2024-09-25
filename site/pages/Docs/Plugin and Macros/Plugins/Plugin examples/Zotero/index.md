## Description

Connects a Zotero account for adding references to the document in full accordance with the chosen style guides.

**Plugin type:** visual, non-system.

**Supported editors:** documents.

**Analogues:** [Mendeley](https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/mendeley), [EasyBib](https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/easybib).

![Zotero](/assets/images/plugins/gifs/zotero.gif)

## Installation

Available by default in ONLYOFFICE Enterprise Edition, Community Edition (Docs + Workspace), and ONLYOFFICE cloud.

You can also download this plugin from the [ONLYOFFICE App Directory](https://www.onlyoffice.com/en/app-directory/zotero) and install it following the [desktop](../../Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md) installation instruction.

## Connect ONLYOFFICE to Zotero account

1. Find the plugin on the **Plugins** tab.
2. Log in to your Zotero account.
3. Follow the **Zotero API settings** link from the plugin's window. If you are logged in, you'll be able to proceed. If you are not logged in, you'll see an error message. In this case, click **Log in** (top right corner of your screen).
4. Press **Create new private key**.
5. Fill in **Key Description**, make sure the **Allow library access** box is checked and press **Save Key**.
6. Copy the newly created key, paste to the **API Key** field in the plugin's interface, and save it.

## Usage

1. Find the plugin on the **Plugins** tab.
2. Find the necessary bibliography by author, title, or year.
3. Select all the necessary sources.
4. Choose the reference style from the **Style** pull-down menu.
5. Click the **Insert Bibliography** button. The bibliography list will be inserted at the cursor position.

## Known issues

For CentOS users with SELinx enabled, after copying the src folder to sdkjs-plugins, plugins may not work due to the variable file security context. To restore the rights, use the following command:

``` sh
sudo restorecon -Rv /var/www/onlyoffice/documentserver/sdkjs-plugins/
```

After that restart the services:

``` sh
sudo supervisorctl restart ds:docservice
```

## Plugin structure

Repository on GitHub: <https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/zotero>.

1. *config.json*, *index.html*, and *code.js*

2. Icons

3. *plugin\_style.css* are used to adjust the plugin style.

4. The *translations* folder contains translations into Russian, German, Spanish, Czech, Italian, Japanese, Dutch, Portuguese, Chinese, and French.

5. *zotero.js* allows the user to get access to their Zotero account.

6. Third-party services:

   - [fetch-polyfill](https://github.com/github/fetch) - a project that implements a subset of the standard Fetch specification, enough to make fetch a viable replacement for most uses of XMLHttpRequest in traditional web applications. License: [MIT](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/zotero/licenses/fetch-polyfill.license)
   - [promise-polyfill](https://github.com/taylorhakes/promise-polyfill) - lightweight ES6 Promise polyfill for the browser and node. License: [MIT](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/zotero/licenses/promise-polyfill.license).
   - [url-polyfill](https://github.com/lifaon74/url-polyfill) - Polyfill URL and URLSearchParams to match last WHATWG specifications. License: [MIT](https://github.com/ONLYOFFICE/onlyoffice.github.io/blob/master/sdkjs-plugins/content/zotero/licenses/url-polyfill.license).

## Config

``` json
{
  "name": "Zotero",
  "nameLocale": {
    "fr": "Zotero",
    "es": "Zotero",
    "pt-BR": "Zotero",
    "de": "Zotero"
  },
  "guid": "asc.{BFC5D5C6-89DE-4168-9565-ABD8D1E48711}",
  "version": "1.0.3",
  "minVersion": "7.3.3",

  "variations": [
    {
      "description": "Create bibliographies in the required style using Zotero service.",
      "descriptionLocale": {
        "fr": "Créez des bibliographies dans le style nécessaire avec Zotero.",
        "es": "Cree bibliografías en el estilo requerido utilizando el servicio Zotero.",
        "pt-BR": "Crie bibliografias no estilo desejado usando o serviço Zotero.",
        "de": "Erstellen Sie Literaturverzeichnisse im gewünschten Stil mittels Zotero."
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
      "EditorsSupport": ["word"],
      "initDataType": "text",
      "initData": "",
      "isVisual": true,
      "isModal": false,
      "isInsideMode": true,
      "initOnSelectionChanged": false,
      "store": {
        "background": {
          "light": "#2D3037",
          "dark": "#2D3037"
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
- onTranslate
- executeMethod ("PasteHtml")

## Support

If you want to request a feature or report a bug regarding this plugin, use the issues section on [GitHub](https://github.com/ONLYOFFICE/onlyoffice.github.io/issues).
