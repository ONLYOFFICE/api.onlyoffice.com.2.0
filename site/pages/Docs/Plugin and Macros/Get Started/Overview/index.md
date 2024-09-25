---
order: -4
---

ONLYOFFICE [Docs](https://www.onlyoffice.com/office-suite.aspx) and [Desktop Editors](https://www.onlyoffice.com/desktop.aspx) offer support for plugins allowing developers to add specific features to the editors that are not directly related to the OOXML format.

Plugin is an HTML page that is embedded in the editor and uses API to work with it.

This documentation describes:

- How to [build](../Plugin%20structure/index.md), [localize](../../Plugins/Plugin%20localization/index.md), run, [test](../../Plugins/Developing%20plugins/index.md) and [publish](../../Plugins/Publishing%20plugins/index.md) a plugin
- How to [write](../../Macros/Writing%20macros/index.md), [debug](../../Macros/Debugging/index.md) and run a macro or [convert](../../Macros/Converting%20VBA%20macros/index.md) VBA macros to use in ONLYOFFICE
- How to use ONLYOFFICE methods and events
- Where to find guides and [plugin](../../Plugins/Plugin%20examples/index.md)/[macro](../../Macros/Macro%20samples/index.md) code samples to get started

## What plugins can do

Here are some examples of what you can do with ONLYOFFICE plugins:

- connect third-party services, like [Telegram](../../Plugins/Plugin%20examples/Telegram/index.md), [YouTube](../../Plugins/Plugin%20examples/YouTube/index.md), [Thesaurus](../../Plugins/Plugin%20examples/Thesaurus/index.md), [Translator](../../Plugins/Plugin%20examples/Translator/index.md), [Zotero](../../Plugins/Plugin%20examples/Zotero/index.md), [OCR](../../Plugins/Plugin%20examples/OCR/index.md), etc.;
- add custom components & controls in the UI, like **Trackchanges**, **Trackchanges\_off**;
- enhance the existing user experience and the editors’ functionality: [Autocomplete](../../Plugins/Plugin%20examples/Autocomplete/index.md), [Search & Replace](../../Plugins/Plugin%20examples/Search%20and%20replace/index.md), [Move cursor](../../Plugins/Plugin%20examples/Move%20cursor/index.md), [Extended comments](../../Plugins/Plugin%20examples/Extended%20comments/index.md);
- automate tasks in documents with [Macros](../../Macros/Getting%20started%20with%20macros/index.md).

Code samples are available at <https://github.com/ONLYOFFICE/sdkjs-plugins>.

If you are looking for ready-to-use plugins, please visit [ONLYOFFICE App Directory](https://www.onlyoffice.com/en/app-directory).

To quickly install and update plugins, you can use [ONLYOFFICE Plugin Marketplace](../../Plugins/Adding%20plugins/ONLYOFFICE%20Docs%20on-premises/index.md#adding-plugins-through-the-plugin-manager).

## How to create plugins

To create your own plugin, you need to follow a few steps:

1. Learn the fundamental concepts for building plugins on the [Getting started with plugins](../Getting%20started%20with%20plugins/index.md) page and write code that defines the plugin appearance and behavior.
2. After building the plugin, [test](../../Plugins/Developing%20plugins/index.md) it thoroughly and make sure the plugin looks and works as you expected. Try to anticipate the problems that might occur and suggest your solutions to them.
3. Now you can use the plugin on your own or suggest it for [publishing](../../Plugins/Publishing%20plugins/index.md) by creating a pull request to the [plugin marketplace repository](https://github.com/ONLYOFFICE/onlyoffice.github.io).
