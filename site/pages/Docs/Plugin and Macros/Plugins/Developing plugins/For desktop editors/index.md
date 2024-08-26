---
order: -1
---

To develop a plugin for ONLYOFFICE desktop editors, follow the instructions below.

1. Create a folder on your machine and put there the [index.html](../../../Usage%20API/index.html/index.md) and [config.json](../../../Usage%20API/Config/index.md) files.

2. Pack all the plugin files within the plugin folder into a **zip** archive and change its extension to *.plugin* (all the plugin files and subfolders must be at the archive root).

3. Install a plugin [through the Plugin Manager](../../Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md#adding-plugins-through-the-plugin-manager).

   The plugin will appear in the *sdkjs-plugins* directory. The path to the folder depends on the operating system you use:

   - For Linux - *home/\<username>/.local/share/onlyoffice/desktopeditors/sdkjs-plugins/*
   - For Windows - *C:\Users\\\<username>\AppData\Local\ONLYOFFICE\DesktopEditors\data\sdkjs-plugins\\*
   - For Mac OS - *Users/\<username>/Library/Application Support/asc.onlyoffice.ONLYOFFICE/sdkjs-plugins/*

   A plugin **GUID** will be used as the folder name. For example, *{07FD8DFA-DFE0-4089-AL24-0730933CC80A}*.

   ![Sdkjs-plugins folder](/assets/images/plugins/sdkjs-plugins-folder.png)

   You can edit the plugin and reload it to see the changes.

## Debugging

To debug ONLYOFFICE plugins in the desktop editors, use the *--ascdesktop-support-debug-info* flag. To do this, follow the instructions [here](../../../../Desktop%20Editors/Usage%20API/Debugging/index.md) depending on the operating system you use.

![Debug](/assets/images/desktop/debugging.png)
