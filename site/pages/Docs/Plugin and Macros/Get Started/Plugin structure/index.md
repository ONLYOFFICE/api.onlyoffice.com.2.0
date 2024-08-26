---
order: -1
---

Each plugin for the server version is a folder with files. To use the plugins with the [desktop version](../../../Desktop%20Editors/Usage%20API/Adding%20plugins/index.md), you need to pack these files into a single zip archive file (see the [Adding plugins](../../Plugins/Adding%20plugins/index.md) section for more information on how to add plugins to the editors).

The plugin folder must contain three files required for the plugin to work:

- [index.html](../../Usage%20API/index.html/index.md) - an HTML page that contains all the plugin code and connects the *config.json* and *plugin.js* (the base file needed for work with plugins) files.
- [config.json](../../Usage%20API/Config/index.md) - plugin configuration file containing the information about the main plugin data needed to register the plugin in the editors.
- [plugin code (.js file)](../../Usage%20API/Plugin%20object/index.md) - the plugin code file itself containing the JavaScript code of the plugin you want to connect to the editors.

The plugin folder can also contain other files such as plugin icons, styles, translations, readme, third-party services, etc. More information can be found [here](../Getting%20started%20with%20plugins/index.md).

![Structure](/assets/images/plugins/plugins-structure.png)
