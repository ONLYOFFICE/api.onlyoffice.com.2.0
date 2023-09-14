<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Plugin localization
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Localizing plugins to your language</span>
    </h1>

    <p class="dscr">All the plugins are created in English by default. If you want them to be available in your language, you can add translations to them.</p>

    <h2 id="localizeConfigJSON">Translating config.json sections</h2>

    <p>First you can translate the <a href="<%= Url.Action("config") %>">config.json</a> file. To do that, open it and find all the strings in English. Usually they are <a href="<%= Url.Action("config") %>#name">name</a>, <a href="<%= Url.Action("config") %>#description">variations.description</a> and <a href="<%= Url.Action("config") %>#buttons">variations.buttons.text</a> nodes of the configuration object.</p>

    <p>Add the new nodes with the key name plus <em>Locale</em>, equal to an object that will have the language locale as the key and the translation as the value. For example, for the <em>name</em> key the localization object will look like this:</p>

    <pre>"name": "Highlight code",
"nameLocale": {
    "de": "Code hervorheben",
    "es": "Resaltar el código",
    "fr": "Code en surbrillance",
    "ru": "Подсветка кода"
}</pre>

    <p>The complete translations in the <a href="<%= Url.Action("config") %>">config.json</a> for the <a target="_blank" href="https://github.com/ONLYOFFICE/plugin-highlightcode/blob/master/scripts/code.js">highlighting plugin code</a> will look the following way:</p>

    <pre>{
    "name": "Highlight code",
    "nameLocale": {
        "de": "Code hervorheben",
        "es": "Resaltar el código",
        "fr": "Code en surbrillance",
        "ru": "Подсветка кода"
    },
    ...,
    "variations": [
        {
            "description": "Highlight code",
            "descriptionLocale": {
                "de": "Code hervorheben",
                "es": "Resaltar el código",
                "fr": "Code en surbrillance",
                "ru": "Подсветка кода"
            },
            ...,
            "buttons": [
                {
                    "text": "Cancel",
                    "textLocale": {
                        "de": "Abbrechen",
                        "es": "Cancelar",
                        "fr": "Annuler",
                        "ru": "Отмена"
                    },
                    ...
                }
            ],
            ...
        }
    ]
}</pre>

    <h2 id="localizeHTMLandJS">Localizing index.html and plugin code files</h2>

    <p>Find all the strings you want to be localized from the <a href="<%= Url.Action("indexhtml") %>">index.html</a> and the <a href="<%= Url.Action("code") %>">pluginCode.js</a> files and create their list. Then create the <em>translations</em> folder in the plugin directory, so that the structure looked like this:</p>

    <pre>..
[translations]
config.json
index.html
pluginCode.js</pre>

    <p>Create the language <em>.json</em> files for each language you want to add the translations for with the language four-letter code for its name (e.g. <em>de-DE.json</em>). These files will contain the objects with the source (English) language words and phrases as keys and translations into the selected language as values. This is an example of the German translation:</p>

    <pre>{
    "Language": "Sprache",
    "Highlight": "Hervorheben",
    "Style": "Stil",
}</pre>

    <p>Starting from version 7.2, you can add the <em>langs.json</em> file to the translations folder. It contains the names of files with translations into a specific language in the array format:</p>

    <pre>
[
    "cs-CZ",
    "de-DE",
    "es-ES",
    "fr-FR",
    "ru-RU"
]
</pre>

    <p>
        First, the <em>langs.json</em> file will be requested and a full match of the language and file name will be searched.
        If no match is found, the first two characters before the <em>"-"</em> sign are checked.
        If the <em>langs.json</em> file does not contain the required file name, the plugin will work in English.
        If there is no <em>langs.json</em> file or there are problems when parsing it, then the translations will work according to the old translation scheme.
    </p>

    <p>Once all the localization files are added, the plugin file structure will look like this:</p>

    <pre>..
[translations]
    de-DE.json
    es-ES.json
    fr-FR.json
    langs.json
    ru-RU.json
config.json
index.html
pluginCode.js</pre>

    <p>You can now replace the strings in the files with their translated values.</p>

    <h2 id="applyTranslations">Applying translations to plugin</h2>

    <p>To apply the translations you will need to add unique IDs to each element which has the string value you want to localize. For instance, you want to localize the <b>New</b> button in this part of code:</p>

    <pre>&lt;button&gt;New&lt;/button&gt;</pre>

    <p>Add the <em>id</em> attribute to it, so that it looked like this:</p>

    <pre>&lt;button id="button_new"&gt;New&lt;/button&gt;</pre>

    <p>After that add the <a href="<%= Url.Action("events/onTranslate") %>">window.Asc.plugin.onTranslate</a> function to the <a href="<%= Url.Action("code") %>">pluginCode.js</a> file:</p>

    <pre>window.Asc.plugin.onTranslate = function()
    {
        var label = document.getElementById("button_new");
        if (label)
            label.innerHTML = window.Asc.plugin.tr("New");
    }
</pre>

    <p>The <em>window.Asc.plugin.onTranslate</em> function will be called right after the plugin startup and later in case the plugin language is changed.</p>

    <p>If you need to localize more than one word/phrase, the <em>window.Asc.plugin.onTranslate</em> function can have the following appearance:</p>

    <pre>window.Asc.plugin.onTranslate = function()
    {
        document.getElementById("button_delete").innerHTML = window.Asc.plugin.tr("Delete");
        document.getElementById("button_new").innerHTML    = window.Asc.plugin.tr("New");
        document.getElementById("button_rename").innerHTML = window.Asc.plugin.tr("Rename");
        document.getElementById("button_run").innerHTML    = window.Asc.plugin.tr("Run");
    }</pre>

    <p>Where every line will represent the localized element, reached using the appropriate ID.</p>

    <div class="note">Please note, that the translation uses the <em>.innerHTML</em> method and thus can contain not only words and phrases, but also some HTML elements (tags, links, etc.) Do not forget to escape any quotes in the translations (like in any <em>.json</em> file) so that they worked correctly.</div>

    <p>Now, once the editors are started, the current interface language will be used to determine if the plugin has the same locale translation. If it is so, the plugin language will be changed to fit the editor interface language and the translation will be applied.</p>

</asp:Content>
