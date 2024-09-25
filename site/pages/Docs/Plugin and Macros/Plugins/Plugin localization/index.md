---
order: -4
---

All the plugins are created in English by default. If you want them to be available in your language, you can add translations to them.

## Translating config.json sections

First you can translate the [config.json](../../Usage%20API/Config/index.md) file. To do that, open it and find all the strings in English. Usually they are [name](../../Usage%20API/Config/index.md#name), [variations.description](../../Usage%20API/Config/index.md#description) and [variations.buttons.text](../../Usage%20API/Config/index.md#buttons) nodes of the configuration object.

Add the new nodes with the key name plus *Locale*, equal to an object that will have the language locale as the key and the translation as the value. For example, for the *name* key the localization object will look like this:

``` json
{
  "name": "Highlight code",
  "nameLocale": {
    "de": "Code hervorheben",
    "es": "Resaltar el código",
    "fr": "Code en surbrillance"
  }
}

```

The complete translations in the [config.json](../../Usage%20API/Config/index.md) for the [highlighting plugin code](https://github.com/ONLYOFFICE/onlyoffice.github.io/tree/master/sdkjs-plugins/content/highlightcode) will look the following way:

``` json
{
  "name": "Highlight code",
  "nameLocale": {
    "de": "Code hervorheben",
    "es": "Resaltar el código",
    "fr": "Code en surbrillance"
  },
  "variations": [
    {
      "description": "Highlight code",
      "descriptionLocale": {
        "de": "Code hervorheben",
        "es": "Resaltar el código",
        "fr": "Code en surbrillance"
      },
      "buttons": [
        {
          "text": "Cancel",
          "textLocale": {
            "de": "Abbrechen",
            "es": "Cancelar",
            "fr": "Annuler"
          }
        }
      ]
    }
  ]
}
```

## Localizing index.html and plugin code files

Find all the strings you want to be localized from the [index.html](../../Usage%20API/index.html/index.md) and the [pluginCode.js](../../Usage%20API/Plugin%20object/index.md) files and create their list. Then create the *translations* folder in the plugin directory, so that the structure looked like this:

``` ini
[translations]
config.json
index.html
pluginCode.js
```

Create the language *.json* files for each language you want to add the translations for with the language four-letter code for its name (e.g. *de-DE.json*). These files will contain the objects with the source (English) language words and phrases as keys and translations into the selected language as values. This is an example of the German translation:

``` json
{
  "Language": "Sprache",
  "Highlight": "Hervorheben",
  "Style": "Stil"
}
```

Starting from version 7.2, you can add the *langs.json* file to the translations folder. It contains the names of files with translations into a specific language in the array format:

``` json
[
  "cs-CZ",
  "de-DE",
  "es-ES",
  "fr-FR"
]
```

First, the *langs.json* file will be requested and a full match of the language and file name will be searched. If no match is found, the first two characters before the *"-"* sign are checked. If the *langs.json* file does not contain the required file name, the plugin will work in English. If there is no *langs.json* file or there are problems when parsing it, then the translations will work according to the old translation scheme.

Once all the localization files are added, the plugin file structure will look like this:

``` ini
[translations]
    de-DE.json
    es-ES.json
    fr-FR.json
    langs.json
config.json
index.html
pluginCode.js
```

You can now replace the strings in the files with their translated values.

## Applying translations to plugin

To apply the translations you will need to add unique IDs to each element which has the string value you want to localize. For instance, you want to localize the **New** button in this part of code:

``` html
<button>New</button>
```

Add the *id* attribute to it, so that it looked like this:

``` html
<button id="button_new">New</button>
```

After that add the window.Asc.plugin.onTranslate function to the [pluginCode.js](../../Usage%20API/Plugin%20object/index.md) file:

``` ts
window.Asc.plugin.onTranslate = function onTranslate() {
  const label = document.querySelector("#button_new")
  if (label) {
    label.innerHTML = window.Asc.plugin.tr("New")
  }
}
```

The *window\.Asc.plugin.onTranslate* function will be called right after the plugin startup and later in case the plugin language is changed.

If you need to localize more than one word/phrase, the *window\.Asc.plugin.onTranslate* function can have the following appearance:

``` ts
window.Asc.plugin.onTranslate = function onTranslate() {
  document.querySelector("#button_delete").innerHTML = window.Asc.plugin.tr("Delete")
  document.querySelector("#button_new").innerHTML = window.Asc.plugin.tr("New")
  document.querySelector("#button_rename").innerHTML = window.Asc.plugin.tr("Rename")
  document.querySelector("#button_run").innerHTML = window.Asc.plugin.tr("Run")
}
```

Where every line will represent the localized element, reached using the appropriate ID.

> Please note, that the translation uses the *.innerHTML* method and thus can contain not only words and phrases, but also some HTML elements (tags, links, etc.) Do not forget to escape any quotes in the translations (like in any *.json* file) so that they worked correctly.

Now, once the editors are started, the current interface language will be used to determine if the plugin has the same locale translation. If it is so, the plugin language will be changed to fit the editor interface language and the translation will be applied.
