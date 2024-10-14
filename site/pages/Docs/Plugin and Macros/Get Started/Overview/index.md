---
order: -2
---

ONLYOFFICE [Docs](https://www.onlyoffice.com/office-suite.aspx) and [Desktop Editors](https://www.onlyoffice.com/desktop.aspx) offer support for plugins allowing developers to add specific features to the editors that are not directly related to the OOXML format.

Plugin is an HTML page that is embedded in the editor and uses API to work with it.

This documentation describes:

- How to [build](../../Structure/Manifest/index.md), [localize](../../Structure/Localization/index.md), run, [test](../../Tutorials/Developing/index.md) and [publish](../../Tutorials/Publishing/index.md) a plugin
- How to customize plugins: create [context menu items](../../Customization/Context%20menu/index.md), [toolbar buttons](../../Customization/Toolbar/index.md), [windows and panels](../../Customization/Windows%20and%20panels/index.md), [input helpers](../../Customization/Input%20helper/index.md), process [buttons](../../Customization/Buttons/index.md)
- How to [write](../../Macros/Writing%20macros/index.md), [debug](../../Macros/Debugging/index.md) and run a macro or [convert](../../Macros/Converting%20VBA%20macros/index.md) VBA macros to use in ONLYOFFICE
- How to [interact with the editors](../../Interacting%20with%20editors/index.md), use ONLYOFFICE [methods](../../Interacting%20with%20editors/Methods/index.md) and [events](../../Interacting%20with%20editors/Events/index.md)
- Where to find guides and [plugin](../../Tutorials/Samples/index.md)/[macro](../../Macros/Samples/index.md) code samples to get started

## What plugins can do

Here are some examples of what you can do with ONLYOFFICE plugins:

- connect third-party services, like [Telegram](../../Tutorials/Samples/Telegram/index.md), [YouTube](../../Tutorials/Samples/YouTube/index.md), [Thesaurus](../../Tutorials/Samples/Thesaurus/index.md), [Translator](../../Tutorials/Samples/Translator/index.md), [Zotero](../../Tutorials/Samples/Zotero/index.md), [OCR](../../Tutorials/Samples/OCR/index.md), etc.;
- add custom components & controls in the UI, like **Trackchanges**, **Trackchanges\_off**;
- enhance the existing user experience and the editors’ functionality: [Autocomplete](../../Tutorials/Samples/Autocomplete/index.md), [Search & Replace](../../Tutorials/Samples/Search%20and%20replace/index.md), [Move cursor](../../Tutorials/Samples/Move%20cursor/index.md), [Extended comments](../../Tutorials/Samples/Extended%20comments/index.md);
- automate tasks in documents with [Macros](../../Macros/Getting%20started/index.md).

Code samples are available at <https://github.com/ONLYOFFICE/sdkjs-plugins>.

If you are looking for ready-to-use plugins, please visit [ONLYOFFICE App Directory](https://www.onlyoffice.com/en/app-directory).

To quickly install and update plugins, you can use [ONLYOFFICE Plugin Marketplace](../../Tutorials/Installing/ONLYOFFICE%20Docs%20on-premises/index.md#adding-plugins-through-the-plugin-manager).

## How to create plugins

To create your own plugin, you need to follow a few steps:

1. Learn the fundamental concepts for building plugins on the [Getting started](../Getting%20started/index.md) page and write code that defines the plugin appearance and behavior.
2. After building the plugin, [test](../../Tutorials/Developing/index.md) it thoroughly and make sure the plugin looks and works as you expected. Try to anticipate the problems that might occur and suggest your solutions to them.
3. Now you can use the plugin on your own or suggest it for [publishing](../../Tutorials/Publishing/index.md) by creating a pull request to the [plugin marketplace repository](https://github.com/ONLYOFFICE/onlyoffice.github.io).
